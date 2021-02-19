<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" indent="yes" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd" encoding="ISO-8859-1"/>

    <xsl:template match="/">
        <html>
            <head>
                <link rel="stylesheet" href="style.css"/>
            </head>
            <body>
                <nav>
                    <a href="auteurs.html">Auteurs</a>
                    <a href="categories.html">Categories</a>
                    <a href="ingredients.html">Ingredients</a>
                    <a href="produits.html">Produits</a>
                    <a href="recettes.html">Recettes</a>
                </nav>
                <xsl:call-template name="ancrage-des-categories"/>
                <xsl:call-template name="liste-des-categories"/>

                <xsl:call-template name="ancrage-des-sous-categories"/>
                <xsl:call-template name="liste-des-sous-categories"/>
            </body>
        </html>
    </xsl:template>

    <xsl:template name="ancrage-des-categories">
        <h1>Listes des catégories : </h1>
        <ul>
            <xsl:for-each select="//objet[@type = 'catégorie']">
                <xsl:variable name="ID" select="@id"/>
                <li><a href="#{@id}"> <xsl:value-of select="info[@nom = 'nom']/@value"/></a></li>
            </xsl:for-each>
        </ul>
    </xsl:template>

    <xsl:template name="liste-des-categories">
        <xsl:for-each select="//objet[@type='catégorie']">
            <xsl:variable name="ID" select="@id"/>
            <h2 id="{$ID}"><xsl:value-of select="info[@nom='nom']/@value"/></h2>
            <ul>
                <li>Descriptif : <xsl:value-of select="info[@nom='descriptif']"/></li>
            </ul>
        </xsl:for-each>

    </xsl:template>

    <xsl:template name="ancrage-des-sous-categories">
        <h1>Listes des sous-catégories : </h1>
        <ul>
            <xsl:for-each select="//objet[@type = 'sous-catégorie']">
                <xsl:variable name="IDs" select="@id"/>
                <li><a href="#{$IDs}"> <xsl:value-of select="info[@nom = 'nom']/@value"/></a></li>
            </xsl:for-each>
        </ul>

    </xsl:template>

    <xsl:template name="liste-des-sous-categories">
            <xsl:for-each select="//objet[@type='sous-catégorie']">
                <xsl:variable name="IDs" select="@id"/>
                <xsl:variable name="idcat" select="info[@nom='catégorie']/@value"/>
                <h2 id="{$IDs}"><xsl:value-of select="info[@nom='nom']/@value"/></h2>
                <ul>
                    <li>Descriptif : <xsl:value-of select="info[@nom='descriptif']"/></li>
                    <li>
                        <xsl:for-each select="preceding::objet[@type= 'catégorie']">
                            <xsl:if test="$idcat = @id">
                                Catégorie : <xsl:value-of select="info[@nom='nom']/@value"/>
                            </xsl:if>
                        </xsl:for-each>
                    </li>
                    <li>Recettes :</li>
                    <xsl:for-each select="following::objet[@type='recette']">
                        <xsl:variable name="idsc" select="info[@nom='sous-catégorie']/@value"/>
                        <xsl:if test="$idsc = $IDs">
                            <li><a href="recettes.html#{@id}"> <xsl:value-of select="info[@nom='nom']/@value"/></a></li>
                        </xsl:if>
                    </xsl:for-each>
                </ul>
            </xsl:for-each>
    </xsl:template>

</xsl:stylesheet>