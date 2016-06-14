Received: by 10.25.141.12 with SMTP id p12csp55171lfd;
        Mon, 13 Jun 2016 23:20:05 -0700 (PDT)
X-Received: by 10.140.27.212 with SMTP id 78mr17496712qgx.106.1465885204914;
        Mon, 13 Jun 2016 23:20:04 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x58si17433984qtx.38.2016.06.13.23.20.04
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 13 Jun 2016 23:20:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:32896 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bChhk-0007LM-Bt
	for alex.bennee@linaro.org; Tue, 14 Jun 2016 02:20:04 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39140)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1bChhf-0007Ky-Qk
	for qemu-arm@nongnu.org; Tue, 14 Jun 2016 02:20:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1bChhc-0000q3-KY
	for qemu-arm@nongnu.org; Tue, 14 Jun 2016 02:19:59 -0400
Received: from mx1.redhat.com ([209.132.183.28]:56748)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>)
	id 1bChhc-0000py-Bl; Tue, 14 Jun 2016 02:19:56 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6A1013F722;
	Tue, 14 Jun 2016 06:19:55 +0000 (UTC)
Received: from hawk.localdomain (ovpn-204-35.brq.redhat.com [10.40.204.35])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u5E6Jntf018739
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Tue, 14 Jun 2016 02:19:52 -0400
Date: Tue, 14 Jun 2016 08:19:49 +0200
From: Andrew Jones <drjones@redhat.com>
To: David Gibson <david@gibson.dropbear.id.au>
Message-ID: <20160614061949.eh45x57tdimt6obr@hawk.localdomain>
References: <1465580427-13596-1-git-send-email-drjones@redhat.com>
	<1465580427-13596-8-git-send-email-drjones@redhat.com>
	<575BB5AB.3010509@redhat.com>
	<20160612134810.posa6p4wyxhit4yt@hawk.localdomain>
	<20160614021216.GI4882@voom.fritz.box>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20160614021216.GI4882@voom.fritz.box>
User-Agent: Mutt/1.5.23.1 (2014-03-12)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Tue, 14 Jun 2016 06:19:55 +0000 (UTC)
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
	ehabkost@redhat.com, pbonzini@redhat.com, qemu-devel@nongnu.org,
	agraf@suse.de, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
	Bharata B Rao <bharata@linux.vnet.ibm.com>, imammedo@redhat.com,
	dgibson@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: uSd5O9Ek2jHn

On Tue, Jun 14, 2016 at 12:12:16PM +1000, David Gibson wrote:
> On Sun, Jun 12, 2016 at 03:48:10PM +0200, Andrew Jones wrote:
> > On Sat, Jun 11, 2016 at 08:54:35AM +0200, Thomas Huth wrote:
> > > On 10.06.2016 19:40, Andrew Jones wrote:
> > > > Signed-off-by: Andrew Jones <drjones@redhat.com>
> > > > ---
> > > >  qom/cpu.c | 8 ++++++++
> > > >  1 file changed, 8 insertions(+)
> > > > 
> > > > diff --git a/qom/cpu.c b/qom/cpu.c
> > > > index 751e992de8823..024cda3eb98c8 100644
> > > > --- a/qom/cpu.c
> > > > +++ b/qom/cpu.c
> > > > @@ -28,6 +28,7 @@
> > > >  #include "exec/log.h"
> > > >  #include "qemu/error-report.h"
> > > >  #include "sysemu/sysemu.h"
> > > > +#include "hw/qdev-properties.h"
> > > >  
> > > >  bool cpu_exists(int64_t id)
> > > >  {
> > > > @@ -342,6 +343,12 @@ static int64_t cpu_common_get_arch_id(CPUState *cpu)
> > > >      return cpu->cpu_index;
> > > >  }
> > > >  
> > > > +static Property cpu_common_properties[] = {
> > > > +    DEFINE_PROP_INT32("nr-cores", CPUState, nr_cores, 1),
> > > > +    DEFINE_PROP_INT32("nr-threads", CPUState, nr_threads, 1),
> > > > +    DEFINE_PROP_END_OF_LIST()
> > > > +};
> > > 
> > > Are you aware of the current CPU hotplug discussion that is going on?
> > 
> > I'm aware of it going on, but haven't been following it.
> > 
> > > I'm not very involved there, but I think some of these reworks also move
> > > "nr_threads" into the CPU state already, e.g. see:
> > 
> > nr_threads (and nr_cores) are already state in CPUState. This patch just
> > exposes that state via properties.
> > 
> > > 
> > > https://github.com/dgibson/qemu/commit/9d07719784ecbeebea71
> > > 
> > > ... so you might want to check these patches first to see whether you
> > > can base your rework on them?
> > 
> > Every cpu, and thus every machine, uses CPUState for its cpus. I'm
> > not sure every machine will want to use that new abstract core class
> > though. If they did, then we could indeed use nr_threads from there
> > instead (and remove it from CPUState), but we'd still need nr_cores
> > from the abstract cpu package class (CPUState).
> 
> Hmm.  Since the CPUState object represents just a single thread, it
> seems weird to me that it would have nr_threads and nr_cores
> information.
> 
> Exposing those as properties makes that much worse, because it's now
> ABI, rather than internal detail we can clean up at some future time.

CPUState is supposed to be "State of one CPU core or thread", which
justifies having nr_threads state, as it may be describing a core.
I guess there's no justification for having nr_cores in there though.
I agree adding the Core class is a good idea, assuming it will get used
by all machines, and CPUState then gets changed to a Thread class. The
question then, though, is do we also create a Socket class that contains
nr_cores? And how will a Thread method get that information when it
needs to emulate, e.g. CPUID, that requires it? It's a bit messy, so
I'm open to all suggestions on it.

Thanks,
drew
