# frozen_string_literal: true

class DeleteAnimal < ROM::Commands::Delete[:ldap]
  relation :fauna
  result :one
  register_as :delete
end
