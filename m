Received: by 2002:a17:906:568b:b0:a2e:1324:ea5c with SMTP id am11csp617428ejc;
        Tue, 23 Jan 2024 14:50:09 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFp7/zkV0O4o6ZOjyf3vL9MZSy8l5IRaPJAcpD89AUjLMdtVxKa2Thd59t3UbzXswM/GRcx
X-Received: by 2002:a05:620a:41:b0:783:8d0f:d760 with SMTP id t1-20020a05620a004100b007838d0fd760mr5728979qkt.5.1706050209659;
        Tue, 23 Jan 2024 14:50:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1706050209; cv=none;
        d=google.com; s=arc-20160816;
        b=ccQMmII6Y37d0eoBuIBDrinmIm9GFL+BXY0k8kVPUiP8TBQZVfc3zUIH1BdwQBuXPq
         4uLEIqevckCqlwQJB/jhJ3E6MCTJRFmFIT74/v/rF66n4wPjssvnwGdMowCSQEyTpxYG
         69F0lI6z0Bl7tn2cUMQ2lnm7BStRPFdH82JdKR5B+ySiFuhp+UyR3QIgUHY1DaCdlPYn
         I+fnF2r7wZCV7tb0UmY+KIJjW1YzY+4CXm/HhpmIczjem99MljNr8ay9rqNsDT1MBh0D
         YRiSV8OuJogZzDtF5GwQTrbasoX+DR4EJfLsqx66bEV6WksYTQQwmXi73OcSoa0btk4Q
         dNNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=QEBEkDP6qGPzC+3ewoPUDTZ07buC9oNuSZRC+33yQxM=;
        fh=syX9H1Z6jvTUZoUNlfCNxZiWCwEj552WMbtCUDPMiLw=;
        b=ppp0xxnqSRuBq/+pdxU9xA1SzZOQYw51UdXVRW3AmZ07cW06fsTBt2aG84E6tDstfe
         0OagdpqBvoX+76/M47dUMl7X9+P0zxK1dTQvkAc7TTz9YSR3CmnO9Fn8NMbF932ktb2S
         528qnqCxQ0AyApgiXrJfairkss3A/GDHG9EBUsZVjPkctOtgzCKPRNuwmA7WfKhphMfc
         CKA3quGz4EvN0f3LSV6AzGPjH9HrmRfTSdmYTm8h5Y41VDTAOBs6HWH1ZQiDzoVVp2dQ
         E8WPdb55TCLHuANEobQZvyChg3Z5nLyZLC0HDrXOXG0Viy8Gh5KYbAuiZqkceeeZ8ZNa
         6k1Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OIRoBZBl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u12-20020a05620a430c00b0078151aaae56si9588596qko.223.2024.01.23.14.50.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 23 Jan 2024 14:50:09 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OIRoBZBl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rSPZv-00073J-8X; Tue, 23 Jan 2024 17:49:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rSPZp-00072A-J5
 for qemu-arm@nongnu.org; Tue, 23 Jan 2024 17:49:05 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rSPZm-0004L6-A0
 for qemu-arm@nongnu.org; Tue, 23 Jan 2024 17:49:04 -0500
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-3394b892691so173651f8f.1
 for <qemu-arm@nongnu.org>; Tue, 23 Jan 2024 14:49:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1706050141; x=1706654941; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QEBEkDP6qGPzC+3ewoPUDTZ07buC9oNuSZRC+33yQxM=;
 b=OIRoBZBlcRKU/WphpiwVPqJekTj0nYXosCyyylIAgXn1+xtrYAM9N28a9/bfy7eaBf
 ImNN7m64QuGV420jNwbnXMGMIdTDwdtJJc2MU9ftGwGSYeoa6+bY6gdzcm5mWWaFxeys
 H31a70aU7i3NNd5/T1IkIpIiWZkWjP1noZoWM+5NtnHWyGgfnnxcahWwPwB78JjLVXD1
 tyvC8k1G3Iyu4aDeXauavRwL9XJlNYUbFbmhqdB1o7lGC4awAA2vEuowp2q+74LF+D26
 RfY2miS50IT2BM6NkMuqGn6jd1DNT6bfr3eFeCoRXP6F3seY/SWChfr/hoqGthwNyj2Q
 kPTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706050141; x=1706654941;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QEBEkDP6qGPzC+3ewoPUDTZ07buC9oNuSZRC+33yQxM=;
 b=WhDtsJCU4x9hXQCyYUYvcbbUBvJJy/Wr/uE7hM/HlXLVNgEcyTTJOCAV+f61K9J62t
 qbh6PqiZJEHPKeL86FZqXK6eX6p3YtzEsSmSIi1j8Ja3PU9vOHCd+nf5hb+nvMcHxoVg
 qPvoSBe+UdlPvhypwg5EnDBfUFyD4zV91Fszn4ifp6HZJuYrktmO4WFJW3fIquJ0NsHN
 ZmmPxPrxX7vT4cdIM01dSXsDKc2GbC12WECVa2vXIrlvCYKISZfXOQsWe5QUiw9XnTKr
 wMgpvlO5kCJ6SuZFcbCMklxzvvUgI+lwHT2+db/hCH/uO6GEE3uJ4LL4d9qYlmZ5Xw+B
 jj3A==
