class Shrine
  module Plugins
    # The parsed_json plugin is suitable for the case when your framework is
    # automatically parsing JSON query parameters, allowing you to assign
    # cached files with hashes/arrays.
    #
    #     plugin :parsed_json
    module ParsedJson
      module AttacherMethods
        def assign(value)
          if value.is_a?(Hash) && value.keys.any? { |key| key.is_a?(String) }
            assign(value.to_json)
          else
            super
          end
        end
      end
    end

    register_plugin(:parsed_json, ParsedJson)
  end
end
