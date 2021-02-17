<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" indent="yes" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd" encoding="ISO-8859-1"/>


    <xsl:template match="/">
        <html>
            <body>
                <xsl:call-template name="ancrage-des-recettes"/>
                <xsl:call-template name="liste-des-recettes"/>
            </body>
        </html>
    </xsl:template>

    <xsl:template name="ancrage-des-recettes">
        <h1>Listes des recettes : </h1>
        <ul>
            <xsl:for-each select="//objet[@type = 'recette']">
                <xsl:sort select="info[@nom='date_publication']/@value" order="descending"/>
                <xsl:variable name="ID" select="@id"/>
                <li><a href="#{$ID}"> <xsl:value-of select="info[@nom = 'nom']/@value"/></a></li>
            </xsl:for-each>
        </ul>
    </xsl:template>

    <xsl:template name="liste-des-recettes" >
        <xsl:for-each select="//objet[@type='recette']">
            <xsl:sort select="info[@nom='date_publication']/@value" order="descending"/>
            <xsl:variable name="ID" select="@id"/>
            <xsl:variable name="image" select="info[@nom='photo']/@value"/>
            <xsl:variable name="idaut" select="info[@nom='auteur']/@value"/>
            <xsl:variable name="idingr" select="info[@nom='ingrédient']/@value"/>
            <xsl:variable name="idsouscat" select="info[@nom='sous-catégorie']/@value"/>
                <h2 id="{$ID}"><xsl:value-of select="info[@nom = 'nom']/@value"/></h2>
                <p><img src="{$image}"/></p>
                <ul>
                    <li>Résumé : <xsl:value-of select="info[@nom='résumé']"/></li>
                    <li>Date publication : <xsl:value-of select="info[@nom='date_publication']/@value"/></li>
                    <li><xsl:value-of select="info[@nom='difficulté']/@value"/></li>
                    <ul>Ingrédients :
                        <xsl:for-each select="following::objet[@type= 'ingrédient']">
                            <xsl:if test="$idingr = @id">
                                <li><a href="ingredients.html#{$idingr}"><xsl:value-of select="info[@nom = 'nom']/@value"/></a>
                                    <xsl:value-of select="@quantite"/></li>
                            </xsl:if>
                        </xsl:for-each>
                    </ul>
                    <li>Sous-catégorie :
                        <xsl:for-each select="preceding::objet[@type= 'sous-catégorie']">
                            <xsl:if test="$idsouscat = @id">
                                <xsl:value-of select="info[@nom='nom']/@value"/>
                            </xsl:if>
                        </xsl:for-each>
                    </li>
                    <li>Nombre de personne : <xsl:value-of select="info[@nom='nbre_personnes']/value"/></li>
                    <li>Préparation : <xsl:value-of select="info[@nom='Préparation']/@value"/></li>
                    <li>Cuisson: <xsl:value-of select="info[@nom='Cuisson']/@value"/></li>
                    <li>Repos : <xsl:value-of select="info[@nom='Repos']/@value"/></li>
                    <li>Préparation : <xsl:value-of select="info[@nom='Préparation']"/></li>
                    <li>
                        <xsl:for-each select="following::objet[@type= 'auteur']">
                            <xsl:if test="$idaut = @id">
                                Auteur :<a href="auteurs.html#{$idaut}"><xsl:value-of select="info[@nom='nom']/@value"/></a>
                            </xsl:if>
                        </xsl:for-each>
                    </li>
                    <li>Note : <xsl:value-of select="info[@nom='note']/@value"/></li>
                </ul>
        </xsl:for-each>

    </xsl:template>

</xsl:stylesheet>