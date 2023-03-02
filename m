Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp12022ejc;
        Thu, 2 Mar 2023 09:43:46 -0800 (PST)
X-Google-Smtp-Source: AK7set9d8GpMFa+3FmZDytW70n7zFxSzRKXEjHWk5vOvuwx/z4t7K7pURuLzq69YqlqN/KDASMcE
X-Received: by 2002:ad4:5c4d:0:b0:56e:a07b:f4df with SMTP id a13-20020ad45c4d000000b0056ea07bf4dfmr21603209qva.13.1677779026530;
        Thu, 02 Mar 2023 09:43:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677779026; cv=none;
        d=google.com; s=arc-20160816;
        b=kDXRgDwAzVtJyJLeMKyRshqR0Sed2QwA1LRg+tAaJUtrNyV53sFYWtJQnCvLgwRSBk
         2RkrT+pmwrmTdA0CoSTdVr2T0eR8T7ndk4+mT8zg0atndmiNYqSTHsd3m0zYgreZQ/nv
         imY/Dih47nWBFuK4Vwh66f5c8WYYSRAGC2AAgEUnDClsUWgnQxiJd1sq+Niylq/O7AZX
         fAwpO3FvWJ0zuS5kmWrFpAEq3O+0p0Ip3t873AOtgDPEYY9sWvyX3O4us3OEpKwjUakb
         gHa3g4PnPj16EYJb12unEFs3unUReF4nweDU/GC2geFVTp1qUFqZdBpb06oQezsV4HsN
         SlAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=GtXMGRN7dg0Ce5vQAGGrzeE9n90pXorfbmRIvBD26o8=;
        b=Tf0CYvAyNxdWoDBn7tNzYmoP80iHfe9hFp1Msgr1y/AYJ7o9RSX26Y9w3Ysl97zUbV
         mksfhUc+O1BnB3xPxU9y+mPTfYcRTMH50WVlhu87VpKevgwvV5ngTv0UV4m2WrYtbIF2
         7F2IKAW/EvN3iJmqGy6EhEMpxEIFsAwnLZWj7tQXASJL6lcUfUjSp/O/qElQAR4sSGI/
         nakS/31fGjdNOhOQrlybRTPB+eWJBgNGhLSg+RUK4u+3ccqAQmP1tLXWhuqBPh5qKbDJ
         M0EM0ExPBfHEZzEbB3PoQV/oAreBvKi0GvgIptPxCA2W1HkHhjR4RSkuYQvQ93HLH51J
         rmww==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id br37-20020a05620a462500b007128d95add8si103474qkb.35.2023.03.02.09.43.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 02 Mar 2023 09:43:46 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXmxM-0005QT-Il; Thu, 02 Mar 2023 12:43:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=Cwst=62=kaod.org=clg@ozlabs.org>)
 id 1pXmx3-000501-CU; Thu, 02 Mar 2023 12:42:45 -0500
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3]
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=Cwst=62=kaod.org=clg@ozlabs.org>)
 id 1pXmwy-0002n4-Lt; Thu, 02 Mar 2023 12:42:45 -0500
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4PSJMv0xBDz4x8B;
 Fri,  3 Mar 2023 04:42:35 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4PSJMr6lYRz4x5X;
 Fri,  3 Mar 2023 04:42:32 +1100 (AEDT)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Sittisak Sinprem <ssinprem@celestica.com>,
 Peter Delevoryas <peter@pjd.dev>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PULL 08/11] aspeed/fuji : correct the eeprom size
Date: Thu,  2 Mar 2023 18:42:03 +0100
Message-Id: <20230302174206.2434673-9-clg@kaod.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230302174206.2434673-1-clg@kaod.org>
References: <20230302174206.2434673-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2404:9400:2221:ea00::3;
 envelope-from=SRS0=Cwst=62=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: TkkAE4NKTBPr

From: Sittisak Sinprem <ssinprem@celestica.com>

Device 24C64 the size is 64 kilobits = 8kilobyte
Device 24C02 the size is 2 kilobits = 256byte

Signed-off-by: Sittisak Sinprem <ssinprem@celestica.com>
Reviewed-by: Peter Delevoryas <peter@pjd.dev>
[ clg: checkpatch issues ]
Message-Id: <167660539263.10409.9736070122710923479-2@git.sr.ht>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/arm/aspeed.c | 36 ++++++++++++++++++++----------------
 1 file changed, 20 insertions(+), 16 deletions(-)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index 6bafeb8fdd..cb59a37b07 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -858,42 +858,46 @@ static void fuji_bmc_i2c_init(AspeedMachineState *bmc)
     i2c_slave_create_simple(i2c[17], TYPE_LM75, 0x4c);
     i2c_slave_create_simple(i2c[17], TYPE_LM75, 0x4d);
 
