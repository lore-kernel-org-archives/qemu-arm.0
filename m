Received: by 10.25.0.6 with SMTP id 6csp239263lfa;
        Wed, 10 May 2017 04:33:46 -0700 (PDT)
X-Received: by 10.200.44.36 with SMTP id d33mr5256705qta.51.1494416026413;
        Wed, 10 May 2017 04:33:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1494416026; cv=none;
        d=google.com; s=arc-20160816;
        b=C1T7XgU2HC9a4aZnBc+AktTpGirc4tV/g+5xkU/3iN9e7/RDMNaHudD+Y4wTZIg4vA
         y2kKJ1KeCUkM2FJcxAXAw5gm5RUTSaRFuB2Jq+sQ73kiyeOW4odrNgliFDY8bqVBhJPZ
         zr+3fW3smSMD/JhAbpiLZIYwZAYFiAQ0ZQkQU0h7u+r92pYBl5adETnJSwlnyKDtMeFs
         FQ6+Gwzy5NwSKIqKi9jnptEHQhxqNmcRbLkZCnf+8Bpqn99LZaJlFTfe8WOd+dHELG5L
         KXFtsEJOWJ8ILoLadH1SPj1xRoO4tZGxbYmLSnde666RnIZ2Pq8s15YaITIZXndaml/j
         GxsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-filter:dmarc-filter
         :arc-authentication-results;
        bh=0XO9ruQKz3oxo3tOck/wHNpEbS27BdukbM0OM+/WsXs=;
        b=fLu8w6seRNg6rp0q3ZGSnEyne7J9ctlsoKeNknPYEZB6d8ZfMFA6YTWunk+VwAnjlr
         iFmeWHwL2eTuYq05WiMgccVLXtljE1gIAlyZmECNL5sKb+4oGhguDOplbQCreU0bIAi/
         41CZs3YO7bW7MEmlzokme4ArwnWnyN/ENXvqbwtHB8vB+qAZjTdL6IU4qiZJ2/7Y2Vr3
         557O3HoV75YsIrJD5PC+PImuVpm5fOdOO6fm/h2jzqqfWfRmYT6g+6BhaPgAgSxxXIuf
         0PLCU0CoxdDWwV2DRK5XIsO3oDSQmk+jLVnb9KB7RrgSsaaFVmYsUajCTZrwzGGWMmyy
         nqEA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q5si3011790qkb.137.2017.05.10.04.33.46
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 10 May 2017 04:33:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:41929 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1d8PsH-00026E-Pi
	for alex.bennee@linaro.org; Wed, 10 May 2017 07:33:45 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35379)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1d8PpC-0007eh-41
	for qemu-arm@nongnu.org; Wed, 10 May 2017 07:30:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1d8Pp9-0001ks-98
	for qemu-arm@nongnu.org; Wed, 10 May 2017 07:30:34 -0400
Received: from mx1.redhat.com ([209.132.183.28]:48722)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1d8Pp9-0001kW-0y; Wed, 10 May 2017 07:30:31 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E72A580475;
	Wed, 10 May 2017 11:30:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com E72A580475
Authentication-Results: ext-mx04.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx04.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=imammedo@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com E72A580475
Received: from dell-r430-03.lab.eng.brq.redhat.com
	(dell-r430-03.lab.eng.brq.redhat.com [10.34.112.60])
	by smtp.corp.redhat.com (Postfix) with ESMTP id F32D47DFF5;
	Wed, 10 May 2017 11:30:27 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Date: Wed, 10 May 2017 13:29:52 +0200
Message-Id: <1494415802-227633-9-git-send-email-imammedo@redhat.com>
In-Reply-To: <1494415802-227633-1-git-send-email-imammedo@redhat.com>
References: <1494415802-227633-1-git-send-email-imammedo@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Wed, 10 May 2017 11:30:30 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v3 08/18] pc: get numa node mapping from
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
X-TUID: FNmn0cAdRQdp

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Andrew Jones <drjones@redhat.com>
---
v3:
   drop numa_[has_]node_id() wrappers (ehabkost, dwg)
v2:
   use numa_[has_]node_id() wrappers (Drew)
---
 hw/acpi/cpu.c        |  7 +++----
 hw/i386/acpi-build.c | 11 ++++-------
 hw/i386/pc.c         | 18 ++++++++++--------
 3 files changed, 17 insertions(+), 19 deletions(-)

