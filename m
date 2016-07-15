Received: by 10.25.21.156 with SMTP id 28csp692101lfv;
        Fri, 15 Jul 2016 09:13:11 -0700 (PDT)
X-Received: by 10.37.38.129 with SMTP id m123mr13260774ybm.17.1468599191028;
        Fri, 15 Jul 2016 09:13:11 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q43si5726187qta.58.2016.07.15.09.13.10
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 15 Jul 2016 09:13:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:33600 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bO5ji-0007HS-9f
	for alex.bennee@linaro.org; Fri, 15 Jul 2016 12:13:10 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50130)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1bO5h2-0005Md-9R
	for qemu-devel@nongnu.org; Fri, 15 Jul 2016 12:10:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1bO5gz-00084w-LD
	for qemu-devel@nongnu.org; Fri, 15 Jul 2016 12:10:23 -0400
Received: from mx1.redhat.com ([209.132.183.28]:40853)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>)
	id 1bO5gr-00083C-Uw; Fri, 15 Jul 2016 12:10:14 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 23D0B7EA89;
	Fri, 15 Jul 2016 16:10:13 +0000 (UTC)
Received: from localhost (vpn1-5-31.gru2.redhat.com [10.97.5.31])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u6FGABQB007351; Fri, 15 Jul 2016 12:10:12 -0400
Date: Fri, 15 Jul 2016 13:10:09 -0300
From: Eduardo Habkost <ehabkost@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Message-ID: <20160715161009.GB3727@thinpad.lan.raisama.net>
References: <1465580427-13596-1-git-send-email-drjones@redhat.com>
	<1465580427-13596-8-git-send-email-drjones@redhat.com>
	<575BB5AB.3010509@redhat.com>
	<20160612134810.posa6p4wyxhit4yt@hawk.localdomain>
	<20160614021216.GI4882@voom.fritz.box>
	<20160614061949.eh45x57tdimt6obr@hawk.localdomain>
	<20160615005620.GU4882@voom.fritz.box>
	<20160714200743.GC31865@thinpad.lan.raisama.net>
	<20160715063530.2ebl4v4vpdtrpx5a@hawk.localdomain>
	<20160715111138.114d8b5f@nial.brq.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20160715111138.114d8b5f@nial.brq.redhat.com>
X-Fnord: you can see the fnord
User-Agent: Mutt/1.6.1 (2016-04-27)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Fri, 15 Jul 2016 16:10:13 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] QOM: best way for parents to pass information to
 children? (was Re: [PATCH RFC 07/16] qom/cpu: make nr-cores,
 nr-threads real properties)
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, Andrew Jones <drjones@redhat.com>,
	qemu-devel@nongnu.org, agraf@suse.de, qemu-arm@nongnu.org,
	qemu-ppc@nongnu.org, Bharata B Rao <bharata@linux.vnet.ibm.com>,
	Thomas Huth <thuth@redhat.com>, pbonzini@redhat.com, dgibson@redhat.com,
	Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>,
	David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: O9a6mfNMlZcZ