X-Gm-Message-State: AOJu0Yyk5sScf1V+MFXDwTR85tHZtXYRkZrDnQcFQ4PI6VKVXPVFtzmB
 T7lgQ9+pmK8fHm3nIgyDhVvwQr7Y5Dc/rPvws4jDGIX6gAlnfeSIL7YWwaO3K+8=
X-Received: by 2002:a5d:64c4:0:b0:337:eea:6b24 with SMTP id
 f4-20020a5d64c4000000b003370eea6b24mr120947wri.69.1706050140875; 
 Tue, 23 Jan 2024 14:49:00 -0800 (PST)
Received: from m1x-phil.lan ([176.187.194.78])
 by smtp.gmail.com with ESMTPSA id
 c11-20020a5d63cb000000b00337aed83aaasm17295972wrw.92.2024.01.23.14.48.59
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 23 Jan 2024 14:49:00 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 3/5] hw/arm/aspeed: Init CPU defaults in a common helper
Date: Tue, 23 Jan 2024 23:48:40 +0100
Message-ID: <20240123224842.18485-4-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240123224842.18485-1-philmd@linaro.org>
References: <20240123224842.18485-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-TUID: kOAW1hxl3VZ8

Rework aspeed_soc_num_cpus() as a new init_cpus_defaults()
helper to reduce code duplication.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/arm/aspeed.c | 71 +++++++++++++++++++------------------------------
 1 file changed, 28 insertions(+), 43 deletions(-)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index 5b01a4dd28..636a6269aa 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -1141,10 +1141,14 @@ static void aspeed_machine_class_props_init(ObjectClass *oc)
                                           "Change the SPI Flash model");
 }
 
-static int aspeed_soc_num_cpus(const char *soc_name)
+static void aspeed_machine_class_init_cpus_defaults(MachineClass *mc)
 {
-   AspeedSoCClass *sc = ASPEED_SOC_CLASS(object_class_by_name(soc_name));
-   return sc->num_cpus;
+    AspeedMachineClass *amc = ASPEED_MACHINE_CLASS(mc);
+    AspeedSoCClass *sc = ASPEED_SOC_CLASS(object_class_by_name(amc->soc_name));
+
+    mc->default_cpus = mc->min_cpus
+                     = mc->max_cpus
+                     = sc->num_cpus;
 }
 
 static void aspeed_machine_class_init(ObjectClass *oc, void *data)
@@ -1176,8 +1180,7 @@ static void aspeed_machine_palmetto_class_init(ObjectClass *oc, void *data)
     amc->num_cs    = 1;
     amc->i2c_init  = palmetto_bmc_i2c_init;
     mc->default_ram_size       = 256 * MiB;
-    mc->default_cpus = mc->min_cpus = mc->max_cpus =
-        aspeed_soc_num_cpus(amc->soc_name);
+    aspeed_machine_class_init_cpus_defaults(mc);
 };
 
 static void aspeed_machine_quanta_q71l_class_init(ObjectClass *oc, void *data)
