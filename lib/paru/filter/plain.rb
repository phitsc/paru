module Paru
    module PandocFilter
        require_relative "./block"

        class Plain < Block
            def initialize contents
                super contents, true
            end
        end
    end
end