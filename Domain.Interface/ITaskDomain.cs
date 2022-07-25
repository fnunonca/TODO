using System.Threading.Tasks;
using Task = Domain.Entity.Task;

namespace Domain.Interface
{
    public interface ITaskDomain
    {
        Task<int> Save(Task task);
    }
}
