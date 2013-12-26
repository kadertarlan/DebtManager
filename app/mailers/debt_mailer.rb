class DebtMailer < ActionMailer::Base
  default from: "tugcemyalcin@gmail.com"

  def debt_email(debt, friend)
    @debt = debt
    @friend = friend
    mail(to: @friend.email, subject: 'Hic para vermiyon yine')
  end
end
