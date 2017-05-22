Received: by 10.103.124.15 with SMTP id x15csp1250119vsc;
        Sun, 21 May 2017 23:39:50 -0700 (PDT)
X-Received: by 10.31.169.142 with SMTP id s136mr7502086vke.126.1495435190936;
        Sun, 21 May 2017 23:39:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1495435190; cv=none;
        d=google.com; s=arc-20160816;
        b=QWAq5jvXAAbH18DdyXfdCIsZJ3YyewKNT48+p24NH9OvtU7YpbU5KSL8izdD3Dn/Lc
         WBhtuXejxR69WDblxaBJaJD6UIkzYe0PCVLkoLDvIU9wLN8SdD8MLxrX3vSRKTvlfFCq
         gqpipeiM7hMZSxuo9evIDLwpUBFqooPIYooH2OO1wuCd6T27uNxswpUb+jdkirFQuZus
         mtsTXxVtl8nuLYoMlWNEiecucGx4A5y5ce0iIPwPRvv7oycwVDL+theXTIm08r36I7dE
         djjw1UDG7g/Y+ou5uKfIu+Hx9+Qq6lYfwmt86Gb0sn1hlqbZhNWOPF92orFF/rww49GR
         CpTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:to:from:date:dkim-filter:dmarc-filter
         :arc-authentication-results;
        bh=oXKlvRt0TILBi3Y+3O29EwWiBnJvfMbN3uZN1y7yamY=;
        b=N70RyIhUoTS+pGvyclLsKd2kaJlQbG3KAfnjt7ARugcWjSp52Vlww5RhhMPdlSDfTD
         bPKEAkhSOzSBGPBl3J8yJNL2FS1/cMHo0F5aMu6OFy2hXr7b9Il8NCtmxZT7r9vC+9y7
         E1xzg7ZRfUHQ6Dqfmhlbec0batnfYeO9CZ7D6DRxBp1HbWC/5OMIEAQK61W4yRLRlfFh
         VhKNHTa0AdHIi7oFHgQNleGyaLdn2lL7HNNF6ox4uMQUM5FNi3T95FU3f+UnS0Q7+TxF
         vpFoAPVvCpzfjDtqEB1p3D4FXZRA5MOPJS8B+f0awc41aboVJ2y4ffLAaOhRd/+5bhJd
         9C1Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u23si7196775uaa.142.2017.05.21.23.39.50
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 21 May 2017 23:39:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:40847 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dCh0Q-0000rV-Dv
	for alex.bennee@linaro.org; Mon, 22 May 2017 02:39:50 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39193)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1dCh0H-0000q2-JN
	for qemu-arm@nongnu.org; Mon, 22 May 2017 02:39:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1dCh0C-0006f5-MC
	for qemu-arm@nongnu.org; Mon, 22 May 2017 02:39:41 -0400
Received: from mx1.redhat.com ([209.132.183.28]:40786)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1dCh0C-0006e6-Ao; Mon, 22 May 2017 02:39:36 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 24F077F6A8;
	Mon, 22 May 2017 06:39:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 24F077F6A8
Authentication-Results: ext-mx01.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx01.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=imammedo@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 24F077F6A8
Received: from nial.brq.redhat.com (dhcp-1-118.brq.redhat.com [10.34.1.118])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9356F18976;
	Mon, 22 May 2017 06:39:32 +0000 (UTC)
Date: Mon, 22 May 2017 08:39:31 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Eduardo Habkost <ehabkost@redhat.com>
Message-ID: <20170522083931.568735a4@nial.brq.redhat.com>
In-Reply-To: <20170518181913.GN4748@thinpad.lan.raisama.net>
References: <1495094971-177754-1-git-send-email-imammedo@redhat.com>
	<1495094971-177754-2-git-send-email-imammedo@redhat.com>
	<20170518181913.GN4748@thinpad.lan.raisama.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Mon, 22 May 2017 06:39:34 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH 1/3] numa: consolidate cpu_preplug
 fixups/checks for pc/arm/spapr
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
Cc: Andrew Jones <drjones@redhat.com>, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
	qemu-devel@nongnu.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +yZREnwC2NOd

On Thu, 18 May 2017 15:19:13 -0300
Eduardo Habkost <ehabkost@redhat.com> wrote:

