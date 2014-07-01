class TextSubjectsController < ApplicationController
  def create
    @subject = TextSubject.create(text_subject_params)
    @shout = current_user.shouts.create(
      subject_id: @subject.id,
      subject_type: "TextSubject")
    redirect_to root_path
  end




  private
  def text_subject_params
    params.require(:text_subject).permit(:body)
  end
end