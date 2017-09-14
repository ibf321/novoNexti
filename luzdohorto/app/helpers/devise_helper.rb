module DeviseHelper
  def devise_error_messages!
    return '' if resource.errors.empty?

    messages = resource.errors.full_messages.map { |msg| content_tag(:li, msg) }.join
    html = <<-HTML
    <center>
      <div class="alert alert-danger alert-dismissible fade show" role="alert" style="width: 700px;">
        <button type="button" class="close" data-dismiss="alert">
          <span aria-hidden="true">&times;</span>
        </button>
        <strong>
         #{pluralize(resource.errors.count, "erro(s)")} encontrado(s)
        </strong>
        #{messages}
      </div>
    </center
    HTML

    html.html_safe
  end
end