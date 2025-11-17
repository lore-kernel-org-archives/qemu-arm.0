Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5ED51CCD19A
	for <qemu-arm@archiver.kernel.org>; Mon, 17 Nov 2025 01:42:38 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vKoEz-0002rr-3k; Sun, 16 Nov 2025 20:41:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <brookmangabriel@gmail.com>)
 id 1vKoEZ-0002VP-QY
 for qemu-arm@nongnu.org; Sun, 16 Nov 2025 20:40:49 -0500
Received: from mail-qt1-x82f.google.com ([2607:f8b0:4864:20::82f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <brookmangabriel@gmail.com>)
 id 1vKoEX-0005xH-Sj
 for qemu-arm@nongnu.org; Sun, 16 Nov 2025 20:40:47 -0500
Received: by mail-qt1-x82f.google.com with SMTP id
 d75a77b69052e-4eda26a04bfso43354841cf.2
 for <qemu-arm@nongnu.org>; Sun, 16 Nov 2025 17:40:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1763343644; x=1763948444; darn=nongnu.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Ua3Vv1O2/qdb0xwse9RFkHNI0RUlYG2jHSbXkJRhi0w=;
 b=VP7N0YqgxTgZPl8kWTygAPADoioICZyXCI9m9WJCV2Cm2Y2Z/Jy4bDFah13AQF9vto
 3w5sXwW09k6yFamBBoCpAp9s8JQRX5VMoHzPax3c+HZ1clNs3GwMeOE4Cx35pEAlXGMU
 APn3hQqaPt4WYz5ctpTF32z0GH8GAwzVN7BwyiB3RZAgvUN6R4HitOSAQrWJpJ9rIbnI
 EGJO6A+1IsyMUTUr0Ba1Zb3TZwJF0Xn3Z7FH4O2omaRComvife+nKiC3d4OujX3o1NPf
 HYPEGBs9sNp1SQ/BszOnh5TTvJtLAipg8R2RzJMyhlrV4VoPwDXBsTC6BKuXqLsQjFYm
 GYBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763343644; x=1763948444;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=Ua3Vv1O2/qdb0xwse9RFkHNI0RUlYG2jHSbXkJRhi0w=;
 b=QbEun3V3SoRIUNSrQWRefZwRQxw9LHRJD3qSlyxN37x9kGwCz0GXnas4kE8VaianPq
 Rz+8Ous7G+ZCxbk73BbNEWCSSbuBH55BjgsbJbnlZjZQKrfir9humEKILmk0ZXyGyYBX
 VwkGvApfY2v0FY8sZ24v6P6B14btCsx/mMGpKhmEp+TtZ7TwsXmGxT8EhQRnaNuNEGx1
 VzIb7H/iiBVais0ZbLSYuxUiLN7tVKhT8UvS3Gp/GMgT7KN4haPPA+DMdfpOIDsn+Kbv
 Pv/8ujnDXQ3VhNGjvztweXcA79i7KUNnUSyqrJfaJcJylZXXz+YBzagXqciU+gAHMp+I
 qjTg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXsgr7PgVZ5j9wqnNs2owRoyOUtiHVZuRomEAmFF1XqgOSV2jhiZoK9EVwmtWMITgAhkjgNOYcjvg==@nongnu.org
X-Gm-Message-State: AOJu0Yy+mpQBamvBKS8gaJYVxGyy62QQy+5XcXl6en3twR3A9HVJE1Fg
 6/Fbj3RjNzNb9UqXcwdrgLlPn4Q2U6v7OO4E7xMWjPWUCMlN22/lkUgNP7Igw4pN
X-Gm-Gg: ASbGncsb6PG0sEVlYUleou7RobJxwVICNruY1k6oAm2M7GsVjjqu9bmPhCJ+5nMW6hN
 EZAnO4YFvJeuQyyn7HXp+odgpaZo6fbu6J6IwfBvYuvSOhdDKazpd/gQafYwq2GCQlLookgRaY0
 SIWxYbd5b10BA544sFhqJ0rPJoSzLYUiIwzE3d0aQJYw+4mFlJEulGtiFkQo2W9YfwXOms5LLI4
 5gwKZ8hcl9GwiWDRZjBPsE4+2toosVbtaazLb7qvXzvTbmSYChO1enDoK/St3F3ADzlc6FsCS+4
 KQS7oJyhdCls2vDY0I8IkrNi8aklnp7/lmU/eupX/vvh0SPw68t13ztRYE7Gc44PNNlKx0OQd8r
 JLr9Fnv4VqN8fV3deHCd3x5MktzDQQT8QhFOXtCE4TtFeStE9ZGE9BMLHb/8/7AmxNAfEiVJ6UE
 RX5sfHw+TrxuskSMqGZfE=
X-Google-Smtp-Source: AGHT+IG78k1jDlP82lcOMeh+n1YRV7USWsk6x+nIRALX2ZybuW+R7Wme5PWVa2mkGsbygin+bxNx8w==
X-Received: by 2002:ac8:5a8f:0:b0:4e8:8934:6df1 with SMTP id
 d75a77b69052e-4edf21a8a19mr156206651cf.79.1763343644378; 
 Sun, 16 Nov 2025 17:40:44 -0800 (PST)
Received: from [10.0.0.22] ([185.213.193.149])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4ee1c21ea34sm18246551cf.30.2025.11.16.17.40.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 Nov 2025 17:40:43 -0800 (PST)
From: Gabriel Brookman <brookmangabriel@gmail.com>
Date: Sun, 16 Nov 2025 20:40:20 -0500
Subject: [PATCH RFC v2 03/10] target/arm: add TCSO bitmasks to SCTLR
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251116-feat-mte4-v2-3-9a7122b7fa76@gmail.com>
References: <20251116-feat-mte4-v2-0-9a7122b7fa76@gmail.com>
In-Reply-To: <20251116-feat-mte4-v2-0-9a7122b7fa76@gmail.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, 
 Gustavo Romero <gustavo.romero@linaro.org>, qemu-arm@nongnu.org, 
 Gabriel Brookman <brookmangabriel@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763343639; l=1752;
 i=brookmangabriel@gmail.com; s=20251009; h=from:subject:message-id;
 bh=lGvL5Ysz7rdcnO180K4nS60cQt3k70dZuKD3GpqAV48=;
 b=xqtxzZKLu8L9xYRFDWc/dCD6H9Fhq9/zDZ9JDwlsLAfdEub7vxL6LlI+IbC2FtCCFCXKXNmaC
 IHV+hdd/rp1DuRsAYixFDADhwJuOqZP/Y1hu1Q4rEbKV1rjGDY8L4Rn
X-Developer-Key: i=brookmangabriel@gmail.com; a=ed25519;
 pk=m9TtPDal6WzoHNnQiHHKf8dTrv3DUCPUUTujuo8vNrw=
Received-SPF: pass client-ip=2607:f8b0:4864:20::82f;
 envelope-from=brookmangabriel@gmail.com; helo=mail-qt1-x82f.google.com
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

These are the bitmasks used to control the FEAT_MTE_STORE_ONLY feature.
They are now named and setting these fields of SCTLR is ignored if MTE
is disabled, as per convention.

Signed-off-by: Gabriel Brookman <brookmangabriel@gmail.com>
---
 target/arm/cpu.h    | 2 ++
 target/arm/helper.c | 4 ++--
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 39f2b2e54d..6fe85b5e3a 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1424,6 +1424,8 @@ void pmu_init(ARMCPU *cpu);
 #define SCTLR_EnAS0   (1ULL << 55) /* FEAT_LS64_ACCDATA */
 #define SCTLR_EnALS   (1ULL << 56) /* FEAT_LS64 */
 #define SCTLR_EPAN    (1ULL << 57) /* FEAT_PAN3 */
+#define SCTLR_TCSO0    (1ULL << 58) /* FEAT_MTE_STORE_ONLY */
+#define SCTLR_TCSO    (1ULL << 59) /* FEAT_MTE_STORE_ONLY */
 #define SCTLR_EnTP2   (1ULL << 60) /* FEAT_SME */
 #define SCTLR_NMI     (1ULL << 61) /* FEAT_NMI */
 #define SCTLR_SPINTMASK (1ULL << 62) /* FEAT_NMI */
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 27ebc6f29b..17ddfaccf8 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -3364,10 +3364,10 @@ static void sctlr_write(CPUARMState *env, const ARMCPRegInfo *ri,
 
     if (ri->state == ARM_CP_STATE_AA64 && !cpu_isar_feature(aa64_mte, cpu)) {
         if (ri->opc1 == 6) { /* SCTLR_EL3 */
-            value &= ~(SCTLR_ITFSB | SCTLR_TCF | SCTLR_ATA);
+            value &= ~(SCTLR_ITFSB | SCTLR_TCF | SCTLR_ATA | SCTLR_TCSO);
         } else {
             value &= ~(SCTLR_ITFSB | SCTLR_TCF0 | SCTLR_TCF |
-                       SCTLR_ATA0 | SCTLR_ATA);
+                       SCTLR_ATA0 | SCTLR_ATA | SCTLR_TCSO | SCTLR_TCSO0);
         }
     }
 

-- 
2.51.2


