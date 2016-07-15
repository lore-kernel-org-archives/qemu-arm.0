Received: by 10.25.21.156 with SMTP id 28csp451922lfv;
        Thu, 14 Jul 2016 23:29:30 -0700 (PDT)
X-Received: by 10.55.71.6 with SMTP id u6mr23531297qka.188.1468564170419;
        Thu, 14 Jul 2016 23:29:30 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l5si4306200qkd.96.2016.07.14.23.29.30
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 14 Jul 2016 23:29:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:58687 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bNwcr-0007QQ-RX
	for alex.bennee@linaro.org; Fri, 15 Jul 2016 02:29:29 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57196)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1bNwcm-0007QI-OT
	for qemu-arm@nongnu.org; Fri, 15 Jul 2016 02:29:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1bNwci-0000pT-IV
	for qemu-arm@nongnu.org; Fri, 15 Jul 2016 02:29:23 -0400
Received: from mx1.redhat.com ([209.132.183.28]:59510)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>)
	id 1bNwci-0000pP-AM; Fri, 15 Jul 2016 02:29:20 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id CCBA315555;
	Fri, 15 Jul 2016 06:29:19 +0000 (UTC)
Received: from hawk.localdomain (ovpn-204-66.brq.redhat.com [10.40.204.66])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u6F6TFU6002227
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Fri, 15 Jul 2016 02:29:17 -0400
Date: Fri, 15 Jul 2016 08:29:14 +0200
From: Andrew Jones <drjones@redhat.com>
To: Eduardo Habkost <ehabkost@redhat.com>
Message-ID: <20160715062914.tvg4wcta5eflgk5j@hawk.localdomain>
References: <1465580427-13596-1-git-send-email-drjones@redhat.com>
	<1465580427-13596-6-git-send-email-drjones@redhat.com>
	<20160614020026.GH4882@voom.fritz.box>
	<20160614060807.tkdq2dy2kw6d3bw4@hawk.localdomain>
	<20160615003759.GR4882@voom.fritz.box>
	<20160615071113.jvvuqpgtkg6okqdg@hawk.localdomain>
	<20160714201820.GE31865@thinpad.lan.raisama.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20160714201820.GE31865@thinpad.lan.raisama.net>
User-Agent: Mutt/1.6.0.1 (2016-04-01)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Fri, 15 Jul 2016 06:29:19 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH RFC 05/16] hw/core/machine: add
 smp properites
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
Cc: peter.maydell@linaro.org, agraf@suse.de, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, qemu-ppc@nongnu.org, pbonzini@redhat.com,
	imammedo@redhat.com, dgibson@redhat.com,
	David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: O4JiXn7g1G9a

