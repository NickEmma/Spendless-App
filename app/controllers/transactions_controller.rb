class TransactionsController < ApplicationController
  def index
    @group = current_user.groups.find(params[:group_id])
    # @group = current_user.groups.find(params[:category_id])
    @transactions = @group.ordered_transaction
  end

  def new
    @category = current_user.ordered_groups
    operation = Operation.new
    id = params[:category_id]
    respond_to do |format|
      format.html { render :new, locals: { operation: operation, id: id } }
    end
  end

  def create
    operation = Operation.new(operation_params)
    operation.user = current_user
    respond_to do |format|
      format.html do
        if operation.save
          flash[:notice] = 'Transaction was successfully created.'
          redirect_to transactions_path
        else
          flash[:alert] = 'Transaction was not created.'
          render :new, locals: { operation: operation }
        end
      end
    end
  end

  private

  def operation_params
    params.require(:operation).permit(:amount, :group_id, :date)
  end
end
