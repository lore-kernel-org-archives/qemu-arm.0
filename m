Received: by 10.223.159.74 with SMTP id f10csp710027wrg;
        Fri, 8 Dec 2017 07:02:44 -0800 (PST)
X-Google-Smtp-Source: AGs4zMYW4TeAADhVBGj6QATNtaPTECakf/YIPXQlgMJo15OvV/+Okzflb0g6e6BqtC4K+KKkFlLB
X-Received: by 10.37.105.140 with SMTP id e134mr6485263ybc.248.1512745364782;
        Fri, 08 Dec 2017 07:02:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1512745364; cv=none;
        d=google.com; s=arc-20160816;
        b=sAGozA8ul28ByTpfsYpsB4sARjF6z+wr07PRIEXXFsxnLGtUJNjfnKKGUFVAm9odsS
         cx9sINDEJCbiOFn7r+dT5O+e42PaRtj87fJi1ki9bVevFBdD2vQIAGNU/J5DW4tV21tu
         /ElisK1ynTK8CGMVctYbmZeFSYdvntn0MYrBEFPUCGmdcUESRduEYjDU/PdhBDty698N
         dxDvP5n90y+HFgc7Qpu6ZPohVIc5cBn+/wqNxHWU2Eaix5ojGhPXTeoGnQ5+twLSCwBC
         KZq4IQUwfvxSmRkdyRT6SL8n63je2QDdACrIKzjsWLXpiJiE3wyOimNy0QxpQYpLRSOz
         s55Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=4/vL3fKmdXB/2Jc76dU3nLfqA50MYkZ7A309BCNs6aE=;
        b=gqNub1ZaRc4M7AkeiyBNB5JszT7NgcHhxYqYtRqXUwi90z/AFnkEoFLXocKIv8/XWD
         cRWU3koXITDzZJVF4fb5yjdmVLPFMLtyoNaOlhA267hxwjzI6rqvHR/tXNfDiuYBzhUT
         bFjjwbPL81cmhJlOTOeSOg0ZYGvjlEI6UriGcfF4YpsRVPxhaKTMnQdiZX+q8twbqBvJ
         dAkobXSZUGIiEwH04bhevq9Lt3Tq2GR7gKuFtC3NUT88AVYlmT2rlFpY1eAwhWr5XBho
         X9WDasZlbdY79CXhL00x3Mb1nf8CY6ibIbMJijNW9HzxbY8hp5UUp5e3fgkkmTFme3xa
         0g7A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u97si824680ybi.463.2017.12.08.07.02.44
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 08 Dec 2017 07:02:44 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37638 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eNKAm-0000jw-9h
	for alex.bennee@linaro.org; Fri, 08 Dec 2017 10:02:44 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51924)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1eNKAH-0000bd-JW
	for qemu-arm@nongnu.org; Fri, 08 Dec 2017 10:02:18 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1eNKAG-0007KW-Ot
	for qemu-arm@nongnu.org; Fri, 08 Dec 2017 10:02:13 -0500
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:38946)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1eNKAG-0007Jn-IA; Fri, 08 Dec 2017 10:02:12 -0500
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1eNKAE-0000ti-6w; Fri, 08 Dec 2017 15:02:10 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Fri,  8 Dec 2017 15:02:07 +0000
Message-Id: <1512745328-5109-3-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1512745328-5109-1-git-send-email-peter.maydell@linaro.org>
References: <1512745328-5109-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 2/3] hw/arm/virt: Add another UART to the virt
 board
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
Cc: "Jason A . Donenfeld" <Jason@zx2c4.com>,
	Shannon Zhao <shannon.zhao@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: dPvxwG5ZT8SK

Currently we only provide one non-secure UART on the virt
board. This is OK for most purposes, but there are some
use cases where having a second UART would be useful (like
bare-metal testing where you don't really want to have to
probe and set up a PCI device just to have a second comms
channel).

Add a second NS UART to the virt board. This will be the
second serial device if 'secure=no' (the default), and the
third serial device if 'secure=yes'.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/arm/virt.h |  2 ++
 hw/arm/virt.c         | 19 ++++++++++++++++---
 2 files changed, 18 insertions(+), 3 deletions(-)

diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
index 33b0ff3..685009a 100644
--- a/include/hw/arm/virt.h
+++ b/include/hw/arm/virt.h
@@ -72,6 +72,7 @@ enum {
     VIRT_GPIO,
     VIRT_SECURE_UART,
     VIRT_SECURE_MEM,
+    VIRT_UART_2,
 };
 
 typedef struct MemMapEntry {
@@ -85,6 +86,7 @@ typedef struct {
     bool no_its;
     bool no_pmu;
     bool claim_edge_triggered_timers;
+    bool no_second_uart;
 } VirtMachineClass;
 
 typedef struct {
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 543f9bd..e234f55 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -139,6 +139,7 @@ static const MemMapEntry a15memmap[] = {
     [VIRT_FW_CFG] =             { 0x09020000, 0x00000018 },
     [VIRT_GPIO] =               { 0x09030000, 0x00001000 },
     [VIRT_SECURE_UART] =        { 0x09040000, 0x00001000 },
+    [VIRT_UART_2] =             { 0x09050000, 0x00001000 },
     [VIRT_MMIO] =               { 0x0a000000, 0x00000200 },
     /* ...repeating for a total of NUM_VIRTIO_TRANSPORTS, each of that size */
     [VIRT_PLATFORM_BUS] =       { 0x0c000000, 0x02000000 },
@@ -157,6 +158,7 @@ static const int a15irqmap[] = {
     [VIRT_PCIE] = 3, /* ... to 6 */
     [VIRT_GPIO] = 7,
     [VIRT_SECURE_UART] = 8,
+    [VIRT_UART_2] = 9,
     [VIRT_MMIO] = 16, /* ...to 16 + NUM_VIRTIO_TRANSPORTS - 1 */
     [VIRT_GIC_V2M] = 48, /* ...to 48 + NUM_GICV2M_SPIS - 1 */
     [VIRT_PLATFORM_BUS] = 112, /* ...to 112 + PLATFORM_BUS_NUM_IRQS -1 */
@@ -676,7 +678,7 @@ static void create_uart(const VirtMachineState *vms, qemu_irq *pic, int uart,
 
     if (uart == VIRT_UART) {
         qemu_fdt_setprop_string(vms->fdt, "/chosen", "stdout-path", nodename);
-    } else {
+    } else if (uart == VIRT_SECURE_UART) {
         /* Mark as not usable by the normal world */
         qemu_fdt_setprop_string(vms->fdt, nodename, "status", "disabled");
         qemu_fdt_setprop_string(vms->fdt, nodename, "secure-status", "okay");
@@ -1260,6 +1262,7 @@ static void machvirt_init(MachineState *machine)
     int n, virt_max_cpus;
     MemoryRegion *ram = g_new(MemoryRegion, 1);
     bool firmware_loaded = bios_name || drive_get(IF_PFLASH, 0, 0);
+    int uart_count = 0;
 
     /* We can probe only here because during property set
      * KVM is not available yet
@@ -1419,11 +1422,16 @@ static void machvirt_init(MachineState *machine)
 
     fdt_add_pmu_nodes(vms);
 
-    create_uart(vms, pic, VIRT_UART, sysmem, serial_hds[0]);
+    create_uart(vms, pic, VIRT_UART, sysmem, serial_hds[uart_count++]);
 
     if (vms->secure) {
         create_secure_ram(vms, secure_sysmem);
-        create_uart(vms, pic, VIRT_SECURE_UART, secure_sysmem, serial_hds[1]);
+        create_uart(vms, pic, VIRT_SECURE_UART, secure_sysmem,
+                    serial_hds[uart_count++]);
+    }
+
+    if (!vmc->no_second_uart) {
+        create_uart(vms, pic, VIRT_UART_2, sysmem, serial_hds[uart_count++]);
     }
 
     create_rtc(vms, pic);
@@ -1693,8 +1701,13 @@ static void virt_2_11_instance_init(Object *obj)
 
 static void virt_machine_2_11_options(MachineClass *mc)
 {
+    VirtMachineClass *vmc = VIRT_MACHINE_CLASS(OBJECT_CLASS(mc));
+
     virt_machine_2_12_options(mc);
     SET_MACHINE_COMPAT(mc, VIRT_COMPAT_2_11);
+
+    /* The second NS UART was added in 2.12 */
+    vmc->no_second_uart = true;
 }
 DEFINE_VIRT_MACHINE(2, 11)
 
-- 
2.7.4

