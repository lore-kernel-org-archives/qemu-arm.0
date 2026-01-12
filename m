Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59C9FC9EC94
	for <qemu-arm@archiver.kernel.org>; Mon, 12 Jan 2026 14:56:28 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vfJJw-0007v4-H0; Mon, 12 Jan 2026 09:55:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1vfJJf-0007eC-UT
 for qemu-arm@nongnu.org; Mon, 12 Jan 2026 09:54:48 -0500
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1vfJJc-0001Wd-7M
 for qemu-arm@nongnu.org; Mon, 12 Jan 2026 09:54:47 -0500
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-b86f81d8051so292041066b.1
 for <qemu-arm@nongnu.org>; Mon, 12 Jan 2026 06:54:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768229683; x=1768834483; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1rPn6RrafNXG2RcHcgcC/D23Cz4zUHe4Dy7SUb3RB1g=;
 b=T3xNvQEGThwMKJpTmATSqA5ssHsewvXE5aIjEqVxLePaHDv3RxwxgXbGbtDwmPMqFL
 GTfYM3Z/0mwobHQoieVR9pEElfpqXhuoXiFJ9dSYiR2bB4eGgL773Xc/eoulCsu9gf7S
 A0KilLDk4rCzg3BA/eAy6Me4BGftHvCnls5KnlzfT32pdnjvRj5VtDfaPqUwVocFOft8
 FkoNNtjPPappT55Cx10KF/57fnDySSAMlXEoEPy5pnv93q9pPkdFS0NraZ1jvzsMhiE7
 AOv/JTK15/uViQq6JnGyQJDj7yi70OJXVaDMUKpa2nOJF/yIBplanb+85UZgjUQx1WKM
 tZbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768229683; x=1768834483;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=1rPn6RrafNXG2RcHcgcC/D23Cz4zUHe4Dy7SUb3RB1g=;
 b=FRbyCmjuu1OC9FviBD6ua3DvYksuqAZQr+ox6yz6yN8pePKtYdLAgqKYfTitX7uDcV
 IiPs0VqEItKtjjJnkGhDidMc+1ymvtkfRuZ74AYZ1MPOIDbPxfkH8thBiEEiB+Kb5mS+
 losv7GPZ46ZXe8yz62JPZ629pXumthCK2MFG9yvpwEdwpbtsmcatkO+3xVR57+krxCDD
 z7tQTY5xnSbRLPefmgxWroIAnJVzdWdsLubBsg9/pz87DJKUNQWOd/ETp9rotBw4oGX5
 Ou4ffDr5kb9Jukqr5ZC3b6O8PAYNfwjqJqhtkuIRnu1GxjvWNzyx/x6dNVEPdMsYKKgP
 Eyqw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXTBd39o0GOM+tIATmckm476QVYFPKkAqnh1v5oNnXInl/IeWt7rmp4THpft0a/adY1zu9w01271w==@nongnu.org
X-Gm-Message-State: AOJu0YwGUILFM5Z7YJBJU8GlCMJxqSRBpvgy0grgoXGrjM+HpN7MlVgU
 ZwaJjRRWugDS+Fcgwo6uW1Pk7v14rR3P1QqUCNVztKn/LLZwnDFLzLGf
X-Gm-Gg: AY/fxX59xdxqE88q2bLTBWe1H7xFGYwipL73RPkK+PHFjI5UL0WwyY1J8ObD/A20JSJ
 J5GK1E7M4wcVqLZPTpjb4GiMS5c6vUPbxPPJjVkeqLxpUtyKrNZeo+g3RTEOKAZrdJTilV12pE0
 Uk9vl7AMOIRrBIsbG5kdFolGqO765tFwBV5MdvGN80HXnsYAtu7q0gNwZWDnU+AUOCFtOfrh7AX
 ZQlaEmeA8Y4sBrGA1RQql4Sv9aB60nLxT52xavsvQUa4rebEDO8uDgvm+O/GW8W0UjDbP8oShMt
 STWUmBs0mHNxen6Bjsqt1WvDotX8IYRXUKKqyEtEYaYMCAQi148f+eKf3V1jZ5qD32fJ8SE0wZg
 9G1O2dHSUcheBAdlJ72ogdQGSevnO61/quZZzM2wL5R1Sv8ZmCxhJKZuJbcS+sWASVJy3b3OF36
 QKkwkTqtVV9aXhS7Sv4nXldWUKK+aGcczr5WUCvZ/RA96oJiM5JD8p519Y3lw6QjFi1pAgigB/
