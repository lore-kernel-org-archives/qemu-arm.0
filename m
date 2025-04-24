Received: by 2002:a17:504:17c4:b0:1be9:327d:8ee3 with SMTP id o4csp3532749njd;
        Thu, 24 Apr 2025 00:52:27 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWXaS6LpHCtoQ6od09WFdrr7yhnjCZJ45lkSL0WxrWKtEzqyYP6Y2KczW0X01M7eRkI6Q8j/Uugkw7ljw==@linaro.org
X-Google-Smtp-Source: AGHT+IGS6zIFP6L+15O0vEux7hKeCWpiNb3Irfk1M38JhXF3dtuENZCdPshHerlC0aycPLDs5VAw
X-Received: by 2002:a05:6214:b61:b0:6ea:d40e:2bc5 with SMTP id 6a1803df08f44-6f4bfbc626emr27579776d6.9.1745481147220;
        Thu, 24 Apr 2025 00:52:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1745481147; cv=none;
        d=google.com; s=arc-20240605;
        b=CgfVU06X9LJLHjJnluzTHH2PpSiaQ4WkEoMTFQPbIIuKT9l96N5A7XXPj88zR9HZxb
         3NaKsPFNdiBU4On0iMVEM5oqOCDIul0MBE0Nddc2QHnNuZoU6tF4aeoHqoMoY1xIpGqi
         g2PyvD8K74U0xndsdK1exYmPpsXsdEZEkPvxOXfvZG3f+v8V00H0lpBjXldJsMskYVuU
         EwoxxQIbtw6xVXneLln2l9MW0jfoiUo6bTYKi/Rble1neGr636U2lFI2rHipb/+U6w3h
         d8OgcKqg+DiggbcfnH7IJtJB775nQGbSun5tPE544Qx/sLMdfNEfYwrchli4d6rk2PkU
         K6OA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=SZ1Mk3wi7Yiaw5RuukZZaYLKnEmPkpUgOz2JLx5xecE=;
        fh=9slMQvAVAaDbZF94sUZsatNqTIKawFKtbOHuc7HAk0w=;
        b=JNajOpX/GGqPBR49BMjV5SMab58hhbbSXU9ya4jznnf0t8V7VNjWUnvuR6P27F4sN/
         jDzNAymOM65uGMFCpQL25kWgMvAEAeL2nBmw+ldhe0IkEjSAoK/IF96/Ps/Jeu6azc6U
         mJIWytBo+pGsbG8+v7qK9LfwFo7Y6AJ+cDA4FzQXVfifXsKwYR68knOQnFmyKGbO2DZW
         UqUr9qS195H8noEHgmv2qhTx+mRuebf/jkoLNF8kGcgjS2bdwbTl8Qt1JZ5uA+ij/aF/
         8bzy49r5XGYNkrrfWyU2uOTBkMXhA4S2J9MznSJJJhEC5IrMpUps2O44alrUziX+VZY6
         LhMA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6f4c0acc9e6si9800036d6.263.2025.04.24.00.52.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 24 Apr 2025 00:52:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1u7rNI-0001N3-UL; Thu, 24 Apr 2025 03:52:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1u7rNG-0001MR-T0; Thu, 24 Apr 2025 03:51:58 -0400
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1u7rNF-0006ez-4e; Thu, 24 Apr 2025 03:51:58 -0400
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Thu, 24 Apr
 2025 15:51:37 +0800
