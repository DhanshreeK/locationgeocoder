task whatever: :environment do
  location = Location.last.update(latitude: '19.072464', longitude: '72.867447', address: 'Mumbai')
end

