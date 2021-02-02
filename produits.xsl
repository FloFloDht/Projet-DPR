<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="HTML" indent="yes" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd" encoding="ISO-8859-1"/>

    <xsl:template match="/">
        <html>
            <body>
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
            <h2 id="#{$ID}"><xsl:value-of select="info[@nom = 'nom']/@value"/></h2>
            <ul>
                <li>Nom court : <xsl:value-of select="info[@nom = 'nom-court']/@value"/></li>
                <ul> Ingrédient(s) :
                    <xsl:for-each select="info[@nom='ingrédient']">
                        <li><xsl:value-of select="@value"/></li>
                    </xsl:for-each>
                </ul>
            </ul>

        </xsl:for-each>

    </xsl:template>

</xsl:stylesheet>