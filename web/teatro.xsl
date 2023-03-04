<?xml version="1.0" encoding="UTF-8"?>
<!--
     Modulo: Lenguaje de marcas y sistemas de gestión de la información
     Tarea: LMSGI04 Tarea evaluativa 2. XSLT. (60%)
     Unidad Didactica: UD04 -Transformación de datos (20%)
     Autor: Jayro Bernal Arcauz
     Fecha: 04/03/2023
     Autoevaluación: https://docs.google.com/document/d/1QaQpyNml_6Vp3R3BcOxLzYcWduSJdM0Bs_gE_lPkD6I/edit?usp=share_link
-->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    <xsl:output encoding="uft-8"/>
    <xsl:template match="/reservaeventos">
        
        <html lang="es">
            
            <head>
                <link href="../css/estilo.css" rel="stylesheet" type="text/css" />
                <meta charset="utf-8"/>
                <meta name="description" content="Página principal" />
                <title>titulo de la web</title>
            </head>
            
            <body>
                <header>
                    <img src= "../img/logotipo.png" alt= "Reservas" />
                    <a href="teatro.xml">Teatro</a>
                    <a href="restaurante.xml">Restaurante</a>
                    <a href="festival.xml">Festival</a>
                </header>
                
                <main class="principal">
                    <section class="teatro">
                        <h1>PROXIMAS OBRAS DE TEATRO</h1>
                        <xsl:variable name="date" select="//fechahora/@hora" />
                        <ul>
                            <!-- Seleccionamos los teatros -->
                            <xsl:for-each select="//teatro">
                                <xsl:sort select="./fechahora/@dia" order="descending" />
                                <!-- Identificamos los teatros cuyo precio sea menor a 20 -->
                                <xsl:if test="./precio &lt; 20.0">
                                    <li><u><xsl:value-of select='./fechahora/@dia' />: <xsl:value-of select='./obra' /></u></li>
                                </xsl:if>
                                <!-- Identificamos los teatros cuyo precio sea mayor a 20 -->
                                <xsl:if test="./precio &gt; 20.0">
                                    <li><xsl:value-of select='./fechahora/@dia' />: <xsl:value-of select='./obra' /></li>
                                </xsl:if>
                            </xsl:for-each>
                        </ul>
                    </section>
                </main>
                
                <footer> 
                    <address>&#169; 2020 desarrollado por info@birt.eus</address>
                </footer>
            </body>
        </html>    
    </xsl:template>
</xsl:stylesheet>