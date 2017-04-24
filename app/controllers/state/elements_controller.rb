class State::ElementsController < StateController
  before_action :set_state_element, only: [:update, :destroy]

  def create
    @element = Element.new(element_params)
    respond_to do |format|
      if @element.save
        format.html { redirect_to edit_state_machine_path(@element.machine_id), notice: 'Elemento criado com sucesso.' }
      end
    end
  end

  def update
    respond_to do |format|
      if @element.update(element_params)
        format.html { redirect_to edit_state_machine_path(@element.machine_id), notice: 'Elemento atualizado com sucesso.' }
      end
    end
  end

  def destroy
    if @element.destroy
      respond_to do |format|
        format.html { redirect_to edit_state_machine_path(@element.machine_id), notice: 'Elemento deletado com sucesso.' }
      end
    end
  end

  private
    def set_state_element
      @element = Element.find(params[:id])
    end

    def element_params
      params.permit(:nameElem, :descriptionElem, :machine_id, :type_id);
    end
end
