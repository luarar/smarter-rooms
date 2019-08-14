# frozen_string_literal: true

DATA = {
  user_keys: %w[name birthdate email password is_admin],
  users: [
    ['Admin', '1993-07-18 00:00:00', 'admin@ibm.com', '12345678', true]
  ],

  room_keys: %w[name code floor capacity building_id],
  rooms: [
    ['Amanecer', 'A101', '1', 4, 1],
    ['Bermejo', 'A102', '1', 6, 1],
    ['Buenos Aires', 'A103', '1', 8, 1],
    ['Embarcadero', 'A104', '1', 12, 1],
    ['Envisioning1', 'A105', '1', 4, 1],
    ['Envisioning2', 'A106', '1', 4, 1],
    ['Humboldt', 'A107', '1', 8, 1],
    ['Plaza de Mayo', 'A108', '1', 8, 1],
    ['Pumahuasi', 'A109', '1', 12, 1],
    ['Reflejos', 'A110', '1', 6, 1],
    ['República', 'A111', '1', 6, 1],
    ['Maymara', 'A112', '1', 4, 1],
    ['Yatch Club', 'A113', '1', 4, 1],
    ['Educación', 'A114', '1', 40, 1],
    ['Riachuelo', 'A201', '1', 6, 1],
    ['Tarija', 'A202', '1', 8, 1],
    ['Darsena Norte', 'A203', '1', 12, 1],
    ['Puerto Madero', 'A204', '1', 12, 1],
    ['Picasso', 'A205', '1', 10, 1],
    ['Van Gogh', 'A206', '1', 4, 1],
    ['Belgrano', 'A207', '1', 6, 1]

  ],

  building_keys: %w[name lat long adress],
  buildings: [
    ['IBM Catalinas', -34.5960967, -58.3714476, 'Ing Enrique Butty 275, C1001AFA CABA'],
    ['IBM Martinez', -34.5007655, -58.5260895, 'Hipólito Yrigoyen 2149, B1640HFQ Martínez, Buenos Aires']

  ],

  good_keys: ['name'],
  goods: [
    ['Proyector']
  ]
}.freeze

def main
  make_users
  make_rooms
  make_buildings
  make_goods
end

def make_users
  DATA[:users].each do |user|
    new_user = User.new
    user.each_with_index do |attribute, i|
      new_user.send(DATA[:user_keys][i] + '=', attribute)
    end
    new_user.save
  end
end

def make_rooms
  DATA[:rooms].each do |room|
    new_room = Room.new
    room.each_with_index do |attribute, i|
      new_room.send(DATA[:room_keys][i] + '=', attribute)
    end
    new_room.save
  end
end

def make_buildings
  DATA[:buildings].each do |building|
    new_building = Building.new
    building.each_with_index do |attribute, i|
      new_building.send(DATA[:building_keys][i] + '=', attribute)
    end
    new_building.save
  end
end

def make_goods
  DATA[:goods].each do |good|
    new_good = Good.new
    good.each_with_index do |attribute, i|
      new_good.send(DATA[:good_keys][i] + '=', attribute)
    end
    new_good.save
  end
end

main
