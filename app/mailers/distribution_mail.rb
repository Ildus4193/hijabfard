class DistributionMail < ActionMailer::Base
  default :from => "ildus523@mail.ru"

  def mail_distribution(distribution)
    @distributions = distribution
    @url = "http://hijab-fard.ru"
    mail(:to => distribution.email, :subject => 'Thank you!!!')

  end
end
