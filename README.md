# wysiwygDITA: Rendering DITA in the Browser

A presentation of this project was given at CIDM DITA North America 2015, and is included here.

# Acknowledgements
Based on the work of:
* David Holroyd, Michael Thiele
* wysiwygDocBook
* oXygenXML CSS

# Benefits
There are several benefits to a browser-based rendering approach. There is no additional publishing workflow needed! Simply load the DITA or DocBook XML directly onto the web server along with the stylesheets and then link to the document. It enables responsive design, so that it is visible and properly scaled on any device, and takes advantages of the particular devices using media queries. It also enables content re-use, since the content can be assembled from individual content components. By removing the transformation/publishing workflow, files can be updated on the server without delay. This approach is supported in all modern browsers, including those on mobile devices.

# Caveats
Due to browser security designs to prevent malicious code from running on a local machine, you cannot “Open… File…” directly from your desktop. Rather, the content must be hosted on a web server. For the purposes of my demos today, I’m actually running the built-in Apache server for Mac. The other caveat is that the xml documents MUST include the proper XML processing instruction to reference the stylesheets. Also, due to the direct nature of this approach, complex processing cannot be carried out (or at least I have not invested enough time to get this working yet), so nested maps do not work, nor can you perform complex conref or keyref resolution.

# Production example
For a real world example of dynamic browser-based rendering, you can point your mobile device, tablet or computer browser to the http://www.onvif.org website. It takes a bit of navigating, but if you pick a product from one of the Profile Products (Profile G is the newest), you will see a link to the ONVIF Interface Guide. This guide is required by ONVIF for all manufacturers that want to claim compliance to the standard. This guide must also conform to the DocBook standard. If you view one of these guides, you will see the information presented directly in your browser in human-readable form. If you have a way to “view source” on that document, however, you can see that it is DocBook XML – transformed directly on your client device! This project uses the same approach, but using DITA markup.

#Usage
Include the following xml-stylesheet reference in your ditamap: 
<?xml-stylesheet href="dita-specsheet-styles/dita.xsl" type="text/xsl" ?>

The dita.xsl file contains templates for processing both topics and maps. In order to properly transform the DITA elements in a map, the stylesheet must use the xsl:document function to pull in the content from the individual topicrefs, then copy those nodes to the DOM or document tree. Since the stylesheet is transforming some elements to their direct HTML equivalents, the transform needs to exclude those elements from being directly copied over.

CSS styles can be applied by the browser to the individual elements. You can get as specific as you would like for styling particular patterns of element structures.


