#--
# Copyright 2015, 2016, 2017 Huub de Beer <Huub@heerdebeer.org>
#
# This file is part of Paru
#
# Paru is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# Paru is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with Paru.  If not, see <http://www.gnu.org/licenses/>.
#++
require_relative "./block.rb"
require_relative "./attr.rb"
require_relative "./inner_markdown.rb"

module Paru
    module PandocFilter
        # A Div node consisting of an attribute object and a list of Block nodes.
        class Div < Block
            include InnerMarkdown

            # Create a new Div node based on the contents
            #
            # @param contents [Array] an array containing the attribute object
            #   and the contents of this div.
            def initialize(contents)
                @attr = Attr.new contents[0]
                super contents[1]
            end

            # Create an AST representation of this Div node.
            def ast_contents()
                [
                    @attr.to_ast,
                    super
                ]
            end

            # Has this Div node Blocks as children?
            #
            # @return [Boolean] true
            def has_block?
                true
            end
        end
    end
end
