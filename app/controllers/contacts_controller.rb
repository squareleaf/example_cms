class ContactsController < ApplicationController
  helper_method :column_sort, :direction_sort

  def index
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
    Contact.column_names.include?(params[:sort]) ? params[:sort] : "name"
  end

  def direction_sort
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end
end
