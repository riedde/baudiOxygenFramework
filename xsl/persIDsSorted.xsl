<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0" version="2.0">
    <!--    <xsl:output method="xhtml" encoding="UTF-8"/>-->

    <xsl:template match="/">
        <xsl:for-each select="person">
            <xsl:sort select="//surname[1]" order="ascending"/>
            <xsl:variable name="persID" select="@xml:id"/>
            <xsl:value-of select="$persID"/>
        </xsl:for-each>
    </xsl:template>

</xsl:stylesheet>
