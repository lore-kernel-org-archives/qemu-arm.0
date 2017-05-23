Received: by 10.103.124.15 with SMTP id x15csp1866129vsc;
        Tue, 23 May 2017 07:41:49 -0700 (PDT)
X-Received: by 10.55.43.168 with SMTP id r40mr27651035qkr.59.1495550509258;
        Tue, 23 May 2017 07:41:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1495550509; cv=none;
        d=google.com; s=arc-20160816;
        b=IOrHMFOyXhftcfFm1RS8YtJ5SQF/RRZAd+rTaLLfR20f87qFl0Z/Tkipp6ckydtDmo
         +r1Y8M4RuUF/jp6InjHvFJPeqkeyP4LsMNSiS6KPJRiRQPsvjXG2nVQ0BcdkhpHA6kTB
         EDNrIlMD1hLzDcLBHRtEIXY7qJTs8XoDQSExqYUHH/WJdNoZDLsfP64eXaGKnWoMzSNB
         m02rLIQwsZhvKDVl+M5VVJ3Lja6ZmUMuNadF533fG/UKvbBwbbKaxdZbzNX7soGYBfWW
         nLuNWUuxYOdwR5wCE9dxU0LWBxWGxsOdyMj40GYWY0eqXXcHuKmOqTcPbCKtvB0cknoE
         GIIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-filter:dmarc-filter
         :arc-authentication-results;
        bh=6Us1/+FQJoslvCavLDokjlnlig2WGDBLXBmsFj+MDkk=;
        b=TrZdmkKHJBWQn+F38upXutbz3qDud74yp0QzkmjkBk+YE+8NBH3LfvZFvLl5wN4jpE
         AXqa7++3U75472vZva0KCvTvDH8MMluJRQ5DOKtDJMxv/aOVf1PhYeF2kCWYxzQODdAb
         PVEFaiDec8cLaqjTmsvJkzjdPlSsxgjWR9s9Z5ut6Aothuwhlhj3ZOQXxxZeFE0fCMC7
         qwBtk1MLLGyhU1K0pGkoneJ9tVcktKGsV+Z+CuvVAzjk+b4UzbYguD8Woz0ditgh5Ykn
         gJGL9Gf99S/A4ZtQNx8/rZI0VaY/5OZmeioREoPvI1+FfU7yBCuadGRxuAOI6R4zry9q
         M6fA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q58si22173491qtf.122.2017.05.23.07.41.49
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 23 May 2017 07:41:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:49423 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dDB0O-0002HV-P4
	for alex.bennee@linaro.org; Tue, 23 May 2017 10:41:48 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48452)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1dDAxg-0008Iz-IA
	for qemu-arm@nongnu.org; Tue, 23 May 2017 10:39:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1dDAxf-0002aT-CR
	for qemu-arm@nongnu.org; Tue, 23 May 2017 10:39:00 -0400
Received: from mx1.redhat.com ([209.132.183.28]:40768)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1dDAxf-0002Yr-3L; Tue, 23 May 2017 10:38:59 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0398B8123E;
	Tue, 23 May 2017 14:38:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 0398B8123E
Authentication-Results: ext-mx01.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx01.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=imammedo@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 0398B8123E
Received: from dell-r430-03.lab.eng.brq.redhat.com
	(dell-r430-03.lab.eng.brq.redhat.com [10.34.112.60])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 96BEA7814F;
	Tue, 23 May 2017 14:38:56 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue, 23 May 2017 16:38:48 +0200
Message-Id: <1495550330-34087-4-git-send-email-imammedo@redhat.com>
In-Reply-To: <1495550330-34087-1-git-send-email-imammedo@redhat.com>
References: <1495550330-34087-1-git-send-email-imammedo@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Tue, 23 May 2017 14:38:58 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v2 3/5] numa: make sure that all cpus in has
 has_node_id set if numa is enabled
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
	Eduardo Habkost <ehabkost@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 7FGWmEC6IKOR

It fixes/add missing _PXM object for non mapped CPU (x86)
and missing fdt node (virt-arm).

It ensures that possible_cpus contains complete mapping if
numa is enabled by the time machine_init() is executed.

