Received: by 2002:a17:504:664e:b0:1be9:327d:8ee3 with SMTP id l14csp5602075njk;
        Thu, 26 Dec 2024 00:29:22 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCX673YXAOkaIpsbQmosBOE2pp3StZc1OURSBWr8W41iO9VB8rn4UjEqF+s9auEu6NvZ/NORjmHb6L1t/A==@linaro.org
X-Google-Smtp-Source: AGHT+IHzxHdrDIBLg4m2ZEDzhPnx/Bd/yX37UVwsIS0DUGJ3TZUBwtOj5clNu5YKK/IrEvaJqWhR
X-Received: by 2002:ad4:5d4e:0:b0:6d4:254f:1c8e with SMTP id 6a1803df08f44-6dd2339dab5mr289102466d6.37.1735201762459;
        Thu, 26 Dec 2024 00:29:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1735201762; cv=none;
        d=google.com; s=arc-20240605;
        b=Z+wxxVe1MZKq16N/eIHWwvyjCegOjysVBG18t5DYDGrdOtilN5uCTzVS75zdLhfdIW
         jj48o9h/UprK+fTdXld0D6204NB5PnkUOGFH568QEgh5Nd3FZqfkP9Z4fsIWnCjan4fy
         CeOjlYz7KGbZcdzcfCxtCsoNBGIw968zIj+yuVI1BJ/xI0E8DPT/D2iqPMoyquQISJ4L
         az3FNgrRi+YVKAup3SRWalzMQAYd0RRXHEW31skrq/Pe6h/Zw7qg/3kKN0EI3e05jnU3
         B+LLArnPS4g2fXr92+tbG/OrFws+97+g5ebFALP8PjrKNHnlQ1+VsMuj+3MDcpf/IIj/
         Bhag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:message-id
         :references:mime-version:in-reply-to:date:dkim-signature;
        bh=y7VgKIyKOGLTsJ2xUWEPCl+kAMd8H5DMHmwH0IVzMCc=;
        fh=luqczq21R/WVyFsAXY3xjiSk+tbt+bB+3AXcxVMujQk=;
        b=hgr0N8x7NCNempEfN9INc4hp0JuCNPWubHAoHpjlIkp+vzrODQTznsYVK4Smfrmsd1
         ehISdBAlcEFWZWDOF51ev6XsWfBXLR1MzU0bGkFDYr+QDNXXXxxc0z1jytkdAEd4Pg4u
         cAqIz5A897bEc4d31DrxvDWXsIX+Zuksab+Xm6yZMjalBErBk4dWnkqeNERE+7BuZYno
         b52keczOnmWyYB+FDcB2Ffzg45yLcItVzfuyEfh1ZY790JojXqvq3AoTQ10oTVVbyyPa
         FLV/R7PeJUs94X5ucZWnLOg7Iup3pAjEOM8QbP4eYLNc2fCxcnIJ0Eqg9lPaenB9klGs
         dbCQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=FvDTnYxv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6dd18353c71si194743656d6.386.2024.12.26.00.29.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 26 Dec 2024 00:29:22 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=FvDTnYxv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tQjEz-0005uO-9J; Thu, 26 Dec 2024 03:29:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3xhNtZwgKCOMbZMFTYXMLTTLQJ.HTRVJRZ-FWRSTSLSZ.TWL@flex--wuhaotsh.bounces.google.com>)
 id 1tQjEo-0005Co-2Y
 for qemu-arm@nongnu.org; Thu, 26 Dec 2024 03:29:00 -0500
Received: from mail-pl1-x649.google.com ([2607:f8b0:4864:20::649])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3xhNtZwgKCOMbZMFTYXMLTTLQJ.HTRVJRZ-FWRSTSLSZ.TWL@flex--wuhaotsh.bounces.google.com>)
 id 1tQjEm-0001GV-CM
 for qemu-arm@nongnu.org; Thu, 26 Dec 2024 03:28:57 -0500
