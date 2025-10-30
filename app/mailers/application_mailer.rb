# app/mailers/application_mailer.rb
class ApplicationMailer < ActionMailer::Base
  default from: ENV.fetch("MAIL_FROM", "no-reply@yourdomain.com")
  layout "mailer"
end
