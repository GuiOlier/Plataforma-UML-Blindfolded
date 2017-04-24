class Case::RelationsController < CaseController
  before_action :set_case_relation, only: [:update, :destroy]

  def create
    @relation = Relation.new(relation_params)

    respond_to do |format|
      if @relation.save
        format.html { redirect_to edit_case_case_path(@relation.case_id), notice: 'Relação criado com sucesso.' }
      end
    end
  end

  def update
    respond_to do |format|
      if @relation.update(relation_params)
        format.html { redirect_to edit_case_case_path(@relation.case_id), notice: 'Relação atualizado com sucesso.' }
      end
    end
  end

  def destroy
    if @relation.destroy
      respond_to do |format|
        format.html { redirect_to edit_case_case_path(@relation.case_id), notice: 'Relação deletado com sucesso.' }
      end
    end
  end

  private
    def set_case_relation
      @relation = Relation.find(params[:id])
    end

    def relation_params
      params.permit(:elemStart, :elemEnd, :case_id, :connection_id);
    end
end
