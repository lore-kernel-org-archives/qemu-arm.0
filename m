Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp4948627ejb;
        Fri, 30 Dec 2022 06:58:58 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvwZjdRL9xWJXTYvUujRJ0aSURbcuE88lEWMN6pTCaz+/UprFLDdvGd7BDg0DYvIL2Z1P7u
X-Received: by 2002:ad4:46d4:0:b0:4c6:ef2f:827a with SMTP id pm20-20020ad446d4000000b004c6ef2f827amr68159358qvb.5.1672412338747;
        Fri, 30 Dec 2022 06:58:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1672412338; cv=none;
        d=google.com; s=arc-20160816;
        b=cEp884ESv7NFultiMnbjOLQ2Lyyt9MJ1T1wB/fPkaQuU023mba9NjB4b04R7KmklIp
         CmLyhak1Wmy7ZEpJCgxVFRxMR19AYZ5ohmhdIfNpkNtX3gVfZr8xZUI8WxSOAG+suFIL
         orfBSufSOHeqEzGelosqitHw5BlUiOBe9XJxZvohByv0iE5k/C1tFpOSPMS0dbCYA+Tx
         uov4y2RppTVnKidMmXSg4oagpIW6Ys/a/oyOL5CuocRVVZtbZGIEV2nWi+sH+mqbzkJV
         I2uT+AoCPZldj0T+XvCUuioqoTt5FzZ+J61JK1Q1ROZRJo8iTTgBE0m/CDfzUsm05LXH
         CFgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=U/Nk8gJKOu+Wd1xGoiLRIOJEf3ci/5fQf7tVlXDcnaw=;
        b=hdLbt+QCS6SdPeE+DbH4d6dFalC04Rc9wvB16rjYY7KTvJpR/bm+kjNv7chqazwIvM
         iCIt095aDxktQ8UtvF4awIvUKhneC8gLieky0MkJZS97QZudE7PvYO6disTmilxuzSRP
         158Hdflbdn3Pd6IEAwUubk/nsES3hL0VbX/I0J/8lL115UmygTC0nVkjcM+UrsE8i9N4
         cCIQ8UtV0Xc8GJmyG2gZ9/WfvJrS8XMAB1YG3EeR+YbFbETBzlfKxFlQTu6pLxCivdkM
         Ajuu6PaQv6x3X28ZrrVKAI5ZzgGnl0Wev7qSSkxrMXq36tazCynT46pkaRXlwzQvl4mH
         FPzw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=CialPsGj;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q5-20020a37f705000000b007023ab9c2casi9546856qkj.489.2022.12.30.06.58.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 30 Dec 2022 06:58:58 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=CialPsGj;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pBGpY-00006B-Il; Fri, 30 Dec 2022 09:57:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balbi@kernel.org>)
 id 1pBGpU-0008WH-Q6; Fri, 30 Dec 2022 09:57:52 -0500
Received: from dfw.source.kernel.org ([139.178.84.217])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balbi@kernel.org>)
 id 1pBGpT-0000V5-7X; Fri, 30 Dec 2022 09:57:52 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D8DF761548;
 Fri, 30 Dec 2022 14:57:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77699C433F1;
 Fri, 30 Dec 2022 14:57:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1672412262;
 bh=8uO/hG+gqxwzfZetPnXbVsoGAJrSaIma2YNzOEHR3wQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=CialPsGjCbXsWKbj+Qgd4KYIvd+8eFcpLzAJDbNjQw8s+m2ZnojNepDZhXYFvOi0M
 94SML0PzXfaIFH1ZGIMQhO3nCG57IDAjl6H8V7yYu8JH0stscUNZFFxyKHqC+4eUO9
 EeeAz2K76YBbG1Bb5G0xIV+CEIQINdX/Bg7EzXp/tdLguKnjjX+sjSqwJSA8rEPwWG
 n5ViZCdU9xvyaIs4YjgRXYAT5XSH/+3KZDQnHesTgT0b7Y4lHnUGYXai3J+J4ZXRTC
 V0MCSUglbPamSDcKuQvmly6fk1/VnX3G4pDK5Ceb4Hev2cGJbpNKleAcLGNlxysqBx
 4hSs1uAPSEBYg==
From: Felipe Balbi <balbi@kernel.org>
To: Alistair Francis <alistair@alistair23.me>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Felipe Balbi <balbi@kernel.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 1/2] hw/arm/stm32f405: correctly describe the memory layout
Date: Fri, 30 Dec 2022 16:57:32 +0200
Message-Id: <20221230145733.200496-2-balbi@kernel.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221230145733.200496-1-balbi@kernel.org>
References: <20221230145733.200496-1-balbi@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=139.178.84.217; envelope-from=balbi@kernel.org;
 helo=dfw.source.kernel.org
X-Spam_score_int: -70
X-Spam_score: -7.1
X-Spam_bar: -------
X-Spam_report: (-7.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: fnyBckVe4vmT

STM32F405 has 128K of SRAM and another 64K of CCM (Core-coupled
Memory) at a different base address. Correctly describe the memory
layout to give existing FW images a chance to run unmodified.

Reviewed-by: Alistair Francis <alistair@alistair23.me>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Felipe Balbi <balbi@kernel.org>
---

Changes since v1:
	- None

 hw/arm/stm32f405_soc.c         | 8 ++++++++
 include/hw/arm/stm32f405_soc.h | 5 ++++-
 2 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/hw/arm/stm32f405_soc.c b/hw/arm/stm32f405_soc.c
index c07947d9f8b1..cef23d7ee41a 100644
--- a/hw/arm/stm32f405_soc.c
+++ b/hw/arm/stm32f405_soc.c
@@ -139,6 +139,14 @@ static void stm32f405_soc_realize(DeviceState *dev_soc, Error **errp)
     }
     memory_region_add_subregion(system_memory, SRAM_BASE_ADDRESS, &s->sram);
 
+    memory_region_init_ram(&s->ccm, NULL, "STM32F405.ccm", CCM_SIZE,
+                           &err);
+    if (err != NULL) {
+        error_propagate(errp, err);
+        return;
+    }
+    memory_region_add_subregion(system_memory, CCM_BASE_ADDRESS, &s->ccm);
+
     armv7m = DEVICE(&s->armv7m);
     qdev_prop_set_uint32(armv7m, "num-irq", 96);
     qdev_prop_set_string(armv7m, "cpu-type", s->cpu_type);
diff --git a/include/hw/arm/stm32f405_soc.h b/include/hw/arm/stm32f405_soc.h
index 5bb0c8d56979..249ab5434ec7 100644
--- a/include/hw/arm/stm32f405_soc.h
+++ b/include/hw/arm/stm32f405_soc.h
@@ -46,7 +46,9 @@ OBJECT_DECLARE_SIMPLE_TYPE(STM32F405State, STM32F405_SOC)
 #define FLASH_BASE_ADDRESS 0x08000000
 #define FLASH_SIZE (1024 * 1024)
 #define SRAM_BASE_ADDRESS 0x20000000
-#define SRAM_SIZE (192 * 1024)
+#define SRAM_SIZE (128 * 1024)
+#define CCM_BASE_ADDRESS 0x10000000
+#define CCM_SIZE (64 * 1024)
 
 struct STM32F405State {
     /*< private >*/
@@ -65,6 +67,7 @@ struct STM32F405State {
     STM32F2XXADCState adc[STM_NUM_ADCS];
     STM32F2XXSPIState spi[STM_NUM_SPIS];
 
+    MemoryRegion ccm;
     MemoryRegion sram;
     MemoryRegion flash;
     MemoryRegion flash_alias;
-- 
2.39.0

