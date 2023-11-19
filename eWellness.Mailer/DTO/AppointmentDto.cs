namespace eWellness.Mailer.DTO
{
    public class AppointmentDto
    {
        public DateTime StartTime { get; set; }
        public DateTime EndTime { get; set; }
        public string Notes { get; set; } = null!;
        public string Status { get; set; } = null!;
        public decimal TotalPrice { get; set; }
    }
}
