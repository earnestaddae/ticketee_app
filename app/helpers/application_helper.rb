module ApplicationHelper
  # generates dynamic page title
  def title(*parts)
    unless parts.empty?
      content_for :title do
        (parts << "TicketeeApp").join(" - ")
      end
    end
  end

  # admins only block

  def admins_only(&block)
    block.call if current_user.try(:admin?)
  end
end
