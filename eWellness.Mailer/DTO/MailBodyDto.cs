namespace eWellness.Mailer.DTO
{
    public class MailBodyDto
    {
        public UserDto user { get; set; } = null!;
        public AppointmentDto? appointment { get; set; } 
    }
}
