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
							<a href="calendar/calendar.xhtml">Kalender</a>
						</div>
						<div class="menuitem">
							<a>Angebote</a>
						</div>
					</div>
				</div>
                <h1>Kalender</h1>
                Kurse: <ul>
                    <!-- Load the database and apply templates -->
                    <xsl:apply-templates 
						select="document('../DBs/coursesDB.xml')"/>
                </ul>
            </body>
        </html>
    </xsl:template>
    
    <!-- create templates for the database entries -->
    <xsl:template match="sc:course">
        <li><xsl:value-of select="sc:name/text()" /></li>
    </xsl:template>
    
</xsl:stylesheet>
