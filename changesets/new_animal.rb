# frozen_string_literal: true

class NewAnimal < ROM::Changeset::Create[:fauna]
  map do |tuple|
    {
      dn: "cn=#{tuple[:cn]},ou=fauna,#{ENV['LDAPBASE']}",
      extinct: true,
      **tuple
    }
  end
end
