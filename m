Received: by 2002:a17:504:664e:b0:1be9:327d:8ee3 with SMTP id l14csp5601876njk;
        Thu, 26 Dec 2024 00:28:49 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCV7Rm5q/Xz18lTVkfjnt5S95P76pf0u2adeH6Q86cPqkkqlyK6YEoi/+B/qpe9Crjk+dxlgUQtM2BnPgg==@linaro.org
X-Google-Smtp-Source: AGHT+IGylcj/xbYczfSMCz7AXPTtbPxI2qafZ2yMZr8wJIelJAICyBw9knU8i8ByJ7atAL38QpnL
X-Received: by 2002:a05:620a:2985:b0:7b6:6d5a:d51b with SMTP id af79cd13be357-7b9ba8102a1mr3913000285a.52.1735201729070;
        Thu, 26 Dec 2024 00:28:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1735201729; cv=none;
        d=google.com; s=arc-20240605;
        b=Ca5wZphouVayygA3KBTKC8ZJzPWqc/U7tcTi31FguPSDkowAZpbJnpItZGZIRR/IJf
         C+ywH/pObwdVuDrXaj62BfZCOJjWpzTNvw99gL2k95VJ7Kp7tOpqaOv4iFU14IF9kw5s
         ct9IX8rlXm+1LeMjxJHSpTCKpCP2tIDvPqYKEfG95QzX2uyNFujHKsqnjxEjCBghVBnN
         IEWyyU56J8UqawV8et9RQZ7HPcunhMRLKLhkf0D0b20VuABAe0ufjmysbNxPYUncL70O
         e2XtKC5KMBUU+/6aHZdr7QDri096sZkOvSvsul/9sewZKLXniHbuz/tA127z+5UyQqly
         h+DQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:message-id
         :references:mime-version:in-reply-to:date:dkim-signature;
        bh=p/jxfIHJDMTwko8UxNWSo9R6EjZKYMOEyl+7ZxDg9LY=;
        fh=luqczq21R/WVyFsAXY3xjiSk+tbt+bB+3AXcxVMujQk=;
        b=D1nPlSHNpuZ+KahXQdqz+Cm/1NHVIxkwqNJ0SODEZWu75KkH7jITNRtbA6VbLrcQOe
         tJt/tyFU5m1TbkmMqm3jPhbbztlpKgpyyvsOzCtFGc1lk0ddqVahlOIUTBpegpPrv6oW
         khyaBGu+qlH7cCdv9gflZvEnU9OO3Ac55xXzsNOKZP5AaDHqt6yBvKKMF4PY0TdJ7S7y
         NhSbQ2E5KbMBHOhPl1N6+lqh340KZLxfHuZy8cfTPTv2st5GYDCZ4M9J4j5+wfjEk1Ae
         llfJYYKWPrxpPhvCWmNAfPMGVrhdspN3ddKlELzgaIBo4IcaX8MBGCgl1OPIQXyrE4CF
         /oiQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=yYwLk5dO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7b9ac4f2773si1690582385a.512.2024.12.26.00.28.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 26 Dec 2024 00:28:49 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=yYwLk5dO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tQjEV-0003sh-Ct; Thu, 26 Dec 2024 03:28:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3sRNtZwgKCM4GE1u8DC108805y.w86Ay6E-uB678707E.8B0@flex--wuhaotsh.bounces.google.com>)
 id 1tQjET-0003kh-8q
 for qemu-arm@nongnu.org; Thu, 26 Dec 2024 03:28:37 -0500
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3sRNtZwgKCM4GE1u8DC108805y.w86Ay6E-uB678707E.8B0@flex--wuhaotsh.bounces.google.com>)
 id 1tQjER-0001Cy-D7
 for qemu-arm@nongnu.org; Thu, 26 Dec 2024 03:28:36 -0500