Received: by mail-pl1-x649.google.com with SMTP id
 d9443c01a7336-2166464e236so132090395ad.1
 for <qemu-arm@nongnu.org>; Thu, 26 Dec 2024 00:28:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1735201734; x=1735806534; darn=nongnu.org;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=y7VgKIyKOGLTsJ2xUWEPCl+kAMd8H5DMHmwH0IVzMCc=;
 b=FvDTnYxv2bvICZTqZkZZ4TvTg2YW6waYcVM5apZ+ArwbMVU3moN6hbB9b6cR/FSSYZ
 g4owN0gGp/zbt47/AjUSE+4+B2M7M02If6kEXZ1B8nrZnzJk/nryyodcTBdVQGYETDa6
 qmKuSEe/ZkwTB6ZcBmqcD+CZJ3ARxBflgi4/zLg286yK4QN5KcDd7zimZFXvBjE8dqMk
 b9lQ8pLldTmT3MESmMzLf3sDYgytGC0wQ8GOjUPiUD25i5U8yyU7OBcaibNB/enKXQzu
 REv/SyEaiGCp0hvEFvlgBID9LtzvPCoriJSbuCi2RUt4tkqvLdcnT3A+AcOSL9mT44As
 vwTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735201734; x=1735806534;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=y7VgKIyKOGLTsJ2xUWEPCl+kAMd8H5DMHmwH0IVzMCc=;
 b=CMCH0w6ydFyfFpGJf9V0Q0xqLLZbTV/n/tIendGnBH0GzA+7dbAQClfqZwvTCvoe1U
 nVUH54syM1ZhP5fhTToZqu5Zhb9SAyhZ1xY5s6saJ036cTxGw+PwRU6wSQioluabVQnp
 tfscmTr1t5obnpeC+oQyqaaAU/sMBEr9pNtO5FSv38t81r2zgKDOhLvzN7ebZzD8pQHN
 G6QfZhwmwUqrfrdqXN7XKIGv/6ZyAXb08BBUcoL+U3r09Iet14k5LlAn0UB3B/Ab/rdE
 JswCwFXPm6BrQff2s5u+AVB+2gR++q6HoLaux5QpmzFUdPfssMYQu2A53s7CVyg6WOqp
 Y0Iw==
X-Gm-Message-State: AOJu0Yw9oNxJYvaLzoSgijQZWg3zxHunenstIpRfWe4bc7nzEIP2sdCq
 XGavZJbd1xZZsn3K+FFf7gfWkk6bN+Z69WT6M6+kAm67fXZQbnMmyxdLXOJZfzrxiVnB/cG0v03
 yaD/V2BrkYw==
