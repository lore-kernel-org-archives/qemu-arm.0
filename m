Received: by 10.25.205.13 with SMTP id d13csp2425878lfg;
        Tue, 13 Dec 2016 13:45:49 -0800 (PST)
X-Received: by 10.237.62.38 with SMTP id l35mr85186381qtf.175.1481665549552;
        Tue, 13 Dec 2016 13:45:49 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id 11si28599655qtx.268.2016.12.13.13.45.48
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 13 Dec 2016 13:45:49 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:44251 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cGutO-0002UX-EF
	for alex.bennee@linaro.org; Tue, 13 Dec 2016 16:45:46 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53758)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1cGutG-0002SE-Oy
	for qemu-arm@nongnu.org; Tue, 13 Dec 2016 16:45:39 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1cGutC-0007Un-A3
	for qemu-arm@nongnu.org; Tue, 13 Dec 2016 16:45:38 -0500
Received: from mx1.redhat.com ([209.132.183.28]:46094)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <drjones@redhat.com>)
	id 1cGutC-0007UK-1y; Tue, 13 Dec 2016 16:45:34 -0500
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2D1E9C04B325;
	Tue, 13 Dec 2016 21:45:33 +0000 (UTC)
Received: from kamzik.brq.redhat.com (kamzik.brq.redhat.com [10.34.1.143])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id uBDLjOQP014685; Tue, 13 Dec 2016 16:45:31 -0500
From: Andrew Jones <drjones@redhat.com>
To: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Date: Tue, 13 Dec 2016 22:45:14 +0100
Message-Id: <20161213214522.25548-4-drjones@redhat.com>
In-Reply-To: <20161213214522.25548-1-drjones@redhat.com>
References: <20161213214522.25548-1-drjones@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Tue, 13 Dec 2016 21:45:33 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH 03/11] hw/arm/virt: use VirtMachineState.smp_cpus
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
Cc: peter.maydell@linaro.org, imammedo@redhat.com, mst@redhat.com,
	ehabkost@redhat.com, zhaoshenglong@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: LkJMzjE7ymHI

Most places we need smp_cpus we use vms->smp_cpus already. This
cleanup makes sure we do everywhere, preparing for the removal
of the global smp_cpus someday.

Signed-off-by: Andrew Jones <drjones@redhat.com>
---
 hw/arm/virt.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 67c0abb30b5b..18aa3672739d 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -583,7 +583,7 @@ static void create_gic(VirtMachineState *vms, qemu_irq *pic)
 
     gicdev = qdev_create(NULL, gictype);
     qdev_prop_set_uint32(gicdev, "revision", type);
-    qdev_prop_set_uint32(gicdev, "num-cpu", smp_cpus);
+    qdev_prop_set_uint32(gicdev, "num-cpu", vms->smp_cpus);
     /* Note that the num-irq property counts both internal and external
      * interrupts; there are always 32 of the former (mandated by GIC spec).
      */
@@ -604,7 +604,7 @@ static void create_gic(VirtMachineState *vms, qemu_irq *pic)
      * maintenance interrupt signal to the appropriate GIC PPI inputs,
      * and the GIC's IRQ/FIQ/VIRQ/VFIQ interrupt outputs to the CPU's inputs.
      */
-    for (i = 0; i < smp_cpus; i++) {
+    for (i = 0; i < vms->smp_cpus; i++) {
         DeviceState *cpudev = DEVICE(qemu_get_cpu(i));
         int ppibase = NUM_IRQS + i * GIC_INTERNAL + GIC_NR_SGIS;
         int irq;
@@ -629,7 +629,7 @@ static void create_gic(VirtMachineState *vms, qemu_irq *pic)
                                                      + ARCH_GICV3_MAINT_IRQ));
 
         sysbus_connect_irq(gicbusdev, i, qdev_get_gpio_in(cpudev, ARM_CPU_IRQ));
-        sysbus_connect_irq(gicbusdev, i + smp_cpus,
+        sysbus_connect_irq(gicbusdev, i + vms->smp_cpus,
                            qdev_get_gpio_in(cpudev, ARM_CPU_FIQ));
         sysbus_connect_irq(gicbusdev, i + 2 * smp_cpus,
                            qdev_get_gpio_in(cpudev, ARM_CPU_VIRQ));
@@ -958,7 +958,7 @@ static void create_fw_cfg(const VirtMachineState *vms, AddressSpace *as)
     char *nodename;
 
     fw_cfg = fw_cfg_init_mem_wide(base + 8, base, 8, base + 16, as);
-    fw_cfg_add_i16(fw_cfg, FW_CFG_NB_CPUS, (uint16_t)smp_cpus);
+    fw_cfg_add_i16(fw_cfg, FW_CFG_NB_CPUS, (uint16_t)vms->smp_cpus);
 
     nodename = g_strdup_printf("/fw-cfg@%" PRIx64, base);
     qemu_fdt_add_subnode(vms->fdt, nodename);
@@ -1362,7 +1362,7 @@ static void machvirt_init(MachineState *machine)
         exit(1);
     }
 
-    for (n = 0; n < smp_cpus; n++) {
+    for (n = 0; n < vms->smp_cpus; n++) {
         Object *cpuobj = object_new(typename);
         if (!vmc->disallow_affinity_adjustment) {
             /* Adjust MPIDR like 64-bit KVM hosts, which incorporate the
@@ -1452,7 +1452,7 @@ static void machvirt_init(MachineState *machine)
     create_fw_cfg(vms, &address_space_memory);
     rom_set_fw(fw_cfg_find());
 
-    guest_info->smp_cpus = smp_cpus;
+    guest_info->smp_cpus = vms->smp_cpus;
     guest_info->fw_cfg = fw_cfg_find();
     guest_info->memmap = vms->memmap;
     guest_info->irqmap = vms->irqmap;
@@ -1466,7 +1466,7 @@ static void machvirt_init(MachineState *machine)
     vms->bootinfo.kernel_filename = machine->kernel_filename;
     vms->bootinfo.kernel_cmdline = machine->kernel_cmdline;
     vms->bootinfo.initrd_filename = machine->initrd_filename;
-    vms->bootinfo.nb_cpus = smp_cpus;
+    vms->bootinfo.nb_cpus = vms->smp_cpus;
     vms->bootinfo.board_id = -1;
     vms->bootinfo.loader_start = vms->memmap[VIRT_MEM].base;
     vms->bootinfo.get_dtb = machvirt_dtb;
-- 
2.9.3

