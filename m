Received: by 10.25.0.6 with SMTP id 6csp371182lfa;
        Fri, 26 May 2017 09:06:46 -0700 (PDT)
X-Received: by 10.200.36.162 with SMTP id s31mr3512338qts.224.1495814806191;
        Fri, 26 May 2017 09:06:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1495814806; cv=none;
        d=google.com; s=arc-20160816;
        b=E6Suaxy6hVtHLH/wfMBbk9XOGeAUZJJjYZIq/oGXTrDy59bG2sMw1BhZe5t/APdBrg
         lePItDvEFla8WIsh3BYMDkwf3wxsoIQRStVGdhsrjnHCCNz6qnbBQGOLYcnDXv4RMRVV
         D3qgjTp5SCwcuq18z7YjphtsAJMGKLW+6Am0sKb1v3WoOn1V/ZZO4QMiU25vTHvtTDgV
         yFtBdmtWWMw0uZeXkz4nnXi5U0wIfXQu9LtJsou3aL9kQ8hc8zQE+VbS6blVfiAwmO2P
         lSb6Uirf6s2kw+4/ApwJ296tQOFZUdglH0phgk9KAaYoJJmDv+NVl4/nhznKH2dzBkLs
         l8Fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dkim-filter:dmarc-filter:arc-authentication-results;
        bh=hS2Y13KHMpFAazZesgcHM8HiMkiOVw1jmLny9sSQV3Q=;
        b=MrMtgMp1SpDkXdCsZb8krNRxvYMFBYs4Yb1fHwgKeV98bhZJM5Dx3TlmLkRh8K7TiH
         lJKfLNCyB4p605LPIx5FlmsYJs0a8I80q21o7VLawJzL0ARB5cdwUKuZmz7gYNquP7qK
         tHzvGBvxq7kXsvZYDo/1Xwf8r8dg7RPHpvJgaqGC0FjKJV0HzRz4CGFBiINQJWQYsn9g
         wDjFnMhYBhcImHM84LCyAr7W1/SoBR8GTo7WqNuL/UvxoxxwNhlthtsqF1WIcFpkFjN6
         YSKSPlxnTCqiUPUAiX2+CH1JU5LfKwJqKa5gkHyvQi924BNH/E3GLSR+LQslnRIGm+Nd
         kJHA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a22si1180338qkb.306.2017.05.26.09.06.45
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 26 May 2017 09:06:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:37487 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dEHlF-0001y8-MF
	for alex.bennee@linaro.org; Fri, 26 May 2017 12:06:45 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58620)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1dEHlB-0001y3-U0
	for qemu-arm@nongnu.org; Fri, 26 May 2017 12:06:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1dEHl6-0000uf-RJ
	for qemu-arm@nongnu.org; Fri, 26 May 2017 12:06:41 -0400
Received: from mx1.redhat.com ([209.132.183.28]:44996)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1dEHl6-0000uT-He; Fri, 26 May 2017 12:06:36 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1D8AE80046;
	Fri, 26 May 2017 16:06:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 1D8AE80046
Authentication-Results: ext-mx03.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx03.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=ehabkost@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 1D8AE80046
Received: from localhost (ovpn-116-57.gru2.redhat.com [10.97.116.57])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9443B5DD6D;
	Fri, 26 May 2017 16:06:32 +0000 (UTC)
Date: Fri, 26 May 2017 13:06:30 -0300
From: Eduardo Habkost <ehabkost@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Message-ID: <20170526160630.GT32274@thinpad.lan.raisama.net>
References: <1495550330-34087-1-git-send-email-imammedo@redhat.com>
	<1495550330-34087-4-git-send-email-imammedo@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1495550330-34087-4-git-send-email-imammedo@redhat.com>
X-Fnord: you can see the fnord
User-Agent: Mutt/1.8.0 (2017-02-23)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Fri, 26 May 2017 16:06:35 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2 3/5] numa: make sure that all
 cpus in has has_node_id set if numa is enabled
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
X-TUID: cmlwMF11LZab

