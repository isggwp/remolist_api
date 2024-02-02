class Api::V1::ContactsController < ApplicationController
  def index
    contacts = Contact.all
    render json: { status: :ok, data: contacts }, status: :ok
  end

  def show
    contact = Contact.find_by(id: params[:id])

    if contact
      render json: { status: :ok, data: contact }, status: :ok
    else
      render json: { status: :not_found, messages: 'Contact not found' }, status: :not_found
    end
  end

  def create
    contact = Contact.new(contact_params)

    if contact.save
      render json: { status: :success, data: contact, messages: 'Contact created successfully' },
             status: :created
    else
      render json: { status: :unprocessable_entity, messages: contact.errors }, status: :unprocessable_entity
    end
  end

  def update
    contact = Contact.find_by(id: params[:id])

    if contact
      if contact.update(contact_params)
        render json: { status: :success, data: contact, messages: 'Contact updated successfully' }, status: :ok
      else
        render json: { status: :unprocessable_entity, messages: contact.errors.full_messages },
               status: :unprocessable_entity
      end
    else
      render json: { status: :not_found, messages: 'Contact not found' }, status: :not_found
    end
  end

  def destroy
    contact = Contact.find_by(id: params[:id])

    if contact
      if contact.destroy
        render json: { status: :success, data: contact, messages: 'Contact deleted successfully' },
               status: :no_content
      else
        render json: { status: :unprocessable_entity, messages: contact.errors.full_messages },
               status: :unprocessable_entity
      end
    else
      render json: { status: :not_found, messages: 'Contact not found' }, status: :not_found
    end
  end

  def contact_params
    params.require(:contact).permit(:first_name, :last_name, :email)
  end
end
