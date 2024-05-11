cls

Add-Type @"
public class AAA123
{
    public class Service : ServiceBase
    {

        public Service(string serviceName)
        {
            this.ServiceName = serviceName;
        }

        protected override void OnStart(string[] args)
        {
            Program.Start(args);
        }

        protected override void OnStop()
        {
            Program.Stop(this.ServiceName);
        }
    }
    #endregion

    static void Main(string[] args)
    {
        if (!Environment.UserInteractive)
            // running as service
            using (var service = new Service("TestService"))
                ServiceBase.Run(service);
        else
        {
            // running as console app
            Start(args);
        }
    }

    private static void Start(string[] args)
    {
        while(true)
        {
            //DO SOMTHING
        }
    }

    private static void Stop(string serviceName)
    {
        //Writing to log that 'serviceName' stopped
    }
}

"@


[AAA123]::Main()
