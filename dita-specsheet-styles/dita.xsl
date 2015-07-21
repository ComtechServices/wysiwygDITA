<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns="http://www.w3.org/1999/xhtml">
    <xsl:output encoding="UTF-8" indent="no" media-type="text/html" method="xml" />
    
    <xsl:template match="/">
        <html>
            <head>
        <link rel="stylesheet" href="dita-specsheet-styles/driver.css" type="text/css" />
            </head>
            <body>
                <xsl:apply-templates />
            </body>
        </html>
    </xsl:template>
    
    <xsl:template match="topicref">
        <xsl:apply-templates select="document(@href)"/>
    </xsl:template>
    
    <xsl:template match="node()[not(self::topicref or self::table or self::fig or self::inlinemediaobject or self::image or self::xref or self::url or self::emailaddress or self::alt)]|@*">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
    </xsl:template> 
    
    <xsl:template match="@xml:id">
        <xsl:element name="a" namespace="http://www.w3.org/1999/xhtml">
            <xsl:attribute name="name"><xsl:value-of select="."/></xsl:attribute>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="table">      
        <xsl:element name="table" namespace="http://www.w3.org/1999/xhtml">
            <xsl:apply-templates select="@*|node()"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="fig | image">
    <div>
        <xsl:element name="img" namespace="http://www.w3.org/1999/xhtml">
            <xsl:attribute name="src"><xsl:value-of select="@href"/></xsl:attribute>
            <xsl:copy-of select="@*" />
            <xsl:apply-templates/>
        </xsl:element>
    </div>
    </xsl:template>
    
    <xsl:template match="alt" ></xsl:template>
    
    <xsl:template match="xref">
        <xsl:element name="a" namespace="http://www.w3.org/1999/xhtml">
            <xsl:attribute name="href">#<xsl:value-of select="@href"/></xsl:attribute>
            <xsl:value-of select="@href"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="url">
        <xsl:element name="a" namespace="http://www.w3.org/1999/xhtml">
            <xsl:attribute name="href"><xsl:value-of select="."/></xsl:attribute>
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="emailaddress">
        <xsl:element name="a" namespace="http://www.w3.org/1999/xhtml">
            <xsl:attribute name="href">mailto:<xsl:value-of select="."/></xsl:attribute>
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>
    
</xsl:stylesheet>