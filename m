Received: by 2002:a17:504:664e:b0:1be9:327d:8ee3 with SMTP id l14csp5600676njk;
        Thu, 26 Dec 2024 00:25:00 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWyaU9jL/BSTCt7l4/ECzboFNGZLuxdLmVmcciC1fN409sXMIv1m+3Fljrt83b2xLPG99xCI7Ohfup/Bg==@linaro.org
X-Google-Smtp-Source: AGHT+IG+bZubVF9UXrc6e10cRsZOgemZqEy4dRLDkwO742THh6501OOgBHOK6b/r+h98SdADGfZH
X-Received: by 2002:a05:620a:244b:b0:7b6:d8da:9095 with SMTP id af79cd13be357-7b9ba6efa03mr3764605085a.13.1735201500533;
        Thu, 26 Dec 2024 00:25:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1735201500; cv=none;
        d=google.com; s=arc-20240605;
        b=YR+nEnXKtONhaeUtxijQSqS5jR+uHKt0GtPS7LLf9dyiu/Wlvx1VI0BEORidUV9bHd
         igOwvml7gSxpsXHecMhDj0zZmYViRUJcYrmtxieyhndsZHET2wYVDwWtnHe+CZh39Emb
         2j7oeOu4fvOQMCoUd6gzZ7cLlVjWiD14D0NSVrRYnLZVWGZqai732PxYrMN64RXDGglL
         R58/jcrB+RJXf/COfiD7KN8W79dv1S4pepdJ9opm/s0g5L5ZyAENbFUykZn/xmztwSZd
         FpbcYhlEZK0kHvyXwNdyXwNZFGHoV7Y/Vg7mBjmBQMSVj1ewXZmTdkUopsy8v4M0LHXe
         UpUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:message-id
         :references:mime-version:in-reply-to:date:dkim-signature;
        bh=p/jxfIHJDMTwko8UxNWSo9R6EjZKYMOEyl+7ZxDg9LY=;
        fh=+PAerL3D0lWxIFV8LM5n8RzpR9hQ/5Y1LfuYkLgxWjA=;
        b=Sh4NzU/gQO8NDnXbOLw6YdTxiSABphC1Br0nEdPfjjSb+XK0mJ1oDNkM3OF0p2wJ0a
         r02IRRKdtLky2TuFFX9hihYkEIx4HMWSnVRSV0UpoOpq7e2GBgFDrfyiWQV7lyZeANGw
         5QviFv1r3LFAo2RbhckPTmOp5mxUiaZSOgcEbgvuHcZj0iybSFuzy9l/pKb5GI6zv1zo
         CqU5te36Al8PxlupbJdqUuYYZvJL1FBlAIPl3JOmidcw+jfJNy8VEsiJFCwU5kaIsWsv
         4eR1SRhWaob6RxscugesYpRpQeuYgw3DoeTab8ImRCowIfGhfxyMg4FpKbv1+rrWMgfE
         ETcA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=FnxU4gRh;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7b9ac2ce53asi1722000885a.185.2024.12.26.00.25.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 26 Dec 2024 00:25:00 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=FnxU4gRh;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tQj9Y-0007Ug-V9; Thu, 26 Dec 2024 03:23:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3dRJtZwgKCpAGE1u8DC108805y.w86Ay6E-xyFy578707E.8B0@flex--wuhaotsh.bounces.google.com>)
 id 1tQj9O-0007Pm-Nd
 for qemu-devel@nongnu.org; Thu, 26 Dec 2024 03:23:25 -0500
Received: from mail-pl1-x649.google.com ([2607:f8b0:4864:20::649])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3dRJtZwgKCpAGE1u8DC108805y.w86Ay6E-xyFy578707E.8B0@flex--wuhaotsh.bounces.google.com>)
 id 1tQj9M-0000YD-Ug
 for qemu-devel@nongnu.org; Thu, 26 Dec 2024 03:23:22 -0500
