Received: by 10.25.159.19 with SMTP id i19csp1054671lfe;
        Fri, 29 Jan 2016 08:56:49 -0800 (PST)
X-Received: by 10.55.19.129 with SMTP id 1mr11988727qkt.51.1454086609224;
        Fri, 29 Jan 2016 08:56:49 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 33si18497325qgj.71.2016.01.29.08.56.48
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 29 Jan 2016 08:56:49 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro.org
Received: from localhost ([::1]:35324 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aPCLo-00064t-Pl
	for alex.bennee@linaro.org; Fri, 29 Jan 2016 11:56:48 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36805)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@linaro.org>) id 1aPCJO-00024p-Br
	for qemu-devel@nongnu.org; Fri, 29 Jan 2016 11:54:19 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@linaro.org>) id 1aPCJN-00041m-9n
	for qemu-devel@nongnu.org; Fri, 29 Jan 2016 11:54:18 -0500
Received: from mail-wm0-x22e.google.com ([2a00:1450:400c:c09::22e]:38714)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@linaro.org>) id 1aPCJM-00041b-V6
	for qemu-devel@nongnu.org; Fri, 29 Jan 2016 11:54:17 -0500
Received: by mail-wm0-x22e.google.com with SMTP id p63so76304085wmp.1
	for <qemu-devel@nongnu.org>; Fri, 29 Jan 2016 08:54:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=AXubFGUVabL39KLr3EcjOlEf8wn+v19zBBtKa9vPuac=;
	b=kvo5fOYJAIF28ysdDdkRRASoc2xrtnk/Tmvcy5G2G0bbGqHDsNrbs5YNQnW3VL6FrJ
	+mLazCmIVnDZrRv7qzA1exq1ros7wHEYpevuAcxXPlkinT7wWxyIyE68GeBwbXt4Gnqx
	zvLvGFRHXCz586U/Srqdj02hgRntTr3J3EFco=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=AXubFGUVabL39KLr3EcjOlEf8wn+v19zBBtKa9vPuac=;
	b=FXYXgokDIjugGeipl7WaL7xIFsXB5EAAOFra8zB46HrnktD03m+cY7jY6oHyihjlfN
	qDXNNXeGlOz9j6wNyvQWvrCp4nBzYDyKkxXl3z4uL4r7OihTxpBqbtorqkIbSl0HE4Jp
	zretofD1nchwixAIbPJxOK6/To/CZX0bAt/1tULLCFT36AvQjYVS+M0F9U80fSQy2aSS
	Td3dXZettMPY9xLyp+ZX3kqOroXE98JPHAjotzoVbkYp3931JypbjsGZWHvjSEDjAdl0
	EUkFjIxiLox4FTZ6o1oBr3Rw2mTQx/b/mDLPf1nBxAqCKeFgTH1OPCIrjGBfLsNLPnvk
	nxmA==
X-Gm-Message-State: AG10YOQU7jAcs0DXg6fLQW+NyAq1YszGUmHrtxik90wwvuff9u4uODQbEw6CkKF1IYlWV/Lh
X-Received: by 10.194.172.97 with SMTP id bb1mr11038576wjc.173.1454086456313; 
	Fri, 29 Jan 2016 08:54:16 -0800 (PST)
Received: from new-host-12.home
	(LMontsouris-657-1-37-90.w80-11.abo.wanadoo.fr. [80.11.198.90])
	by smtp.gmail.com with ESMTPSA id
	ei9sm16415530wjd.40.2016.01.29.08.54.13
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 29 Jan 2016 08:54:14 -0800 (PST)
From: Eric Auger <eric.auger@linaro.org>
To: eric.auger@st.com, eric.auger@linaro.org, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org, alex.williamson@redhat.com,
	pranav.sawargaonkar@gmail.com, p.fedin@samsung.com, pbonzini@redhat.com,
	agraf@suse.de
Date: Fri, 29 Jan 2016 16:53:48 +0000
Message-Id: <1454086429-4373-8-git-send-email-eric.auger@linaro.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1454086429-4373-1-git-send-email-eric.auger@linaro.org>
References: <1454086429-4373-1-git-send-email-eric.auger@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::22e
Cc: Bharat.Bhushan@freescale.com, suravee.suthikulpanit@amd.com,
	christoffer.dall@linaro.org
