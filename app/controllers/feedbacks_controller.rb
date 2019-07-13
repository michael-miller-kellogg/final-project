class FeedbacksController < ApplicationController
  def list
    @feedbacks = Feedback.all

    render("feedback_templates/list.html.erb")
  end

  def details
    @feedback = Feedback.where({ :id => params.fetch("id_to_display") }).first

    render("feedback_templates/details.html.erb")
  end

  def blank_form
    @feedback = Feedback.new

    render("feedback_templates/blank_form.html.erb")
  end

  def save_new_info
    @feedback = Feedback.new

    @feedback.feedback = params.fetch("feedback")
    @feedback.user_id = 1

    if @feedback.valid?
      @feedback.save

      redirect_to("/", { :notice => "Feedback created successfully." })
    else
      render("feedback_templates/blank_form.html.erb")
    end
  end

  def prefilled_form
    @feedback = Feedback.where({ :id => params.fetch("id_to_prefill") }).first

    render("feedback_templates/prefilled_form.html.erb")
  end

  def save_edits
    @feedback = Feedback.where({ :id => params.fetch("id_to_modify") }).first

    @feedback.feedback = params.fetch("feedback")
    @feedback.user_id = params.fetch("user_id")

    if @feedback.valid?
      @feedback.save

      redirect_to("/feedbacks/" + @feedback.id.to_s, { :notice => "Feedback updated successfully." })
    else
      render("feedback_templates/prefilled_form.html.erb")
    end
  end

  def remove_row
    @feedback = Feedback.where({ :id => params.fetch("id_to_remove") }).first

    @feedback.destroy

    redirect_to("/feedbacks", { :notice => "Feedback deleted successfully." })
  end
end
