dotnet new sln -n Todo

dotnet new classlib -o Infraestructure.Data -f netcoreapp3.1
dotnet new classlib -o Infraestructure.Interface -f netcoreapp3.1
dotnet new classlib -o Infraestructure.Repository -f netcoreapp3.1
dotnet sln Todo.sln add Infraestructure.Data\Infraestructure.Data.csproj --solution-folder '01 Infraestructure'
dotnet sln Todo.sln add Infraestructure.Interface\Infraestructure.Interface.csproj --solution-folder '01 Infraestructure'
dotnet sln Todo.sln add Infraestructure.Repository\Infraestructure.Repository.csproj --solution-folder '01 Infraestructure'

dotnet new classlib -o Domain.Core -f netcoreapp3.1
dotnet new classlib -o Domain.Entity -f netcoreapp3.1
dotnet new classlib -o Domain.Interface -f netcoreapp3.1
dotnet sln Todo.sln add Domain.Core\Domain.Core.csproj --solution-folder '02 Domain'
dotnet sln Todo.sln add Domain.Entity\Domain.Entity.csproj --solution-folder '02 Domain'
dotnet sln Todo.sln add Domain.Interface\Domain.Interface.csproj --solution-folder '02 Domain'

dotnet new classlib -o Application.DTO -f netcoreapp3.1
dotnet new classlib -o Application.Interface -f netcoreapp3.1
dotnet new classlib -o Application.Main -f netcoreapp3.1
dotnet sln Todo.sln add Application.DTO\Application.DTO.csproj --solution-folder '03 Application'
dotnet sln Todo.sln add Application.Interface\Application.Interface.csproj --solution-folder '03 Application'
dotnet sln Todo.sln add Application.Main\Application.Main.csproj --solution-folder '03 Application'

dotnet new webapi -o Service.WebApi -f netcoreapp3.1
dotnet sln Todo.sln add Service.WebApi\Service.WebApi.csproj --solution-folder '04 Service'

dotnet new classlib -o Transversal.Common -f netcoreapp3.1
dotnet new classlib -o Transversal.Logging -f netcoreapp3.1
dotnet sln Todo.sln add Transversal.Common\Transversal.Common.csproj --solution-folder '05 Transversal'
dotnet sln Todo.sln add Transversal.Logging\Transversal.Logging.csproj --solution-folder '05 Transversal'

dotnet new mstest -o Test -f netcoreapp3.1
dotnet sln Todo.sln add Test\Test.csproj --solution-folder '06 Test'

dotnet add infraestructure.Data\infraestructure.Data.csproj reference Transversal.Common\Transversal.Common.csproj
dotnet add infraestructure.Interface\infraestructure.Interface.csproj reference Domain.Entity\Domain.Entity.csproj
dotnet add infraestructure.Repository\infraestructure.Repository.csproj reference Infraestructure.Data\Infraestructure.Data.csproj
dotnet add infraestructure.Repository\infraestructure.Repository.csproj reference Infraestructure.Interface\Infraestructure.Interface.csproj

dotnet add Domain.Core\Domain.Core.csproj reference Domain.Entity\Domain.Entity.csproj
dotnet add Domain.Core\Domain.Core.csproj reference Domain.Interface\Domain.Interface.csproj
dotnet add Domain.Core\Domain.Core.csproj reference Infraestructure.Interface\Infraestructure.Interface.csproj
dotnet add Domain.Interface\Domain.Interface.csproj reference Domain.Entity\Domain.Entity.csproj

dotnet add Application.Interface\Application.Interface.csproj reference Application.DTO\Application.DTO.csproj
dotnet add Application.Interface\Application.Interface.csproj reference Transversal.Common\Transversal.Common.csproj
dotnet add Application.Main\Application.Main.csproj reference Application.DTO\Application.DTO.csproj
dotnet add Application.Main\Application.Main.csproj reference Application.Interface\Application.Interface.csproj
dotnet add Application.Main\Application.Main.csproj reference Domain.Entity\Domain.Entity.csproj
dotnet add Application.Main\Application.Main.csproj reference Domain.Interface\Domain.Interface.csproj

dotnet add Service.WebApi\Service.WebApi.csproj reference Application.DTO\Application.DTO.csproj
dotnet add Service.WebApi\Service.WebApi.csproj reference Application.Interface\Application.Interface.csproj
dotnet add Service.WebApi\Service.WebApi.csproj reference Application.Main\Application.Main.csproj
dotnet add Service.WebApi\Service.WebApi.csproj reference Transversal.Logging\Transversal.Logging.csproj

dotnet add Transversal.Logging\Transversal.Logging.csproj reference Transversal.Common\Transversal.Common.csproj

dotnet add Test\Test.csproj reference Application.DTO\Application.DTO.csproj
dotnet add Test\Test.csproj reference Application.Interface\Application.Interface.csproj
dotnet add Test\Test.csproj reference Application.Main\Application.Main.csproj
dotnet add Test\Test.csproj reference Transversal.Logging\Transversal.Logging.csproj

dotnet add Infraestructure.Data  package Microsoft.Extensions.Configuration
dotnet add Infraestructure.Data  package System.Data.SqlClient
dotnet add Infraestructure.Repository  package Dapper
dotnet add Infraestructure.Repository  package Microsoft.Extensions.Options
dotnet add Service.WebApi  package Newtonsoft.Json
dotnet add Service.WebApi  package NLog
dotnet add Service.WebApi  package NLog.Web.AspNetCore
dotnet add Service.WebApi  package Microsoft.AspNetCore.Cors
dotnet add Service.WebApi  package Swashbuckle.AspNetCore