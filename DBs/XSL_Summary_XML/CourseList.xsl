<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns="http://www.w3.org/1999/xhtml">

    <xsl:template match="/list/courses">
        <head>
            <title>Tests xslt</title>
        </head>
        <body>
            <xsl:apply-templates select="document(@name)"/>
        </body>
    </xsl:template>

    <xsl:template match="/course">
        <xsl:if test="state = active">
            <li>
                <h3><xsl:value-of select="//name"/></h3>
                von: <xsl:value-of select="//dateFrom"/>
                <br />
                bis: <xsl:value-of select="//dateTo"/>
                <br />
                Regelmässigkeit: <xsl:value-of select="//reoccurrance"/>
                <br />
                von: <xsl:value-of select="//timeFrom"/>
                <br />
                bis: <xsl:value-of select="//timeTo"/>
                <br />
                Level: <xsl:value-of select="//level"/>
                <br />
                max. Teilenhmer: <xsl:value-of select="//maxParticipants"/>
                <br />
                empfohlen für: <xsl:value-of select="//recommendedFor"/>
                <br />
                Kurssprache: <xsl:value-of select="//language"/>
                <br />
                Beschreibung: <xsl:value-of select="//description"/>
            </li>
        </xsl:if>
    </xsl:template>
</xsl:stylesheet>