Received: by 2002:a19:3859:0:0:0:0:0 with SMTP id d25csp1228282lfj;
        Tue, 3 May 2022 00:08:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwAqYqEDPvtcvwQXCJjld8096ENiCmHGZUXpAAiP243+lCiuegpVeYOd3dEtXdyHjuiKl5z
X-Received: by 2002:a05:620a:4507:b0:69f:c12f:d4d2 with SMTP id t7-20020a05620a450700b0069fc12fd4d2mr10770766qkp.172.1651561688254;
        Tue, 03 May 2022 00:08:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1651561688; cv=none;
        d=google.com; s=arc-20160816;
        b=wB359QAXOYsQxVzRvi+XsmD80NvWOB02NY+2Vhcip/Wp0VWMifL3o98aznKnKHNs8/
         QsuedbtI5vvvVq+62zQKzcpn61K/NxFFe/wdCp4dlhhk5/LN4b7DTKuYlSFys/FwR5c7
         GDES7U21oZOsDZ7mCmPgkEoNkH0UkW5axna30FWLVE/jBYsLMkD7lt9KmdXcue6dJqSi
         SSzqr7/qdrcPGMr5NxklKPm2RP+JHBFJ8SN03Huklw1xAAWXKIItZk2FSJrezSch1OZa
         mBzt+ftW1hAjfjZ9DUhslDVMbNJQIPs+7mcybBkI0pt95j7js/xh+uIPheyKmA2PdO+P
         3rpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=zJtnzHPhzBQfevbplLSPzPalgDPpd3oIvf17kiLcOlo=;
        b=Ds/u6BGsBHq30D3BWzA5ekxbyjHtTZXY5J3dGahf7ndBhFJGMuQmpBQpbv/okGQXmm
         iPwUhK7WopUwvv5Jc6d2A4zEolm+/VI85pehtSpsCsMBSRmO9ItX2WgKui/kvfd2LMnc
         7+6xf8Og088onZ3SO0yLo5mZiDjXRjLBSry6rvv2TnI9Par5WvvDJa3N5k6iTn7r2hx4
         gm6jDtMQU028p03VFSy94YmRnr4caaUboqom6GG+Ku9kSvKq++hg0U9Kc5HNyMInHonw
         Gn1TB2bFw232McYZoQlYZ+ifZkjRQmgQStsL9COa+CxiftdVpBsO5FOUh5o9LFFLryD0
         Emfg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id az44-20020a05620a172c00b0067e4be23880si7817194qkb.197.2022.05.03.00.08.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 03 May 2022 00:08:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:46626 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nlmdj-0007wm-MP
	for alex.bennee@linaro.org; Tue, 03 May 2022 03:08:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49132)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=XF6a=VL=kaod.org=clg@ozlabs.org>)
 id 1nlmVN-0003NR-6U; Tue, 03 May 2022 02:59:30 -0400
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3]:54197
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=XF6a=VL=kaod.org=clg@ozlabs.org>)
 id 1nlmVL-0007VT-FF; Tue, 03 May 2022 02:59:28 -0400
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4KsrRd14N2z4ySc;
 Tue,  3 May 2022 16:59:25 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4KsrRZ63qqz4yST;
 Tue,  3 May 2022 16:59:22 +1000 (AEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Jamin Lin <jamin_lin@aspeedtech.com>, Troy Lee <troy_lee@aspeedtech.com>,
 Steven Lee <steven_lee@aspeedtech.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PULL 12/19] aspeed: Add an AST1030 eval board
Date: Tue,  3 May 2022 08:58:41 +0200
Message-Id: <20220503065848.125215-13-clg@kaod.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220503065848.125215-1-clg@kaod.org>
References: <20220503065848.125215-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2404:9400:2221:ea00::3;
 envelope-from=SRS0=XF6a=VL=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: tGRpIc4roU1v

From: Jamin Lin <jamin_lin@aspeedtech.com>

The image should be supplied with ELF binary.
$ qemu-system-arm -M ast1030-evb -kernel zephyr.elf -nographic

Signed-off-by: Troy Lee <troy_lee@aspeedtech.com>
Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
Signed-off-by: Steven Lee <steven_lee@aspeedtech.com>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
Message-Id: <20220401083850.15266-9-jamin_lin@aspeedtech.com>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/arm/aspeed.c | 66 +++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 66 insertions(+)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index d205384d986f..4e27060324d6 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -24,6 +24,7 @@
 #include "hw/loader.h"
 #include "qemu/error-report.h"
 #include "qemu/units.h"
