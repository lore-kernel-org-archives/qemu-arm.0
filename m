Received: by 10.25.159.19 with SMTP id i19csp1786127lfe;
        Thu, 14 Jan 2016 05:53:02 -0800 (PST)
X-Received: by 10.25.22.38 with SMTP id m38mr1119634lfi.142.1452779578140;
        Thu, 14 Jan 2016 05:52:58 -0800 (PST)
Return-Path: <pm215@archaic.org.uk>
Received: from mnementh.archaic.org.uk (mnementh.archaic.org.uk. [2001:8b0:1d0::1])
        by mx.google.com with ESMTPS id l67si3213264lfd.209.2016.01.14.05.52.57
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Thu, 14 Jan 2016 05:52:58 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::1 as permitted sender) client-ip=2001:8b0:1d0::1;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::1 as permitted sender) smtp.mailfrom=pm215@archaic.org.uk
Received: from pm215 by mnementh.archaic.org.uk with local (Exim 4.80)
	(envelope-from <pm215@archaic.org.uk>)
	id 1aJiKe-0008V9-21; Thu, 14 Jan 2016 13:52:56 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Cc: patches@linaro.org,
	qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	=?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>
Subject: [PATCH v3 18/19] hw/arm/virt: add secure memory region and UART
Date: Thu, 14 Jan 2016 13:52:54 +0000
Message-Id: <1452779575-32582-19-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1452779575-32582-1-git-send-email-peter.maydell@linaro.org>
References: <1452779575-32582-1-git-send-email-peter.maydell@linaro.org>
X-TUID: iYfnCrXX7f5V

Add a secure memory region to the virt board, which is the
same as the nonsecure memory region except that it also has
a secure-only UART in it. This is only created if the
board is started with the '-machine secure=on' property.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Acked-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
---
 hw/arm/virt.c         | 55 ++++++++++++++++++++++++++++++++++++++++++++-------
 include/hw/arm/virt.h |  1 +
 2 files changed, 49 insertions(+), 7 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index c9addad..e0ca231 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -122,6 +122,7 @@ static const MemMapEntry a15memmap[] = {
     [VIRT_RTC] =                { 0x09010000, 0x00001000 },
     [VIRT_FW_CFG] =             { 0x09020000, 0x00000018 },
     [VIRT_GPIO] =               { 0x09030000, 0x00001000 },
+    [VIRT_SECURE_UART] =        { 0x09040000, 0x00001000 },
     [VIRT_MMIO] =               { 0x0a000000, 0x00000200 },
     /* ...repeating for a total of NUM_VIRTIO_TRANSPORTS, each of that size */
     [VIRT_PLATFORM_BUS] =       { 0x0c000000, 0x02000000 },
@@ -138,6 +139,7 @@ static const int a15irqmap[] = {
     [VIRT_RTC] = 2,
     [VIRT_PCIE] = 3, /* ... to 6 */
     [VIRT_GPIO] = 7,
+    [VIRT_SECURE_UART] = 8,
     [VIRT_MMIO] = 16, /* ...to 16 + NUM_VIRTIO_TRANSPORTS - 1 */
     [VIRT_GIC_V2M] = 48, /* ...to 48 + NUM_GICV2M_SPIS - 1 */
     [VIRT_PLATFORM_BUS] = 112, /* ...to 112 + PLATFORM_BUS_NUM_IRQS -1 */
@@ -488,16 +490,22 @@ static void create_gic(VirtBoardInfo *vbi, qemu_irq *pic, int type, bool secure)
     }
 }
 
