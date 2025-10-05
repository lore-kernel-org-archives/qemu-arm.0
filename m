Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2E27CAC5B8
	for <qemu-arm@archiver.kernel.org>; Sun,  5 Oct 2025 20:17:48 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v5VAh-0000vx-Jx; Sun, 05 Oct 2025 16:17:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xpahos@gmail.com>) id 1v5VAY-0000u6-8M
 for qemu-arm@nongnu.org; Sun, 05 Oct 2025 16:17:22 -0400
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xpahos@gmail.com>) id 1v5VAT-0005IX-VL
 for qemu-arm@nongnu.org; Sun, 05 Oct 2025 16:17:21 -0400
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-36d77ae9de5so40314111fa.2
 for <qemu-arm@nongnu.org>; Sun, 05 Oct 2025 13:17:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1759695435; x=1760300235; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=X5uTlnB3NhUwPh8jYQG8VqFwbODJaHhYoBAK9FpIpFM=;
 b=BFgUP3GjKt4T9Cbz4b1ZRiqKR7DO4gp0T/usHLrtarwL+LUqKCR4ya8uBNJNSqZJ3u
 LaM+fMA2p8eL/wNrQnyJtqpIuPA+bc8k733rwdZLWrSJ9nIEDVtK2IfXQIN2r+Eg353D
 mB9RANOZ1xT3xDVsTD0eps3ag6fUcuRbTOqVfZpm/YXR0cQ4iHAf/YabWdTizDehMlUs
 1bIma8Fqb/eCipqz5Z3H1pJCbzMSOaPMxaczQpNQdN0ubUTkkmpoPrrs0OUxwS7zB8XT
 /2d/NNejph1kWeHbFSrrAeV2bpTPkG70d19m1gY+iLOyC2B7o8CKndp0+WW4UgOpY+RP
 4hMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759695435; x=1760300235;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=X5uTlnB3NhUwPh8jYQG8VqFwbODJaHhYoBAK9FpIpFM=;
 b=WPLrxy4ZhoClc2o56RbOSGQVKmO4jVAxWmdl8vYdDLuKZ9Wu/lQMvmRBFToOQR7nuc
 a3bpq5qj9M2ykzRl6fNNdC6gNlZx4v2Rf+QEzuA167Lfsn2KPe11NrXJZ2ts2eAHFQlW
 XuZFzIVGq369qhnKY8cX7P9q3oC7xQkIHqqH8xvD9ICMrs/ZaYcF1Bwk8bHTAKBxSHwF
 1b/pltxNZYX1PjGoDC9tcPz7UvbZmMY/9PcnWNTxHzSMWWrwjW2F5FgQ4ighOQAGZZYq
 l4gctdkVYfYkrwz/DBRzSSFNHiLzQYqB4tO44+YTEAuYRADiaAfcDKa/LP31ZSOCoM4q
 AQLQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV2kDHtn3UxOOO+1stiFALkoL/0w+VV9coVadEjChfAUo8jSDPK5kIAq94/CFa60Cp24ITc0KOZ8w==@nongnu.org
X-Gm-Message-State: AOJu0Yy1Vypz7j3e/BCE2Prkq0JAkYpldcAz3H1iDmAtUk8B3fEhu/Ou
 DzGDeDf1H3vV33IiReHe/3hNnoirUJyDJSCxvhuwAwsgWlRC2L6oAIpY
X-Gm-Gg: ASbGnct41yJId/SY0geIfYzMgG5MQXAkcfe1Rf4OkPvMO3UhM8Uxaxdp4dOMQUVEv0Q
 1+Ypa+NB7lQQe0IP7063oM791y5O2ftuemVc6BELsD7dSR6DSA74Z6NYf4jwxk4czDuytdJ4AvM
 cHuKfP9bm1sYoCZcE4uvMU9AhgrD1WpRq7CGQad6DE/clm6n644220mFy8ZywRs8z6XzehmPXTt
 wiblY0vmM048UMvyfEnd33YBgV7rfBKXDEQ/W4v6hHa0U/JsuXk+2wm6UxcF9mHSBo3Xa1hZGJA
 NqY5uExczQP3zk/7B+pratJUjQh1TwJuIqDtsBJy71tm21TK+tNgY7SWMDXZpjsrCY1fW1P5jzK
 bBNPupTHuSxqSJM9b8MB1RHaCF3xCWkfRwN9cqeGoEBBHvEMTyP0/DHakP4Q=
X-Google-Smtp-Source: AGHT+IGKR8NwEjUi/nxpi6CipCp/3M4Nelq5KGh1KFZpePxbMC1ihlTVsXZ7lNha3wXP+mXepM022w==
X-Received: by 2002:a2e:bd02:0:b0:372:17eb:1191 with SMTP id
 38308e7fff4ca-374c37511dcmr31991331fa.18.1759695434577; 
 Sun, 05 Oct 2025 13:17:14 -0700 (PDT)
