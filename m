Received: by 2002:a17:906:3657:b0:a0d:e0d9:b5bf with SMTP id r23csp2328211ejb;
        Sun, 3 Dec 2023 13:29:56 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEtqVMduOvsrazfAYa5pGzd8Dj24oHKXvPhViEVdnfkwo2PALQecGvp5VCx5z4ULHOYugmC
X-Received: by 2002:a05:6830:cb:b0:6d8:7ecb:b5ed with SMTP id x11-20020a05683000cb00b006d87ecbb5edmr1569877oto.52.1701638996732;
        Sun, 03 Dec 2023 13:29:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1701638996; cv=none;
        d=google.com; s=arc-20160816;
        b=Gu0lyv8fK6FY7oCJu5txhlKM4talwf62eWOqDZlp0aBoEfuqz16Q+xRqw46mzWYyBd
         xGksBKLvJsgfNEh1sZF96aCKLs/Jt+m6ouwQxQAIrxNUjhER0eHwKCsnK6D70cN7ByZG
         QdWBF/NrIhFje4BWRvZxdYvdi8bWyCavQl1Y3gUR1JgEbQA7R/QGk+LmmrIDZtx/QmAQ
         Jx4oA1uh/x1pgMeKWrqHqNIMNabOc58wWGfJVKcA7ociziCaTjD2F0u7rB6TyR5p65aX
         NCo6EOUYbe5J36eRD1eeCME2DYN2DR6rRYpBDbyrluwZ4SYkk0l/qksls2ZYLdtZMuO7
         kCWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=Wmi1AJ5sdVkVMe4G4xOT7WMN2sIuUaWUGckgKMqr68s=;
        fh=1CWWAdYo81brd4jeYOgzhc83mN/ncVbe89i2SJzFql0=;
        b=NBstPdc6TcZ5AyZO85XvRK+tsHFGR6sy3ZgNC5f9xGOaBqt/KGtMRT5bngavPJTmp+
         6l4PWoYkfyoGpYZWOh4WhR353Qj1QXNOjsgpb7DmM0nl4c4pjzJ9jfh5N7p8jPGTZmGu
         ylSmn4CQWEcErK5jMNiwCgHbh0nRgweGeufvXmve1myQ/ykP3UYjVhQUqRGTnZI+dheU
         +zoIrw143ZnBxIejC4uqPLvNOw1d+a1Qz+FfhJH6LN2ZS033RRN11Hmb8suwsfOrOyYd
         klQtW2bQbseK0SZUVn5jrmm5mqD9ODL4NM2CEz7FiNYNQCHgbBWy02qX4659J28rP1DI
         mcNA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=OX8bAMhP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h13-20020ac8548d000000b00423dcceb29esi7899929qtq.400.2023.12.03.13.29.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 03 Dec 2023 13:29:56 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=OX8bAMhP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1r9u26-0001Xu-Td; Sun, 03 Dec 2023 16:29:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <serg.oker@gmail.com>)
 id 1r9u1o-0001RU-7G; Sun, 03 Dec 2023 16:29:30 -0500
Received: from mail-oi1-x236.google.com ([2607:f8b0:4864:20::236])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <serg.oker@gmail.com>)
 id 1r9u1k-0005QI-Dp; Sun, 03 Dec 2023 16:29:27 -0500
Received: by mail-oi1-x236.google.com with SMTP id
 5614622812f47-3b8b4670c78so930730b6e.1; 
 Sun, 03 Dec 2023 13:29:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701638961; x=1702243761; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Wmi1AJ5sdVkVMe4G4xOT7WMN2sIuUaWUGckgKMqr68s=;
 b=OX8bAMhP1Eb7F7P+Cu40g/cbrJxMm+Gnxble+hzlKnumOBeK1oeLrVO4NrmQAlgdny
 WWPf4KvSJ28OHyBQXpHlqyENMyyONg+QFJ7Y0ZPx1tAYtVIQCiq9Hb5RxuIKwtXbKN4q
 xLBhk7bp47PEYllh1d9JH42qz/MCh2GtGCflXaH4Bi2dY4/q2ZNJZ8o1mK5rk2APcMr2
 oqjrSDKzxE6K9v5Wa3YMCdOHIreOUMw6RF2QeaqBMLrVurRGElPxyJZYVofx1puX9je+
 jD6cxarZj5YxtexdlL6rLPBx650uBh6pn9gUkvnJEpAlUdmMixrOJUXiPzvAPxUFTLO+
 rkvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701638961; x=1702243761;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Wmi1AJ5sdVkVMe4G4xOT7WMN2sIuUaWUGckgKMqr68s=;
 b=EeA/DOMmN1TvABwG7NaUx8C9hRhwSM3LvXPRwlC8FtnlWh36b4CbXLB+dL3EjiOVAc
 KHlSCrXhkhqOGJxvWvHlSMh5uCGh0+u2oRfJF7wzQcxsxscLyvoLQ2nR6gsI5rE9I8p7
 eZ52Pe7lXtSYvHBvzuAT6m585ZGHhZQRwdyKGSvgdDLaox+wOsx+Itm83N7oqDZkHBT7
 gOhrm5Czesni6mH+4frp6chgzOwxHlzsgh/kA3eFqSubPncMu2kg8wzqkXd/iHgiVIBu
 4hwsL8YFfqJyXRNIblZ4Ak+TtnphJW7tovBw1ozH1/gUpvliDBDNy0kB7is81k9WzbEb
 Bnew==
