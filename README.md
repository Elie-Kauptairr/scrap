# scrap

Projet scrap pour choper des infos sur des crypto et des emails. 

en 1 : 
On balance tous les require nécessaire ensuite on prends l'URL de la page spécifiée qui va être parser(analyser) et qui récupère le code HTML de la page
Après le résultat est stocké dans doc, qui contient tout le contenu HTML de la page de l'url du dessus, qui est prêt à être parser. Nokogiri interprète le code HTML et le convertit pour pouvoir naviguer dedans et extraire des éléments. 
Ensuite initialise le hash qui est vide à cette ligne. Il va ensuite être utilisé pour stocker les noms et les prix des crypto. 
Ensuite on créé une boucle qui parcourt tous les éléments de la page qui contiennent les noms et les prix des crypto, et qui les stock dans le hash ensuite. 
Après .gsub('$', '').gsub(',', '') supprime le symbole $ et les virgules du texte. .to_f convertit le texte en nombre à virgule. 
Et on termine par puts comme d'hab pour afficher le résultat celui la on sait maintenant. 
