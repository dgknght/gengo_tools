require 'active_support'
require 'active_support/core_ext'

RSpec.describe GengoTools::Parser do
  let(:parser) { GengoTools::Parser.new('spec/fixtures/files') }
  describe '#translations' do
    it 'returns a map of translations' do
      expect(parser.translations).to eq({
        'Energy Tax' => {
          'de-DE' => 'Energiesteuer',
          'es-419' => 'Impuesto energético',
          'es-ES' => 'Tasa energética',
          'fr-FR' => 'Taxe sur l\'énergie',
          'fr-CA' => 'Taxe sur l\'énergie',
          'it-IT' => 'Imposta sull\'Energia',
          'zh-CN' => '能源税'
        },
        'Service Fee' => {
          'de-DE' => 'Bearbeitungsgebühr',
          'es-419' => 'Tarifa de servicio',
          'es-ES' => 'Tarifa del servicio',
          'fr-FR' => 'Frais de service',
          'fr-CA' => 'Frais de service',
          'it-IT' => 'Costi del servizio',
          'zh-CN' => '服务费'
        }
      })
    end
  end
end
