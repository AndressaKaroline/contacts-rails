class ContactsController < ApplicationController
  def index
    @user_id = params[:user_id]
    @contacts = User.find(@user_id).contacts
  end

  def new
    @contact = User.find(params[:user_id]).contacts.new
  end

  def show
    @contact = User.find(params[:user_id]).contacts.find(params[:id])
  end 

  def create
    @contact = User.find(params[:user_id]).contacts.new(contact_params)
    if @contact.save
      redirect_to user_contacts_path(@contact.user_id)
    else
      render action: :new
    end
  end

  def edit
    @contact = User.find(params[:user_id]).contacts.find(params[:id])
  end

  def update
    @contact = User.find(params[:user_id]).contacts.find(params[:id])
    if @contact.update(contact_params)
      redirect_to user_contacts_path(@contact.user_id)
    else
      render action: :edit
    end
  end

  def destroy
    @contact = User.find(params[:user_id]).contacts.find(params[:id])
    @contact.destroy
    redirect_to user_contacts_path(@contact.user_id)
  end

  private
  def contact_params
    params.require(:contact).permit(:name)
  end
end