class Member < ApplicationRecord
    class << self
        def search(query,man,lady)
          rel = order("number")
          if query.present?
            rel = rel.where("name LIKE ? OR full_name LIKE ?",
              "%#{query}%", "%#{query}%")
          end
          if(lady=="1")
            if(man!="1")
              rel=rel.where(sex:2)
            end
          elsif(man=="1")
            rel=rel.where(sex:1)
          end
          rel
        end
      end
end
