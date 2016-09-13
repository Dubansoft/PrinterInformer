//  Copyright 2015 Jhorman Duban Rodríguez Pulgarín
//  
//  This file is part of InkAlert.
//  
//  InkAlert is free software: you can redistribute it and/or modify
//  it under the terms of the GNU General Public License as published by
//  the Free Software Foundation, either version 3 of the License, or
//  (at your option) any later version.
//  
//  InkAlert is distributed in the hope that it will be useful,
//  but WITHOUT ANY WARRANTY; without even the implied warranty of
//  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//  GNU General Public License for more details.
//  
//  You should have received a copy of the GNU General Public License
//  along with InkAlert.  If not, see <http://www.gnu.org/licenses/>.
//  
//  Jhorman Duban Rodríguez., hereby disclaims all copyright interest in 
//  the program "InkAlert" (which makes passes at 
//  compilers) written by Jhorman Duban Rodríguez.
//  
//  Jhorman Duban Rodríguez,
//  5 January 2016
//  For more information, visit <http://www.codigoinnovador.com/projects/inkalert/>

using System;
using System.Drawing.Printing;
using System.Net;
using System.Net.Sockets;
using System.Collections.Specialized;
using System.Text;
using System.Threading;
using System.Runtime.InteropServices;
using System.Diagnostics;
using System.Net.NetworkInformation;

namespace PrinterInformer
{
    static class Program
    {
        /// <summary>
        /// The main entry point for the application.
        /// </summary>
        [STAThread]
        static void Main(string[] args)
        {
            MinimizeFootprint();
            MainLogic myMainLogic = new MainLogic();
            myMainLogic.SendInformation(args);
            Environment.Exit(Environment.ExitCode);
        }

        [DllImport("psapi.dll")]
        static extern int EmptyWorkingSet(IntPtr hwProc);

        static void MinimizeFootprint()
        {
            EmptyWorkingSet(Process.GetCurrentProcess().Handle);
        }
    }

    class MainLogic
    {
        Properties.Settings AppProperties = Properties.Settings.Default;

        public  void SendInformation(string[] args)
        {
            int waitTime = 5000;

        Start:
            
            try
            {
                Thread.Sleep(waitTime);

                if (!pingIp(AppProperties.serverIp))
                {
                    waitTime = 1000 * 60 * 15;
                    goto Start;
                }

                string pcName = Environment.MachineName;
                string userName = System.Security.Principal.WindowsIdentity.GetCurrent().Name;
                string defaultPrinter = "DEFAULT-PRINTER-UNSET";
                string ip = "0.0.0.0";
                string availablePrinters = "";

                PrinterSettings settings = new PrinterSettings();
                defaultPrinter = settings.PrinterName;

                var host = Dns.GetHostEntry(Dns.GetHostName());
                foreach (var ipAddress in host.AddressList)
                {
                    if (ipAddress.AddressFamily == AddressFamily.InterNetwork)
                    {
                        ip = ipAddress.ToString();
                    }
                }


                foreach (string printer in PrinterSettings.InstalledPrinters)
                {
                    availablePrinters += printer + ", ";
                }

                using (var client = new WebClient())
                {
                    var values = new NameValueCollection();
                    values["pcName"] = pcName;
                    values["ip"] = ip;
                    values["userName"] = userName.Replace(@"\", @"\\");
                    values["defaultPrinter"] = defaultPrinter.Replace(@"\", @"\\");
                    values["availablePrinters"] = availablePrinters.Substring(0, availablePrinters.Length - 2).Replace(@"\", @"\\");

                    Thread.Sleep(500);

                    var response = client.UploadValues(AppProperties.fullRequestAddress, values);

                    var responseString = Encoding.Default.GetString(response);
                }

                waitTime = 1000 * 60 * 60 * 6;

                goto Start;

            }
            catch (Exception ee)
            {
                Console.WriteLine("Error: " + ee.Message.ToString());
            }

        }

        private bool pingIp(string printerIp)
        {
            
            try
            {
                if (printerIp == string.Empty)
                {
                    return false;
                }

                int timeout = 120;

                Ping pingSender = new Ping();

                PingReply reply = pingSender.Send(printerIp, timeout);

                if (reply.Status == IPStatus.Success)
                {
                    return true;
                }

                return false;

            }
            catch (Exception ee)
            {
                Console.WriteLine("Error: " + ee.Message.ToString());
                return false;
            }
        }
    }

}