X-Received: from pgmo10.prod.google.com ([2002:a63:5d4a:0:b0:8ae:4cf4:372])
 (user=wuhaotsh job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a20:244a:b0:1db:ff76:99d7 with SMTP id
 adf61e73a8af0-1e5e07ef1afmr43615669637.35.1735201734092; 
 Thu, 26 Dec 2024 00:28:54 -0800 (PST)
Date: Thu, 26 Dec 2024 08:27:57 +0000
In-Reply-To: <20241226082800.2887689-1-wuhaotsh@google.com>
Mime-Version: 1.0
References: <20241226082800.2887689-1-wuhaotsh@google.com>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20241226082800.2887689-15-wuhaotsh@google.com>
Subject: [PATCH v2 14/17] hw/misc: Support NPCM8XX CLK Module Registers
From: Hao Wu <wuhaotsh@google.com>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, Avi.Fishman@nuvoton.com, 
 kfting@nuvoton.com, titusr@google.com, mimik-dev@google.com, 
 hskinnemoen@google.com, venture@google.com, pbonzini@redhat.com, 
 jasowang@redhat.com, alistair@alistair23.me, Hao Wu <wuhaotsh@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::649;
 envelope-from=3xhNtZwgKCOMbZMFTYXMLTTLQJ.HTRVJRZ-FWRSTSLSZ.TWL@flex--wuhaotsh.bounces.google.com;
 helo=mail-pl1-x649.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=unavailable autolearn_force=no
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
X-TUID: ntfmhP60SblI

NPCM8XX adds a few new registers and have a different set of reset
values to the CLK modules. This patch supports them.

This patch doesn't support the new clock values generated by these
registers. Currently no modules use these new clock values so they
are not necessary at this point.
Implementation of these clocks might be required when implementing
these modules.

Signed-off-by: Hao Wu <wuhaotsh@google.com>
Reviewed-by: Titus Rwantare<titusr@google.com>
---
 hw/misc/npcm_clk.c         | 113 ++++++++++++++++++++++++++++++++++++-
 include/hw/misc/npcm_clk.h |  10 +++-
 2 files changed, 120 insertions(+), 3 deletions(-)

diff --git a/hw/misc/npcm_clk.c b/hw/misc/npcm_clk.c
index eee754d31f..af127991da 100644
--- a/hw/misc/npcm_clk.c
+++ b/hw/misc/npcm_clk.c
@@ -1,5 +1,5 @@
 /*
- * Nuvoton NPCM7xx Clock Control Registers.
+ * Nuvoton NPCM7xx/8xx Clock Control Registers.
  *
  * Copyright 2020 Google LLC
  *
@@ -75,6 +75,58 @@ enum NPCM7xxCLKRegisters {
     NPCM7XX_CLK_REGS_END,
 };
 
+enum NPCM8xxCLKRegisters {
+    NPCM8XX_CLK_CLKEN1,
+    NPCM8XX_CLK_CLKSEL,
+    NPCM8XX_CLK_CLKDIV1,
+    NPCM8XX_CLK_PLLCON0,
+    NPCM8XX_CLK_PLLCON1,
+    NPCM8XX_CLK_SWRSTR,
+    NPCM8XX_CLK_IPSRST1         = 0x20 / sizeof(uint32_t),
+    NPCM8XX_CLK_IPSRST2,
+    NPCM8XX_CLK_CLKEN2,
+    NPCM8XX_CLK_CLKDIV2,
+    NPCM8XX_CLK_CLKEN3,
+    NPCM8XX_CLK_IPSRST3,
+    NPCM8XX_CLK_WD0RCR,
+    NPCM8XX_CLK_WD1RCR,
+    NPCM8XX_CLK_WD2RCR,
+    NPCM8XX_CLK_SWRSTC1,
+    NPCM8XX_CLK_SWRSTC2,
+    NPCM8XX_CLK_SWRSTC3,
+    NPCM8XX_CLK_TIPRSTC,
+    NPCM8XX_CLK_PLLCON2,
+    NPCM8XX_CLK_CLKDIV3,
+    NPCM8XX_CLK_CORSTC,
+    NPCM8XX_CLK_PLLCONG,
+    NPCM8XX_CLK_AHBCKFI,
+    NPCM8XX_CLK_SECCNT,
+    NPCM8XX_CLK_CNTR25M,
+    /* Registers unique to NPCM8XX SoC */
+    NPCM8XX_CLK_CLKEN4,
+    NPCM8XX_CLK_IPSRST4,
+    NPCM8XX_CLK_BUSTO,
+    NPCM8XX_CLK_CLKDIV4,
+    NPCM8XX_CLK_WD0RCRB,
+    NPCM8XX_CLK_WD1RCRB,
+    NPCM8XX_CLK_WD2RCRB,
+    NPCM8XX_CLK_SWRSTC1B,
+    NPCM8XX_CLK_SWRSTC2B,
+    NPCM8XX_CLK_SWRSTC3B,
+    NPCM8XX_CLK_TIPRSTCB,
+    NPCM8XX_CLK_CORSTCB,
+    NPCM8XX_CLK_IPSRSTDIS1,
+    NPCM8XX_CLK_IPSRSTDIS2,
+    NPCM8XX_CLK_IPSRSTDIS3,
+    NPCM8XX_CLK_IPSRSTDIS4,
+    NPCM8XX_CLK_CLKENDIS1,
+    NPCM8XX_CLK_CLKENDIS2,
+    NPCM8XX_CLK_CLKENDIS3,
+    NPCM8XX_CLK_CLKENDIS4,
+    NPCM8XX_CLK_THRTL_CNT,
+    NPCM8XX_CLK_REGS_END,
+};
+
 /*
  * These reset values were taken from version 0.91 of the NPCM750R data sheet.
  *
@@ -103,6 +155,46 @@ static const uint32_t npcm7xx_cold_reset_values[NPCM7XX_CLK_NR_REGS] = {
     [NPCM7XX_CLK_AHBCKFI]       = 0x000000c8,
 };
 
+/*
+ * These reset values were taken from version 0.92 of the NPCM8xx data sheet.
+ */
+static const uint32_t npcm8xx_cold_reset_values[NPCM8XX_CLK_NR_REGS] = {
+    [NPCM8XX_CLK_CLKEN1]        = 0xffffffff,
+    [NPCM8XX_CLK_CLKSEL]        = 0x154aaaaa,
+    [NPCM8XX_CLK_CLKDIV1]       = 0x5413f855,
+    [NPCM8XX_CLK_PLLCON0]       = 0x00222101 | PLLCON_LOKI,
+    [NPCM8XX_CLK_PLLCON1]       = 0x00202101 | PLLCON_LOKI,
+    [NPCM8XX_CLK_IPSRST1]       = 0x00001000,
+    [NPCM8XX_CLK_IPSRST2]       = 0x80000000,
+    [NPCM8XX_CLK_CLKEN2]        = 0xffffffff,
+    [NPCM8XX_CLK_CLKDIV2]       = 0xaa4f8f9f,
+    [NPCM8XX_CLK_CLKEN3]        = 0xffffffff,
+    [NPCM8XX_CLK_IPSRST3]       = 0x03000000,
+    [NPCM8XX_CLK_WD0RCR]        = 0xffffffff,
+    [NPCM8XX_CLK_WD1RCR]        = 0xffffffff,
+    [NPCM8XX_CLK_WD2RCR]        = 0xffffffff,
+    [NPCM8XX_CLK_SWRSTC1]       = 0x00000003,
+    [NPCM8XX_CLK_SWRSTC2]       = 0x00000001,
+    [NPCM8XX_CLK_SWRSTC3]       = 0x00000001,
+    [NPCM8XX_CLK_TIPRSTC]       = 0x00000001,
+    [NPCM8XX_CLK_PLLCON2]       = 0x00c02105 | PLLCON_LOKI,
+    [NPCM8XX_CLK_CLKDIV3]       = 0x00009100,
+    [NPCM8XX_CLK_CORSTC]        = 0x04000003,
+    [NPCM8XX_CLK_PLLCONG]       = 0x01228606 | PLLCON_LOKI,
+    [NPCM8XX_CLK_AHBCKFI]       = 0x000000c8,
+    [NPCM8XX_CLK_CLKEN4]        = 0xffffffff,
+    [NPCM8XX_CLK_CLKDIV4]       = 0x70009000,
+    [NPCM8XX_CLK_IPSRST4]       = 0x02000000,
+    [NPCM8XX_CLK_WD0RCRB]       = 0xfffffe71,
+    [NPCM8XX_CLK_WD1RCRB]       = 0xfffffe71,
+    [NPCM8XX_CLK_WD2RCRB]       = 0xfffffe71,
+    [NPCM8XX_CLK_SWRSTC1B]      = 0xfffffe71,
+    [NPCM8XX_CLK_SWRSTC2B]      = 0xfffffe71,
+    [NPCM8XX_CLK_SWRSTC3B]      = 0xfffffe71,
+    [NPCM8XX_CLK_TIPRSTCB]      = 0xfffffe71,
+    [NPCM8XX_CLK_CORSTCB]       = 0xfffffe71,
+};
+
 /* The number of watchdogs that can trigger a reset. */
 #define NPCM7XX_NR_WATCHDOGS    (3)
 
