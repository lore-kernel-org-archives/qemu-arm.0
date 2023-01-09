Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp2195697ejc;
        Mon, 9 Jan 2023 04:08:19 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtz6LMltprONKgMWiotTbz9lkF7VlYZTs66l+Z5qb8IXUrB5sOJuNId0GHfuSM0HYJR0spe
X-Received: by 2002:a1f:1b07:0:b0:3bd:fb7f:e385 with SMTP id b7-20020a1f1b07000000b003bdfb7fe385mr27768219vkb.8.1673266099708;
        Mon, 09 Jan 2023 04:08:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673266099; cv=none;
        d=google.com; s=arc-20160816;
        b=gaD4TUSyDnfsYxAOdPHVogBvOK52B5YlSu7OZdLxOax7NDBG7An9bnnNEeZbJ+wvbD
         jxtrnA5V1Rl66x7swFz/5RP0WsbTr3LiT4a/G35bQoWUyer0Ucp0DWlk/iXxXXFlU8Pl
         N9pTI/Tt4Id60J1cCjGi3Y/4uKXwH9q0or4maF61QjVWmAqntbs2ugmnUnBXOCXYTwdW
         T850sDZJzHme77DpTXskLq79JhbQdiszOeWp3ISCToeFVNM1GXxx0TcXnyauIL+7ofb+
         LT3XldlFXyP/G3KWwg+5i3URN+7HaSnVX2wQsqWDgIJpZ64v6l6KzpfRi1MrUXUiHTd/
         baAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=LVNFvExNkEf16xN6scmGKliquT0uXwHyZsjZ5nnvuPM=;
        b=vOrAm0JgEONAvrK3c/P+KXiKkbBMltGz5GhBv25sS7n2pKxBGbcIrKtg7C9SOO/Dkg
         AAGYLEQ//V6hfW6p436mUd47J3TD+zronsIEfP4GuqP29pl479USUilAt8ZSmfPHk/TI
         hHGzNQSRnf+eXAh1QpRnnmNk7xZM0ZZ+AbU5Fd+9CQu5kxacDcyUHCK4vg0zMUJPP74h
         6KYKVQF+DH2CMnVeynUDfzx1vwduyk/ah6JEmt8W6YVlI3RIn4597M/jcaJN9p+GhnUB
         FWzBrzUBvvJTIjFVWbXhZXXkrPg+27FYQcvdz2iUIXjCG3avFxEvf7pljG9kcvy53sn6
         j1dQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Sxp/Wg/0";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id pi9-20020a05620a378900b006cf11841e8esi4116966qkn.330.2023.01.09.04.08.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 09 Jan 2023 04:08:19 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Sxp/Wg/0";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pEqjB-0003C2-7M; Mon, 09 Jan 2023 06:54:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pEqjA-0003BW-NJ
 for qemu-arm@nongnu.org; Mon, 09 Jan 2023 06:54:08 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pEqj9-000854-1F
 for qemu-arm@nongnu.org; Mon, 09 Jan 2023 06:54:08 -0500
