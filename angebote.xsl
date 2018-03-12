<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns="http://www.w3.org/1999/xhtml">

    <xsl:template match="/">
        <html content="application/xml">
            <head>
                <meta http-equiv="content-type" content="text/html; charset=utf-8"/>
                <title>Sportzentrum Hopfentee</title>
                <link rel="stylesheet" type="text/css" href="style.css"/>
                <link rel="stylesheet" type="text/css" href="Reservation/resStyle.css"/>
                <link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet"/>
            </head>
            <body onload="init()">
                <div class="header">
                    <div id="logo">
                        <a href="index.xhtml#item-1">
                            <img alt="Logo von Sportzentrum Hopfentee" src="Logo.jpg"/>
                        </a>
                    </div>
                    <div class="menu">
                        <div class="menuitems">
                            <div class="menuitem">
                                <a href="Reservation/login.xhtml">Anmelden</a>
                            </div>
                            <div class="menuitem">
                                <a href="calendar/calendar.php">Kalender</a>
                            </div>
                            <div class="menuitem">
                                <a href="angebote.xml">Angebote</a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="main">
                    <ul class="tabs">
                        <li class="coursesOffers">
                            <div class="content">
                                <p>Angebote &amp; Kurse:</p>
                                <ul>
                                    <xsl:apply-templates select="document('DBs/coursesDB.xml')/courses"/>
                                </ul>
                            </div>
                        </li>
                    </ul>
                </div>
                <div class="resFooter">
                    <div class="footeritems">
                        <div class="impressum">Designed and developed by: Joel Salzmann, Larissa Schuler, Pascal Stalder, Simon Hischier</div>
                        <div class="copyright">Sportzentrum Hopfentee</div>
                    </div>
                </div>
            </body>
        </html>
    </xsl:template>

    <xsl:template match="courses/course">
        <xsl:if test="state = 'aktiv'">
            <table>
                <caption>
                    <h3>
                        <xsl:value-of select="name"/>
                    </h3>
                </caption>
                <tr class="dark">
                    <td>
                        von:
                    </td>
                    <td>
                        <xsl:value-of select="dateFrom"/>
                    </td>
                </tr>
                <tr class="bright">
                    <td>
                        bis:
                    </td>
                    <td>
                        <xsl:value-of select="dateTo"/>
                    </td>
                </tr>
                <tr class="dark">
                    <td>
                        Regelmässigkeit:
                    </td>
                    <td>
                        <xsl:value-of select="reoccurrance"/>
                    </td>
                </tr>
                <tr class="bright">
                    <td>
                        von:
                    </td>
                    <td>
                        <xsl:value-of select="timeFrom"/>
                    </td>
                </tr>
                <tr class="dark">
                    <td>
                        bis:
                    </td>
                    <td>
                        <xsl:value-of select="timeTo"/>
                    </td>
                </tr>
                <tr class="bright">
                    <td>
                        Level:
                    </td>
                    <td>
                        <xsl:value-of select="level"/>
                    </td>
                </tr>
                <tr class="dark">
                    <td>
                        max. Teilenhmer:
                    </td>
                    <td>
                        <xsl:value-of select="maxParticipants"/>
                    </td>
                </tr>
                <tr class="bright">
                    <td>
                        empfohlen für:
                    </td>
                    <td>
                        <xsl:value-of select="recommendedFor"/>
                    </td>
                </tr>
                <tr class="dark">
                    <td>
                        Kurssprache:
                    </td>
                    <td>
                        <xsl:value-of select="language"/>
                    </td>
                </tr>
                <tr class="bright">
                    <td>
                        Beschreibung:
                    </td>
                    <td>
                        <xsl:value-of select="description"/>
                    </td>
                </tr>
            </table>
        </xsl:if>
    </xsl:template>

</xsl:stylesheet>
