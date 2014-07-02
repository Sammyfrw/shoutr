class ImageSubjectsController < ApplicationController
  def create
    @subject = ImageSubject.create(image_subject_params)
    @shout = current_user.shouts.create(
      subject_id: @subject.id,
      subject_type: "ImageSubject")
    redirect_to root_path
  end

  private
  def image_subject_params
    params.require(:image_subject).permit(:url)
  end
end
