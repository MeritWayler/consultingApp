require 'open-uri'
class InvoicesController < ApplicationController
	def viewInvoices
	end
	def index
		# Parse the URI and retrieve it to a temporary file
		xml_file = File.read("F0000000047.xml")
		doc = Nokogiri::XML.parse(xml_file)
		root = doc.root
		receptor = doc.xpath('//cfdi:Receptor')
		emisor = doc.xpath('//cfdi:Emisor')
		total = doc.xpath('//cfdi:Comprobante')
		impuestos = doc.xpath('//cfdi:Traslado')

		nombreEmisor = emisor[0]["nombre"]
		rfcEmisor = emisor[0]["rfc"]
		nombreReceptor = receptor[0]["nombre"]
		rfcReceptor = receptor[0]["rfc"]
		subtotal = total[0]["subTotal"]
		iva = impuestos[0]["importe"]
		pagoTotal = total[0]["total"]
		#html output
		html =  "Emisor: " + nombreEmisor + " RFC Emisor : " + rfcEmisor + "\n" +
				"Receptor: " + nombreReceptor + " RFC Receptor : " + rfcReceptor + "\n" +
				"Subtotal: " + subtotal + " IVA: " + iva + " Total: " + pagoTotal

		#extract the title from the articles
		render :text => html,:content_type => "text/plain"
	end
end
