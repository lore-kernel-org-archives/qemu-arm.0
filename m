Received: by 10.223.197.9 with SMTP id q9csp10505791wrf;
        Mon, 23 Oct 2017 05:27:45 -0700 (PDT)
X-Google-Smtp-Source: ABhQp+QdZGLCz2ryAlzWRvzIPpw/1dALPCOgDG84uJCFf5E9IQBNFvo9PHnnhU8nLmJq4UIFQFaj
X-Received: by 10.237.62.71 with SMTP id m7mr19265519qtf.269.1508761665871;
        Mon, 23 Oct 2017 05:27:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1508761665; cv=none;
        d=google.com; s=arc-20160816;
        b=pxTdBk9t9x6VMIHzqkoRAtl2r8lBO1bnTf8ZBYetyhajGLOA0I+weB3O16zYIco36f
         jVWw637ODPS9CaZF+ZP4Ji39kPNN45FhycgBhvb3HENTJ/wBZx9hLmDO/M2XsjDVINSR
         Ibfpog4Aau4Q9qfxOzHRyFBxkT/n22XRIteAfoRVXcGcuc4zLspGFDOhN7r6J9h2ojpq
         QDy4BZFWYdnUM/k9ZKt/IpH+X0WDyajAUozBH1rSNaUrcc0iAg3Ml39IEZTQ4yHppvOT
         TXfiYIEntEHeXZMM3cE7XDQw8BVFzEbUC8qpN1N3sRsX+AatonxGpf3kOSXNl2giIAM0
         TKgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :dkim-signature:arc-authentication-results;
        bh=Wa3vpZHk1FNBdAKF6GAABo5YLdF8CVcarJ1C6XjN74w=;
        b=sseXOXiiFeN3hWx2uL8ro8yW3oM4SUYvSTNoxCBshjnERJOrxDTlvu7AdWm7hECqHo
         c/C8V9nXsy4c+d7tykVhJ9UT08jTWfHWktzvhV7fScuPCbm7e82694Dgi4UZb3Bnqj4Q
         hqx4gRAZohvR33fPt5fcGCFJp+p7xnDkBPLyeHOPXpva2WYYlU/qgvYoPaMmzOP6b5XL
         uuGXyN+rYRXfkVaVkOO1MgjIeX+X7vEwnhCETe2/YPvqzVVPxoSxuq3mUhM3b9Z2ewyt
         SVIbHFZznEFsx3KW1KotXztABYiWl4Bis2KuqIpNTf1lVeRMC8Fk8vNupeYjFgspU/W+
         mFKA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@zx2c4.com header.s=mail header.b=0sMyKQA+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=zx2c4.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 8si2087163qto.443.2017.10.23.05.27.45
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 23 Oct 2017 05:27:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@zx2c4.com header.s=mail header.b=0sMyKQA+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=zx2c4.com
Received: from localhost ([::1]:38531 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e6bpX-0008CI-L4
	for alex.bennee@linaro.org; Mon, 23 Oct 2017 08:27:43 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46812)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Jason@zx2c4.com>) id 1e6bpQ-0008Bm-O7
	for qemu-arm@nongnu.org; Mon, 23 Oct 2017 08:27:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Jason@zx2c4.com>) id 1e6bpP-00031M-Ky
	for qemu-arm@nongnu.org; Mon, 23 Oct 2017 08:27:36 -0400
Received: from frisell.zx2c4.com ([192.95.5.64]:40523)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <Jason@zx2c4.com>)
	id 1e6bpL-0002zg-0E; Mon, 23 Oct 2017 08:27:31 -0400
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4ed954d0;
	Mon, 23 Oct 2017 12:26:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=from:to:cc
	:subject:date:message-id; s=mail; bh=LFgrPqAv97hGU7DYYw5Z2kYz9Z8
	=; b=0sMyKQA+LwGk5UmY7wpGPvDzYSEl9b3NVsm55ZSr80Pj3AXvwGyaVKPD3X+
	SQ6NPd4xoMOU8YJGJuGyQTCeYi2lmqkVSGUwaALafwKon5qd/o4pv/F1K53domyD
	Yl5p8ea1KAG2SML1+FkuNPCm1nu5tAvs4uDCZCJ7zv0TY3iDPHxPk86tky0xBdKf
	1eanTUToX7OS7wUyxMT7Jm8LHCzlJeqjHf1g30obHJ0u/8YsimvXRgXd8NQaaiIv
	lmGisy2WxxR1DeBzXHPAv4LKZjSfHEbQLlS+7J67DGKh+SUJ0nYvYXQuCVxZxSkr
	VfGDzqvi0acdZMxHScEdbpfKL8w==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id c958ba46
	(TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO); 
	Mon, 23 Oct 2017 12:26:08 +0000 (UTC)
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org
Date: Mon, 23 Oct 2017 14:27:19 +0200
Message-Id: <20171023122719.17199-1-Jason@zx2c4.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 192.95.5.64
Subject: [Qemu-arm] [PATCH] hw/arm/virt: support 4 serial ports
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
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: QU9ubz0cfBYl

The QEMU man page says:

       -serial dev
           This option can be used several times to
           simulate up to 4 serial ports.

However, the ARM virt machine erroneously only provides 1 serial port.
This patch fixes it by populating 4 of them.

