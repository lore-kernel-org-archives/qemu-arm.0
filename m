Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp7184707ejc;
        Wed, 1 Mar 2023 08:59:24 -0800 (PST)
X-Google-Smtp-Source: AK7set86f/KWBNg+bjEGZ6tcIPL5dV+KEKw/A4PLcPeUe+pP2nsteyd8mcpFsFE5JvN3LE8/7rlH
X-Received: by 2002:ac8:5bc4:0:b0:3bf:d7f8:4f85 with SMTP id b4-20020ac85bc4000000b003bfd7f84f85mr14441457qtb.12.1677689964760;
        Wed, 01 Mar 2023 08:59:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677689964; cv=none;
        d=google.com; s=arc-20160816;
        b=UpEvQXo3OBSy9KYMypqPw0aLFRW0iX09gh9A9lnW887vpYKXh5XMsmJ+fZ1m4vXRZ4
         L/wHTyTVtwslQvrTPtC72DEufQGVyDQC4AhWvSRRJfDh7XPZPM7fmCHTvMWFjiRKpJCT
         bzT6Fmf1A5938KZLWefilVLhyC+C8xyZJ2NEiqTIy7vd/nUHaKDP9X4ZVJ7N6Jo6lPAv
         LhMOCdEJVvuFrv0N0rHYbATYkaTCEu7yi1KStxubRif5gYL/7F0UmKZTgq1k/+fKdl+W
         99Ro6SXs7ym7JpU4j1f9RVgv7TJjja7Mj0p42VP/0MuPzmguW3xkFbcrVrMjb1Upo3Fn
         4ehg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=WXgnSl2n/9kLyAnnyQ/FBhaZmAMxALv70qrF85KJVK4=;
        b=x2m/mCsUUhMTfjKeEEf4d+ILdcC1uX5m7+mOlEHcX+LBRkFN8v3MJZMa3Ewg2e1wq6
         yVKXfxd/IDVSgTKrRKZlXKzTSXWCcjtTlj7c4E39/tOI5pue43YJHGS2OKfFH1YcWQvL
         OaT3nmwy0hRoWKXNeJJmnVmcaqmsA6QzEvDdcg9r3LIncSXE62DNbFBqyqlfSh9BYzSZ
         Bk9RJW8+Nzfmh1XKqTBLSZuONmXRJMxcWQkOxStpppsce13N4OmD1BD5zzf+Lbn/lbEE
         oQMdAXtV9CLL7Siakb2sb6R5Nx+nsycuUOjlOYTnSXZcVjF1mUZjlzhAnbyAZaTgN9e2
         Me4A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z18-20020a05622a061200b003b63338abc6si12099183qta.12.2023.03.01.08.59.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 01 Mar 2023 08:59:24 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pXPl5-0000hs-AL; Wed, 01 Mar 2023 11:56:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=znpK=6Z=kaod.org=clg@ozlabs.org>)
 id 1pXPl4-0000hK-BO; Wed, 01 Mar 2023 11:56:50 -0500
Received: from gandalf.ozlabs.org ([150.107.74.76])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=znpK=6Z=kaod.org=clg@ozlabs.org>)
 id 1pXPl2-0007eu-C1; Wed, 01 Mar 2023 11:56:50 -0500
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4PRgPV0Zn6z4xDl;
 Thu,  2 Mar 2023 03:56:46 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4PRgPR5lvlz4x5Y;
 Thu,  2 Mar 2023 03:56:43 +1100 (AEDT)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@aj.id.au>,
 Karthikeyan Pasupathi <pkarthikeyan1509@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH v2 05/11] hw/arm/aspeed: Adding new machine Yosemitev2 in QEMU
Date: Wed,  1 Mar 2023 17:56:13 +0100
Message-Id: <20230301165619.2171090-6-clg@kaod.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230301165619.2171090-1-clg@kaod.org>
References: <20230301165619.2171090-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=SRS0=znpK=6Z=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-TUID: yGegYmvvfMf8

From: Karthikeyan Pasupathi <pkarthikeyan1509@gmail.com>

This patch support Yosemitev2 in QEMU environment.
and introduced EEPROM BMC FRU data support "add fbyv2_bmc_fruid data"
along with the machine support.

Signed-off-by: Karthikeyan Pasupathi <pkarthikeyan1509@gmail.com>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
[ clg: - commit log topic update
       - Documentation update ]
Message-Id: <20230216133326.216017-1-pkarthikeyan1509@gmail.com>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 docs/system/arm/aspeed.rst |  1 +
 hw/arm/aspeed_eeprom.h     |  3 +++
 hw/arm/aspeed.c            | 31 +++++++++++++++++++++++++++++++
 hw/arm/aspeed_eeprom.c     | 23 +++++++++++++++++++++++
 4 files changed, 58 insertions(+)

diff --git a/docs/system/arm/aspeed.rst b/docs/system/arm/aspeed.rst
index 6c5b05128e..1d69b68591 100644
--- a/docs/system/arm/aspeed.rst
+++ b/docs/system/arm/aspeed.rst
@@ -24,6 +24,7 @@ AST2500 SoC based machines :
 - ``sonorapass-bmc``       OCP SonoraPass BMC
 - ``fp5280g2-bmc``         Inspur FP5280G2 BMC
 - ``g220a-bmc``            Bytedance G220A BMC
+- ``yosemitev2-bmc``       Facebook YosemiteV2 BMC
 
 AST2600 SoC based machines :
 
diff --git a/hw/arm/aspeed_eeprom.h b/hw/arm/aspeed_eeprom.h
index a0f848fa6e..edf18e9685 100644
--- a/hw/arm/aspeed_eeprom.h
+++ b/hw/arm/aspeed_eeprom.h
@@ -16,4 +16,7 @@ extern const size_t fby35_nic_fruid_len;
 extern const size_t fby35_bb_fruid_len;
 extern const size_t fby35_bmc_fruid_len;
 
