Received: by 10.25.77.65 with SMTP id a62csp253746lfb;
        Thu, 26 Jan 2017 07:10:10 -0800 (PST)
X-Received: by 10.237.63.122 with SMTP id q55mr2994250qtf.201.1485443410682;
        Thu, 26 Jan 2017 07:10:10 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 55si1314988qts.215.2017.01.26.07.10.10
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 26 Jan 2017 07:10:10 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:39191 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cWlgd-0006Zl-SQ
	for alex.bennee@linaro.org; Thu, 26 Jan 2017 10:10:07 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58468)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1cWlgQ-0006WJ-IX
	for qemu-arm@nongnu.org; Thu, 26 Jan 2017 10:09:58 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1cWlgN-0004o4-Br
	for qemu-arm@nongnu.org; Thu, 26 Jan 2017 10:09:54 -0500
Received: from mx1.redhat.com ([209.132.183.28]:42838)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <armbru@redhat.com>)
	id 1cWlgN-0004nQ-3q; Thu, 26 Jan 2017 10:09:51 -0500
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1E8A24AEA1;
	Thu, 26 Jan 2017 15:09:51 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-50.ams2.redhat.com
	[10.36.116.50])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id v0QF9niT021550
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Thu, 26 Jan 2017 10:09:50 -0500
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 13FF91138647; Thu, 26 Jan 2017 16:09:48 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Date: Thu, 26 Jan 2017 16:09:42 +0100
Message-Id: <1485443388-27253-3-git-send-email-armbru@redhat.com>
In-Reply-To: <1485443388-27253-1-git-send-email-armbru@redhat.com>
References: <1485443388-27253-1-git-send-email-armbru@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Thu, 26 Jan 2017 15:09:51 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v2 2/8] hw/arm/cubieboard hw/arm/xlnx-ep108: Fix
 units_per_default_bus
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
Cc: kwolf@redhat.com, Peter Maydell <peter.maydell@linaro.org>,
	qemu-block@nongnu.org, Alistair Francis <alistair.francis@xilinx.com>,
	Beniamino Galvani <b.galvani@gmail.com>, qemu-arm@nongnu.org,
	mreitz@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: efILFecFXP2w

Machine types cubieboard, xlnx-ep108, xlnx-zcu102 have an onboard AHCI
controller, but neglect to set their MachineClass member
units_per_default_bus = 1.  This permits -drive if=ide,unit=1, which
makes no sense for AHCI.  It also screws up index=N for odd N, because
it gets desugared to unit=1,bus=N/2

Doesn't really matter, because these machine types fail to honor
-drive if=ide.  Add the missing units_per_default_bus = 1 anyway,
along with a TODO comment on what needs to be done for -drive if=ide.

Also set block_default_type = IF_IDE explicitly.  It's currently the
default, but the next commit will change it to something more
sensible, and we want to keep the IF_IDE default for these three
machines.  See also the previous commit.

Cc: Beniamino Galvani <b.galvani@gmail.com>
Cc: Alistair Francis <alistair.francis@xilinx.com>
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org
Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 hw/arm/cubieboard.c | 4 ++++
 hw/arm/xlnx-ep108.c | 6 ++++++
 2 files changed, 10 insertions(+)

diff --git a/hw/arm/cubieboard.c b/hw/arm/cubieboard.c
index dd19ba3..b98e1c4 100644
--- a/hw/arm/cubieboard.c
+++ b/hw/arm/cubieboard.c
@@ -71,6 +71,8 @@ static void cubieboard_init(MachineState *machine)
     memory_region_add_subregion(get_system_memory(), AW_A10_SDRAM_BASE,
                                 &s->sdram);
 
+    /* TODO create and connect IDE devices for ide_drive_get() */
+
     cubieboard_binfo.ram_size = machine->ram_size;
     cubieboard_binfo.kernel_filename = machine->kernel_filename;
     cubieboard_binfo.kernel_cmdline = machine->kernel_cmdline;
@@ -82,6 +84,8 @@ static void cubieboard_machine_init(MachineClass *mc)
 {
     mc->desc = "cubietech cubieboard";
     mc->init = cubieboard_init;
+    mc->block_default_type = IF_IDE;
+    mc->units_per_default_bus = 1;
 }
 
 DEFINE_MACHINE("cubieboard", cubieboard_machine_init)
diff --git a/hw/arm/xlnx-ep108.c b/hw/arm/xlnx-ep108.c
index 4ec590a..860780a 100644
--- a/hw/arm/xlnx-ep108.c
+++ b/hw/arm/xlnx-ep108.c
@@ -106,6 +106,8 @@ static void xlnx_ep108_init(MachineState *machine)
         sysbus_connect_irq(SYS_BUS_DEVICE(&s->soc.spi[i]), 1, cs_line);
     }
 
+    /* TODO create and connect IDE devices for ide_drive_get() */
+
     xlnx_ep108_binfo.ram_size = ram_size;
     xlnx_ep108_binfo.kernel_filename = machine->kernel_filename;
     xlnx_ep108_binfo.kernel_cmdline = machine->kernel_cmdline;
@@ -118,6 +120,8 @@ static void xlnx_ep108_machine_init(MachineClass *mc)
 {
     mc->desc = "Xilinx ZynqMP EP108 board";
     mc->init = xlnx_ep108_init;
+    mc->block_default_type = IF_IDE;
+    mc->units_per_default_bus = 1;
 }
 
 DEFINE_MACHINE("xlnx-ep108", xlnx_ep108_machine_init)
@@ -126,6 +130,8 @@ static void xlnx_zcu102_machine_init(MachineClass *mc)
 {
     mc->desc = "Xilinx ZynqMP ZCU102 board";
     mc->init = xlnx_ep108_init;
+    mc->block_default_type = IF_IDE;
+    mc->units_per_default_bus = 1;
 }
 
 DEFINE_MACHINE("xlnx-zcu102", xlnx_zcu102_machine_init)
-- 
2.7.4

