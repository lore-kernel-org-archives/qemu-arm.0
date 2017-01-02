Received: by 10.25.205.13 with SMTP id d13csp8536515lfg;
        Mon, 2 Jan 2017 12:02:20 -0800 (PST)
X-Received: by 10.55.4.138 with SMTP id 132mr47343294qke.190.1483387340030;
        Mon, 02 Jan 2017 12:02:20 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b132si25383509qka.270.2017.01.02.12.02.19
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 02 Jan 2017 12:02:20 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:58743 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cO8oD-0001gi-Bk
	for alex.bennee@linaro.org; Mon, 02 Jan 2017 15:02:17 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33181)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1cO8o7-0001eo-MH
	for qemu-arm@nongnu.org; Mon, 02 Jan 2017 15:02:12 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1cO8o4-0003qs-UP
	for qemu-arm@nongnu.org; Mon, 02 Jan 2017 15:02:11 -0500
Received: from mx1.redhat.com ([209.132.183.28]:58278)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <drjones@redhat.com>)
	id 1cO8o4-0003qV-MS; Mon, 02 Jan 2017 15:02:08 -0500
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id BDC6996B7;
	Mon,  2 Jan 2017 20:02:08 +0000 (UTC)
Received: from kamzik.brq.redhat.com (kamzik.brq.redhat.com [10.34.1.143])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id v02K1tOh017390; Mon, 2 Jan 2017 15:02:06 -0500
From: Andrew Jones <drjones@redhat.com>
To: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Date: Mon,  2 Jan 2017 21:01:42 +0100
Message-Id: <20170102200153.28864-6-drjones@redhat.com>
In-Reply-To: <20170102200153.28864-1-drjones@redhat.com>
References: <20170102200153.28864-1-drjones@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Mon, 02 Jan 2017 20:02:08 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v2 05/16] hw/arm/virt: parameter passing cleanups
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
Cc: peter.maydell@linaro.org, ehabkost@redhat.com, mst@redhat.com,
	shannon.zhao@linaro.org, zhaoshenglong@huawei.com, imammedo@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: rZK1Bzkx6QSa

Some simple cleanups made possible by "hw/arm/virt: Merge
VirtBoardInfo and VirtMachineState"

Signed-off-by: Andrew Jones <drjones@redhat.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Acked-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/arm/virt.c | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 7eec50a82494..d451bc4f6b9b 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -570,10 +570,10 @@ static void create_v2m(VirtMachineState *vms, qemu_irq *pic)
     fdt_add_v2m_gic_node(vms);
 }
 
-static void create_gic(VirtMachineState *vms, qemu_irq *pic, int type,
-                       bool secure, bool no_its)
+static void create_gic(VirtMachineState *vms, qemu_irq *pic, int type)
 {
     /* We create a standalone GIC */
+    VirtMachineClass *vmc = VIRT_MACHINE_GET_CLASS(vms);
     DeviceState *gicdev;
     SysBusDevice *gicbusdev;
     const char *gictype;
@@ -589,7 +589,7 @@ static void create_gic(VirtMachineState *vms, qemu_irq *pic, int type,
      */
     qdev_prop_set_uint32(gicdev, "num-irq", NUM_IRQS + 32);
     if (!kvm_irqchip_in_kernel()) {
-        qdev_prop_set_bit(gicdev, "has-security-extensions", secure);
+        qdev_prop_set_bit(gicdev, "has-security-extensions", vms->secure);
     }
     qdev_init_nofail(gicdev);
     gicbusdev = SYS_BUS_DEVICE(gicdev);
@@ -643,7 +643,7 @@ static void create_gic(VirtMachineState *vms, qemu_irq *pic, int type,
 
     fdt_add_gic_node(vms, type);
 
-    if (type == 3 && !no_its) {
+    if (type == 3 && !vmc->no_its) {
         create_its(vms, gicdev);
     } else if (type == 2) {
         create_v2m(vms, pic);
@@ -1005,8 +1005,7 @@ static void create_pcie_irq_map(const VirtMachineState *vms,
                            0x7           /* PCI irq */);
 }
 
-static void create_pcie(const VirtMachineState *vms, qemu_irq *pic,
-                        bool use_highmem)
+static void create_pcie(const VirtMachineState *vms, qemu_irq *pic)
 {
     hwaddr base_mmio = vms->memmap[VIRT_PCIE_MMIO].base;
     hwaddr size_mmio = vms->memmap[VIRT_PCIE_MMIO].size;
@@ -1049,7 +1048,7 @@ static void create_pcie(const VirtMachineState *vms, qemu_irq *pic,
                              mmio_reg, base_mmio, size_mmio);
     memory_region_add_subregion(get_system_memory(), base_mmio, mmio_alias);
 
-    if (use_highmem) {
+    if (vms->highmem) {
         /* Map high MMIO space */
         MemoryRegion *high_mmio_alias = g_new0(MemoryRegion, 1);
 
@@ -1098,7 +1097,7 @@ static void create_pcie(const VirtMachineState *vms, qemu_irq *pic,
     qemu_fdt_setprop_sized_cells(vms->fdt, nodename, "reg",
                                  2, base_ecam, 2, size_ecam);
 
-    if (use_highmem) {
+    if (vms->highmem) {
         qemu_fdt_setprop_sized_cells(vms->fdt, nodename, "ranges",
                                      1, FDT_PCI_RANGE_IOPORT, 2, 0,
                                      2, base_pio, 2, size_pio,
@@ -1428,7 +1427,7 @@ static void machvirt_init(MachineState *machine)
 
     create_flash(vms, sysmem, secure_sysmem ? secure_sysmem : sysmem);
 
-    create_gic(vms, pic, gic_version, vms->secure, vmc->no_its);
+    create_gic(vms, pic, gic_version);
 
     fdt_add_pmu_nodes(vms, gic_version);
 
@@ -1441,7 +1440,7 @@ static void machvirt_init(MachineState *machine)
 
     create_rtc(vms, pic);
 
-    create_pcie(vms, pic, vms->highmem);
+    create_pcie(vms, pic);
 
     create_gpio(vms, pic);
 
-- 
2.9.3