diff --git a/hw/acpi/cpu.c b/hw/acpi/cpu.c
index 8c719d3..a233fe1 100644
--- a/hw/acpi/cpu.c
+++ b/hw/acpi/cpu.c
@@ -503,7 +503,6 @@ void build_cpus_aml(Aml *table, MachineState *machine, CPUHotplugFeatures opts,
 
         /* build Processor object for each processor */
         for (i = 0; i < arch_ids->len; i++) {
-            int j;
             Aml *dev;
             Aml *uid = aml_int(i);
             GArray *madt_buf = g_array_new(0, 1, 1);
@@ -557,9 +556,9 @@ void build_cpus_aml(Aml *table, MachineState *machine, CPUHotplugFeatures opts,
              * as a result _PXM is required for all CPUs which might
              * be hot-plugged. For simplicity, add it for all CPUs.
              */
-            j = numa_get_node_for_cpu(i);
-            if (j < nb_numa_nodes) {
-                aml_append(dev, aml_name_decl("_PXM", aml_int(j)));
+            if (arch_ids->cpus[i].props.has_node_id) {
+                aml_append(dev, aml_name_decl("_PXM",
+                           aml_int(arch_ids->cpus[i].props.node_id)));
             }
 
             aml_append(cpus_dev, dev);
diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index 2458ebc..e3f8254 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -2306,7 +2306,8 @@ build_srat(GArray *table_data, BIOSLinker *linker, MachineState *machine)
     srat->reserved1 = cpu_to_le32(1);
 
     for (i = 0; i < apic_ids->len; i++) {
-        int j = numa_get_node_for_cpu(i);
+        int node_id = apic_ids->cpus[i].props.has_node_id ?
+            apic_ids->cpus[i].props.node_id : 0;
         uint32_t apic_id = apic_ids->cpus[i].arch_id;
 
         if (apic_id < 255) {
@@ -2316,9 +2317,7 @@ build_srat(GArray *table_data, BIOSLinker *linker, MachineState *machine)
             core->type = ACPI_SRAT_PROCESSOR_APIC;
             core->length = sizeof(*core);
             core->local_apic_id = apic_id;
-            if (j < nb_numa_nodes) {
-                core->proximity_lo = j;
-            }
+            core->proximity_lo = node_id;
             memset(core->proximity_hi, 0, 3);
             core->local_sapic_eid = 0;
             core->flags = cpu_to_le32(1);
@@ -2329,9 +2328,7 @@ build_srat(GArray *table_data, BIOSLinker *linker, MachineState *machine)
             core->type = ACPI_SRAT_PROCESSOR_x2APIC;
             core->length = sizeof(*core);
             core->x2apic_id = cpu_to_le32(apic_id);
-            if (j < nb_numa_nodes) {
-                core->proximity_domain = cpu_to_le32(j);
-            }
+            core->proximity_domain = cpu_to_le32(node_id);
             core->flags = cpu_to_le32(1);
         }
     }
diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 455300f..e36a375 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -747,7 +747,9 @@ static FWCfgState *bochs_bios_init(AddressSpace *as, PCMachineState *pcms)
 {
     FWCfgState *fw_cfg;
     uint64_t *numa_fw_cfg;
-    int i, j;
+    int i;
+    const CPUArchIdList *cpus;
+    MachineClass *mc = MACHINE_GET_CLASS(pcms);
 
     fw_cfg = fw_cfg_init_io_dma(FW_CFG_IO_BASE, FW_CFG_IO_BASE + 4, as);
     fw_cfg_add_i16(fw_cfg, FW_CFG_NB_CPUS, pcms->boot_cpus);
@@ -782,12 +784,12 @@ static FWCfgState *bochs_bios_init(AddressSpace *as, PCMachineState *pcms)
      */
     numa_fw_cfg = g_new0(uint64_t, 1 + pcms->apic_id_limit + nb_numa_nodes);
     numa_fw_cfg[0] = cpu_to_le64(nb_numa_nodes);
-    for (i = 0; i < max_cpus; i++) {
-        unsigned int apic_id = x86_cpu_apic_id_from_index(i);
+    cpus = mc->possible_cpu_arch_ids(MACHINE(pcms));
+    for (i = 0; i < cpus->len; i++) {
+        unsigned int apic_id = cpus->cpus[i].arch_id;
         assert(apic_id < pcms->apic_id_limit);
-        j = numa_get_node_for_cpu(i);
-        if (j < nb_numa_nodes) {
-            numa_fw_cfg[apic_id + 1] = cpu_to_le64(j);
+        if (cpus->cpus[i].props.has_node_id) {
+            numa_fw_cfg[apic_id + 1] = cpu_to_le64(cpus->cpus[i].props.node_id);
         }
     }
     for (i = 0; i < nb_numa_nodes; i++) {
@@ -1984,8 +1986,8 @@ static void pc_cpu_pre_plug(HotplugHandler *hotplug_dev,
     cs = CPU(cpu);
     cs->cpu_index = idx;
 
-    node_id = numa_get_node_for_cpu(cs->cpu_index);
-    if (node_id == nb_numa_nodes) {
+    node_id = cpu_slot->props.node_id;
+    if (!cpu_slot->props.has_node_id) {
         /* by default CPUState::numa_node was 0 if it's not set via CLI
          * keep it this way for now but in future we probably should
          * refuse to start up with incomplete numa mapping */
-- 
2.7.4

