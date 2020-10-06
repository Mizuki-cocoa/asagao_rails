class Member < ApplicationRecord
    class << self
      def search(query,man,lady)
        rel = order("number")
        if query.present?
          rel = rel.where("name LIKE ? OR full_name LIKE ?",
          "%#{query}%", "%#{query}%")
        end

        if (man=="1")
          if (lady!="1")
            rel =rel.where(sex: 1)
          end
        elsif (lady=="1")
          rel =rel.where(sex: 2)
        end
        
        #   if (@params_man.present?)
        #     if (@param_lady.blank?)
        #       @members =@members.where(sex: 1) 
        #     end
        # elsif (@param_lady.present?)
        #   @members =@members.where(sex: 2)
        # end
        rel
      end
    end
  end