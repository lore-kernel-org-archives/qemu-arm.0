Received: by 10.25.0.198 with SMTP id 189csp561623lfa;
        Thu, 4 May 2017 05:58:52 -0700 (PDT)
X-Received: by 10.31.114.143 with SMTP id n137mr3352174vkc.59.1493902732095;
        Thu, 04 May 2017 05:58:52 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j43si864820uaf.26.2017.05.04.05.58.51
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 04 May 2017 05:58:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:41843 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1d6GLL-0004M3-Fu
	for alex.bennee@linaro.org; Thu, 04 May 2017 08:58:51 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37459)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1d6GHw-0000ur-7U
	for qemu-arm@nongnu.org; Thu, 04 May 2017 08:55:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1d6GHr-0006QW-By
	for qemu-arm@nongnu.org; Thu, 04 May 2017 08:55:20 -0400
Received: from mx1.redhat.com ([209.132.183.28]:44990)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1d6GHr-0006Q3-2L; Thu, 04 May 2017 08:55:15 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D3045C059758;
	Thu,  4 May 2017 12:55:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com D3045C059758
Authentication-Results: ext-mx08.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx08.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=imammedo@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com D3045C059758
Received: from nial.brq.redhat.com (dhcp-1-118.brq.redhat.com [10.34.1.118])
	by smtp.corp.redhat.com (Postfix) with ESMTP id AFC1F18389;
	Thu,  4 May 2017 12:55:11 +0000 (UTC)
Date: Thu, 4 May 2017 14:55:09 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Andrew Jones <drjones@redhat.com>
Message-ID: <20170504145509.394ce832@nial.brq.redhat.com>
In-Reply-To: <20170504093822.2u4p7z7qjcyorbto@kamzik.brq.redhat.com>
References: <1493816238-33120-1-git-send-email-imammedo@redhat.com>
	<1493816238-33120-4-git-send-email-imammedo@redhat.com>
	<20170504093822.2u4p7z7qjcyorbto@kamzik.brq.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Thu, 04 May 2017 12:55:14 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2 03/24] hw/arm/virt: use
 machine->possible_cpus for storing possible topology info
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Eduardo Habkost <ehabkost@redhat.com>, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
	Shannon Zhao <zhaoshenglong@huawei.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: qCFZc1dM4R45

On Thu, 4 May 2017 11:38:22 +0200
Andrew Jones <drjones@redhat.com> wrote:

> On Wed, May 03, 2017 at 02:56:57PM +0200, Igor Mammedov wrote:
> > for now precalculate and store mp_afinity in possible_cpus
> > as ARM cpus don't have socket/core/thread-id properties yet.
> > In follow patches possible_cpus will be used for storing
> > and setting NUMA node mapping and replace legacy bitmap
> > based numa_info[node_id].node_cpu/numa_get_node_for_cpu()
> > 
> > For the lack of better idea, this patch cannibalizes
> > possible_cpus.cpus[x].props.thread_id so that
> > *_cpu_index_to_props() callback could return addressable
> > by props CPU which will be used by machine_set_cpu_numa_node()
> > in follow up patches to assign a CPU to node. But
> > cannibalizing is fine for now as that thread_id isn't exposed
> > to users (no hotpluggable_cpus callback support for ARM yet)
> > and it will be used only internally until 'device_add cpu'
> > is supported where we can decide on which properties to use.
> > 
> > Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> > ---
> > v2:
> >   (Drew)
> >     - discarding result of possible_cpu_arch_ids() makes
> >       call not obvious and is confusing. Instead assign
> >       possible_cpu_arch_ids() result to local var and use
> >       it instead of direct access to machine->possible_cpus
> >       field, as it's done in pc.c
> > ---
> >  hw/arm/virt.c | 40 +++++++++++++++++++++++++++++++++++++---
> >  1 file changed, 37 insertions(+), 3 deletions(-)
> > 
> > diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> > index 61ae437..e2c5626 100644
> > --- a/hw/arm/virt.c
> > +++ b/hw/arm/virt.c
> > @@ -1221,6 +1221,8 @@ static void machvirt_init(MachineState *machine)
> >  {
> >      VirtMachineState *vms = VIRT_MACHINE(machine);
> >      VirtMachineClass *vmc = VIRT_MACHINE_GET_CLASS(machine);
> > +    MachineClass *mc = MACHINE_GET_CLASS(machine);
> > +    const CPUArchIdList *possible_cpus;
> >      qemu_irq pic[NUM_IRQS];
> >      MemoryRegion *sysmem = get_system_memory();
> >      MemoryRegion *secure_sysmem = NULL;
> > @@ -1344,10 +1346,16 @@ static void machvirt_init(MachineState *machine)
> >          exit(1);
> >      }
> >  
> > -    for (n = 0; n < smp_cpus; n++) {
> > -        Object *cpuobj = object_new(typename);
> > +    possible_cpus = mc->possible_cpu_arch_ids(machine);
> > +    for (n = 0; n < possible_cpus->len; n++) {
> > +        Object *cpuobj;
> >  
> > -        object_property_set_int(cpuobj, virt_cpu_mp_affinity(vms, n),
> > +        if (n >= smp_cpus) {
> > +            break;
> > +        }  
> 
> Why the break instead of just looping 'n < smp_cpus' like x86 does? Is
> there some future work where looping up to possible_cpus->len (aka
> max_cpus) is what we'll eventually want? If so, then we need a TODO
> comment here. If not, then we should clean this up by removing the break.
There is no plans to loop here upto possible_cpus->len.

It seemed to me more consistent/safer to use index limited
by possible_cpus->len to index possible_cpus->cpus[n] array
than index limited by smp_cpus though the former currently is
always less than smp_cpus.

If you prefer 'n < smp_cpus' loop, then I can switch to it.

> 
> Thanks,
> drew
> 
> > +
> > +        cpuobj = object_new(typename);
> > +        object_property_set_int(cpuobj, possible_cpus->cpus[n].arch_id,
> >                                  "mp-affinity", NULL);
> >  
> >          if (!vms->secure) {
> > @@ -1527,6 +1535,31 @@ static void virt_set_gic_version(Object *obj, const char *value, Error **errp)
> >      }
> >  }
> >  
> > +static const CPUArchIdList *virt_possible_cpu_arch_ids(MachineState *ms)
> > +{
> > +    int n;
> > +    VirtMachineState *vms = VIRT_MACHINE(ms);
> > +
> > +    if (ms->possible_cpus) {
> > +        assert(ms->possible_cpus->len == max_cpus);
> > +        return ms->possible_cpus;
> > +    }
> > +
> > +    ms->possible_cpus = g_malloc0(sizeof(CPUArchIdList) +
> > +                                  sizeof(CPUArchId) * max_cpus);
> > +    ms->possible_cpus->len = max_cpus;
> > +    for (n = 0; n < ms->possible_cpus->len; n++) {
> > +        ms->possible_cpus->cpus[n].arch_id =
> > +            virt_cpu_mp_affinity(vms, n);
> > +        ms->possible_cpus->cpus[n].props.has_thread_id = true;
> > +        ms->possible_cpus->cpus[n].props.thread_id = n;
> > +
> > +        /* TODO: add 'has_node/node' here to describe
> > +           to which node core belongs */
> > +    }
> > +    return ms->possible_cpus;
> > +}
> > +
> >  static void virt_machine_class_init(ObjectClass *oc, void *data)
> >  {
> >      MachineClass *mc = MACHINE_CLASS(oc);
> > @@ -1543,6 +1576,7 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
> >      mc->pci_allow_0_address = true;
> >      /* We know we will never create a pre-ARMv7 CPU which needs 1K pages */
> >      mc->minimum_page_bits = 12;
> > +    mc->possible_cpu_arch_ids = virt_possible_cpu_arch_ids;
> >  }
> >  
> >  static const TypeInfo virt_machine_info = {
> > -- 
> > 2.7.4
> >   
> 

