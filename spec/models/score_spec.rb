require 'rails_helper'

RSpec.describe Score, type: :model do

  subject {
    described_class.new(player_name: "Test1", score: 10, score_time: "2021-12-11 11:21:11")
  }

  describe "Validations" do
    it "is valid with valid attributes" do
      expect(subject).to be_valid
    end

    it "Model is invalid without player_name" do
      subject.player_name = nil
      expect(subject).to_not be_valid
    end

    it "Model is invalid without score" do
      subject.score = nil
      expect(subject).to_not be_valid
    end

    it "Model is invalid score is not integer" do
      subject.score = "testing"
      expect(subject).to_not be_valid
    end

    it "Model is invalid without score_time" do
      subject.score_time = nil
      expect(subject).to_not be_valid
    end

    it "Model is invalid with invalid score time" do
      subject.score_time = "2021-24-11"
      expect(subject).to_not be_valid
    end
  end

end
