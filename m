Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp8311878ejb;
        Wed, 4 Jan 2023 14:11:53 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuNWkMI+kp7rmfDPdxAV+p39+c/Y7Mh72ntoY4MutM25LqJp9PfuN4z2myKYTJ2LD7knSIN
X-Received: by 2002:a05:622a:229f:b0:3a9:861d:a6a6 with SMTP id ay31-20020a05622a229f00b003a9861da6a6mr69170875qtb.36.1672870313246;
        Wed, 04 Jan 2023 14:11:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1672870313; cv=none;
        d=google.com; s=arc-20160816;
        b=YesCHGsbwtpJ/MjR3IEAiYufwJ3V9tnrUFjBv7Boi4EYg58ARkyDDnFqGJeIbg9Bde
         IV8M1iEuM6k/osd7NP248EOMIfVY7Bt7yMKdYFRannVF6RuRaTi/mLGTIlIaRRIgD0Rx
         LUhK9X6lAyPN+uMh0KnPN7Ck/AJWG7e6RtLNCVNb3LUMWtFbEsBBb+Fcjc9UttSmh1sI
         tKDnwmHh4CP9iN/VMjQ8kxHDaJCKVX2o2PEVCLU2d7qGHxLpHvkAj3z2vG5mB5UQ2gqB
         k0ulfCp/KmEItot7WPs9kFiSa/Gis6FiUnlcJXXF1KjVZeCjRiG4XaqDxMFSdzMwElST
         NUFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=Qmw6mVPGSBueqZ8PeN/WPt3EaFW2iGA5QNW2jlN+kis=;
        b=K8+/ujBszSRz1Wk1XqJJvGQhsL6+dJh3rnGkQ7/ieFOqlgXTUYOPOjccDgF//uM+pB
         ER5POots0d9wwPf/bt8Wz69aCi1DiIeDnIpKir4AsfARWGvPGicFToj5csv5EVaCDEOf
         W2JECpCKs3nOOw72+BHr3GaG1sZo+coO/AhpGK3FIgC0aaBNgkzS//FtXfbuJdbhjWKK
         SuQMSgizumSoTm8YpEPmYXAAinhxJ4HyV2/tuvluwMPAvdTRE7klOcpvwSj3s//t/Vds
         d/FxS3cihlr4k/eNz1EnG5IcJLBvE53xy1emCFWpYj7iGczT6UHtmqNZC5AAnYSH9aKV
         57/Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Cn18Ln+r;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ew5-20020a05622a514500b003a5cb837d64si19032334qtb.322.2023.01.04.14.11.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 04 Jan 2023 14:11:53 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Cn18Ln+r;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pDBtC-0000Gq-Ab; Wed, 04 Jan 2023 17:05:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pDBt9-00006N-9K
 for qemu-arm@nongnu.org; Wed, 04 Jan 2023 17:05:35 -0500
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pDBt5-0005ND-Pj
 for qemu-arm@nongnu.org; Wed, 04 Jan 2023 17:05:34 -0500
