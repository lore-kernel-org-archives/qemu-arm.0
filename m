Received: by 2002:a17:906:fc07:b0:9bd:85f7:2662 with SMTP id ov7csp2168689ejb;
        Tue, 24 Oct 2023 09:26:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFZEQMnVaDFpWxgLutNjkcAqgy24+8rpjm773qagkvo8hcsboxL+eNqqmtd2PDE+p0utlNf
X-Received: by 2002:a05:6830:2b0b:b0:6b9:4155:7dbd with SMTP id l11-20020a0568302b0b00b006b941557dbdmr14981986otv.0.1698164818256;
        Tue, 24 Oct 2023 09:26:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698164818; cv=none;
        d=google.com; s=arc-20160816;
        b=YLZrm5dtOorP1Ru1eWe1WNxLogc9nXxvSGJVz65T/Y+KqRzqhV/505zbwI8TcZV6fv
         3RK1ps62i/i4GX3JQd1I4fry8Ao1XCnyMXvFwQmhmV2gr81RYcNF23Fp7Unt0vBCFfA0
         EL0EyA6LcO6IOY5HXsQiCQE+6z7hkU8OSn/TvqNsJDMVlYljMpLR42Zrpbvxb4SGPqkd
         0B++e7BwguSHbdShtCYgoTBMfdUE9PKXnAv6yH130wO7smnrugzBDiLQfcQzTXj0EKr9
         cgkcddWzpx/QkVkGSlJpQNRoLD3Ud+qp2eXr8u4gTtL8PESqtuCkxntwMEZ1yHGiQ8Ie
         Ne/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=GHgehWdIEub6TSLKqaVjtvx/iRAG0QCpapqH2FtOo6Y=;
        fh=WVEKgOIyTrr8n58k2pegoTwEDRNm1XlZWphDTwgTwzs=;
        b=M9e7Sb9RqyaGtJHEP6LRuo4QGUAJb9yDvqbv8DfDluFjPLsOr+eB2PRL3+UlC5CN3p
         ol20fC/+p4tRBczJpQiWrRDhEpyUDZueroVH1a1ZN8XGPCwnPiJCEro+WEuew0J4KflD
         2bwoQOT5mQFDgwqe6qm+MmcrLpjPgBzqm66AQY7brtgqFGn3R0npZmskUDjrxReENSlD
         IeC1VlSf7tIGWaPIkkckbJXAhuOhpPpHmdL24NCwEkDTru544sxq+AH2QYaF+DWdTxNu
         8WboMDdjoqMa+Yli98oBq62DzPHG7YhfXjcxN7HKFjBTS3tHwYQzg2MFire4cfUOIxir
         cK+w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EqdwXO8c;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u13-20020a0cf88d000000b00668de23041bsi7395161qvn.160.2023.10.24.09.26.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 24 Oct 2023 09:26:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EqdwXO8c;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qvKDq-0002e4-1k; Tue, 24 Oct 2023 12:25:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qvKDm-0002PF-Fa
 for qemu-arm@nongnu.org; Tue, 24 Oct 2023 12:25:34 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qvKDj-0001Ki-Fr
 for qemu-arm@nongnu.org; Tue, 24 Oct 2023 12:25:34 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-4079ed65471so38421405e9.1
 for <qemu-arm@nongnu.org>; Tue, 24 Oct 2023 09:25:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1698164730; x=1698769530; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GHgehWdIEub6TSLKqaVjtvx/iRAG0QCpapqH2FtOo6Y=;
 b=EqdwXO8cAvm99Xh7Z0jHn7qLus/+RQ43L+w1mB4N6qgz4CMkK8quZwVQXWFPNU3sMV
 X4SU+yDBixEIW1vyYQTets4ase72T5btVbnHMlaK6wX29k/cqa7LWMx6YxF7hAZb7O5B
 WCTBVHfXldGQAxIzpDKDBbLH4xm7PF7XYxCH3UEFOU1DEq4B5Z4EyEJbCTijrINBsZ7r
 0BFgrXZNEZBY8+rx8M12x7JiVs8MpGQDCBKI/x42zHVbjCKm59mGdwwEc76BhPh5gIxr
 EyAD44zPbBc7+54/Ci7j54puS2xGXTQn2OqCwLeDOPmhmLeVhzZNu+BFOGg5CW4h0H8y
 aCBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698164730; x=1698769530;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GHgehWdIEub6TSLKqaVjtvx/iRAG0QCpapqH2FtOo6Y=;
 b=VJJS+YWW40AMPThCRy2dMMSf/hBkIra+yk9OBp0L+E6tc5ZlmsGGWSVjVgfZ10hNtA
 rhbsJ4N+LsBcsPZRuPeZcZhYldTuU0Ydy8iBbNTzKKA3JoLcwYH283ds22oxy3x7FIXA
 fpLnszMtpJHckU44KApEgARymhVyPJS7no3H7dh6vbDbJiy40va6nukpa3E8wt0qn5+U
 jdaerBVGcUjIDjLqPTtrEK+rxvdNNvLUiDWr+vBL3j5ii2ekufPEXOYGdED+TE/J0y0R
 E7GG+5XM3sh6RCcv2197oWUzD5sww4z2OtrtRZxhX4zB+g9OjNLiBe7pYaTTrEKUPiND
 cAAg==