On Tue, May 23, 2017 at 04:38:48PM +0200, Igor Mammedov wrote:
> It fixes/add missing _PXM object for non mapped CPU (x86)
> and missing fdt node (virt-arm).
> 
> It ensures that possible_cpus contains complete mapping if
> numa is enabled by the time machine_init() is executed.
> 
> As result non completely mapped CPUs:
>  1) appear in ACPI/fdt blobs
>  2) QMP query-hotpluggable-cpus command shows bound nodes for such CPUs
>  3) allows to drop checks for has_node_id in numa only code,
>    reducing number of invariants incomplete mapping could produce
>  4) moves fixup/implicit node init from runtime numa_cpu_pre_plug()
>    (when CPU object is created) to machine_numa_finish_init() which
>    helps to fix [1, 2] and make possible_cpus complete source
>    of numa mapping available even before CPUs are created.
> 
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>

Code that will be affected, but will keep the same behavior:

* pre_plug handler when node-id is omitted on device_add: it
  already sets node_id=0 if !has_node_id
  * However, pre_plug behavior is being changed when node-id is
    set. See below.
* build_srat() (both x86 and arm): already sets node_id = 0 if
  !has_node_id
* bochs_bios_init(): already uses g_new0(), so already had
  omitted entries set to 0.

Affected code that will change behavior with this patch:

* pre_plug handler when node-id is set:
  * See my reply to patch 1/5.  This patch restores the old
    behavior that rejected node-id != 0 on omitted CPUs.
* ACPI _PXM initialization
* arm/virt.c: numa-node-id will now be set for all CPUs
* QMP/HMP query-hotpluggable-cpus output
  * Desirable change, as now the QMP command will reflect what
    the guest is really seeing

Due to the _PXM and FDT changes, I have the same objection I have
for patch 4/5: if we are going to break user expectations when
using incomplete NUMA mappings, let's do that only once (when we
start rejecting incomplete NUMA mappings).

A few extra comments about the has_node_id checks below:

