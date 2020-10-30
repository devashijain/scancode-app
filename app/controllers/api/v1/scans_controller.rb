module Api
  module V1
    class ScansController < ApplicationController

      def index
        scans = Scan.order('created_at ASC');
        render json: {status: 'SUCCESS', message: 'Loaded scans', data: scans}, status: :ok
      end

      def create
        scan = Scan.new(scan_params)
        if scan.save
          render json: {status: 'SUCCESS', message: 'Scan Saved', data: scan}, status: :ok
        else
          render json: {status: 'ERROR', message: 'Scan not saved', data: scan.errors}, status: :unprocessable_entity
        end
      end

      private
      def scan_params
        params.permit(:invoice_number, :transporter_name)

      end

    end
  end
end
