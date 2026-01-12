Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47C18C9EC8D
	for <qemu-arm@archiver.kernel.org>; Mon, 12 Jan 2026 14:55:22 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vfJJm-0007ns-Lp; Mon, 12 Jan 2026 09:54:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1vfJJh-0007i3-Up
 for qemu-arm@nongnu.org; Mon, 12 Jan 2026 09:54:49 -0500
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1vfJJd-0001Xf-S8
 for qemu-arm@nongnu.org; Mon, 12 Jan 2026 09:54:49 -0500
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-b87003e998bso265336266b.1
 for <qemu-arm@nongnu.org>; Mon, 12 Jan 2026 06:54:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768229684; x=1768834484; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Y1LxjYjMYUoswFZn9nDXTMgtS1rPNwvvyqGhy82qro8=;
 b=AUHxeNgI9ciszVJcOgOPwwdTIX+UJbMz0uO6pMIG6DDk4ZUay/Zpo/K+m55+zF85gu
 e+xlU1kr1pE4Nnqz7veBfqqmrWlrN3oCcZwGZulGcYOj0OKqlKK1xlCcXXUxViuturrr
 UgMz6UdOvTvrvqe4GDSIOf93oxiUcTJ63thV8c9fwE6Sy6WrX/Aaf7zJE8G++4zwFJdq
 jWjnH9vUKWDYmtfcyjJmqhFSA6CI4Lko48m/5gwHEPpMDlIBfaV99BlA4dYUVOtibN6J
 tlF0+hXqKX40YYlE0Ncec6sg3+TyjYckS+Km3lgT10p65HCK236yXmb2BaZISeUpRLb0
 jOWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768229684; x=1768834484;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Y1LxjYjMYUoswFZn9nDXTMgtS1rPNwvvyqGhy82qro8=;
 b=d/krUYl+jNeRX6CxyPUaeDa28PO2sBW7A1WkTbmalz28OX1E9noFXAfjRznRufIx2O
 ohgzTtrlxw9Dv0DRF6Szt+lziFGBgfP9BYQhXWbA2lF9xsJy60JDii0+SIiVkdrJ1Bxr
 uVg/59coHTU1Rhq2Nr+p0f5Uz7aRn6N+tkCKYMnA2AQJgaCjfBz428BypjQcRob9lNPS
 G4/cX4o+GtM0GY8zck8Vw41HdNDLhXVdI/fuJ7vk82ubSrh4FVIsWOtEYeOZAB1e43KE
 YbbnyTCWIh8/l8v8M6WrgFg4VHObbZwSebGDDnqY9QVP+5ytML97+riYCe6aAgjV2Kcf
 3ivw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX8EOk5/7Ydo4UpBMRaDCmtVyb/XjBniwsNxYGPMZdKQMtPGMx/evRA8TRF3LG4oUF2b7GyGT9XBQ==@nongnu.org
X-Gm-Message-State: AOJu0YyItKmQ1aFUphUTkzTy6Gfnu3tveE4YhR1/w6SEqwz6lcHo8vPT
 EojpBZMxHDt0zqppTdxaiyWNtghPKyiyznE+F1QTTkedX6Ob0FxBcZ5F
X-Gm-Gg: AY/fxX7RxleFw4XPhf+7FhunjCMwFbJAtuGuUip8owUxla4kFt/bQ6idSZvHMipiVLp
 fvb31b5nGTYZlJ6avws8j3mO/7Cctz4y4B7Y6jkGnX32q0Y76jejyQyPrkhn5WUbkx+szJSWpzs
 b82MVCbFCVCLXPVtdKihui+7jlcIzOPPT+ueq550IWAdEhaRWnU6pFP1xdelZHN8+m7QifC3Fsd
 /T1o0l6kieYrwiVNr/QlR5UvE4BXjYipVM3m1C3Kc9ImehpxoFIxwpjeqUIYm9rtwTlOukGIJyw
 vFQyBRC34w16uQNC0JYl4vVaKU4blnti5U/TJntPzCx/to5DHZGPRgxnU+6unjfOG9Nob6I2YlS
 l4Qb6mcM74gRFgLkmmTYzb4VhK/sy8d99Yp7WHvH+PYvE7ieyvQPAA9BM9/iVDR2RWILttlHMii
 rYYEV/KWzLIzdSvkoecwCkc5k3G7ntTubaZIs6Ac9SEGQyw8G/tbmLH0mfl0omIt2w4BsC9A0h
