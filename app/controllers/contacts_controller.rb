class ContactsController < ApplicationController

  def create
    @contact = Contact.new(contact_params)
    @contact.company_id = params[:company_id]
    @contact.save

    flash[:success] = "Contact #{@contact.full_name} created"
    redirect_to company_jobs_path(@contact.company)
  end

  def show
    @contact = Contact.find(params[:id])
    @company = @contact.company
  end

  private

  def contact_params
    params.require(:contact).permit(:full_name, :position, :email, :company_id)
  end
end
