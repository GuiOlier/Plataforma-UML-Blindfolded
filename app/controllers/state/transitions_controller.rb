class State::TransitionsController < StateController
  before_action :set_state_transition, only: [:update, :destroy]

  def create
    @transition = Transition.new(transition_params)
    respond_to do |format|
      if @transition.save
        format.html { redirect_to edit_state_machine_path(@transition.machine_id), notice: 'Transição criada com sucesso.' }
      end
    end
  end

  def update
    respond_to do |format|
      if @transition.update(transition_params)
        format.html { redirect_to edit_state_machine_path(@transition.machine_id), notice: 'Transição atualizada com sucesso.' }
      end
    end
  end

  def destroy
    if @transition.destroy
      respond_to do |format|
        format.html { redirect_to edit_state_machine_path(@transition.machine_id), notice: 'Transição deletada com sucesso.' }
      end
    end
  end

  private
    def set_state_transition
      @transition = Transition.find(params[:id])
    end

    def transition_params
      params.permit(:elemStart, :elemEnd, :descriptionTran, :machine_id);
    end
end
