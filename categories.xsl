<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="HTML" indent="yes" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd" encoding="ISO-8859-1"/>

    <xsl:template match="/">
        <html>
            <body>
                <xsl:call-template name="ancrage-des-categories"/>
                <xsl:call-template name="liste-des-categories"/>
            </body>
        </html>
    </xsl:template>

    <xsl:template name="ancrage-des-categories">

    </xsl:template>

    <xsl:template name="liste-des-categories">

    </xsl:template>

</xsl:stylesheet>