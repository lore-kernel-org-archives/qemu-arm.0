Received: by 10.80.166.35 with SMTP id d32csp296338edc;
        Sun, 9 Oct 2016 20:15:12 -0700 (PDT)
X-Received: by 10.55.42.73 with SMTP id q70mr32002050qkh.282.1476069312765;
        Sun, 09 Oct 2016 20:15:12 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c38si8529784qta.156.2016.10.09.20.15.12
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 09 Oct 2016 20:15:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:46992 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1btR3Y-0000tS-2N
	for alex.bennee@linaro.org; Sun, 09 Oct 2016 23:15:12 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37126)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1btQmh-0002yt-OS
	for qemu-arm@nongnu.org; Sun, 09 Oct 2016 22:57:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1btQmd-0003Dp-Ef
	for qemu-arm@nongnu.org; Sun, 09 Oct 2016 22:57:47 -0400
Received: from mx1.redhat.com ([209.132.183.28]:37466)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>)
	id 1btQmd-0003Cw-5U; Sun, 09 Oct 2016 22:57:43 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4691D80083;
	Mon, 10 Oct 2016 02:57:41 +0000 (UTC)
Received: from redhat.com (vpn-53-157.rdu2.redhat.com [10.10.53.157])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with SMTP
	id u9A2vdI1016720; Sun, 9 Oct 2016 22:57:39 -0400
Date: Mon, 10 Oct 2016 05:57:39 +0300
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Message-ID: <1476057841-21108-5-git-send-email-mst@redhat.com>
References: <1476057841-21108-1-git-send-email-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1476057841-21108-1-git-send-email-mst@redhat.com>
X-Mutt-Fcc: =sent
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Mon, 10 Oct 2016 02:57:41 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PULL 04/33] numa: reduce code duplication by adding
 helper numa_get_node_for_cpu()
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
	Eduardo Habkost <ehabkost@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
	Alexander Graf <agraf@suse.de>, qemu-arm@nongnu.org,
	qemu-ppc@nongnu.org, Shannon Zhao <shannon.zhao@linaro.org>,
	Shannon Zhao <zhaoshenglong@huawei.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>,
	David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: QSLQfGGy0Z6n

From: Igor Mammedov <imammedo@redhat.com>