X-Gm-Message-State: AOJu0YwtMAuJvNBQCqtgXNB5zAnoqYcCyIXBSG1XRV2V5UYPBYovHcrR
 38n2FVNMOsyHiEkn48nTOenZ4A==
X-Received: by 2002:a05:600c:310d:b0:405:95ae:4a94 with SMTP id
 g13-20020a05600c310d00b0040595ae4a94mr9828858wmo.5.1698164730019; 
 Tue, 24 Oct 2023 09:25:30 -0700 (PDT)
Received: from m1x-phil.lan (sem44-h01-176-172-55-165.dsl.sta.abo.bbox.fr.
 [176.172.55.165]) by smtp.gmail.com with ESMTPSA id
 p12-20020a05600c358c00b00401b242e2e6sm17288419wmq.47.2023.10.24.09.25.28
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 24 Oct 2023 09:25:29 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Joel Stanley <joel@jms.id.au>, Peter Maydell <peter.maydell@linaro.org>,
 Andrew Jeffery <andrew@aj.id.au>, qemu-arm@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 11/11] hw/arm/aspeed: Move AspeedSoCState::cpu/vic to
 Aspeed2400SoCState
Date: Tue, 24 Oct 2023 18:24:22 +0200
Message-ID: <20231024162423.40206-12-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231024162423.40206-1-philmd@linaro.org>
References: <20231024162423.40206-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x335.google.com
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
X-TUID: V90R52k19iA/

The ARM array and VIC peripheral are only used by the
2400 series, remove them from the common AspeedSoCState.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/hw/arm/aspeed_soc.h               |  5 +++--
 hw/arm/{aspeed_soc.c => aspeed_ast2400.c} | 27 +++++++++++++----------
 hw/arm/meson.build                        |  2 +-
 3 files changed, 19 insertions(+), 15 deletions(-)
 rename hw/arm/{aspeed_soc.c => aspeed_ast2400.c} (95%)

