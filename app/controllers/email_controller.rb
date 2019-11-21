class EmailController < ApplicationController
  def index
    @emails = Email.all
  end

  def create
    @emails = Email.all
    @new_email = Email.new(
      title: Faker::Game.title,
      body: Faker::Lorem.paragraph(sentence_count: 20, supplemental: true, random_sentences_to_add: 20)
    )
    if @new_email.save
      respond_to do |format|
        format.html { redirect_to root_path }
        format.js { }
      end
    end
  end

  def show
    @email = Email.find(params[:id])
    @email.update(read: true)
    respond_to do |format|
      format.html { redirect_to email_path(params[:id])}
      format.js {}
    end
  end

  def destroy
    @email = Email.find(params[:id])
    @email.destroy
    respond_to do |format|
      format.html {redirect_to root_path}
      format.js {}
    end
  end

  def update
    @email = Email.find(params[:id])
    if @email.read == true
      @email.update(read: false)
    else
      @email.update(read: true)
    end
    respond_to do |format|
      format.html {redirect_to root_path}
      format.js {}
    end
  end
end
