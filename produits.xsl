<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" indent="yes" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd" encoding="ISO-8859-1"/>

    <xsl:template match="/">
        <html>
            <head>
                <link rel="stylesheet" href="style.css"/>
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
                <xsl:call-template name="ancrage-des-produits"/>
                <xsl:call-template name="liste-des-produits"/>
            </body>
        </html>
    </xsl:template>

    <xsl:template name="ancrage-des-produits">
        <h1>Liste des produits : </h1>
        <ul>
            <xsl:for-each select="//objet[@type = 'produit']">
                <xsl:variable name="ID" select="@id"/>
                <li><a href="#{$ID}"> <xsl:value-of select="info[@nom = 'nom']/@value"/></a></li>
            </xsl:for-each>
        </ul>
    </xsl:template>

    <xsl:template name="liste-des-produits">
        <xsl:for-each select="//objet[@type = 'produit']">
            <xsl:variable name="ID" select="@id"/>
            <xsl:variable name="idingr" select="info[@nom='ingrédient']/@value"/>
            <h2 id="{$ID}"><xsl:value-of select="info[@nom = 'nom']/@value"/></h2>
            <ul> Ingrédient(s) :
                <xsl:for-each select="following::objet[@type='ingrédient']">
                    <xsl:if test="$idingr = @id">
                        <li><a href="ingredients.html#{@id}"><xsl:value-of select="info[@nom ='nom']/@value"/></a></li>
                    </xsl:if>
                </xsl:for-each>
            </ul>

        </xsl:for-each>

    </xsl:template>

</xsl:stylesheet>