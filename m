Received: by 10.25.159.19 with SMTP id i19csp863170lfe;
        Fri, 12 Feb 2016 06:47:06 -0800 (PST)
X-Received: by 10.140.95.117 with SMTP id h108mr2289129qge.65.1455288424980;
        Fri, 12 Feb 2016 06:47:04 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p47si16080620qge.79.2016.02.12.06.47.04
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 12 Feb 2016 06:47:04 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:33255 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aUEzw-00059u-Fc
	for alex.bennee@linaro.org; Fri, 12 Feb 2016 09:47:04 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38170)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1aUEz7-0003zz-BP
	for qemu-devel@nongnu.org; Fri, 12 Feb 2016 09:46:14 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1aUEz6-0004p9-BQ
	for qemu-devel@nongnu.org; Fri, 12 Feb 2016 09:46:13 -0500
Received: from mnementh.archaic.org.uk ([2001:8b0:1d0::1]:57320)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1aUEz6-0004jw-3x; Fri, 12 Feb 2016 09:46:12 -0500
Received: from pm215 by mnementh.archaic.org.uk with local (Exim 4.84)
	(envelope-from <pm215@archaic.org.uk>)
	id 1aUEyv-0007qM-Fn; Fri, 12 Feb 2016 14:46:01 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Date: Fri, 12 Feb 2016 14:45:58 +0000
Message-Id: <1455288361-30117-2-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1455288361-30117-1-git-send-email-peter.maydell@linaro.org>
References: <1455288361-30117-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2001:8b0:1d0::1
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
	Markus Armbruster <armbru@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>
Subject: [Qemu-devel] [PATCH 1/4] hw/arm/virt: Provide a secure-only RAM if
	booting in Secure mode
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
X-TUID: VeDjxAbsxveU

If we're booting in Secure mode, provide a secure-only RAM
(just 16MB) so that secure firmware has somewhere to run
from that won't be accessible to the Non-secure guest.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/virt.c         | 26 ++++++++++++++++++++++++++
 include/hw/arm/virt.h |  1 +
 2 files changed, 27 insertions(+)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 44bbbea..5bdfe0f 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -127,6 +127,7 @@ static const MemMapEntry a15memmap[] = {
     [VIRT_MMIO] =               { 0x0a000000, 0x00000200 },
     /* ...repeating for a total of NUM_VIRTIO_TRANSPORTS, each of that size */
     [VIRT_PLATFORM_BUS] =       { 0x0c000000, 0x02000000 },
+    [VIRT_SECURE_MEM] =         { 0x0e000000, 0x01000000 },
     [VIRT_PCIE_MMIO] =          { 0x10000000, 0x2eff0000 },
     [VIRT_PCIE_PIO] =           { 0x3eff0000, 0x00010000 },
     [VIRT_PCIE_ECAM] =          { 0x3f000000, 0x01000000 },
@@ -960,6 +961,30 @@ static void create_platform_bus(VirtBoardInfo *vbi, qemu_irq *pic)
                                 sysbus_mmio_get_region(s, 0));
 }
 
+static void create_secure_ram(VirtBoardInfo *vbi, MemoryRegion *secure_sysmem)
+{
+        MemoryRegion *secram = g_new(MemoryRegion, 1);
+        char *nodename;
+        hwaddr base = vbi->memmap[VIRT_SECURE_MEM].base;
+        hwaddr size = vbi->memmap[VIRT_SECURE_MEM].size;
+
+        memory_region_init_ram(secram, NULL, "virt.secure-ram",
+                               size, &error_fatal);
+        vmstate_register_ram_global(secram);
+        memory_region_add_subregion(secure_sysmem, base, secram);
+
+        nodename = g_strdup_printf("/secram@%" PRIx64, base);
+        qemu_fdt_add_subnode(vbi->fdt, nodename);
+        qemu_fdt_setprop_string(vbi->fdt, nodename, "device_type",
+                                "memory");
+        qemu_fdt_setprop_sized_cells(vbi->fdt, nodename, "reg",
+                                     2, base, 2, size);
+        qemu_fdt_setprop_string(vbi->fdt, nodename, "status", "disabled");
+        qemu_fdt_setprop_string(vbi->fdt, nodename, "secure-status", "okay");
+
+        g_free(nodename);
+}
+
 static void *machvirt_dtb(const struct arm_boot_info *binfo, int *fdt_size)
 {
     const VirtBoardInfo *board = (const VirtBoardInfo *)binfo;
@@ -1152,6 +1177,7 @@ static void machvirt_init(MachineState *machine)
     create_uart(vbi, pic, VIRT_UART, sysmem);
 
     if (vms->secure) {
+        create_secure_ram(vbi, secure_sysmem);
         create_uart(vbi, pic, VIRT_SECURE_UART, secure_sysmem);
     }
 
diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
index 1ce7847..ecd8589 100644
--- a/include/hw/arm/virt.h
+++ b/include/hw/arm/virt.h
@@ -61,6 +61,7 @@ enum {
     VIRT_PCIE_MMIO_HIGH,
     VIRT_GPIO,
     VIRT_SECURE_UART,
+    VIRT_SECURE_MEM,
 };
 
 typedef struct MemMapEntry {
-- 
1.9.1