+extern const uint8_t yosemitev2_bmc_fruid[];
+extern const size_t yosemitev2_bmc_fruid_len;
+
 #endif
diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index 27dda58338..3f992fea46 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -521,6 +521,15 @@ static void ast2600_evb_i2c_init(AspeedMachineState *bmc)
                      TYPE_TMP105, 0x4d);
 }
 
+static void yosemitev2_bmc_i2c_init(AspeedMachineState *bmc)
+{
+    AspeedSoCState *soc = &bmc->soc;
+
+    at24c_eeprom_init(aspeed_i2c_get_bus(&soc->i2c, 4), 0x51, 128 * KiB);
+    at24c_eeprom_init_rom(aspeed_i2c_get_bus(&soc->i2c, 8), 0x51, 128 * KiB,
+                          yosemitev2_bmc_fruid, yosemitev2_bmc_fruid_len);
+}
+
 static void romulus_bmc_i2c_init(AspeedMachineState *bmc)
 {
     AspeedSoCState *soc = &bmc->soc;
@@ -1174,6 +1183,24 @@ static void aspeed_machine_ast2500_evb_class_init(ObjectClass *oc, void *data)
         aspeed_soc_num_cpus(amc->soc_name);
 };
 
+static void aspeed_machine_yosemitev2_class_init(ObjectClass *oc, void *data)
+{
+    MachineClass *mc = MACHINE_CLASS(oc);
+    AspeedMachineClass *amc = ASPEED_MACHINE_CLASS(oc);
+
+    mc->desc       = "Facebook YosemiteV2 BMC (ARM1176)";
+    amc->soc_name  = "ast2500-a1";
+    amc->hw_strap1 = AST2500_EVB_HW_STRAP1;
+    amc->hw_strap2 = 0;
+    amc->fmc_model = "n25q256a";
+    amc->spi_model = "mx25l25635e";
+    amc->num_cs    = 2;
+    amc->i2c_init  = yosemitev2_bmc_i2c_init;
+    mc->default_ram_size       = 512 * MiB;
+    mc->default_cpus = mc->min_cpus = mc->max_cpus =
+        aspeed_soc_num_cpus(amc->soc_name);
+};
+
 static void aspeed_machine_romulus_class_init(ObjectClass *oc, void *data)
 {
     MachineClass *mc = MACHINE_CLASS(oc);
@@ -1562,6 +1589,10 @@ static const TypeInfo aspeed_machine_types[] = {
         .name          = MACHINE_TYPE_NAME("ast2600-evb"),
         .parent        = TYPE_ASPEED_MACHINE,
         .class_init    = aspeed_machine_ast2600_evb_class_init,
+    }, {
+        .name          = MACHINE_TYPE_NAME("yosemitev2-bmc"),
+        .parent        = TYPE_ASPEED_MACHINE,
+        .class_init    = aspeed_machine_yosemitev2_class_init,
     }, {
         .name          = MACHINE_TYPE_NAME("tacoma-bmc"),
         .parent        = TYPE_ASPEED_MACHINE,
diff --git a/hw/arm/aspeed_eeprom.c b/hw/arm/aspeed_eeprom.c
index 04463acc9d..7006794654 100644
--- a/hw/arm/aspeed_eeprom.c
+++ b/hw/arm/aspeed_eeprom.c
@@ -77,6 +77,29 @@ const uint8_t fby35_bmc_fruid[] = {
     0x6e, 0x66, 0x69, 0x67, 0x20, 0x41, 0xc1, 0x45,
 };
 
+/* Yosemite V2 BMC FRU */
+const uint8_t yosemitev2_bmc_fruid[] = {
+    0x01, 0x00, 0x00, 0x01, 0x0d, 0x00, 0x00, 0xf1, 0x01, 0x0c, 0x00, 0x36,
+    0xe6, 0xd0, 0xc6, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0xd2, 0x42, 0x4d,
+    0x43, 0x20, 0x53, 0x74, 0x6f, 0x72, 0x61, 0x67, 0x65, 0x20, 0x4d, 0x6f,
+    0x64, 0x75, 0x6c, 0x65, 0xcd, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58,
+    0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0xce, 0x58, 0x58, 0x58, 0x58, 0x58,
+    0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0xc3, 0x31, 0x2e,
+    0x30, 0xc9, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0xd2,
+    0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58,
+    0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0xc1, 0x39, 0x01, 0x0c, 0x00, 0xc6,
+    0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0xd2, 0x59, 0x6f, 0x73, 0x65, 0x6d,
+    0x69, 0x74, 0x65, 0x20, 0x56, 0x32, 0x2e, 0x30, 0x20, 0x45, 0x56, 0x54,
+    0x32, 0xce, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58,
+    0x58, 0x58, 0x58, 0x58, 0xc4, 0x45, 0x56, 0x54, 0x32, 0xcd, 0x58, 0x58,
+    0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0xc7,
+    0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0xc3, 0x31, 0x2e, 0x30, 0xc9,
+    0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0xc8, 0x43, 0x6f,
+    0x6e, 0x66, 0x69, 0x67, 0x20, 0x41, 0xc1, 0x45,
+};
+
 const size_t fby35_nic_fruid_len = sizeof(fby35_nic_fruid);
 const size_t fby35_bb_fruid_len = sizeof(fby35_bb_fruid);
 const size_t fby35_bmc_fruid_len = sizeof(fby35_bmc_fruid);
+
+const size_t yosemitev2_bmc_fruid_len = sizeof(yosemitev2_bmc_fruid);
-- 
2.39.2

