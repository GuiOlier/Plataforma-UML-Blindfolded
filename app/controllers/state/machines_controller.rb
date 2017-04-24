class State::MachinesController < StateController
  before_action :set_machine, only: [:show, :edit, :update, :destroy]
  before_action :config_table, only: [:show, :edit]

  def index
    @machines = Machine.where(user_id: current_user)
  end

  def show
  end

  def new
    @machine = Machine.new
  end

  def edit
    @machine_status = @machine.elements.where(type_id: 1)
  end

  def create
    @machine = Machine.new(machine_params)

    respond_to do |format|
      if @machine.save
        format.html { redirect_to edit_state_machine_path(@machine), notice: 'Diagrama criado com sucesso.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @machine.update(machine_params)
        format.html { redirect_to edit_state_machine_path(@machine), notice: 'Diagrama atualizado com sucesso.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    if @machine.destroy
      respond_to do |format|
        format.html { redirect_to state_machines_path, notice: 'Diagrama deletado com sucesso.' }
      end
    end
  end

  private
    def set_machine
      @machine = Machine.find(params[:id])
    end

    def machine_params
      params.require(:machine).permit(:nameDiagram, :elemInitial, :elemEnd, :user_id)
    end

    def config_table
      @options_type = Type.all
      @options_elements = Element.where(machine_id: @machine.id)
    end
end