Received: by mail-wm1-x336.google.com with SMTP id o15so6058414wmr.4
 for <qemu-arm@nongnu.org>; Mon, 09 Jan 2023 03:54:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LVNFvExNkEf16xN6scmGKliquT0uXwHyZsjZ5nnvuPM=;
 b=Sxp/Wg/0RMnlrTjkIbq3Ax1cZ0nwKHugsjmteYO0+L7sAJJF5NjXUTKVwwyGAY6Aul
 VytvzhgnSojuOCWtGgk3AQzWaQgnjpTf5erRSEKztda8vhjNfI6twICPKaMzzsKESs7z
 MzZpcdDwawoFXImfSAI7s4cw2FaFf/+Ul60su6Pxuf2t/OVIYDLxPEnfqzqVKq5bb5tN
 h95fNb16cxlXR1Q/p10yASbAx25R3fmv/cPa1pw3oLdxGKeBsy8h8dPyEr1v/5jMUEVn
 r4g74tFVWizSc6Ej/YAc8CY7+Y/JTXyjq8zVJ4KXwMBNNdFqTvgpWzwfKruPTEjJAfm+
 d7zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LVNFvExNkEf16xN6scmGKliquT0uXwHyZsjZ5nnvuPM=;
 b=jiRp7s6DI7wO8ZlQxshq8kzsSow1I9b52MUlotzv/wy7Tr2qhABcdaq5LxH1XJyYA6
 8nOTWZNIoUtlNCWxJ+NWO+riEwLRfwmzNAJbv3IP5VlAED7QBmDsxjKAQzriWeaNoOmw
 FNovy9BrA4AGvBsLEkY9Z4mbm01cxi/35IEe+EOIbb2ZonkrOKnMeTtPahMIcnQTSB7s
 socANnLCGX6r95hQg3xS8iMbJp0aseD8YaYQWoccmO9GOrGwLvKLl09kfeKctDSRlVn0
 bK3oodNxnW6KIscknakpaFYry/pnedWEDBZ0yniM0dCCsA50XTTZ6MDpPJ2CmtQ1ArBF
 aadA==
X-Gm-Message-State: AFqh2kpMWN4zl1ZyTezUvg2etlA7E4fYyEuumCIuONYT/JkxhmYC+rqv
 DZUvrf8t0kfE8m5pLaYdI+1Fwg==
X-Received: by 2002:a05:600c:3509:b0:3c6:e60f:3f6f with SMTP id
 h9-20020a05600c350900b003c6e60f3f6fmr45448282wmq.38.1673265246364; 
 Mon, 09 Jan 2023 03:54:06 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 j30-20020a05600c1c1e00b003d9f14e9085sm2706376wms.17.2023.01.09.03.54.05
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 09 Jan 2023 03:54:05 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Jan Kiszka <jan.kiszka@web.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 10/13] hw/arm/omap_sx1: Use the IEC binary prefix definitions
Date: Mon,  9 Jan 2023 12:53:13 +0100
Message-Id: <20230109115316.2235-11-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230109115316.2235-1-philmd@linaro.org>
References: <20230109115316.2235-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: vK8JEf4Q5fEH

IEC binary prefixes ease code review: the unit is explicit.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/arm/omap_sx1.c | 33 +++++++++++++++++----------------
 1 file changed, 17 insertions(+), 16 deletions(-)

diff --git a/hw/arm/omap_sx1.c b/hw/arm/omap_sx1.c
index 84b7059f7c..d1b0ec3264 100644
--- a/hw/arm/omap_sx1.c
+++ b/hw/arm/omap_sx1.c
@@ -26,6 +26,7 @@
  * with this program; if not, see <http://www.gnu.org/licenses/>.
  */
 #include "qemu/osdep.h"
+#include "qemu/units.h"
 #include "qapi/error.h"
 #include "ui/console.h"
 #include "hw/arm/omap.h"
@@ -86,15 +87,15 @@ static const MemoryRegionOps static_ops = {
     .endianness = DEVICE_NATIVE_ENDIAN,
 };
 
-#define sdram_size	0x02000000
-#define sector_size	(128 * 1024)
-#define flash0_size	(16 * 1024 * 1024)
-#define flash1_size	( 8 * 1024 * 1024)
-#define flash2_size	(32 * 1024 * 1024)
+#define SDRAM_SIZE      (32 * MiB)
+#define SECTOR_SIZE     (128 * KiB)
+#define FLASH0_SIZE     (16 * MiB)
+#define FLASH1_SIZE     (8 * MiB)
+#define FLASH2_SIZE     (32 * MiB)
 
 static struct arm_boot_info sx1_binfo = {
     .loader_start = OMAP_EMIFF_BASE,
-    .ram_size = sdram_size,
+    .ram_size = SDRAM_SIZE,
     .board_id = 0x265,
 };
 