@@ -1193,8 +1196,7 @@ static void aspeed_machine_quanta_q71l_class_init(ObjectClass *oc, void *data)
     amc->num_cs    = 1;
     amc->i2c_init  = quanta_q71l_bmc_i2c_init;
     mc->default_ram_size       = 128 * MiB;
-    mc->default_cpus = mc->min_cpus = mc->max_cpus =
-        aspeed_soc_num_cpus(amc->soc_name);
+    aspeed_machine_class_init_cpus_defaults(mc);
 }
 
 static void aspeed_machine_supermicrox11_bmc_class_init(ObjectClass *oc,
@@ -1212,8 +1214,7 @@ static void aspeed_machine_supermicrox11_bmc_class_init(ObjectClass *oc,
     amc->macs_mask = ASPEED_MAC0_ON | ASPEED_MAC1_ON;
     amc->i2c_init  = palmetto_bmc_i2c_init;
     mc->default_ram_size = 256 * MiB;
-    mc->default_cpus = mc->min_cpus = mc->max_cpus =
-        aspeed_soc_num_cpus(amc->soc_name);
+    aspeed_machine_class_init_cpus_defaults(mc);
 }
 
 static void aspeed_machine_supermicro_x11spi_bmc_class_init(ObjectClass *oc,
@@ -1231,8 +1232,7 @@ static void aspeed_machine_supermicro_x11spi_bmc_class_init(ObjectClass *oc,
     amc->macs_mask = ASPEED_MAC0_ON | ASPEED_MAC1_ON;
     amc->i2c_init  = palmetto_bmc_i2c_init;
     mc->default_ram_size = 512 * MiB;
-    mc->default_cpus = mc->min_cpus = mc->max_cpus =
-        aspeed_soc_num_cpus(amc->soc_name);
+    aspeed_machine_class_init_cpus_defaults(mc);
 }
 
 static void aspeed_machine_ast2500_evb_class_init(ObjectClass *oc, void *data)
@@ -1248,8 +1248,7 @@ static void aspeed_machine_ast2500_evb_class_init(ObjectClass *oc, void *data)
     amc->num_cs    = 1;
     amc->i2c_init  = ast2500_evb_i2c_init;
     mc->default_ram_size       = 512 * MiB;
-    mc->default_cpus = mc->min_cpus = mc->max_cpus =
-        aspeed_soc_num_cpus(amc->soc_name);
+    aspeed_machine_class_init_cpus_defaults(mc);
 };
 
 static void aspeed_machine_yosemitev2_class_init(ObjectClass *oc, void *data)
@@ -1266,8 +1265,7 @@ static void aspeed_machine_yosemitev2_class_init(ObjectClass *oc, void *data)
     amc->num_cs    = 2;
     amc->i2c_init  = yosemitev2_bmc_i2c_init;
     mc->default_ram_size       = 512 * MiB;
-    mc->default_cpus = mc->min_cpus = mc->max_cpus =
-        aspeed_soc_num_cpus(amc->soc_name);
+    aspeed_machine_class_init_cpus_defaults(mc);
 };
 
 static void aspeed_machine_romulus_class_init(ObjectClass *oc, void *data)
@@ -1283,8 +1281,7 @@ static void aspeed_machine_romulus_class_init(ObjectClass *oc, void *data)
     amc->num_cs    = 2;
     amc->i2c_init  = romulus_bmc_i2c_init;
     mc->default_ram_size       = 512 * MiB;
-    mc->default_cpus = mc->min_cpus = mc->max_cpus =
-        aspeed_soc_num_cpus(amc->soc_name);
+    aspeed_machine_class_init_cpus_defaults(mc);
 };
 
 static void aspeed_machine_tiogapass_class_init(ObjectClass *oc, void *data)
@@ -1301,8 +1298,7 @@ static void aspeed_machine_tiogapass_class_init(ObjectClass *oc, void *data)
     amc->num_cs    = 2;
     amc->i2c_init  = tiogapass_bmc_i2c_init;
     mc->default_ram_size       = 1 * GiB;