Received: from mail.aspeedtech.com (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Thu, 24 Apr 2025 15:51:37 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Steven Lee <steven_lee@aspeedtech.com>, Troy Lee
 <leetroy@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, "Joel
 Stanley" <joel@jms.id.au>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>, "open list:ASPEED BMCs" <qemu-arm@nongnu.org>
CC: <jamin_lin@aspeedtech.com>, <troy_lee@aspeedtech.com>,
 <nabihestefan@google.com>
Subject: [PATCH v6 3/6] hw/arm/aspeed: Add support for loading vbootrom image
 via "-bios"
Date: Thu, 24 Apr 2025 15:51:31 +0800
Message-ID: <20250424075135.3715128-4-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250424075135.3715128-1-jamin_lin@aspeedtech.com>
References: <20250424075135.3715128-1-jamin_lin@aspeedtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: pass client-ip=211.20.114.72;
 envelope-from=jamin_lin@aspeedtech.com; helo=TWMBX01.aspeed.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
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
X-TUID: kchABsRqg2rk

Introduce "aspeed_load_vbootrom()" to support loading a virtual boot ROM image
into the vbootrom memory region, using the "-bios" command-line option.

Introduce a new "vbootrom" field in the AspeedMachineClass to indicate whether
a machine supports the virtual boot ROM region.

Set this field to true by default for the AST2700-A0 and AST2700-A1 EVB
machines.

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
Reviewed-by: Nabih Estefan <nabihestefan@google.com>
Tested-by: Nabih Estefan <nabihestefan@google.com>
---
 include/hw/arm/aspeed.h |  1 +
 hw/arm/aspeed.c         | 36 ++++++++++++++++++++++++++++++++++++
 2 files changed, 37 insertions(+)

diff --git a/include/hw/arm/aspeed.h b/include/hw/arm/aspeed.h
index 9cae45a1c9..973277bea6 100644
--- a/include/hw/arm/aspeed.h
+++ b/include/hw/arm/aspeed.h
@@ -40,6 +40,7 @@ struct AspeedMachineClass {
     void (*i2c_init)(AspeedMachineState *bmc);
     uint32_t uart_default;
     bool sdhci_wp_inverted;
+    bool vbootrom;
 };
 
 
diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index 82f42582fa..32846bd088 100644
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
@@ -305,6 +306,33 @@ static void aspeed_install_boot_rom(AspeedMachineState *bmc, BlockBackend *blk,
                    rom_size, &error_abort);
 }
 
+#define VBOOTROM_FILE_NAME  "ast27x0_bootrom.bin"
+
+/*
+ * This function locates the vbootrom image file specified via the command line
+ * using the -bios option. It loads the specified image into the vbootrom
+ * memory region and handles errors if the file cannot be found or loaded.
+ */
+static void aspeed_load_vbootrom(AspeedMachineState *bmc, const char *bios_name,
+                                 Error **errp)
+{
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
@@ -380,6 +408,7 @@ static void aspeed_machine_init(MachineState *machine)
     AspeedMachineClass *amc = ASPEED_MACHINE_GET_CLASS(machine);
     AspeedSoCClass *sc;
     int i;
+    const char *bios_name = NULL;
     DriveInfo *emmc0 = NULL;
     bool boot_emmc;
 
@@ -482,6 +511,11 @@ static void aspeed_machine_init(MachineState *machine)
         }
     }
 
+    if (amc->vbootrom) {
+        bios_name = machine->firmware ?: VBOOTROM_FILE_NAME;
+        aspeed_load_vbootrom(bmc, bios_name, &error_abort);
+    }
+
     arm_load_kernel(ARM_CPU(first_cpu), machine, &aspeed_board_binfo);
 }
 
@@ -1689,6 +1723,7 @@ static void aspeed_machine_ast2700a0_evb_class_init(ObjectClass *oc, void *data)
     amc->macs_mask = ASPEED_MAC0_ON | ASPEED_MAC1_ON | ASPEED_MAC2_ON;
     amc->uart_default = ASPEED_DEV_UART12;
     amc->i2c_init  = ast2700_evb_i2c_init;
+    amc->vbootrom = true;
     mc->auto_create_sdcard = true;
     mc->default_ram_size = 1 * GiB;
     aspeed_machine_class_init_cpus_defaults(mc);
@@ -1709,6 +1744,7 @@ static void aspeed_machine_ast2700a1_evb_class_init(ObjectClass *oc, void *data)
     amc->macs_mask = ASPEED_MAC0_ON | ASPEED_MAC1_ON | ASPEED_MAC2_ON;
     amc->uart_default = ASPEED_DEV_UART12;
     amc->i2c_init  = ast2700_evb_i2c_init;
+    amc->vbootrom = true;
     mc->auto_create_sdcard = true;
     mc->default_ram_size = 1 * GiB;
     aspeed_machine_class_init_cpus_defaults(mc);
-- 
2.43.0