Received: by mail-ed1-x52b.google.com with SMTP id c17so50457881edj.13
 for <qemu-arm@nongnu.org>; Wed, 04 Jan 2023 14:05:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Qmw6mVPGSBueqZ8PeN/WPt3EaFW2iGA5QNW2jlN+kis=;
 b=Cn18Ln+rBBUV7QcJMsZOyJFmLFK2lBcawTwo43OtNIbV5GAVcaIZ/cSeBVaaeTqrfW
 GcHoSlur4IX4UaanV7v697LOCYlLJAlflesIIWWEI3AodA+3kJZxBMqxHglqCdD34Ahh
 GCoumHYH0BeyXnZOAOTyBKCWtfD6yt7TpXrfLLmnoj/bCA9xD32ImcGTQNpa7v/AwBcL
 tZEt0CRzukWztAHlkjx+wBsrRtx1rUtbDW0N6FwpKr0nn+NheHfLwxvFih4UWmiTpUQB
 761AM+5t4ACtsY9vtP1Q6AkEOMEcWtYYnv+3PFiFgLFg4jeTwXgft162AXx8apyk53cs
 2WMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Qmw6mVPGSBueqZ8PeN/WPt3EaFW2iGA5QNW2jlN+kis=;
 b=wGbU7cxV7gc0ngAAqZjMpXHy0R5ULZy4tqlp8+SLWv0Bw+KJiEzLag+GT8d0VSMrch
 6UOwxDGpWNBB0aQVyxMeiwrtZE1GMisDCz+58a9Tua6JgaGI3osZl8obvkNPSG8x1117
 vhXCRIj2kPhnz2+XxcmOpzDSpEuUzxxqmzpFyFEVr//8Ftx2CpKnJ+bc1lKCys4c9Jz7
 cc3KkOyURibLGkLkRaY0XFbg9E5Dcef4G9JHzx5lkTFq7X45ss3KEtjSuSjOabgmoxST
 oq7NbBQNJMUv4x+JaBWnrqhy0ojaOM8fszlUnRI/5h5xJ+xauikzUS5aaqilMhES36lW
 upXQ==
X-Gm-Message-State: AFqh2krJIbbZv74qw2r6Gxdg/fbf/uPjawv8L0bpp5kRSSRIuIPMBd2r
 2IiP1GqnONfRqIK9FPcA4eJ1YA==
X-Received: by 2002:a05:6402:2932:b0:47e:bdb8:9133 with SMTP id
 ee50-20020a056402293200b0047ebdb89133mr48601228edb.38.1672869927788; 
 Wed, 04 Jan 2023 14:05:27 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 h25-20020aa7de19000000b00463b9d47e1fsm15290614edv.71.2023.01.04.14.05.23
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 04 Jan 2023 14:05:27 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Song Gao <gaosong@loongson.cn>, Antony Pavlov <antonynpavlov@gmail.com>,
 Jan Kiszka <jan.kiszka@web.de>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Hanna Reitz <hreitz@redhat.com>, Bernhard Beschow <shentey@gmail.com>,
 BALATON Zoltan <balaton@eik.bme.hu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-ppc@nongnu.org,
 Mark Burton <mburton@qti.qualcomm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Magnus Damm <magnus.damm@gmail.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Bin Meng <bin.meng@windriver.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Eduardo Habkost <eduardo@habkost.net>, Palmer Dabbelt <palmer@dabbelt.com>,
 Radoslaw Biernacki <rad@semihalf.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-block@nongnu.org,
 qemu-riscv@nongnu.org, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Alistair Francis <alistair@alistair23.me>, qemu-arm@nongnu.org,
 Leif Lindholm <quic_llindhol@quicinc.com>, Kevin Wolf <kwolf@redhat.com>
Subject: [PATCH 04/20] hw/arm: Use generic DeviceState instead of PFlashCFI01
Date: Wed,  4 Jan 2023 23:04:33 +0100
Message-Id: <20230104220449.41337-5-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230104220449.41337-1-philmd@linaro.org>
References: <20230104220449.41337-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x52b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 4erpSmd37h75

Nothing here requires access to PFlashCFI01 internal fields:
use the inherited generic DeviceState.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/arm/sbsa-ref.c     | 12 ++++++------
 hw/arm/vexpress.c     | 12 +++++-------
 hw/arm/virt.c         | 10 +++++-----
 include/hw/arm/virt.h |  3 +--
 4 files changed, 17 insertions(+), 20 deletions(-)

diff --git a/hw/arm/sbsa-ref.c b/hw/arm/sbsa-ref.c
index 1d29e8ca7f..8e60e0e58d 100644
--- a/hw/arm/sbsa-ref.c
+++ b/hw/arm/sbsa-ref.c
@@ -91,7 +91,7 @@ struct SBSAMachineState {
     int fdt_size;
     int psci_conduit;
     DeviceState *gic;
-    PFlashCFI01 *flash[2];
+    DeviceState *flash[2];
 };
 
 #define TYPE_SBSA_MACHINE   MACHINE_TYPE_NAME("sbsa-ref")
