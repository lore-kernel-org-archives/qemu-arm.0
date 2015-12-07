Received: by 10.182.158.201 with SMTP id ww9csp2141848obb;
        Sun, 6 Dec 2015 23:40:33 -0800 (PST)
X-Received: by 10.140.43.135 with SMTP id e7mr34167146qga.11.1449474032313;
        Sun, 06 Dec 2015 23:40:32 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f129si17605257qhe.123.2015.12.06.23.40.32
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 06 Dec 2015 23:40:32 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:53043 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1a5qPP-0001fs-P9
	for alex.bennee@linaro.org; Mon, 07 Dec 2015 02:40:31 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42741)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1a5qPM-0001Y1-Q6
	for qemu-arm@nongnu.org; Mon, 07 Dec 2015 02:40:30 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1a5qPJ-0004La-GA
	for qemu-arm@nongnu.org; Mon, 07 Dec 2015 02:40:28 -0500
Received: from szxga01-in.huawei.com ([58.251.152.64]:51621)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>)
	id 1a5qPI-0004L1-Pf; Mon, 07 Dec 2015 02:40:25 -0500
Received: from 172.24.1.49 (EHLO szxeml427-hub.china.huawei.com)
	([172.24.1.49])
	by szxrg01-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id DAJ28143; Mon, 07 Dec 2015 15:40:13 +0800 (CST)
Received: from HGHY1Z002260041.china.huawei.com (10.177.16.142) by
	szxeml427-hub.china.huawei.com (10.82.67.182) with Microsoft SMTP
	Server id 14.3.235.1; Mon, 7 Dec 2015 15:40:05 +0800
From: Shannon Zhao <zhaoshenglong@huawei.com>
To: <qemu-arm@nongnu.org>, <peter.maydell@linaro.org>, <mst@redhat.com>,
	<imammedo@redhat.com>, <wei@redhat.com>
Date: Mon, 7 Dec 2015 15:39:45 +0800
Message-ID: <1449473992-11560-2-git-send-email-zhaoshenglong@huawei.com>
X-Mailer: git-send-email 1.9.0.msysgit.0
In-Reply-To: <1449473992-11560-1-git-send-email-zhaoshenglong@huawei.com>
References: <1449473992-11560-1-git-send-email-zhaoshenglong@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.16.142]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A090205.566537DE.00FB, ss=1, re=0.000, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0, ip=0.0.0.0,
	so=2013-06-18 04:22:30, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: af3e6393854e7e145449975cdbb66b44
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 58.251.152.64
Cc: peter.huangpeng@huawei.com, zhaoshenglong@huawei.com, qemu-devel@nongnu.org,
	graeme.gregory@linaro.org, shannon.zhao@linaro.org
Subject: [Qemu-arm] [PATCH v4 1/8] ARM: Virt: Add a GPIO controller
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
X-TUID: MHArpwmZ8+ww

From: Shannon Zhao <shannon.zhao@linaro.org>

ACPI 5.0 supports GPIO-signaled ACPI Events. This can be used for
powerdown, hotplug evnets. Add a GPIO controller in machine virt,
to support powerdown, maybe can be used for cpu hotplug. And
here we use pl061.

Signed-off-by: Shannon Zhao <zhaoshenglong@huawei.com>
Signed-off-by: Shannon Zhao <shannon.zhao@linaro.org>
Reviewed-by: Wei Huang <wei@redhat.com>
Tested-by: Wei Huang <wei@redhat.com>
---
 hw/arm/virt.c         | 30 ++++++++++++++++++++++++++++++
 include/hw/arm/virt.h |  1 +
 2 files changed, 31 insertions(+)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 9c6792c..7977e3c 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -120,6 +120,7 @@ static const MemMapEntry a15memmap[] = {
     [VIRT_UART] =               { 0x09000000, 0x00001000 },
     [VIRT_RTC] =                { 0x09010000, 0x00001000 },
     [VIRT_FW_CFG] =             { 0x09020000, 0x00000018 },
+    [VIRT_GPIO] =               { 0x09030000, 0x00001000 },
     [VIRT_MMIO] =               { 0x0a000000, 0x00000200 },
     /* ...repeating for a total of NUM_VIRTIO_TRANSPORTS, each of that size */
     [VIRT_PLATFORM_BUS] =       { 0x0c000000, 0x02000000 },
@@ -135,6 +136,7 @@ static const int a15irqmap[] = {
     [VIRT_UART] = 1,
     [VIRT_RTC] = 2,
     [VIRT_PCIE] = 3, /* ... to 6 */
+    [VIRT_GPIO] = 7,
     [VIRT_MMIO] = 16, /* ...to 16 + NUM_VIRTIO_TRANSPORTS - 1 */
     [VIRT_GIC_V2M] = 48, /* ...to 48 + NUM_GICV2M_SPIS - 1 */
     [VIRT_PLATFORM_BUS] = 112, /* ...to 112 + PLATFORM_BUS_NUM_IRQS -1 */
@@ -538,6 +540,32 @@ static void create_rtc(const VirtBoardInfo *vbi, qemu_irq *pic)
     g_free(nodename);
 }
 
+static void create_gpio(const VirtBoardInfo *vbi, qemu_irq *pic)
+{
+    char *nodename;
+    hwaddr base = vbi->memmap[VIRT_GPIO].base;
+    hwaddr size = vbi->memmap[VIRT_GPIO].size;
+    int irq = vbi->irqmap[VIRT_GPIO];
+    const char compat[] = "arm,pl061\0arm,primecell";
+
+    sysbus_create_simple("pl061", base, pic[irq]);
+
+    nodename = g_strdup_printf("/pl061@%" PRIx64, base);
+    qemu_fdt_add_subnode(vbi->fdt, nodename);
+    qemu_fdt_setprop_sized_cells(vbi->fdt, nodename, "reg",
+                                 2, base, 2, size);
+    qemu_fdt_setprop(vbi->fdt, nodename, "compatible", compat, sizeof(compat));
+    qemu_fdt_setprop_cell(vbi->fdt, nodename, "#gpio-cells", 2);
+    qemu_fdt_setprop(vbi->fdt, nodename, "gpio-controller", NULL, 0);
+    qemu_fdt_setprop_cells(vbi->fdt, nodename, "interrupts",
+                           GIC_FDT_IRQ_TYPE_SPI, irq,
+                           GIC_FDT_IRQ_FLAGS_LEVEL_HI);
+    qemu_fdt_setprop_cell(vbi->fdt, nodename, "clocks", vbi->clock_phandle);
+    qemu_fdt_setprop_string(vbi->fdt, nodename, "clock-names", "apb_pclk");
+
+    g_free(nodename);
+}
+
 static void create_virtio_devices(const VirtBoardInfo *vbi, qemu_irq *pic)
 {
     int i;
@@ -1041,6 +1069,8 @@ static void machvirt_init(MachineState *machine)
 
     create_pcie(vbi, pic, vms->highmem);
 
+    create_gpio(vbi, pic);
+
     /* Create mmio transports, so the user can create virtio backends
      * (which will be automatically plugged in to the transports). If
      * no backend is created the transport will just sit harmlessly idle.
diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
index f464586..925faa7 100644
--- a/include/hw/arm/virt.h
+++ b/include/hw/arm/virt.h
@@ -59,6 +59,7 @@ enum {
     VIRT_PCIE_ECAM,
     VIRT_PLATFORM_BUS,
     VIRT_PCIE_MMIO_HIGH,
+    VIRT_GPIO,
 };
 
 typedef struct MemMapEntry {
-- 
2.0.4