Received: by mail-pl1-x649.google.com with SMTP id
 d9443c01a7336-216405eea1fso71483525ad.0
 for <qemu-devel@nongnu.org>; Thu, 26 Dec 2024 00:23:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1735201397; x=1735806197; darn=nongnu.org;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=p/jxfIHJDMTwko8UxNWSo9R6EjZKYMOEyl+7ZxDg9LY=;
 b=FnxU4gRhJWKJAqq177BIssD6eV3WiTzWv0HEhJt2fruTXpCoV3o0zmDAK7HKT7Ps59
 CXVxpVzB2FGkz8YJzHp7GGKLlERVNGRMKwK7aGUZWtDJ2k85eCcyqj0srhI/iGIGsJfL
 35Wu5Wq41e/nIlaPblfSEumVyUzlA6/3T83+ChH/KrJ6syWTOtqcWgMlKLuJZrfflcCO
 nZJpmEOfLxzKjFcmcpgdl513q52zI0n3zZ37jfjfloCoCMTYXp0m37/P1Rqkq6p5f9Gd
 wKjA+bw5A9kieO91/s4SD/ElHSMXDwD1Azi0/toly+YOuN58Pfw4V70iTOkgajgjeGbx
 Ol+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735201397; x=1735806197;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=p/jxfIHJDMTwko8UxNWSo9R6EjZKYMOEyl+7ZxDg9LY=;
 b=Mo2TWR6Zaw5uUyucQXb4DFAc50NfkBhvg3QnaqBr7pCPceB50I+SiaacV7I+/B/0nZ
 ee/FkKcRqzfdcOcXCcnOU0YQ0JeB1goCzdMksXUIJYjiGIapZOR6Mci32e87yK34ei6X
 6Q+bcqQVprvzWGTaw32ZKw9fMdKt40wrTKUfbeJ7Q7e0cCj5vVDOoNnI/VDgkXd1pJPW
 3kQ61qB4WKmC2fRqRMsdmZTE6PZLJkBVWpXtQys+6AehtxnhLFQfb3ISmWmQw2oA6bJT
 mrfOeraGhme9uuxwbu4SB97oA4FnP6GuVYEcbwACQKQfodK/1HtuKAefB7/8Aey7g4AO
 Gv4w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWMiKfpcUVVbeZjqfQMtI8u15Dcb9693MczEIznEwHkCqZEYm9umKOCZP9oaWWewmSHBVbroEOPIgkI@nongnu.org
X-Gm-Message-State: AOJu0YyY0ZRhqpfi0XyHa6keiA7DxvEbTjRMnwDNeER407T+aMXMldEt
 U/6q4caXGWR1VTr0OB9hSN4T5qaBGYm1hfjdb7DXEAUw/fPPRrk79ts9sp+qd2CxiKATbpqyp17
 6b0DRPjl+9Q==
X-Received: from pjbsk12.prod.google.com ([2002:a17:90b:2dcc:b0:2ea:4a74:ac2])
 (user=wuhaotsh job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90a:c2d0:b0:2ee:dcf6:1c77 with SMTP id
 98e67ed59e1d1-2f452e2e928mr34507661a91.16.1735201397691; 
 Thu, 26 Dec 2024 00:23:17 -0800 (PST)
Date: Thu, 26 Dec 2024 08:22:27 +0000
In-Reply-To: <20241226082236.2884287-1-wuhaotsh@google.com>
Mime-Version: 1.0
References: <20241226082236.2884287-1-wuhaotsh@google.com>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20241226082236.2884287-9-wuhaotsh@google.com>
Subject: [PATCH 08/17] hw/misc: Add support for NPCM8XX GCR
From: Hao Wu <wuhaotsh@google.com>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, Avi.Fishman@nuvoton.com, 
 kfting@nuvoton.com, titusr@google.com, mimik-dev@google.com, 
 hskinnemoen@google.com, venture@google.com, pbonzini@redhat.com, 
 jasowang@redhat.com, alistair@alistair23.me, Hao Wu <wuhaotsh@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::649;
 envelope-from=3dRJtZwgKCpAGE1u8DC108805y.w86Ay6E-xyFy578707E.8B0@flex--wuhaotsh.bounces.google.com;
 helo=mail-pl1-x649.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=unavailable autolearn_force=no
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
X-TUID: c1iqzWRBe1nE

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

