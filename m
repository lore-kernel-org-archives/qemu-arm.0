Received: by 10.25.85.209 with SMTP id j200csp100856lfb;
        Fri, 10 Jun 2016 10:41:06 -0700 (PDT)
X-Received: by 10.233.235.195 with SMTP id b186mr3164999qkg.191.1465580466198;
        Fri, 10 Jun 2016 10:41:06 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b11si4667110qte.87.2016.06.10.10.41.05
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 10 Jun 2016 10:41:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:43613 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bBQQb-0006Xd-GF
	for alex.bennee@linaro.org; Fri, 10 Jun 2016 13:41:05 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55813)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1bBQQU-0006UK-My
	for qemu-arm@nongnu.org; Fri, 10 Jun 2016 13:40:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1bBQQS-0000Qw-Ko
	for qemu-arm@nongnu.org; Fri, 10 Jun 2016 13:40:57 -0400
Received: from mx1.redhat.com ([209.132.183.28]:52612)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>)
	id 1bBQQS-0000Qs-DH; Fri, 10 Jun 2016 13:40:56 -0400
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E5AFAC05B1FD;
	Fri, 10 Jun 2016 17:40:55 +0000 (UTC)
Received: from hawk.localdomain.com (dhcp-1-122.brq.redhat.com [10.34.1.122])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with
	ESMTP id u5AHeVPa032552; Fri, 10 Jun 2016 13:40:53 -0400
From: Andrew Jones <drjones@redhat.com>
To: qemu-devel@nongnu.org, qemu-ppc@nongnu.org, qemu-arm@nongnu.org
Date: Fri, 10 Jun 2016 19:40:20 +0200
Message-Id: <1465580427-13596-10-git-send-email-drjones@redhat.com>
In-Reply-To: <1465580427-13596-1-git-send-email-drjones@redhat.com>
References: <1465580427-13596-1-git-send-email-drjones@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Fri, 10 Jun 2016 17:40:55 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH RFC 09/16] hw/i386/pc: don't use smp_cores,
 smp_threads
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
Cc: peter.maydell@linaro.org, ehabkost@redhat.com, agraf@suse.de,
	pbonzini@redhat.com, dgibson@redhat.com, imammedo@redhat.com,
	david@gibson.dropbear.id.au
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: sBKx/BCGK7CY

Use CPUState nr_cores,nr_threads and MachineState
cores,threads instead.

Signed-off-by: Andrew Jones <drjones@redhat.com>
---
 hw/i386/pc.c | 26 +++++++++++++++-----------
 1 file changed, 15 insertions(+), 11 deletions(-)

diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 7198ed533cc47..4fa86d6387ce9 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -27,7 +27,6 @@
 #include "hw/char/serial.h"
 #include "hw/i386/apic.h"
 #include "hw/i386/topology.h"
-#include "sysemu/cpus.h"
 #include "hw/block/fdc.h"
 #include "hw/ide.h"
 #include "hw/pci/pci.h"
@@ -682,12 +681,14 @@ void enable_compat_apic_id_mode(void)
  * no concept of "CPU index", and the NUMA tables on fw_cfg need the APIC ID of
  * all CPUs up to max_cpus.
  */
