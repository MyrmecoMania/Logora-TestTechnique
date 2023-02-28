require "test_helper"

class ModeratedModelTest < ActiveSupport::TestCase
  test "ModeratedModel a bien la méthode d'instance moderator" do
    modelmoderator = ModelModerator.new
    assert modelmoderator.moderator
  end
end
