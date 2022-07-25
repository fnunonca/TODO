using System;

namespace Application.DTO.response
{
    public class ResponseTaskDto
    {
        public int id { get; set; }
        public string description { get; set; }
        public int status { get; set; }
        public DateTime date_create { get; set; }
        public DateTime? date_finish { get; set; }
    }
}
