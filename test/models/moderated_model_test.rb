require "test_helper"

class ModeratedModelTest < ActiveSupport::TestCase
  test "Les instances de la classe ModeratedModel ont bien la méthode moderator qui donne un booléen a la colonne is_accepted" do
    modelmoderator = ModeratedModel.new(title: "Obligation vaccinale chez les enfants", content: "Je ne pense pas qu'il soit nécessaire")
    puts "L'instance crée :
    titre: #{modelmoderator.title}
    contenu: #{modelmoderator.content}
    status: #{modelmoderator.is_accepted}"
    puts "Utilisons la méthode d'instance moderator"
  end
end
