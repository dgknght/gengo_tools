RSpec.describe GengoTools::YmlMerger do
  WORKING_DIR = 'tmp/config/locales'.freeze

  describe '#merge' do
    let(:translations) do
      {
        'en' => {
          'energy_tax' => 'Energy Tax',
          'service_fee' => 'Service Fee'
        },
        'de' => {
          'energy_tax' => 'Energiesteuer',
          'service_fee' => 'Bearbeitungsgebühr'
        },
        'es-419' => {
          'energy_tax' => 'Impuesto energético',
          'service_fee' => 'Tarifa de servicio'
        },
        'es' => {
          'energy_tax' => 'Tasa energética',
          'service_fee' => 'Tarifa del servicio'
        },
        'fr' => {
          'energy_tax' => 'Taxe sur l\'énergie',
          'service_fee' => 'Frais de service'
        },
        'fr-CA' => {
          'energy_tax' => 'Taxe sur l\'énergie',
          'service_fee' => 'Frais de service'
        },
        'it' => {
          'energy_tax' => 'Imposta sull\'Energia',
          'service_fee' => 'Costi del servizio'
        },
        'zh' => {
          'energy_tax' => '能源税',
          'service_fee' => '服务费'
        }
      }
    end

    before do
      FileUtils.mkdir_p WORKING_DIR
      FileUtils.cp Dir['spec/fixtures/files/config/locales/*'], WORKING_DIR
    end

    after do
      #FileUtils.rm_rf 'tmp/config'
    end

    it 'rewrites the i18n files with the specified translations added in' do
      GengoTools::YmlMerger.new(dir: WORKING_DIR, key_path: ['fees_and_taxes']).merge(translations)
      expect(File.read('tmp/config/locales/es.yml')).to eq <<-EOS
---
es:
  fees_and_taxes:
    sales_tax: Impuestos de Ventas
    energy_tax: Tasa energética
    service_fee: Tarifa del servicio
      EOS
    end
  end
end