On Fri, Jul 15, 2016 at 11:11:38AM +0200, Igor Mammedov wrote:
> On Fri, 15 Jul 2016 08:35:30 +0200
> Andrew Jones <drjones@redhat.com> wrote:
> > On Thu, Jul 14, 2016 at 05:07:43PM -0300, Eduardo Habkost wrote:
> > > 
> > > First of all, sorry for the horrible delay in replying to this
> > > thread.
> > > 
> > > On Wed, Jun 15, 2016 at 10:56:20AM +1000, David Gibson wrote:  
> > > > On Tue, Jun 14, 2016 at 08:19:49AM +0200, Andrew Jones wrote:  
> > > > > On Tue, Jun 14, 2016 at 12:12:16PM +1000, David Gibson wrote:  
> > > > > > On Sun, Jun 12, 2016 at 03:48:10PM +0200, Andrew Jones wrote:  
[...]
> > > > > > > > > +static Property cpu_common_properties[] = {
> > > > > > > > > +    DEFINE_PROP_INT32("nr-cores", CPUState, nr_cores, 1),
> > > > > > > > > +    DEFINE_PROP_INT32("nr-threads", CPUState, nr_threads, 1),
> > > > > > > > > +    DEFINE_PROP_END_OF_LIST()
> > > > > > > > > +};  
> > > > > > > > 
> > > > > > > > Are you aware of the current CPU hotplug discussion that is going on?  
> > > > > > > 
> > > > > > > I'm aware of it going on, but haven't been following it.
> > > > > > >   
> > > > > > > > I'm not very involved there, but I think some of these reworks also move
> > > > > > > > "nr_threads" into the CPU state already, e.g. see:  
> > > > > > > 
> > > > > > > nr_threads (and nr_cores) are already state in CPUState. This patch just
> > > > > > > exposes that state via properties.
> > > > > > >   
> > > > > > > > 
> > > > > > > > https://github.com/dgibson/qemu/commit/9d07719784ecbeebea71
> > > > > > > > 
> > > > > > > > ... so you might want to check these patches first to see whether you
> > > > > > > > can base your rework on them?  
> > > > > > > 
> > > > > > > Every cpu, and thus every machine, uses CPUState for its cpus. I'm
> > > > > > > not sure every machine will want to use that new abstract core class
> > > > > > > though. If they did, then we could indeed use nr_threads from there
> > > > > > > instead (and remove it from CPUState), but we'd still need nr_cores
> > > > > > > from the abstract cpu package class (CPUState).  
> > > > > > 
> > > > > > Hmm.  Since the CPUState object represents just a single thread, it
> > > > > > seems weird to me that it would have nr_threads and nr_cores
> > > > > > information.  
> > > 
> > > Agreed it is weird, and I think we should try to move it away
> > > from CPUState, not make it part of the TYPE_CPU interface.
> > > nr_threads belongs to the actual container of the Thread objects,
> > > and nr_cores in the actual container of the Core objects.
> > > 
> > > The problem is how to implement that in a non-intrusive way that
> > > would require changing the object hierarchy of all architectures.
> > > 
> > >   
> > > > > > 
> > > > > > Exposing those as properties makes that much worse, because it's now
> > > > > > ABI, rather than internal detail we can clean up at some future time.  
> > > > > 
> > > > > CPUState is supposed to be "State of one CPU core or thread", which
> > > > > justifies having nr_threads state, as it may be describing a core.  
> > > > 
> > > > Um.. does it ever actually represent a (multithread) core in practice?
> > > > It would need to have duplicated register state for every thread were
> > > > that the case.  
> > > 
> > > AFAIK, CPUState is still always thread state. Or has this changed
> > > in some architectures, already?
> > >   
> > > >   
> > > > > I guess there's no justification for having nr_cores in there though.
> > > > > I agree adding the Core class is a good idea, assuming it will get used
> > > > > by all machines, and CPUState then gets changed to a Thread class. The
> > > > > question then, though, is do we also create a Socket class that contains
> > > > > nr_cores?  
> > > > 
> > > > That was roughly our intention with the way the cross platform hotplug
> > > > stuff is evolving.  But the intention was that the Socket objects
> > > > would only need to be constructed for machine types where it makes
> > > > sense.  So for example on the paravirt pseries platform, we'll only
> > > > have Core objects, because the socket distinction isn't really
> > > > meaningful.
> > > >   
> > > > > And how will a Thread method get that information when it
> > > > > needs to emulate, e.g. CPUID, that requires it? It's a bit messy, so
> > > > > I'm open to all suggestions on it.  
> > > > 
> > > > So, if the Thread needs this information, I'm not opposed to it having
> > > > it internally (presumably populated earlier from the Core object).
> > > > But I am opposed to it being a locked in part of the interface by
> > > > having it as an exposed property.  
> > > 
> > > I agree we don't want to make this part of the external
> > > interface. In this case, if we don't add the properties, how
> > > exactly is the Machine or Core code supposed to pass that
> > > information to the Thread object?
> > > 
> > > Maybe the intermediate steps could be:
> > > 
> > > * Make the Thread code that uses CPUState::nr_{cores,threads} and
> > >   smp_{cores,threads} get that info from MachineState instead.  
> > 
> > I have some patches already headed down this road.
> > 
> > > * On the architectures where we already have a reasonable
> > >   Socket/Core/Thread hierarchy, let the Thread code simply ask
> > >   for that information from its parent.  
> > 
> > I guess that's just spapr so far, or at least spapr is the closest.
> > Indeed this appears to be the cleanest approach, so architectures
> > adding support for cpu topology should likely strive to implement it
> > this way.
> If I recall correctly, the only thing about accessing parent is that
> in QOM design accessing parent from child wasn't accepted well,
> i.e. child shouldn't be aware nor access parent object.

Can anybody explain why?

In this case, what's the best way for a parent to pass
information to its children without adding new externally-visible
properties that the user is never supposed to set directly?

Should Thread objects have an additional link to the parent Core
object, just to be able to get the information it needs?

-- 
Eduardo
