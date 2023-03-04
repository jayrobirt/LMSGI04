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
                
                <main>
                    <xsl:variable name="name">Eneko</xsl:variable>
                    <!-- Seleccionamos los restaurantes que tienen como nombre el valor de la variable "name" -->
                    <xsl:for-each select="./restaurante[nombrerestaurante=$name]">
                        <h1><a href= "{./informacion}"><xsl:value-of select='$name' /></a>- <xsl:value-of select='./ciudad' /></h1>
                        <!-- Seleccionamos los menus -->
                        <xsl:for-each select="./menu">
                            <article class="restaurante">
                                <h3><xsl:value-of select="./@tipo" /></h3> 
                                <!-- Seleccionamos los platos -->
                                <xsl:for-each select="./plato ">
                                    <p><xsl:value-of select="." /></p>
                                </xsl:for-each> 
                            </article>
                        </xsl:for-each>
                    </xsl:for-each>
                </main>
                
                <footer>
                    <address>&#169; 2020 desarrollado por info@birt.eus</address>
                </footer>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>