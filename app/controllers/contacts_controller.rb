# app/controllers/contacts_controller.rb
class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end

  def create
    # short-circuit bots that fill the hidden field
    return redirect_to thanks_contacts_path if params.dig(:contact, :nickname).present?

    @contact = Contact.new(contact_params)
    if @contact.save
      ContactMailer.new_message(@contact).deliver_later
      redirect_to thanks_contacts_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def thanks; end

  private
  def contact_params
    params.require(:contact).permit(:name, :email, :message, :nickname)
  end
end
