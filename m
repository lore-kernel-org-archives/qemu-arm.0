Received: by 10.25.159.19 with SMTP id i19csp1269678lfe;
        Wed, 3 Feb 2016 07:00:10 -0800 (PST)
X-Received: by 10.140.44.38 with SMTP id f35mr2106831qga.49.1454511609957;
        Wed, 03 Feb 2016 07:00:09 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q205si5814808qhq.67.2016.02.03.07.00.09
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 03 Feb 2016 07:00:09 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:35473 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aQyuf-0007KB-Fv
	for alex.bennee@linaro.org; Wed, 03 Feb 2016 10:00:09 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46681)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1aQyuc-0007Io-S6
	for qemu-arm@nongnu.org; Wed, 03 Feb 2016 10:00:07 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1aQyuX-0006GM-SZ
	for qemu-arm@nongnu.org; Wed, 03 Feb 2016 10:00:06 -0500
Received: from mx1.redhat.com ([209.132.183.28]:47603)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>)
	id 1aQyuX-0006GD-NU; Wed, 03 Feb 2016 10:00:01 -0500
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	by mx1.redhat.com (Postfix) with ESMTPS id 149C391D08;
	Wed,  3 Feb 2016 15:00:01 +0000 (UTC)
Received: from hawk.localdomain.com (dhcp-1-158.brq.redhat.com [10.34.1.158])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with
	ESMTP id u13ExwfZ022876; Wed, 3 Feb 2016 09:59:59 -0500
From: Andrew Jones <drjones@redhat.com>
To: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Date: Wed,  3 Feb 2016 15:59:38 +0100
Message-Id: <1454511578-24863-1-git-send-email-drjones@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: peter.maydell@linaro.org, shannon.zhao@linaro.org
Subject: [Qemu-arm] [PATCH] hw/arm/virt: fix max-cpus check
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: Dk+W7XJxn2HV

mach-virt doesn't yet support hotplug, but command lines specifying
-smp <num>,maxcpus=<bigger-num> don't fail. Of course specifying
bigger-num as something bigger than the machine supports, e.g. > 8
on a gicv2 machine, should fail though. This fix also makes mach-
virt's max-cpus check truly consistent with the one in vl.c:main,
as the one there was already correctly checking max-cpus instead
of smp-cpus.

Reported-by: Shannon Zhao <shannon.zhao@linaro.org>
Signed-off-by: Andrew Jones <drjones@redhat.com>
---
 hw/arm/virt.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 15658f49c4e06..44bbbea92b1cf 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1013,7 +1013,7 @@ static void machvirt_init(MachineState *machine)
     MemoryRegion *sysmem = get_system_memory();
     MemoryRegion *secure_sysmem = NULL;
     int gic_version = vms->gic_version;
-    int n, max_cpus;
+    int n, virt_max_cpus;
     MemoryRegion *ram = g_new(MemoryRegion, 1);
     const char *cpu_model = machine->cpu_model;
     VirtBoardInfo *vbi;
@@ -1051,15 +1051,15 @@ static void machvirt_init(MachineState *machine)
      * many redistributors we can fit into the memory map.
      */
     if (gic_version == 3) {
-        max_cpus = vbi->memmap[VIRT_GIC_REDIST].size / 0x20000;
+        virt_max_cpus = vbi->memmap[VIRT_GIC_REDIST].size / 0x20000;
     } else {
-        max_cpus = GIC_NCPU;
+        virt_max_cpus = GIC_NCPU;
     }
 
-    if (smp_cpus > max_cpus) {
+    if (max_cpus > virt_max_cpus) {
         error_report("Number of SMP CPUs requested (%d) exceeds max CPUs "
                      "supported by machine 'mach-virt' (%d)",
-                     smp_cpus, max_cpus);
+                     max_cpus, virt_max_cpus);
         exit(1);
     }
 
-- 
2.4.3