-static uint32_t x86_cpu_apic_id_from_index(unsigned int cpu_index)
+static uint32_t x86_cpu_apic_id_from_index(MachineState *ms,
+                                           unsigned int cpu_index)
 {
     uint32_t correct_id;
     static bool warned;
 
-    correct_id = x86_apicid_from_cpu_idx(smp_cores, smp_threads, cpu_index);
+    correct_id = x86_apicid_from_cpu_idx(ms->cores, ms->threads,
+                                         cpu_index);
     if (compat_apic_id_mode) {
         if (cpu_index != correct_id && !warned && !qtest_enabled()) {
             error_report("APIC IDs set in compatibility mode, "
@@ -778,7 +779,7 @@ static FWCfgState *bochs_bios_init(AddressSpace *as, PCMachineState *pcms)
     numa_fw_cfg = g_new0(uint64_t, 1 + pcms->apic_id_limit + nb_numa_nodes);
     numa_fw_cfg[0] = cpu_to_le64(nb_numa_nodes);
     for (i = 0; i < max_cpus; i++) {
-        unsigned int apic_id = x86_cpu_apic_id_from_index(i);
+        unsigned int apic_id = x86_cpu_apic_id_from_index(MACHINE(pcms), i);
         assert(apic_id < pcms->apic_id_limit);
         for (j = 0; j < nb_numa_nodes; j++) {
             if (test_bit(i, numa_info[j].node_cpu)) {
@@ -1066,7 +1067,7 @@ void pc_hot_add_cpu(const int64_t id, Error **errp)
 {
     X86CPU *cpu;
     MachineState *machine = MACHINE(qdev_get_machine());
-    int64_t apic_id = x86_cpu_apic_id_from_index(id);
+    int64_t apic_id = x86_cpu_apic_id_from_index(machine, id);
     Error *local_err = NULL;
 
     if (id < 0) {
@@ -1123,7 +1124,7 @@ void pc_cpus_init(PCMachineState *pcms)
      *
      * This is used for FW_CFG_MAX_CPUS. See comments on bochs_bios_init().
      */
-    pcms->apic_id_limit = x86_cpu_apic_id_from_index(max_cpus - 1) + 1;
+    pcms->apic_id_limit = x86_cpu_apic_id_from_index(machine, max_cpus - 1) + 1;
     if (pcms->apic_id_limit > ACPI_CPU_HOTPLUG_ID_LIMIT) {
         error_report("max_cpus is too large. APIC ID of last CPU is %u",
                      pcms->apic_id_limit - 1);
@@ -1133,10 +1134,12 @@ void pc_cpus_init(PCMachineState *pcms)
     pcms->possible_cpus = g_malloc0(sizeof(CPUArchIdList) +
                                     sizeof(CPUArchId) * max_cpus);
     for (i = 0; i < max_cpus; i++) {
-        pcms->possible_cpus->cpus[i].arch_id = x86_cpu_apic_id_from_index(i);
+        pcms->possible_cpus->cpus[i].arch_id =
+                x86_cpu_apic_id_from_index(machine, i);
         pcms->possible_cpus->len++;
         if (i < smp_cpus) {
-            cpu = pc_new_cpu(machine->cpu_model, x86_cpu_apic_id_from_index(i),
+            cpu = pc_new_cpu(machine->cpu_model,
+                             x86_cpu_apic_id_from_index(machine, i),
                              &error_fatal);
             pcms->possible_cpus->cpus[i].cpu = CPU(cpu);
             object_unref(OBJECT(cpu));
@@ -1193,7 +1196,7 @@ void pc_guest_info_init(PCMachineState *pcms)
                                      sizeof *pcms->node_cpu);
 
     for (i = 0; i < max_cpus; i++) {
-        unsigned int apic_id = x86_cpu_apic_id_from_index(i);
+        unsigned int apic_id = x86_cpu_apic_id_from_index(MACHINE(pcms), i);
         assert(apic_id < pcms->apic_id_limit);
         for (j = 0; j < nb_numa_nodes; j++) {
             if (test_bit(i, numa_info[j].node_cpu)) {
@@ -1940,9 +1943,10 @@ static void pc_machine_reset(void)
 
 static unsigned pc_cpu_index_to_socket_id(unsigned cpu_index)
 {
+    CPUState *cs = first_cpu;
     X86CPUTopoInfo topo;
-    x86_topo_ids_from_idx(smp_cores, smp_threads, cpu_index,
-                          &topo);
+
+    x86_topo_ids_from_idx(cs->nr_cores, cs->nr_threads, cpu_index, &topo);
     return topo.pkg_id;
 }
 
-- 
2.4.11

