module Moderable
  extend ActiveSupport::Concern


  included do
    # Une fonction qui modére uniquement l'instance d'une classe contenant le concern Moderable (méthode d'instance)
    def moderator(arg1,*args)
      args.push(arg1)
      args.each do |arg|
        str =  I18n.transliterate(self.send(arg)).downcase.gsub(/[^a-zA-Z]/, " ")
        uri = URI("https://moderation.logora.fr/predict?text=#{str}")
        response = JSON.parse(Net::HTTP.get(uri))["prediction"]["0"]
        self.update(is_accepted: false) if response > 0.5
      end
      self.update(is_accepted: true) if self.is_accepted == nil
    end
  end

  class_methods do
    # Une fonction qui modére toutes les instances d'une classe contenant le concern Moderable (méthode de classe)
    def moderator(arg1,*args)
      args.push(arg1)
      where(is_accepted: nil).each { |instance| instance.moderator(args[0]) }
    end
  end
end
