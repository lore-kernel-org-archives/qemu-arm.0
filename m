Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp5415284wrt;
        Mon, 26 Nov 2018 03:37:00 -0800 (PST)
X-Google-Smtp-Source: AFSGD/X0owZJsTcxsljSgoxp7FbqQ0V650mQywjXARb2hKS7+ljRXYEJ2AuOrnrdHvDbZeqdwPxC
X-Received: by 2002:a25:6ec1:: with SMTP id j184-v6mr18391481ybc.190.1543232220905;
        Mon, 26 Nov 2018 03:37:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1543232220; cv=none;
        d=google.com; s=arc-20160816;
        b=VO62y2kwELf4q94NxoAYO0yJSu9Ybg1teOrJgote8t3nevGASHLrD29DO1ODdpgluq
         LqdWSBsSK/TMCESZRUtBA4sgmiqn/xqVHi78Zw/NcxvpTCt/urGKG3hqPR1olJ464GdA
         2ZBC11xRQ656x8RCLLBMDoZ+flmHwp/DxEk+SX8m1Ift4xpw3uGq26/KV18l3ygsvGVy
         PCWoj/1NcP9C9xGq4pUNYbHPNfz+xQe1FnCe/FsF1waJeTya3Sbz3PA/XF36gFXdXBt2
         WfTw9/c8a3wQvGOFGkEGz7rp6eGSSuGVt/W+7ljsFECdQY/8OJWkazBi6fKYbCGlWN7A
         9kXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from;
        bh=Wq79JkNsK9BzSo3es+wXSrU8W8euvYGvlwvPQzQfWjw=;
        b=jgg7eJeaz2zwPQrLQ2w1aO1H7/oSt5yUgat1uaR5wUcoW7vkkH9UrQ7OvaDdtQ/vCv
         2uN02Hbvz1cXfcHrpqe7o6EDJQKt+Q5pxjzPRhCiYl+eNH3hh40MPXRCnmRzHTifJe5i
         6Tc5iyUplDyU7QGfabDME3d/uNPSQgbIkgATWsOCk5zjgP+HId4p6cKmH+30S7S3mu8u
         Um8PXiTaa3/G3TQXGJeFBz0QRm6jSbHBN/1wbNOnHBTEfldLSA178NpNWbPJq1kU/MCi
         yalNgFmWRUY6NPeUGxjGp9nydA4IbpZdKDN0ZPK7K2K0mXqiWPLStwulUJSF+km5mL/O
         Vhfw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q68-v6si23439ybq.351.2018.11.26.03.37.00
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 26 Nov 2018 03:37:00 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:35289 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gRFCG-00031M-BP
	for alex.bennee@linaro.org; Mon, 26 Nov 2018 06:37:00 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56855)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peng.hao2@zte.com.cn>) id 1gRF8f-0000Gs-LT
	for qemu-arm@nongnu.org; Mon, 26 Nov 2018 06:33:22 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peng.hao2@zte.com.cn>) id 1gRF8c-0001wN-GR
	for qemu-arm@nongnu.org; Mon, 26 Nov 2018 06:33:17 -0500
Received: from mxhk.zte.com.cn ([63.217.80.70]:51844)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <peng.hao2@zte.com.cn>)
	id 1gRF8c-0001sk-1Y; Mon, 26 Nov 2018 06:33:14 -0500
Received: from mse01.zte.com.cn (unknown [10.30.3.20])
	by Forcepoint Email with ESMTPS id BF8A77ACFB77BA1B9DC7;
	Mon, 26 Nov 2018 19:33:09 +0800 (CST)
Received: from notes_smtp.zte.com.cn ([10.30.1.239])
	by mse01.zte.com.cn with ESMTP id wAQBX23j031826;
	Mon, 26 Nov 2018 19:33:02 +0800 (GMT-8)
	(envelope-from peng.hao2@zte.com.cn)
Received: from localhost.localdomain.localdomain ([10.74.120.59])
	by szsmtp06.zte.com.cn (Lotus Domino Release 8.5.3FP6)
	with ESMTP id 2018112619330992-13057794 ;
	Mon, 26 Nov 2018 19:33:09 +0800 
From: Peng Hao <peng.hao2@zte.com.cn>
To: peter.maydell@linaro.org, drjones@redhat.com, philmd@redhat.com
Date: Tue, 27 Nov 2018 03:56:01 +0800
Message-Id: <1543262162-6351-9-git-send-email-peng.hao2@zte.com.cn>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1543262162-6351-1-git-send-email-peng.hao2@zte.com.cn>
References: <1543262162-6351-1-git-send-email-peng.hao2@zte.com.cn>
X-MIMETrack: Itemize by SMTP Server on SZSMTP06/server/zte_ltd(Release
	8.5.3FP6|November 21, 2013) at 2018-11-26 19:33:10,
	Serialize by Router on notes_smtp/zte_ltd(Release 9.0.1FP7|August  17,
	2016) at 2018-11-26 19:33:01,
	Serialize complete at 2018-11-26 19:33:01
X-MAIL: mse01.zte.com.cn wAQBX23j031826
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 63.217.80.70
Subject: [Qemu-arm] [PATCH V9 8/9] hw/misc/pvpanic: realize the configure
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
X-TUID: dW/wfD+7NZwq

Add configure interface for pvpanic-mmio. In qemu command line
use -device pvpanic-mmio to enable the device.

Signed-off-by: Peng Hao <peng.hao2@zte.com.cn>
---
 hw/arm/virt-acpi-build.c | 4 +++-
 hw/arm/virt.c            | 9 ++++-----
 hw/misc/pvpanic.c        | 1 +
 3 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index 2adba60..50cea23 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -785,7 +785,9 @@ build_dsdt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
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
index bb756a6..fcaa597 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -197,8 +197,6 @@ static void create_pvpanic_device(const VirtMachineState *vms)
      hwaddr base = vms->memmap[VIRT_PVPANIC].base;
      hwaddr size = vms->memmap[VIRT_PVPANIC].size;
 
-     sysbus_create_simple(TYPE_PVPANIC_MMIO, base, NULL);
-
      nodename = g_strdup_printf("/pvpanic-mmio@%" PRIx64, base);
      qemu_fdt_add_subnode(vms->fdt, nodename);
      qemu_fdt_setprop_string(vms->fdt, nodename,
@@ -1329,6 +1327,9 @@ void virt_machine_done(Notifier *notifier, void *data)
     struct arm_boot_info *info = &vms->bootinfo;
     AddressSpace *as = arm_boot_address_space(cpu, info);
 
+    if (pvpanic_mmio()) {
+        create_pvpanic_device(vms);
+    }
     /*
      * If the user provided a dtb, we assume the dynamic sysbus nodes
      * already are integrated there. This corresponds to a use case where
@@ -1548,9 +1549,7 @@ static void machvirt_init(MachineState *machine)
                                          machine->ram_size);
     memory_region_add_subregion(sysmem, vms->memmap[VIRT_MEM].base, ram);
 
-    create_flash(vms, sysmem, secure_sysmem ? secure_sysmem : sysmem);
-
-    create_pvpanic_device(vms);
+    create_flash(vms, sysmem, secure_sysmem ? secure_sysmem : sysmem);
 
     create_gic(vms, pic);
 
diff --git a/hw/misc/pvpanic.c b/hw/misc/pvpanic.c
index 08263ed..f199173 100644
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

