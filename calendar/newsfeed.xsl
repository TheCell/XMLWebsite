<?xml version="1.0"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
				xmlns:sc="https://thecell.eu/xmlsportcenter" 
				xmlns:xhtml="http://www.w3.org/1999/xhtml"
				xmlns:xs="http://www.w3.org/2001/XMLSchema"
				version="1.0">
    <xsl:output method="html"/>

    <!-- Don't match / cause we have 2 xml files
		(index.xml and database.xml that match) Recursin incoming -->
    <xsl:template match="sc:index">
        <html>
            <head>
                <title>newsfeed</title>
				<link rel="stylesheet" type="text/css" href="../style.css" />
				<link rel="stylesheet" type="text/css" href="newsfeed.css" />
            </head>
            <body>
				<div class="header">
					<div id="logo">Place Logo here</div>
					<div class="menu">
						<div class="menuitem">
							<a>Anmelden</a>
						</div>
						<div class="menuitem">
							<a href="calendar/calendar.xhtml">Kalender</a>
						</div>
						<div class="menuitem">
							<a>Angebote</a>
						</div>
					</div>
				</div>
                
				<h1>Anstehende Events</h1>
				<div class="newsfeedGrid">
                    <!-- Load the database and apply templates -->
                    <xsl:apply-templates
						select="document('../DBs/coursesDB.xml')"/>
				</div>
            </body>
        </html>
    </xsl:template>
    
    <!-- create templates for the database entries -->
    <xsl:template match="//course">
		<div class="feedDate">
			<xsl:value-of select="dateFrom/text()" />
		</div>
		<div class="feedItem">
			<span class="title">
				<xsl:value-of select="name/text()" />
			</span>
			<span class="timeFromTo">
				<xsl:value-of select="timeFrom/text()" /> - 
				<xsl:value-of select="timeTo/text()" />
			</span>
		</div>
    </xsl:template>
    
</xsl:stylesheet>
