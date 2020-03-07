# frozen_string_literal: true

require 'changesets/new_animal'

class Fauna < ROM::Relation[:ldap]
  schema '(species=*)', as: :fauna, infer: true
end
