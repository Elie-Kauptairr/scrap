require 'nokogiri'
require 'open-uri'
require 'pry'
require 'dotenv'
require 'json'
require 'http'
require 'rspec'

url = "https://coinmarketcap.com/all/views/all/"  # l'URL de la page spécifiée qui va être parser(analyser) et qui récupère le code HTML de la page

doc = Nokogiri::HTML(URI.open("https://coinmarketcap.com/all/views/all/")) # le résultat est stocké dans doc, qui contient tout le contenu HTML de la page de l'url du dessus, qui est prêt à être parser. Nokogiri interprète le code HTML et le convertit pour pouvoir naviguer dedans et extraire des éléments. 

hash={} # initialise le hash qui est vide à cette ligne. Il va ensuite être utilisé pour stocker les noms et les prix des crypto

doc.xpath("//tr/td[2]/div/a[2]").length.times do |i| # ici on a une boucle qui parcourt tous les éléments de la page qui contiennent les noms et les prix des crypto, et qui les stock dans le hash ensuite. 

  hash[doc.xpath("//tr[#{i+1}]/td[2]/div/a[2]").text]=doc.xpath("//tr[#{i+1}]/td[5]/div/span").text.gsub('$', '').gsub(',', '').to_f
end  # .gsub('$', '').gsub(',', '') supprime le symbole $ et les virgules du texte. .to_f convertit le texte en nombre à virgule. 

puts hash # puts comme d'hab pour afficher le résultat celui la on sait maintenant 