Replace repeated pattern

    for (i = 0; i < nb_numa_nodes; i++) {
        if (test_bit(idx, numa_info[i].node_cpu)) {
           ...
           break;

with a helper function to lookup numa node index for cpu.

Suggested-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
Reviewed-by: Shannon Zhao <shannon.zhao@linaro.org>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/sysemu/numa.h    |  3 +++
 hw/arm/virt-acpi-build.c |  6 ++----
 hw/arm/virt.c            |  7 +++----
 hw/i386/acpi-build.c     |  7 ++-----
 hw/i386/pc.c             |  8 +++-----
 hw/ppc/spapr_cpu_core.c  |  6 ++----
 numa.c                   | 12 ++++++++++++
 7 files changed, 27 insertions(+), 22 deletions(-)

diff --git a/include/sysemu/numa.h b/include/sysemu/numa.h
index bb184c9..4da808a 100644
--- a/include/sysemu/numa.h
+++ b/include/sysemu/numa.h
@@ -32,4 +32,7 @@ void numa_set_mem_node_id(ram_addr_t addr, uint64_t size, uint32_t node);
 void numa_unset_mem_node_id(ram_addr_t addr, uint64_t size, uint32_t node);
 uint32_t numa_get_node(ram_addr_t addr, Error **errp);
 
+/* on success returns node index in numa_info,
+ * on failure returns nb_numa_nodes */
+int numa_get_node_for_cpu(int idx);
 #endif
diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index 7b39b1d..c77525d 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -427,11 +427,9 @@ build_srat(GArray *table_data, BIOSLinker *linker, VirtGuestInfo *guest_info)
     uint32_t *cpu_node = g_malloc0(guest_info->smp_cpus * sizeof(uint32_t));
 
     for (i = 0; i < guest_info->smp_cpus; i++) {
-        for (j = 0; j < nb_numa_nodes; j++) {
-            if (test_bit(i, numa_info[j].node_cpu)) {
+        j = numa_get_node_for_cpu(i);
+        if (j < nb_numa_nodes) {
                 cpu_node[i] = j;
-                break;
-            }
         }
     }
 
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 0f6305d..795740d 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -413,10 +413,9 @@ static void fdt_add_cpu_nodes(const VirtBoardInfo *vbi)
                                   armcpu->mp_affinity);
         }
 
-        for (i = 0; i < nb_numa_nodes; i++) {
-            if (test_bit(cpu, numa_info[i].node_cpu)) {
-                qemu_fdt_setprop_cell(vbi->fdt, nodename, "numa-node-id", i);
-            }
+        i = numa_get_node_for_cpu(cpu);
+        if (i < nb_numa_nodes) {
+            qemu_fdt_setprop_cell(vbi->fdt, nodename, "numa-node-id", i);
         }
 
         g_free(nodename);
diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index c20bc71..e999654 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -2410,18 +2410,15 @@ build_srat(GArray *table_data, BIOSLinker *linker, MachineState *machine)
     srat->reserved1 = cpu_to_le32(1);
 
     for (i = 0; i < apic_ids->len; i++) {
-        int j;
+        int j = numa_get_node_for_cpu(i);
         int apic_id = apic_ids->cpus[i].arch_id;
 
         core = acpi_data_push(table_data, sizeof *core);
         core->type = ACPI_SRAT_PROCESSOR_APIC;
         core->length = sizeof(*core);
         core->local_apic_id = apic_id;
-        for (j = 0; j < nb_numa_nodes; j++) {
-            if (test_bit(i, numa_info[j].node_cpu)) {
+        if (j < nb_numa_nodes) {
                 core->proximity_lo = j;
-                break;
-            }
         }
         memset(core->proximity_hi, 0, 3);
         core->local_sapic_eid = 0;
diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 2d6d792..93ff49c 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -779,11 +779,9 @@ static FWCfgState *bochs_bios_init(AddressSpace *as, PCMachineState *pcms)
     for (i = 0; i < max_cpus; i++) {
         unsigned int apic_id = x86_cpu_apic_id_from_index(i);
         assert(apic_id < pcms->apic_id_limit);
-        for (j = 0; j < nb_numa_nodes; j++) {
-            if (test_bit(i, numa_info[j].node_cpu)) {
-                numa_fw_cfg[apic_id + 1] = cpu_to_le64(j);
-                break;
-            }
+        j = numa_get_node_for_cpu(i);
+        if (j < nb_numa_nodes) {
+            numa_fw_cfg[apic_id + 1] = cpu_to_le64(j);
         }
     }
     for (i = 0; i < nb_numa_nodes; i++) {
diff --git a/hw/ppc/spapr_cpu_core.c b/hw/ppc/spapr_cpu_core.c
index 35d1873..bc922bc 100644
--- a/hw/ppc/spapr_cpu_core.c
+++ b/hw/ppc/spapr_cpu_core.c
@@ -69,11 +69,9 @@ void spapr_cpu_init(sPAPRMachineState *spapr, PowerPCCPU *cpu, Error **errp)
     }
 
     /* Set NUMA node for the added CPUs  */
-    for (i = 0; i < nb_numa_nodes; i++) {
-        if (test_bit(cs->cpu_index, numa_info[i].node_cpu)) {
+    i = numa_get_node_for_cpu(cs->cpu_index);
+    if (i < nb_numa_nodes) {
             cs->numa_node = i;
-            break;
-        }
     }
 
     xics_cpu_setup(spapr->xics, cpu);
diff --git a/numa.c b/numa.c
index 6289f46..9c09e45 100644
--- a/numa.c
+++ b/numa.c
@@ -550,3 +550,15 @@ MemdevList *qmp_query_memdev(Error **errp)
     object_child_foreach(obj, query_memdev, &list);
     return list;
 }
+
+int numa_get_node_for_cpu(int idx)
+{
+    int i;
+
+    for (i = 0; i < nb_numa_nodes; i++) {
+        if (test_bit(idx, numa_info[i].node_cpu)) {
+            break;
+        }
+    }
+    return i;
+}
-- 
MST

