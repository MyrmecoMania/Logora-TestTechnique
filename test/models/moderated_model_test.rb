require "test_helper"

class ModeratedModelTest < ActiveSupport::TestCase

  # Tests du concern

  test "True quand le messages ne doit pas être rejeté" do
    modelmoderatorvalid = ModeratedModel.new(title: "Obligation vaccinale chez les enfants", content: "Je ne pense pas qu'il soit nécessaire")
    modelmoderatorvalid.moderator(:title, :content)
    assert_equal(true, modelmoderatorvalid.is_accepted, "is_accepted n'a pas la bonne valeure")
  end

  test "False quand le messages doit être rejeté(title)" do
    modelmoderatorinvalid = ModeratedModel.new(title: "hgbvjhbjkgbvhvbl", content: "Je ne pense pas qu'il soit nécessaire")
    modelmoderatorinvalid.moderator(:title, :content)
    assert_equal(false, modelmoderatorinvalid.is_accepted, "is_accepted n'a pas la bonne valeure")
  end

  test "False quand le messages doit être rejeté(content)" do
    modelmoderatorinvalid = ModeratedModel.new(title: "Obligation vaccinale chez les enfants", content: "hgbvjhbjkgbvhvbl")
    modelmoderatorinvalid.moderator(:title, :content)
    assert_equal(false, modelmoderatorinvalid.is_accepted, "is_accepted n'a pas la bonne valeure")
  end
end