diff --git a/include/hw/arm/aspeed_soc.h b/include/hw/arm/aspeed_soc.h
index 6f783138e1..cb832bc1ee 100644
--- a/include/hw/arm/aspeed_soc.h
+++ b/include/hw/arm/aspeed_soc.h
@@ -49,14 +49,12 @@
 struct AspeedSoCState {
     DeviceState parent;
 
-    ARMCPU cpu[ASPEED_CPUS_NUM];
     MemoryRegion *memory;
     MemoryRegion *dram_mr;
     MemoryRegion dram_container;
     MemoryRegion sram;
     MemoryRegion spi_boot_container;
     MemoryRegion spi_boot;
-    AspeedVICState vic;
     AspeedRtcState rtc;
     AspeedTimerCtrlState timerctrl;
     AspeedI2CState i2c;
@@ -99,6 +97,9 @@ OBJECT_DECLARE_TYPE(AspeedSoCState, AspeedSoCClass, ASPEED_SOC)
 
 struct Aspeed2400SoCState {
     AspeedSoCState parent;
+
+    ARMCPU cpu[ASPEED_CPUS_NUM];
+    AspeedVICState vic;
 };
 
 #define TYPE_ASPEED2400_SOC "aspeed2400-soc"
diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_ast2400.c
similarity index 95%
rename from hw/arm/aspeed_soc.c
rename to hw/arm/aspeed_ast2400.c
index dfb97f6dbd..a4334c81b8 100644
--- a/hw/arm/aspeed_soc.c
+++ b/hw/arm/aspeed_ast2400.c
@@ -135,13 +135,15 @@ static const int aspeed_soc_ast2400_irqmap[] = {
 
 static qemu_irq aspeed_soc_ast2400_get_irq(AspeedSoCState *s, int dev)
 {
+    Aspeed2400SoCState *a = ASPEED2400_SOC(s);
     AspeedSoCClass *sc = ASPEED_SOC_GET_CLASS(s);
 
-    return qdev_get_gpio_in(DEVICE(&s->vic), sc->irqmap[dev]);
+    return qdev_get_gpio_in(DEVICE(&a->vic), sc->irqmap[dev]);
 }
 
 static void aspeed_ast2400_soc_init(Object *obj)
 {
+    Aspeed2400SoCState *a = ASPEED2400_SOC(obj);
     AspeedSoCState *s = ASPEED_SOC(obj);
     AspeedSoCClass *sc = ASPEED_SOC_GET_CLASS(s);
     int i;
@@ -153,7 +155,7 @@ static void aspeed_ast2400_soc_init(Object *obj)
     }
 
     for (i = 0; i < sc->num_cpus; i++) {
-        object_initialize_child(obj, "cpu[*]", &s->cpu[i], sc->cpu_type);
+        object_initialize_child(obj, "cpu[*]", &a->cpu[i], sc->cpu_type);
     }
 
     snprintf(typename, sizeof(typename), "aspeed.scu-%s", socname);
@@ -167,7 +169,7 @@ static void aspeed_ast2400_soc_init(Object *obj)
     object_property_add_alias(obj, "hw-prot-key", OBJECT(&s->scu),
                               "hw-prot-key");
 
-    object_initialize_child(obj, "vic", &s->vic, TYPE_ASPEED_VIC);
+    object_initialize_child(obj, "vic", &a->vic, TYPE_ASPEED_VIC);
 
     object_initialize_child(obj, "rtc", &s->rtc, TYPE_ASPEED_RTC);
 
@@ -242,6 +244,7 @@ static void aspeed_ast2400_soc_init(Object *obj)
 static void aspeed_ast2400_soc_realize(DeviceState *dev, Error **errp)
 {
     int i;
+    Aspeed2400SoCState *a = ASPEED2400_SOC(dev);
     AspeedSoCState *s = ASPEED_SOC(dev);
     AspeedSoCClass *sc = ASPEED_SOC_GET_CLASS(s);
     Error *err = NULL;
@@ -264,15 +267,15 @@ static void aspeed_ast2400_soc_realize(DeviceState *dev, Error **errp)
 
     /* CPU */
     for (i = 0; i < sc->num_cpus; i++) {
-        object_property_set_link(OBJECT(&s->cpu[i]), "memory",
+        object_property_set_link(OBJECT(&a->cpu[i]), "memory",
                                  OBJECT(s->memory), &error_abort);
-        if (!qdev_realize(DEVICE(&s->cpu[i]), NULL, errp)) {
+        if (!qdev_realize(DEVICE(&a->cpu[i]), NULL, errp)) {
             return;
         }
     }
 
     /* SRAM */
-    sram_name = g_strdup_printf("aspeed.sram.%d", CPU(&s->cpu[0])->cpu_index);
+    sram_name = g_strdup_printf("aspeed.sram.%d", CPU(&a->cpu[0])->cpu_index);
     memory_region_init_ram(&s->sram, OBJECT(s), sram_name, sc->sram_size, &err);
     if (err) {
         error_propagate(errp, err);
@@ -288,14 +291,14 @@ static void aspeed_ast2400_soc_realize(DeviceState *dev, Error **errp)
     aspeed_mmio_map(s, SYS_BUS_DEVICE(&s->scu), 0, sc->memmap[ASPEED_DEV_SCU]);
 
     /* VIC */
-    if (!sysbus_realize(SYS_BUS_DEVICE(&s->vic), errp)) {
+    if (!sysbus_realize(SYS_BUS_DEVICE(&a->vic), errp)) {
         return;
     }
-    aspeed_mmio_map(s, SYS_BUS_DEVICE(&s->vic), 0, sc->memmap[ASPEED_DEV_VIC]);
-    sysbus_connect_irq(SYS_BUS_DEVICE(&s->vic), 0,
-                       qdev_get_gpio_in(DEVICE(&s->cpu), ARM_CPU_IRQ));
-    sysbus_connect_irq(SYS_BUS_DEVICE(&s->vic), 1,
-                       qdev_get_gpio_in(DEVICE(&s->cpu), ARM_CPU_FIQ));
+    aspeed_mmio_map(s, SYS_BUS_DEVICE(&a->vic), 0, sc->memmap[ASPEED_DEV_VIC]);
+    sysbus_connect_irq(SYS_BUS_DEVICE(&a->vic), 0,
+                       qdev_get_gpio_in(DEVICE(&a->cpu), ARM_CPU_IRQ));
+    sysbus_connect_irq(SYS_BUS_DEVICE(&a->vic), 1,
+                       qdev_get_gpio_in(DEVICE(&a->cpu), ARM_CPU_FIQ));
 
     /* RTC */
     if (!sysbus_realize(SYS_BUS_DEVICE(&s->rtc), errp)) {
diff --git a/hw/arm/meson.build b/hw/arm/meson.build
index 42e7aa36f3..68245d3ad1 100644
--- a/hw/arm/meson.build
+++ b/hw/arm/meson.build
@@ -48,9 +48,9 @@ arm_ss.add(when: 'CONFIG_FSL_IMX25', if_true: files('fsl-imx25.c', 'imx25_pdk.c'
 arm_ss.add(when: 'CONFIG_FSL_IMX31', if_true: files('fsl-imx31.c', 'kzm.c'))
 arm_ss.add(when: 'CONFIG_FSL_IMX6', if_true: files('fsl-imx6.c'))
 arm_ss.add(when: 'CONFIG_ASPEED_SOC', if_true: files(
-  'aspeed_soc.c',
   'aspeed.c',
   'aspeed_soc_common.c',
+  'aspeed_ast2400.c',
   'aspeed_ast2600.c',
   'aspeed_ast10x0.c',
   'aspeed_eeprom.c',
-- 
2.41.0

