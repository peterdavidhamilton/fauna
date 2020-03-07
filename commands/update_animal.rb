# frozen_string_literal: true

class UpdateAnimal < ROM::Commands::Update[:ldap]
  relation :fauna
  result :one
  register_as :update
end
