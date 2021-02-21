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
                <xsl:call-template name="ancrage-des-ingredients"/>
                <xsl:call-template name="liste-des-ingredients"/>
            </body>
        </html>
    </xsl:template>

    <xsl:template name="ancrage-des-ingredients">
        <h1>Liste des ingrédients : </h1>
        <ul>
            <xsl:for-each select="//objet[@type = 'ingrédient']">
                <xsl:variable name="ID" select="@id"/>
                <li><a href="#{$ID}"> <xsl:value-of select="info[@nom = 'nom']/@value"/></a></li>
            </xsl:for-each>
        </ul>
    </xsl:template>

    <xsl:template name="liste-des-ingredients">
        <xsl:for-each select="//objet[@type = 'ingrédient']">
            <xsl:variable name="ID" select="@id"/>
            <xsl:variable name="idprod" select="info[@nom='produit']/@value"/>
            <xsl:variable name="idrec" select="info[@nom='recette']/@value"/>
            <h2 id="{$ID}"><xsl:value-of select="info[@nom = 'nom']/@value"/></h2>
            <ul>
                <ul>Recette(s) :
                    <xsl:for-each select="preceding::objet[@type= 'recette']">
                        <xsl:if test="$idrec = @id">
                            <li><a href="recettes.html#{@id}"><xsl:value-of select="info[@nom='nom']/@value"/></a></li>
                        </xsl:if>
                    </xsl:for-each>
                </ul>
                <li>Apport énergétique : <xsl:value-of select="info[@nom = 'Apport énergétique']/@value"/></li>
                <li>Apport nutritif : <xsl:value-of select="info[@nom = 'Apport nutritif']/@value"/></li>
                <li>Saison : <xsl:value-of select="info[@nom = 'saison']/@value"/></li>
                <li>Produit :
                    <xsl:for-each select="preceding::objet[@type= 'produit']">
                        <xsl:if test="$idprod= @id">
                            <a href="produits.html#{@id}"><xsl:value-of select="info[@nom='nom']/@value"/></a>
                        </xsl:if>
                     </xsl:for-each>
                </li>
                <li>Descriptif : <xsl:value-of select="info[@nom = 'descriptif']"/></li>
            </ul>
        </xsl:for-each>

    </xsl:template>

</xsl:stylesheet>
