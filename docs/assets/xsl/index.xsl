<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:tei="http://www.tei-c.org/ns/1.0"
    xmlns:html="http://www.w3.org/1999/xhtml" exclude-result-prefixes="xs tei html" version="2.0">
    <xsl:output method="html"/>

    <!-- transform the root element (TEI) into an HTML template -->
    <xsl:template match="tei:TEI">
        <xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
        <xsl:text>&#xa;</xsl:text>
        <html lang="sv" xml:lang="sv">
            <head>
                <title>
                    <!-- add the title from the metadata. This is what will be shown
                    on your browsers tab--> Lindboms familjebrev: en digital
                    samling </title>
                <!-- load bootstrap css (requires internet!) so you can use their pre-defined css classes to style your html -->
                <link rel="stylesheet"
                    href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
                    integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
                    crossorigin="anonymous"/>
                <!-- load the stylesheets in the assets/css folder, where you can modify the styling of your website -->
                <link rel="stylesheet" href="assets/css/main.css"/>
                <link rel="stylesheet" href="assets/css/desktop.css"/>
            </head>
            <body>
                <header>
                    <h1>
                        <xsl:apply-templates
                            select="//tei:TEI//tei:seriesStmt/tei:title[@type = 'main']"/>
                    </h1>
                </header>
                <nav id="sitenav">
                    <a class="active" href="index.html">Hem</a> | 
                    <a href="karleksbreven.html">Kärleksbreven</a> |
                    <a href="aktenskapsbreven.html">Äktenskapsbreven</a> | 
                    <a href="brevenfranCarl.html">Breven från Carl</a> | 
                    <a href="historia.html">Historiskt sammanhang</a> | 
                    <a href="personer.html">Personerna bakom breven</a> | 
                </nav>
                <main id="manuscript">
                    <!-- bootstrap "container" class makes the columns look pretty -->

                    <div class="container">
                        <!-- define a row layout with bootstrap's css classes (two columns) -->

                        <div class="row">
                            <!-- first column: load the image based on the IIIF link in the graphic above -->

                            <div class="col-sm">

                                <article id="thumbnail">
                                    <img>
                                        <xsl:attribute name="src">
                                            <xsl:value-of
                                                select="//tei:facsimile/tei:surface//tei:graphic[@xml:id = 'x']/@url"
                                            />
                                        </xsl:attribute>
                                        <xsl:attribute name="title">
                                            <xsl:value-of
                                                select="//tei:facsimile/tei:surface[@xml:id = 'x']//tei:label"
                                            />
                                        </xsl:attribute>
                                        <xsl:attribute name="alt">
                                            <xsl:value-of
                                                select="//tei:facsimile/tei:surface[@xml:id = 'x']//tei:figDesc"
                                            />
                                        </xsl:attribute>
                                    </img>
                                </article>
                            </div>

                            <!-- second column: apply matching templates for anything nested underneath the tei:text element -->
                            <div class="col-sm">
                                <article id="transcription">
                                    <p>
                                        <strong>Beskrivning:</strong>
                                        <xsl:apply-templates select="//tei:TEI//tei:figDesc"/>
                                    </p>
                                </article>
                            </div>
                        </div>
                    </div>
                    <div class="container">
                        <!-- define a row layout with bootstrap's css classes (two columns) -->
                        <div class="row">
                            <!-- first column: load the image based on the IIIF link in the graphic above -->
                            <div class="col-sm">

                                <article id="scan">
                                    <xsl:for-each select="//tei:surface">
                                        <img width="400">
                                            <xsl:attribute name="src">
                                                <xsl:value-of select="tei:figure/tei:graphic/@url"/>
                                            </xsl:attribute>
                                            <xsl:attribute name="title">
                                                <xsl:value-of select="tei:figure/tei:label-"/>
                                            </xsl:attribute>
                                            <xsl:attribute name="alt">
                                                <xsl:value-of select="tei:figure/tei:figDesc"/>
                                            </xsl:attribute>
                                        </img>
                                    </xsl:for-each>
                                </article>
                            </div>
                            <!-- second column: apply matching templates for anything nested underneath the tei:text element -->
                            <div class="col-sm">
                                <article id="transcription">
                                    <p>
                                        <strong>Description:</strong>
                                        <xsl:apply-templates select="//tei:TEI//tei:figDesc"/>
                                    </p>
                                </article>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm">
                                <article id="details">
                                    
                                    <p>
                                        <strong>Projektansvariga:</strong>
                                        <br/>
                                        <xsl:apply-templates select="//tei:TEI//tei:author"/>
                                    </p>
                                    
                                    <p>
                                        <strong>Text skriven av:</strong>
                                        <br/>
                                        <xsl:apply-templates select="//tei:TEI//tei:author[1]"/>
                                    </p>
                                    
                            
                                </article>
                            </div>
                        </div>
                    </div>
                </main>
                <footer>
                    <div class="row" id="footer">
                        <div class="col-sm copyright">
                            <div class="copyright_logos">
                                <a href="https://creativecommons.org/licenses/by/4.0/legalcode">
                                    <img src="assets/img/logos/cc.svg" class="copyright_logo"
                                        alt="Creative Commons License"/>
                                    <img src="assets/img/logos/by.svg" class="copyright_logo"
                                        alt="Attribution 4.0 International"/>
                                </a>
                            </div>
                            <div class="copyright_text"> 2022 Hanna Lindbom och Malin Sandstedt.
                            </div>
                        </div>
                    </div>
                </footer>
                <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"/>
                <script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.3/dist/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"/>
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"/>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
