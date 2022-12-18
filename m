Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp2844476ejb;
        Sun, 18 Dec 2022 07:24:17 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvVv5BLzZqyLZPVscsy7Ysyw4Bpp+DWVCbODlhd3SQXeM8ya1GFGWRx8Umg0SLBesvUWD6U
X-Received: by 2002:a05:6214:448b:b0:4bb:a323:600b with SMTP id on11-20020a056214448b00b004bba323600bmr8502290qvb.6.1671377056944;
        Sun, 18 Dec 2022 07:24:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1671377056; cv=none;
        d=google.com; s=arc-20160816;
        b=szYep6ytHejpB0ErLAj3uaUYNIEKd1I4IOwoDMgHmLoppSzIi1ysj9HovjEPL1UEeD
         D24FPoyBf+B6IJLhAXxx9iizDiViKdIs5N/CVQNF8RUAU3gQVIXtHeA/1mDPstE3vim+
         Y3B+EgmW3h3yE/YxzFlSD6Pklw880dG3ILmQNTfivr2mgcO8ZChZaNJZ3yHKJx4ucw/x
         ndwaX2NeU5Se1jhBiJSJ9wycHX0iiA37BKA2MDNk+DD3dAZOgq0ffbSWkrpKP/CnvJEF
         D93C068f1XKpXAHGvHL0F2rDLwhHBR25MnjgEqry68KDISjC9OB7EXz52tgd7PZ22XBU
         5G/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=hcvEgX17Zsvo6JOaqqf3agGgGY7EyKmilb8OeV6ogUU=;
        b=i3csY+HaX89YwvkgbZk6v9R1avL6/VQ+su7yVGoMCi5IUlz5tHnjS97Zn+8GQcQqso
         W0RJk+8dwrZ9c9JDFnVvXyMZfxn/Q/5JSVZJWPws6tueBip4dtXTHd6bm+4p0MHMoRoy
         BFrBESB93Vrq3v0MTxvJp4FPCQWDwMTbdx2A2LozfynZJsgXvl1S7jtBGmrqzhuNIZiR
         k3Y+Ug3w2arW6CLlsZhR8/E8/soHMq8mCph9A3nYXtMxI2cFRZ8jGJj9fT+kDqrILxNt
         NoX27mJq5Y+Xr3oGA0QOBNQ9GViqyKNFH8UDLrdEG2pnM1w0EyZSSrRknwq/4Lq/IsOX
         LVHA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=MAmzqduX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id fq6-20020a056214258600b004e32bc22f2asi3295687qvb.400.2022.12.18.07.24.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 18 Dec 2022 07:24:16 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=MAmzqduX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1p6vVa-0005HI-5x; Sun, 18 Dec 2022 10:23:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balbi@kernel.org>)
 id 1p6nqp-0008BW-C6; Sun, 18 Dec 2022 02:12:47 -0500
Received: from dfw.source.kernel.org ([139.178.84.217])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balbi@kernel.org>)
 id 1p6nqn-0000lQ-MH; Sun, 18 Dec 2022 02:12:47 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id CC40160CF6;
 Sun, 18 Dec 2022 07:12:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1255C433EF;
 Sun, 18 Dec 2022 07:12:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1671347557;
 bh=b3d9vk3zLGZG4IIuROtpmXxmwdL8U1GX7bE+FZvVm0Q=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=MAmzqduXM8ukzRDLKxBcnf7K0nW9a5pfKiRsnuhDGyYIYfqoLzkPpSogMCFn7HVTv
 kir8+VtkedJYnTZrDGaytV+LG81vSFabTN47fSAloR7s/YlA7yyuQF+sIwtM7Oer1q
 SRirKqcQJ4T/fvUWWV1P7+8JSb1nfH0TvNELPWNTD6GQZW46+I1HgpIl0l3eANNHVV
 HQSJnto1qD3ylEShsITl27iifq8SrUy8PML/F/Tv/B9wYB1nWmWByK9ritnbXeuATd
 /TLjAIFN0UHRunY4Dm5/Hx1ef7zJkVuTh6k2Lewp43vpA4rm5GGnK3tsFk3mEtgP4G
 ZaXY6FA+fMmcw==
From: Felipe Balbi <balbi@kernel.org>
To: Alistair Francis <alistair@alistair23.me>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, Felipe Balbi <balbi@kernel.org>
Subject: [PATCH 1/2] hw/arm/stm32f405: correctly describe the memory layout
Date: Sun, 18 Dec 2022 09:12:28 +0200
Message-Id: <20221218071229.484944-2-balbi@kernel.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221218071229.484944-1-balbi@kernel.org>
References: <20221218071229.484944-1-balbi@kernel.org>
MIME-Version: 1.0
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
X-Mailman-Approved-At: Sun, 18 Dec 2022 10:23:20 -0500
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
X-TUID: LuWcuJRoZpjw

STM32F405 has 128K of SRAM and another 64K of CCM (Core-coupled
Memory) at a different base address. Correctly describe the memory
layout to give existing FW images have a chance to run unmodified.

Signed-off-by: Felipe Balbi <balbi@kernel.org>
---
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
2.38.1

