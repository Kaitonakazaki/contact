class ContactsController < ApplicationController
  before_action :set_blog, only: [:show, :edit, :update, :destroy]
  def index
    @contacts = Contact.all
    # binding.pry
    # raise
  end
 
  def new
    @contact = Contact.new
  end
  
  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      redirect_to contacts_path, notice: "ブログを作成しました！"
    else 
      render :new
    end
  end
  
  def show
    @contact = Contact.find(params[:id])
  end
  
  def edit
    @contact = Contact.find(params[:id])
  end
  
  def update
    @contact = Contact.find(params[:id])
    if @contact.update(contact_params)
      redirect_to contacts_path, notice: "ブログを編集しました！"
    else 
      render 'edit'
    end
  end
  
  def destroy
    @contact.destroy
    redirect_to contacts_path, notice:"ブログを削除しました"
  end
  
  private
  def contact_params
    params.require(:contact).permit(:name,:email,:content)
  end
  
  def set_blog
      @contact = Contact.find(params[:id])
  end
end