+#include "hw/qdev-clock.h"
 
 static struct arm_boot_info aspeed_board_binfo = {
     .board_id = -1, /* device-tree-only board */
@@ -1292,6 +1293,67 @@ static void aspeed_machine_bletchley_class_init(ObjectClass *oc, void *data)
         aspeed_soc_num_cpus(amc->soc_name);
 }
 
+#define AST1030_INTERNAL_FLASH_SIZE (1024 * 1024)
+/* Main SYSCLK frequency in Hz (200MHz) */
+#define SYSCLK_FRQ 200000000ULL
+
+static void aspeed_minibmc_machine_init(MachineState *machine)
+{
+    AspeedMachineState *bmc = ASPEED_MACHINE(machine);
+    AspeedMachineClass *amc = ASPEED_MACHINE_GET_CLASS(machine);
+    Clock *sysclk;
+
+    sysclk = clock_new(OBJECT(machine), "SYSCLK");
+    clock_set_hz(sysclk, SYSCLK_FRQ);
+
+    object_initialize_child(OBJECT(machine), "soc", &bmc->soc, amc->soc_name);
+    qdev_connect_clock_in(DEVICE(&bmc->soc), "sysclk", sysclk);
+
+    qdev_prop_set_uint32(DEVICE(&bmc->soc), "uart-default",
+                         amc->uart_default);
+    qdev_realize(DEVICE(&bmc->soc), NULL, &error_abort);
+
+    aspeed_board_init_flashes(&bmc->soc.fmc,
+                              bmc->fmc_model ? bmc->fmc_model : amc->fmc_model,
+                              amc->num_cs,
+                              0);
+
+    aspeed_board_init_flashes(&bmc->soc.spi[0],
+                              bmc->spi_model ? bmc->spi_model : amc->spi_model,
+                              amc->num_cs, amc->num_cs);
+
+    aspeed_board_init_flashes(&bmc->soc.spi[1],
+                              bmc->spi_model ? bmc->spi_model : amc->spi_model,
+                              amc->num_cs, (amc->num_cs * 2));
+
+    if (amc->i2c_init) {
+        amc->i2c_init(bmc);
+    }
+
+    armv7m_load_kernel(ARM_CPU(first_cpu),
+                       machine->kernel_filename,
+                       AST1030_INTERNAL_FLASH_SIZE);
+}
+
+static void aspeed_minibmc_machine_ast1030_evb_class_init(ObjectClass *oc,
+                                                          void *data)
+{
+    MachineClass *mc = MACHINE_CLASS(oc);
+    AspeedMachineClass *amc = ASPEED_MACHINE_CLASS(oc);
+
+    mc->desc = "Aspeed AST1030 MiniBMC (Cortex-M4)";
+    amc->soc_name = "ast1030-a1";
+    amc->hw_strap1 = 0;
+    amc->hw_strap2 = 0;
+    mc->init = aspeed_minibmc_machine_init;
+    mc->default_ram_size = 0;
+    mc->default_cpus = mc->min_cpus = mc->max_cpus = 1;
+    amc->fmc_model = "sst25vf032b";
+    amc->spi_model = "sst25vf032b";
+    amc->num_cs = 2;
+    amc->macs_mask = 0;
+}
+
 static const TypeInfo aspeed_machine_types[] = {
     {
         .name          = MACHINE_TYPE_NAME("palmetto-bmc"),
@@ -1349,6 +1411,10 @@ static const TypeInfo aspeed_machine_types[] = {
         .name          = MACHINE_TYPE_NAME("bletchley-bmc"),
         .parent        = TYPE_ASPEED_MACHINE,
         .class_init    = aspeed_machine_bletchley_class_init,
+    }, {
+        .name           = MACHINE_TYPE_NAME("ast1030-evb"),
+        .parent         = TYPE_ASPEED_MACHINE,
+        .class_init     = aspeed_minibmc_machine_ast1030_evb_class_init,
     }, {
         .name          = TYPE_ASPEED_MACHINE,
         .parent        = TYPE_MACHINE,
-- 
2.35.1

