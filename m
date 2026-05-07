Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D591CD37A7
	for <qemu-arm@archiver.kernel.org>; Thu,  7 May 2026 23:52:13 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wL8S8-0007tv-1J; Thu, 07 May 2026 19:48:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wL8Rq-0007DT-1o
 for qemu-arm@nongnu.org; Thu, 07 May 2026 19:48:12 -0400
Received: from mail-oi1-x234.google.com ([2607:f8b0:4864:20::234])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wL8Rk-00026g-2c
 for qemu-arm@nongnu.org; Thu, 07 May 2026 19:48:02 -0400
Received: by mail-oi1-x234.google.com with SMTP id
 5614622812f47-4648447e29bso469707b6e.0
 for <qemu-arm@nongnu.org>; Thu, 07 May 2026 16:47:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1778197678; x=1778802478; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BiL04P2CzHdch1eAb8Dy0QC+hd+UkcPVAZS3KCpqoms=;
 b=MYP+ndwEz/LnxiTSuP+GTtfk/JuH51k/BgR62e0CFKJQk5MWBHn8pN2ClKACOkxvf9
 3yh9xLn9UDbOviQXhwrYsXJZNnpEZrxpqJk4cs+vwglQx8ct4MnUi4zbb1um3w4yneYm
 f5KHutFODXrqm1ydN33DivKttUQ0EXga6s4b+S8LbG6AlncTJ54cEVT6+EDHv0Kj0NMK
 /m/d4q65V7drgWy4SZHIitfvkjfam2JV2H7/jYN7HYuj4+izFnwiyb+kXZlEFgGgZAGn
 71jF3FDEYRZBApi3+PhM/4HwoN2Uw1icITe/3VjofhfS5/oiJHZ3UqdUAs3pkVys4E/+
 TX8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778197678; x=1778802478;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=BiL04P2CzHdch1eAb8Dy0QC+hd+UkcPVAZS3KCpqoms=;
 b=kWbTBa0Y6wBd0eMn6rEWcVOYJqdHPo6vKyLXDliY2Fs/Dle5iMSdpHRdS4E/pBgGnE
 6/BaaTr9wDBBW5OHRwBR2I/sGNZwYjd6UP/mftyouRgo7VLNiWehMEKpOVAoz0ltletJ
 gE4Vj5tWIxNFJl/MNJKRWDGP16LPTfRV2Lvj3glbmgIqpRApHF42/Y5t1m1nZre3MS1D
 H1tDjJWtWml/AchIoJ2FJK7YDRoOpBYKi6E6WyNWfYHRve1WjD4yr94y8RW/XFe3aWuf
 MpPwIbdrlmnzaO4AnIV6hjNothen4zK6yFhzJy1PZu86PTpvXVD62KnYgG4AHy+xEiqD
 O7PQ==
X-Gm-Message-State: AOJu0YxHwTTfi4V6cP0mbmTVQ5rFtI/P0tUtTh4I8KjSKNI3LweoAT2f
 yuu5ipiw9DYlQQaZR+/uKPSx1xaBmJ+68YAzTCFtTfuCn4AO/xq3paIda1Rc7m9ClHVY1qW4G/O
 qTd95
X-Gm-Gg: AeBDieuRLujpALwVILxDFUrt34OlJVKVrkH1594QcrwB/bh2w3KLEUcrM76CCvk7dvx
 JrbJqlIogeNjBZTzQawnxcN4VrK2En4lAvgCrdS81RUSf8oO4PAptyBYSRv7Xsy6PEMc59S7Lrx
 4VdgKyRSxoFAu51JRsTZP3d+ng+s3m4qVD8K64BqarJBZXnuHu9Z+I0iyYCOEkcF/Hh63BnL/hg
 W31JKnvXPQdP718FB/2XrUpkZkHjqa7+U/Ow4rrKqYJOZbesfRNIKSU9FjFivx5blZvCA6IPNc8
 tlN1BooRYNpiD4rAk3Z5MezCBLGBz4FUhejwXMBp6VP6XJKb1BycQ8LqWvET+qV72L/sM2H171C
 QHS1PK03nr7BzFDoB1AGeKIBz59RB0Yq3BMufwb98UQsZVxig/s1nKAURYMQu/kqH7qtPIymJRy
 3vO5KYhl02bqdI2KZmYNpUrNoo8X12vb5wBQHWL3QBTm9ZEg==
X-Received: by 2002:a05:6808:3a14:b0:47b:9886:1bdc with SMTP id
 5614622812f47-480424f6f70mr6191628b6e.33.1778197677500; 
 Thu, 07 May 2026 16:47:57 -0700 (PDT)
Received: from stoup.attlocal.net ([2600:381:c938:6375:9641:bbb2:a93a:bb4c])
 by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-4355736f517sm242730fac.12.2026.05.07.16.47.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 May 2026 16:47:57 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v4 43/60] target/arm: Enable FEAT_SME_LUTv2 for -cpu max
Date: Thu,  7 May 2026 18:43:56 -0500
Message-ID: <20260507234413.643512-44-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260507234413.643512-1-richard.henderson@linaro.org>
References: <20260507234413.643512-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::234;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x234.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/cpu64.c        | 1 +
 docs/system/arm/emulation.rst | 1 +
 2 files changed, 2 insertions(+)

diff --git a/target/arm/tcg/cpu64.c b/target/arm/tcg/cpu64.c
index 8d0c057902..90214a355a 100644
--- a/target/arm/tcg/cpu64.c
+++ b/target/arm/tcg/cpu64.c
@@ -1388,6 +1388,7 @@ void aarch64_max_tcg_initfn(Object *obj)
     t = FIELD_DP64(t, ID_AA64SMFR0, F64F64, 1);   /* FEAT_SME_F64F64 */
     t = FIELD_DP64(t, ID_AA64SMFR0, I16I64, 0xf); /* FEAT_SME_I16I64 */
     t = FIELD_DP64(t, ID_AA64SMFR0, SMEVER, 2);   /* FEAT_SME2p1 */
+    t = FIELD_DP64(t, ID_AA64SMFR0, LUTv2, 1);    /* FEAT_SME_LUTv2 */
     t = FIELD_DP64(t, ID_AA64SMFR0, FA64, 1);     /* FEAT_SME_FA64 */
     SET_IDREG(isar, ID_AA64SMFR0, t);
 
diff --git a/docs/system/arm/emulation.rst b/docs/system/arm/emulation.rst
index b6f0ca9351..0dd6b554a0 100644
--- a/docs/system/arm/emulation.rst
+++ b/docs/system/arm/emulation.rst
@@ -158,6 +158,7 @@ the following architecture extensions:
 - FEAT_SME_F16F16 (Non-widening half-precision FP16 arithmetic for SME2)
 - FEAT_SME_F64F64 (Double-precision floating-point outer product instructions)
 - FEAT_SME_I16I64 (16-bit to 64-bit integer widening outer product instructions)
+- FEAT_SME_LUTv2 (Lookup table instructions with 4-bit indices and 8-bit elements)
 - FEAT_SVE (Scalable Vector Extension)
 - FEAT_SVE_AES (Scalable Vector AES instructions)
 - FEAT_SVE_B16B16 (Non-widening BFloat16 arithmetic for SVE2)
-- 
2.43.0


