Received: by 10.25.205.13 with SMTP id d13csp8536433lfg;
        Mon, 2 Jan 2017 12:02:09 -0800 (PST)
X-Received: by 10.237.53.168 with SMTP id c37mr55463703qte.48.1483387329060;
        Mon, 02 Jan 2017 12:02:09 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a16si41152666qtb.121.2017.01.02.12.02.08
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 02 Jan 2017 12:02:09 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:58738 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cO8o2-0001Xy-CL
	for alex.bennee@linaro.org; Mon, 02 Jan 2017 15:02:06 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33067)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1cO8ny-0001XJ-Ls
	for qemu-arm@nongnu.org; Mon, 02 Jan 2017 15:02:03 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1cO8nw-0003kN-Jm
	for qemu-arm@nongnu.org; Mon, 02 Jan 2017 15:02:02 -0500
Received: from mx1.redhat.com ([209.132.183.28]:35826)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <drjones@redhat.com>)
	id 1cO8nw-0003k3-C3; Mon, 02 Jan 2017 15:02:00 -0500
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6230DC049D5B;
	Mon,  2 Jan 2017 20:02:00 +0000 (UTC)
Received: from kamzik.brq.redhat.com (kamzik.brq.redhat.com [10.34.1.143])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id v02K1tOd017390; Mon, 2 Jan 2017 15:01:58 -0500
From: Andrew Jones <drjones@redhat.com>
To: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Date: Mon,  2 Jan 2017 21:01:38 +0100
Message-Id: <20170102200153.28864-2-drjones@redhat.com>
In-Reply-To: <20170102200153.28864-1-drjones@redhat.com>
References: <20170102200153.28864-1-drjones@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Mon, 02 Jan 2017 20:02:00 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v2 01/16] hw/arm/virt-acpi-build: add all missing
 cpu_to_le's
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
Cc: peter.maydell@linaro.org, ehabkost@redhat.com, mst@redhat.com,
	shannon.zhao@linaro.org, zhaoshenglong@huawei.com, imammedo@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 1WF6+TxbWZGD

Signed-off-by: Andrew Jones <drjones@redhat.com>
---
 hw/arm/virt-acpi-build.c | 27 ++++++++++++++-------------
 1 file changed, 14 insertions(+), 13 deletions(-)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index d4160dfa7d34..f4b43562287a 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -542,17 +542,18 @@ build_gtdt(GArray *table_data, BIOSLinker *linker)
 
     gtdt = acpi_data_push(table_data, sizeof *gtdt);
     /* The interrupt values are the same with the device tree when adding 16 */
-    gtdt->secure_el1_interrupt = ARCH_TIMER_S_EL1_IRQ + 16;
-    gtdt->secure_el1_flags = ACPI_EDGE_SENSITIVE;
+    gtdt->secure_el1_interrupt = cpu_to_le32(ARCH_TIMER_S_EL1_IRQ + 16);
+    gtdt->secure_el1_flags = cpu_to_le32(ACPI_EDGE_SENSITIVE);
 
-    gtdt->non_secure_el1_interrupt = ARCH_TIMER_NS_EL1_IRQ + 16;
-    gtdt->non_secure_el1_flags = ACPI_EDGE_SENSITIVE | ACPI_GTDT_ALWAYS_ON;
+    gtdt->non_secure_el1_interrupt = cpu_to_le32(ARCH_TIMER_NS_EL1_IRQ + 16);
+    gtdt->non_secure_el1_flags = cpu_to_le32(ACPI_EDGE_SENSITIVE |
+                                             ACPI_GTDT_ALWAYS_ON);
 
-    gtdt->virtual_timer_interrupt = ARCH_TIMER_VIRT_IRQ + 16;
-    gtdt->virtual_timer_flags = ACPI_EDGE_SENSITIVE;
+    gtdt->virtual_timer_interrupt = cpu_to_le32(ARCH_TIMER_VIRT_IRQ + 16);
+    gtdt->virtual_timer_flags = cpu_to_le32(ACPI_EDGE_SENSITIVE);
 
-    gtdt->non_secure_el2_interrupt = ARCH_TIMER_NS_EL2_IRQ + 16;
-    gtdt->non_secure_el2_flags = ACPI_EDGE_SENSITIVE;
+    gtdt->non_secure_el2_interrupt = cpu_to_le32(ARCH_TIMER_NS_EL2_IRQ + 16);
+    gtdt->non_secure_el2_flags = cpu_to_le32(ACPI_EDGE_SENSITIVE);
 
     build_header(linker, table_data,
                  (void *)(table_data->data + gtdt_start), "GTDT",
@@ -576,7 +577,7 @@ build_madt(GArray *table_data, BIOSLinker *linker, VirtGuestInfo *guest_info)
     gicd = acpi_data_push(table_data, sizeof *gicd);
     gicd->type = ACPI_APIC_GENERIC_DISTRIBUTOR;
     gicd->length = sizeof(*gicd);
-    gicd->base_address = memmap[VIRT_GIC_DIST].base;
+    gicd->base_address = cpu_to_le64(memmap[VIRT_GIC_DIST].base);
     gicd->version = guest_info->gic_version;
 
     for (i = 0; i < guest_info->smp_cpus; i++) {
@@ -587,11 +588,11 @@ build_madt(GArray *table_data, BIOSLinker *linker, VirtGuestInfo *guest_info)
         gicc->type = ACPI_APIC_GENERIC_INTERRUPT;
         gicc->length = sizeof(*gicc);
         if (guest_info->gic_version == 2) {
-            gicc->base_address = memmap[VIRT_GIC_CPU].base;
+            gicc->base_address = cpu_to_le64(memmap[VIRT_GIC_CPU].base);
         }
-        gicc->cpu_interface_number = i;
-        gicc->arm_mpidr = armcpu->mp_affinity;
-        gicc->uid = i;
+        gicc->cpu_interface_number = cpu_to_le32(i);
+        gicc->arm_mpidr = cpu_to_le64(armcpu->mp_affinity);
+        gicc->uid = cpu_to_le32(i);
         gicc->flags = cpu_to_le32(ACPI_GICC_ENABLED);
 
         if (arm_feature(&armcpu->env, ARM_FEATURE_PMU)) {
-- 
2.9.3

