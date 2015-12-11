Received: by 10.182.158.201 with SMTP id ww9csp906424obb;
        Thu, 10 Dec 2015 19:27:59 -0800 (PST)
X-Received: by 10.55.16.205 with SMTP id 74mr21087667qkq.15.1449804478970;
        Thu, 10 Dec 2015 19:27:58 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f16si18212816qgd.120.2015.12.10.19.27.58
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 10 Dec 2015 19:27:58 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:45659 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1a7ENC-0006Ez-IO
	for alex.bennee@linaro.org; Thu, 10 Dec 2015 22:27:58 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38567)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1a7EL9-0002hS-EZ
	for qemu-devel@nongnu.org; Thu, 10 Dec 2015 22:25:52 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1a7EL7-0000Pp-Ug
	for qemu-devel@nongnu.org; Thu, 10 Dec 2015 22:25:51 -0500
Received: from szxga03-in.huawei.com ([119.145.14.66]:31372)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>)
	id 1a7EL1-0000PI-HF; Thu, 10 Dec 2015 22:25:44 -0500
Received: from 172.24.1.48 (EHLO szxeml427-hub.china.huawei.com)
	([172.24.1.48])
	by szxrg03-dlp.huawei.com (MOS 4.4.3-GA FastPath queued)
	with ESMTP id BSN95086; Fri, 11 Dec 2015 11:21:53 +0800 (CST)
Received: from HGHY1Z002260041.china.huawei.com (10.177.16.142) by
	szxeml427-hub.china.huawei.com (10.82.67.182) with Microsoft SMTP
	Server id 14.3.235.1; Fri, 11 Dec 2015 11:21:47 +0800
From: Shannon Zhao <zhaoshenglong@huawei.com>
To: <qemu-arm@nongnu.org>, <peter.maydell@linaro.org>, <imammedo@redhat.com>, 
	<mst@redhat.com>, <wei@redhat.com>
Date: Fri, 11 Dec 2015 11:21:18 +0800
Message-ID: <1449804086-3464-3-git-send-email-zhaoshenglong@huawei.com>
X-Mailer: git-send-email 1.9.0.msysgit.0
In-Reply-To: <1449804086-3464-1-git-send-email-zhaoshenglong@huawei.com>
References: <1449804086-3464-1-git-send-email-zhaoshenglong@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.16.142]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A020202.566A4152.0019, ss=1, re=0.000, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0, ip=0.0.0.0,
	so=2013-05-26 15:14:31, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: 7a670d5887f66517340d553a54b024b3
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.66
Cc: peter.huangpeng@huawei.com, zhaoshenglong@huawei.com, qemu-devel@nongnu.org,
	graeme.gregory@linaro.org, shannon.zhao@linaro.org
Subject: [Qemu-devel] [PATCH v5 02/10] acpi: extend aml_interrupt() to
	support multiple irqs
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: M8rYzXrhveP1

From: Igor Mammedov <imammedo@redhat.com>

ASL Interrupt() macro translates to Extended Interrupt Descriptor
which supports variable number of IRQs. It will be used for
conversion of ASL code for pc/q35 machines that use it for
returning several IRQs in _PSR object.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Shannon Zhao <shannon.zhao@linaro.org>
---
 hw/acpi/aml-build.c         | 22 +++++++++++++---------
 hw/arm/virt-acpi-build.c    | 23 ++++++++++++-----------
 include/hw/acpi/aml-build.h |  2 +-
 3 files changed, 26 insertions(+), 21 deletions(-)

diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
index 411c0e5..cd25d06 100644
--- a/hw/acpi/aml-build.c
+++ b/hw/acpi/aml-build.c
@@ -598,23 +598,27 @@ Aml *aml_memory32_fixed(uint32_t addr, uint32_t size,
 Aml *aml_interrupt(AmlConsumerAndProducer con_and_pro,
                    AmlLevelAndEdge level_and_edge,
                    AmlActiveHighAndLow high_and_low, AmlShared shared,
-                   uint32_t irq)
+                   uint32_t *irq_list, uint8_t irq_count)
 {
+    int i;
     Aml *var = aml_alloc();
     uint8_t irq_flags = con_and_pro | (level_and_edge << 1)
                         | (high_and_low << 2) | (shared << 3);
+    const int header_bytes_in_len = 2;
+    uint16_t len = header_bytes_in_len + irq_count * sizeof(uint32_t);
+
+    assert(irq_count > 0);
 
     build_append_byte(var->buf, 0x89); /* Extended irq descriptor */
-    build_append_byte(var->buf, 6); /* Length, bits[7:0] minimum value = 6 */
-    build_append_byte(var->buf, 0); /* Length, bits[15:8] minimum value = 0 */
+    build_append_byte(var->buf, len & 0xFF); /* Length, bits[7:0] */
+    build_append_byte(var->buf, len >> 8); /* Length, bits[15:8] */
     build_append_byte(var->buf, irq_flags); /* Interrupt Vector Information. */
-    build_append_byte(var->buf, 0x01);      /* Interrupt table length = 1 */
+    build_append_byte(var->buf, irq_count);   /* Interrupt table length */
 
-    /* Interrupt Number */
-    build_append_byte(var->buf, extract32(irq, 0, 8));  /* bits[7:0] */
-    build_append_byte(var->buf, extract32(irq, 8, 8));  /* bits[15:8] */
-    build_append_byte(var->buf, extract32(irq, 16, 8)); /* bits[23:16] */
-    build_append_byte(var->buf, extract32(irq, 24, 8)); /* bits[31:24] */
+    /* Interrupt Number List */
+    for (i = 0; i < irq_count; i++) {
+        build_append_int_noprefix(var->buf, irq_list[i], 4);
+    }
     return var;
 }
 
diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index 38ab844..1deebfe 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -71,7 +71,7 @@ static void acpi_dsdt_add_cpus(Aml *scope, int smp_cpus)
 }
 
 static void acpi_dsdt_add_uart(Aml *scope, const MemMapEntry *uart_memmap,
-                                           int uart_irq)
+                                           uint32_t uart_irq)
 {
     Aml *dev = aml_device("COM0");
     aml_append(dev, aml_name_decl("_HID", aml_string("ARMH0011")));
@@ -82,7 +82,7 @@ static void acpi_dsdt_add_uart(Aml *scope, const MemMapEntry *uart_memmap,
                                        uart_memmap->size, AML_READ_WRITE));
     aml_append(crs,
                aml_interrupt(AML_CONSUMER, AML_LEVEL, AML_ACTIVE_HIGH,
-                             AML_EXCLUSIVE, uart_irq));
+                             AML_EXCLUSIVE, &uart_irq, 1));
     aml_append(dev, aml_name_decl("_CRS", crs));
 
     /* The _ADR entry is used to link this device to the UART described
@@ -94,7 +94,7 @@ static void acpi_dsdt_add_uart(Aml *scope, const MemMapEntry *uart_memmap,
 }
 
 static void acpi_dsdt_add_rtc(Aml *scope, const MemMapEntry *rtc_memmap,
-                                          int rtc_irq)
+                                          uint32_t rtc_irq)
 {
     Aml *dev = aml_device("RTC0");
     aml_append(dev, aml_name_decl("_HID", aml_string("LNRO0013")));
@@ -105,7 +105,7 @@ static void acpi_dsdt_add_rtc(Aml *scope, const MemMapEntry *rtc_memmap,
                                        rtc_memmap->size, AML_READ_WRITE));
     aml_append(crs,
                aml_interrupt(AML_CONSUMER, AML_LEVEL, AML_ACTIVE_HIGH,
-                             AML_EXCLUSIVE, rtc_irq));
+                             AML_EXCLUSIVE, &rtc_irq, 1));
     aml_append(dev, aml_name_decl("_CRS", crs));
     aml_append(scope, dev);
 }
@@ -136,14 +136,14 @@ static void acpi_dsdt_add_flash(Aml *scope, const MemMapEntry *flash_memmap)
 
 static void acpi_dsdt_add_virtio(Aml *scope,
                                  const MemMapEntry *virtio_mmio_memmap,
-                                 int mmio_irq, int num)
+                                 uint32_t mmio_irq, int num)
 {
     hwaddr base = virtio_mmio_memmap->base;
     hwaddr size = virtio_mmio_memmap->size;
-    int irq = mmio_irq;
     int i;
 
     for (i = 0; i < num; i++) {
+        uint32_t irq = mmio_irq + i;
         Aml *dev = aml_device("VR%02u", i);
         aml_append(dev, aml_name_decl("_HID", aml_string("LNRO0005")));
         aml_append(dev, aml_name_decl("_UID", aml_int(i)));
@@ -152,15 +152,15 @@ static void acpi_dsdt_add_virtio(Aml *scope,
         aml_append(crs, aml_memory32_fixed(base, size, AML_READ_WRITE));
         aml_append(crs,
                    aml_interrupt(AML_CONSUMER, AML_LEVEL, AML_ACTIVE_HIGH,
-                                 AML_EXCLUSIVE, irq + i));
+                                 AML_EXCLUSIVE, &irq, 1));
         aml_append(dev, aml_name_decl("_CRS", crs));
         aml_append(scope, dev);
         base += size;
     }
 }
 
-static void acpi_dsdt_add_pci(Aml *scope, const MemMapEntry *memmap, int irq,
-                              bool use_highmem)
+static void acpi_dsdt_add_pci(Aml *scope, const MemMapEntry *memmap,
+                              uint32_t irq, bool use_highmem)
 {
     Aml *method, *crs, *ifctx, *UUID, *ifctx1, *elsectx, *buf;
     int i, bus_no;
@@ -199,18 +199,19 @@ static void acpi_dsdt_add_pci(Aml *scope, const MemMapEntry *memmap, int irq,
 
     /* Create GSI link device */
     for (i = 0; i < PCI_NUM_PINS; i++) {
+        uint32_t irqs =  irq + i;
         Aml *dev_gsi = aml_device("GSI%d", i);
         aml_append(dev_gsi, aml_name_decl("_HID", aml_string("PNP0C0F")));
         aml_append(dev_gsi, aml_name_decl("_UID", aml_int(0)));
         crs = aml_resource_template();
         aml_append(crs,
                    aml_interrupt(AML_CONSUMER, AML_LEVEL, AML_ACTIVE_HIGH,
-                                 AML_EXCLUSIVE, irq + i));
+                                 AML_EXCLUSIVE, &irqs, 1));
         aml_append(dev_gsi, aml_name_decl("_PRS", crs));
         crs = aml_resource_template();
         aml_append(crs,
                    aml_interrupt(AML_CONSUMER, AML_LEVEL, AML_ACTIVE_HIGH,
-                                 AML_EXCLUSIVE, irq + i));
+                                 AML_EXCLUSIVE, &irqs, 1));
         aml_append(dev_gsi, aml_name_decl("_CRS", crs));
         method = aml_method("_SRS", 1, AML_NOTSERIALIZED);
         aml_append(dev_gsi, method);
diff --git a/include/hw/acpi/aml-build.h b/include/hw/acpi/aml-build.h
index a3580e1..c2c0be3 100644
--- a/include/hw/acpi/aml-build.h
+++ b/include/hw/acpi/aml-build.h
@@ -223,7 +223,7 @@ Aml *aml_memory32_fixed(uint32_t addr, uint32_t size,
 Aml *aml_interrupt(AmlConsumerAndProducer con_and_pro,
                    AmlLevelAndEdge level_and_edge,
                    AmlActiveHighAndLow high_and_low, AmlShared shared,
-                   uint32_t irq);
+                   uint32_t *irq_list, uint8_t irq_count);
 Aml *aml_io(AmlIODecode dec, uint16_t min_base, uint16_t max_base,
             uint8_t aln, uint8_t len);
 Aml *aml_operation_region(const char *name, AmlRegionSpace rs,
-- 
2.0.4


