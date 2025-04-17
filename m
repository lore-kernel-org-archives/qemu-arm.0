Received: by 2002:a17:504:749a:b0:1be9:327d:8ee3 with SMTP id a26csp511863njk;
        Wed, 16 Apr 2025 20:14:26 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUJZVgjPmK2j5pABfzaUKRc58qGHeie5WctrExukjPGuRUJIjCKcaOds5FXk5z/cg/bCEMsD8MmLoLs/g==@linaro.org
X-Google-Smtp-Source: AGHT+IF3WQgTLkhkm0dqvQV6MAoCrhXPT0otDFuFua0a6ifvSvgUCuWTTJERYCVIsMM1W6IfUytv
X-Received: by 2002:a05:622a:164e:b0:471:f185:cdcf with SMTP id d75a77b69052e-47ad8171636mr55787881cf.51.1744859665841;
        Wed, 16 Apr 2025 20:14:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1744859665; cv=none;
        d=google.com; s=arc-20240605;
        b=S+h5okk+3mFnIG7kjeA/S6HOCTZyhPnGrhmLJB3sASvFN3mLXg1vUoV/xTpNOYJSF5
         m4VU2hX8hFib2I5tgZ3THJlVykqRrBw7RyDAwGQU8Z91Poxui1ou7G646dQKiZQEHcqg
         9LdVgsweto+5KDGo2hkJb0zEmv/Nyv6QG92eOCmJnbJBaxM0mE+SJGTy4b9birM7VeAB
         9MuzfvPTxCogOoamQ/eanZbN3+3SgC1dy1FTCzxyVUvbY/b5G7kHRoYQpQTcsaNmsTsF
         zDt34vSDwVt814orYKO6fE6mArqV7bsrjX4qN838BOWEJ/PvtKS1XsDJhVMSK4Li5Nd/
         c4+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=yPnBDJ1kmzUVVsxm6NEzP6scM4w3NhFuGs0qR7sVbpQ=;
        fh=9slMQvAVAaDbZF94sUZsatNqTIKawFKtbOHuc7HAk0w=;
        b=OouHvYrRCdkz5BjrW7sLy7RCbmnomhg/tBGfEN0W6skkgvTqdbCHl/B2CHjvDn4Oi6
         u0X8DJEYcRypXkganSKa5bCkW5sQOosVKPSxg7fvbppiWUyiLSPVmDWTqlY/F4OU2zdy
         2GkHmh3t42shQsFZhNJ2ZkmInigAAg2g8OBk7Bd1ag88P1Gz3a/G90sB6A5bTwCf4cPB
         OhfZJ0Cm7MPVEhRNYTXm+qy8LbBkIas3VtBdc+WIWKPSw6KxcwK1hxF8ERtXpsccn3yS
         rB/Exe8jpT0ZNcabQx5VbZTcIOREknHCEpwZYyE5Miuvj9UDSBhNYbc4/raqW6HPa/9/
         NazA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4796edd408esi152897781cf.444.2025.04.16.20.14.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 16 Apr 2025 20:14:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1u5Fg3-0000xU-0k; Wed, 16 Apr 2025 23:12:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1u5Fg0-0000wi-DJ; Wed, 16 Apr 2025 23:12:32 -0400
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1u5Ffy-0000cO-NT; Wed, 16 Apr 2025 23:12:32 -0400
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Thu, 17 Apr
 2025 11:12:11 +0800
Received: from mail.aspeedtech.com (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Thu, 17 Apr 2025 11:12:11 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Steven Lee <steven_lee@aspeedtech.com>, Troy Lee
 <leetroy@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, "Joel
 Stanley" <joel@jms.id.au>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>, "open list:ASPEED BMCs" <qemu-arm@nongnu.org>
CC: <jamin_lin@aspeedtech.com>, <troy_lee@aspeedtech.com>,
 <nabihestefan@google.com>
Subject: [PATCH v4 06/10] hw/arm/aspeed: Add support for loading vbootrom
 image via "-bios"
Date: Thu, 17 Apr 2025 11:12:03 +0800
Message-ID: <20250417031209.2647703-7-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250417031209.2647703-1-jamin_lin@aspeedtech.com>
References: <20250417031209.2647703-1-jamin_lin@aspeedtech.com>
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
Reply-to:  Jamin Lin <jamin_lin@aspeedtech.com>
From:  Jamin Lin via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: pTMB2VRwqO0Z

Introduce "aspeed_load_vbootrom()" to support loading a virtual boot ROM image
into the vbootrom memory region, using the "-bios" command-line option.

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
Reviewed-by: Nabih Estefan <nabihestefan@google.com>
Tested-by: Nabih Estefan <nabihestefan@google.com>
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

