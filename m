Received: by 10.182.158.201 with SMTP id ww9csp360927obb;
        Mon, 16 Nov 2015 14:07:10 -0800 (PST)
X-Received: by 10.31.8.195 with SMTP id 186mr172580vki.107.1447711630445;
        Mon, 16 Nov 2015 14:07:10 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o7si147076vkd.63.2015.11.16.14.07.10
        for <alex.bennee@linaro.org>
        (version=TLSv1 cipher=RC4-SHA bits=128/128);
        Mon, 16 Nov 2015 14:07:10 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro_org.20150623.gappssmtp.com
Received: from localhost ([::1]:50425 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ZyRva-0003RI-2z
	for alex.bennee@linaro.org; Mon, 16 Nov 2015 17:07:10 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48385)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <shannon.zhao@linaro.org>) id 1ZyJkt-0008SS-KC
	for qemu-devel@nongnu.org; Mon, 16 Nov 2015 08:23:41 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <shannon.zhao@linaro.org>) id 1ZyJkp-0007IQ-GF
	for qemu-devel@nongnu.org; Mon, 16 Nov 2015 08:23:35 -0500
Received: from mail-wm0-x22b.google.com ([2a00:1450:400c:c09::22b]:37894)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <shannon.zhao@linaro.org>) id 1ZyJkp-0007IJ-7I
	for qemu-devel@nongnu.org; Mon, 16 Nov 2015 08:23:31 -0500
Received: by wmec201 with SMTP id c201so119468193wme.1
	for <qemu-devel@nongnu.org>; Mon, 16 Nov 2015 05:23:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linaro_org.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=uJUQQNhftebwTRDvOelqQYJMZJYkGK3zUJoJScsDo5U=;
	b=lFHzJ823T57OCXhjrUr70oWjkuS9ZyqNsHXxZECAkKj7qxpwqeZawjTR4dsnNJtC4+
	eVKQLeaOFjTnFDZDO/fBGnfZ3o/Qk1Ik69cmxx/3e2be5O33T+qtHBoIqieEsmkq2/LB
	P2ELM2c5KxdsmUGMcyShMDVCsvay+zwTv9x7MKGtng48wcaVMhC7GAdXgEmbhBcomYj6
	2S/QECKpFzDe1tfpWx3p9I7O3WLRqtVLb8vzNsXE2i6oRN0FjhaKq9dqTjgU7ccTP8sC
	GvcQzHUTwN6j1MqeL8pYeOYxb+z2MADvK8dm/o+WgLIV+0dRhh754oqr0wFE7fRFtz6q
	odyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=uJUQQNhftebwTRDvOelqQYJMZJYkGK3zUJoJScsDo5U=;
	b=NPAQWVpVjDOuTSS0feBneB9ilKUOpLdx5Tdakh1vKCYqVUQxNBuPriHDupc3yTUP3U
	W7nkHeAPjChySgkJjZ5HdCbOBY5pU+NmhnXOIb0g/DFKCTfuFNz3PBJrjNaUQolvNwHV
	dmrC2lLV8AVM5UCygfs7SBVtM34wti9DeyHDceneknnWzOvlrbi2+KR4G1tL/u4IC3s7
	5w1B1IvAtE18IuMmhennKuvbZI6RFf34R+Hd5DWLWYUpq5IXfG8PIZHVqUdL8Gn1viKt
	j02CIkkHLK2Gyyhe9wqstlAXtxlcXGQpkHSw5p3xRWVBwLn4gvY0cBJiBjAjuK5SZ9f1
	1uWA==
X-Gm-Message-State: ALoCoQnCADn/y29radx+nMzaSYymxYBot0y/hSVdJNkaPvFNpzflJ4X9Cr76ivptF6wr2K9TeXJz
X-Received: by 10.28.138.148 with SMTP id m142mr19918468wmd.2.1447680210608;
	Mon, 16 Nov 2015 05:23:30 -0800 (PST)
Received: from localhost ([78.129.130.236])
	by smtp.gmail.com with ESMTPSA id u4sm28204260wjz.4.2015.11.16.05.23.27
	(version=TLS1 cipher=AES128-SHA bits=128/128);
	Mon, 16 Nov 2015 05:23:29 -0800 (PST)
From: shannon.zhao@linaro.org
To: qemu-arm@nongnu.org, peter.maydell@linaro.org, mst@redhat.com,
	imammedo@redhat.com, wei@redhat.com
Date: Mon, 16 Nov 2015 21:23:02 +0800
Message-Id: <1447680189-2128-2-git-send-email-shannon.zhao@linaro.org>
X-Mailer: git-send-email 1.9.5.msysgit.1
In-Reply-To: <1447680189-2128-1-git-send-email-shannon.zhao@linaro.org>
References: <1447680189-2128-1-git-send-email-shannon.zhao@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:400c:c09::22b
Cc: zhaoshenglong@huawei.com, qemu-devel@nongnu.org, graeme.gregory@linaro.org,
	peter.huangpeng@huawei.com
Subject: [Qemu-devel] [PATCH v3 1/8] hw/arm/virt: Add a GPIO controller
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
X-TUID: OGlp9khePv4R

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
2.1.0

