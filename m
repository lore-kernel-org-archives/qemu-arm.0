Received: by 2002:a17:906:3657:b0:a0d:e0d9:b5bf with SMTP id r23csp2388188ejb;
        Sun, 3 Dec 2023 16:35:16 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH+lBi153CJiKhSVWKUnnngmyi6aHEZWGy76jfyILi1Yc6dC4+q/kb1JO+nIbckZkla5/WA
X-Received: by 2002:a25:90c:0:b0:d85:df88:a7c4 with SMTP id 12-20020a25090c000000b00d85df88a7c4mr26395273ybj.18.1701650116678;
        Sun, 03 Dec 2023 16:35:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1701650116; cv=none;
        d=google.com; s=arc-20160816;
        b=FuoP44TtXhXH+cutWhPqOphenDz304v5KowmnJwPHD3ms+mj+l3V19l9R0QBUODYuf
         gdLE8gJ6jakmmI1ttOcTEXqDlZ+Odbf5EsEXQVIXCKQd+l1K95jDw7AjZiwcXigD/jCo
         1Zjx8ROiXCDjaDtBEGaZJUdGrxrTpq4wq2ydPBaB4ho+RYRDNvudjMHxA6kFc3TxAy2b
         R2bL5f4NVTNk7x8VViHKKBN8vgfQoEqqlHnpUIpNqwkOUl2SpPds4+eElEkhotvheLEp
         yYQwdA4BB9OvBpEvgFp7esXVY7cbyXvt2PWXOUxm+eC2drP2uTG7m4G265FqWH6yEYZl
         AKLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=Wmi1AJ5sdVkVMe4G4xOT7WMN2sIuUaWUGckgKMqr68s=;
        fh=1CWWAdYo81brd4jeYOgzhc83mN/ncVbe89i2SJzFql0=;
        b=cFSEgl9GF6X9YvMrukpK8qz688My/NdA40aY8lgFD+cZllPYb33BiCX8k2OwjoDMCW
         merM7N/ZIySjCvkVYXa1njxBvdzmNppK8QKyJqTA5QY9RSdwqy3ompjIL/rMoSpQl1m3
         WiUEZx5IvfB8xNf0OC5R6VSUU7orOUBSBlDS9mF0/JSmJ3ULQdSe+ppHY9UJVuNztjm6
         xGA6TM42CzyUaWk04DSAFDkqYLFwww4cxQWHdAWhLnU1yJwnkgwcWspjTmUuouLlsYdo
         od6aXdVPngvwJGxX2RfMWqitpNO8mHIalrJGQUo75/9FTXsASZe6TPy5DM/2hyj5plPj
         wxcg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=Wmq1WRVg;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id jk7-20020ad45d47000000b0067aa5bd7769si5883074qvb.215.2023.12.03.16.35.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 03 Dec 2023 16:35:16 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=Wmq1WRVg;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1r9wnu-0004vD-Ew; Sun, 03 Dec 2023 19:27:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <serg.oker@gmail.com>)
 id 1r9wnN-0004W9-91; Sun, 03 Dec 2023 19:26:45 -0500
Received: from mail-yw1-x1135.google.com ([2607:f8b0:4864:20::1135])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <serg.oker@gmail.com>)
 id 1r9wnJ-00008e-BL; Sun, 03 Dec 2023 19:26:44 -0500
Received: by mail-yw1-x1135.google.com with SMTP id
 00721157ae682-5d8e816f77eso301287b3.0; 
 Sun, 03 Dec 2023 16:26:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701649599; x=1702254399; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Wmi1AJ5sdVkVMe4G4xOT7WMN2sIuUaWUGckgKMqr68s=;
 b=Wmq1WRVgWwvJluRkuyrdz+E1Y28fKdkjlbrNK2ZnN7y3ixbUPJ/RA6q51OBYS0jWlX
 Q6R+EkufJxwIrB3C8kKRgPPVaUC0o72AMwjjwmGxYLPY+zezihZ0YkIrK6AJI2D41vHH
 162uptgZYHfRy7YD4FMBgQzFQICcxdWsvzgIkX6B8c9lp0BU29LcECjmixjJggOHg3s5
 KQBm1ZXOP5rrQcnlB3/Lyy3h1NqdyCts6gcpSMa6ZC9185LoToN8fhT/DC1kXMp5mBOc
 4TeNkkQstv39rMv/PhwBBFc3vhfiwCCOinlxWmW/HvkADib/aMPIV11rP2VNzBqyNfkD
 6Qew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701649599; x=1702254399;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Wmi1AJ5sdVkVMe4G4xOT7WMN2sIuUaWUGckgKMqr68s=;
 b=cTce8kHyTrMaLtHLNPTy9iDKYxuaxEz1/H48zvnhFXBs+tzSjA1K12wexa9fN5dkIj
 uuk4ebcbWOlungXqAvYI/sxfn5B8zcb/ClR7/fU0fR5EXlHOckZki7wbxwYMZeEudyD/
 2vxPpOS9TDLO2J3cz/KgvHQ9TnYtdUQl/rvD/mrzDKfDD95korGbiRtplmO9NJri4iLe
 sJUnWkBu6cp77OaNo02LznTEl9PNiVJXCk1wzd5MrmW0X97SdoFRNwvTeTLHiRHTQOLp
 6uWQoBJf6IMAK6B1BLQyUrLRa8yao7GxxFcTSruutVCHUY3qu5zOAWyylqJbAGVh9ue4
 kGnA==
X-Gm-Message-State: AOJu0YwYaYM9QsU3dsGP978YKm1BAC1vqAJIKcmSB48i3/BSiJPyaIwR
 465nJVkiFlEy+k6TY2UzRSGcu9f+ojqIhQ==
X-Received: by 2002:a81:8645:0:b0:5ca:c8ad:1717 with SMTP id
 w66-20020a818645000000b005cac8ad1717mr28947823ywf.44.1701649599235; 
 Sun, 03 Dec 2023 16:26:39 -0800 (PST)
Received: from localhost.localdomain ([201.206.180.22])
 by smtp.gmail.com with ESMTPSA id
 l63-20020a0de242000000b005d3e6ce07e7sm2443187ywe.6.2023.12.03.16.26.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Dec 2023 16:26:38 -0800 (PST)
From: Sergey Kambalin <serg.oker@gmail.com>
X-Google-Original-From: Sergey Kambalin <sergey.kambalin@auriga.com>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org,
	Sergey Kambalin <sergey.kambalin@auriga.com>
Subject: [PATCH v3 12/45] Temporarily disable unimplemented rpi4b devices
Date: Sun,  3 Dec 2023 18:25:46 -0600
Message-Id: <20231204002619.1367044-13-sergey.kambalin@auriga.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231204002619.1367044-1-sergey.kambalin@auriga.com>
References: <20231204002619.1367044-1-sergey.kambalin@auriga.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1135;
 envelope-from=serg.oker@gmail.com; helo=mail-yw1-x1135.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 4gFWH7TeWlzA

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

