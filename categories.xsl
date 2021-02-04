<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="HTML" indent="yes" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd" encoding="ISO-8859-1"/>

    <xsl:template match="/">
        <html>
            <body>
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
                <li><a href="#{$ID}"> <xsl:value-of select="info[@nom = 'nom']/@value"/></a></li>
            </xsl:for-each>
        </ul>
    </xsl:template>

    <xsl:template name="liste-des-categories">
        <xsl:for-each select="//objet[@type='catégorie']">
            <xsl:variable name="ID" select="@id"/>
            <h2 id="#{$ID}"><xsl:value-of select="info[@nom='nom']/@value"/></h2>
            <ul>
                <li>Descriptif : <xsl:value-of select="info[@nom='descriptif']"/></li>
            </ul>
        </xsl:for-each>

    </xsl:template>

    <xsl:template name="ancrage-des-sous-categories">
        <h1>Listes des sous-catégories : </h1>
        <ul>
            <xsl:for-each select="//objet[@type = 'sous-catégorie']">
                <xsl:variable name="ID" select="@id"/>
                <li><a href="#{$ID}"> <xsl:value-of select="info[@nom = 'nom']/@value"/></a></li>
            </xsl:for-each>
        </ul>

    </xsl:template>

    <xsl:template name="liste-des-sous-categories">
        <xsl:for-each select="//objet[@type='sous-catégorie']">
            <xsl:variable name="ID" select="@id"/>
            <h2 id="#{$ID}"><xsl:value-of select="info[@nom='nom']/@value"/></h2>
            <ul>
                <li>Descriptif : <xsl:value-of select="info[@nom='descriptif']"/></li>
                <li>Catégorie : <xsl:value-of select="info[@nom='catégorie']/@value"/></li>
            </ul>
        </xsl:for-each>
    </xsl:template>

</xsl:stylesheet>