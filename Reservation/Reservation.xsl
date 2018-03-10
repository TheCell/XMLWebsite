<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns="http://www.w3.org/1999/xhtml">

    <xsl:template match="/">
        <xsl:param name="ID"/>
        <?php
                include "process.php";
                ?>
        <html content="application/xml">
            <head>
                <meta http-equiv="content-type" content="text/html; charset=utf-8"/>
                <title>Sportzentrum Hopfendorf</title>
                <link rel="stylesheet" type="text/css" href="resStyle.css"/>
                <link rel="php" type="php" href="process.php"/>
            </head>
            <body>
                <ul class="tabs">
                    <li id="reservation">
                        <div class="content">

                            <form name="myform" method="POST" action="process.php">
                                <h1>Reservieren von:</h1>
                                <p>Name:
                                    <input name="username" value="Username"/>
                                </p>
                                <p>Reservieren von:
                                    <input type="date" name="dateFrom" value=""/>
                                bis:
                                    <input type="date" name="dateTo" value=""/>
                                </p>
                                <p>Zeit von:
                                    <input type="time" name="timeFrom" value=""/>
                                bis:
                                    <input type="time" name="timeTo" value=""/>
                                </p>
                                <p>Bemerkung:
                                    <input name="note" value="Bemerkung"/>
                                </p>
                                <input type="hidden" name="ID" value="{$ID}"/>
                                <p class="submit">
                                    <input type="submit" value="Reservieren"/>
                                </p>
                            </form>
                        </div>
                    </li>
                    <li id="feedback">
                        <div class="content">
                            <h1>feedback</h1>
                        </div>
                    </li>
                    <li id="courses">
                        <a href="#courses" class="trigger">Kurse</a>
                        <div class="content">
                            <ul>
                                <xsl:apply-templates select="document(//courses/@name)"/>
                            </ul>
                        </div>
                    </li>
                    <li id="rooms">
                        <a href="#rooms" class="trigger">Räume</a>
                        <div class="content">
                            <ul>
                                <xsl:apply-templates select="document(//rooms/@name)"/>
                            </ul>
                        </div>
                    </li>
                    <li id="equip">
                        <a href="#equip" class="trigger">Geräte</a>
                        <div class="content">
                            <ul>
                                <li><xsl:value-of select="//rooms/text()"/></li>
                                <xsl:apply-templates select="document(//equip/@name)"/>
                            </ul>
                        </div>
                    </li>
                </ul>
            </body>

        </html>
    </xsl:template>
    <xsl:template name="course" match="//course">
        <xsl:if test="state = 'aktiv'">
            <table>
                <caption>
                    <!--<a href="#reservation" onclick="save({@id})">-->
                        <!--<h3>-->
                            <!--<xsl:value-of select="name"/>-->
                        <!--</h3>-->
                    <!--</a>-->
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

    <xsl:template name="rooms" match="//room">
        <table>
            <caption>
                <!--<a href="#reservation" onclick="save({@id})">-->
                    <!--<h3>-->
                        <!--<xsl:value-of select="name"/>-->
                    <!--</h3>-->
                <!--</a>-->
            </caption>
            <tr class="dark">
                <td>
                    Gebäude:
                </td>
                <td>
                    <xsl:value-of select="in_building"/>
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
        <xsl:value-of select="equipement/equipmentID"/>
    </xsl:template>

    <xsl:template name="equipment" match="//item">
        <table>
            <caption>
                <!--<a href="#reservation" onclick="save({@id})">-->
                    <!--<h3>-->
                        <!--<xsl:value-of select="name"/>-->
                    <!--</h3>-->
                <!--</a>-->
            </caption>
            <tr class="dark">
                <td style="">
                    Raumnummer:
                </td>
                <td>
                    <xsl:value-of select="roomID"/>
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
    </xsl:template>

</xsl:stylesheet>