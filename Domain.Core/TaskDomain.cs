using Domain.Interface;
using Infraestructure.Interface;
using System.Threading.Tasks;
using Task = Domain.Entity.Task;

namespace Domain.Core
{
    public class TaskDomain : ITaskDomain
    {
        private readonly ITaskRepository _taskRepository;
        public TaskDomain(ITaskRepository taskRepository)
        {
            _taskRepository = taskRepository;
        }

        public async Task<int> Save(Task task)
        {
            return await _taskRepository.Save(task);
        }

    }
}