-    at24c_eeprom_init(i2c[19], 0x52, 64 * KiB);
-    at24c_eeprom_init(i2c[20], 0x50, 2 * KiB);
-    at24c_eeprom_init(i2c[22], 0x52, 2 * KiB);
+    /*
+     * EEPROM 24c64 size is 64Kbits or 8 Kbytes
+     *        24c02 size is 2Kbits or 256 bytes
+     */
+    at24c_eeprom_init(i2c[19], 0x52, 8 * KiB);
+    at24c_eeprom_init(i2c[20], 0x50, 256);
+    at24c_eeprom_init(i2c[22], 0x52, 256);
 
     i2c_slave_create_simple(i2c[3], TYPE_LM75, 0x48);
     i2c_slave_create_simple(i2c[3], TYPE_LM75, 0x49);
     i2c_slave_create_simple(i2c[3], TYPE_LM75, 0x4a);
     i2c_slave_create_simple(i2c[3], TYPE_TMP422, 0x4c);
 
-    at24c_eeprom_init(i2c[8], 0x51, 64 * KiB);
+    at24c_eeprom_init(i2c[8], 0x51, 8 * KiB);
     i2c_slave_create_simple(i2c[8], TYPE_LM75, 0x4a);
 
     i2c_slave_create_simple(i2c[50], TYPE_LM75, 0x4c);
-    at24c_eeprom_init(i2c[50], 0x52, 64 * KiB);
+    at24c_eeprom_init(i2c[50], 0x52, 8 * KiB);
     i2c_slave_create_simple(i2c[51], TYPE_TMP75, 0x48);
     i2c_slave_create_simple(i2c[52], TYPE_TMP75, 0x49);
 
     i2c_slave_create_simple(i2c[59], TYPE_TMP75, 0x48);
     i2c_slave_create_simple(i2c[60], TYPE_TMP75, 0x49);
 
-    at24c_eeprom_init(i2c[65], 0x53, 64 * KiB);
+    at24c_eeprom_init(i2c[65], 0x53, 8 * KiB);
     i2c_slave_create_simple(i2c[66], TYPE_TMP75, 0x49);
     i2c_slave_create_simple(i2c[66], TYPE_TMP75, 0x48);
-    at24c_eeprom_init(i2c[68], 0x52, 64 * KiB);
-    at24c_eeprom_init(i2c[69], 0x52, 64 * KiB);
-    at24c_eeprom_init(i2c[70], 0x52, 64 * KiB);
-    at24c_eeprom_init(i2c[71], 0x52, 64 * KiB);
+    at24c_eeprom_init(i2c[68], 0x52, 8 * KiB);
+    at24c_eeprom_init(i2c[69], 0x52, 8 * KiB);
+    at24c_eeprom_init(i2c[70], 0x52, 8 * KiB);
+    at24c_eeprom_init(i2c[71], 0x52, 8 * KiB);
 
-    at24c_eeprom_init(i2c[73], 0x53, 64 * KiB);
+    at24c_eeprom_init(i2c[73], 0x53, 8 * KiB);
     i2c_slave_create_simple(i2c[74], TYPE_TMP75, 0x49);
     i2c_slave_create_simple(i2c[74], TYPE_TMP75, 0x48);
-    at24c_eeprom_init(i2c[76], 0x52, 64 * KiB);
-    at24c_eeprom_init(i2c[77], 0x52, 64 * KiB);
-    at24c_eeprom_init(i2c[78], 0x52, 64 * KiB);
-    at24c_eeprom_init(i2c[79], 0x52, 64 * KiB);
-    at24c_eeprom_init(i2c[28], 0x50, 2 * KiB);
+    at24c_eeprom_init(i2c[76], 0x52, 8 * KiB);
+    at24c_eeprom_init(i2c[77], 0x52, 8 * KiB);
+    at24c_eeprom_init(i2c[78], 0x52, 8 * KiB);
+    at24c_eeprom_init(i2c[79], 0x52, 8 * KiB);
+    at24c_eeprom_init(i2c[28], 0x50, 256);
 
     for (int i = 0; i < 8; i++) {
         at24c_eeprom_init(i2c[81 + i * 8], 0x56, 64 * KiB);
-- 
2.39.2

