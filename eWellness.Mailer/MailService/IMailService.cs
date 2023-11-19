using eWellness.Mailer.DTO;

namespace eWellness.Mailer.MailService
{
    public interface IMailService
    {
        bool SendMail(MailData mailData);
    }
}
