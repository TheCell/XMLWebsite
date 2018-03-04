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
			<xsl:value-of select="$recommendedFor" />
			
			<xsl:for-each select="course">
				<xsl:call-template name="course">
					<!--<xsl:with-param name="title" select = "title" />-->
					<xsl:with-param name="recommendedFor" />
				</xsl:call-template>
			</xsl:for-each>
		</div>
	</xsl:template>
	
	<xsl:template name="course" >
		<xsl:param name="recommendedFor" />
		<p>Title: <xsl:value-of select="$recommendedFor" /></p>
	</xsl:template>
	
    <!--
	<xsl:template match="course">
		<div class="calendarItem">
			<xsl:value-of select="name/text()" />
		</div>
    </xsl:template>
	-->
    
</xsl:stylesheet>
