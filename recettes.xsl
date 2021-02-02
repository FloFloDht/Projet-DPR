<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="xml" indent="yes" />

    <xsl:template match="/">
        <Recettes>
            <xsl:for-each select="//objet[@type = 'catégorie']">
                <xsl:variable name="cate" select="@id"/>
                <CategoriePlat>
                    <Name><xsl:value-of select="info[@nom='nom']/@value"/></Name>
                    <Desc><xsl:value-of select="info[@nom='descriptif']"/></Desc>
                    <xsl:for-each select="//objet[@type = 'sous-catégorie']">
                        <xsl:variable name="souscate" select="@id"/>
                        <xsl:if test="$cate = info[@nom='catégorie']/@value">
                            <SousCategoriePlat>
                                <name><xsl:value-of select="info[@nom='nom']/@value"/></name>
                                <desc><xsl:value-of select="info[@nom='descriptif']"/></desc>
                                <recettes>
                                    <xsl:for-each select="//objet[@type = 'recette']">
                                        <xsl:if test="$souscate = info[@nom='sous-catégorie']/@value">
                                            <Recette>
                                                <Titre><xsl:value-of select="info[@nom = 'nom']/@value"/></Titre>
                                                <Résumé><xsl:value-of select="info[@nom = 'résumé']"/></Résumé>
                                                <Photo><xsl:value-of select="info[@nom = 'photo']/@value"/></Photo>
                                                <DatePublication><xsl:value-of select="info[@nom = 'date_publication']/@value"/></DatePublication>
                                                <Difficulte><xsl:value-of select="info[@nom = 'difficulté']/@value"/></Difficulte>
                                                <xsl:for-each select="info[@nom ='ingrédient']">
                                                    <ref-ingrédient>
                                                     <xsl:value-of select="@value"/>
                                                        <xsl:value-of select="@quantité"/>
                                                    </ref-ingrédient>
                                                </xsl:for-each>
                                                <NbrePersonne><xsl:value-of select="info[@nom = 'nbre_personnes']/@value"/></NbrePersonne>
                                                <TmpsPreparation><xsl:value-of select="info[@nom = 'Préparation']/@value"/></TmpsPreparation>
                                                <TmpsCuisson><xsl:value-of select="info[@nom = 'Cuisson']/@value"/></TmpsCuisson>
                                                <TmpsRepos><xsl:value-of select="info[@nom = 'Repos']/@value"/></TmpsRepos>
                                                <DescriptionPreparation><xsl:value-of select="info[@nom = 'Préparation']"/></DescriptionPreparation>
                                                <NoteInternautes><xsl:value-of select="info[@nom = 'note']/@value"/></NoteInternautes>
                                                <Auteur><xsl:value-of select="info[@nom = 'auteur']/@value"/></Auteur>
                                            </Recette>
                                        </xsl:if>
                                    </xsl:for-each>
                                </recettes>
                            </SousCategoriePlat>
                        </xsl:if>
                    </xsl:for-each>
                </CategoriePlat>
            </xsl:for-each>

            <Auteurs>
                <xsl:for-each select="//objet[@type = 'auteur']">
                <Auteur>
                    <nom><xsl:value-of select="info[@nom = 'idext']/@value"/></nom>
                    <xsl:for-each select="info[@nom = 'recette']">
                        <ref-recette><xsl:value-of select="@value"/></ref-recette>
                    </xsl:for-each>
                    <pays><xsl:value-of select="info[@nom = 'pays']/@value"/></pays>
                    <sexe><xsl:value-of select="info[@nom = 'sexe']/@value"/></sexe>
                    <bio><xsl:value-of select="info[@nom = 'biographie']/@value"/></bio>
                </Auteur>
                </xsl:for-each>
            </Auteurs>

            <Ingredients>
                <xsl:for-each select="//objet[@type = 'ingrédient']">
                    <Ingredient>
                        <Nom><xsl:value-of select="info[@nom = 'nom']/@value"/></Nom>
                        <ApportNutritif><xsl:value-of select="info[@nom = 'Apport nutritif']/@value"/></ApportNutritif>
                        <ApportEnergetique><xsl:value-of select="info[@nom = 'Apport énergétique']/@value"/></ApportEnergetique>
                        <Saison><xsl:value-of select="info[@nom = 'saison']/@value"/></Saison>
                        <Description><xsl:value-of select="info[@nom = 'descriptif']/@value"/></Description>
                        <xsl:for-each select="info[@nom = 'recette']">
                            <idRec><xsl:value-of select="@value"/></idRec>
                        </xsl:for-each>
                        <idProd><xsl:value-of select="info[@nom = 'produit']/@value"/></idProd>
                    </Ingredient>
                </xsl:for-each>
            </Ingredients>

        </Recettes>

    </xsl:template>
</xsl:stylesheet>