> On Thu, May 18, 2017 at 10:09:29AM +0200, Igor Mammedov wrote:
> > Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> > ---
> >  include/sysemu/numa.h |  1 +
> >  hw/arm/virt.c         | 16 ++--------------
> >  hw/i386/pc.c          | 17 +----------------
> >  hw/ppc/spapr.c        | 17 +----------------
> >  numa.c                | 22 ++++++++++++++++++++++
> >  5 files changed, 27 insertions(+), 46 deletions(-)
> > 
> > diff --git a/include/sysemu/numa.h b/include/sysemu/numa.h
> > index 7ffde5b..610eece 100644
> > --- a/include/sysemu/numa.h
> > +++ b/include/sysemu/numa.h
> > @@ -35,4 +35,5 @@ void numa_legacy_auto_assign_ram(MachineClass *mc, NodeInfo *nodes,
> >                                   int nb_nodes, ram_addr_t size);
> >  void numa_default_auto_assign_ram(MachineClass *mc, NodeInfo *nodes,
> >                                    int nb_nodes, ram_addr_t size);
> > +void numa_cpu_pre_plug(const CPUArchId *slot, DeviceState *dev, Error **errp);  
> 
> I understand an explicitly call to numa_cpu_pre_plug() is needed
> on spapr_core_pre_plug() because it is not handling a TYPE_CPU
> object. But why not adding a numa_cpu_pre_plug() call to
> cpu_common_realizefn(), so the explicit calls in machvirt_init()
> and pc_cpu_pre_plug() are not necessary?
1. of the reasons is not to pollute all cpus with numa code

> Adding the code to cpu_common_realizefn() would also ensure
> CPUState::node_id is set consistently, even if hotplug was not
> done at thread level.
2. not all CPUs have node-id property
3. call site of thread_realize() in encapsulating object (spapr_core)
   might be somewhere in the middle of parent's realize and likely
   failure would need proper parent state rollback/cleanup.
4. and finely it's not cpu's responsibility to assign/check
   node-id property. It's machine's job that owns/manages topology
   layout. It' the same like with socket/core/thread properties.
   So for the sake of small optimization, I'm not really willing
   to violate that.
 