-static void create_uart(const VirtBoardInfo *vbi, qemu_irq *pic)
+static void create_uart(const VirtBoardInfo *vbi, qemu_irq *pic, int uart,
+                        MemoryRegion *mem)
 {
     char *nodename;
-    hwaddr base = vbi->memmap[VIRT_UART].base;
-    hwaddr size = vbi->memmap[VIRT_UART].size;
-    int irq = vbi->irqmap[VIRT_UART];
+    hwaddr base = vbi->memmap[uart].base;
+    hwaddr size = vbi->memmap[uart].size;
+    int irq = vbi->irqmap[uart];
     const char compat[] = "arm,pl011\0arm,primecell";
     const char clocknames[] = "uartclk\0apb_pclk";
+    DeviceState *dev = qdev_create(NULL, "pl011");
+    SysBusDevice *s = SYS_BUS_DEVICE(dev);
 
-    sysbus_create_simple("pl011", base, pic[irq]);
+    qdev_init_nofail(dev);
+    memory_region_add_subregion(mem, base,
+                                sysbus_mmio_get_region(s, 0));
+    sysbus_connect_irq(s, 0, pic[irq]);
 
     nodename = g_strdup_printf("/pl011@%" PRIx64, base);
     qemu_fdt_add_subnode(vbi->fdt, nodename);
@@ -514,7 +522,14 @@ static void create_uart(const VirtBoardInfo *vbi, qemu_irq *pic)
     qemu_fdt_setprop(vbi->fdt, nodename, "clock-names",
                          clocknames, sizeof(clocknames));
 
-    qemu_fdt_setprop_string(vbi->fdt, "/chosen", "stdout-path", nodename);
+    if (uart == VIRT_UART) {
+        qemu_fdt_setprop_string(vbi->fdt, "/chosen", "stdout-path", nodename);
+    } else {
+        /* Mark as not usable by the normal world */
+        qemu_fdt_setprop_string(vbi->fdt, nodename, "status", "disabled");
+        qemu_fdt_setprop_string(vbi->fdt, nodename, "secure-status", "okay");
+    }
+
     g_free(nodename);
 }
 
@@ -994,6 +1009,7 @@ static void machvirt_init(MachineState *machine)
     VirtMachineState *vms = VIRT_MACHINE(machine);
     qemu_irq pic[NUM_IRQS];
     MemoryRegion *sysmem = get_system_memory();
+    MemoryRegion *secure_sysmem = NULL;
     int gic_version = vms->gic_version;
     int n, max_cpus;
     MemoryRegion *ram = g_new(MemoryRegion, 1);
@@ -1052,6 +1068,23 @@ static void machvirt_init(MachineState *machine)
         exit(1);
     }
 
+    if (vms->secure) {
+        if (kvm_enabled()) {
+            error_report("mach-virt: KVM does not support Security extensions");
+            exit(1);
+        }
+
+        /* The Secure view of the world is the same as the NonSecure,
+         * but with a few extra devices. Create it as a container region
+         * containing the system memory at low priority; any secure-only
+         * devices go in at higher priority and take precedence.
+         */
+        secure_sysmem = g_new(MemoryRegion, 1);
+        memory_region_init(secure_sysmem, OBJECT(machine), "secure-memory",
+                           UINT64_MAX);
+        memory_region_add_subregion_overlap(secure_sysmem, 0, sysmem, -1);
+    }
+
     create_fdt(vbi);
 
     for (n = 0; n < smp_cpus; n++) {
@@ -1094,6 +1127,10 @@ static void machvirt_init(MachineState *machine)
 
         object_property_set_link(cpuobj, OBJECT(sysmem), "memory",
                                  &error_abort);
+        if (vms->secure) {
+            object_property_set_link(cpuobj, OBJECT(secure_sysmem),
+                                     "secure-memory", &error_abort);
+        }
 
         object_property_set_bool(cpuobj, true, "realized", NULL);
     }
@@ -1110,7 +1147,11 @@ static void machvirt_init(MachineState *machine)
 
     create_gic(vbi, pic, gic_version, vms->secure);
 
-    create_uart(vbi, pic);
+    create_uart(vbi, pic, VIRT_UART, sysmem);
+
+    if (vms->secure) {
+        create_uart(vbi, pic, VIRT_SECURE_UART, secure_sysmem);
+    }
 
     create_rtc(vbi, pic);
 
diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
index 925faa7..1ce7847 100644
--- a/include/hw/arm/virt.h
+++ b/include/hw/arm/virt.h
@@ -60,6 +60,7 @@ enum {
     VIRT_PLATFORM_BUS,
     VIRT_PCIE_MMIO_HIGH,
     VIRT_GPIO,
+    VIRT_SECURE_UART,
 };
 
 typedef struct MemMapEntry {
-- 
1.9.1