-    mc->default_cpus = mc->min_cpus = mc->max_cpus =
-        aspeed_soc_num_cpus(amc->soc_name);
+    aspeed_machine_class_init_cpus_defaults(mc);
 };
 
 static void aspeed_machine_sonorapass_class_init(ObjectClass *oc, void *data)
@@ -1318,8 +1314,7 @@ static void aspeed_machine_sonorapass_class_init(ObjectClass *oc, void *data)
     amc->num_cs    = 2;
     amc->i2c_init  = sonorapass_bmc_i2c_init;
     mc->default_ram_size       = 512 * MiB;
-    mc->default_cpus = mc->min_cpus = mc->max_cpus =
-        aspeed_soc_num_cpus(amc->soc_name);
+    aspeed_machine_class_init_cpus_defaults(mc);
 };
 
 static void aspeed_machine_witherspoon_class_init(ObjectClass *oc, void *data)
@@ -1335,8 +1330,7 @@ static void aspeed_machine_witherspoon_class_init(ObjectClass *oc, void *data)
     amc->num_cs    = 2;
     amc->i2c_init  = witherspoon_bmc_i2c_init;
     mc->default_ram_size = 512 * MiB;
-    mc->default_cpus = mc->min_cpus = mc->max_cpus =
-        aspeed_soc_num_cpus(amc->soc_name);
+    aspeed_machine_class_init_cpus_defaults(mc);
 };
 
 static void aspeed_machine_ast2600_evb_class_init(ObjectClass *oc, void *data)
@@ -1355,8 +1349,7 @@ static void aspeed_machine_ast2600_evb_class_init(ObjectClass *oc, void *data)
                      ASPEED_MAC3_ON;
     amc->i2c_init  = ast2600_evb_i2c_init;
     mc->default_ram_size = 1 * GiB;
-    mc->default_cpus = mc->min_cpus = mc->max_cpus =
-        aspeed_soc_num_cpus(amc->soc_name);
+    aspeed_machine_class_init_cpus_defaults(mc);
 };
 
 static void aspeed_machine_tacoma_class_init(ObjectClass *oc, void *data)
@@ -1374,8 +1367,7 @@ static void aspeed_machine_tacoma_class_init(ObjectClass *oc, void *data)
     amc->macs_mask  = ASPEED_MAC2_ON;
     amc->i2c_init  = witherspoon_bmc_i2c_init; /* Same board layout */
     mc->default_ram_size = 1 * GiB;
-    mc->default_cpus = mc->min_cpus = mc->max_cpus =
-        aspeed_soc_num_cpus(amc->soc_name);
+    aspeed_machine_class_init_cpus_defaults(mc);
 };
 
 static void aspeed_machine_g220a_class_init(ObjectClass *oc, void *data)
@@ -1392,8 +1384,7 @@ static void aspeed_machine_g220a_class_init(ObjectClass *oc, void *data)
     amc->macs_mask  = ASPEED_MAC0_ON | ASPEED_MAC1_ON;
     amc->i2c_init  = g220a_bmc_i2c_init;
     mc->default_ram_size = 1024 * MiB;
-    mc->default_cpus = mc->min_cpus = mc->max_cpus =
-        aspeed_soc_num_cpus(amc->soc_name);
+    aspeed_machine_class_init_cpus_defaults(mc);
 };
 
 static void aspeed_machine_fp5280g2_class_init(ObjectClass *oc, void *data)
@@ -1410,8 +1401,7 @@ static void aspeed_machine_fp5280g2_class_init(ObjectClass *oc, void *data)
     amc->macs_mask  = ASPEED_MAC0_ON | ASPEED_MAC1_ON;
     amc->i2c_init  = fp5280g2_bmc_i2c_init;
     mc->default_ram_size = 512 * MiB;
-    mc->default_cpus = mc->min_cpus = mc->max_cpus =
-        aspeed_soc_num_cpus(amc->soc_name);
+    aspeed_machine_class_init_cpus_defaults(mc);
 };
 
 static void aspeed_machine_rainier_class_init(ObjectClass *oc, void *data)
@@ -1429,8 +1419,7 @@ static void aspeed_machine_rainier_class_init(ObjectClass *oc, void *data)
     amc->macs_mask  = ASPEED_MAC2_ON | ASPEED_MAC3_ON;
     amc->i2c_init  = rainier_bmc_i2c_init;
     mc->default_ram_size = 1 * GiB;
