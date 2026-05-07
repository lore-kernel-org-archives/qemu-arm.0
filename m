Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09BCBCD3445
	for <qemu-arm@archiver.kernel.org>; Thu,  7 May 2026 23:51:18 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wL8SG-0008Ih-4a; Thu, 07 May 2026 19:48:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wL8Rz-0007OO-Gx
 for qemu-arm@nongnu.org; Thu, 07 May 2026 19:48:15 -0400
Received: from mail-oa1-x35.google.com ([2001:4860:4864:20::35])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wL8Rw-0002A7-1h
 for qemu-arm@nongnu.org; Thu, 07 May 2026 19:48:14 -0400
Received: by mail-oa1-x35.google.com with SMTP id
 586e51a60fabf-40ef10ec84cso1150048fac.2
 for <qemu-arm@nongnu.org>; Thu, 07 May 2026 16:48:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1778197688; x=1778802488; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mgEG0/OuigOMwClChXrRoaFDD6e1qpvZV0h5+lZSYqk=;
 b=bmayzxRP/klsWtO8J4Rf5j3Zjto3fKL42LiYarYtmf+K+yhHLsxQtyT8nXOdohtXIh
 n2qnwcKWXa3PRm/A3AAABpwPc2Hc3GfIQBTeQNoaiw7KGZfINlOWWkLtlStBT006EYHY
 8F1lBSZEAWVUBPb2xdcnarPqBe5sP1TxE7sxSgAkKj1XKPQ8dcucN2GNbQq9YsLRghXM
 AUjmaZJjRx7MzCCVb6DF+cSJ23+pY/m2gLpBEPz8fpdti6bGrJNu56m2qdU46Oxnl3ix
 wSS3HTU6KtsZwPFRs0d07IjqDKVuhUf9a4q1xuPljUtcBHgSNXcIVJPM2nSgy/O9jRzy
 cc3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778197688; x=1778802488;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=mgEG0/OuigOMwClChXrRoaFDD6e1qpvZV0h5+lZSYqk=;
 b=MO2VYJEkMMEKKTtMI3Hwk0gJT0r1yaK33WUlni8Z4+XEz3IUlkw83MynyR55+yw3wv
 DnY528HbB0UfDQpAw7V3CDLoM8eiEi7r67GvujnbFsCFXcNlmmXL9uyRpINaWkfFvbLw
 pZ7DQyZwle7JyP3OblUbIqbhuJzYwZ3h7GSiAygRDq7mdtF/av5hmq7x4wIz42UX4/kp
 FLbfDK3j7RgZYtV3JKD43QtsbWZwgEgHkmvs9QQ2ATkjxBEQAzMtQe4anfDNJqNQXzoo
 JnWEYm20UhnencM2WrwjSqVamtgYaqksRNFrvd92OIYN15Pf6Tl5p6V6rpFjIlVTMwWO
 p/WA==
X-Gm-Message-State: AOJu0YxMKDdtRa2o2U7rwM3nDjNumhGT1r/fFEiQzpRqdXwIx/Th3ErQ
 1EWNaMSZEfMua4pzt4TiCZtlJJntsNZl68VJ5N8UK/bfhUJjD4IzolK8XRAQhm0umsI=
X-Gm-Gg: Acq92OGcP7dnnRyKViWYv/UMRQ2tXqc9gn9Cz79nlAkXDfJ+Uq/3ctduG+6WUbj1W0N
 FyzO3iRf8Ox0Dtm3uuPzVTt/v/a0SSE8LYOMjTO5yVNibIeW9rLtUScmsZOtlgZWOKTQw2XnNo6
 k9xxBYcbEM1VC0f39uGYWO1UjmSSTA9Sd5cHMf8Y6+boIqydDvuA6dXu7Y2kI8tS6LAgwpnUCpa
 pw7umYQ3EuT2rVW5mxAKQhjWfbQC6GoH0BNcRUNUaOohuzbOr/mS3MrlygjKBC+XMJRZ1gw7UAA
 y/75b/sofxLrwQjv25uHMQ3f88eMgC4/E13NMIBC5Abd0ujwyuVtm/6e4QH7P8q/OGDwM/gfsx8
 NgHZ9XEsf1aNEODcmuGAPd3XsjDEb8qW/Jlx7NS9BwNwvbk/hKQTRjJ5NSbzOv2/k5taL/OkJAv
 q8e9GkqJLOX6VIFQAXUt5ecMBzG6O7JYFgy38A0vdjIyoJRxcciAUFChLuZZVmt0X9YGo=
