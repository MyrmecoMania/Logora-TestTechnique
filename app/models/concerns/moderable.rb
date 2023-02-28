require 'net/http'
module Moderable
  extend ActiveSupport::Concern


  included do
    # Une fonction qui modére uniquement l'instance d'une classe contenant le concern Moderable (méthode d'instance)
    def moderator(*args)
      args.each do |arg|
        uri = URI("https://moderation.logora.fr/predict?text=#{self.send(arg)}")
        response = JSON.parse(Net::HTTP.get(uri))["prediction"]["0"]
        self.update(is_accepted: false) if response > 0.95
      end
      self.update(is_accepted: true) if self.is_accepted != false
    end
  end

  class_methods do
    # Une fonction qui modére toutes les instances d'une classe contenant le concern Moderable (méthode de classe)
    def moderator(*args)
      where(is_accepted: nil).each { |instance| instance.moderator(args[0]) }
    end
  end
end
