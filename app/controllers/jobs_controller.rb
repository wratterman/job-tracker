class JobsController < ApplicationController
  before_action :set_company, except: [:edit]

  def index
    @company = Company.find(params[:company_id])
    @jobs = @company.jobs
    @contact = Contact.new
    @contact.company_id = @company.id
  end

  def new
    @company = Company.find(params[:company_id])
    @job = Job.new()
    @categories = Category.all
  end

  def create
    @company = Company.find(params[:company_id])
    @job = @company.jobs.new(job_params)

    if @job.save
      flash[:success] = "You created #{@job.title} at #{@company.name}"
      redirect_to company_job_path(@company, @job)
    else
      render :new
    end
  end

  def show
    @company = Company.find(params[:company_id])
    @job = @company.jobs.find(params[:id])
    @comment = Comment.new
    @comment.job_id = @job.id
  end

  def edit
    @company = Company.find(params[:company_id])
    @job = @company.jobs.find(params[:id])
    @categories = Category.all
  end

  def update
    @job = @company.jobs.find(params[:id])
    if @job.update(job_params)
      flash[:success] = "You updated #{@job.title} at #{@company.name}"
      redirect_to company_job_path(@company, @job)
    else
      render :edit
    end
  end

  def destroy
    @company = Company.find(params[:company_id])
    @job     = @company.jobs.find(params[:id])
    @job.destroy

    redirect_to company_jobs_path
  end

  private

  def job_params
    params.require(:job).permit(:title, :description, :level_of_interest, :city, :category_id, :company_id)
  end

  def set_company
    @company = Company.find(params[:company_id])
  end
end
