Received: by 10.25.85.209 with SMTP id j200csp101252lfb;
        Fri, 10 Jun 2016 10:42:10 -0700 (PDT)
X-Received: by 10.140.98.172 with SMTP id o41mr3054382qge.8.1465580529952;
        Fri, 10 Jun 2016 10:42:09 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f128si6868782qkj.174.2016.06.10.10.42.09
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 10 Jun 2016 10:42:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:43624 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bBQRd-0007UC-9r
	for alex.bennee@linaro.org; Fri, 10 Jun 2016 13:42:09 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56050)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1bBQQk-0006k9-8N
	for qemu-arm@nongnu.org; Fri, 10 Jun 2016 13:41:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1bBQQc-0000U1-IW
	for qemu-arm@nongnu.org; Fri, 10 Jun 2016 13:41:12 -0400
Received: from mx1.redhat.com ([209.132.183.28]:58426)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>)
	id 1bBQQc-0000Tp-AG; Fri, 10 Jun 2016 13:41:06 -0400
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D301A61A0B;
	Fri, 10 Jun 2016 17:41:05 +0000 (UTC)
Received: from hawk.localdomain.com (dhcp-1-122.brq.redhat.com [10.34.1.122])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with
	ESMTP id u5AHeVPe032552; Fri, 10 Jun 2016 13:41:03 -0400
From: Andrew Jones <drjones@redhat.com>
To: qemu-devel@nongnu.org, qemu-ppc@nongnu.org, qemu-arm@nongnu.org
Date: Fri, 10 Jun 2016 19:40:24 +0200
Message-Id: <1465580427-13596-14-git-send-email-drjones@redhat.com>
In-Reply-To: <1465580427-13596-1-git-send-email-drjones@redhat.com>
References: <1465580427-13596-1-git-send-email-drjones@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Fri, 10 Jun 2016 17:41:05 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH RFC 13/16] hw/arm/virt: don't use smp_cpus,
 max_cpus
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
Cc: peter.maydell@linaro.org, ehabkost@redhat.com, agraf@suse.de,
	pbonzini@redhat.com, dgibson@redhat.com, imammedo@redhat.com,
	david@gibson.dropbear.id.au
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: jZYjbxM4d8zk

Use MachineState.cpus or own copy from VirtBoardInfo.cpus instead.

(Congratulations mach-virt, you're the first machine type to be
 cpu topology globals free!)

Signed-off-by: Andrew Jones <drjones@redhat.com>
---
 hw/arm/virt.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 78d9aa996bafc..134b6e36623ba 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -467,7 +467,7 @@ static void create_gic(VirtBoardInfo *vbi, qemu_irq *pic, int type, bool secure)
 
     gicdev = qdev_create(NULL, gictype);
     qdev_prop_set_uint32(gicdev, "revision", type);
-    qdev_prop_set_uint32(gicdev, "num-cpu", smp_cpus);
+    qdev_prop_set_uint32(gicdev, "num-cpu", vbi->cpus);
     /* Note that the num-irq property counts both internal and external
      * interrupts; there are always 32 of the former (mandated by GIC spec).
      */
@@ -488,7 +488,7 @@ static void create_gic(VirtBoardInfo *vbi, qemu_irq *pic, int type, bool secure)
      * appropriate GIC PPI inputs, and the GIC's IRQ output to
      * the CPU's IRQ input.
      */
-    for (i = 0; i < smp_cpus; i++) {
+    for (i = 0; i < vbi->cpus; i++) {
         DeviceState *cpudev = DEVICE(qemu_get_cpu(i));
         int ppibase = NUM_IRQS + i * GIC_INTERNAL + GIC_NR_SGIS;
         int irq;
@@ -509,7 +509,7 @@ static void create_gic(VirtBoardInfo *vbi, qemu_irq *pic, int type, bool secure)
         }
 
         sysbus_connect_irq(gicbusdev, i, qdev_get_gpio_in(cpudev, ARM_CPU_IRQ));
-        sysbus_connect_irq(gicbusdev, i + smp_cpus,
+        sysbus_connect_irq(gicbusdev, i + vbi->cpus,
                            qdev_get_gpio_in(cpudev, ARM_CPU_FIQ));
     }
 
@@ -1163,14 +1163,14 @@ static void machvirt_init(MachineState *machine)
         virt_max_cpus = GIC_NCPU;
     }
 
-    if (max_cpus > virt_max_cpus) {
+    if (machine->maxcpus > virt_max_cpus) {
         error_report("Number of SMP CPUs requested (%d) exceeds max CPUs "
                      "supported by machine 'mach-virt' (%d)",
-                     max_cpus, virt_max_cpus);
+                     machine->maxcpus, virt_max_cpus);
         exit(1);
     }
 
-    vbi->cpus = smp_cpus;
+    vbi->cpus = machine->cpus;
 
     if (machine->ram_size > vbi->memmap[VIRT_MEM].size) {
         error_report("mach-virt: cannot model more than %dGB RAM", RAMLIMIT_GB);
@@ -1196,7 +1196,7 @@ static void machvirt_init(MachineState *machine)
 
     create_fdt(vbi);
 
-    for (n = 0; n < smp_cpus; n++) {
+    for (n = 0; n < vbi->cpus; n++) {
         ObjectClass *oc = cpu_class_by_name(TYPE_ARM_CPU, cpustr[0]);
         CPUClass *cc = CPU_CLASS(oc);
         Object *cpuobj;
@@ -1281,7 +1281,7 @@ static void machvirt_init(MachineState *machine)
     create_fw_cfg(vbi, &address_space_memory);
     rom_set_fw(fw_cfg_find());
 
-    guest_info->cpus = smp_cpus;
+    guest_info->cpus = vbi->cpus;
     guest_info->fw_cfg = fw_cfg_find();
     guest_info->memmap = vbi->memmap;
     guest_info->irqmap = vbi->irqmap;
@@ -1294,7 +1294,7 @@ static void machvirt_init(MachineState *machine)
     vbi->bootinfo.kernel_filename = machine->kernel_filename;
     vbi->bootinfo.kernel_cmdline = machine->kernel_cmdline;
     vbi->bootinfo.initrd_filename = machine->initrd_filename;
-    vbi->bootinfo.nb_cpus = smp_cpus;
+    vbi->bootinfo.nb_cpus = vbi->cpus;
     vbi->bootinfo.board_id = -1;
     vbi->bootinfo.loader_start = vbi->memmap[VIRT_MEM].base;
     vbi->bootinfo.get_dtb = machvirt_dtb;
-- 
2.4.11

