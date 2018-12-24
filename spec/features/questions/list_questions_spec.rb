require 'rails_helper'

feature 'User can see list of all questions', %q{
  In order to find answer on my question
  As an unauthenticated User
  I'd like to be able to see list of all questions
} do

  given(:question) { create(:question) }

  scenario 'Open list of all questions' do
    create_list(:question, 10)
    visit questions_path
    Question.all.each do |question|
      expect(page).to have_content(question.title)
    end
  end

  scenario 'Open question and answers' do
    create_list(:answer, 10, question: question)
    visit question_path(question)
    expect(page).to have_content(question.title)
    Answer.all.each do |answer|
      expect(page).to have_content(answer.body)
    end
  end
end
