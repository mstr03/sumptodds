module Web
  module Controllers
    module Base
      class Index
        include Web::Action

        expose :teams

        def call(params)
          @teams = TeamRepository.new.all
        end
      end
    end
  end
end
