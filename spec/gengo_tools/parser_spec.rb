RSpec.describe GengoTools::Parser do
  let(:parser) { GengoTools::Parser.new('spec/fixtures/files/translations') }
  describe '#translations' do
    it 'returns a map of translations' do
      expect(parser.translations).to eq({
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
      })
    end
  end
end
