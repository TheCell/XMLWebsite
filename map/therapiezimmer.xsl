<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
				xmlns:sc="https://thecell.eu/xmlsportcenter" 
				xmlns:xhtml="http://www.w3.org/1999/xhtml"
				xmlns:xs="http://www.w3.org/2001/XMLSchema"
				version="1.0">

	<xsl:output method="html"/>
    <xsl:template match="sc:index">
        <div id="buildinginfo"> 
            <xsl:apply-templates select="document('../DBs/roomDB.xml')//room/in_building[text()='Therapiezimmer']"/>
        </div>
    </xsl:template>
    
    <xsl:template match="//room/in_building[text()='Therapiezimmer']">
        <div class="room">
            <div class="roomname">
                Raum: <xsl:value-of select="../name/text()"/>
            </div>
            <div class="morebutton" onclick="showRoomDetail(this)">+</div>
            <div class="lessbutton" onclick="hideRoomDetail(this)">-</div>
            <div class="roomdetail">
                <div class="description">
                    <xsl:value-of select="../description/text()"/>
                </div>
                <div class="equipment">
                    Hier finden Sie folgende Gegenstände:
                    <xsl:apply-templates select="document('../DBs/equipmentDB.xml')//item/roomID">
                        <xsl:with-param name="room">
                            <xsl:value-of select="../@id"/>
                        </xsl:with-param>
                    </xsl:apply-templates>
                </div>
            </div>
        </div>
    </xsl:template>
    
    <xsl:template match="//item/roomID">
        <xsl:param name="room"/>
        <xsl:if test="text() = $room">
            <div class="equipment-item">
                <xsl:value-of select="../name/text()"/> (<xsl:value-of select="../description/text()"/>)
            </div>
        </xsl:if>
    </xsl:template>
    
</xsl:stylesheet>