-    mc->default_cpus = mc->min_cpus = mc->max_cpus =
-        aspeed_soc_num_cpus(amc->soc_name);
+    aspeed_machine_class_init_cpus_defaults(mc);
 };
 
 #define FUJI_BMC_RAM_SIZE ASPEED_RAM_SIZE(2 * GiB)
@@ -1451,8 +1440,7 @@ static void aspeed_machine_fuji_class_init(ObjectClass *oc, void *data)
     amc->i2c_init = fuji_bmc_i2c_init;
     amc->uart_default = ASPEED_DEV_UART1;
     mc->default_ram_size = FUJI_BMC_RAM_SIZE;
-    mc->default_cpus = mc->min_cpus = mc->max_cpus =
-        aspeed_soc_num_cpus(amc->soc_name);
+    aspeed_machine_class_init_cpus_defaults(mc);
 };
 
 #define BLETCHLEY_BMC_RAM_SIZE ASPEED_RAM_SIZE(2 * GiB)
@@ -1472,8 +1460,7 @@ static void aspeed_machine_bletchley_class_init(ObjectClass *oc, void *data)
     amc->macs_mask = ASPEED_MAC2_ON;
     amc->i2c_init  = bletchley_bmc_i2c_init;
     mc->default_ram_size = BLETCHLEY_BMC_RAM_SIZE;
-    mc->default_cpus = mc->min_cpus = mc->max_cpus =
-        aspeed_soc_num_cpus(amc->soc_name);
+    aspeed_machine_class_init_cpus_defaults(mc);
 }
 
 static void fby35_reset(MachineState *state, ShutdownCause reason)
@@ -1515,6 +1502,7 @@ static void aspeed_machine_fby35_class_init(ObjectClass *oc, void *data)
     amc->i2c_init  = fby35_i2c_init;
     /* FIXME: Replace this macro with something more general */
     mc->default_ram_size = FUJI_BMC_RAM_SIZE;
+    aspeed_machine_class_init_cpus_defaults(mc); //
 }
 
 #define AST1030_INTERNAL_FLASH_SIZE (1024 * 1024)
@@ -1592,8 +1580,7 @@ static void aspeed_minibmc_machine_ast1030_evb_class_init(ObjectClass *oc,
     amc->spi_model = "sst25vf032b";
     amc->num_cs = 2;
     amc->macs_mask = 0;
-    mc->default_cpus = mc->min_cpus = mc->max_cpus =
-        aspeed_soc_num_cpus(amc->soc_name);
+    aspeed_machine_class_init_cpus_defaults(mc);
 }
 
 static void aspeed_machine_qcom_dc_scm_v1_class_init(ObjectClass *oc,
@@ -1612,8 +1599,7 @@ static void aspeed_machine_qcom_dc_scm_v1_class_init(ObjectClass *oc,
     amc->macs_mask = ASPEED_MAC2_ON | ASPEED_MAC3_ON;
     amc->i2c_init  = qcom_dc_scm_bmc_i2c_init;
     mc->default_ram_size = 1 * GiB;
-    mc->default_cpus = mc->min_cpus = mc->max_cpus =
-        aspeed_soc_num_cpus(amc->soc_name);
+    aspeed_machine_class_init_cpus_defaults(mc);
 };
 
 static void aspeed_machine_qcom_firework_class_init(ObjectClass *oc,
@@ -1632,8 +1618,7 @@ static void aspeed_machine_qcom_firework_class_init(ObjectClass *oc,
     amc->macs_mask = ASPEED_MAC2_ON | ASPEED_MAC3_ON;
     amc->i2c_init  = qcom_dc_scm_firework_i2c_init;
     mc->default_ram_size = 1 * GiB;
-    mc->default_cpus = mc->min_cpus = mc->max_cpus =
-        aspeed_soc_num_cpus(amc->soc_name);
+    aspeed_machine_class_init_cpus_defaults(mc);
 };
 
 static const TypeInfo aspeed_machine_types[] = {
-- 
2.41.0

