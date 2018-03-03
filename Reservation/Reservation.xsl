<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns="http://www.w3.org/1999/xhtml">

    <xsl:template match="//list">
        <html content="application/xml">
            <head>
                <meta http-equiv="content-type" content="text/html; charset=utf-8"/>
                <title>Sportzentrum Hopfendorf</title>
                <link rel="stylesheet" type="text/css" href="resStyle.css"/>
            </head>
            <body>
                <ul class="tabs">
                    <li id="courses">
                        <a href="#courses" class="trigger">Kurse</a>
                        <div class="content">
                            <ul>
                                <xsl:apply-templates select="document(courses/@name)"/>
                            </ul>
                        </div>
                    </li>
                    <li id="rooms">
                        <a href="#rooms" class="trigger">Räume</a>
                        <div class="content">
                            <ul>
                                <xsl:apply-templates select="document(rooms/@name)"/>
                            </ul>
                        </div>
                    </li>
                    <li id="equip">
                        <a href="#equip" class="trigger">Geräte</a>
                        <div class="content">
                            <ul>
                                <xsl:apply-templates select="document(equip/@name)"/>
                            </ul>
                        </div>
                    </li>
                </ul>
            </body>
        </html>

    </xsl:template>

    <xsl:template name="course" match="//course">
        <xsl:if test="state = 'aktiv'">
            <li>
                <h3>
                    <xsl:value-of select="name"/>
                </h3>
                von:
                <xsl:value-of select="dateFrom"/>
                <br/>
                bis:
                <xsl:value-of select="dateTo"/>
                <br/>
                Regelmässigkeit:
                <xsl:value-of select="reoccurrance"/>
                <br/>
                von:
                <xsl:value-of select="timeFrom"/>
                <br/>
                bis:
                <xsl:value-of select="timeTo"/>
                <br/>
                Level:
                <xsl:value-of select="level"/>
                <br/>
                max. Teilenhmer:
                <xsl:value-of select="maxParticipants"/>
                <br/>
                empfohlen für:
                <xsl:value-of select="recommendedFor"/>
                <br/>
                Kurssprache:
                <xsl:value-of select="language"/>
                <br/>
                Beschreibung:
                <xsl:value-of select="description"/>
            </li>
        </xsl:if>
    </xsl:template>

    <xsl:template name="rooms" match="//room">
        <li>
            <h3>
                <xsl:value-of select="name"/>
            </h3>
            Gebäude:
            <xsl:value-of select="in_building"/>
            <br/>
            <xsl:value-of select="description"/>
            <br/>
            <xsl:value-of select="equipement/equipmentID"/>
        </li>
    </xsl:template>

    <xsl:template name="equipment" match="//item">
        <li>
            <h3>
                <xsl:value-of select="name"/>
            </h3>
            Raumnummer:
            <xsl:value-of select="roomID"/>
            <br/>
            Beschreibung:
            <xsl:value-of select="description"/>
        </li>
    </xsl:template>

</xsl:stylesheet>