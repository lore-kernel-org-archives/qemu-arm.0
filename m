Received: by 10.25.205.13 with SMTP id d13csp2433954lfg;
        Tue, 13 Dec 2016 14:07:09 -0800 (PST)
X-Received: by 10.55.31.157 with SMTP id n29mr15498061qkh.221.1481666829062;
        Tue, 13 Dec 2016 14:07:09 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id o42si28709995qto.82.2016.12.13.14.07.08
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 13 Dec 2016 14:07:09 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:47444 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cGvE2-0005QK-3F
	for alex.bennee@linaro.org; Tue, 13 Dec 2016 17:07:06 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54026)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1cGuta-0002lz-Rk
	for qemu-devel@nongnu.org; Tue, 13 Dec 2016 16:46:00 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1cGutZ-0007ib-RQ
	for qemu-devel@nongnu.org; Tue, 13 Dec 2016 16:45:58 -0500
Received: from mx1.redhat.com ([209.132.183.28]:54434)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <drjones@redhat.com>)
	id 1cGutR-0007d4-Ea; Tue, 13 Dec 2016 16:45:49 -0500
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7F773C0567B3;
	Tue, 13 Dec 2016 21:45:48 +0000 (UTC)
Received: from kamzik.brq.redhat.com (kamzik.brq.redhat.com [10.34.1.143])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id uBDLjOQX014685; Tue, 13 Dec 2016 16:45:46 -0500
From: Andrew Jones <drjones@redhat.com>
To: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Date: Tue, 13 Dec 2016 22:45:22 +0100
Message-Id: <20161213214522.25548-12-drjones@redhat.com>
In-Reply-To: <20161213214522.25548-1-drjones@redhat.com>
References: <20161213214522.25548-1-drjones@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Tue, 13 Dec 2016 21:45:48 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH 11/11] hw/arm/virt-acpi-build: Don't
 incorrectly claim architectural timer to be edge-triggered
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
Cc: peter.maydell@linaro.org, imammedo@redhat.com, mst@redhat.com,
	ehabkost@redhat.com, zhaoshenglong@huawei.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Xt+w5o6XWj8m

This is the ACPI equivalent to "hw/arm/virt: Don't incorrectly claim
architectural timer to be edge-triggered" which fixes the DT for
machine types 2.9 and later.

Signed-off-by: Andrew Jones <drjones@redhat.com>
---
 hw/arm/virt-acpi-build.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index 0e6caf5f1083..62cf4e7f6615 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -535,24 +535,30 @@ build_mcfg(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
 
 /* GTDT */
 static void
-build_gtdt(GArray *table_data, BIOSLinker *linker)
+build_gtdt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
 {
+    VirtMachineClass *vmc = VIRT_MACHINE_GET_CLASS(vms);
     int gtdt_start = table_data->len;
     AcpiGenericTimerTable *gtdt;
+    uint8_t irqflags = ACPI_LEVEL_SENSITIVE;
+
+    if (vmc->claim_edge_triggered_timers) {
+        irqflags = ACPI_EDGE_SENSITIVE;
+    }
 
     gtdt = acpi_data_push(table_data, sizeof *gtdt);
     /* The interrupt values are the same with the device tree when adding 16 */
     gtdt->secure_el1_interrupt = ARCH_TIMER_S_EL1_IRQ + 16;
-    gtdt->secure_el1_flags = ACPI_EDGE_SENSITIVE;
+    gtdt->secure_el1_flags = irqflags;
 
     gtdt->non_secure_el1_interrupt = ARCH_TIMER_NS_EL1_IRQ + 16;
-    gtdt->non_secure_el1_flags = ACPI_EDGE_SENSITIVE | ACPI_GTDT_ALWAYS_ON;
+    gtdt->non_secure_el1_flags = irqflags | ACPI_GTDT_ALWAYS_ON;
 
     gtdt->virtual_timer_interrupt = ARCH_TIMER_VIRT_IRQ + 16;
-    gtdt->virtual_timer_flags = ACPI_EDGE_SENSITIVE;
+    gtdt->virtual_timer_flags = irqflags;
 
     gtdt->non_secure_el2_interrupt = ARCH_TIMER_NS_EL2_IRQ + 16;
-    gtdt->non_secure_el2_flags = ACPI_EDGE_SENSITIVE;
+    gtdt->non_secure_el2_flags = irqflags;
 
     build_header(linker, table_data,
                  (void *)(table_data->data + gtdt_start), "GTDT",
@@ -735,7 +741,7 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
     build_madt(tables_blob, tables->linker, vms);
 
     acpi_add_table(table_offsets, tables_blob);
-    build_gtdt(tables_blob, tables->linker);
+    build_gtdt(tables_blob, tables->linker, vms);
 
     acpi_add_table(table_offsets, tables_blob);
     build_mcfg(tables_blob, tables->linker, vms);
-- 
2.9.3