Received: by mail-pj1-x1049.google.com with SMTP id
 98e67ed59e1d1-2ef9204f898so7606517a91.2
 for <qemu-arm@nongnu.org>; Thu, 26 Dec 2024 00:28:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1735201713; x=1735806513; darn=nongnu.org;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=p/jxfIHJDMTwko8UxNWSo9R6EjZKYMOEyl+7ZxDg9LY=;
 b=yYwLk5dOYKw7ZJWAG8EpaA8x3XeRekr/YUGLjn5lJwTceGfBdS1iHTgOHovPr7GN1e
 EBaNglukv/A17CQdRQXyHAggsy3UGGgotB/uB0wWb1QH5XW3Pz2fl1HfLN7/uPiIZes8
 wWR5xQUShet7bUyjBNwAwXEWOT8AlmBb53HRxlE8lgH7aImjqddr+knECriFgxzWqY1A
 XLU0IJEK5wpx7wdoBrPBkZ6WgTBzmk1Sp1K9XEeJCOfH4dAPwqAaymmpZRTrvKszOeNj
 ptTvjXsoJLwnM2bBALIQtl2FvRy5gqQrHSHlZC7MxRooKWHp5o9UjaaSpmpN/5WHVPhj
 vuyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735201713; x=1735806513;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=p/jxfIHJDMTwko8UxNWSo9R6EjZKYMOEyl+7ZxDg9LY=;
 b=EUQF1fRiTEN3+C4e1B5NJqY9Jl3fgEO1x3KQnCkZCdO+hicwde9qBIm/+Xj4nUKDkS
 DVUApqHHOERYWekl99aBwsdwC3Fv7qVymCKbsTMTV+lEsPytOEo4XgYJef3CsL2HSWNG
 vkt+uvAyb2tZsnOoqa3rfWyucJTSQlOGmrkMOpgKE0/No3qmEjNcCToO64RrI/B/ZmNA
 gaKvmXkCo9y4KwUhr6R5Di0FQwcdwujm4qg6vBO309En/ksl2EtLUlmosfdLaMvfO+7X
 pZvYQiu8hozzU2ATgohVht858n/IM0W4+jS2m5rcg9UqvSPMovnjbJnpOOW23fDp+I+x
 eARg==
X-Gm-Message-State: AOJu0Ywg6zFi5gwQRNH/nfaLo1hZcAmLpKVJ8aRHQVbG3m+KabuaJZ6N
 eEve1EOjjUAdzIoyOXaO80O1wUZ8Y+tSv8x3Rc7ubRFxBAT776iiavnLJNRCZP7DJ9ggNlu2axQ
 MbCIiy6FWNQ==
