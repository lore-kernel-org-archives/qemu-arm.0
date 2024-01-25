Received: by 2002:a17:907:9874:b0:a31:23a7:2a34 with SMTP id ko20csp30012ejc;
        Wed, 24 Jan 2024 21:56:20 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFHcJcIT+4ljONcqCzhdbn1r4UASeaV0uj9VbwZsJlfj+gO0KdO60XOnVEBp1RiZRPAFAnq
X-Received: by 2002:a05:620a:1585:b0:783:1e5b:8e57 with SMTP id d5-20020a05620a158500b007831e5b8e57mr1060253qkk.34.1706162179935;
        Wed, 24 Jan 2024 21:56:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1706162179; cv=none;
        d=google.com; s=arc-20160816;
        b=od4aivKMuzuwMH1qJnEzYRwn6uzRGPRfEBBLMoaUXnxlCjKn74C5ST/J6SDC27QZ8U
         ol9a4PxoVq/gmHAHZNzy6JDPbdGZHx7JntX5kQbIvS0+p67P984Z44CQz1WGcX4fi4h/
         qfaK1RKAsN+pg4GPOjyYGfReJ+NN/Task1MkwJKLl80DxQegtLUlV8Hnp0xW7sh9JxQ3
         n+LURXIy7UcAl/jBVcJzkvkaGta1tpe8Gj6jRyXobGh2pJN7eX1xC1mmThXwCP1eZGnM
         8RzHjmAMXVBvTJt6eMjfST5qO52Lmdge/xo+8JoERCoUB8oVbfDwAKqmgJRKd1ywbaLC
         PfTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=QNfhqMn/7H2JfeWtmxECGiPrj1Y1rofAyE4BiaQU4SY=;
        fh=mgkM7j5chzFeBdbp6jSghBOXKGtgf9vcQQUOsrmpdjA=;
        b=0eK5hM3QDDfR+hbI/UTZHhIAzF0Zjm/aRPZNAf8M3IQYhUNoEhfxeVJc7z8Rwc0uEt
         4mJiZi4NcJ2ajr3gt+p7PAQVDpC8tagKjjQ+NreID4icZTB4jVOe7eWLVakpf66C5Ici
         PC0AprR4RXhVLOlEhCT0y/IGhiOvMjkhb0e2TOBEY42xfA8kD0Ol4KKq5+CyP2K9TL6n
         VrWFuFC+F5LtkUKDMXbknGagYkyCDzf/6d74hX+vyMXn2/Xk8BbsrVQQnBGLqe9kavjf
         Bj63Lw0S1xm9mInKm0QQF8nN6Tcom4sV24hc7y43IpcAieJqNYJH5IzXlsQOoO2r8AmD
         pf7A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wXqKWV9R;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u23-20020a05620a023700b00783ae3d4933si4697327qkm.190.2024.01.24.21.56.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 24 Jan 2024 21:56:19 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wXqKWV9R;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rSsif-0003Jr-T5; Thu, 25 Jan 2024 00:56:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rSsie-0003JX-2s
 for qemu-arm@nongnu.org; Thu, 25 Jan 2024 00:56:08 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rSsib-000182-W6
 for qemu-arm@nongnu.org; Thu, 25 Jan 2024 00:56:07 -0500
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-40eb2f392f0so32265025e9.1
 for <qemu-arm@nongnu.org>; Wed, 24 Jan 2024 21:56:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1706162164; x=1706766964; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QNfhqMn/7H2JfeWtmxECGiPrj1Y1rofAyE4BiaQU4SY=;
 b=wXqKWV9R1ag+Wuv+NA+X/fg/Cl8RNlnxPhiAA2vFZ6EkLB7UygE31HbBqIOblRJLTG
 VKK+VaBAszwaQCuLJZ0Qqhpj+AlK2H7iTLAPCUyRaJOJzsg3k/UgqSHNusx/l2CQaMLE
 LO9k+eAL3X84dYsCjCwAWAf3YmDQXvoekrS3I4xHIMWtLIgmsAfmGS1eERdhH37cm4/T
 tW/aTK6o4UfSEGx4No3F6Y+PbZfS4Xq01R4fOyBF5k/EnG7Cl52j8CDs2xT+hIFutXg3
 5PJsMM++PDavsyXGFBCrDfb3sP/bzV35+cZ6T/LTBAqpfow59ftvc0bdFYZkFvGYltBT
 zdxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706162164; x=1706766964;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QNfhqMn/7H2JfeWtmxECGiPrj1Y1rofAyE4BiaQU4SY=;
 b=MoqeMosXfH0K6avLjQ8mvFqd+TohcuBepIbm+WIa4+EX4MbPUDhWwBAH1LZHpHlHoq
 eR18L2OsobDHKa1ZbJ7if3+I6lE3a1BnG1tWev/Hz5coenQqRdfua+HhqwPqRhFFB+tX
 URQIGwJ2dPlbAdJZ2wv/5dC7BAFs7Pn5vQco+e95nYwceTMqy09c+Rb0vTZRk8vW4lTR
 aqJlQxkFOwtjyH2U/SeLgjlhOCJDDWaqxMXO3lhPIrIGyWCMWRKnf976WETUBXdp0HP7
 U1J1HkrTHeG40XGMwhsyv4Ri3+WEG6NnnCDqT8OqVygcdwGdm1tjNFFE4GH2lcgoxx85
 hvPw==
X-Gm-Message-State: AOJu0Yxp8AwplxJgC3AGbJ3UJw2iowo3eJ1iFV5cQEr5eJ+BG0aCDyPL
 gITHx2V4jEFuZ7gUGUrP1sKVQXkwL/Iu3ak7j8dCDgRbK1pFDXZcaUMnKqzvx/w=
X-Received: by 2002:a7b:cb8a:0:b0:40e:5cb5:916c with SMTP id
 m10-20020a7bcb8a000000b0040e5cb5916cmr156743wmi.129.1706162164694; 
 Wed, 24 Jan 2024 21:56:04 -0800 (PST)
Received: from m1x-phil.lan (lec62-h02-176-184-19-125.dsl.sta.abo.bbox.fr.
 [176.184.19.125]) by smtp.gmail.com with ESMTPSA id
 je1-20020a05600c1f8100b0040e5cf9a6c7sm1277836wmb.13.2024.01.24.21.56.03
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 24 Jan 2024 21:56:04 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, qemu-arm@nongnu.org,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Joel Stanley <joel@jms.id.au>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Gavin Shan <gshan@redhat.com>
Subject: [PATCH v3 3/5] hw/arm/aspeed: Init CPU defaults in a common helper
Date: Thu, 25 Jan 2024 06:55:42 +0100
Message-ID: <20240125055544.79405-4-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240125055544.79405-1-philmd@linaro.org>
References: <20240125055544.79405-1-philmd@linaro.org>
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
X-TUID: XoIxDG8n6ayg

Rework aspeed_soc_num_cpus() as a new init_cpus_defaults()
helper to reduce code duplication.

Reviewed-by: Cédric Le Goater <clg@kaod.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Gavin Shan <gshan@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/arm/aspeed.c | 71 +++++++++++++++++++------------------------------
 1 file changed, 28 insertions(+), 43 deletions(-)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index 5b01a4dd28..d2d490a6d1 100644
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
+    mc->default_cpus = sc->num_cpus;
+    mc->min_cpus = sc->num_cpus;
+    mc->max_cpus = sc->num_cpus;
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
+    aspeed_machine_class_init_cpus_defaults(mc);
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

