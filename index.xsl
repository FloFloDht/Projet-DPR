<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" indent="yes" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd" encoding="ISO-8859-1"/>


    <xsl:template match="/">
        <html>
            <head>
                <link rel="stylesheet" href="home.css"/>
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
                <h1>Bienvenue</h1>
                <footer>
                    <p>
                        <a href="https://www.univ-amu.fr/">
                            <img src="logo_amu.png" alt="logo_amu" width="160" height="80"/>
                        </a>
                        M1 Informatique 2021 - Projet DPR - Dhont Florent Gomiz Thomas
                    </p>
                </footer>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>