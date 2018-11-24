Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp3063227wrt;
        Sat, 24 Nov 2018 00:40:32 -0800 (PST)
X-Google-Smtp-Source: AFSGD/VLecD333e2rzxRE5Rkg7jF+VN6ZC9p4O9vTzjJeWbsNGW4fknRdcgLHLRa00NCleTaqKCW
X-Received: by 2002:a81:210b:: with SMTP id h11mr9513047ywh.299.1543048832779;
        Sat, 24 Nov 2018 00:40:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1543048832; cv=none;
        d=google.com; s=arc-20160816;
        b=sh05flBhVdj6klNZpzjdtaA9uj7n81SlgbhS2/4ViigCcKc8rn1+URbGWVv28XbC6B
         ekUYuSK84k7/YRiWX23CIJxfj/COTJxPXJUuCfp3R8W0HyQ1Fgo9WwMlt+iRiBQh1i0z
         UKp9cTMVCkql/qXK5MjX70MzMiJzPwu4L+8c2WA9EU6zDE8I559v5RfNpJiLEh6Ib+Fs
         mMRDrqBvrVu9J8CfIMBufvPpnCNA/j1XKYlehr8RPUz5uwTWnqMzpgVSDjnh2LFRqXBU
         WkqMRvcoMlZ0bw0N0oOaFXOH9aW+BD4Gv8P3VSqf1VCmQ/ecViivXHw67SH2N2hZaZSZ
         k57g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from;
        bh=setk2ca8SkGVzbEqs1PnOZ0st8bXyEKui0VSDNsPTs0=;
        b=TxtxEPHKZ9LYvztmltERFrb/yiTXB2IXcp2edetXagzYHGdlF79EpA5b9Fz9h6qnb9
         FwuEoDuZaOiQVmKDA+N7yHcf1lOOxkwKt7WUcCVXg4KMCzyolbJRbfS2rGgzmdYjj9Og
         3UGuAsQDLm/kbuDlhQayplUoJ5CNpVeQIcs7CxOUQPdP8sDb5bYn17a9tp9N0+LjgG61
         Id0Vikr+m4lioj9kVPuS13fsF9gXGRg0gowfGNbFwcq4DdmZrBbvR0OKiqt1kareX2pL
         oXygCR6qPq6XBZmiKPNDounpfFp5bohQNYWFBso6BbjZGS0RrPOJduX6MH8ycRCVfiOL
         bJFg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u64-v6si15295789ybb.380.2018.11.24.00.40.32
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 24 Nov 2018 00:40:32 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:55706 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gQTUO-0002jK-6Y
	for alex.bennee@linaro.org; Sat, 24 Nov 2018 03:40:32 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52520)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peng.hao2@zte.com.cn>) id 1gQTU8-0002ZA-BB
	for qemu-arm@nongnu.org; Sat, 24 Nov 2018 03:40:17 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peng.hao2@zte.com.cn>) id 1gQTSe-0000Qn-O8
	for qemu-arm@nongnu.org; Sat, 24 Nov 2018 03:38:45 -0500
Received: from out1.zte.com.cn ([202.103.147.172]:55560 helo=mxct.zte.com.cn)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <peng.hao2@zte.com.cn>)
	id 1gQTSe-0000ME-CE; Sat, 24 Nov 2018 03:38:44 -0500
Received: from mse01.zte.com.cn (unknown [10.30.3.20])
	by Forcepoint Email with ESMTPS id 498B6B22E639AEC5498E;
	Sat, 24 Nov 2018 16:38:42 +0800 (CST)
Received: from notes_smtp.zte.com.cn ([10.30.1.239])
	by mse01.zte.com.cn with ESMTP id wAO8cWE7035066;
	Sat, 24 Nov 2018 16:38:32 +0800 (GMT-8)
	(envelope-from peng.hao2@zte.com.cn)
Received: from localhost.localdomain.localdomain ([10.74.120.59])
	by szsmtp06.zte.com.cn (Lotus Domino Release 8.5.3FP6)
	with ESMTP id 2018112416391831-12702431 ;
	Sat, 24 Nov 2018 16:39:18 +0800 
From: Peng Hao <peng.hao2@zte.com.cn>
To: peter.maydell@linaro.org, drjones@redhat.com, philmd@redhat.com
Date: Sun, 25 Nov 2018 01:00:20 +0800
Message-Id: <1543078821-16636-10-git-send-email-peng.hao2@zte.com.cn>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1543078821-16636-1-git-send-email-peng.hao2@zte.com.cn>
References: <1543078821-16636-1-git-send-email-peng.hao2@zte.com.cn>
X-MIMETrack: Itemize by SMTP Server on SZSMTP06/server/zte_ltd(Release
	8.5.3FP6|November 21, 2013) at 2018-11-24 16:39:18,
	Serialize by Router on notes_smtp/zte_ltd(Release 9.0.1FP7|August  17,
	2016) at 2018-11-24 16:38:12,
	Serialize complete at 2018-11-24 16:38:12
X-MAIL: mse01.zte.com.cn wAO8cWE7035066
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 202.103.147.172
Subject: [Qemu-arm] [PATCH V8 9/10] hw/misc/pvpanic: realize the configure
 interface
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
Cc: Peng Hao <peng.hao2@zte.com.cn>, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: nVslD/pzUqfr

Add configure interface for pvpanic-mmio. In qemu command line
use -device pvpanic-mmio to enable the device.

Signed-off-by: Peng Hao <peng.hao2@zte.com.cn>
---
 hw/arm/virt-acpi-build.c | 5 ++++-
 hw/arm/virt.c            | 7 +++----
 hw/misc/pvpanic.c        | 1 +
 3 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index 4208e46..cbc415e 100644
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
index 921220a..aeedc43 100644
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
index 6fea162..ce6f5cb 100644
--- a/hw/misc/pvpanic.c
+++ b/hw/misc/pvpanic.c
@@ -119,6 +119,7 @@ static void pvpanic_mmio_initfn(Object *obj)
     memory_region_init_io(&s->mr, OBJECT(s), &pvpanic_ops, s,
                           TYPE_PVPANIC_MMIO, 2);
     sysbus_init_mmio(sbd, &s->mr);
+    sysbus_mmio_map(sbd, 0, s->base);
 }
 
 static Property pvpanic_mmio_properties[] = {
-- 
1.8.3.1

