Received: by 2002:a17:504:14cd:b0:1be9:327d:8ee3 with SMTP id g13csp3087806njc;
        Tue, 15 Apr 2025 20:44:41 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUdCJLV8xCROgw6g3qb3gKZM1qhwxgHSlDhiBhBFu/JU+SLwch2jZw2hBMT2sivT+69TrXUUJHp8fOg6Q==@linaro.org
X-Google-Smtp-Source: AGHT+IGwZQV6MrVdXf9z5rpZ5Zqusu1SLZYY7l4X/QfePd98o9vcdSdI39BTXBC9PuXvP/azeEov
X-Received: by 2002:a05:620a:31a6:b0:7c5:43c2:a907 with SMTP id af79cd13be357-7c919004192mr33159385a.26.1744775081634;
        Tue, 15 Apr 2025 20:44:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1744775081; cv=none;
        d=google.com; s=arc-20240605;
        b=VRvwMoke55/BX6wscQhYSzND3zuFk3Vggg2My4GTx+k5MRWS95ugCijLJz9JyD9L53
         cntBY7Ld/RcZz7Cqy4Spnaxn21+zCJPUyenpiYvPbo6m1YeeK1t7y8s1sqvgiV05VtLX
         EL6dyydABEXjhJwJez5sAHFBlXXhzJpFhYnrkQJdXiWZhVtCU0hm+shokQvBkhgAU+F4
         GFlC3kZu0ZS95BADWGTS/o3xwF7E7g0X3wRZHba/z9edc5W+KB9AgE11y/eeYPCp5drn
         T4EvITOWQavrznWEiWwDue8JQ3lKQXpkJVn2HGbmFbXAJ/jSZ9jUTLLf/qviLUu7LI1I
         CQPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=G5kcViJHLtneV8Z8zv9b3SsDe6xsQ3yIe0EplsozUqY=;
        fh=9slMQvAVAaDbZF94sUZsatNqTIKawFKtbOHuc7HAk0w=;
        b=ll7OIvJGNaRgdifERTFND3LPKHZG/C3Iyf7b16s35nqHkVmZWGPAyDrtRl5jYTTK2F
         8pcpJBH8sOuqnKnR/cHTiYh8mefAJWu9B/n1wlcs3vH5nZoktjsK4qsOLLgc9L436K7E
         OI5dt9AT2q47NZb73HbX0JDEwPUE/7BXKA2I827MXz3G56SdarabU7VAKYQ+WoI1Qid+
         FlSgXMTUuZcoBRPFM2KtkkbiMnOqft4BkFgTZUK6JpoQDDwaSeBUX+hG6z1okzp4ysye
         EmJixKbwiC9bcg9r99JN1gYM8fr1gAIR0ASJv5St6cJN/5ZRE8jZLKZ3KwaLiOKnMEpn
         MRnA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c7a8a0c89esi1173446085a.385.2025.04.15.20.44.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 15 Apr 2025 20:44:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1u4th9-0001to-IM; Tue, 15 Apr 2025 23:44:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1u4th4-0001ra-TL; Tue, 15 Apr 2025 23:44:12 -0400
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1u4th1-0006uD-Ee; Tue, 15 Apr 2025 23:44:09 -0400
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Wed, 16 Apr
 2025 11:43:29 +0800
