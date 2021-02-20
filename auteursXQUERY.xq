xquery version "1.0" encoding "utf-8";

(:je sais pas comment faire des boucles imbriqués (j'ai rien trouvé sur internet) du coup impossible de bien tout ranger... :)

declare function local:getPays(){
    for $pays in doc("C:\Users\thoma\IdeaProjects\Projet-DPR\donnees-recettes.xml")//objet/info
    where $pays/@nom = "pays"
    return <li>{$pays/@value} </li>
};

declare function local:getSexe(){
    for $sexe in doc("C:\Users\thoma\IdeaProjects\Projet-DPR\donnees-recettes.xml")//objet/info
    where $sexe/@nom = "sexe"
    return <li>{$sexe/@value} </li>
};


declare function local:getAuteur(){
    for $auteur in doc("C:\Users\thoma\IdeaProjects\Projet-DPR\donnees-recettes.xml")//objet/info
    where $auteur/@nom = "idext"
    return <li>{$auteur/@value}</li>
};

<html>
    <head>
        <link rel="stylesheet" href="style.css"/>
    </head>
    <body>
        <nav>
            <a href="index.html">Acceuil</a>
            <a href="auteurs.html">Auteurs</a>
            <a href="categories.html">Categories</a>
            <a href="ingredients.html">Ingredients</a>
            <a href="produits.html">Produits</a>
            <a href="recettes.html">Recettes</a>
        </nav>
        <h1>Listes des auteurs : </h1>
        <ul>
          {local:getAuteur()}
          <ul>
          {local:getPays()}
          {local:getSexe()}
          </ul>
        </ul>
    </body>
</html>
