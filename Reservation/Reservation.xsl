<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns="http://www.w3.org/1999/xhtml"
                xmlns:php="http://php.net/xsl">

    <xsl:template match="//equip">
        <?php
                include "process.php";
                include "Reservation.php";
                ?>
        <html content="application/xml">
            <head>
                <meta http-equiv="content-type" content="text/html; charset=utf-8"/>
                <title>Sportzentrum Hopfendorf</title>
                <link rel="stylesheet" type="text/css" href="resStyle.css"/>
                <link rel="stylesheet" type="text/css" href="../style.css"/>
                <link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet"/>
                <link rel="php" type="php" href="process.php"/>
                <link rel="php" type="php" href="Reservation.php"/>
            </head>
            <body onload="init()">
                <div class="header">
                    <div id="logo">
                        <a href="../index.xhtml#item-1"><img alt="Logo von Sportzentrum Hopfentee" src="../Logo.jpg"/></a>
                    </div>
                    <div class="menu">
                        <div class="menuitems">
                            <div class="menuitem">
                                <a href="../index.xhtml#item-1">Startseite</a>
                            </div>
                            <div class="menuitem">
                                <a href="Reservation.php#courses" class="trigger">Kurse</a>
                            </div>
                            <div class="menuitem">
                                <a href="Reservation.php#rooms" class="trigger">Räume</a>
                            </div>
                            <div class="menuitem">
                                <a href="Reservation.php#equip" class="trigger">Geräte</a>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="main">
                    <ul class="tabs">
                        <li id="reservation">
                            <div class="content">
                                <form name="myform" method="POST" action="process.php">
                                    <h1>Reservieren von:</h1>
                                    <p>Name:
                                        <input name="username" value="" placeholder="Username"/>
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
                                        <input name="note" value="" placeholder="Bemerkung"/>
                                    </p>
                                    <p>
                                        <xsl:value-of disable-output-escaping="yes" select="php:function('show')"/>
                                    </p>
                                    <p class="submit">
                                        <input type="submit" value="Reservieren"/>
                                    </p>
                                </form>
                            </div>
                        </li>
                        <li id="feedbackpositiv">
                            <div class="content">
                                <h1>Vielen Dank für die Reservation</h1>
                            </div>
                        </li>
                        <li id="feedbacknegativ">
                        <div class="content">
                            <h1>Dies ist zu dieser Zeit leider schon reserviert.<br/> versuchen sie eine andere Zeit</h1>
                        </div>
                    </li>
                        <li id="courses">
                            <div class="content">
                                <ul>
                                    <xsl:apply-templates select="document('../DBs/coursesDB.xml')"/>
                                </ul>
                            </div>
                        </li>
                        <li id="rooms">
                            <div class="content">
                                <ul>
                                    <xsl:apply-templates select="document('../DBs/roomDB.xml')"/>
                                </ul>
                            </div>
                        </li>
                        <li id="equip">
                            <div class="content">
                                <ul>
                                    <xsl:apply-templates select="document('../DBs/equipmentDB.xml')"/>
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


    <xsl:template name="course" match="//course">
        <xsl:if test="state = 'aktiv'">
            <table>
                <caption>
                    <a href="Reservation.php?data={@id}#reservation">
                        <h3>
                            <xsl:value-of select="name"/>
                        </h3>
                    </a>
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
                <a href="Reservation.php?data={@id}#reservation">
                    <h3>
                        <xsl:value-of select="name"/>
                    </h3>
                </a>
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
                <a href="Reservation.php?data={@id}#reservation">
                    <h3>
                        <xsl:value-of select="name"/>
                    </h3>
                </a>
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