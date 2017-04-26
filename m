Received: by 10.25.0.144 with SMTP id 138csp231633lfa;
        Wed, 26 Apr 2017 04:28:10 -0700 (PDT)
X-Received: by 10.200.35.59 with SMTP id a56mr34109443qta.81.1493206090051;
        Wed, 26 Apr 2017 04:28:10 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z27si25209911qtb.18.2017.04.26.04.28.09
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 26 Apr 2017 04:28:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:54383 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1d3L7B-0002Tc-DV
	for alex.bennee@linaro.org; Wed, 26 Apr 2017 07:28:09 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39528)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1d3L73-0002SD-9G
	for qemu-arm@nongnu.org; Wed, 26 Apr 2017 07:28:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1d3L70-00015p-3M
	for qemu-arm@nongnu.org; Wed, 26 Apr 2017 07:28:01 -0400
Received: from mx1.redhat.com ([209.132.183.28]:51458)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <drjones@redhat.com>)
	id 1d3L6z-000153-Qk; Wed, 26 Apr 2017 07:27:58 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9B844811A7;
	Wed, 26 Apr 2017 11:27:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 9B844811A7
Authentication-Results: ext-mx03.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx03.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=drjones@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 9B844811A7
Received: from kamzik.brq.redhat.com (kamzik.brq.redhat.com [10.34.1.143])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A312E7BE5E;
	Wed, 26 Apr 2017 11:27:54 +0000 (UTC)
Date: Wed, 26 Apr 2017 13:27:52 +0200
From: Andrew Jones <drjones@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Message-ID: <20170426112752.r55p4rgignqungpn@kamzik.brq.redhat.com>
References: <1490189568-167621-1-git-send-email-imammedo@redhat.com>
	<1490189568-167621-15-git-send-email-imammedo@redhat.com>
	<20170425170634.2mqfc45fujwy7qu3@kamzik.brq.redhat.com>
	<20170426125433.428a6c1b@nial.brq.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170426125433.428a6c1b@nial.brq.redhat.com>
User-Agent: Mutt/1.6.0.1 (2016-04-01)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Wed, 26 Apr 2017 11:27:56 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH for-2.10 14/23] virt-arm: get
 numa node mapping from possible_cpus instead of numa_get_node_for_cpu()
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
X-TUID: VrghY4wRV4MF

