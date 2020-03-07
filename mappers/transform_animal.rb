# frozen_string_literal: true

require 'rom/transformer'

class TransformAnimal < ROM::Transformer
  relation    :animals
  register_as :classification

  map_array do
    rename_keys modify_timestamp: :updated_at,
                create_timestamp: :created_at

    nest :taxonomy, %i[species order family genus]
    nest :status,   %i[extinct endangered population_count]
    nest :info,     %i[labeled_uri description cn]
  end
end
