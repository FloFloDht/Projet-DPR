<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" indent="yes" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd" encoding="ISO-8859-1"/>


    <xsl:template match="/">
        <html>
            <head>
                <link rel="stylesheet" href="style.css"/>
            </head>
            <body>
                <nav>
                    <a href="auteurs.html">auteurs</a>
                    <a href="categories.html">categories</a>
                    <a href="ingredients.html">ingredients</a>
                    <a href="produits.html">produits</a>
                    <a href="recettes.html">recettes</a>
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