X-Google-Smtp-Source: AGHT+IEl+b07bG8+3Z0hGlXN5mIYnTrF9fwmZuhOzzlOmo0yshFxPLv4Z0v/ew312KsuxIKCV3GQag==
X-Received: by 2002:a17:907:7b86:b0:b87:1891:48fb with SMTP id
 a640c23a62f3a-b8718916cf6mr383338366b.23.1768229683536; 
 Mon, 12 Jan 2026 06:54:43 -0800 (PST)
Received: from archlinux (dynamic-077-188-226-222.77.188.pool.telefonica.de.
 [77.188.226.222]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8731f0718asm37387966b.67.2026.01.12.06.54.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jan 2026 06:54:43 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>, qemu-arm@nongnu.org,
 Bernhard Beschow <shentey@gmail.com>, Guenter Roeck <linux@roeck-us.net>,
 Bin Meng <bmeng.cn@gmail.com>, Thomas Huth <thuth@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-block@nongnu.org,
 qemu-ppc@nongnu.org
Subject: [PATCH 06/14] hw/sd/sdhci: Consolidate eSDHC constants
Date: Mon, 12 Jan 2026 15:54:10 +0100
Message-ID: <20260112145418.220506-7-shentey@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260112145418.220506-1-shentey@gmail.com>
References: <20260112145418.220506-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x62a.google.com
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

Drop the "IMX_" part of the names since these are actually {E,U}SDHC
specific and apply for PowerPC-based SoCs as well. While at it
consolidate all ESDHC constants into the ESDHC section.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/sd/sdhci-internal.h | 1 -
 hw/sd/sdhci.c          | 9 +++++----
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/hw/sd/sdhci-internal.h b/hw/sd/sdhci-internal.h
index 3e81821dd1..f24532eed2 100644
--- a/hw/sd/sdhci-internal.h
+++ b/hw/sd/sdhci-internal.h
@@ -75,7 +75,6 @@
 #define SDHC_CMD_INHIBIT               0x00000001
 #define SDHC_DATA_INHIBIT              0x00000002
 #define SDHC_DAT_LINE_ACTIVE           0x00000004
-#define SDHC_IMX_CLOCK_GATE_OFF        0x00000080
 #define SDHC_DOING_WRITE               0x00000100
 #define SDHC_DOING_READ                0x00000200
 #define SDHC_SPACE_AVAILABLE           0x00000400
diff --git a/hw/sd/sdhci.c b/hw/sd/sdhci.c
index ccdfc59af8..779f411bab 100644
--- a/hw/sd/sdhci.c
+++ b/hw/sd/sdhci.c
@@ -1642,7 +1642,7 @@ static void sdhci_bus_class_init(ObjectClass *klass, const void *data)
 #define ESDHC_MIX_CTRL                  0x48
 
 #define ESDHC_VENDOR_SPEC               0xc0
-#define ESDHC_IMX_FRC_SDCLK_ON          (1 << 8)
+#define ESDHC_FRC_SDCLK_ON              (1 << 8)
 
 #define ESDHC_DLL_CTRL                  0x60
 
@@ -1657,6 +1657,7 @@ static void sdhci_bus_class_init(ObjectClass *klass, const void *data)
 #define ESDHC_CTRL_8BITBUS              (0x2 << 1)
 
 #define ESDHC_PRNSTS_SDSTB              (1 << 3)
+#define ESDHC_PRNSTS_CLOCK_GATE_OFF     BIT(7)
 
 static uint64_t usdhc_read(void *opaque, hwaddr offset, unsigned size)
 {
@@ -1731,10 +1732,10 @@ usdhc_write(void *opaque, hwaddr offset, uint64_t val, unsigned size)
 
     case ESDHC_VENDOR_SPEC:
         s->vendor_spec = value;
-        if (value & ESDHC_IMX_FRC_SDCLK_ON) {
-            s->prnsts &= ~SDHC_IMX_CLOCK_GATE_OFF;
+        if (value & ESDHC_FRC_SDCLK_ON) {
+            s->prnsts &= ~ESDHC_PRNSTS_CLOCK_GATE_OFF;
         } else {
-            s->prnsts |= SDHC_IMX_CLOCK_GATE_OFF;
+            s->prnsts |= ESDHC_PRNSTS_CLOCK_GATE_OFF;
         }
         break;
 
-- 
2.52.0


