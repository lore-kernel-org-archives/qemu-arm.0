Received: by 10.182.158.201 with SMTP id ww9csp2141841obb;
        Sun, 6 Dec 2015 23:40:32 -0800 (PST)
X-Received: by 10.55.215.137 with SMTP id t9mr34355780qkt.23.1449474032309;
        Sun, 06 Dec 2015 23:40:32 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y19si26280329qhb.115.2015.12.06.23.40.32
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 06 Dec 2015 23:40:32 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:53044 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1a5qPP-0001gE-PS
	for alex.bennee@linaro.org; Mon, 07 Dec 2015 02:40:31 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42739)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1a5qPM-0001Xx-PP
	for qemu-arm@nongnu.org; Mon, 07 Dec 2015 02:40:29 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1a5qPJ-0004Lb-G1
	for qemu-arm@nongnu.org; Mon, 07 Dec 2015 02:40:28 -0500
Received: from szxga01-in.huawei.com ([58.251.152.64]:51614)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>)
	id 1a5qPI-0004Kx-PY; Mon, 07 Dec 2015 02:40:25 -0500
Received: from 172.24.1.49 (EHLO szxeml427-hub.china.huawei.com)
	([172.24.1.49])
	by szxrg01-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id DAJ28137; Mon, 07 Dec 2015 15:40:13 +0800 (CST)
Received: from HGHY1Z002260041.china.huawei.com (10.177.16.142) by
	szxeml427-hub.china.huawei.com (10.82.67.182) with Microsoft SMTP
	Server id 14.3.235.1; Mon, 7 Dec 2015 15:40:06 +0800
From: Shannon Zhao <zhaoshenglong@huawei.com>
To: <qemu-arm@nongnu.org>, <peter.maydell@linaro.org>, <mst@redhat.com>,
	<imammedo@redhat.com>, <wei@redhat.com>
Date: Mon, 7 Dec 2015 15:39:46 +0800
Message-ID: <1449473992-11560-3-git-send-email-zhaoshenglong@huawei.com>
X-Mailer: git-send-email 1.9.0.msysgit.0
In-Reply-To: <1449473992-11560-1-git-send-email-zhaoshenglong@huawei.com>
References: <1449473992-11560-1-git-send-email-zhaoshenglong@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.16.142]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A090205.566537DE.004A, ss=1, re=0.000, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0, ip=0.0.0.0,
	so=2013-06-18 04:22:30, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: 0919986ed272616148f64854ee070613
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 58.251.152.64
Cc: peter.huangpeng@huawei.com, zhaoshenglong@huawei.com, qemu-devel@nongnu.org,
	graeme.gregory@linaro.org, shannon.zhao@linaro.org
Subject: [Qemu-arm] [PATCH v4 2/8] ARM: ACPI: Add GPIO controller in ACPI
	DSDT table
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: h2GK3S1fCKp2

From: Shannon Zhao <shannon.zhao@linaro.org>

Add GPIO controller in ACPI DSDT table. It can be used for gpio event.

Signed-off-by: Shannon Zhao <zhaoshenglong@huawei.com>
Signed-off-by: Shannon Zhao <shannon.zhao@linaro.org>
Tested-by: Wei Huang <wei@redhat.com>
---
 hw/arm/virt-acpi-build.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index 3c2c5d6..bf6b934 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -323,6 +323,23 @@ static void acpi_dsdt_add_pci(Aml *scope, const MemMapEntry *memmap, int irq,
     aml_append(scope, dev);
 }
 
+static void acpi_dsdt_add_gpio(Aml *scope, const MemMapEntry *gpio_memmap,
+                                           int gpio_irq)
+{
+    Aml *dev = aml_device("GPO0");
+    aml_append(dev, aml_name_decl("_HID", aml_string("ARMH0061")));
+    aml_append(dev, aml_name_decl("_ADR", aml_int(0)));
+    aml_append(dev, aml_name_decl("_UID", aml_int(0)));
+
+    Aml *crs = aml_resource_template();
+    aml_append(crs, aml_memory32_fixed(gpio_memmap->base, gpio_memmap->size,
+                                       AML_READ_WRITE));
+    aml_append(crs, aml_interrupt(AML_CONSUMER, AML_LEVEL, AML_ACTIVE_HIGH,
+                                  AML_EXCLUSIVE, gpio_irq));
+    aml_append(dev, aml_name_decl("_CRS", crs));
+    aml_append(scope, dev);
+}
+
 /* RSDP */
 static GArray *
 build_rsdp(GArray *rsdp_table, GArray *linker, unsigned rsdt)
@@ -539,6 +556,8 @@ build_dsdt(GArray *table_data, GArray *linker, VirtGuestInfo *guest_info)
                     (irqmap[VIRT_MMIO] + ARM_SPI_BASE), NUM_VIRTIO_TRANSPORTS);
     acpi_dsdt_add_pci(scope, memmap, (irqmap[VIRT_PCIE] + ARM_SPI_BASE),
                       guest_info->use_highmem);
+    acpi_dsdt_add_gpio(scope, &memmap[VIRT_GPIO],
+                       (irqmap[VIRT_GPIO] + ARM_SPI_BASE));
 
     aml_append(dsdt, scope);
 
-- 
2.0.4


