module LessonHelper
    def tiny_format(text)
        h(text).gsub("\n","<br />").html_safe
    end

    def price_with_tax(p)
        return (p*1.08).floor
    end
end