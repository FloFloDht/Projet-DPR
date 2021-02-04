<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="HTML" indent="yes" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd" encoding="ISO-8859-1"/>

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
                <xsl:variable name="ID" select="@id"/>
                <li><a href="#{$ID}"> <xsl:value-of select="info[@nom = 'nom']/@value"/></a></li>
            </xsl:for-each>
        </ul>
    </xsl:template>

    <xsl:template name="liste-des-recettes">
        <xsl:for-each select="//objet[@type='recette']">
            <xsl:variable name="ID" select="@id"/>
            <h2 id="{$ID}"><xsl:value-of select="info[@nom = 'nom']/@value"/></h2>
            <ul>
                <li>Résumé : <xsl:value-of select="info[@nom='résumé']"/></li>
                <li>Photo : <xsl:value-of select="info[@nom='photo']/@value"/></li>
                <li>Date publication : <xsl:value-of select="info[@nom='date_publication']/@value"/></li>
                <li><xsl:value-of select="info[@nom='difficulté']/@value"/></li>
                <ul>Ingrédients :
                    <xsl:for-each select="info[@nom= 'ingrédient']">
                        <li><xsl:value-of select="@value"/>
                            <xsl:value-of select="@quantite"/></li>
                    </xsl:for-each>
                </ul>
                <li>Sous-catégorie : <xsl:value-of select="info[@nom='sous-catégorie']/@value"/></li>
                <li>Nbre de personne : <xsl:value-of select="info[@nom='nbre_personnes']/value"/></li>
                <li>Préparation : <xsl:value-of select="info[@nom='Préparation']/@value"/></li>
                <li>Cuisson: <xsl:value-of select="info[@nom='Cuisson']/@value"/></li>
                <li>Repos : <xsl:value-of select="info[@nom='Repos']/@value"/></li>
                <li>Préparation : <xsl:value-of select="info[@nom='Préparation']"/></li>
                <li><xsl:value-of select="info[@nom='auteur']/@value"/></li>
                <li><xsl:value-of select="info[@nom='note']/@value"/></li>
            </ul>
        </xsl:for-each>

    </xsl:template>

</xsl:stylesheet>