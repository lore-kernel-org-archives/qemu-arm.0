Received: by 10.25.0.6 with SMTP id 6csp239630lfa;
        Wed, 10 May 2017 04:34:28 -0700 (PDT)
X-Received: by 10.200.48.149 with SMTP id v21mr5216832qta.84.1494416068195;
        Wed, 10 May 2017 04:34:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1494416068; cv=none;
        d=google.com; s=arc-20160816;
        b=ojk84kqSdvxw8+jkc0eU33QutGlbU2l0m2i2GyBmtSkfmao19awjy3+aCL9TDU/0ji
         YxDAwoi2dj1cv30gG6hWuOywE8g6yswgm+d3C3WnFCJ2urYQ7J0HSAXUZIGQ9wgKJoDL
         HmAf66W9+1rQJB+TI5CqtcL05nxk1tUOV0Br0i7iornbgeWx8hqtWvgR6QupQu3C3C7G
         r6ILvlOgWYe8vjlKvUcYOTPgMUeK7IxHvFwA3/WdbMuOJZ+gIbvcpcsS9klFAJC8M0yt
         XiwYf1g7d+SvCy520lLPhbRW0XmtyWRss4laCk3laKk2qBnrsR9p9jqxGwbsN14iDkUd
         N53A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-filter:dmarc-filter
         :arc-authentication-results;
        bh=d6iL1FBU77YLzTXMoBQbPXW8/azbCo4ZxjaQf0GMbm0=;
        b=SNRoXfUm0kN0yGLXiSJXBJFy6jGxjjHDhT+vttZ7C+eVI7XaZmKm5LVV+ZjoLkJBmT
         3qXpXyM0ecmekNShAimeSmb/ut0U6SG0AEKaguaCaV9CpgC3TzvhHVJnw2d8TsJcNeW8
         m2exj238YG2LPDWnurev+SyMNqD7sezN2x1PgqynXJX1sRph7Kelmp6IjqNSK1OmS2Dy
         SjnLy5P7eqKEqXLzeDPOfdPwjO+2j4QgUjd0PESQoLSC0bAJ/YM75PhycrJbMwNo+rEo
         5FcU3VPvXfED36PzSnwj+rSdsG5jgDiFSlttIThm7DoA3x1GS/byE9Lk7p+JvP9zJx1T
         1VIg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v12si2859243qtc.242.2017.05.10.04.34.28
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 10 May 2017 04:34:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:41937 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1d8Psx-0002g7-IS
	for alex.bennee@linaro.org; Wed, 10 May 2017 07:34:27 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35452)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1d8PpE-0007i1-Om
	for qemu-arm@nongnu.org; Wed, 10 May 2017 07:30:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1d8PpD-0001mQ-PL
	for qemu-arm@nongnu.org; Wed, 10 May 2017 07:30:36 -0400
Received: from mx1.redhat.com ([209.132.183.28]:65282)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1d8PpD-0001lu-Gn; Wed, 10 May 2017 07:30:35 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 627DCC059722;
	Wed, 10 May 2017 11:30:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 627DCC059722
Authentication-Results: ext-mx08.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx08.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=imammedo@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 627DCC059722
Received: from dell-r430-03.lab.eng.brq.redhat.com
	(dell-r430-03.lab.eng.brq.redhat.com [10.34.112.60])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 705037DFF5;
	Wed, 10 May 2017 11:30:32 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Date: Wed, 10 May 2017 13:29:54 +0200
Message-Id: <1494415802-227633-11-git-send-email-imammedo@redhat.com>
In-Reply-To: <1494415802-227633-1-git-send-email-imammedo@redhat.com>
References: <1494415802-227633-1-git-send-email-imammedo@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Wed, 10 May 2017 11:30:34 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v3 10/18] virt-arm: get numa node mapping from
 possible_cpus instead of numa_get_node_for_cpu()
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
	Eduardo Habkost <ehabkost@redhat.com>, qemu-arm@nongnu.org,
	qemu-ppc@nongnu.org, Shannon Zhao <zhaoshenglong@huawei.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: zJgJqmm0bD8H

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Andrew Jones <drjones@redhat.com>
---
v3:
   drop numa_[has_]node_id() wrappers (ehabkost, dwg)
v2:
   use numa_[has_]node_id() wrappers (Drew)