X-Received: from pfar2.prod.google.com ([2002:a05:6a00:a902:b0:726:d6e6:a38])
 (user=wuhaotsh job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:124a:b0:725:f4c6:6b68 with SMTP id
 d2e1a72fcca58-72abde404e9mr31313313b3a.4.1735201713351; 
 Thu, 26 Dec 2024 00:28:33 -0800 (PST)
Date: Thu, 26 Dec 2024 08:27:51 +0000
In-Reply-To: <20241226082800.2887689-1-wuhaotsh@google.com>
Mime-Version: 1.0
References: <20241226082800.2887689-1-wuhaotsh@google.com>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20241226082800.2887689-9-wuhaotsh@google.com>
Subject: [PATCH v2 08/17] hw/misc: Add support for NPCM8XX GCR
From: Hao Wu <wuhaotsh@google.com>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, Avi.Fishman@nuvoton.com, 
 kfting@nuvoton.com, titusr@google.com, mimik-dev@google.com, 
 hskinnemoen@google.com, venture@google.com, pbonzini@redhat.com, 
 jasowang@redhat.com, alistair@alistair23.me, Hao Wu <wuhaotsh@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1049;
 envelope-from=3sRNtZwgKCM4GE1u8DC108805y.w86Ay6E-uB678707E.8B0@flex--wuhaotsh.bounces.google.com;
 helo=mail-pj1-x1049.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
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
X-TUID: Vw0NbKhVxy5y

Signed-off-by: Hao Wu <wuhaotsh@google.com>
---
 hw/misc/npcm_gcr.c         | 131 ++++++++++++++++++++++++++++++++++++-
 include/hw/misc/npcm_gcr.h |   6 +-
 2 files changed, 134 insertions(+), 3 deletions(-)

diff --git a/hw/misc/npcm_gcr.c b/hw/misc/npcm_gcr.c
index 295073ba14..52d0fa07ea 100644
--- a/hw/misc/npcm_gcr.c
+++ b/hw/misc/npcm_gcr.c
@@ -1,5 +1,5 @@
 /*
- * Nuvoton NPCM7xx System Global Control Registers.
+ * Nuvoton NPCM7xx/8xx System Global Control Registers.
  *
  * Copyright 2020 Google LLC
  *
@@ -84,6 +84,118 @@ static const uint32_t npcm7xx_cold_reset_values[NPCM7XX_GCR_NR_REGS] = {
     [NPCM7XX_GCR_USB2PHYCTL]    = 0x034730e4,
 };
 
+enum NPCM8xxGCRRegisters {
+    NPCM8XX_GCR_PDID,
+    NPCM8XX_GCR_PWRON,
+    NPCM8XX_GCR_MISCPE          = 0x014 / sizeof(uint32_t),
+    NPCM8XX_GCR_FLOCKR2         = 0x020 / sizeof(uint32_t),
+    NPCM8XX_GCR_FLOCKR3,
+    NPCM8XX_GCR_A35_MODE        = 0x034 / sizeof(uint32_t),
+    NPCM8XX_GCR_SPSWC,
+    NPCM8XX_GCR_INTCR,
+    NPCM8XX_GCR_INTSR,
+    NPCM8XX_GCR_HIFCR           = 0x050 / sizeof(uint32_t),
+    NPCM8XX_GCR_INTCR2          = 0x060 / sizeof(uint32_t),
+    NPCM8XX_GCR_SRCNT           = 0x068 / sizeof(uint32_t),
+    NPCM8XX_GCR_RESSR,
+    NPCM8XX_GCR_RLOCKR1,
+    NPCM8XX_GCR_FLOCKR1,
+    NPCM8XX_GCR_DSCNT,
+    NPCM8XX_GCR_MDLR,
+    NPCM8XX_GCR_SCRPAD_C        = 0x080 / sizeof(uint32_t),
+    NPCM8XX_GCR_SCRPAD_B,
+    NPCM8XX_GCR_DAVCLVLR        = 0x098 / sizeof(uint32_t),
+    NPCM8XX_GCR_INTCR3,
+    NPCM8XX_GCR_PCIRCTL         = 0x0a0 / sizeof(uint32_t),
+    NPCM8XX_GCR_VSINTR,
+    NPCM8XX_GCR_SD2SUR1         = 0x0b4 / sizeof(uint32_t),
+    NPCM8XX_GCR_SD2SUR2,
+    NPCM8XX_GCR_INTCR4          = 0x0c0 / sizeof(uint32_t),
+    NPCM8XX_GCR_CPCTL           = 0x0d0 / sizeof(uint32_t),
+    NPCM8XX_GCR_CP2BST,
+    NPCM8XX_GCR_B2CPNT,
+    NPCM8XX_GCR_CPPCTL,
+    NPCM8XX_GCR_I2CSEGSEL       = 0x0e0 / sizeof(uint32_t),
+    NPCM8XX_GCR_I2CSEGCTL,
+    NPCM8XX_GCR_VSRCR,
+    NPCM8XX_GCR_MLOCKR,
+    NPCM8XX_GCR_SCRPAD          = 0x13c / sizeof(uint32_t),
+    NPCM8XX_GCR_USB1PHYCTL,
+    NPCM8XX_GCR_USB2PHYCTL,
+    NPCM8XX_GCR_USB3PHYCTL,
+    NPCM8XX_GCR_MFSEL1          = 0x260 / sizeof(uint32_t),
+    NPCM8XX_GCR_MFSEL2,
+    NPCM8XX_GCR_MFSEL3,
+    NPCM8XX_GCR_MFSEL4,
+    NPCM8XX_GCR_MFSEL5,
+    NPCM8XX_GCR_MFSEL6,
+    NPCM8XX_GCR_MFSEL7,
+    NPCM8XX_GCR_MFSEL_LK1       = 0x280 / sizeof(uint32_t),
+    NPCM8XX_GCR_MFSEL_LK2,
+    NPCM8XX_GCR_MFSEL_LK3,
+    NPCM8XX_GCR_MFSEL_LK4,
+    NPCM8XX_GCR_MFSEL_LK5,
+    NPCM8XX_GCR_MFSEL_LK6,
+    NPCM8XX_GCR_MFSEL_LK7,
+    NPCM8XX_GCR_MFSEL_SET1      = 0x2a0 / sizeof(uint32_t),
+    NPCM8XX_GCR_MFSEL_SET2,
+    NPCM8XX_GCR_MFSEL_SET3,
+    NPCM8XX_GCR_MFSEL_SET4,
+    NPCM8XX_GCR_MFSEL_SET5,
+    NPCM8XX_GCR_MFSEL_SET6,
+    NPCM8XX_GCR_MFSEL_SET7,
+    NPCM8XX_GCR_MFSEL_CLR1      = 0x2c0 / sizeof(uint32_t),
+    NPCM8XX_GCR_MFSEL_CLR2,
+    NPCM8XX_GCR_MFSEL_CLR3,
+    NPCM8XX_GCR_MFSEL_CLR4,
+    NPCM8XX_GCR_MFSEL_CLR5,
+    NPCM8XX_GCR_MFSEL_CLR6,
+    NPCM8XX_GCR_MFSEL_CLR7,
+    NPCM8XX_GCR_WD0RCRLK        = 0x400 / sizeof(uint32_t),
+    NPCM8XX_GCR_WD1RCRLK,
+    NPCM8XX_GCR_WD2RCRLK,
+    NPCM8XX_GCR_SWRSTC1LK,
+    NPCM8XX_GCR_SWRSTC2LK,
+    NPCM8XX_GCR_SWRSTC3LK,
+    NPCM8XX_GCR_TIPRSTCLK,
+    NPCM8XX_GCR_CORSTCLK,
+    NPCM8XX_GCR_WD0RCRBLK,
+    NPCM8XX_GCR_WD1RCRBLK,
+    NPCM8XX_GCR_WD2RCRBLK,
+    NPCM8XX_GCR_SWRSTC1BLK,
+    NPCM8XX_GCR_SWRSTC2BLK,
+    NPCM8XX_GCR_SWRSTC3BLK,
+    NPCM8XX_GCR_TIPRSTCBLK,
+    NPCM8XX_GCR_CORSTCBLK,
+    /* 64 scratch pad registers start here. 0xe00 ~ 0xefc */
+    NPCM8XX_GCR_SCRPAD_00       = 0xe00 / sizeof(uint32_t),
+    /* 32 semaphore registers start here. 0xf00 ~ 0xf7c */
+    NPCM8XX_GCR_GP_SEMFR_00     = 0xf00 / sizeof(uint32_t),
+    NPCM8XX_GCR_REGS_END        = 0xf80 / sizeof(uint32_t),
+};
+
+static const uint32_t npcm8xx_cold_reset_values[NPCM8XX_GCR_NR_REGS] = {
+    [NPCM8XX_GCR_PDID]          = 0x04a35850,   /* Arbel A1 */
+    [NPCM8XX_GCR_MISCPE]        = 0x0000ffff,
+    [NPCM8XX_GCR_A35_MODE]      = 0xfff4ff30,
+    [NPCM8XX_GCR_SPSWC]         = 0x00000003,
+    [NPCM8XX_GCR_INTCR]         = 0x0010035e,
+    [NPCM8XX_GCR_HIFCR]         = 0x0000004e,
+    [NPCM8XX_GCR_SD2SUR1]       = 0xfdc80000,
+    [NPCM8XX_GCR_SD2SUR2]       = 0x5200b130,
+    [NPCM8XX_GCR_INTCR2]        = (1U << 19),   /* DDR initialized */
+    [NPCM8XX_GCR_RESSR]         = 0x80000000,
+    [NPCM8XX_GCR_DAVCLVLR]      = 0x5a00f3cf,
+    [NPCM8XX_GCR_INTCR3]        = 0x5e001002,
+    [NPCM8XX_GCR_VSRCR]         = 0x00004800,
+    [NPCM8XX_GCR_SCRPAD]        = 0x00000008,
+    [NPCM8XX_GCR_USB1PHYCTL]    = 0x034730e4,
+    [NPCM8XX_GCR_USB2PHYCTL]    = 0x034730e4,
+    [NPCM8XX_GCR_USB3PHYCTL]    = 0x034730e4,
+    /* All 32 semaphores should be initialized to 1. */
+    [NPCM8XX_GCR_GP_SEMFR_00...NPCM8XX_GCR_REGS_END - 1] = 0x00000001,
+};
+
 static uint64_t npcm_gcr_read(void *opaque, hwaddr offset, unsigned size)
 {
     uint32_t reg = offset / sizeof(uint32_t);
@@ -261,6 +373,18 @@ static void npcm7xx_gcr_class_init(ObjectClass *klass, void *data)
     c->cold_reset_values = npcm7xx_cold_reset_values;
 }
 
