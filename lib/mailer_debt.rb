class MailerDebt
  def perform
    @debts = Debt.all
    @debts.each do |debt|
      DebtMailer.delay.debt_email(debt, Friend.find_by_name(debt.from))
    end

    Delayed::Job.enqueue(MailerDebt.new, :run_at => Time.zone.now.at_midnight + 24.hours)
  end
end
