Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp3048117wrt;
        Sat, 24 Nov 2018 00:20:01 -0800 (PST)
X-Google-Smtp-Source: AFSGD/UMOLDHmJEIwpptjZg3PrQ7a5gTtsXx6UcT0AyK1pxwcPeVhm6IrFNhWsoYIs04UyZ4TK8I
X-Received: by 2002:a25:7507:: with SMTP id q7-v6mr20774905ybc.38.1543047601834;
        Sat, 24 Nov 2018 00:20:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1543047601; cv=none;
        d=google.com; s=arc-20160816;
        b=fEE+J8HMuQwFkvOVVlOqwDiTvFpU7Un2lEEUwcCThaBWFxxizFUGhWNeTekWiyEOlA
         DG+j5x5B9+VMv0fAiJoNP9CfR3ptqHMHiN+HOhpp8p91wMJK6HoAiKfDi+kwQFsMT0eo
         DKmu2KV0GeAmOZ72O76kkoZkVvtJzeTjBZuYq+grFp3ckloAzWqAh4dyTNnqWlfDeV5Z
         kMF2ulFohi+0u8CwSppgR10Y/01eXLO/dwXTi802dI6IWxasLSWK6I0cGWNORN0eJ+3V
         vjZaAdWVuA2YDpQeha99cHFEbNFGaxqT+O712WChPW2u509N1YuOijCzDtE6cXw1Kzqd
         ycxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from;
        bh=setk2ca8SkGVzbEqs1PnOZ0st8bXyEKui0VSDNsPTs0=;
        b=qWF0Ngt7YSmFyL7pINkXMeNrtJobYJuscuWwqhu4dxixiiSr4b2u2wgPQUUxL9AYKj
         /jFQKHfC5GQIOaL+E0KtHKY96SgaQQl77EpUQToOvR2AFCE++jCzhxH59DQYDEMU0uMX
         xlZzBlHico5FOVEK3jaZoVISnYwbR4U/bk2GpdRZNd6JVXytXXgdSxPijEC4ryU/gYdN
         lqItVjxkwPfI463HvpYU//ot4kYHZdyzS1xkD88aUR27HfnBnMHURjsIuNrrv52fxN3M
         FdHYY2zWeWd6r84UqPxK8oyysVhVnNeIj8Nk0SnDxhm50oG8n6zrXNB0CfZfs14pDEbH
         aBUA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l28si15481060ywk.429.2018.11.24.00.20.01
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 24 Nov 2018 00:20:01 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:55618 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gQTAX-0008JC-6B
	for alex.bennee@linaro.org; Sat, 24 Nov 2018 03:20:01 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47915)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peng.hao2@zte.com.cn>) id 1gQTAF-0008It-SC
	for qemu-arm@nongnu.org; Sat, 24 Nov 2018 03:19:46 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peng.hao2@zte.com.cn>) id 1gQT47-0005q2-4c
	for qemu-arm@nongnu.org; Sat, 24 Nov 2018 03:13:24 -0500
Received: from out1.zte.com.cn ([202.103.147.172]:40536 helo=mxct.zte.com.cn)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <peng.hao2@zte.com.cn>)
	id 1gQT46-0005kh-PL; Sat, 24 Nov 2018 03:13:23 -0500
Received: from mse01.zte.com.cn (unknown [10.30.3.20])
	by Forcepoint Email with ESMTPS id F1DE4D5EE170DA127BD0;
	Sat, 24 Nov 2018 16:13:07 +0800 (CST)
Received: from notes_smtp.zte.com.cn ([10.30.1.239])
	by mse01.zte.com.cn with ESMTP id wAO8D2ok023478;
	Sat, 24 Nov 2018 16:13:02 +0800 (GMT-8)
	(envelope-from peng.hao2@zte.com.cn)
Received: from localhost.localdomain.localdomain ([10.74.120.59])
	by szsmtp06.zte.com.cn (Lotus Domino Release 8.5.3FP6)
	with ESMTP id 2018112416134820-12697215 ;
	Sat, 24 Nov 2018 16:13:48 +0800 
From: Peng Hao <peng.hao2@zte.com.cn>
To: peter.maydell@linaro.org, drjones@redhat.com, philmd@redhat.com
Date: Sun, 25 Nov 2018 00:34:32 +0800
Message-Id: <1543077273-16201-9-git-send-email-peng.hao2@zte.com.cn>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1543077273-16201-1-git-send-email-peng.hao2@zte.com.cn>
References: <1543077273-16201-1-git-send-email-peng.hao2@zte.com.cn>
X-MIMETrack: Itemize by SMTP Server on SZSMTP06/server/zte_ltd(Release
	8.5.3FP6|November 21, 2013) at 2018-11-24 16:13:48,
	Serialize by Router on notes_smtp/zte_ltd(Release 9.0.1FP7|August  17,
	2016) at 2018-11-24 16:12:42,
	Serialize complete at 2018-11-24 16:12:43,
	Serialize by Router on notes_smtp/zte_ltd(Release 9.0.1FP7|August  17,
	2016) at 2018-11-24 16:12:43
X-MAIL: mse01.zte.com.cn wAO8D2ok023478
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 202.103.147.172
Subject: [Qemu-arm] [PATCH] hw/misc/pvpanic: realize the configure interface
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
X-TUID: MxD3wzFQ4y0I

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

