class Case::ComponentsController < CaseController
  before_action :set_case_component, only: [:update, :destroy]

  def create
    @component = Component.new(component_params)
    respond_to do |format|
      if @component.save
        format.html { redirect_to edit_case_case_path(@component.case_id), notice: 'Componente criado com sucesso.' }
      end
    end
  end

  def update
    respond_to do |format|
      if @component.update(component_params)
        format.html { redirect_to edit_case_case_path(@component.case_id), notice: 'Componente atualizado com sucesso.' }
      end
    end
  end

  def destroy
    if @component.destroy
      respond_to do |format|
        format.html { redirect_to edit_case_case_path(@component.case_id), notice: 'Componente deletado com sucesso.' }
      end
    end
  end

  private
    def set_case_component
      @component = Component.find(params[:id])
    end

    def component_params
      params.permit(:mold_id, :descriptionsComponent, :case_id);
    end
end