X-Gm-Message-State: AOJu0YwPEh8uNubsYKefsOg6GVtc+NpzJePRuBYA7+mweBZAHZoWKMTH
 rvHfRNnnkcXtf5XV555E7CbRBnPNptAQYg==
X-Received: by 2002:a05:6808:ecb:b0:3b8:3ea1:1cec with SMTP id
 q11-20020a0568080ecb00b003b83ea11cecmr2974750oiv.50.1701638961600; 
 Sun, 03 Dec 2023 13:29:21 -0800 (PST)
Received: from localhost.localdomain ([201.206.180.22])
 by smtp.gmail.com with ESMTPSA id
 c17-20020a25a291000000b00d9cc606c78csm1807318ybi.41.2023.12.03.13.29.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Dec 2023 13:29:21 -0800 (PST)
From: Sergey Kambalin <serg.oker@gmail.com>
X-Google-Original-From: Sergey Kambalin <sergey.kambalin@auriga.com>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org,
	Sergey Kambalin <sergey.kambalin@auriga.com>
Subject: [PATCH 12/45] Temporarily disable unimplemented rpi4b devices
Date: Sun,  3 Dec 2023 15:28:32 -0600
Message-Id: <20231203212905.1364036-13-sergey.kambalin@auriga.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231203212905.1364036-12-sergey.kambalin@auriga.com>
References: <20230726132512.149618-1-sergey.kambalin@auriga.com>
 <20231203212905.1364036-1-sergey.kambalin@auriga.com>
 <20231203212905.1364036-2-sergey.kambalin@auriga.com>
 <20231203212905.1364036-3-sergey.kambalin@auriga.com>
 <20231203212905.1364036-4-sergey.kambalin@auriga.com>
 <20231203212905.1364036-5-sergey.kambalin@auriga.com>
 <20231203212905.1364036-6-sergey.kambalin@auriga.com>
 <20231203212905.1364036-7-sergey.kambalin@auriga.com>
 <20231203212905.1364036-8-sergey.kambalin@auriga.com>
 <20231203212905.1364036-9-sergey.kambalin@auriga.com>
 <20231203212905.1364036-10-sergey.kambalin@auriga.com>
 <20231203212905.1364036-11-sergey.kambalin@auriga.com>
 <20231203212905.1364036-12-sergey.kambalin@auriga.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::236;
 envelope-from=serg.oker@gmail.com; helo=mail-oi1-x236.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: Y+mDOZiiA6a4