As result non completely mapped CPUs:
 1) appear in ACPI/fdt blobs
 2) QMP query-hotpluggable-cpus command shows bound nodes for such CPUs
 3) allows to drop checks for has_node_id in numa only code,
   reducing number of invariants incomplete mapping could produce
 4) moves fixup/implicit node init from runtime numa_cpu_pre_plug()
   (when CPU object is created) to machine_numa_finish_init() which
   helps to fix [1, 2] and make possible_cpus complete source
   of numa mapping available even before CPUs are created.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
 hw/arm/virt-acpi-build.c |  4 +---
 hw/core/machine.c        | 16 ++++++++++------
 hw/i386/acpi-build.c     |  3 +--
 hw/i386/pc.c             |  4 +---
 numa.c                   |  7 +------
 5 files changed, 14 insertions(+), 20 deletions(-)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index e585206..977a794 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -496,12 +496,10 @@ build_srat(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
     srat->reserved1 = cpu_to_le32(1);
 
     for (i = 0; i < cpu_list->len; ++i) {
-        int node_id = cpu_list->cpus[i].props.has_node_id ?
-            cpu_list->cpus[i].props.node_id : 0;
         core = acpi_data_push(table_data, sizeof(*core));
         core->type = ACPI_SRAT_PROCESSOR_GICC;
         core->length = sizeof(*core);
-        core->proximity = cpu_to_le32(node_id);
+        core->proximity = cpu_to_le32(cpu_list->cpus[i].props.node_id);
         core->acpi_processor_uid = cpu_to_le32(i);
         core->flags = cpu_to_le32(1);
     }
diff --git a/hw/core/machine.c b/hw/core/machine.c
index aaf3cff..964b75d 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -720,19 +720,23 @@ static void machine_numa_finish_init(MachineState *machine)
         const CPUArchId *cpu_slot = &possible_cpus->cpus[i];
 
         if (!cpu_slot->props.has_node_id) {
-            if (default_mapping) {
-                /* fetch default mapping from board and enable it */
-                CpuInstanceProperties props = cpu_slot->props;
-                props.has_node_id = true;
-                machine_set_cpu_numa_node(machine, &props, &error_fatal);
-            } else {
+            /* fetch default mapping from board and enable it */
+            CpuInstanceProperties props = cpu_slot->props;
+
+            if (!default_mapping) {
                 /* record slots with not set mapping,
                  * TODO: make it hard error in future */
                 char *cpu_str = cpu_slot_to_string(cpu_slot);
                 g_string_append_printf(s, "%sCPU %d [%s]",
                                        s->len ? ", " : "", i, cpu_str);
                 g_free(cpu_str);
+
+                /* non mapped cpus used to fallback to node 0 */
+                props.node_id = 0;
             }
+
+            props.has_node_id = true;
+            machine_set_cpu_numa_node(machine, &props, &error_fatal);
         }
     }
     if (s->len) {
diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index afcadac..873880d 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -2335,8 +2335,7 @@ build_srat(GArray *table_data, BIOSLinker *linker, MachineState *machine)
     srat->reserved1 = cpu_to_le32(1);
 
     for (i = 0; i < apic_ids->len; i++) {
-        int node_id = apic_ids->cpus[i].props.has_node_id ?
-            apic_ids->cpus[i].props.node_id : 0;
+        int node_id = apic_ids->cpus[i].props.node_id;
         uint32_t apic_id = apic_ids->cpus[i].arch_id;
 
         if (apic_id < 255) {
diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index cf09949..84f0a6f 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -788,9 +788,7 @@ static FWCfgState *bochs_bios_init(AddressSpace *as, PCMachineState *pcms)
     for (i = 0; i < cpus->len; i++) {
         unsigned int apic_id = cpus->cpus[i].arch_id;
         assert(apic_id < pcms->apic_id_limit);
-        if (cpus->cpus[i].props.has_node_id) {
-            numa_fw_cfg[apic_id + 1] = cpu_to_le64(cpus->cpus[i].props.node_id);
-        }
+        numa_fw_cfg[apic_id + 1] = cpu_to_le64(cpus->cpus[i].props.node_id);
     }
     for (i = 0; i < nb_numa_nodes; i++) {
         numa_fw_cfg[pcms->apic_id_limit + 1 + i] =
diff --git a/numa.c b/numa.c
index e30702e..4ef6dea 100644
--- a/numa.c
+++ b/numa.c
@@ -513,17 +513,12 @@ void numa_cpu_pre_plug(const CPUArchId *slot, DeviceState *dev, Error **errp)
     int node_id = object_property_get_int(OBJECT(dev), "node-id", &error_abort);
 
     if (node_id == CPU_UNSET_NUMA_NODE_ID) {
-        /* by default CPUState::numa_node was 0 if it wasn't set explicitly
-         * TODO: make it error when incomplete numa mapping support is removed
-         */
-        node_id = 0;
-
         /* due to bug in libvirt, it doesn't pass node-id from props on
          * device_add as expected, so we have to fix it up here */
         if (slot->props.has_node_id) {
             node_id = slot->props.node_id;
+            object_property_set_int(OBJECT(dev), node_id, "node-id", errp);
         }
-        object_property_set_int(OBJECT(dev), node_id, "node-id", errp);
     } else if (node_id != slot->props.node_id) {
         error_setg(errp, "node-id=%d must match numa node specified "
                    "with -numa option", node_id);
-- 
2.7.4

