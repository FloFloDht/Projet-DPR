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
                <xsl:call-template name="ancrage-des-auteurs"/>
                <xsl:call-template name="liste-des-auteurs"/>
            </body>
        </html>
    </xsl:template>

    <xsl:template name="ancrage-des-auteurs">
        <h1>Listes des auteurs : </h1>
        <ul>
            <xsl:for-each select="//objet[@type = 'auteur']">
                <xsl:sort select="info[@nom='prenom']/@value" order="ascending"/>
                <xsl:variable name="ID" select="@id"/>
                <li><a href="#{$ID}"> <xsl:value-of select="info[@nom = 'idext']/@value"/></a></li>
            </xsl:for-each>
        </ul>
    </xsl:template>

    <xsl:template name="liste-des-auteurs">
        <xsl:for-each select="//objet[@type = 'auteur']">
            <xsl:sort select="info[@nom='prenom']/@value" order="ascending"/>
            <xsl:variable name="ID" select="@id"/>
            <xsl:variable name="idrec" select="info[@nom='recette']/@value"/>
            <h2 id="{$ID}"><xsl:value-of select="info[@nom = 'idext']/@value"/></h2>
            <ul>
                <li><strong>Recettes de l'auteur :</strong></li>
                <xsl:for-each-group select="preceding::objet[@type='recette']" group-by="info[@nom ='nom']/@value">
                    <xsl:if test="$idrec = @id">
                        <li><a href="recettes.html#{@id}"><xsl:value-of select="info[@nom ='nom']/@value"/></a></li>
                    </xsl:if>
                </xsl:for-each-group>
                <br/>
                <li><xsl:value-of select="info[@nom = 'pays']/@value"/></li>
                <li><xsl:value-of select="info[@nom = 'sexe']/@value"/></li>
                <li><xsl:value-of select="info[@nom = 'biographie']/@value"/></li>
            </ul>
        </xsl:for-each>
    </xsl:template>


</xsl:stylesheet>