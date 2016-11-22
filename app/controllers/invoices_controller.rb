require 'date'

class InvoicesController < ApplicationController
	$x = nil
	$tipodefactura = nil;
	def viewInvoices
		if (current_user.admin)
			@receipt = Receipt.where("user_email = ?", params[:email])
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
			@tipodeFactura = $tipodefactura
		end
		# Parse the URI and retrieve it to a temporary file
	end
		#html output
		#html =  "Emisor: " + nombreEmisor + " RFC Emisor : " + rfcEmisor + "\n" +
		#		"Receptor: " + nombreReceptor + " RFC Receptor : " + rfcReceptor + "\n" +
		#		"Subtotal: " + subtotal + " IVA: " + iva + " Total: " + pagoTotal

		#extract the title from the articles
	def saveReceipt
		current_time = DateTime.now
		Receipt.create!(:concept => params[:tipofactura],
							:subtotal => params[:subtotal],
							:total => params[:pagototal],
							:iva => params[:iva],
							:xml => params[:rawxml],
							:users_id => current_user.id,
							:created_at => current_time,
							:updated_at => current_time,
							:user_email => current_user.email,
							:emisor => params[:emisor],
							:rfcEmisor => params[:rfcemisor],
							:receptor => params[:receptor],
							:rfcReceptor => params[:rfcreceptor])
		redirect_to action: 'viewInvoices' , email: current_user.email
	end

	def upload
		if !params[:receipt].nil?
			uploaded_io = params[:receipt][:factura]
			File.open(Rails.root.join('app/importers', 'uploads', uploaded_io.original_filename), 'wb') do |file|
			  file.write(uploaded_io.read)
			end
			$x = uploaded_io.original_filename
			$tipodefactura = params[:tipofactura]
			redirect_to action: 'index'
		end
	end
	
	def destroyReceipt
		@email = Receipt.where("id = ?", params[:id]).map(&:user_email)
		Receipt.find(params[:id]).destroy
		redirect_to action: 'viewInvoices' , email: @email[0]
	end


	def viewDetail
		@concepto = Receipt.where("id = ?", params[:id]).map(&:concept)
		@id = params[:id]
		@root = Receipt.where("id = ?", params[:id]).map(&:xml)
		@date = Receipt.where("id = ?", params[:id]).map(&:created_at)
		@emisor = Receipt.where("id = ?", params[:id]).map(&:emisor)
		@rfcEmisor = Receipt.where("id = ?", params[:id]).map(&:rfcEmisor)
		@receptor = Receipt.where("id = ?", params[:id]).map(&:receptor)
		@rfcReceptor = Receipt.where("id = ?", params[:id]).map(&:rfcReceptor)
		@subtotal = Receipt.where("id = ?", params[:id]).map(&:subtotal)
		@iva = Receipt.where("id = ?", params[:id]).map(&:iva)
		@total = Receipt.where("id = ?", params[:id]).map(&:total)
	end
end




