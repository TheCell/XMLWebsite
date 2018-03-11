<?xml version="1.0"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
				xmlns:sc="https://thecell.eu/xmlsportcenter"
				xmlns:xhtml="http://www.w3.org/1999/xhtml"
				xmlns:xs="http://www.w3.org/2001/XMLSchema"
				xmlns:date="http://exslt.org/dates-and-times"
				extension-element-prefixes="date"
				version="1.0">

	<xsl:output method="html"/>
    <!--
	<xsl:import href="../dateAndTimes/date.xsl" />
	-->

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
            	<div class="newsfeedGrid">
                    <!-- Load the database and apply templates -->
                    <xsl:apply-templates
						select="document('../DBs/coursesDB.xml')"/>
				</div>
            </body>
        </html>
    </xsl:template>

    <!-- create templates for the database entries -->
    <!--<xsl:template match="//course[xs:date(./dateTo/text()) > xs:date()]">-->
	<xsl:template name="course">
		<!--<xsl:value-of  select="current-dateTime()"/>-->
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

    <xsl:template match="courses">
		<!-- <xsl:value-of select="$recommendedFor" /> -->
		<!-- <xsl:for-each select="course[contains(dateFrom/text(), '2018-03-15')]"> -->
		<xsl:for-each select="course[((number(translate(substring(dateFrom/text(),1,10),'-','')) &gt; number(translate(substring($currentDateMinusOne,1,10),'-',''))) and (number(translate(substring(dateFrom/text(),1,10),'-','')) &lt;= number(translate(substring($currentDatePlusFour,1,10),'-','')))) ]">
			<xsl:call-template name="course">
				<!--<xsl:with-param name="title" select = "title" />-->
				<xsl:with-param name="currentDate"
								select="$currentDate" />
				<xsl:with-param name="currentDateMinusOne"
								select="$currentDateMinusOne" />
				<xsl:with-param name="currentDatePlusFour"
								select="$currentDatePlusFour" />
			</xsl:call-template>
		</xsl:for-each>
		<!--<xsl:apply-templates />-->
	</xsl:template>
</xsl:stylesheet>