But, unfortunately, this patch doesn't actually work. Sending it to the
list as inspiration for somebody on the ARM team who might be able to do
this more properly.

Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
---
 hw/arm/virt.c | 45 +++++++++++++++++++++++++++------------------
 1 file changed, 27 insertions(+), 18 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 9e18b410d7..12b73dfd1e 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -134,11 +134,14 @@ static const MemMapEntry a15memmap[] = {
     [VIRT_GIC_ITS] =            { 0x08080000, 0x00020000 },
     /* This redistributor space allows up to 2*64kB*123 CPUs */
     [VIRT_GIC_REDIST] =         { 0x080A0000, 0x00F60000 },
-    [VIRT_UART] =               { 0x09000000, 0x00001000 },
-    [VIRT_RTC] =                { 0x09010000, 0x00001000 },
-    [VIRT_FW_CFG] =             { 0x09020000, 0x00000018 },
-    [VIRT_GPIO] =               { 0x09030000, 0x00001000 },
-    [VIRT_SECURE_UART] =        { 0x09040000, 0x00001000 },
+    [VIRT_UART + 0] =           { 0x09000000, 0x00001000 },
+    [VIRT_UART + 1] =           { 0x09010000, 0x00001000 },
+    [VIRT_UART + 2] =           { 0x09020000, 0x00001000 },
+    [VIRT_UART + 3] =           { 0x09030000, 0x00001000 },
+    [VIRT_RTC] =                { 0x09040000, 0x00001000 },
+    [VIRT_FW_CFG] =             { 0x09050000, 0x00000018 },
+    [VIRT_GPIO] =               { 0x09060000, 0x00001000 },
+    [VIRT_SECURE_UART] =        { 0x09070000, 0x00001000 },
     [VIRT_MMIO] =               { 0x0a000000, 0x00000200 },
     /* ...repeating for a total of NUM_VIRTIO_TRANSPORTS, each of that size */
     [VIRT_PLATFORM_BUS] =       { 0x0c000000, 0x02000000 },
@@ -152,14 +155,17 @@ static const MemMapEntry a15memmap[] = {
 };
 
 static const int a15irqmap[] = {
-    [VIRT_UART] = 1,
-    [VIRT_RTC] = 2,
-    [VIRT_PCIE] = 3, /* ... to 6 */
-    [VIRT_GPIO] = 7,
-    [VIRT_SECURE_UART] = 8,
-    [VIRT_MMIO] = 16, /* ...to 16 + NUM_VIRTIO_TRANSPORTS - 1 */
-    [VIRT_GIC_V2M] = 48, /* ...to 48 + NUM_GICV2M_SPIS - 1 */
-    [VIRT_PLATFORM_BUS] = 112, /* ...to 112 + PLATFORM_BUS_NUM_IRQS -1 */
+    [VIRT_UART + 0] = 1,
+    [VIRT_UART + 1] = 2,
+    [VIRT_UART + 2] = 3,
+    [VIRT_UART + 3] = 4,
+    [VIRT_RTC] = 5,
+    [VIRT_PCIE] = 6, /* ... to 9 */
+    [VIRT_GPIO] = 10,
+    [VIRT_SECURE_UART] = 11,
+    [VIRT_MMIO] = 19, /* ...to 19 + NUM_VIRTIO_TRANSPORTS - 1 */
+    [VIRT_GIC_V2M] = 51, /* ...to 51 + NUM_GICV2M_SPIS - 1 */
+    [VIRT_PLATFORM_BUS] = 115, /* ...to 115 + PLATFORM_BUS_NUM_IRQS -1 */
 };
 
 static const char *valid_cpus[] = {
@@ -674,12 +680,12 @@ static void create_uart(const VirtMachineState *vms, qemu_irq *pic, int uart,
     qemu_fdt_setprop(vms->fdt, nodename, "clock-names",
                          clocknames, sizeof(clocknames));
 
-    if (uart == VIRT_UART) {
-        qemu_fdt_setprop_string(vms->fdt, "/chosen", "stdout-path", nodename);
-    } else {
+    if (uart == VIRT_SECURE_UART) {
         /* Mark as not usable by the normal world */
         qemu_fdt_setprop_string(vms->fdt, nodename, "status", "disabled");
         qemu_fdt_setprop_string(vms->fdt, nodename, "secure-status", "okay");
+    } else {
+        qemu_fdt_setprop_string(vms->fdt, "/chosen", "stdout-path", nodename);
     }
 
     g_free(nodename);
@@ -1419,11 +1425,14 @@ static void machvirt_init(MachineState *machine)
 
     fdt_add_pmu_nodes(vms);
 
-    create_uart(vms, pic, VIRT_UART, sysmem, serial_hds[0]);
+    create_uart(vms, pic, VIRT_UART + 0, sysmem, serial_hds[0]);
+    create_uart(vms, pic, VIRT_UART + 1, sysmem, serial_hds[1]);
+    create_uart(vms, pic, VIRT_UART + 2, sysmem, serial_hds[2]);
+    create_uart(vms, pic, VIRT_UART + 3, sysmem, serial_hds[3]);
 
     if (vms->secure) {
         create_secure_ram(vms, secure_sysmem);
-        create_uart(vms, pic, VIRT_SECURE_UART, secure_sysmem, serial_hds[1]);
+        create_uart(vms, pic, VIRT_SECURE_UART, secure_sysmem, serial_hds[4]);
     }
 
     create_rtc(vms, pic);
-- 
2.14.2