This commit adds RPi4B device tree modifications:
- disable pcie, rng200, thermal sensor and genet devices
  (they're going to be re-enabled in the following commits)
- create additional memory region in device tree
  if RAM amount exceeds VC base address.

Signed-off-by: Sergey Kambalin <sergey.kambalin@auriga.com>
---
 hw/arm/raspi.c                  |  5 +--
 hw/arm/raspi4b.c                | 60 +++++++++++++++++++++++++++++++++
 include/hw/arm/raspi_platform.h |  4 +++
 3 files changed, 65 insertions(+), 4 deletions(-)

diff --git a/hw/arm/raspi.c b/hw/arm/raspi.c
index da1e9e7c13..895c305122 100644
--- a/hw/arm/raspi.c
+++ b/hw/arm/raspi.c
@@ -37,9 +37,6 @@ OBJECT_DECLARE_SIMPLE_TYPE(RaspiMachineState, RASPI_MACHINE)
 #define FIRMWARE_ADDR_3 0x80000 /* Pi 3 loads kernel.img here by default */
 #define SPINTABLE_ADDR  0xd8 /* Pi 3 bootloader spintable */
 
-/* Registered machine type (matches RPi Foundation bootloader and U-Boot) */
-#define MACH_TYPE_BCM2708   3138
-
 struct RaspiMachineState {
     /*< private >*/
     RaspiBaseMachineState parent_obj;
@@ -75,7 +72,7 @@ static const struct {
     [PROCESSOR_ID_BCM2838] = {TYPE_BCM2838, BCM283X_NCPUS},
 };
 
-static uint64_t board_ram_size(uint32_t board_rev)
+uint64_t board_ram_size(uint32_t board_rev)
 {
     assert(FIELD_EX32(board_rev, REV_CODE, STYLE)); /* Only new style */
     return 256 * MiB << FIELD_EX32(board_rev, REV_CODE, MEMORY_SIZE);
diff --git a/hw/arm/raspi4b.c b/hw/arm/raspi4b.c
index 2d33861c57..10376b62dc 100644
--- a/hw/arm/raspi4b.c
+++ b/hw/arm/raspi4b.c
@@ -21,6 +21,7 @@
 #include "hw/arm/boot.h"
 #include "qom/object.h"
 #include "hw/arm/bcm2838.h"
+#include <libfdt.h>
 
 #define TYPE_RASPI4B_MACHINE MACHINE_TYPE_NAME("raspi4b-2g")
 OBJECT_DECLARE_SIMPLE_TYPE(Raspi4bMachineState, RASPI4B_MACHINE)
@@ -32,6 +33,64 @@ struct Raspi4bMachineState {
     BCM2838State soc;
 };
 
+/* Add second memory region if board RAM amount exceeds VC base address
+ * (see https://datasheets.raspberrypi.com/bcm2711/bcm2711-peripherals.pdf
+ * 1.2 Address Map)
+ */
+static int raspi_add_memory_node(void *fdt, hwaddr mem_base, hwaddr mem_len)
+{
+    int ret;
+    uint32_t acells, scells;
+    char *nodename = g_strdup_printf("/memory@%" PRIx64, mem_base);
+
+    acells = qemu_fdt_getprop_cell(fdt, "/", "#address-cells",
+                                   NULL, &error_fatal);
+    scells = qemu_fdt_getprop_cell(fdt, "/", "#size-cells",
+                                   NULL, &error_fatal);
+    if (acells == 0 || scells == 0) {
+        fprintf(stderr, "dtb file invalid (#address-cells or #size-cells 0)\n");
+        ret = -1;
+    } else {
+        qemu_fdt_add_subnode(fdt, nodename);
+        qemu_fdt_setprop_string(fdt, nodename, "device_type", "memory");
+        ret = qemu_fdt_setprop_sized_cells(fdt, nodename, "reg",
+                                           acells, mem_base,
+                                           scells, mem_len);
+    }
+
+    g_free(nodename);
+    return ret;
+}
+
+static void raspi4_modify_dtb(const struct arm_boot_info *info, void *fdt)
+{
+
+    /* Temporarily disable following devices until they are implemented*/
+    const char *to_be_removed_from_dt_as_wa[] = {
+        "brcm,bcm2711-pcie",
+        "brcm,bcm2711-rng200",
+        "brcm,bcm2711-thermal",
+        "brcm,bcm2711-genet-v5",
+    };
+
+    for (int i = 0; i < ARRAY_SIZE(to_be_removed_from_dt_as_wa); i++) {
+        const char *dev_str = to_be_removed_from_dt_as_wa[i];
+
+        int offset = fdt_node_offset_by_compatible(fdt, -1, dev_str);
+        if (offset >= 0) {
+            if (!fdt_nop_node(fdt, offset)) {
+                warn_report("bcm2711 dtc: %s has been disabled!", dev_str);
+            }
+        }
+    }
+
+    uint64_t ram_size = board_ram_size(info->board_id);
+
+    if (info->ram_size > UPPER_RAM_BASE) {
+        raspi_add_memory_node(fdt, UPPER_RAM_BASE, ram_size - UPPER_RAM_BASE);
+    }
+}
+
 static void raspi4b_machine_init(MachineState *machine)
 {
     Raspi4bMachineState *s = RASPI4B_MACHINE(machine);
@@ -39,6 +98,7 @@ static void raspi4b_machine_init(MachineState *machine)
     RaspiBaseMachineClass *mc = RASPI_BASE_MACHINE_GET_CLASS(machine);
     BCM2838State *soc = &s->soc;
 
+    s_base->binfo.modify_dtb = raspi4_modify_dtb;
     s_base->binfo.board_id = mc->board_rev;
 
     object_initialize_child(OBJECT(machine), "soc", soc,
diff --git a/include/hw/arm/raspi_platform.h b/include/hw/arm/raspi_platform.h
index 45003e2425..0db146e592 100644
--- a/include/hw/arm/raspi_platform.h
+++ b/include/hw/arm/raspi_platform.h
@@ -31,6 +31,9 @@
 #include "hw/boards.h"
 #include "hw/arm/boot.h"
 
+/* Registered machine type (matches RPi Foundation bootloader and U-Boot) */
+#define MACH_TYPE_BCM2708   3138
+
 #define TYPE_RASPI_BASE_MACHINE MACHINE_TYPE_NAME("raspi-base")
 OBJECT_DECLARE_TYPE(RaspiBaseMachineState, RaspiBaseMachineClass,
                     RASPI_BASE_MACHINE)
@@ -59,6 +62,7 @@ void raspi_base_machine_init(MachineState *machine,
 
 void raspi_machine_class_common_init(MachineClass *mc,
                                      uint32_t board_rev);
+uint64_t board_ram_size(uint32_t board_rev);
 
 #define MSYNC_OFFSET            0x0000   /* Multicore Sync Block */
 #define CCPT_OFFSET             0x1000   /* Compact Camera Port 2 TX */
-- 
2.34.1

