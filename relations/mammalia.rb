# frozen_string_literal: true

require 'entities/mammalium'

class Mammalia < ROM::Relation[:ldap]
  schema '(objectclass=mammalia)', as: :mammalia, infer: true do
    attribute :cn,      Types::Strings.meta(index: true, alias: :common_name)
    attribute :study,   Types::Symbol.meta(index: true)
    attribute :species, Types::String

    use :timestamps, type: Types::Time, attributes: %i[
      create_timestamp
      modify_timestamp
    ]
  end

  struct_namespace Entities

  use :pagination
  use :auto_restrictions

  view(:by_class) do
    schema { project(:cn, :species) }
    relation { |klass| where { object_class == klass } }
  end

  def all
    operational.to_a
  end
end
