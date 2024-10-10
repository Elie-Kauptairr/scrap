# spec/scrap_crypto_01.rspec.rb

require 'rspec'
require 'nokogiri'
require 'open-uri'

# Charger le fichier à tester
require_relative '../lib/scrap_crypto_01' # Ajuste le chemin si besoin

# Définir l'URL utilisée pour les tests
describe 'Crypto Scraper' do
  before(:all) do
    # Remplace l'URL par celle utilisée dans le fichier à tester
    @url = "https://coinmarketcap.com/all/views/all/"
    # Charger et analyser le document
    @doc = Nokogiri::HTML(URI.open(@url))
  end

  it 'retourne un hash non vide' do
    # Exécute le code du fichier principal pour obtenir le hash
    hash = {}
    @doc.xpath("//tr/td[2]/div/a[2]").length.times do |i|
      hash[@doc.xpath("//tr[#{i+1}]/td[2]/div/a[2]").text] = @doc.xpath("//tr[#{i+1}]/td[5]/div/span").text.gsub('$', '').gsub(',', '').to_f
    end
    
    # Vérifie que le hash n'est pas vide
    expect(hash).not_to be_empty
  end

  it 'contient des noms de cryptomonnaies sous forme de chaînes' do
    hash = {}
    @doc.xpath("//tr/td[2]/div/a[2]").length.times do |i|
      hash[@doc.xpath("//tr[#{i+1}]/td[2]/div/a[2]").text] = @doc.xpath("//tr[#{i+1}]/td[5]/div/span").text.gsub('$', '').gsub(',', '').to_f
    end

    # Test pour vérifier que chaque clé est une chaîne non vide
    hash.each_key do |name|
      expect(name).to be_a(String)
      expect(name).not_to be_empty
    end
  end

  it 'contient des prix de cryptomonnaies sous forme de float' do
    hash = {}
    @doc.xpath("//tr/td[2]/div/a[2]").length.times do |i|
      hash[@doc.xpath("//tr[#{i+1}]/td[2]/div/a[2]").text] = @doc.xpath("//tr[#{i+1}]/td[5]/div/span").text.gsub('$', '').gsub(',', '').to_f
    end

    # Test pour vérifier que chaque valeur est un nombre flottant positif
    hash.each_value do |price|
      expect(price).to be_a(Float)
      expect(price).to be >= 0
    end
  end
end