On Thu, Jul 14, 2016 at 05:18:20PM -0300, Eduardo Habkost wrote:
> On Wed, Jun 15, 2016 at 09:11:13AM +0200, Andrew Jones wrote:
> > On Wed, Jun 15, 2016 at 10:37:59AM +1000, David Gibson wrote:
> > > On Tue, Jun 14, 2016 at 08:08:07AM +0200, Andrew Jones wrote:
> > > > On Tue, Jun 14, 2016 at 12:00:26PM +1000, David Gibson wrote:
> > > > > On Fri, Jun 10, 2016 at 07:40:16PM +0200, Andrew Jones wrote:
> > > > > > Signed-off-by: Andrew Jones <drjones@redhat.com>
> > > > > > ---
> > > > > >  hw/core/machine.c   | 81 +++++++++++++++++++++++++++++++++++++++++++++++++++++
> > > > > >  include/hw/boards.h |  6 ++++
> > > > > >  2 files changed, 87 insertions(+)
> > > > > > 
> > > > > > diff --git a/hw/core/machine.c b/hw/core/machine.c
> > > > > > index 3dce9020e510a..2625044002e57 100644
> > > > > > --- a/hw/core/machine.c
> > > > > > +++ b/hw/core/machine.c
> > > > > > @@ -172,6 +172,53 @@ static void machine_set_dumpdtb(Object *obj, const char *value, Error **errp)
> > > > > >      ms->dumpdtb = g_strdup(value);
> > > > > >  }
> > > > > >  
> > > > > > +static void machine_get_smp(Object *obj, Visitor *v, const char *name,
> > > > > > +                            void *opaque, Error **errp)
> > > > > > +{
> > > > > > +    MachineState *ms = MACHINE(obj);
> > > > > > +    int64_t value;
> > > > > > +
> > > > > > +    if (strncmp(name, "sockets", 7) == 0) {
> > > > > > +        value = ms->sockets;
> > > > > > +    } else if (strncmp(name, "cores", 5) == 0) {
> > > > > > +        value = ms->cores;
> > > > > > +    } else if (strncmp(name, "threads", 7) == 0) {
> > > > > > +        value = ms->threads;
> > > > > > +    } else if (strncmp(name, "maxcpus", 7) == 0) {
> > > > > > +        value = ms->maxcpus;
> > > > > > +    } else if (strncmp(name, "cpus", 4) == 0) {
> > > > > > +        value = ms->cpus;
> > > > > > +    }
> > > > > > +
> > > > > > +    visit_type_int(v, name, &value, errp);
> > > > > > +}
> > > > > 
> > > > > Any particular for multiplexing all the set / get, rather than having
> > > > > separate callbacks for each property?
> > > > 
> > > > Not really. This way just makes denser code. But I'll go whichever
> > > > direction people prefer.
> > > 
> > > I'd prefer not to have the multiplexer, but I don't care that much.
> > > 
> > > > Actually I should probably add an
> > > > else { error_report(...) } in either case, which means the multifunction
> > > > direction would still contain strncmps.
> > > 
> > > Hrm.. that would seem an odd choice to me if you didn't have the
> > > multiplex.  Not including the strncmp() means you can change the
> > > property name (or add aliases) in a single place, without changing the
> > > callback functions.
> > > 
> > > Note also that the current set of strncmp()s is only correct because
> > > there is a limited set of things bound to this callback.  Remember
> > > that strncmp(name, "sockets", 7) will match "socketsfoo".
> > 
> > Good point. I'll change to multiple functions and just drop the
> > strncmps.
> 
> Multiple functions that just get/set struct fields would be
> easier to convert to use a better property API (that don't
> require writing getter/setters) in the future.
> 
> [...]
> > > > > > +
> > > > > > +    int sockets;
> > > > > > +    int cores;
> > > > > > +    int threads;
> > > > > > +    int maxcpus;
> > > > > > +    int cpus;
> > > > > 
> > > > > Hrm.. as the tests added in earlier patches highlight, essentially one
> > > > > of these properties is redundant.  Is there a reason to include them
> > > > > all, rather than to pick one to drop?
> > > > 
> > > > Well, IMO, only maxcpus could be dropped. I'd prefer not to though
> > > > because it's a convenient state to have pre-calculated, and possibly
> > > > error prone to leave to all users to re-calculate.
> > > 
> > > Sorry, to clarify.  I have no problem with having all 5 variables,
> > > with one precalculated from the others.  What I'm not convinced is a
> > > good idea is exposing all 5 as settable properties.
> > 
> > I see. I think we need them all, especially as we decide which ones
> > can be optional, if given others. For example we need cpus and maxcpus
> > for obvious reasons. threads can be optional (default =1), but if you
> > want to specify more than 1 then we need the property. Currently I
> > think both sockets and cores should be required since we don't know
> > which should be calculated form the other, and therefore can't set
> > a default for either. That's all five.
> 
> If we were designing a new interface, I would prefer to make it
> different, and add properties only to machine classes that really
> make this configurable. But as we are just moving existing data
> and logic from vl.c into MachineState fields, I agree we need all
> the struct fields, so the existing vl.c code can be easily moved
> to machine.c.
> 
> But:
> 
> About the new externally-visible interface: what about we
> register the properties only on the machine subclasses that
> really do something with those options? Then we won't need to
> worry about keeping compatibility in machines that never
> supported multi-core/multi-thread configurations in the first
> place.

I like that. I'll look into it for v1.

Thanks,
drew

> 
> -- 
> Eduardo
> 