X-Google-Smtp-Source: AGHT+IHqMvtkYlJMFRymhakMTyVu2RxZy0qKe9a+opLTAZ3Z6hqM5jcRAKhh1eQawAQQMUnGVBkDfg==
X-Received: by 2002:a17:907:3f1c:b0:b87:2abc:4a2a with SMTP id
 a640c23a62f3a-b872abc6586mr159869166b.1.1768229682424; 
 Mon, 12 Jan 2026 06:54:42 -0800 (PST)
Received: from archlinux (dynamic-077-188-226-222.77.188.pool.telefonica.de.
 [77.188.226.222]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8731f0718asm37387966b.67.2026.01.12.06.54.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jan 2026 06:54:42 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>, qemu-arm@nongnu.org,
 Bernhard Beschow <shentey@gmail.com>, Guenter Roeck <linux@roeck-us.net>,
 Bin Meng <bmeng.cn@gmail.com>, Thomas Huth <thuth@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-block@nongnu.org,
 qemu-ppc@nongnu.org
Subject: [PATCH 05/14] Revert "hw/sd/sdhci: Rename ESDHC_* defines to USDHC_*"
Date: Mon, 12 Jan 2026 15:54:09 +0100
Message-ID: <20260112145418.220506-6-shentey@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260112145418.220506-1-shentey@gmail.com>
References: <20260112145418.220506-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x62d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

This reverts commit 1e76667f7adf48c6c3596aaa26b8886b57b8498d.

Unaware that the constants were named after Linux and U-Boot code,
commit 1e76667f7adf ("hw/sd/sdhci: Rename ESDHC_* defines to USDHC_*")
changed the naming to be consistent with the function names. Fix the
constant naming to be consistent with Linux and U-Boot again. In the
next step, the function names will be renamed according to Linux and
U-Boot code as well.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/sd/sdhci.c | 66 +++++++++++++++++++++++++--------------------------
 1 file changed, 33 insertions(+), 33 deletions(-)

diff --git a/hw/sd/sdhci.c b/hw/sd/sdhci.c
index 23d8f7cbc8..ccdfc59af8 100644
--- a/hw/sd/sdhci.c
+++ b/hw/sd/sdhci.c
@@ -1639,24 +1639,24 @@ static void sdhci_bus_class_init(ObjectClass *klass, const void *data)
 
 /* --- qdev i.MX eSDHC --- */
 
-#define USDHC_MIX_CTRL                  0x48
+#define ESDHC_MIX_CTRL                  0x48
 
-#define USDHC_VENDOR_SPEC               0xc0
-#define USDHC_IMX_FRC_SDCLK_ON          (1 << 8)
+#define ESDHC_VENDOR_SPEC               0xc0
+#define ESDHC_IMX_FRC_SDCLK_ON          (1 << 8)
 
-#define USDHC_DLL_CTRL                  0x60
+#define ESDHC_DLL_CTRL                  0x60
 
-#define USDHC_TUNING_CTRL               0xcc
-#define USDHC_TUNE_CTRL_STATUS          0x68
-#define USDHC_WTMK_LVL                  0x44
+#define ESDHC_TUNING_CTRL               0xcc
+#define ESDHC_TUNE_CTRL_STATUS          0x68
+#define ESDHC_WTMK_LVL                  0x44
 
 /* Undocumented register used by guests working around erratum ERR004536 */
-#define USDHC_UNDOCUMENTED_REG27        0x6c
+#define ESDHC_UNDOCUMENTED_REG27        0x6c
 
-#define USDHC_CTRL_4BITBUS              (0x1 << 1)
-#define USDHC_CTRL_8BITBUS              (0x2 << 1)
+#define ESDHC_CTRL_4BITBUS              (0x1 << 1)
+#define ESDHC_CTRL_8BITBUS              (0x2 << 1)
 
-#define USDHC_PRNSTS_SDSTB              (1 << 3)
+#define ESDHC_PRNSTS_SDSTB              (1 << 3)
 
 static uint64_t usdhc_read(void *opaque, hwaddr offset, unsigned size)
 {
@@ -1677,11 +1677,11 @@ static uint64_t usdhc_read(void *opaque, hwaddr offset, unsigned size)
         hostctl1 = SDHC_DMA_TYPE(s->hostctl1) << (8 - 3);
 
         if (s->hostctl1 & SDHC_CTRL_8BITBUS) {
-            hostctl1 |= USDHC_CTRL_8BITBUS;
+            hostctl1 |= ESDHC_CTRL_8BITBUS;
         }
 
         if (s->hostctl1 & SDHC_CTRL_4BITBUS) {
-            hostctl1 |= USDHC_CTRL_4BITBUS;
+            hostctl1 |= ESDHC_CTRL_4BITBUS;
         }
 
         ret  = hostctl1;
@@ -1692,21 +1692,21 @@ static uint64_t usdhc_read(void *opaque, hwaddr offset, unsigned size)
 
     case SDHC_PRNSTS:
         /* Add SDSTB (SD Clock Stable) bit to PRNSTS */
-        ret = sdhci_read(opaque, offset, size) & ~USDHC_PRNSTS_SDSTB;
+        ret = sdhci_read(opaque, offset, size) & ~ESDHC_PRNSTS_SDSTB;
         if (s->clkcon & SDHC_CLOCK_INT_STABLE) {
-            ret |= USDHC_PRNSTS_SDSTB;
+            ret |= ESDHC_PRNSTS_SDSTB;
         }
         break;
 
-    case USDHC_VENDOR_SPEC:
+    case ESDHC_VENDOR_SPEC:
         ret = s->vendor_spec;
         break;
-    case USDHC_DLL_CTRL:
-    case USDHC_TUNE_CTRL_STATUS:
-    case USDHC_UNDOCUMENTED_REG27:
-    case USDHC_TUNING_CTRL:
-    case USDHC_MIX_CTRL:
-    case USDHC_WTMK_LVL:
+    case ESDHC_DLL_CTRL:
+    case ESDHC_TUNE_CTRL_STATUS:
+    case ESDHC_UNDOCUMENTED_REG27:
+    case ESDHC_TUNING_CTRL:
+    case ESDHC_MIX_CTRL:
+    case ESDHC_WTMK_LVL:
         ret = 0;
         break;
     }
@@ -1722,16 +1722,16 @@ usdhc_write(void *opaque, hwaddr offset, uint64_t val, unsigned size)
     uint32_t value = (uint32_t)val;
 
     switch (offset) {
-    case USDHC_DLL_CTRL:
-    case USDHC_TUNE_CTRL_STATUS:
-    case USDHC_UNDOCUMENTED_REG27:
-    case USDHC_TUNING_CTRL:
-    case USDHC_WTMK_LVL:
+    case ESDHC_DLL_CTRL:
+    case ESDHC_TUNE_CTRL_STATUS:
+    case ESDHC_UNDOCUMENTED_REG27:
+    case ESDHC_TUNING_CTRL:
+    case ESDHC_WTMK_LVL:
         break;
 
-    case USDHC_VENDOR_SPEC:
+    case ESDHC_VENDOR_SPEC:
         s->vendor_spec = value;
-        if (value & USDHC_IMX_FRC_SDCLK_ON) {
+        if (value & ESDHC_IMX_FRC_SDCLK_ON) {
             s->prnsts &= ~SDHC_IMX_CLOCK_GATE_OFF;
         } else {
             s->prnsts |= SDHC_IMX_CLOCK_GATE_OFF;
@@ -1796,12 +1796,12 @@ usdhc_write(void *opaque, hwaddr offset, uint64_t val, unsigned size)
          * Second, split "Data Transfer Width" from bits 2 and 1 in to
          * bits 5 and 1
          */
-        if (value & USDHC_CTRL_8BITBUS) {
+        if (value & ESDHC_CTRL_8BITBUS) {
             hostctl1 |= SDHC_CTRL_8BITBUS;
         }
 
-        if (value & USDHC_CTRL_4BITBUS) {
-            hostctl1 |= USDHC_CTRL_4BITBUS;
+        if (value & ESDHC_CTRL_4BITBUS) {
+            hostctl1 |= ESDHC_CTRL_4BITBUS;
         }
 
         /*
@@ -1824,7 +1824,7 @@ usdhc_write(void *opaque, hwaddr offset, uint64_t val, unsigned size)
         sdhci_write(opaque, offset, value, size);
         break;
 
-    case USDHC_MIX_CTRL:
+    case ESDHC_MIX_CTRL:
         /*
          * So, when SD/MMC stack in Linux tries to write to "Transfer
          * Mode Register", ESDHC i.MX quirk code will translate it
-- 
2.52.0