Received: from xpahos-osx.yandex.net ([2a02:6bf:8080:c37::1:1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-373ba44818csm38204561fa.41.2025.10.05.13.17.11
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sun, 05 Oct 2025 13:17:13 -0700 (PDT)
From: xpahos@gmail.com
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org,
 Alexander Gryanko <xpahos@gmail.com>
Subject: [PATCH v2] hw/arm: add pvpanic mmio device for arm
Date: Sun,  5 Oct 2025 23:16:49 +0300
Message-ID: <CC5A0011-CD14-40F9-8023-8BF5F989BCCF@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Change-ID: 20251005-arm-pvpanic-8e3e8fd05e95
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1759689277; l=3360;
 i=xpahos@gmail.com; s=20251004; h=from:subject:message-id;
 bh=8vahP4rJaiEcZHPpEIyes8fe5YhSlu876t+4bYa3n2I=;
 b=vONAhLi4eVISLyW7o+8CipIPEObfmTUCcqjBA6B8U4KZFyvnayVlS3I/UIOAageN477CuaXAb
 U1enPaZJZw4DFsk1B1Aeo+g+ZNj09r3sdN+WVEP76yahEAJGXt2RxG2
X-Developer-Key: i=xpahos@gmail.com; a=ed25519;
 pk=bsSvP3Tn7PVKgjJT3BMV3jlAwSqreKIM4099C1r51eg=
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::234;
 envelope-from=xpahos@gmail.com; helo=mail-lj1-x234.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Message-ID: <20251005201649.xRRl2oWXoyJrtcwr4C2UhOWmpWvO1IgiJxIPNk4KKCI@z>

From: Alexander Gryanko <xpahos@gmail.com>

Currently, pvpanic is available in three device types: ISA,
MMIO, and PCI. For early stages of system initialisation
before PCI enumeration, only ISA and MMIO are suitable.
ISA is specific to the x86 platform; only MMIO devices
can be used for ARM. It is not possible to specify a
device as on the x86 platform (-device pvpanic); the
only possible way is to add an MMIO device to the dtb,
which can be implemented by manually adding new functions
to the QEMU code, as was done in the VMApple implementation.

Signed-off-by: Alexander Gryanko <xpahos@gmail.com>
---
 hw/arm/virt.c         | 26 ++++++++++++++++++++++++++
 include/hw/arm/virt.h |  1 +
 2 files changed, 27 insertions(+)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 02209fadcf..78e466f935 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -39,6 +39,7 @@
 #include "hw/arm/virt.h"
 #include "hw/block/flash.h"
 #include "hw/display/ramfb.h"
+#include "hw/misc/pvpanic.h"
 #include "net/net.h"
 #include "system/device_tree.h"
 #include "system/numa.h"
@@ -182,6 +183,7 @@ static const MemMapEntry base_memmap[] = {
     [VIRT_UART0] =              { 0x09000000, 0x00001000 },
     [VIRT_RTC] =                { 0x09010000, 0x00001000 },
     [VIRT_FW_CFG] =             { 0x09020000, 0x00000018 },
+    [VIRT_PVPANIC] =            { 0x09021000, 0x00000002 },
     [VIRT_GPIO] =               { 0x09030000, 0x00001000 },
     [VIRT_UART1] =              { 0x09040000, 0x00001000 },
     [VIRT_SMMU] =               { 0x09050000, SMMU_IO_LEN },
@@ -276,6 +278,28 @@ static bool ns_el2_virt_timer_present(void)
         arm_feature(env, ARM_FEATURE_EL2) && cpu_isar_feature(aa64_vh, cpu);
 }
 
+static void create_pvpanic(VirtMachineState *vms)
+{
+    char *nodename;
+    MachineState *ms = MACHINE(vms);
+    DeviceState *dev = qdev_new(TYPE_PVPANIC_MMIO_DEVICE);
+    SysBusDevice *s = SYS_BUS_DEVICE(dev);
+
+    hwaddr base = vms->memmap[VIRT_PVPANIC].base;
+    hwaddr size = vms->memmap[VIRT_PVPANIC].size;
+
+    sysbus_realize_and_unref(s, &error_fatal);
+    sysbus_mmio_map(s, 0, base);
+
+    nodename = g_strdup_printf("/pvpanic@%" PRIx64, base);
+    qemu_fdt_add_subnode(ms->fdt, nodename);
+    qemu_fdt_setprop_string(ms->fdt, nodename, "compatible",
+                            "qemu,pvpanic-mmio");
+    qemu_fdt_setprop_sized_cells(ms->fdt, nodename, "reg",
+                                 2, base, 2, size);
+    g_free(nodename);
+}
+
 static void create_fdt(VirtMachineState *vms)
 {
     MachineState *ms = MACHINE(vms);
@@ -2498,6 +2522,8 @@ static void machvirt_init(MachineState *machine)
     create_pcie(vms);
     create_cxl_host_reg_region(vms);
 
+    create_pvpanic(vms);
+
     if (has_ged && aarch64 && firmware_loaded && virt_is_acpi_enabled(vms)) {
         vms->acpi_dev = create_acpi_ged(vms);
     } else {
diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
index ea2cff05b0..39bf07c9c1 100644
--- a/include/hw/arm/virt.h
+++ b/include/hw/arm/virt.h
@@ -81,6 +81,7 @@ enum {
     VIRT_NVDIMM_ACPI,
     VIRT_PVTIME,
     VIRT_ACPI_PCIHP,
+    VIRT_PVPANIC,
     VIRT_LOWMEMMAP_LAST,
 };
 

---
base-commit: bd6aa0d1e59d71218c3eee055bc8d222c6e1a628
change-id: 20251005-arm-pvpanic-8e3e8fd05e95

Best regards,
-- 
Alexander Gryanko <xpahos@gmail.com>