@@ -264,7 +264,7 @@ static void create_fdt(SBSAMachineState *sms)
 
 #define SBSA_FLASH_SECTOR_SIZE (256 * KiB)
 
-static PFlashCFI01 *sbsa_flash_create1(SBSAMachineState *sms,
+static DeviceState *sbsa_flash_create1(SBSAMachineState *sms,
                                         const char *name,
                                         const char *alias_prop_name)
 {
@@ -286,7 +286,7 @@ static PFlashCFI01 *sbsa_flash_create1(SBSAMachineState *sms,
     object_property_add_child(OBJECT(sms), name, OBJECT(dev));
     object_property_add_alias(OBJECT(sms), alias_prop_name,
                               OBJECT(dev), "drive");
-    return PFLASH_CFI01(dev);
+    return dev;
 }
 
 static void sbsa_flash_create(SBSAMachineState *sms)
@@ -295,7 +295,7 @@ static void sbsa_flash_create(SBSAMachineState *sms)
     sms->flash[1] = sbsa_flash_create1(sms, "sbsa.flash1", "pflash1");
 }
 
-static void sbsa_flash_map1(PFlashCFI01 *flash,
+static void sbsa_flash_map1(DeviceState *flash,
                             hwaddr base, hwaddr size,
                             MemoryRegion *sysmem)
 {
@@ -340,13 +340,13 @@ static bool sbsa_firmware_init(SBSAMachineState *sms,
 
     /* Map legacy -drive if=pflash to machine properties */
     for (i = 0; i < ARRAY_SIZE(sms->flash); i++) {
-        pflash_cfi01_legacy_drive(DEVICE(sms->flash[i]),
+        pflash_cfi01_legacy_drive(sms->flash[i],
                                   drive_get(IF_PFLASH, 0, i));
     }
 
     sbsa_flash_map(sms, sysmem, secure_sysmem);
 
-    pflash_blk0 = pflash_cfi01_get_blk(DEVICE(sms->flash[0]));
+    pflash_blk0 = pflash_cfi01_get_blk(sms->flash[0]);
 
     bios_name = MACHINE(sms)->firmware;
     if (bios_name) {
diff --git a/hw/arm/vexpress.c b/hw/arm/vexpress.c
index e1d1983ae6..94eeff73d9 100644
--- a/hw/arm/vexpress.c
+++ b/hw/arm/vexpress.c
@@ -508,7 +508,7 @@ static void vexpress_modify_dtb(const struct arm_boot_info *info, void *fdt)
 /* Open code a private version of pflash registration since we
  * need to set non-default device width for VExpress platform.
  */
-static PFlashCFI01 *ve_pflash_cfi01_register(hwaddr base, const char *name,
+static DeviceState *ve_pflash_cfi01_register(hwaddr base, const char *name,
                                              DriveInfo *di)
 {
     DeviceState *dev = qdev_new(TYPE_PFLASH_CFI01);
@@ -531,7 +531,7 @@ static PFlashCFI01 *ve_pflash_cfi01_register(hwaddr base, const char *name,
     sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
 
     sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, base);
-    return PFLASH_CFI01(dev);
+    return dev;
 }
 
 static void vexpress_common_init(MachineState *machine)
@@ -543,7 +543,6 @@ static void vexpress_common_init(MachineState *machine)
     qemu_irq pic[64];
     uint32_t sys_id;
     DriveInfo *dinfo;
-    PFlashCFI01 *pflash0;
     I2CBus *i2c;
     ram_addr_t vram_size, sram_size;
     MemoryRegion *sysmem = get_system_memory();
@@ -657,16 +656,15 @@ static void vexpress_common_init(MachineState *machine)
     sysbus_create_simple("pl111", map[VE_CLCD], pic[14]);
 
     dinfo = drive_get(IF_PFLASH, 0, 0);
-    pflash0 = ve_pflash_cfi01_register(map[VE_NORFLASH0], "vexpress.flash0",
-                                       dinfo);
-    if (!pflash0) {
+    dev = ve_pflash_cfi01_register(map[VE_NORFLASH0], "vexpress.flash0", dinfo);
+    if (!dev) {
         error_report("vexpress: error registering flash 0");
         exit(1);
     }
 
     if (map[VE_NORFLASHALIAS] != -1) {
         /* Map flash 0 as an alias into low memory */
-        flash0mem = sysbus_mmio_get_region(SYS_BUS_DEVICE(pflash0), 0);
+        flash0mem = sysbus_mmio_get_region(SYS_BUS_DEVICE(dev), 0);
         memory_region_init_alias(flashalias, NULL, "vexpress.flashalias",
                                  flash0mem, 0, VEXPRESS_FLASH_SIZE);
         memory_region_add_subregion(sysmem, map[VE_NORFLASHALIAS], flashalias);
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 57726b0f52..e47070105d 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1105,7 +1105,7 @@ static void create_virtio_devices(const VirtMachineState *vms)
 
 #define VIRT_FLASH_SECTOR_SIZE (256 * KiB)
 
-static PFlashCFI01 *virt_flash_create1(VirtMachineState *vms,
+static DeviceState *virt_flash_create1(VirtMachineState *vms,
                                         const char *name,
                                         const char *alias_prop_name)
 {
@@ -1127,7 +1127,7 @@ static PFlashCFI01 *virt_flash_create1(VirtMachineState *vms,
     object_property_add_child(OBJECT(vms), name, OBJECT(dev));
     object_property_add_alias(OBJECT(vms), alias_prop_name,
                               OBJECT(dev), "drive");
-    return PFLASH_CFI01(dev);
+    return dev;
 }
 
 static void virt_flash_create(VirtMachineState *vms)
@@ -1136,7 +1136,7 @@ static void virt_flash_create(VirtMachineState *vms)
     vms->flash[1] = virt_flash_create1(vms, "virt.flash1", "pflash1");
 }
 
-static void virt_flash_map1(PFlashCFI01 *flash,
+static void virt_flash_map1(DeviceState *flash,
                             hwaddr base, hwaddr size,
                             MemoryRegion *sysmem)
 {
@@ -1227,13 +1227,13 @@ static bool virt_firmware_init(VirtMachineState *vms,
 
     /* Map legacy -drive if=pflash to machine properties */
     for (i = 0; i < ARRAY_SIZE(vms->flash); i++) {
-        pflash_cfi01_legacy_drive(DEVICE(vms->flash[i]),
+        pflash_cfi01_legacy_drive(vms->flash[i],
                                   drive_get(IF_PFLASH, 0, i));
     }
 
     virt_flash_map(vms, sysmem, secure_sysmem);
 
-    pflash_blk0 = pflash_cfi01_get_blk(DEVICE(vms->flash[0]));
+    pflash_blk0 = pflash_cfi01_get_blk(vms->flash[0]);
 
     bios_name = MACHINE(vms)->firmware;
     if (bios_name) {
diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
index c7dd59d7f1..817b43b248 100644
--- a/include/hw/arm/virt.h
+++ b/include/hw/arm/virt.h
@@ -34,7 +34,6 @@
 #include "qemu/notify.h"
 #include "hw/boards.h"
 #include "hw/arm/boot.h"
-#include "hw/block/flash.h"
 #include "sysemu/kvm.h"
 #include "hw/intc/arm_gicv3_common.h"
 #include "qom/object.h"
@@ -142,7 +141,7 @@ struct VirtMachineState {
     Notifier machine_done;
     DeviceState *platform_bus_dev;
     FWCfgState *fw_cfg;
-    PFlashCFI01 *flash[2];
+    DeviceState *flash[2];
     bool secure;
     bool highmem;
     bool highmem_compact;
-- 
2.38.1

