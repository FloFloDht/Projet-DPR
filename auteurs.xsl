<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" indent="yes" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd" encoding="ISO-8859-1"/>

    <xsl:template match="/">
        <html>
            <body>
                <xsl:call-template name="ancrage-des-auteurs"/>
                <xsl:call-template name="liste-des-auteurs"/>
            </body>
        </html>
    </xsl:template>

    <xsl:template name="ancrage-des-auteurs">
        <h1>Listes des auteurs : </h1>
        <ul>
            <xsl:for-each select="//objet[@type = 'auteur']">
                <xsl:variable name="ID" select="@id"/>
                <li><a href="#{$ID}"> <xsl:value-of select="info[@nom = 'idext']/@value"/></a></li>
            </xsl:for-each>
        </ul>
    </xsl:template>

    <xsl:template name="liste-des-auteurs">
        <xsl:for-each select="//objet[@type = 'auteur']">
            <xsl:variable name="ID" select="@id"/>
            <xsl:variable name="idrec" select="info[@nom='recette']/@value"/>
            <h2 id="{$ID}"><xsl:value-of select="info[@nom = 'idext']/@value"/></h2>
            <ul>
                <li><xsl:value-of select="info[@nom = 'pays']/@value"/></li>
                <li><xsl:value-of select="info[@nom = 'sexe']/@value"/></li>
                <li>Recettes :</li>
                <xsl:for-each select="preceding::objet[@type='recette']">
                    <xsl:if test="$idrec = @id">
                        <li><xsl:value-of select="info[@nom ='nom']/@value"/></li>
                    </xsl:if>
                </xsl:for-each>

                <li><xsl:value-of select="info[@nom = 'biographie']/@value"/></li>
            </ul>
        </xsl:for-each>
    </xsl:template>


</xsl:stylesheet>
