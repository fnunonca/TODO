using System;

namespace Domain.Entity
{
    public class Task
    {
        public int id { get; set; }  
        public string description { get; set; }
        public int status { get; set; }
        public DateTime date_create { get; set; }
        public DateTime? date_finish { get; set; }
    }
}
