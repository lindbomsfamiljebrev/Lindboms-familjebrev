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
                    <h2>
                        <xsl:apply-templates
                            select="//tei:TEI//tei:seriesStmt/tei:title[@type = 'sub']"/>
                    </h2>
                </header>
                <nav id="sitenav">
                    <a href="index.html">Hem</a> | <a href="karleksbreven.html">Kärleksbreven</a> |
                        <a href="aktenskapsbreven.html">Äktenskapsbreven</a> | <a
                        href="carlsbrev.html">Breven från Carl</a> | <a href="historia.html"
                        >Historisk kontext</a> | <a href="personer.html">Personerna bakom breven</a>
                    | </nav>
                <nav id="brevnav">
                    <li class="year">År 1925</li>
                    <li>
                        <a href="Kb19251012GRE.html">12/10 Kärleksbrev från Greta</a>
                    </li>
                    <li>
                        <a href="Kb19251015GUS.html">15/10 Kärleksbrev från Gustaf</a>
                    </li>
                    <li>
                        <a href="Kb19251202GUS.html">2/12 Kärleksbrev från Gustaf</a>
                    </li>
                    <li>
                        <a href="Kb19251204GRE.html">4/12 Kärleksbrev från Greta</a>
                    </li>
                    <li>
                        <a href="Kb19251209GRE.html">9/12 Kärleksbrev från Greta</a>
                    </li>
                    <li>
                        <a href="Kb19251213GUS.html">13/12 Kärleksbrev från Gustaf</a>
                    </li>
                    <li>
                        <a href="Kb19251222GUS.html">22/12 Kärleksbrev från Gustaf</a>
                    </li>
                </nav>

                <main id="manuscript">
                    <!-- bootstrap "container" class makes the columns look pretty -->
                    <h3><xsl:apply-templates
                        select="//tei:TEI//tei:sourceDesc//tei:title"/></h3>
                    <div class="container">
                        <!-- define a row layout with bootstrap's css classes (two columns) -->

                        <div class="row">
                            <!-- first column: load the image based on the IIIF link in the graphic above -->

                            <div class="col-sm">

                                <article id="scan">

                                    <xsl:for-each select="//tei:surface[1]">

                                        <img width="600">
                                            <xsl:attribute name="src">
                                                <xsl:value-of select="tei:figure/tei:graphic/@url"/>
                                            </xsl:attribute>
                                            <xsl:attribute name="title">
                                                <xsl:value-of select="tei:figure/tei:label"/>
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
                                    <div class="litetbrev">
                                        <xsl:apply-templates
                                            select="//tei:TEI//tei:div[@n = 'sida1']"/>
                                    </div>
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

                                    <xsl:for-each select="//tei:surface[2]">
                                        <img width="600">
                                            <xsl:attribute name="src">
                                                <xsl:value-of select="tei:figure/tei:graphic/@url"/>
                                            </xsl:attribute>
                                            <xsl:attribute name="title">
                                                <xsl:value-of select="tei:figure/tei:label"/>
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
                                    
                                        <xsl:apply-templates
                                            select="//tei:TEI//tei:div[@n = 'sida2']"/>
                                    
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


                                    <xsl:for-each select="//tei:surface[3]">

                                        <img width="600">
                                            <xsl:attribute name="src">
                                                <xsl:value-of select="tei:figure/tei:graphic/@url"/>
                                            </xsl:attribute>
                                            <xsl:attribute name="title">
                                                <xsl:value-of select="tei:figure/tei:label"/>
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
                                   
                                        <xsl:apply-templates
                                            select="//tei:TEI//tei:div[@n = 'sida3']"/>
                                    
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


                                    <xsl:for-each select="//tei:surface[4]">

                                        <img width="600">
                                            <xsl:attribute name="src">
                                                <xsl:value-of select="tei:figure/tei:graphic/@url"/>
                                            </xsl:attribute>
                                            <xsl:attribute name="title">
                                                <xsl:value-of select="tei:figure/tei:label"/>
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
                                   
                                        <xsl:apply-templates
                                            select="//tei:TEI//tei:div[@n = 'sida4']"/>
                                    
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


                                    <xsl:for-each select="//tei:surface[5]">

                                        <img width="600">
                                            <xsl:attribute name="src">
                                                <xsl:value-of select="tei:figure/tei:graphic/@url"/>
                                            </xsl:attribute>
                                            <xsl:attribute name="title">
                                                <xsl:value-of select="tei:figure/tei:label"/>
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
                                    
                                        <xsl:apply-templates
                                            select="//tei:TEI//tei:div[@n = 'sida5']"/>
                                    
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


                                    <xsl:for-each select="//tei:surface[6]">

                                        <img width="600">
                                            <xsl:attribute name="src">
                                                <xsl:value-of select="tei:figure/tei:graphic/@url"/>
                                            </xsl:attribute>
                                            <xsl:attribute name="title">
                                                <xsl:value-of select="tei:figure/tei:label"/>
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

                                    <xsl:apply-templates select="//tei:TEI//tei:div[@n = 'sida6']"/>
                                </article>
                            </div>
                        </div>
                    </div>
                </main>
                <footer>
                    <div class="row" id="footer">
                        <div class="col-sm copyright">
                            <div>
                                <a href="https://creativecommons.org/licenses/by/4.0/legalcode">
                                    <img src="assets/img/logos/cc.svg" class="copyright_logo"
                                        alt="Creative Commons License"/>
                                    <img src="assets/img/logos/by.svg" class="copyright_logo"
                                        alt="Attribution 4.0 International"/>
                                </a>
                            </div>
                            <div> 2022 Hanna Lindbom och Malin Sandstedt </div>
                        </div>
                    </div>
                </footer>
                <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"/>
                <script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.3/dist/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"/>
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"/>
            </body>
        </html>
    </xsl:template>

    <!-- by default all text nodes are printed out, unless something else is defined.
    We don't want to show the metadata. So we write a template for the teiHeader that
    stops the text nodes underneath (=nested in) teiHeader from being printed into our
    html-->
    <xsl:template match="tei:teiHeader"/>


    <!-- turn tei linebreaks (lb) into html linebreaks (br) -->
    <xsl:template match="tei:lb">
        <br/>
    </xsl:template>
    <!-- not: in the previous template there is no <xsl:apply-templates/>. This is because there is nothing to
    process underneath (nested in) tei lb's. Therefore the XSLT processor does not need to look for templates to
    apply to the nodes nested within it.-->

    <!-- we turn the tei head element (headline) into an html h1 element-->
    <xsl:template match="tei:head">
        <h2>
            <xsl:apply-templates/>
        </h2>
    </xsl:template>


    <xsl:template match="tei:figure">
        <img src="{tei:graphic/@url}" alt="{tei:figDesc}"/>
    </xsl:template>

    <!-- transform tei paragraphs into html paragraphs -->
    <xsl:template match="tei:p">
        <p>
            <!-- apply matching templates for anything that was nested in tei:p -->
            <xsl:apply-templates/>
        </p>
    </xsl:template>

    <!-- transform tei del into html del -->
    <xsl:template match="tei:del">
        <s>
            <xsl:apply-templates/>
        </s>
    </xsl:template>

    <!-- transform tei add into html sup -->
    <xsl:template match="tei:add[@place = 'above']">
        <sup>
            <xsl:apply-templates/>
        </sup>
    </xsl:template>

    <!-- transform tei hi (highlighting) with the attribute @rend="ul" into html u elements -->
    <!-- how to read the match? "For all tei:hi elements that have a rend attribute with the value "u", do the following" -->
    <xsl:template match="tei:hi[@rend = 'ul']">
        <u>
            <xsl:apply-templates/>
        </u>
    </xsl:template>

    <xsl:template match="tei:emph[@rend = 'ul']">
        <u>
            <xsl:apply-templates/>
        </u>
    </xsl:template>

    <xsl:template match="tei:emph[@rend = 'ulx2']">
        <u>
            <span style=" text-decoration-line: underline; text-decoration-style: double">
                <xsl:apply-templates/>
            </span>
        </u>
    </xsl:template>
    <xsl:template match="tei:gap[@reason = 'illegible'][@quantity = '1'][@unit = 'word']">
        <span style="color: #888ad1">[oläsligt]</span>
    </xsl:template>

    <xsl:template match="tei:gap[@reason = 'illegible'][@quantity = '03'][@unit = 'char']">
        <span style="color: #888ad1">[oläsligt: 3 bokstäver]</span>
    </xsl:template>

    <xsl:template match="tei:damage[@agent = 'folding'][@type = 'hole']">
        <span style="color: #c4906c">[hål i papperet]</span>
    </xsl:template>

    <xsl:template match="tei:damage[@agent = 'folding'][@type = 'tear']">
        <span style="color: #c4906c">[reva i papperet]</span>
    </xsl:template>


    <xsl:template match="tei:seg[@type = 'leftMargin'][@subtype = 'sideways']">
        <br/>
        <br/>
        <div class="center">[VÄNSTERMARGINALEN]</div>
    </xsl:template>

    <xsl:template match="tei:seg[@type = 'upperMargin'][@subtype = 'upsideDown']">
        <br/>
        <br/>
        <div class="center">[ÖVRE MARGINALEN]</div>
    </xsl:template>

    <xsl:template match="tei:seg[@type = 'bottomMargin'][@subtype = 'normal']">
        <br/>
        <br/>
        <div class="center">[NEDRE MARGINALEN]</div>
    </xsl:template>

    <xsl:template match="tei:seg[@type = 'topLeftMargin'][@subtype = 'mixed']">
        <br/>
        <br/>
        <div class="center">[VÄNSTRA OCH ÖVRE MARGINALEN]</div>
    </xsl:template>

    <xsl:template match="tei:seg[@type = 'leftBottomMargin'][@subtype = 'mixed']">
        <br/>
        <br/>
        <div class="center">[VÄNSTRA OCH NEDRE MARGINALEN]</div>
    </xsl:template>

    <xsl:template match="tei:seg[@type = 'bottomRightMargin'][@subtype = 'mixed']">
        <br/>
        <br/>
        <div class="center">[NEDRE OCH HÖGRA MARGINALEN]</div>
    </xsl:template>



    <xsl:template match="tei:emph[@rend = 'circle']">
        <span style="border:1px solid black;border-radius:60%">
            <xsl:apply-templates/>
        </span>
    </xsl:template>


    <xsl:template match="tei:w[@rend = 'below']">
        <sub>
            <xsl:apply-templates/>
        </sub>
    </xsl:template>

    <xsl:template match="tei:w[@rend = 'above']">
        <sup>
            <xsl:apply-templates/>
        </sup>
    </xsl:template>

    <xsl:template match="tei:w[@rend = 'center']">
        <div class="center">
            <xsl:apply-templates/>
        </div>
    </xsl:template>

    <xsl:template match="tei:w[@rend = 'right']">
        <div class="right">
            <xsl:apply-templates/>
        </div>
    </xsl:template>

    <xsl:template match="tei:w[@rend = 'left']">
        <div class="left">
            <xsl:apply-templates/>
        </div>
    </xsl:template>

    <xsl:template match="tei:s[@rend = 'center']">
        <div class="center">
            <xsl:apply-templates/>
        </div>
    </xsl:template>

    <xsl:template match="tei:s[@rend = 'right']">
        <div class="right">
            <xsl:apply-templates/>
        </div>
    </xsl:template>

    <xsl:template match="tei:s[@rend = 'left']">
        <div class="left">
            <xsl:apply-templates/>
        </div>
    </xsl:template>

    <xsl:template match="tei:dateline[@rend = 'center']">
        <div class="center">
            <xsl:apply-templates/>
        </div>
    </xsl:template>

    <xsl:template match="tei:dateline[@rend = 'left']">
        <div class="left">
            <xsl:apply-templates/>
        </div>
    </xsl:template>

    <xsl:template match="tei:dateline[@rend = 'right']">
        <div class="right">
            <xsl:apply-templates/>
        </div>
    </xsl:template>

    <xsl:template match="tei:salute[@rend = 'center']">
        <div class="center">
            <xsl:apply-templates/>
        </div>
    </xsl:template>

    <xsl:template match="tei:salute[@rend = 'right']">
        <div class="right">
            <xsl:apply-templates/>
        </div>
    </xsl:template>

    <xsl:template match="tei:salute[@rend = 'left']">
        <div class="left">
            <xsl:apply-templates/>
        </div>
    </xsl:template>

    <xsl:template match="tei:sic">
        <span style="color: red">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    <xsl:template match="tei:corr">
        <sup>
            <span style="color: green">[<xsl:apply-templates/>]</span>
        </sup>
    </xsl:template>

    <xsl:template match="tei:metamark[@rend = 'line']"> _______ </xsl:template>

    <xsl:template match="tei:unclear">
        <xsl:apply-templates/>
        <span style="color: #888ad1">[?]</span>
    </xsl:template>



</xsl:stylesheet>
