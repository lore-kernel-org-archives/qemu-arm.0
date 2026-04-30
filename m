Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DAB9FF887E
	for <qemu-arm@archiver.kernel.org>; Thu, 30 Apr 2026 00:22:05 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wIF9R-0006Ls-AG; Wed, 29 Apr 2026 20:21:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wIF9O-0006Kb-Ew
 for qemu-arm@nongnu.org; Wed, 29 Apr 2026 20:21:06 -0400
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wIF9M-00069b-TS
 for qemu-arm@nongnu.org; Wed, 29 Apr 2026 20:21:06 -0400
Received: by mail-pg1-x534.google.com with SMTP id
 41be03b00d2f7-c648bc907ebso179656a12.3
 for <qemu-arm@nongnu.org>; Wed, 29 Apr 2026 17:21:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1777508463; x=1778113263; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0L8sm2nuOmiw4XE7Qu74ytG281Y5T5t916Djua5D5pM=;
 b=dSOQ1kJakcn2euojOxZ6/dR3B66VkHEX+lYBTWMLKwiOYh2FjpBFslzVzEam934Za8
 3rRzXHb/UEvv3wTJZyOW8CQ2DXBV60qKjxOdD4i/RN/Jv4OGjQhEaIzKc5pG9ZH1EbU8
 ulZiVBDreHAYt8VLRe2qJ6Ev5vdJUO8KvDMVZK+L6OveVCoHuDVcmRFWqZgoyNKYF1nE
 mK+zgnyZf6YgSPov5ULuSBWGljT1o8+Cs/sNpQGDZu1pyT3e+PYr/tGqsnucKjnBmVtX
 0p2grxkX1ZeVZQg/1cjRGDqz7Ox0cqVEfsDHdVio/VZgNPGaUzr6qSQYe3Xnzk7g2n6p
 teuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777508463; x=1778113263;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=0L8sm2nuOmiw4XE7Qu74ytG281Y5T5t916Djua5D5pM=;
 b=abYKP1JsKKP1oUOgXJWXL0iZhVHCnKHoejZ+aQgbg+zzFEGwy9GK/joFh+q3wUa9om
 HCGAXAqj1xYfs7S9FIWZE4UIRiCKPpAXxnGTYtLCtNT3yFnfxHLkGXVe1E2Oii/QGtKG
 7TBEXFiiRGMA9Au4QojTVYNUwzlcDqAA1igdMaCd/tbXJTHnQRj57YxOI/fzyuebW/IP
 QyiD/TOApt3Mi047jBWHyE2ua6TgDKr7R5yLzhnoLbr3wsokr0y83D+o63x/jP6QhbgE
 SlAD1+XUSyXB4qf2rYsvRxczQwZEqBNLWztUd/VJXdX7/J2srPvyR7S2Wl7ojfzlwYzb
 Z4Sw==
X-Gm-Message-State: AOJu0Yzw3lroW2wrBgONOViggGopmRkuVzOc267UQca4eNfi7KAO1oJX
 cXX8yXKdwJjPQRkmj+qREdrlv9RIp0jG9HfgXvIsoBEjXV6SU4J5A/Yt75+yB6DmccA=
X-Gm-Gg: AeBDieuQf8ATAwRqgv4knBTA91B4Hfr8QBNfNYGUufOkc1szeMWu6GDfNoIm0d0JGOv
 PuwCBHtcwAtTheWGh5lmlluIqpR3QQt2Onj6JE/CZzqVoHXTWZN4l9ytdVOMp3SLioaRk5F9XwK
 pskHbOBQ5nyAbADDDWbWPbw21AcM7icQXz5gmI8+ssB1/VeBqysaXh8rbZ1PWR1kKnX1zcJbRsl
 zhLz8HD7IkEsSm+tKPqCTgeJoRPe7ZyaaOIo/Tf5zT7t0//d2M0PB0C18ijaXfbYAMqg91GYKa7
 OMWUPb+fTHRsLLTbmdUle6XC+n0hyZEEaYdyIiuEL6/Z41KuUxPmIRKEEguv50yByTHYTRusmS6
 nPnnnF9lFcTWFlAxnRG9Q3iaO0m+YycehzBLwt5jCr9KgWVR/f4rt5cji0mAh1jIVG83FJM4YSR
 7HT0cpNTdO7L7vplRKZbwnUf8L1CRryNTvsOTSbBlz
X-Received: by 2002:a05:6a00:399b:b0:82d:5da9:adc9 with SMTP id
 d2e1a72fcca58-834fdb0f112mr895384b3a.12.1777508463456; 
 Wed, 29 Apr 2026 17:21:03 -0700 (PDT)
Received: from stoup.. ([180.233.125.15]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-834ed5cd3b8sm3461727b3a.16.2026.04.29.17.21.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Apr 2026 17:21:03 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v3 05/47] target/arm: Enable FEAT_FAMINMAX for -cpu max
Date: Thu, 30 Apr 2026 10:20:04 +1000
Message-ID: <20260430002046.59739-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260430002046.59739-1-richard.henderson@linaro.org>
References: <20260430002046.59739-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x534.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/cpu64.c        | 4 ++++
 docs/system/arm/emulation.rst | 1 +
 2 files changed, 5 insertions(+)

diff --git a/target/arm/tcg/cpu64.c b/target/arm/tcg/cpu64.c
index 649d854a65..ff0c2b1c47 100644
--- a/target/arm/tcg/cpu64.c
+++ b/target/arm/tcg/cpu64.c
@@ -1266,6 +1266,10 @@ void aarch64_max_tcg_initfn(Object *obj)
     t = FIELD_DP64(t, ID_AA64ISAR2, ATS1A, 1);    /* FEAT_ATS1A */
     SET_IDREG(isar, ID_AA64ISAR2, t);
 
+    t = GET_IDREG(isar, ID_AA64ISAR3);
+    t = FIELD_DP64(t, ID_AA64ISAR3, FAMINMAX, 1); /* FEAT_FAMINMAX */
+    SET_IDREG(isar, ID_AA64ISAR3, t);
+
     t = GET_IDREG(isar, ID_AA64PFR0);
     t = FIELD_DP64(t, ID_AA64PFR0, FP, 1);        /* FEAT_FP16 */
     t = FIELD_DP64(t, ID_AA64PFR0, ADVSIMD, 1);   /* FEAT_FP16 */
diff --git a/docs/system/arm/emulation.rst b/docs/system/arm/emulation.rst
index 8cd7fe7b00..da5f7efce2 100644
--- a/docs/system/arm/emulation.rst
+++ b/docs/system/arm/emulation.rst
@@ -68,6 +68,7 @@ the following architecture extensions:
 - FEAT_EVT (Enhanced Virtualization Traps)
 - FEAT_F32MM (Single-precision Matrix Multiplication)
 - FEAT_F64MM (Double-precision Matrix Multiplication)
+- FEAT_FAMINMAX (Floating-point maximum and minimum absolute value instructions)
 - FEAT_FCMA (Floating-point complex number instructions)
 - FEAT_FGT (Fine-Grained Traps)
 - FEAT_FHM (Floating-point half-precision multiplication instructions)
-- 
2.43.0


