<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema"
  exclude-result-prefixes="xs" xpath-default-namespace="http://www.baumann-digital.de/ns/criticalReport" version="2.0">
      <xsl:output method="xml" encoding="UTF-8"/>
  <xsl:template match="node()|@*">
    <xsl:copy>
      <xsl:apply-templates select="node()|@*">
        <xsl:sort select="mdiv" data-type="number" order="ascending"/>
        <xsl:sort select="measureStart" data-type="number" order="ascending"/>
        <xsl:sort select="countTimeStart" data-type="number" order="ascending"/>
        <xsl:sort select="measureEnd" data-type="number" order="ascending"/>
        <xsl:sort select="countTimeEnd" data-type="number" order="ascending"/>
      </xsl:apply-templates>
    </xsl:copy>
  </xsl:template>

  <!--<xsl:template match="criticalReport">
    <criticalReport work="{./@work}" xmlns="http://www.baumann-digital.de/ns/criticalReport">
      <xsl:for-each select="remark">

        <xsl:sort select="measureStart" order="ascending"/>
        <xsl:sort select="countTimeStart" order="ascending"/>
        <xsl:sort select="measureEnd" order="ascending"/>
        <xsl:sort select="countTimeEnd" order="ascending"/>
        <remark type="{./@type}" xml:id="{./@xml:id}">
          <xsl:apply-templates/>
        </remark>
      </xsl:for-each>
    </criticalReport>
  </xsl:template>-->

</xsl:stylesheet>
