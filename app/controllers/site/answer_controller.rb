class Site::AnswerController < SiteController
  def question
    #@answer = Answer.find(params[:answer_id])
    redis_answer = Rails.cache.read(params[:answer]).split("@@")
    @question_id = redis_answer.first
    @correct = ActiveModel::Type::Boolean.new.cast(redis_answer.last)

    UserStatistic.set_statistic(@answer, current_user)
  end
end
