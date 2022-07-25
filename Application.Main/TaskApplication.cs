using System;
using System.Threading.Tasks;
using Application.Interface;
using Domain.Entity;
using Domain.Interface;
using Application.DTO.request;
using Task = Domain.Entity.Task;

namespace Application.Main
{
    public class TaskApplication: ITaskApplication
    {
        private readonly ITaskDomain _taskDomain;
        public TaskApplication(ITaskDomain taskDomain)
        {
            _taskDomain = taskDomain;
        }

        public async Task<int> Save(RequestTaskDto request)
        {
            try
            {
                Task task = new Task
                {
                    description = request.description
                };

                int id = await _taskDomain.Save(task);
                return id;
            }
            catch (Exception e)
            {
                Console.WriteLine(e);
                throw;
            }
        }
    }
}
