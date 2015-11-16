Received: by 10.182.158.201 with SMTP id ww9csp129786obb;
        Mon, 16 Nov 2015 06:22:39 -0800 (PST)
X-Received: by 10.194.185.6 with SMTP id ey6mr22657386wjc.42.1447683759088;
        Mon, 16 Nov 2015 06:22:39 -0800 (PST)
Return-Path: <pm215@archaic.org.uk>
Received: from mnementh.archaic.org.uk (mnementh.archaic.org.uk. [2001:8b0:1d0::1])
        by mx.google.com with ESMTPS id r16si16961658wmb.2.2015.11.16.06.22.38
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Mon, 16 Nov 2015 06:22:39 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::1 as permitted sender) client-ip=2001:8b0:1d0::1;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::1 as permitted sender) smtp.mailfrom=pm215@archaic.org.uk
Received: from pm215 by mnementh.archaic.org.uk with local (Exim 4.80)
	(envelope-from <pm215@archaic.org.uk>)
	id 1ZyKPM-00013m-43; Mon, 16 Nov 2015 14:05:24 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Cc: patches@linaro.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>,
	qemu-arm@nongnu.org
Subject: [PATCH v2 18/19] [RFC] hw/arm/virt: add secure memory region and UART
Date: Mon, 16 Nov 2015 14:05:22 +0000
Message-Id: <1447682723-3977-19-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1447682723-3977-1-git-send-email-peter.maydell@linaro.org>
References: <1447682723-3977-1-git-send-email-peter.maydell@linaro.org>
X-TUID: abJEsVwaB4p3

Add a secure memory region to the virt board, which is the
same as the nonsecure memory region except that it also has
a secure-only UART in it. This is only created if the
board is started with the '-machine secure=on' property.

This is an RFC patch, beacuse the device tree bindings for
indicating secure vs nonsecure devices are still under
discussion upstream:
      https://lkml.org/lkml/2015/10/29/287

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/virt.c         | 55 ++++++++++++++++++++++++++++++++++++++++++++-------
 include/hw/arm/virt.h |  1 +
 2 files changed, 49 insertions(+), 7 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 47cc196..623e835 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -120,6 +120,7 @@ static const MemMapEntry a15memmap[] = {
     [VIRT_UART] =               { 0x09000000, 0x00001000 },
     [VIRT_RTC] =                { 0x09010000, 0x00001000 },
     [VIRT_FW_CFG] =             { 0x09020000, 0x00000018 },
+    [VIRT_SECURE_UART] =        { 0x09030000, 0x00001000 },
     [VIRT_MMIO] =               { 0x0a000000, 0x00000200 },
     /* ...repeating for a total of NUM_VIRTIO_TRANSPORTS, each of that size */
     [VIRT_PLATFORM_BUS] =       { 0x0c000000, 0x02000000 },
@@ -135,6 +136,7 @@ static const int a15irqmap[] = {
     [VIRT_UART] = 1,
     [VIRT_RTC] = 2,
     [VIRT_PCIE] = 3, /* ... to 6 */
+    [VIRT_SECURE_UART] = 7,
     [VIRT_MMIO] = 16, /* ...to 16 + NUM_VIRTIO_TRANSPORTS - 1 */
     [VIRT_GIC_V2M] = 48, /* ...to 48 + NUM_GICV2M_SPIS - 1 */
     [VIRT_PLATFORM_BUS] = 112, /* ...to 112 + PLATFORM_BUS_NUM_IRQS -1 */
@@ -485,16 +487,22 @@ static void create_gic(VirtBoardInfo *vbi, qemu_irq *pic, int type, bool secure)
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
@@ -511,7 +519,14 @@ static void create_uart(const VirtBoardInfo *vbi, qemu_irq *pic)
     qemu_fdt_setprop(vbi->fdt, nodename, "clock-names",
                          clocknames, sizeof(clocknames));
 
-    qemu_fdt_setprop_string(vbi->fdt, "/chosen", "stdout-path", nodename);
+    if (uart == VIRT_UART) {
+        qemu_fdt_setprop_string(vbi->fdt, "/chosen", "stdout-path", nodename);
+    } else {
+        /* Mark as not usable by the normal world */
+        qemu_fdt_setprop_string(vbi->fdt, nodename, "status", "secure");
+        qemu_fdt_setprop_string(vbi->fdt, nodename, "secure-status", "okay");
+    }
+
     g_free(nodename);
 }
 
@@ -922,6 +937,7 @@ static void machvirt_init(MachineState *machine)
     VirtMachineState *vms = VIRT_MACHINE(machine);
     qemu_irq pic[NUM_IRQS];
     MemoryRegion *sysmem = get_system_memory();
+    MemoryRegion *secure_sysmem = NULL;
     int gic_version = vms->gic_version;
     int n, max_cpus;
     MemoryRegion *ram = g_new(MemoryRegion, 1);
@@ -980,6 +996,23 @@ static void machvirt_init(MachineState *machine)
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
@@ -1022,6 +1055,10 @@ static void machvirt_init(MachineState *machine)
 
         object_property_set_link(cpuobj, OBJECT(sysmem), "memory",
                                  &error_abort);
+        if (vms->secure) {
+            object_property_set_link(cpuobj, OBJECT(secure_sysmem),
+                                     "secure-memory", &error_abort);
+        }
 
         object_property_set_bool(cpuobj, true, "realized", NULL);
     }
@@ -1038,7 +1075,11 @@ static void machvirt_init(MachineState *machine)
 
     create_gic(vbi, pic, gic_version, vms->secure);
 
-    create_uart(vbi, pic);
+    create_uart(vbi, pic, VIRT_UART, sysmem);
+
+    if (vms->secure) {
+        create_uart(vbi, pic, VIRT_SECURE_UART, secure_sysmem);
+    }
 
     create_rtc(vbi, pic);
 
diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
index f464586..9622e9f 100644
--- a/include/hw/arm/virt.h
+++ b/include/hw/arm/virt.h
@@ -59,6 +59,7 @@ enum {
     VIRT_PCIE_ECAM,
     VIRT_PLATFORM_BUS,
     VIRT_PCIE_MMIO_HIGH,
+    VIRT_SECURE_UART,
 };
 
 typedef struct MemMapEntry {
-- 
1.9.1
