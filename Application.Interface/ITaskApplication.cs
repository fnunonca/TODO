using System.Threading.Tasks;
using Application.DTO.request;

namespace Application.Interface
{
    public interface ITaskApplication
    {
        Task<int> Save(RequestTaskDto request);
    }
}
