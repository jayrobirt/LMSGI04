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
                
                <section class="festival">
                    <h1>Festivales de rock</h1>
                    <table>
                        <tr>
                            <th>FESTIVAL</th>
                            <th>CONCIERTO</th>
                            <th>FECHA</th>
                            <th>HORA</th>
                            <th>LUGAR</th>
                        </tr>
                        
                        <xsl:apply-templates select="./festival/conciertos/concierto[grupo/@tipomusica='rock']"></xsl:apply-templates>
                        
                    </table>
                </section>
                <footer>
                    <address>&#169; 2020 desarrollado por info@birt.eus</address>
                </footer>
            </body>
        </html>
    </xsl:template>
    <xsl:template match="concierto">
        <tr>
            <td><xsl:value-of select='../../nombrefesti'/></td>
            <td><xsl:value-of select='./grupo'/></td>
            <td><xsl:value-of select="./fecha"/></td>
            <td><xsl:value-of select="./hora"/></td>
            <td><xsl:value-of select="../../lugar"/></td>
        </tr>  
    </xsl:template>	
</xsl:stylesheet>