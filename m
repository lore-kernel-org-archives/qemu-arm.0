Received: by 10.25.205.13 with SMTP id d13csp8537044lfg;
        Mon, 2 Jan 2017 12:03:33 -0800 (PST)
X-Received: by 10.55.17.68 with SMTP id b65mr56403607qkh.60.1483387413312;
        Mon, 02 Jan 2017 12:03:33 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o76si31783702qkl.29.2017.01.02.12.03.32
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 02 Jan 2017 12:03:33 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:58745 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cO8pO-0001pD-I5
	for alex.bennee@linaro.org; Mon, 02 Jan 2017 15:03:30 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33152)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1cO8o4-0001bX-Ff
	for qemu-devel@nongnu.org; Mon, 02 Jan 2017 15:02:11 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1cO8o3-0003q6-Cj
	for qemu-devel@nongnu.org; Mon, 02 Jan 2017 15:02:08 -0500
Received: from mx1.redhat.com ([209.132.183.28]:53088)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <drjones@redhat.com>)
	id 1cO8o0-0003ns-U2; Mon, 02 Jan 2017 15:02:05 -0500
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id F32FD61B83;
	Mon,  2 Jan 2017 20:02:04 +0000 (UTC)
Received: from kamzik.brq.redhat.com (kamzik.brq.redhat.com [10.34.1.143])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id v02K1tOf017390; Mon, 2 Jan 2017 15:02:02 -0500
From: Andrew Jones <drjones@redhat.com>
To: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Date: Mon,  2 Jan 2017 21:01:40 +0100
Message-Id: <20170102200153.28864-4-drjones@redhat.com>
In-Reply-To: <20170102200153.28864-1-drjones@redhat.com>
References: <20170102200153.28864-1-drjones@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Mon, 02 Jan 2017 20:02:05 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v2 03/16] hw/arm/virt-acpi-build: gtdt: improve
 flag naming
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
Cc: peter.maydell@linaro.org, ehabkost@redhat.com, mst@redhat.com,
	shannon.zhao@linaro.org, zhaoshenglong@huawei.com, imammedo@redhat.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 3FmHxC1DqnuB

Also remove all unused flags.

Signed-off-by: Andrew Jones <drjones@redhat.com>
---
 hw/arm/virt-acpi-build.c    | 10 +++++-----
 include/hw/acpi/acpi-defs.h | 17 ++---------------
 2 files changed, 7 insertions(+), 20 deletions(-)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index 0ed406cdd89c..b6b64296f119 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -543,17 +543,17 @@ build_gtdt(GArray *table_data, BIOSLinker *linker)
     gtdt = acpi_data_push(table_data, sizeof *gtdt);
     /* The interrupt values are the same with the device tree when adding 16 */
     gtdt->secure_el1_interrupt = cpu_to_le32(ARCH_TIMER_S_EL1_IRQ + 16);
-    gtdt->secure_el1_flags = cpu_to_le32(ACPI_EDGE_SENSITIVE);
+    gtdt->secure_el1_flags = cpu_to_le32(ACPI_GTDT_INTERRUPT_MODE_EDGE);
 
     gtdt->non_secure_el1_interrupt = cpu_to_le32(ARCH_TIMER_NS_EL1_IRQ + 16);
-    gtdt->non_secure_el1_flags = cpu_to_le32(ACPI_EDGE_SENSITIVE |
-                                             ACPI_GTDT_ALWAYS_ON);
+    gtdt->non_secure_el1_flags = cpu_to_le32(ACPI_GTDT_INTERRUPT_MODE_EDGE |
+                                             ACPI_GTDT_CAP_ALWAYS_ON);
 
     gtdt->virtual_timer_interrupt = cpu_to_le32(ARCH_TIMER_VIRT_IRQ + 16);
-    gtdt->virtual_timer_flags = cpu_to_le32(ACPI_EDGE_SENSITIVE);
+    gtdt->virtual_timer_flags = cpu_to_le32(ACPI_GTDT_INTERRUPT_MODE_EDGE);
 
     gtdt->non_secure_el2_interrupt = cpu_to_le32(ARCH_TIMER_NS_EL2_IRQ + 16);
-    gtdt->non_secure_el2_flags = cpu_to_le32(ACPI_EDGE_SENSITIVE);
+    gtdt->non_secure_el2_flags = cpu_to_le32(ACPI_GTDT_INTERRUPT_MODE_EDGE);
 
     build_header(linker, table_data,
                  (void *)(table_data->data + gtdt_start), "GTDT",
diff --git a/include/hw/acpi/acpi-defs.h b/include/hw/acpi/acpi-defs.h
index 510f23c93183..8fe0996e15fb 100644
--- a/include/hw/acpi/acpi-defs.h
+++ b/include/hw/acpi/acpi-defs.h
@@ -430,21 +430,8 @@ typedef struct AcpiMadtGenericTranslator AcpiMadtGenericTranslator;
 /*
  * Generic Timer Description Table (GTDT)
  */
-
-#define ACPI_GTDT_INTERRUPT_MODE        (1 << 0)
-#define ACPI_GTDT_INTERRUPT_POLARITY    (1 << 1)
-#define ACPI_GTDT_ALWAYS_ON             (1 << 2)
-
-/* Triggering */
-
-#define ACPI_LEVEL_SENSITIVE            ((uint8_t) 0x00)
-#define ACPI_EDGE_SENSITIVE             ((uint8_t) 0x01)
-
-/* Polarity */
-
-#define ACPI_ACTIVE_HIGH                ((uint8_t) 0x00)
-#define ACPI_ACTIVE_LOW                 ((uint8_t) 0x01)
-#define ACPI_ACTIVE_BOTH                ((uint8_t) 0x02)
+#define ACPI_GTDT_INTERRUPT_MODE_EDGE     (1 << 0)
+#define ACPI_GTDT_CAP_ALWAYS_ON           (1 << 2)
 
 struct AcpiGenericTimerTable {
     ACPI_TABLE_HEADER_DEF
-- 
2.9.3

