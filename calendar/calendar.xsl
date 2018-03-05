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
					<div id="logo">Place Logo here</div>
					<div class="menu">
						<div class="menuitem">
							<a>Anmelden</a>
						</div>
						<div class="menuitem">
							<a href="calendar.xhtml">Kalender</a>
						</div>
						<div class="menuitem">
							<a>Angebote</a>
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
					<div class="dayOne"></div>
					<div class="dayTwo"></div>
					<div class="dayThree"></div>
					<div class="dayFour"></div>
					<div class="dayFive"></div>
					
					<xsl:apply-templates 
						select="document('../DBs/coursesDB.xml')"/>
				</div>
            </body>
        </html>
    </xsl:template>
    
    <!-- create templates for the database entries -->
	<xsl:template match="courses">
		<div class="recommendedFor">
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
		</div>
	</xsl:template>
	
	<xsl:template name="course" >
		<xsl:param name="recommendedFor" />
		<xsl:param name="currentDate" />
		<xsl:param name="currentTime" />
		<div>
			<xsl:choose>
			 <xsl:when 
				 test="number(translate(substring(timeFrom/text(),1,8),':','')) > 200000">
				 <span class="divAttrib timeTwentyToTwentyFour"></span>
			 </xsl:when>
			 <xsl:when 
				 test="number(translate(substring(timeFrom/text(),1,8),':','')) > 160000">
				 <span class="divAttrib timeSixteenToTwenty"></span>
			 </xsl:when>
			 <xsl:when 
				 test="number(translate(substring(timeFrom/text(),1,8),':','')) > 120000">
				 <span class="divAttrib timeTwelveToSixteen"></span>
			 </xsl:when>
			 <xsl:when 
				 test="number(translate(substring(timeFrom/text(),1,8),':','')) > 080000">
				 <span class="divAttrib timeEightToTwelve"></span>
			 </xsl:when>
			 <xsl:when 
				 test="number(translate(substring(timeFrom/text(),1,8),':','')) > 040000">
				 <span class="divAttrib timeFourToEight"></span>
			 </xsl:when>
			 <xsl:otherwise>
				 <span class="divAttrib timeZeroToEight"></span>
			 </xsl:otherwise>
		   </xsl:choose>
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
