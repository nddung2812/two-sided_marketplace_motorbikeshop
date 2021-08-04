module PostsHelper
    def render_buy_button(current_user, post)
        if current_user
          button = "<button data-stripe=\"payment\" class='btn btn-primary p-3'> Buy: $<%=#{@post.price}%></button>"
        else
          button = "<button class=\"btn btn-primary\" disabled>Log In to Buy</button>"
        end
        return button.html_safe
    end
end
