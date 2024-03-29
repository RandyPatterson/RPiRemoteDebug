using System;
using System.Collections.Generic;
using System.Device.Gpio;
using System.Linq;
using System.Threading;
using System.Threading.Tasks;
using Microsoft.Extensions.Hosting;
using Microsoft.Extensions.Logging;

//GPIO https://darenmay.com/blog/net-core-and-gpio-on-the-raspberry-pi---leds-and-gpio/
//dotnet add package System.Device.Gpio 
//dotnet add package Iot.Device.Bindings

namespace rpiworker
{
    public class Worker : BackgroundService
    {
        private readonly ILogger<Worker> _logger;
        //GPIO 18 is physical pin 12
        private const int ledPin = 18;
        GpioController controller;


        public Worker(ILogger<Worker> logger, GpioController controller)
        {
            _logger = logger;
            this.controller = controller;
        }


        protected override async Task ExecuteAsync(CancellationToken stoppingToken)
        {
            controller.OpenPin(ledPin,PinMode.Output);
            bool ledState = false;
            while (!stoppingToken.IsCancellationRequested)
            {
                ledState = !ledState;
                controller.Write(ledPin,ledState ? PinValue.High : PinValue.Low);

                _logger.LogInformation("Worker running at: {time}", DateTimeOffset.Now);
                await Task.Delay(1000, stoppingToken);
            }
        }
    }
}

