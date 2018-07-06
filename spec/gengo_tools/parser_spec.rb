RSpec.describe GengoTools::Parser do
  let(:parser) { GengoTools::Parser.new('spec/fixtures/files/translations') }
  describe '#translations' do
    it 'returns a map of translations' do
      expect(parser.translations).to eq({
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
      })
    end
  end
end
