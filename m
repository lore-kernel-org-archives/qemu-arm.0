Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp553224wrt;
        Tue, 27 Nov 2018 19:57:51 -0800 (PST)
X-Google-Smtp-Source: AFSGD/XX927dQtkk+KKm3bs2XsEGIC0JieeBHovs17tJfKmNVSYgmv+7jKfUwHlVFWkzsonbxm+C
X-Received: by 2002:a25:aa4c:: with SMTP id s70-v6mr35131818ybi.364.1543377471597;
        Tue, 27 Nov 2018 19:57:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1543377471; cv=none;
        d=google.com; s=arc-20160816;
        b=v8khYjTULO1FmJGhtsLtBkBN2lk59qfMy0uVBdVGRC5dLUnFyQF7oZMp058kW4yjlu
         EJD4gI6nKVZkXrHVg/YJECVF5FepQsSgL39dPkppVNhu7n0qX0SgPm3yFXPHv9+wBl2E
         XNWSF3WChqXm9ekw4goY03rloQWBLsXOj0HFT5fU7itlaYhp0xb4a0D4Ma1L2ZjmqUCt
         Z4DoaaGsRqKEBtk3U5AG92uraA+el4hmV8E5OeWP1OWKR0w3o/gh8zgcC4eA7jDpzBES
         ffq6M7VzVT2ris+8s7Szh+FVLFpfzYUza1NHoFEJJTQXvy768GUwk6VFdGNJlKu/Q9yP
         amhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from;
        bh=VqUAePmJhvB1cUXsKcrL2AuKb+6GYGYAMtxP2dRgMiQ=;
        b=Vn6pQmWjbc41LLDNh4KsN6Br13M/VJMnG1eD8YHp9tVA0oJl3SmmeoMHLE6nQZASlo
         ccGXfMzl/u6gmCbLO5PXEKdt8r9TA6yJNb1JGI/lmgSVffE79yHMwG/XWPbGrfzn9Drp
         m5YdFEdiwJ3kcHmrB6yCYe77hqZ4n5dWMAnGoSFtkN8ku9hGpjYmV5muEwhcLqkSF0NB
         LFVXFWJZrx2FEiLgNpd0T5Saq0oeOAY48c1rGa6nyt83NLluGOmxL3wd7xxFaFOXSK+k
         P/bUlQH8H2QFK9452GT167xLPPnEJkPz8xnSCdOhENFxuvUlYBf61JpxY2kcSn54razv
         9sXQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u4si4063628ywf.353.2018.11.27.19.57.51
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 27 Nov 2018 19:57:51 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:45780 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gRqz1-0000ge-2j
	for alex.bennee@linaro.org; Tue, 27 Nov 2018 22:57:51 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51669)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peng.hao2@zte.com.cn>) id 1gRqs8-00034X-N5
	for qemu-devel@nongnu.org; Tue, 27 Nov 2018 22:50:45 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peng.hao2@zte.com.cn>) id 1gRqs7-00046m-UJ
	for qemu-devel@nongnu.org; Tue, 27 Nov 2018 22:50:44 -0500
Received: from mxhk.zte.com.cn ([63.217.80.70]:16334)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <peng.hao2@zte.com.cn>)
	id 1gRqs1-0003rA-Rv; Tue, 27 Nov 2018 22:50:38 -0500
Received: from mse01.zte.com.cn (unknown [10.30.3.20])
	by Forcepoint Email with ESMTPS id AD7EE8111A37DD3581C8;
	Wed, 28 Nov 2018 11:50:35 +0800 (CST)
Received: from notes_smtp.zte.com.cn ([10.30.1.239])
	by mse01.zte.com.cn with ESMTP id wAS3nvq6058764;
	Wed, 28 Nov 2018 11:49:57 +0800 (GMT-8)
	(envelope-from peng.hao2@zte.com.cn)
Received: from localhost.localdomain.localdomain ([10.74.120.59])
	by szsmtp06.zte.com.cn (Lotus Domino Release 8.5.3FP6)
	with ESMTP id 2018112811501740-13417761 ;
	Wed, 28 Nov 2018 11:50:17 +0800 
