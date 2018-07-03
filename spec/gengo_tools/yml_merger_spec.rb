RSpec.describe GengoTools::YmlMerger do
  WORKING_DIR = 'tmp/config/locales'.freeze

  describe '#merge' do
    let(:translations) do
      {
        'Energy Tax' => {
          'de' => 'Energiesteuer',
          'es-419' => 'Impuesto energético',
          'es' => 'Tasa energética',
          'fr' => 'Taxe sur l\'énergie',
          'fr-CA' => 'Taxe sur l\'énergie',
          'it' => 'Imposta sull\'Energia',
          'zh' => '能源税'
        },
        'Service Fee' => {
          'de' => 'Bearbeitungsgebühr',
          'es-419' => 'Tarifa de servicio',
          'es' => 'Tarifa del servicio',
          'fr' => 'Frais de service',
          'fr-CA' => 'Frais de service',
          'it' => 'Costi del servizio',
          'zh' => '服务费'
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
