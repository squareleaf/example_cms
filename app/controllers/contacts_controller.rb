class ContactsController < ApplicationController
  helper_method :column_sort, :direction_sort

  def index
    if params[:sort] || params[:direction] || params[:page]
      session[:column_sort] = params[:sort] if params[:sort]
      session[:direction_sort] = params[:direction] if params[:direction]
      session[:page] = params[:page] if params[:page]
    end

    @contacts = Contact.
      order(column_sort + " " + direction_sort).
      paginate(page: session[:page] || params[:page], per_page: 20)
  end

  def show
    @contact = Contact.find(params[:id])

    respond_to do |format|
      format.html
      format.js
    end
  end

  def new
  end

  def create
    @contact = Contact.new(contact_params)

    @contact.save

    if @contact.errors.any?
      render :new
    else
      redirect_to contacts_path
    end
  end

  def edit
    @contact = Contact.find(params[:id])
  end

  def update
    @contact = Contact.find(params[:id])

    if @contact.update_attributes(contact_params)
      redirect_to contacts_path
    else
      render :index
    end
  end

  def destroy
    @contact = Contact.find(params[:id])
    name = @contact.name

    if @contact.destroy
      redirect_to contacts_path
    else
      render :index
    end
  end

  private

  def contact_params
    params.require(:contact).permit(
      :id,
      :name,
      :email,
      :birthday,
      :notes,
      # phone_numbers_attributes: [
      #   :id, :phone_number, :type, :primary, :contact_id
      # ]
    )
  end

  def column_sort
    return session[:column_sort] if session[:column_sort]
    Contact.column_names.include?(params[:sort]) ? params[:sort] : "name"
  end

  def direction_sort
    return session[:direction_sort] if session[:direction_sort]
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end
end
