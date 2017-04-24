class Case::CasesController < CaseController
  before_action :set_case_case, only: [:show, :edit, :update, :destroy]
  before_action :config_table, only: [:show, :edit]

  def index
    @cases = Case.where(user_id: current_user)
  end

  def show
  end

  def new
    @case = Case.new
  end

  def edit
    @count_actors = @case.components.where(mold_id: 1).count
    @count_cases = @case.components.where(mold_id: 2).count
  end

  def create
    @case = Case.new(case_params)

    respond_to do |format|
      if @case.save
        format.html { redirect_to edit_case_case_path(@case), notice: 'Diagrama criado com sucesso.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @case.update(case_params)
        format.html { redirect_to edit_case_case_path(@case), notice: 'Diagrama atualizado com sucesso.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @case.destroy
    respond_to do |format|
      format.html { redirect_to case_cases_path, notice: 'Diagrama deletado com sucesso.' }
    end
  end

  private
    def set_case_case
      @case = Case.find(params[:id])
    end

    def case_params
      params.require(:case).permit(:namediagram, :user_id)
    end

    def config_table
      @options_connections = Connection.all
      @options_molds = Mold.all
      @options_components = Component.where(case_id: @case.id)
    end
end
