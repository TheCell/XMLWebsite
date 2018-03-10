<?xml version="1.0"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
				xmlns:sc="https://thecell.eu/xmlsportcenter" 
				xmlns:xhtml="http://www.w3.org/1999/xhtml"
				version="1.0">
    <xsl:output method="html"/>

    <!-- Don't match / cause we have 2 xml files
		(index.xml and database.xml that match) Recursin incoming -->
    <xsl:template match="sc:index">
        <html>
            <head>
                <title>index.xsl</title>
				<link rel="stylesheet" type="text/css" href="../style.css" />
				<link rel="stylesheet" type="text/css" href="calendar.css" />
            </head>
            <body>
				<div class="header">
					<div id="logo">
						<img alt="Logo von Sportzentrum Hopfentee" src="../Logo.jpg"/>
					</div>
					<div class="menu">
						<div class="menuitems">
							<div class="menuitem"><a href="../index.xhtml" >Startseite</a></div>
							<div class="menuitem"><a>Anmelden</a></div>
							<div class="menuitem"><a href="calendar.php">Kalender</a></div>
							<div class="menuitem"><a>Angebote</a></div>
						</div>
					</div>
				</div>
                <h1>Kalender</h1>
				<!-- Load the database and apply templates -->
				
				<div class="recommendedSelection">
					<form type="submit" method="get" action="calendar.php" >
						<input type="radio" name="recommendedFor" value="Alle" >
							Alle
						</input>
						<input type="radio" name="recommendedFor" value="Normal" >
							Normal
						</input>
						<input type="radio" name="recommendedFor" value="Amputation" >
							Amputation
						</input>
						<input type="radio" name="recommendedFor" value="Geistig eingeschränkt" >
							Geistig eingeschränkt
						</input>
						<input type="submit" value="Senden" />
					</form>
				</div>
				
				<div class="calendar">
					<div class="zeroToFour">
						00:00 - 04:00
					</div>
					<div class="FourToEight">
						04:00 - 08:00
					</div>
					<div class="EightToTwelve">
						08:00 - 12:00
					</div>
					<div class="TwelveToSixteen">
						12:00 - 16:00
					</div>
					<div class="SixteenToTwenty">
						16:00 - 20:00
					</div>
					<div class="TwentyToTwentyfour">
						20:00 - 24:00
					</div>
					<div class="dayOne">jo</div>
					<div class="dayTwo">jo</div>
					<div class="dayThree">jo</div>
					<div class="dayFour">jo</div>
					<div class="dayFive">jo</div>
					
					<xsl:apply-templates 
						select="document('../DBs/coursesDB.xml')"/>
				</div>
				<div class="footer">
					<div class="footeritems">
						<div class="impressum">Place impressum here</div>
						<div class="copyright">Place copyright here</div>
					</div>
				</div>
            </body>
        </html>
    </xsl:template>
    
    <!-- create templates for the database entries -->
	<xsl:template match="courses">
			<!-- <xsl:value-of select="$recommendedFor" /> -->
			
			<xsl:for-each select="course[contains(.,$recommendedFor)]">
				<xsl:call-template name="course">
					<!--<xsl:with-param name="title" select = "title" />-->
					<xsl:with-param name="recommendedFor"
									select="$recommendedFor" />
					<xsl:with-param name="currentDate"
									select="$currentDate" />
					<xsl:with-param name="currentTime"
									select="$currentTime" />
				</xsl:call-template>
			</xsl:for-each>
			<!--<xsl:apply-templates />-->
	</xsl:template>
	
	<xsl:template name="course" >
		<xsl:param name="recommendedFor" />
		<xsl:param name="currentDate" />
		<xsl:param name="currentTime" />
		<xsl:variable name="dayTime">
			<xsl:choose>
				<xsl:when 
					test="number(translate(substring(timeFrom/text(),1,8),':','')) > 200000">
					divAttrib timeTwentyToTwentyFour
				</xsl:when>
				<xsl:when 
					test="number(translate(substring(timeFrom/text(),1,8),':','')) > 160000">
					divAttrib timeSixteenToTwenty
				</xsl:when>
				<xsl:when 
					test="number(translate(substring(timeFrom/text(),1,8),':','')) > 120000">
					divAttrib timeTwelveToSixteen
				</xsl:when>
				<xsl:when 
					test="number(translate(substring(timeFrom/text(),1,8),':','')) > 080000">
					divAttrib timeEightToTwelve
				</xsl:when>
				<xsl:when 
					test="number(translate(substring(timeFrom/text(),1,8),':','')) > 040000">
					divAttrib timeFourToEight
				</xsl:when>
				<xsl:otherwise>
					divAttrib timeZeroToEight
				</xsl:otherwise>
		   </xsl:choose>
		</xsl:variable>
		<xsl:variable name="dateRelativeToStart">
			<xsl:choose>
				<xsl:when 
					test="number(translate(substring(dateFrom/text(),1,10),'-','')) > (number(translate(substring($currentDate,1,10),'-','')) + 4)">
					divAttrib notInNextFiveDays
				</xsl:when>
				<xsl:when 
					test="number(translate(substring(dateFrom/text(),1,10),'-','')) > (number(translate(substring($currentDate,1,10),'-','')) + 3)">
					divAttrib dayFive
				</xsl:when>
				<xsl:when 
					test="number(translate(substring(dateFrom/text(),1,10),'-','')) > (number(translate(substring($currentDate,1,10),'-','')) + 2)">
					divAttrib dayFour
				</xsl:when>
				<xsl:when 
					test="number(translate(substring(dateFrom/text(),1,10),'-','')) > (number(translate(substring($currentDate,1,10),'-','')) + 1)">
					divAttrib dayThree
				</xsl:when>
				<xsl:when 
					test="number(translate(substring(dateFrom/text(),1,10),'-','')) > (number(translate(substring($currentDate,1,10),'-','')))">
					divAttrib dayTwo
				</xsl:when>
				<xsl:when 
					test="number(translate(substring(dateFrom/text(),1,10),'-','')) > (number(translate(substring($currentDate,1,10),'-','')) - 1)">
					divAttrib dayOne
				</xsl:when>
				<xsl:otherwise>
					divAttrib notInNextFiveDays
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<div class="{$dayTime} {$dateRelativeToStart}">
			Date in xml: <xsl:value-of select="number(translate(substring(dateFrom/text(),1,10),'-',''))" />
			Date in php: <xsl:value-of select="(number(translate(substring($currentDate,1,10),'-','')))" />
			<p>Parameter: <xsl:value-of select="$recommendedFor" />
			<br />
			<xsl:value-of select="$currentDate" />
			<br />
			<xsl:value-of select="$currentTime" />
			<br />
			<xsl:value-of select="number(translate(substring(timeFrom/text(),1,8),':',''))" />

			</p>
			Name: <xsl:value-of select="name" />
			Datum: <xsl:value-of select="dateFrom" />
			Zeitpunkt: <xsl:value-of select="timeFrom" />
		</div>
	</xsl:template>
	
	<!-- test
	<xsl:template match="course[contains(.,'Alle')]">
		<br />
		<br />
		matched alle: <xsl:value-of select="name/text()" /> tada.
		<br />
		<br />
	</xsl:template>
	-->
	
    <!--
	<xsl:template match="course">
		<div class="calendarItem">
			<xsl:value-of select="name/text()" />
		</div>
    </xsl:template>
	-->
    
</xsl:stylesheet>
