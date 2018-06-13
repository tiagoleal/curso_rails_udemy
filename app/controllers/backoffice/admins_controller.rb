class Backoffice::AdminsController < BackofficeController
  before_action :set_admin, only: [:edit, :update, :destroy]

  def index
    # @admins = Admin.all
    @admins = Admin.with_full_access
  end

  def new
    @admin = Admin.new
  end

  def create
    @admin = Admin.new(params_admin)
    if @admin.save
      redirect_to backoffice_admins_path, notice: I18n.t('messages.created_with', item: @admin.name)
    else
      render :new
    end
  end

  def edit
  end

  def update

    passwd = params[:admin][:password]
    passwd_confirmation = params[:admin][:password_confirmation]

    if passwd.blank? && passwd_confirmation.blank?
        params[:admin].delete(:password)
        params[:admin].delete(:password_confirmation)
    end

    if @admin.update(params_admin)
      redirect_to backoffice_admins_path, notice: I18n.t('messages.updated_with',item: @admin.name)
    else
      render :edit
    end

  end

  def destroy
    admin_name = @admin.name
    if @admin.destroy
        redirect_to backoffice_admins_path, notice: I18n.t('messages.destroyed_with',item: admin_name)
    else
        render :index
    end

  end

  private

  def set_admin
    @admin = Admin.find(params[:id])
  end

  def params_admin
    params.require(:admin).permit(:name, :email, :password, :password_confirmation)

    # if @admin.blank?
    #     params.require(:admin).permit(:name, :email, :role, :password, :password_confirmation)
    # else
    #     params.require(:admin).permit(policy(@admin).permitted_attributes)
    # end
  end

  # def password_blank?
  #   params[:admin][:password].blank? &&
  #   params[:admin][:password_confirmation].blank?
  # end
    # params.require(:admin).permit(:name, :email, :password, :password_confirmation)

end