@@ -111,7 +112,7 @@ static void sx1_init(MachineState *machine, const int version)
     static uint32_t cs3val = 0x00001139;
     DriveInfo *dinfo;
     int fl_idx;
-    uint32_t flash_size = flash0_size;
+    uint32_t flash_size = FLASH0_SIZE;
 
     if (machine->ram_size != mc->default_ram_size) {
         char *sz = size_to_str(mc->default_ram_size);
@@ -121,7 +122,7 @@ static void sx1_init(MachineState *machine, const int version)
     }
 
     if (version == 2) {
-        flash_size = flash2_size;
+        flash_size = FLASH2_SIZE;
     }
 
     memory_region_add_subregion(address_space, OMAP_EMIFF_BASE, machine->ram);
@@ -154,7 +155,7 @@ static void sx1_init(MachineState *machine, const int version)
         if (!pflash_cfi01_register(OMAP_CS0_BASE,
                                    "omap_sx1.flash0-1", flash_size,
                                    blk_by_legacy_dinfo(dinfo),
-                                   sector_size, 4, 0, 0, 0, 0, 0)) {
+                                   SECTOR_SIZE, 4, 0, 0, 0, 0, 0)) {
             fprintf(stderr, "qemu: Error registering flash memory %d.\n",
                            fl_idx);
         }
@@ -165,18 +166,18 @@ static void sx1_init(MachineState *machine, const int version)
             (dinfo = drive_get(IF_PFLASH, 0, fl_idx)) != NULL) {
         MemoryRegion *flash_1 = g_new(MemoryRegion, 1);
         memory_region_init_rom(flash_1, NULL, "omap_sx1.flash1-0",
-                               flash1_size, &error_fatal);
+                               FLASH1_SIZE, &error_fatal);
         memory_region_add_subregion(address_space, OMAP_CS1_BASE, flash_1);
 
         memory_region_init_io(&cs[1], NULL, &static_ops, &cs1val,
-                              "sx1.cs1", OMAP_CS1_SIZE - flash1_size);
+                              "sx1.cs1", OMAP_CS1_SIZE - FLASH1_SIZE);
         memory_region_add_subregion(address_space,
-                                OMAP_CS1_BASE + flash1_size, &cs[1]);
+                                OMAP_CS1_BASE + FLASH1_SIZE, &cs[1]);
 
         if (!pflash_cfi01_register(OMAP_CS1_BASE,
-                                   "omap_sx1.flash1-1", flash1_size,
+                                   "omap_sx1.flash1-1", FLASH1_SIZE,
                                    blk_by_legacy_dinfo(dinfo),
-                                   sector_size, 4, 0, 0, 0, 0, 0)) {
+                                   SECTOR_SIZE, 4, 0, 0, 0, 0, 0)) {
             fprintf(stderr, "qemu: Error registering flash memory %d.\n",
                            fl_idx);
         }
@@ -218,7 +219,7 @@ static void sx1_machine_v2_class_init(ObjectClass *oc, void *data)
     mc->init = sx1_init_v2;
     mc->ignore_memory_transaction_failures = true;
     mc->default_cpu_type = ARM_CPU_TYPE_NAME("ti925t");
-    mc->default_ram_size = sdram_size;
+    mc->default_ram_size = SDRAM_SIZE;
     mc->default_ram_id = "omap1.dram";
 }
 
@@ -236,7 +237,7 @@ static void sx1_machine_v1_class_init(ObjectClass *oc, void *data)
     mc->init = sx1_init_v1;
     mc->ignore_memory_transaction_failures = true;
     mc->default_cpu_type = ARM_CPU_TYPE_NAME("ti925t");
-    mc->default_ram_size = sdram_size;
+    mc->default_ram_size = SDRAM_SIZE;
     mc->default_ram_id = "omap1.dram";
 }
 
-- 
2.38.1

