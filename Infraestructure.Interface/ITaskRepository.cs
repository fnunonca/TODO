using System.Threading.Tasks;
using Task = Domain.Entity.Task;

namespace Infraestructure.Interface
{
    public interface ITaskRepository
    {
        Task<int> Save(Task task);
    }
}
