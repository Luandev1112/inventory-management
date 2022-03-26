class IssuesController < ApplicationController
  before_action :logged_in_user, only: [:index, :new, :show, :solve_issue]
  before_action :get_issue_by_id, only: [:show, :solve_issue, :mark_as_solved]

  def index
    if current_user.admin?
      @issues = Issue.all
    else
      @issues = Issue.where(user_id: current_user.id)
    end
  end

  def new
    @issue = Issue.new
    @items = Item.where(id: [Allotment.select(:item_id).where(user_id: current_user.id, dealloted_at: nil)])
  end

  def create
    @issue = Issue.new(user_id: current_user.id)
    @issue.assign_attributes(issue_params)
    if @issue.save
      redirect_to @issue, flash: { success: "Issue reported successfully." }
    else
      render 'new'
    end
  end

  def show
  end

  def solve_issue
  end

  def mark_as_solved
    data = issue_solve_params.merge(solved_at: DateTime.now)
    @user = User.find(@issue.user_id)
    if @issue.update_attributes(data)
      redirect_to @issue, flash: { success: "Issue marked as solved successfully." }
      NotificationMailer.issue_notification(@user, @issue).deliver_now
    else
      render 'solve_issue'
    end
  end

  private
    def issue_params
      params.require(:issue).permit(:item_id, :issue_description)
    end

    def issue_solve_params
      params.require(:issue).permit(:feedback)
    end

    def get_issue_by_id
      @issue = Issue.find(params[:id])
    end
end