> ---
>  hw/arm/virt-acpi-build.c |  4 +---
>  hw/core/machine.c        | 16 ++++++++++------
>  hw/i386/acpi-build.c     |  3 +--
>  hw/i386/pc.c             |  4 +---
>  numa.c                   |  7 +------
>  5 files changed, 14 insertions(+), 20 deletions(-)
> 
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index e585206..977a794 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -496,12 +496,10 @@ build_srat(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>      srat->reserved1 = cpu_to_le32(1);
>  
>      for (i = 0; i < cpu_list->len; ++i) {
> -        int node_id = cpu_list->cpus[i].props.has_node_id ?
> -            cpu_list->cpus[i].props.node_id : 0;
>          core = acpi_data_push(table_data, sizeof(*core));
>          core->type = ACPI_SRAT_PROCESSOR_GICC;
>          core->length = sizeof(*core);
> -        core->proximity = cpu_to_le32(node_id);
> +        core->proximity = cpu_to_le32(cpu_list->cpus[i].props.node_id);
>          core->acpi_processor_uid = cpu_to_le32(i);
>          core->flags = cpu_to_le32(1);
>      }
> diff --git a/hw/core/machine.c b/hw/core/machine.c
> index aaf3cff..964b75d 100644
> --- a/hw/core/machine.c
> +++ b/hw/core/machine.c
> @@ -720,19 +720,23 @@ static void machine_numa_finish_init(MachineState *machine)
>          const CPUArchId *cpu_slot = &possible_cpus->cpus[i];
>  
>          if (!cpu_slot->props.has_node_id) {
> -            if (default_mapping) {
> -                /* fetch default mapping from board and enable it */
> -                CpuInstanceProperties props = cpu_slot->props;
> -                props.has_node_id = true;
> -                machine_set_cpu_numa_node(machine, &props, &error_fatal);
> -            } else {
> +            /* fetch default mapping from board and enable it */
> +            CpuInstanceProperties props = cpu_slot->props;
> +
> +            if (!default_mapping) {
>                  /* record slots with not set mapping,
>                   * TODO: make it hard error in future */
>                  char *cpu_str = cpu_slot_to_string(cpu_slot);
>                  g_string_append_printf(s, "%sCPU %d [%s]",
>                                         s->len ? ", " : "", i, cpu_str);
>                  g_free(cpu_str);
> +
> +                /* non mapped cpus used to fallback to node 0 */
> +                props.node_id = 0;
>              }
> +
> +            props.has_node_id = true;
> +            machine_set_cpu_numa_node(machine, &props, &error_fatal);
>          }
>      }
>      if (s->len) {
> diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> index afcadac..873880d 100644
> --- a/hw/i386/acpi-build.c
> +++ b/hw/i386/acpi-build.c
> @@ -2335,8 +2335,7 @@ build_srat(GArray *table_data, BIOSLinker *linker, MachineState *machine)
>      srat->reserved1 = cpu_to_le32(1);
>  
>      for (i = 0; i < apic_ids->len; i++) {
> -        int node_id = apic_ids->cpus[i].props.has_node_id ?
> -            apic_ids->cpus[i].props.node_id : 0;
> +        int node_id = apic_ids->cpus[i].props.node_id;

What about an assert(props.has_node_id) here?

>          uint32_t apic_id = apic_ids->cpus[i].arch_id;
>  
>          if (apic_id < 255) {
> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
> index cf09949..84f0a6f 100644
> --- a/hw/i386/pc.c
> +++ b/hw/i386/pc.c
> @@ -788,9 +788,7 @@ static FWCfgState *bochs_bios_init(AddressSpace *as, PCMachineState *pcms)
>      for (i = 0; i < cpus->len; i++) {
>          unsigned int apic_id = cpus->cpus[i].arch_id;
>          assert(apic_id < pcms->apic_id_limit);
> -        if (cpus->cpus[i].props.has_node_id) {
> -            numa_fw_cfg[apic_id + 1] = cpu_to_le64(cpus->cpus[i].props.node_id);
> -        }
> +        numa_fw_cfg[apic_id + 1] = cpu_to_le64(cpus->cpus[i].props.node_id);

Ditto.

>      }
>      for (i = 0; i < nb_numa_nodes; i++) {
>          numa_fw_cfg[pcms->apic_id_limit + 1 + i] =
> diff --git a/numa.c b/numa.c
> index e30702e..4ef6dea 100644
> --- a/numa.c
> +++ b/numa.c
> @@ -513,17 +513,12 @@ void numa_cpu_pre_plug(const CPUArchId *slot, DeviceState *dev, Error **errp)
>      int node_id = object_property_get_int(OBJECT(dev), "node-id", &error_abort);
>  
>      if (node_id == CPU_UNSET_NUMA_NODE_ID) {
> -        /* by default CPUState::numa_node was 0 if it wasn't set explicitly
> -         * TODO: make it error when incomplete numa mapping support is removed
> -         */
> -        node_id = 0;
> -
>          /* due to bug in libvirt, it doesn't pass node-id from props on
>           * device_add as expected, so we have to fix it up here */
>          if (slot->props.has_node_id) {
>              node_id = slot->props.node_id;
> +            object_property_set_int(OBJECT(dev), node_id, "node-id", errp);
>          }
> -        object_property_set_int(OBJECT(dev), node_id, "node-id", errp);

Why not removing the has_node_id check completely, here?

In case this patch get respun, I suggest also removing the
has_node_id check at: build_cpus_aml() _PXM code.

>      } else if (node_id != slot->props.node_id) {
>          error_setg(errp, "node-id=%d must match numa node specified "
>                     "with -numa option", node_id);
> -- 
> 2.7.4
> 
> 

-- 
Eduardo
