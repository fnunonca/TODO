using System;
using System.Data;
using System.Threading.Tasks;
using Dapper;
using Infraestructure.Interface;
using Transversal.Common;
using Task = Domain.Entity.Task;

namespace Infraestructure.Repository
{
    public class TaskRepository: ITaskRepository
    {
        private readonly IConnectionFactory _connectionFactory;
        public TaskRepository(IConnectionFactory connectionFactory)
        {
            _connectionFactory = connectionFactory;
        }

        public async Task<int> Save(Task task)
        {
            using var connection = _connectionFactory.GetConnection;
            const string query = "taskInsert";
            var parameters = new DynamicParameters();
            parameters.Add("id", dbType: DbType.Int32 , direction: ParameterDirection.Output);
            parameters.Add("description", task.description);
            parameters.Add("status", task.status);
            parameters.Add("date_create", DateTime.Now);
            parameters.Add("date_finish", null);

            var token = await connection.QueryFirstOrDefaultAsync<int>(query, param: parameters, commandType: System.Data.CommandType.StoredProcedure);
            int id = parameters.Get<int>("id");
            return token;
        }
    }
}