From: Peng Hao <peng.hao2@zte.com.cn>
To: peter.maydell@linaro.org, drjones@redhat.com, philmd@redhat.com
Date: Wed, 28 Nov 2018 20:12:51 +0800
Message-Id: <1543407172-16175-9-git-send-email-peng.hao2@zte.com.cn>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1543407172-16175-1-git-send-email-peng.hao2@zte.com.cn>
References: <1543407172-16175-1-git-send-email-peng.hao2@zte.com.cn>
X-MIMETrack: Itemize by SMTP Server on SZSMTP06/server/zte_ltd(Release
	8.5.3FP6|November 21, 2013) at 2018-11-28 11:50:17,
	Serialize by Router on notes_smtp/zte_ltd(Release 9.0.1FP7|August  17,
	2016) at 2018-11-28 11:49:49,
	Serialize complete at 2018-11-28 11:49:49
X-MAIL: mse01.zte.com.cn wAS3nvq6058764
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 63.217.80.70
Subject: [Qemu-devel] [PATCH V10 8/9] hw/misc/pvpanic: realize the configure
 interface
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peng Hao <peng.hao2@zte.com.cn>, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: VS4cx5bPtbnk

Add configure interface for pvpanic-mmio. In qemu command line
use -device pvpanic-mmio to enable the device.

Signed-off-by: Peng Hao <peng.hao2@zte.com.cn>
---
 hw/arm/virt-acpi-build.c | 5 ++++-
 hw/arm/virt.c            | 7 +++----
 hw/misc/pvpanic.c        | 1 +
 3 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index 2adba60..d29d229 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -45,6 +45,7 @@
 #include "hw/arm/virt.h"
 #include "sysemu/numa.h"
 #include "kvm_arm.h"
+#include "hw/misc/pvpanic.h"
 
 #define ARM_SPI_BASE 32
 #define ACPI_POWER_BUTTON_DEVICE "PWRB"
@@ -785,7 +786,9 @@ build_dsdt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
     acpi_dsdt_add_uart(scope, &memmap[VIRT_UART],
                        (irqmap[VIRT_UART] + ARM_SPI_BASE));
     acpi_dsdt_add_flash(scope, &memmap[VIRT_FLASH]);
-    acpi_dsdt_add_pvpanic(scope, &memmap[VIRT_PVPANIC]);
+    if (pvpanic_mmio()) {
+        acpi_dsdt_add_pvpanic(scope, &memmap[VIRT_PVPANIC]);
+    }
     acpi_dsdt_add_fw_cfg(scope, &memmap[VIRT_FW_CFG]);
     acpi_dsdt_add_virtio(scope, &memmap[VIRT_MMIO],
                     (irqmap[VIRT_MMIO] + ARM_SPI_BASE), NUM_VIRTIO_TRANSPORTS);
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 1fd5941..9cddf36 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -198,8 +198,6 @@ static void create_pvpanic_device(const VirtMachineState *vms)
      hwaddr base = vms->memmap[VIRT_PVPANIC].base;
      hwaddr size = vms->memmap[VIRT_PVPANIC].size;
 
-     sysbus_create_simple(TYPE_PVPANIC_MMIO, base, NULL);
-
      nodename = g_strdup_printf("/pvpanic-mmio@%" PRIx64, base);
      qemu_fdt_add_subnode(vms->fdt, nodename);
      qemu_fdt_setprop_string(vms->fdt, nodename,
@@ -1330,6 +1328,9 @@ void virt_machine_done(Notifier *notifier, void *data)
     struct arm_boot_info *info = &vms->bootinfo;
     AddressSpace *as = arm_boot_address_space(cpu, info);
 
+    if (pvpanic_mmio()) {
+        create_pvpanic_device(vms);
+    }
     /*
      * If the user provided a dtb, we assume the dynamic sysbus nodes
      * already are integrated there. This corresponds to a use case where
@@ -1551,8 +1552,6 @@ static void machvirt_init(MachineState *machine)
 
     create_flash(vms, sysmem, secure_sysmem ? secure_sysmem : sysmem);
 
-    create_pvpanic_device(vms);
-
     create_gic(vms, pic);
 
     fdt_add_pmu_nodes(vms);
diff --git a/hw/misc/pvpanic.c b/hw/misc/pvpanic.c
index b6b5c89..6c4a79f 100644
--- a/hw/misc/pvpanic.c
+++ b/hw/misc/pvpanic.c
@@ -149,6 +149,7 @@ static void pvpanic_mmio_initfn(Object *obj)
     memory_region_init_io(&s->mr, OBJECT(s), &pvpanic_ops, s,
                           TYPE_PVPANIC_MMIO, 2);
     sysbus_init_mmio(sbd, &s->mr);
+    sysbus_mmio_map(sbd, 0, s->base);
 }
 
 static Property pvpanic_mmio_properties[] = {
-- 
1.8.3.1

