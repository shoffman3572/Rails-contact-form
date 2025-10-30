class ContactMailer < ApplicationMailer
  default to: ENV.fetch("CONTACT_TO_EMAIL", "you@example.com"),
          from: ENV.fetch("MAIL_FROM", "no-reply@yourdomain.com")

  def new_message(contact)
    @contact = contact
    mail(
      subject: "New contact from #{@contact.name} <#{@contact.email}>",
      reply_to: @contact.email.presence || ENV["MAIL_FROM"]
    )
  end
end
