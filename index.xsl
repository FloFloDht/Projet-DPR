<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" indent="yes" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd" encoding="ISO-8859-1"/>


    <xsl:template match="/">
        <html>
            <head>
                <link rel="stylesheet" href="home.css"/>
            </head>
            <body>
                <nav>
                    <ul>
                        <li><a href="index.html">Acceuil</a></li>
                        <li><a href="auteurs.html">Auteurs</a></li>
                        <li><a href="categories.html">Categories</a></li>
                        <li><a href="ingredients.html">Ingredients</a></li>
                        <li><a href="produits.html">Produits</a></li>
                        <li><a href="recettes.html">Recettes</a></li>
                    </ul>
                </nav>
                <br/>
                <h1>Bienvenue sur notre site de recettes de cuisine</h1>
                <h2>Vous trouverez ici des plats qui combleront vos envies.</h2>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>