On Wed, Apr 26, 2017 at 12:54:33PM +0200, Igor Mammedov wrote:
> On Tue, 25 Apr 2017 19:06:34 +0200
> Andrew Jones <drjones@redhat.com> wrote:
> 
> > On Wed, Mar 22, 2017 at 02:32:39PM +0100, Igor Mammedov wrote:
> > > Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> > > ---
> > >  hw/arm/virt-acpi-build.c | 19 +++++++------------
> > >  hw/arm/virt.c            | 13 +++++++------
> > >  2 files changed, 14 insertions(+), 18 deletions(-)
> > > 
> > > diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> > > index 0835e59..ce7499c 100644
> > > --- a/hw/arm/virt-acpi-build.c
> > > +++ b/hw/arm/virt-acpi-build.c
> > > @@ -486,30 +486,25 @@ build_srat(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
> > >      AcpiSystemResourceAffinityTable *srat;
> > >      AcpiSratProcessorGiccAffinity *core;
> > >      AcpiSratMemoryAffinity *numamem;
> > > -    int i, j, srat_start;
> > > +    int i, srat_start;
> > >      uint64_t mem_base;
> > > -    uint32_t *cpu_node = g_malloc0(vms->smp_cpus * sizeof(uint32_t));
> > > -
> > > -    for (i = 0; i < vms->smp_cpus; i++) {
> > > -        j = numa_get_node_for_cpu(i);
> > > -        if (j < nb_numa_nodes) {
> > > -                cpu_node[i] = j;
> > > -        }
> > > -    }
> > > +    MachineClass *mc = MACHINE_GET_CLASS(vms);
> > > +    const CPUArchIdList *cpu_list = mc->possible_cpu_arch_ids(MACHINE(vms));
> > >  
> > >      srat_start = table_data->len;
> > >      srat = acpi_data_push(table_data, sizeof(*srat));
> > >      srat->reserved1 = cpu_to_le32(1);
> > >  
> > > -    for (i = 0; i < vms->smp_cpus; ++i) {
> > > +    for (i = 0; i < cpu_list->len; ++i) {
> > > +        int node_id = cpu_list->cpus[i].props.has_node_id ?
> > > +            cpu_list->cpus[i].props.node_id : 0;
> > >          core = acpi_data_push(table_data, sizeof(*core));
> > >          core->type = ACPI_SRAT_PROCESSOR_GICC;
> > >          core->length = sizeof(*core);
> > > -        core->proximity = cpu_to_le32(cpu_node[i]);
> > > +        core->proximity = cpu_to_le32(node_id);
> > >          core->acpi_processor_uid = cpu_to_le32(i);
> > >          core->flags = cpu_to_le32(1);
> > >      }
> > > -    g_free(cpu_node);
> > >  
> > >      mem_base = vms->memmap[VIRT_MEM].base;
> > >      for (i = 0; i < nb_numa_nodes; ++i) {
> > > diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> > > index 68d44f3..0a75df5 100644
> > > --- a/hw/arm/virt.c
> > > +++ b/hw/arm/virt.c
> > > @@ -338,7 +338,7 @@ static void fdt_add_cpu_nodes(const VirtMachineState *vms)
> > >  {
> > >      int cpu;
> > >      int addr_cells = 1;
> > > -    unsigned int i;
> > > +    const MachineState *ms = MACHINE(vms);
> > >  
> > >      /*
> > >       * From Documentation/devicetree/bindings/arm/cpus.txt
> > > @@ -369,6 +369,7 @@ static void fdt_add_cpu_nodes(const VirtMachineState *vms)
> > >      for (cpu = vms->smp_cpus - 1; cpu >= 0; cpu--) {
> > >          char *nodename = g_strdup_printf("/cpus/cpu@%d", cpu);
> > >          ARMCPU *armcpu = ARM_CPU(qemu_get_cpu(cpu));
> > > +        CPUState *cs = CPU(armcpu);
> > >  
> > >          qemu_fdt_add_subnode(vms->fdt, nodename);
> > >          qemu_fdt_setprop_string(vms->fdt, nodename, "device_type", "cpu");
> > > @@ -389,9 +390,9 @@ static void fdt_add_cpu_nodes(const VirtMachineState *vms)
> > >                                    armcpu->mp_affinity);
> > >          }
> > >  
> > > -        i = numa_get_node_for_cpu(cpu);
> > > -        if (i < nb_numa_nodes) {
> > > -            qemu_fdt_setprop_cell(vms->fdt, nodename, "numa-node-id", i);
> > > +        if (ms->possible_cpus->cpus[cs->cpu_index].props.has_node_id) {
> > > +            qemu_fdt_setprop_cell(vms->fdt, nodename, "numa-node-id",
> > > +                ms->possible_cpus->cpus[cs->cpu_index].props.node_id);
> > >          }
> > >  
> > >          g_free(nodename);
> > > @@ -1378,8 +1379,8 @@ static void machvirt_init(MachineState *machine)
> > >          cs = CPU(cpuobj);
> > >          cs->cpu_index = n;
> > >  
> > > -        node_id = numa_get_node_for_cpu(cs->cpu_index);
> > > -        if (node_id == nb_numa_nodes) {
> > > +        node_id = machine->possible_cpus->cpus[cs->cpu_index].props.node_id;
> > > +        if (!machine->possible_cpus->cpus[cs->cpu_index].props.has_node_id) {
> > >              /* by default CPUState::numa_node was 0 if it's not set via CLI
> > >               * keep it this way for now but in future we probably should
> > >               * refuse to start up with incomplete numa mapping */
> > > -- 
> > > 2.7.4
> > > 
> > >  
> > 
> > We now have many machine->possible_cpus->cpus[index].props.[has_]node_id
> > instances. I think we need inline accessors added to include/sysemu/numa.h
> > like
> > 
> >  static inline bool numa_has_node_id(MachineState *ms, int index)
> >  {
> >    return ms->possible_cpus->cpus[index].props.has_node_id;
> >  }
> > 
> >  static inline int numa_node_id(MachineState *ms, int index)
> >  {
> >    return ms->possible_cpus->cpus[index].props.node_id;
> >  }
> > 
> >  ...
> > 
> > to improve readability and maintainability.
> I dislike this kind of one-line wrappers as it hurts readability
> and maintainability of code for me as I'm forced to jump
> around code every time I see such wrapper to recall what and
> how it does. Code still fits in one line so I'd like to keep
> it wrapper-less in this case if you don't insist on the change.

I prefer to jump around in code (jump once, read many) to going
blind looking for one or two char differences in 50 char long
variable names. So, to whatever degree I can, I insist :-)

> 
> > 
> > Or, instead, we could provide macros to allow assignments, e.g.
> > 
> >  #define NUMA_HAS_NODE_ID(ms, index) \
> >    ((ms)->possible_cpus->cpus[index].props.has_node_id)
> >  #define NUMA_NODE_ID(ms, index) \
> >    ((ms)->possible_cpus->cpus[index].props.node_id)
> ditto + worse debuggability 

I prefer the functions myself. I think the assignments to these
properties are rare enough that we only need the read accessors.

Thanks,
drew