Received: from mail.aspeedtech.com (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Wed, 16 Apr 2025 11:43:29 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Steven Lee <steven_lee@aspeedtech.com>, Troy Lee
 <leetroy@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, "Joel
 Stanley" <joel@jms.id.au>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>, "open list:ASPEED BMCs" <qemu-arm@nongnu.org>
CC: <jamin_lin@aspeedtech.com>, <troy_lee@aspeedtech.com>,
 <nabihestefan@google.com>
Subject: [PATCH v3 05/10] hw/arm/aspeed: Add support for loading vbootrom
 image via "-bios"
Date: Wed, 16 Apr 2025 11:43:20 +0800
Message-ID: <20250416034327.315714-6-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250416034327.315714-1-jamin_lin@aspeedtech.com>
References: <20250416034327.315714-1-jamin_lin@aspeedtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: pass client-ip=211.20.114.72;
 envelope-from=jamin_lin@aspeedtech.com; helo=TWMBX01.aspeed.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_FAIL=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-to:  Jamin Lin <jamin_lin@aspeedtech.com>
From:  Jamin Lin via <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: hF8qZohV7MaI

Introduce "aspeed_load_vbootrom()" to support loading a virtual boot ROM image
into the vbootrom memory region, using the "-bios" command-line option.

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
---
 include/hw/arm/aspeed.h |  1 +
 hw/arm/aspeed.c         | 36 ++++++++++++++++++++++++++++++++++++
 2 files changed, 37 insertions(+)

diff --git a/include/hw/arm/aspeed.h b/include/hw/arm/aspeed.h
index 973277bea6..2b8332a7d7 100644
--- a/include/hw/arm/aspeed.h
+++ b/include/hw/arm/aspeed.h
@@ -41,6 +41,7 @@ struct AspeedMachineClass {
     uint32_t uart_default;
     bool sdhci_wp_inverted;
     bool vbootrom;
+    const char *vbootrom_name;
 };
 
 
diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index b70a120e62..7f11371f02 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -27,6 +27,7 @@
 #include "system/reset.h"
 #include "hw/loader.h"
 #include "qemu/error-report.h"
+#include "qemu/datadir.h"
 #include "qemu/units.h"
 #include "hw/qdev-clock.h"
 #include "system/system.h"
@@ -305,6 +306,34 @@ static void aspeed_install_boot_rom(AspeedMachineState *bmc, BlockBackend *blk,
                    rom_size, &error_abort);
 }
 
+/*
+ * This function locates the vbootrom image file specified via the command line
+ * using the -bios option. It loads the specified image into the vbootrom
+ * memory region and handles errors if the file cannot be found or loaded.
+ */
+static void aspeed_load_vbootrom(MachineState *machine, uint64_t rom_size,
+                                 Error **errp)
+{
+    AspeedMachineState *bmc = ASPEED_MACHINE(machine);
+    AspeedMachineClass *amc = ASPEED_MACHINE_GET_CLASS(machine);
+    const char *bios_name = machine->firmware ?: amc->vbootrom_name;
+    g_autofree char *filename = NULL;
+    AspeedSoCState *soc = bmc->soc;
+    int ret;
+
+    filename = qemu_find_file(QEMU_FILE_TYPE_BIOS, bios_name);
+    if (!filename) {
+        error_setg(errp, "Could not find vbootrom image '%s'", bios_name);
+        return;
+    }
+
+    ret = load_image_mr(filename, &soc->vbootrom);
+    if (ret < 0) {
+        error_setg(errp, "Failed to load vbootrom image '%s'", bios_name);
+        return;
+    }
+}
+
 void aspeed_board_init_flashes(AspeedSMCState *s, const char *flashtype,
                                       unsigned int count, int unit0)
 {
@@ -483,6 +512,11 @@ static void aspeed_machine_init(MachineState *machine)
         }
     }
 
+    if (amc->vbootrom) {
+        rom_size = memory_region_size(&bmc->soc->vbootrom);
+        aspeed_load_vbootrom(machine, rom_size, &error_abort);
+    }
+
     arm_load_kernel(ARM_CPU(first_cpu), machine, &aspeed_board_binfo);
 }
 
@@ -1691,6 +1725,7 @@ static void aspeed_machine_ast2700a0_evb_class_init(ObjectClass *oc, void *data)
     amc->uart_default = ASPEED_DEV_UART12;
     amc->i2c_init  = ast2700_evb_i2c_init;
     amc->vbootrom = true;
+    amc->vbootrom_name = "ast27x0_bootrom.bin";
     mc->auto_create_sdcard = true;
     mc->default_ram_size = 1 * GiB;
     aspeed_machine_class_init_cpus_defaults(mc);
@@ -1712,6 +1747,7 @@ static void aspeed_machine_ast2700a1_evb_class_init(ObjectClass *oc, void *data)
     amc->uart_default = ASPEED_DEV_UART12;
     amc->i2c_init  = ast2700_evb_i2c_init;
     amc->vbootrom = true;
+    amc->vbootrom_name = "ast27x0_bootrom.bin";
     mc->auto_create_sdcard = true;
     mc->default_ram_size = 1 * GiB;
     aspeed_machine_class_init_cpus_defaults(mc);
-- 
2.43.0

