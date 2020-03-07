# frozen_string_literal: true

require 'rom/struct'

module Entities
  class Mammalium < ROM::Struct
    transform_types(&:omittable)

    def common_name
      cn.first.upcase
    end

    def website
      labeled_uri&.first
    end

    def extant?
      !extinct
    end

    def extinct?
      extinct
    end

    def description
      self[:description].join("\n") unless description?
    end

    def description?
      @attributes[:description].nil?
    end

    def to_s
      <<~CARD
        #{common_name}
        -----------------
        #{description}
        -----------------
        #{website}

      CARD
    end
  end
end
