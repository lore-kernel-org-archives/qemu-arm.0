Received: by 10.25.0.198 with SMTP id 189csp166462lfa;
        Wed, 3 May 2017 08:57:47 -0700 (PDT)
X-Received: by 10.55.145.66 with SMTP id t63mr3912200qkd.242.1493827067290;
        Wed, 03 May 2017 08:57:47 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n73si2056854qka.143.2017.05.03.08.57.46
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 03 May 2017 08:57:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:37519 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1d5weu-00006c-Kd
	for alex.bennee@linaro.org; Wed, 03 May 2017 11:57:44 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37497)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1d5wel-00006G-B5
	for qemu-arm@nongnu.org; Wed, 03 May 2017 11:57:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1d5wek-0000uP-B5
	for qemu-arm@nongnu.org; Wed, 03 May 2017 11:57:35 -0400
Received: from mx1.redhat.com ([209.132.183.28]:11573)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1d5wek-0000tg-1N; Wed, 03 May 2017 11:57:34 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E2CAA75738;
	Wed,  3 May 2017 15:57:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com E2CAA75738
Authentication-Results: ext-mx01.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx01.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=imammedo@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com E2CAA75738
Received: from nial.brq.redhat.com (dhcp-1-118.brq.redhat.com [10.34.1.118])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 916D3182E7;
	Wed,  3 May 2017 15:57:26 +0000 (UTC)
Date: Wed, 3 May 2017 17:57:24 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Eduardo Habkost <ehabkost@redhat.com>
Message-ID: <20170503175724.69a5a4e3@nial.brq.redhat.com>
In-Reply-To: <20170503144240.GL3482@thinpad.lan.raisama.net>
References: <1493816238-33120-1-git-send-email-imammedo@redhat.com>
	<1493816238-33120-6-git-send-email-imammedo@redhat.com>
	<20170503144240.GL3482@thinpad.lan.raisama.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Wed, 03 May 2017 15:57:33 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2 05/24] numa: move source of
 default CPUs to NUMA node mapping into boards
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
	qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
	Shannon Zhao <zhaoshenglong@huawei.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 5FRgeij4IM1o

On Wed, 3 May 2017 11:42:40 -0300
Eduardo Habkost <ehabkost@redhat.com> wrote:

> On Wed, May 03, 2017 at 02:56:59PM +0200, Igor Mammedov wrote:
> > Originally CPU threads were by default assigned in
> > round-robin fashion. However it was causing issues in
> > guest since CPU threads from the same socket/core could
> > be placed on different NUMA nodes.
> > Commit fb43b73b (pc: fix default VCPU to NUMA node mapping)
> > fixed it by grouping threads within a socket on the same node
> > introducing cpu_index_to_socket_id() callback and commit
> > 20bb648d (spapr: Fix default NUMA node allocation for threads)
> > reused callback to fix similar issues for SPAPR machine
> > even though socket doesn't make much sense there.
> > 
> > As result QEMU ended up having 3 default distribution rules
> > used by 3 targets /virt-arm, spapr, pc/.
> > 
> > In effort of moving NUMA mapping for CPUs into possible_cpus,
> > generalize default mapping in numa.c by making boards decide
> > on default mapping and let them explicitly tell generic
> > numa code to which node a CPU thread belongs to by replacing
> > cpu_index_to_socket_id() with @cpu_index_to_instance_props()
> > which provides default node_id assigned by board to specified
> > cpu_index.
> > 
> > Signed-off-by: Igor Mammedov <imammedo@redhat.com>  
> 
> Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>
> 
> Just two extra comments below:
> 
> [...]
> > +static CpuInstanceProperties
> > +virt_cpu_index_to_props(MachineState *ms, unsigned cpu_index)
> > +{
> > +    MachineClass *mc = MACHINE_GET_CLASS(ms);
> > +    const CPUArchIdList *possible_cpus = mc->possible_cpu_arch_ids(ms);
> > +
> > +    assert(cpu_index < possible_cpus->len);
> > +    return possible_cpus->cpus[cpu_index].props;;
> > +}
> > +  
> [...]
> > +static CpuInstanceProperties
> > +pc_cpu_index_to_props(MachineState *ms, unsigned cpu_index)
> >  {
> > +    MachineClass *mc = MACHINE_GET_CLASS(ms);
> > +    const CPUArchIdList *possible_cpus = mc->possible_cpu_arch_ids(ms);
> > +
> > +    assert(cpu_index < possible_cpus->len);
> > +    return possible_cpus->cpus[cpu_index].props;;
> >  }  
> 
> The fact that these two implementations look exactly the same
> made me wonder:
> 
> 1) Why this isn't the default implementation;
> 2) Why exactly spapr needs a different implementation.
> 
> Then I noticed that there's nothing in the common machine code
> that specifies that possible_cpus->cpus[] is indexed by
> cpu_index. This means it is indeed safer to require each machine
> to provide its own cpu_index_to_props implementation than having
> a default implementation that can unexpectedly break (e.g. if
> granularity at possible_cpus is not at VCPU/thread level).
> 
> I would still like to have an abstraction that wouldn't require
> writing machine-specific code (e.g. cpu_index ranges to
> possible_cpus like David suggested), but that's for a follow-up
> series.
I've left generalizing this part until we have defined/stable
topology for aarch64.
Also I hope, that instead of generalizing we might
depricate/drop -numa node,cpus=0,1,... in future and just drop
this hooks altogether as they are there only for compatibility
with old cpu_index based mapping


> [...]
> > +static CpuInstanceProperties
> > +spapr_cpu_index_to_props(MachineState *machine, unsigned cpu_index)
> >  {
> > +    CPUArchId *core_slot;
> > +    MachineClass *mc = MACHINE_GET_CLASS(machine);
> > +
> > +    /* make sure possible_cpu are intialized */
> > +    mc->possible_cpu_arch_ids(machine);
> > +    core_slot = spapr_find_cpu_slot(machine, cpu_index, NULL);
> > +    assert(core_slot);
> > +    return core_slot->props;
> >  }  
> 
> If you need to submit v3, maybe a comment here explaining why
> spapr needs a different cpu_index_to_props implementation would
> be helpful. I took a while to figure it out.
I'll add comment if series is respinned.

