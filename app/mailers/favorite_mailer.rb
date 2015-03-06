class FavoriteMailer < ActionMailer::Base
  default from: "norfleet.phillip@gmail.com"

  def new_comment(user, post, comment)

    # New Headers
    headers["Message-ID"] = "<comments/#{comment.id}@norfleet-bloccit.example>"
    headers["In-Reply-To"] = "<post/#{post.id}@norfleet-bloccit.example>"
    headers["References"] = "<post/#{post.id}@norfleet-bloccit.example>"

    @user = user
    @post = post
    @comment = comment

    mail(to: user.email, subject: "New comment on #{post.title}")
  end
end
