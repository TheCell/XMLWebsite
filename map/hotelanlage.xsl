<?xml version="1.0"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
				xmlns:sc="https://thecell.eu/xmlsportcenter" 
				xmlns:xhtml="http://www.w3.org/1999/xhtml"
				xmlns:xs="http://www.w3.org/2001/XMLSchema"
				version="1.0">

	<xsl:output method="html"/>
    <xsl:template match="sc:index">
        <div>
            <xsl:apply-templates select="document('../DBs/roomDB.xml')//room/in_building[text()='Hotelanlage']"/>
        </div>
    </xsl:template>
    
    <xsl:template match="//room/in_building[text()='Hotelanlage']">
        <p>
        <xsl:value-of select="../name/text()"/>
        </p>
    </xsl:template>
    
</xsl:stylesheet>
