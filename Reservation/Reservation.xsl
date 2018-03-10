<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns="http://www.w3.org/1999/xhtml">

    <xsl:template match="//list">
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
                            <h1>Reservieren von:</h1>
                            <form name="myform" method="POST" action="process.php">
                                <p>
                                    ID: <?php echo '<input type="text" name="eId" value="' . htmlspecialchars($_GET['data']) .'"/>'; ?></p>
                                <p>Name:
                                    <input name="username" value=""/>
                                </p>
                                <p>Reservieren von:
                                    <input type="date" name="dateFrom" value=""/>
                                </p>
                                <p>bis:
                                    <input type="date" name="dateTo" value=""/>
                                </p>
                                <p>Zeit von:
                                    <input type="time" name="timeFrom" value=""/>
                                </p>
                                <p>bis:
                                    <input type="time" name="timeTo" value=""/>
                                </p>
                                <p>Bemerkung:
                                    <input name="note" value=""/>
                                </p>
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
                <a href="?data={@id}#reservation">
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
                </a>
            </li>
        </xsl:if>
    </xsl:template>

    <xsl:template name="rooms" match="//room">
        <table>
            <caption>
                <a href="?data={@id}#reservation">
                    <h2>
                        <xsl:value-of select="name"/>
                    </h2>
                </a>
            </caption>
            <tr>
                <td>
                    <h3>Gebäude:</h3>
                </td>
                <td>
                    <h3>
                        <xsl:value-of select="in_building"/>
                    </h3>
                </td>
            </tr>
        </table>
        <h3>
            <xsl:value-of select="description"/>
        </h3>

        <h3>
            <xsl:value-of select="equipement/equipmentID"/>
        </h3>
    </xsl:template>

    <xsl:template name="equipment" match="//item">
        <table>
            <caption>
                <a href="?data={@id}#reservation">
                    <h2>
                        <xsl:value-of select="name"/>
                    </h2>
                </a>
            </caption>
            <tr>
                <td style="">
                    <h3>Raumnummer:</h3>
                </td>
                <td>
                    <h3>
                        <xsl:value-of select="roomID"/>
                    </h3>
                </td>
            </tr>
            <tr>
                <td>
                    <h3>Beschreibung:</h3>
                </td>
                <td>
                    <h3>
                        <xsl:value-of select="description"/>
                    </h3>
                </td>
            </tr>
        </table>
    </xsl:template>

</xsl:stylesheet>