---
 hw/arm/virt-acpi-build.c | 19 +++++++------------
 hw/arm/virt.c            | 13 +++++++------
 2 files changed, 14 insertions(+), 18 deletions(-)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index 0835e59..ce7499c 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -486,30 +486,25 @@ build_srat(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
     AcpiSystemResourceAffinityTable *srat;
     AcpiSratProcessorGiccAffinity *core;
     AcpiSratMemoryAffinity *numamem;
-    int i, j, srat_start;
+    int i, srat_start;
     uint64_t mem_base;
-    uint32_t *cpu_node = g_malloc0(vms->smp_cpus * sizeof(uint32_t));
-
-    for (i = 0; i < vms->smp_cpus; i++) {
-        j = numa_get_node_for_cpu(i);
-        if (j < nb_numa_nodes) {
-                cpu_node[i] = j;
-        }
-    }
+    MachineClass *mc = MACHINE_GET_CLASS(vms);
+    const CPUArchIdList *cpu_list = mc->possible_cpu_arch_ids(MACHINE(vms));
 
     srat_start = table_data->len;
     srat = acpi_data_push(table_data, sizeof(*srat));
     srat->reserved1 = cpu_to_le32(1);
 
-    for (i = 0; i < vms->smp_cpus; ++i) {
+    for (i = 0; i < cpu_list->len; ++i) {
+        int node_id = cpu_list->cpus[i].props.has_node_id ?
+            cpu_list->cpus[i].props.node_id : 0;
         core = acpi_data_push(table_data, sizeof(*core));
         core->type = ACPI_SRAT_PROCESSOR_GICC;
         core->length = sizeof(*core);
-        core->proximity = cpu_to_le32(cpu_node[i]);
+        core->proximity = cpu_to_le32(node_id);
         core->acpi_processor_uid = cpu_to_le32(i);
         core->flags = cpu_to_le32(1);
     }
-    g_free(cpu_node);
 
     mem_base = vms->memmap[VIRT_MEM].base;
     for (i = 0; i < nb_numa_nodes; ++i) {
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 653b4d7..c7c8159 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -338,7 +338,7 @@ static void fdt_add_cpu_nodes(const VirtMachineState *vms)
 {
     int cpu;
     int addr_cells = 1;
-    unsigned int i;
+    const MachineState *ms = MACHINE(vms);
 
     /*
      * From Documentation/devicetree/bindings/arm/cpus.txt
@@ -369,6 +369,7 @@ static void fdt_add_cpu_nodes(const VirtMachineState *vms)
     for (cpu = vms->smp_cpus - 1; cpu >= 0; cpu--) {
         char *nodename = g_strdup_printf("/cpus/cpu@%d", cpu);
         ARMCPU *armcpu = ARM_CPU(qemu_get_cpu(cpu));
+        CPUState *cs = CPU(armcpu);
 
         qemu_fdt_add_subnode(vms->fdt, nodename);
         qemu_fdt_setprop_string(vms->fdt, nodename, "device_type", "cpu");
@@ -389,9 +390,9 @@ static void fdt_add_cpu_nodes(const VirtMachineState *vms)
                                   armcpu->mp_affinity);
         }
 
-        i = numa_get_node_for_cpu(cpu);
-        if (i < nb_numa_nodes) {
-            qemu_fdt_setprop_cell(vms->fdt, nodename, "numa-node-id", i);
+        if (ms->possible_cpus->cpus[cs->cpu_index].props.has_node_id) {
+            qemu_fdt_setprop_cell(vms->fdt, nodename, "numa-node-id",
+                ms->possible_cpus->cpus[cs->cpu_index].props.node_id);
         }
 
         g_free(nodename);
@@ -1363,8 +1364,8 @@ static void machvirt_init(MachineState *machine)
         cs = CPU(cpuobj);
         cs->cpu_index = n;
 
-        node_id = numa_get_node_for_cpu(cs->cpu_index);
-        if (node_id == nb_numa_nodes) {
+        node_id = possible_cpus->cpus[cs->cpu_index].props.node_id;
+        if (!possible_cpus->cpus[cs->cpu_index].props.has_node_id) {
             /* by default CPUState::numa_node was 0 if it's not set via CLI
              * keep it this way for now but in future we probably should
              * refuse to start up with incomplete numa mapping */
-- 
2.7.4