> >  #endif
> > diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> > index c7c8159..ce676df 100644
> > --- a/hw/arm/virt.c
> > +++ b/hw/arm/virt.c
> > @@ -1351,7 +1351,6 @@ static void machvirt_init(MachineState *machine)
> >      for (n = 0; n < possible_cpus->len; n++) {
> >          Object *cpuobj;
> >          CPUState *cs;
> > -        int node_id;
> >  
> >          if (n >= smp_cpus) {
> >              break;
> > @@ -1364,19 +1363,8 @@ static void machvirt_init(MachineState *machine)
> >          cs = CPU(cpuobj);
> >          cs->cpu_index = n;
> >  
> > -        node_id = possible_cpus->cpus[cs->cpu_index].props.node_id;
> > -        if (!possible_cpus->cpus[cs->cpu_index].props.has_node_id) {
> > -            /* by default CPUState::numa_node was 0 if it's not set via CLI
> > -             * keep it this way for now but in future we probably should
> > -             * refuse to start up with incomplete numa mapping */
> > -             node_id = 0;
> > -        }
> > -        if (cs->numa_node == CPU_UNSET_NUMA_NODE_ID) {
> > -            cs->numa_node = node_id;
> > -        } else {
> > -            /* CPU isn't device_add compatible yet, this shouldn't happen */
> > -            error_setg(&error_abort, "user set node-id not implemented");
> > -        }
> > +        numa_cpu_pre_plug(&possible_cpus->cpus[cs->cpu_index], DEVICE(cpuobj),
> > +                          &error_fatal);
> >  
> >          if (!vms->secure) {
> >              object_property_set_bool(cpuobj, false, "has_el3", NULL);
> > diff --git a/hw/i386/pc.c b/hw/i386/pc.c
> > index e36a375..d83c158 100644
> > --- a/hw/i386/pc.c
> > +++ b/hw/i386/pc.c
> > @@ -1895,7 +1895,6 @@ static void pc_cpu_pre_plug(HotplugHandler *hotplug_dev,
> >                              DeviceState *dev, Error **errp)
> >  {
> >      int idx;
> > -    int node_id;
> >      CPUState *cs;
> >      CPUArchId *cpu_slot;
> >      X86CPUTopoInfo topo;
> > @@ -1986,21 +1985,7 @@ static void pc_cpu_pre_plug(HotplugHandler *hotplug_dev,
> >      cs = CPU(cpu);
> >      cs->cpu_index = idx;
> >  
> > -    node_id = cpu_slot->props.node_id;
> > -    if (!cpu_slot->props.has_node_id) {
> > -        /* by default CPUState::numa_node was 0 if it's not set via CLI
> > -         * keep it this way for now but in future we probably should
> > -         * refuse to start up with incomplete numa mapping */
> > -        node_id = 0;
> > -    }
> > -    if (cs->numa_node == CPU_UNSET_NUMA_NODE_ID) {
> > -        cs->numa_node = node_id;
> > -    } else if (cs->numa_node != node_id) {
> > -            error_setg(errp, "node-id %d must match numa node specified"
> > -                "with -numa option for cpu-index %d",
> > -                cs->numa_node, cs->cpu_index);
> > -            return;
> > -    }
> > +    numa_cpu_pre_plug(cpu_slot, dev, errp);
> >  }
> >  
> >  static void pc_machine_device_pre_plug_cb(HotplugHandler *hotplug_dev,
> > diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
> > index 0980d73..c7fee8b 100644
> > --- a/hw/ppc/spapr.c
> > +++ b/hw/ppc/spapr.c
> > @@ -2831,11 +2831,9 @@ static void spapr_core_pre_plug(HotplugHandler *hotplug_dev, DeviceState *dev,
> >      MachineClass *mc = MACHINE_GET_CLASS(hotplug_dev);
> >      Error *local_err = NULL;
> >      CPUCore *cc = CPU_CORE(dev);
> > -    sPAPRCPUCore *sc = SPAPR_CPU_CORE(dev);
> >      char *base_core_type = spapr_get_cpu_core_type(machine->cpu_model);
> >      const char *type = object_get_typename(OBJECT(dev));
> >      CPUArchId *core_slot;
> > -    int node_id;
> >      int index;
> >  
> >      if (dev->hotplugged && !mc->has_hotpluggable_cpus) {
> > @@ -2870,20 +2868,7 @@ static void spapr_core_pre_plug(HotplugHandler *hotplug_dev, DeviceState *dev,
> >          goto out;
> >      }
> >  
> > -    node_id = core_slot->props.node_id;
> > -    if (!core_slot->props.has_node_id) {
> > -        /* by default CPUState::numa_node was 0 if it's not set via CLI
> > -         * keep it this way for now but in future we probably should
> > -         * refuse to start up with incomplete numa mapping */
> > -        node_id = 0;
> > -    }
> > -    if (sc->node_id == CPU_UNSET_NUMA_NODE_ID) {
> > -        sc->node_id = node_id;
> > -    } else if (sc->node_id != node_id) {
> > -        error_setg(&local_err, "node-id %d must match numa node specified"
> > -            "with -numa option for cpu-index %d", sc->node_id, cc->core_id);
> > -        goto out;
> > -    }
> > +    numa_cpu_pre_plug(core_slot, dev, &local_err);
> >  
> >  out:
> >      g_free(base_core_type);
> > diff --git a/numa.c b/numa.c
> > index ca73145..0115bfd 100644
> > --- a/numa.c
> > +++ b/numa.c
> > @@ -534,6 +534,28 @@ void parse_numa_opts(MachineState *ms)
> >      }
> >  }
> >  
> > +void numa_cpu_pre_plug(const CPUArchId *slot, DeviceState *dev, Error **errp)
> > +{
> > +    int node_id = object_property_get_int(OBJECT(dev), "node-id", errp);  
> 
> You don't check for errors here. If they will never happen,
> should we use &error_abort instead?
sure, I'll use &error_abort in v2

> > +
> > +    if (node_id == CPU_UNSET_NUMA_NODE_ID) {
> > +        /* by default CPUState::numa_node was 0 if it wasn't set explicitly
> > +         * TODO: make it error when incomplete numa mapping support is removed
> > +         */
> > +        node_id = 0;
> > +
> > +        /* due to bug in libvirt, it doesn't pass node-id from props on
> > +         * device_add as expected, so we have to fix it up here */
> > +        if (slot->props.has_node_id) {
> > +            node_id = slot->props.node_id;
> > +        }
> > +        object_property_set_int(OBJECT(dev), node_id, "node-id", errp);
> > +    } else if (node_id != slot->props.node_id) {
> > +        error_setg(errp, "node-id=%d must match numa node specified "
> > +                   "with -numa option", node_id);  
> 
> There's less detail on the error message, now. Probably harmless,
> but I would like to understand when exactly this can be
> triggered: is device_add the only way to trigger this error
> message?
error is triggered only during -device/device_add so there were no
need in more verbose error as device_add will report its arguments
(affected cpu in this case)


> 
> > +    }
> > +}
> > +
> >  static void allocate_system_memory_nonnuma(MemoryRegion *mr, Object *owner,
> >                                             const char *name,
> >                                             uint64_t ram_size)
> > -- 
> > 2.7.4
> >   
> 