+static void npcm8xx_gcr_class_init(ObjectClass *klass, void *data)
+{
+    NPCMGCRClass *c = NPCM_GCR_CLASS(klass);
+    DeviceClass *dc = DEVICE_CLASS(klass);
+
+    QEMU_BUILD_BUG_ON(NPCM8XX_GCR_REGS_END > NPCM_GCR_MAX_NR_REGS);
+    QEMU_BUILD_BUG_ON(NPCM8XX_GCR_REGS_END != NPCM8XX_GCR_NR_REGS);
+    dc->desc = "NPCM8xx System Global Control Registers";
+    c->nr_regs = NPCM8XX_GCR_NR_REGS;
+    c->cold_reset_values = npcm8xx_cold_reset_values;
+}
+
 static const TypeInfo npcm_gcr_info[] = {
     {
         .name               = TYPE_NPCM_GCR,
@@ -276,5 +400,10 @@ static const TypeInfo npcm_gcr_info[] = {
         .parent             = TYPE_NPCM_GCR,
         .class_init         = npcm7xx_gcr_class_init,
     },
+    {
+        .name               = TYPE_NPCM8XX_GCR,
+        .parent             = TYPE_NPCM_GCR,
+        .class_init         = npcm8xx_gcr_class_init,
+    },
 };
 DEFINE_TYPES(npcm_gcr_info)
diff --git a/include/hw/misc/npcm_gcr.h b/include/hw/misc/npcm_gcr.h
index 9af24e5cdc..9ac76ca9ab 100644
--- a/include/hw/misc/npcm_gcr.h
+++ b/include/hw/misc/npcm_gcr.h
@@ -1,5 +1,5 @@
 /*
- * Nuvoton NPCM7xx System Global Control Registers.
+ * Nuvoton NPCM7xx/8xx System Global Control Registers.
  *
  * Copyright 2020 Google LLC
  *
@@ -54,8 +54,9 @@
  * Number of registers in our device state structure. Don't change this without
  * incrementing the version_id in the vmstate.
  */
-#define NPCM_GCR_MAX_NR_REGS NPCM7XX_GCR_NR_REGS
+#define NPCM_GCR_MAX_NR_REGS NPCM8XX_GCR_NR_REGS
 #define NPCM7XX_GCR_NR_REGS (0x148 / sizeof(uint32_t))
+#define NPCM8XX_GCR_NR_REGS (0xf80 / sizeof(uint32_t))
 
 typedef struct NPCMGCRState {
     SysBusDevice parent;
@@ -78,6 +79,7 @@ typedef struct NPCMGCRClass {
 
 #define TYPE_NPCM_GCR "npcm-gcr"
 #define TYPE_NPCM7XX_GCR "npcm7xx-gcr"
+#define TYPE_NPCM8XX_GCR "npcm8xx-gcr"
 OBJECT_DECLARE_TYPE(NPCMGCRState, NPCMGCRClass, NPCM_GCR)
 
 #endif /* NPCM_GCR_H */
-- 
2.47.1.613.gc27f4b7a9f-goog

