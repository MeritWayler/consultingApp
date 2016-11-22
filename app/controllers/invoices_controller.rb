class InvoicesController < ApplicationController
	$x = nil
	def viewInvoices
		if (current_user.admin)
			@receipt = Receipt.all
		else
			@receipt = Receipt.where("user_email = ?", current_user.email)
		end
	end
	def index
		if !$x.nil?
			xml_file = File.read("app/importers/uploads/" + $x)
			doc = Nokogiri::XML.parse(xml_file)
			@root = doc.root
			receptor = doc.xpath('//cfdi:Receptor')
			emisor = doc.xpath('//cfdi:Emisor')
			total = doc.xpath('//cfdi:Comprobante')
			impuestos = doc.xpath('//cfdi:Traslado')
			@nombreEmisor = emisor[0]["nombre"]
			@rfcEmisor = emisor[0]["rfc"]
			@nombreReceptor = receptor[0]["nombre"]
			@rfcReceptor = receptor[0]["rfc"]
			@subtotal = total[0]["subTotal"]
			@iva = impuestos[0]["importe"]
			@pagoTotal = total[0]["total"]
		end
		# Parse the URI and retrieve it to a temporary file
	end
		#html output
		#html =  "Emisor: " + nombreEmisor + " RFC Emisor : " + rfcEmisor + "\n" +
		#		"Receptor: " + nombreReceptor + " RFC Receptor : " + rfcReceptor + "\n" +
		#		"Subtotal: " + subtotal + " IVA: " + iva + " Total: " + pagoTotal

		#extract the title from the articles
	def saveReceipt
		
	end

	def upload
		if !params[:receipt].nil?
			uploaded_io = params[:receipt][:factura]
			File.open(Rails.root.join('app/importers', 'uploads', uploaded_io.original_filename), 'wb') do |file|
			  file.write(uploaded_io.read)
			end
			$x = uploaded_io.original_filename
			redirect_to action: 'index'
		end
	end

	def viewDetail
		@total = Receipt.where("id = ?", params[:id]).map(&:total)
		@emisor = Receipt.where("id = ?", params[:id]).map(&:user_email)	
		@id = Receipt.where("id = ?", params[:id]).map(&:id)
	end
end