X-Received: by 2002:a05:6870:7d01:b0:42c:2421:5777 with SMTP id
 586e51a60fabf-434f613bb6amr6897234fac.13.1778197688577; 
 Thu, 07 May 2026 16:48:08 -0700 (PDT)
Received: from stoup.attlocal.net ([2600:381:c938:6375:9641:bbb2:a93a:bb4c])
 by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-4355736f517sm242730fac.12.2026.05.07.16.48.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 May 2026 16:48:08 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v4 54/60] target/arm: Enable FEAT_FP8DOT2,
 FEAT_SSVE_FP8DOT2 for -cpu max
Date: Thu,  7 May 2026 18:44:07 -0500
Message-ID: <20260507234413.643512-55-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260507234413.643512-1-richard.henderson@linaro.org>
References: <20260507234413.643512-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::35;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x35.google.com
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
 target/arm/tcg/cpu64.c        | 2 ++
 docs/system/arm/emulation.rst | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/target/arm/tcg/cpu64.c b/target/arm/tcg/cpu64.c
index 6dec7e045d..a43b6367a4 100644
--- a/target/arm/tcg/cpu64.c
+++ b/target/arm/tcg/cpu64.c
@@ -1377,6 +1377,7 @@ void aarch64_max_tcg_initfn(Object *obj)
     SET_IDREG(isar, ID_AA64DFR0, t);
 
     t = GET_IDREG(isar, ID_AA64SMFR0);
+    t = FIELD_DP64(t, ID_AA64SMFR0, SF8DP2, 1);   /* FEAT_SSVE_FP8DOT2 */
     t = FIELD_DP64(t, ID_AA64SMFR0, SF8DP4, 1);   /* FEAT_SSVE_FP8DOT4 */
     t = FIELD_DP64(t, ID_AA64SMFR0, SF8FMA, 1);   /* FEAT_SSVE_FP8FMA */
     t = FIELD_DP64(t, ID_AA64SMFR0, F32F32, 1);   /* FEAT_SME */
@@ -1397,6 +1398,7 @@ void aarch64_max_tcg_initfn(Object *obj)
     t = GET_IDREG(isar, ID_AA64FPFR0);
     t = FIELD_DP64(t, ID_AA64FPFR0, F8E5M2, 1);   /* FEAT_FP8 */
     t = FIELD_DP64(t, ID_AA64FPFR0, F8E4M3, 1);   /* FEAT_FP8 */
+    t = FIELD_DP64(t, ID_AA64FPFR0, F8DP2, 1);    /* FEAT_FP8DOT2 */
     t = FIELD_DP64(t, ID_AA64FPFR0, F8DP4, 1);    /* FEAT_FP8DOT4 */
     t = FIELD_DP64(t, ID_AA64FPFR0, F8FMA, 1);    /* FEAT_FP8FMA */
     t = FIELD_DP64(t, ID_AA64FPFR0, F8CVT, 1);    /* FEAT_FP8 */
diff --git a/docs/system/arm/emulation.rst b/docs/system/arm/emulation.rst
index bee4e36dc6..875716d18f 100644
--- a/docs/system/arm/emulation.rst
+++ b/docs/system/arm/emulation.rst
@@ -75,6 +75,7 @@ the following architecture extensions:
 - FEAT_FP (Floating Point extensions)
 - FEAT_FP16 (Half-precision floating-point data processing)
 - FEAT_FP8 (FP8 convert instructions)
+- FEAT_FP8DOT2 (FP8 2-way dot product to half-precision instructions)
 - FEAT_FP8DOT4 (FP8 4-way dot product to single-precision instructions)
 - FEAT_FP8FMA (FP8 multiply-accumulate to half-precision and single-precision instructions)
 - FEAT_FPAC (Faulting on AUT* instructions)
@@ -161,6 +162,7 @@ the following architecture extensions:
 - FEAT_SME_F64F64 (Double-precision floating-point outer product instructions)
 - FEAT_SME_I16I64 (16-bit to 64-bit integer widening outer product instructions)
 - FEAT_SME_LUTv2 (Lookup table instructions with 4-bit indices and 8-bit elements)
+- FEAT_SSVE_FP8DOT2 (SVE2 FP8 2-way dot product to half-precision instructions in Streaming SVE mode)
 - FEAT_SSVE_FP8DOT4 (SVE2 FP8 4-way dot product to single-precision instructions in Streaming SVE mode)
 - FEAT_SSVE_FP8FMA (SVE2 FP8 multiply-accumulate to half-precision and single-precision instructions in Streaming SVE mode)
 - FEAT_SVE (Scalable Vector Extension)
-- 
2.43.0


