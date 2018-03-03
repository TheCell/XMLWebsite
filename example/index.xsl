<?xml version="1.0"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:sc="https://thecell.eu/xmlsportcenter" version="1.0">
    <xsl:output method="html"/>

    <!-- Don't match / cause we have 2 xml files (index.xml and database.xml that match) Recursin incoming -->
    <xsl:template match="sc:index">
        <html>
            <head>
                <title>index.xsl</title>
            </head>
            <body>
                <h1>I'm a title</h1>
                Kurse: <ul>
                    <!-- Load the database and apply templates -->
                    <xsl:apply-templates select="document('database.xml')"/>
                </ul>
            </body>
        </html>
    </xsl:template>
    
    <!-- create templates for the database entries -->
    <xsl:template match="sc:course">
        <li><xsl:value-of select="sc:name/text()" /></li>
    </xsl:template>
    
</xsl:stylesheet>
