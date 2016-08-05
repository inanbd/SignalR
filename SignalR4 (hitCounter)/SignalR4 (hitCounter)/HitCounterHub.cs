using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using Microsoft.AspNet.SignalR;
using Microsoft.AspNet.SignalR.Hubs;

namespace _hitCounter
{
    [HubName("hitCounter")]
    public class HitCounterHub : Hub
    {
        private static int _hitCounter =0 ;
        public void RecordHit()
        {
            _hitCounter++;
            this.Clients.All.onHitRecorded(_hitCounter);

        }
        public override Task OnDisconnected(bool stopCalled)
        {

            _hitCounter -= 1;
            this.Clients.All.onHitRecorded(_hitCounter);

            return base.OnDisconnected(stopCalled);
        }
        
    }
}