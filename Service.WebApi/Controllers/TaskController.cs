using System.Threading.Tasks;
using Application.DTO.request;
using Application.Interface;
using Microsoft.AspNetCore.Mvc;

namespace Service.WebApi.Controllers
{
    [Route("v1/[controller]")]
    [ApiController]
    public class TaskController : ControllerBase
    {
        private readonly ITaskApplication _taskApplication;

        public TaskController(ITaskApplication taskApplication)
        {
            _taskApplication = taskApplication;
        }

        [Route("Save")]
        [HttpPost]
        public async Task<IActionResult> Save(RequestTaskDto requestTaskDto)
        {
            var response = await _taskApplication.Save(requestTaskDto);
            return Ok(response);
        }
    }
}
