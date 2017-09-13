class ContactsController < ApplicationController
  helper_method :column_sort, :direction_sort

  def index
    if params[:sort] || params[:direction]
      session[:column_sort] = params[:sort]
      session[:direction_sort] = params[:direction]
    end

    @contacts = Contact.order(column_sort + " " + direction_sort)
  end

  def new
  end

  def create
    @contact = Contact.new params.require(:contact).
                                  permit(:name, :email, :phone)
    @contact.save

    if @contact.errors.any?
      render :new
    else
      redirect_to contacts_path
    end
  end

  private

  def column_sort
    return session[:column_sort] if session[:column_sort]
    Contact.column_names.include?(params[:sort]) ? params[:sort] : "name"
  end

  def direction_sort
    return session[:direction_sort] if session[:direction_sort]
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end
end
