Received: by 10.25.85.209 with SMTP id j200csp104194lfb;
        Fri, 10 Jun 2016 10:49:55 -0700 (PDT)
X-Received: by 10.55.123.6 with SMTP id w6mr3296934qkc.164.1465580994991;
        Fri, 10 Jun 2016 10:49:54 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c126si5028806qkf.208.2016.06.10.10.49.54
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 10 Jun 2016 10:49:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:43660 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bBQZ8-0005Vf-9A
	for alex.bennee@linaro.org; Fri, 10 Jun 2016 13:49:54 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56240)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1bBQQx-0006y6-Pz
	for qemu-devel@nongnu.org; Fri, 10 Jun 2016 13:41:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1bBQQq-0000YU-K4
	for qemu-devel@nongnu.org; Fri, 10 Jun 2016 13:41:26 -0400
Received: from mx1.redhat.com ([209.132.183.28]:51649)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>)
	id 1bBQQh-0000VW-Bw; Fri, 10 Jun 2016 13:41:11 -0400
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E1CDE81129;
	Fri, 10 Jun 2016 17:41:10 +0000 (UTC)
Received: from hawk.localdomain.com (dhcp-1-122.brq.redhat.com [10.34.1.122])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with
	ESMTP id u5AHeVPg032552; Fri, 10 Jun 2016 13:41:08 -0400
From: Andrew Jones <drjones@redhat.com>
To: qemu-devel@nongnu.org, qemu-ppc@nongnu.org, qemu-arm@nongnu.org
Date: Fri, 10 Jun 2016 19:40:26 +0200
Message-Id: <1465580427-13596-16-git-send-email-drjones@redhat.com>
In-Reply-To: <1465580427-13596-1-git-send-email-drjones@redhat.com>
References: <1465580427-13596-1-git-send-email-drjones@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Fri, 10 Jun 2016 17:41:10 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH RFC 15/16] smbios: don't use smp_cores,
 smp_threads
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, ehabkost@redhat.com, agraf@suse.de,
	pbonzini@redhat.com, dgibson@redhat.com, imammedo@redhat.com,
	david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +Zgm1dFEZO7q

SMBIOS needs cpu topology for Type4 tables, so we need to pass
it in. There are several parameters so we use a structure. There
are two callers (of non-legacy, which generates Type4 tables),
x86 and arm, so we also update both to pass the topology
parameters from their MachineState properties (directly in the
case of x86, indirectly through VirtGuestInfo in the case of arm).

Signed-off-by: Andrew Jones <drjones@redhat.com>
---
 hw/arm/virt.c              |  9 ++++++++-
 hw/i386/pc.c               | 13 ++++++++++---
 hw/smbios/smbios.c         | 20 +++++++++++---------
 include/hw/smbios/smbios.h | 10 ++++++++++
 4 files changed, 39 insertions(+), 13 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 769a49aa5be77..4482fab91c139 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1067,6 +1067,13 @@ static void virt_build_smbios(VirtGuestInfo *guest_info)
     uint8_t *smbios_tables, *smbios_anchor;
     size_t smbios_tables_len, smbios_anchor_len;
     const char *product = "QEMU Virtual Machine";
