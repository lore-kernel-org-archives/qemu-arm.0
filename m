Received: by 10.25.21.156 with SMTP id 28csp505811lfv;
        Fri, 15 Jul 2016 02:11:54 -0700 (PDT)
X-Received: by 10.55.137.70 with SMTP id l67mr23838783qkd.17.1468573914484;
        Fri, 15 Jul 2016 02:11:54 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i10si4641460qke.191.2016.07.15.02.11.54
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 15 Jul 2016 02:11:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:59353 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bNzA1-0003Gb-V0
	for alex.bennee@linaro.org; Fri, 15 Jul 2016 05:11:53 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58516)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1bNz9x-0003GK-HT
	for qemu-arm@nongnu.org; Fri, 15 Jul 2016 05:11:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1bNz9r-0006uW-Sx
	for qemu-arm@nongnu.org; Fri, 15 Jul 2016 05:11:48 -0400
Received: from mx1.redhat.com ([209.132.183.28]:40671)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>)
	id 1bNz9r-0006uP-KA; Fri, 15 Jul 2016 05:11:43 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A8B683DC49;
	Fri, 15 Jul 2016 09:11:42 +0000 (UTC)
Received: from nial.brq.redhat.com (dhcp-1-118.brq.redhat.com [10.34.1.118])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u6F9BdxG021891; Fri, 15 Jul 2016 05:11:39 -0400
Date: Fri, 15 Jul 2016 11:11:38 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Andrew Jones <drjones@redhat.com>
Message-ID: <20160715111138.114d8b5f@nial.brq.redhat.com>
In-Reply-To: <20160715063530.2ebl4v4vpdtrpx5a@hawk.localdomain>
References: <1465580427-13596-1-git-send-email-drjones@redhat.com>
	<1465580427-13596-8-git-send-email-drjones@redhat.com>
	<575BB5AB.3010509@redhat.com>
	<20160612134810.posa6p4wyxhit4yt@hawk.localdomain>
	<20160614021216.GI4882@voom.fritz.box>
	<20160614061949.eh45x57tdimt6obr@hawk.localdomain>
	<20160615005620.GU4882@voom.fritz.box>
	<20160714200743.GC31865@thinpad.lan.raisama.net>
	<20160715063530.2ebl4v4vpdtrpx5a@hawk.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Fri, 15 Jul 2016 09:11:42 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH RFC 07/16] qom/cpu: make
 nr-cores, nr-threads real properties
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, Thomas Huth <thuth@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>, qemu-devel@nongnu.org,
	agraf@suse.de, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
	Bharata B Rao <bharata@linux.vnet.ibm.com>, pbonzini@redhat.com,
	dgibson@redhat.com, Andreas =?UTF-8?B?RsOkcmJlcg==?= <afaerber@suse.de>,
	David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 0c4u081uBQ7F

On Fri, 15 Jul 2016 08:35:30 +0200
Andrew Jones <drjones@redhat.com> wrote:

> On Thu, Jul 14, 2016 at 05:07:43PM -0300, Eduardo Habkost wrote:
> > 
> > First of all, sorry for the horrible delay in replying to this
> > thread.
> > 
> > On Wed, Jun 15, 2016 at 10:56:20AM +1000, David Gibson wrote:  
> > > On Tue, Jun 14, 2016 at 08:19:49AM +0200, Andrew Jones wrote:  
> > > > On Tue, Jun 14, 2016 at 12:12:16PM +1000, David Gibson wrote:  
> > > > > On Sun, Jun 12, 2016 at 03:48:10PM +0200, Andrew Jones wrote:  
> > > > > > On Sat, Jun 11, 2016 at 08:54:35AM +0200, Thomas Huth wrote:  
> > > > > > > On 10.06.2016 19:40, Andrew Jones wrote:  
> > > > > > > > Signed-off-by: Andrew Jones <drjones@redhat.com>
> > > > > > > > ---
> > > > > > > >  qom/cpu.c | 8 ++++++++
> > > > > > > >  1 file changed, 8 insertions(+)
> > > > > > > > 
> > > > > > > > diff --git a/qom/cpu.c b/qom/cpu.c
> > > > > > > > index 751e992de8823..024cda3eb98c8 100644
> > > > > > > > --- a/qom/cpu.c
> > > > > > > > +++ b/qom/cpu.c
> > > > > > > > @@ -28,6 +28,7 @@
> > > > > > > >  #include "exec/log.h"
> > > > > > > >  #include "qemu/error-report.h"
> > > > > > > >  #include "sysemu/sysemu.h"
> > > > > > > > +#include "hw/qdev-properties.h"
> > > > > > > >  
> > > > > > > >  bool cpu_exists(int64_t id)
> > > > > > > >  {
> > > > > > > > @@ -342,6 +343,12 @@ static int64_t cpu_common_get_arch_id(CPUState *cpu)
> > > > > > > >      return cpu->cpu_index;
> > > > > > > >  }
> > > > > > > >  
> > > > > > > > +static Property cpu_common_properties[] = {
> > > > > > > > +    DEFINE_PROP_INT32("nr-cores", CPUState, nr_cores, 1),
> > > > > > > > +    DEFINE_PROP_INT32("nr-threads", CPUState, nr_threads, 1),
> > > > > > > > +    DEFINE_PROP_END_OF_LIST()
> > > > > > > > +};  
> > > > > > > 
> > > > > > > Are you aware of the current CPU hotplug discussion that is going on?  
> > > > > > 
> > > > > > I'm aware of it going on, but haven't been following it.
> > > > > >   
> > > > > > > I'm not very involved there, but I think some of these reworks also move
> > > > > > > "nr_threads" into the CPU state already, e.g. see:  
> > > > > > 
> > > > > > nr_threads (and nr_cores) are already state in CPUState. This patch just
> > > > > > exposes that state via properties.
> > > > > >   
> > > > > > > 
> > > > > > > https://github.com/dgibson/qemu/commit/9d07719784ecbeebea71
> > > > > > > 
> > > > > > > ... so you might want to check these patches first to see whether you
> > > > > > > can base your rework on them?  
> > > > > > 
> > > > > > Every cpu, and thus every machine, uses CPUState for its cpus. I'm
> > > > > > not sure every machine will want to use that new abstract core class
> > > > > > though. If they did, then we could indeed use nr_threads from there
> > > > > > instead (and remove it from CPUState), but we'd still need nr_cores
> > > > > > from the abstract cpu package class (CPUState).  
> > > > > 
> > > > > Hmm.  Since the CPUState object represents just a single thread, it
> > > > > seems weird to me that it would have nr_threads and nr_cores
> > > > > information.  
> > 
> > Agreed it is weird, and I think we should try to move it away
> > from CPUState, not make it part of the TYPE_CPU interface.
> > nr_threads belongs to the actual container of the Thread objects,
> > and nr_cores in the actual container of the Core objects.
> > 
> > The problem is how to implement that in a non-intrusive way that
> > would require changing the object hierarchy of all architectures.
> > 
> >   
> > > > > 
> > > > > Exposing those as properties makes that much worse, because it's now
> > > > > ABI, rather than internal detail we can clean up at some future time.  
> > > > 
> > > > CPUState is supposed to be "State of one CPU core or thread", which
> > > > justifies having nr_threads state, as it may be describing a core.  
> > > 
> > > Um.. does it ever actually represent a (multithread) core in practice?
> > > It would need to have duplicated register state for every thread were
> > > that the case.  
> > 
> > AFAIK, CPUState is still always thread state. Or has this changed
> > in some architectures, already?
> >   
> > >   
> > > > I guess there's no justification for having nr_cores in there though.
> > > > I agree adding the Core class is a good idea, assuming it will get used
> > > > by all machines, and CPUState then gets changed to a Thread class. The
> > > > question then, though, is do we also create a Socket class that contains
> > > > nr_cores?  
> > > 
> > > That was roughly our intention with the way the cross platform hotplug
> > > stuff is evolving.  But the intention was that the Socket objects
> > > would only need to be constructed for machine types where it makes
> > > sense.  So for example on the paravirt pseries platform, we'll only
> > > have Core objects, because the socket distinction isn't really
> > > meaningful.
> > >   
> > > > And how will a Thread method get that information when it
> > > > needs to emulate, e.g. CPUID, that requires it? It's a bit messy, so
> > > > I'm open to all suggestions on it.  
> > > 
> > > So, if the Thread needs this information, I'm not opposed to it having
> > > it internally (presumably populated earlier from the Core object).
> > > But I am opposed to it being a locked in part of the interface by
> > > having it as an exposed property.  
> > 
> > I agree we don't want to make this part of the external
> > interface. In this case, if we don't add the properties, how
> > exactly is the Machine or Core code supposed to pass that
> > information to the Thread object?
> > 
> > Maybe the intermediate steps could be:
> > 
> > * Make the Thread code that uses CPUState::nr_{cores,threads} and
> >   smp_{cores,threads} get that info from MachineState instead.  
> 
> I have some patches already headed down this road.
> 
> > * On the architectures where we already have a reasonable
> >   Socket/Core/Thread hierarchy, let the Thread code simply ask
> >   for that information from its parent.  
> 
> I guess that's just spapr so far, or at least spapr is the closest.
> Indeed this appears to be the cleanest approach, so architectures
> adding support for cpu topology should likely strive to implement it
> this way.
If I recall correctly, the only thing about accessing parent is that
in QOM design accessing parent from child wasn't accepted well,
i.e. child shouldn't be aware nor access parent object.


> 
> Thanks,
> drew
> 
> > 
> > -- 
> > Eduardo
> >   