@@ -1056,6 +1148,18 @@ static void npcm7xx_clk_class_init(ObjectClass *klass, void *data)
     c->cold_reset_values = npcm7xx_cold_reset_values;
 }
 
+static void npcm8xx_clk_class_init(ObjectClass *klass, void *data)
+{
+    NPCMCLKClass *c = NPCM_CLK_CLASS(klass);
+    DeviceClass *dc = DEVICE_CLASS(klass);
+
+    QEMU_BUILD_BUG_ON(NPCM8XX_CLK_REGS_END > NPCM_CLK_MAX_NR_REGS);
+    QEMU_BUILD_BUG_ON(NPCM8XX_CLK_REGS_END != NPCM8XX_CLK_NR_REGS);
+    dc->desc = "NPCM8xx Clock Control Registers";
+    c->nr_regs = NPCM8XX_CLK_NR_REGS;
+    c->cold_reset_values = npcm8xx_cold_reset_values;
+}
+
 static const TypeInfo npcm7xx_clk_pll_info = {
     .name               = TYPE_NPCM7XX_CLOCK_PLL,
     .parent             = TYPE_DEVICE,
@@ -1096,6 +1200,12 @@ static const TypeInfo npcm7xx_clk_info = {
     .class_init         = npcm7xx_clk_class_init,
 };
 
+static const TypeInfo npcm8xx_clk_info = {
+    .name               = TYPE_NPCM8XX_CLK,
+    .parent             = TYPE_NPCM_CLK,
+    .class_init         = npcm8xx_clk_class_init,
+};
+
 static void npcm7xx_clk_register_type(void)
 {
     type_register_static(&npcm7xx_clk_pll_info);
@@ -1103,5 +1213,6 @@ static void npcm7xx_clk_register_type(void)
     type_register_static(&npcm7xx_clk_divider_info);
     type_register_static(&npcm_clk_info);
     type_register_static(&npcm7xx_clk_info);
+    type_register_static(&npcm8xx_clk_info);
 }
 type_init(npcm7xx_clk_register_type);
diff --git a/include/hw/misc/npcm_clk.h b/include/hw/misc/npcm_clk.h
index f47614ac8d..8fa1e14bdd 100644
--- a/include/hw/misc/npcm_clk.h
+++ b/include/hw/misc/npcm_clk.h
@@ -1,5 +1,5 @@
 /*
- * Nuvoton NPCM7xx Clock Control Registers.
+ * Nuvoton NPCM7xx/8xx Clock Control Registers.
  *
  * Copyright 2020 Google LLC
  *
@@ -21,11 +21,12 @@
 #include "hw/sysbus.h"
 
 #define NPCM7XX_CLK_NR_REGS             (0x70 / sizeof(uint32_t))
+#define NPCM8XX_CLK_NR_REGS             (0xc4 / sizeof(uint32_t))
 /*
  * Number of maximum registers in NPCM device state structure. Don't change
  * this without incrementing the version_id in the vmstate.
  */
-#define NPCM_CLK_MAX_NR_REGS            NPCM7XX_CLK_NR_REGS
+#define NPCM_CLK_MAX_NR_REGS            NPCM8XX_CLK_NR_REGS
 
 #define NPCM7XX_WATCHDOG_RESET_GPIO_IN "npcm7xx-clk-watchdog-reset-gpio-in"
 
@@ -162,6 +163,10 @@ struct NPCMCLKState {
     MemoryRegion iomem;
 
     /* Clock converters */
+    /*
+     * TODO: Implement unique clock converters for NPCM8xx.
+     * NPCM8xx adds a few more clock outputs.
+     */
     NPCM7xxClockPLLState plls[NPCM7XX_CLOCK_NR_PLLS];
     NPCM7xxClockSELState sels[NPCM7XX_CLOCK_NR_SELS];
     NPCM7xxClockDividerState dividers[NPCM7XX_CLOCK_NR_DIVIDERS];
@@ -185,5 +190,6 @@ typedef struct NPCMCLKClass {
 #define TYPE_NPCM_CLK "npcm-clk"
 OBJECT_DECLARE_TYPE(NPCMCLKState, NPCMCLKClass, NPCM_CLK)
 #define TYPE_NPCM7XX_CLK "npcm7xx-clk"
+#define TYPE_NPCM8XX_CLK "npcm8xx-clk"
 
 #endif /* NPCM_CLK_H */
-- 
2.47.1.613.gc27f4b7a9f-goog