Subject: [Qemu-devel] [RFC v2 7/8] hw: arm: virt: register reserved IOVA
	region
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
X-TUID: Q966kNLAwAEm

Registers a 16x64kB reserved iova region. Currently this iova
region is used by the host kernel to map host MSI controller frames
(GICv2m, GITS_TRANSLATER). The host kernel needs this iova window
since it cannot program the PCIe device with MSI frame physical
address (as opposed to x86) since the MSI write transactions go
through the IOMMU.

The reserved region is mapped on the platform bus.

Signed-off-by: Eric Auger <eric.auger@linaro.org>

---

RFC v1 -> RFC v2:
- use the platform bus to map the reserved iova region
---
 hw/arm/virt.c | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 3839c68..4b2a891 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -805,7 +805,7 @@ static void create_pcie_irq_map(const VirtBoardInfo *vbi, uint32_t gic_phandle,
 }
 
 static void create_pcie(const VirtBoardInfo *vbi, qemu_irq *pic,
-                        bool use_highmem)
+                        bool use_highmem, MemoryRegion **reserved_reg)
 {
     hwaddr base_mmio = vbi->memmap[VIRT_PCIE_MMIO].base;
     hwaddr size_mmio = vbi->memmap[VIRT_PCIE_MMIO].size;
@@ -920,10 +920,16 @@ static void create_pcie(const VirtBoardInfo *vbi, qemu_irq *pic,
     qemu_fdt_setprop_cell(vbi->fdt, nodename, "#interrupt-cells", 1);
     create_pcie_irq_map(vbi, vbi->gic_phandle, irq, nodename);
 
+    /* initialize the reserved iova region for MSI binding (16 x 64kb) */
+    *reserved_reg = g_new0(MemoryRegion, 1);
+    memory_region_init_reserved_iova(*reserved_reg, OBJECT(dev),
+                                     "reserved-iova",
+                                     0x100000, &error_fatal);
+
     g_free(nodename);
 }
 
-static void create_platform_bus(VirtBoardInfo *vbi, qemu_irq *pic)
+static PlatformBusDevice *create_platform_bus(VirtBoardInfo *vbi, qemu_irq *pic)
 {
     DeviceState *dev;
     SysBusDevice *s;
@@ -962,6 +968,7 @@ static void create_platform_bus(VirtBoardInfo *vbi, qemu_irq *pic)
     memory_region_add_subregion(sysmem,
                                 platform_bus_params.platform_bus_base,
                                 sysbus_mmio_get_region(s, 0));
+    return PLATFORM_BUS_DEVICE(dev);
 }
 
 static void *machvirt_dtb(const struct arm_boot_info *binfo, int *fdt_size)
@@ -1015,7 +1022,7 @@ static void machvirt_init(MachineState *machine)
     VirtMachineState *vms = VIRT_MACHINE(machine);
     qemu_irq pic[NUM_IRQS];
     MemoryRegion *sysmem = get_system_memory();
-    MemoryRegion *secure_sysmem = NULL;
+    MemoryRegion *secure_sysmem = NULL, *reserved_reg;
     int gic_version = vms->gic_version;
     int n, max_cpus;
     MemoryRegion *ram = g_new(MemoryRegion, 1);
@@ -1024,6 +1031,7 @@ static void machvirt_init(MachineState *machine)
     VirtGuestInfoState *guest_info_state = g_malloc0(sizeof *guest_info_state);
     VirtGuestInfo *guest_info = &guest_info_state->info;
     char **cpustr;
+    PlatformBusDevice *pbus;
 
     if (!cpu_model) {
         cpu_model = "cortex-a15";
@@ -1161,7 +1169,7 @@ static void machvirt_init(MachineState *machine)
 
     create_rtc(vbi, pic);
 
-    create_pcie(vbi, pic, vms->highmem);
+    create_pcie(vbi, pic, vms->highmem, &reserved_reg);
 
     create_gpio(vbi, pic);
 
@@ -1200,7 +1208,8 @@ static void machvirt_init(MachineState *machine)
      * another notifier is registered which adds platform bus nodes.
      * Notifiers are executed in registration reverse order.
      */
-    create_platform_bus(vbi, pic);
+    pbus = create_platform_bus(vbi, pic);
+    platform_bus_map_region(pbus, reserved_reg);
 }
 
 static bool virt_get_secure(Object *obj, Error **errp)
-- 
1.9.1