+    struct smbios_cpu_topology topo = {
+        .sockets = guest_info->sockets,
+        .cores   = guest_info->cores,
+        .threads = guest_info->threads,
+        .maxcpus = guest_info->maxcpus,
+        .cpus    = guest_info->cpus,
+    };
 
     if (!fw_cfg) {
         return;
@@ -1079,7 +1086,7 @@ static void virt_build_smbios(VirtGuestInfo *guest_info)
     smbios_set_defaults("QEMU", product,
                         "1.0", false, true, SMBIOS_ENTRY_POINT_30);
 
-    smbios_get_tables(NULL, 0, &smbios_tables, &smbios_tables_len,
+    smbios_get_tables(NULL, 0, &topo, &smbios_tables, &smbios_tables_len,
                       &smbios_anchor, &smbios_anchor_len);
 
     if (smbios_anchor) {
diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 4fa86d6387ce9..afea1a535a653 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -701,12 +701,19 @@ static uint32_t x86_cpu_apic_id_from_index(MachineState *ms,
     }
 }
 
-static void pc_build_smbios(FWCfgState *fw_cfg)
+static void pc_build_smbios(MachineState *ms, FWCfgState *fw_cfg)
 {
     uint8_t *smbios_tables, *smbios_anchor;
     size_t smbios_tables_len, smbios_anchor_len;
     struct smbios_phys_mem_area *mem_array;
     unsigned i, array_count;
+    struct smbios_cpu_topology topo = {
+        .sockets = ms->sockets,
+        .cores   = ms->cores,
+        .threads = ms->threads,
+        .maxcpus = ms->maxcpus,
+        .cpus    = ms->cpus,
+    };
 
     smbios_tables = smbios_get_table_legacy(&smbios_tables_len);
     if (smbios_tables) {
@@ -725,7 +732,7 @@ static void pc_build_smbios(FWCfgState *fw_cfg)
             array_count++;
         }
     }
-    smbios_get_tables(mem_array, array_count,
+    smbios_get_tables(mem_array, array_count, &topo,
                       &smbios_tables, &smbios_tables_len,
                       &smbios_anchor, &smbios_anchor_len);
     g_free(mem_array);
@@ -1176,7 +1183,7 @@ void pc_machine_done(Notifier *notifier, void *data)
 
     acpi_setup();
     if (pcms->fw_cfg) {
-        pc_build_smbios(pcms->fw_cfg);
+        pc_build_smbios(MACHINE(pcms), pcms->fw_cfg);
     }
 }
 
diff --git a/hw/smbios/smbios.c b/hw/smbios/smbios.c
index cf18ecfd8599c..99b5f984b945a 100644
--- a/hw/smbios/smbios.c
+++ b/hw/smbios/smbios.c
@@ -20,7 +20,6 @@
 #include "qemu/config-file.h"
 #include "qemu/error-report.h"
 #include "sysemu/sysemu.h"
-#include "sysemu/cpus.h"
 #include "hw/smbios/smbios.h"
 #include "hw/loader.h"
 #include "exec/cpu-common.h"
@@ -64,7 +63,9 @@ static SmbiosEntryPoint ep;
 static int smbios_type4_count = 0;
 static bool smbios_immutable;
 static bool smbios_have_defaults;
-static uint32_t smbios_cpuid_version, smbios_cpuid_features, smbios_smp_sockets;
+static uint32_t smbios_cpuid_version, smbios_cpuid_features;
+
+static struct smbios_cpu_topology smbios_cpu_topology;
 
 static DECLARE_BITMAP(have_binfile_bitmap, SMBIOS_MAX_TYPE+1);
 static DECLARE_BITMAP(have_fields_bitmap, SMBIOS_MAX_TYPE+1);
@@ -325,7 +326,8 @@ opts_init(smbios_register_config);
 
 static void smbios_validate_table(void)
 {
-    uint32_t expect_t4_count = smbios_legacy ? smp_cpus : smbios_smp_sockets;
+    uint32_t expect_t4_count = smbios_legacy ? smp_cpus
+                                             : smbios_cpu_topology.sockets;
 
     if (smbios_type4_count && smbios_type4_count != expect_t4_count) {
         error_report("Expected %d SMBIOS Type 4 tables, got %d instead",
@@ -637,8 +639,8 @@ static void smbios_build_type_4_table(unsigned instance)
     SMBIOS_TABLE_SET_STR(4, serial_number_str, type4.serial);
     SMBIOS_TABLE_SET_STR(4, asset_tag_number_str, type4.asset);
     SMBIOS_TABLE_SET_STR(4, part_number_str, type4.part);
-    t->core_count = t->core_enabled = smp_cores;
-    t->thread_count = smp_threads;
+    t->core_count = t->core_enabled = smbios_cpu_topology.cores;
+    t->thread_count = smbios_cpu_topology.threads;
     t->processor_characteristics = cpu_to_le16(0x02); /* Unknown */
     t->processor_family2 = cpu_to_le16(0x01); /* Other */
 
@@ -864,6 +866,7 @@ static void smbios_entry_point_setup(void)
 
 void smbios_get_tables(const struct smbios_phys_mem_area *mem_array,
                        const unsigned int mem_array_size,
+                       const struct smbios_cpu_topology *topo,
                        uint8_t **tables, size_t *tables_len,
                        uint8_t **anchor, size_t *anchor_len)
 {
@@ -875,16 +878,15 @@ void smbios_get_tables(const struct smbios_phys_mem_area *mem_array,
         return;
     }
 
+    smbios_cpu_topology = *topo;
+
     if (!smbios_immutable) {
         smbios_build_type_0_table();
         smbios_build_type_1_table();
         smbios_build_type_2_table();
         smbios_build_type_3_table();
 
-        smbios_smp_sockets = DIV_ROUND_UP(max_cpus, smp_cores * smp_threads);
-        assert(smbios_smp_sockets >= 1);
-
-        for (i = 0; i < smbios_smp_sockets; i++) {
+        for (i = 0; i < smbios_cpu_topology.sockets; i++) {
             smbios_build_type_4_table(i);
         }
 
diff --git a/include/hw/smbios/smbios.h b/include/hw/smbios/smbios.h
index ba3674609edf4..64f41ee9e2605 100644
--- a/include/hw/smbios/smbios.h
+++ b/include/hw/smbios/smbios.h
@@ -23,6 +23,15 @@ struct smbios_phys_mem_area {
     uint64_t length;
 };
 
+/* cpu topology, used by type 4 table */
+struct smbios_cpu_topology {
+    int sockets;
+    int cores;
+    int threads;
+    int maxcpus;
+    int cpus;
+};
+
 /*
  * SMBIOS spec defined tables
  */
@@ -264,6 +273,7 @@ void smbios_set_defaults(const char *manufacturer, const char *product,
 uint8_t *smbios_get_table_legacy(size_t *length);
 void smbios_get_tables(const struct smbios_phys_mem_area *mem_array,
                        const unsigned int mem_array_size,
+                       const struct smbios_cpu_topology *topo,
                        uint8_t **tables, size_t *tables_len,
                        uint8_t **anchor, size_t *anchor_len);
 #endif /*QEMU_SMBIOS_H */
-- 
2.4.11

