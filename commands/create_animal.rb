# frozen_string_literal: true

class CreateAnimal < ROM::Commands::Create[:ldap]
  relation :fauna
  register_as :create
end
