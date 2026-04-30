Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE606CCFA13
	for <qemu-arm@archiver.kernel.org>; Thu, 30 Apr 2026 00:26:49 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wIFE4-0007eu-S6; Wed, 29 Apr 2026 20:25:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wIFDq-0006Yl-70
 for qemu-arm@nongnu.org; Wed, 29 Apr 2026 20:25:45 -0400
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wIFDo-0007bD-4f
 for qemu-arm@nongnu.org; Wed, 29 Apr 2026 20:25:41 -0400
Received: by mail-pf1-x434.google.com with SMTP id
 d2e1a72fcca58-82f8892d4d6so156615b3a.0
 for <qemu-arm@nongnu.org>; Wed, 29 Apr 2026 17:25:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1777508738; x=1778113538; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xnvL1dEdpYA1y9JJcxfkHku7n0bLCdQETh28Vu/3wxA=;
 b=VmN5W11uZ3xuQWiviKk1osvGupP/EuFWqGHrjv4OFttrrFy4mzzO9yfJ4TDr3NliH5
 a3c9/3kMQXldLWQ1AG4ZmTwwVWMnAQOfGzLKX7QcjNthD+tw59kNjNxcXVwb7Z5o48JV
 2ZezQx6A4VaVbtBRAfyZhqa+A2PGeVEz9V+YNQsKlZ+EeMjSipeyQTBUWRCChfsWceKn
 wS8CkP12QaWg5QQ0LzqPtygYqdI9C/R6pVh64XG2uS46q+IsB3tuSKpZt6RAWUolJc49
 jWheq7onNkLuhQhpvRQkOOpPRpLpeht5XCSvaRFwnzBxtaPpr2xkdHcRtsu4jpjILtRR
 835w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777508738; x=1778113538;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=xnvL1dEdpYA1y9JJcxfkHku7n0bLCdQETh28Vu/3wxA=;
 b=H+PL3ezaL2Xide+uYJQQxZLAi620xQx4SGC27FbCLXzbBeHC8yKD1bspKDXz2hzpGa
 Rosru4gBHb54Cgumxe171FcCqQUsp1Xy4JYXKcnKCpxZSLNJZsEACzk7lswkCgCvEYod
 iqFDpuXrAvLS2Soz5GtiTF8Cra2cEF+1V9N1gpCFhAKZlJiaqfVXwg8N13Y3HnI28OBp
 19sNiryG9biEuhqcIEkdxgOJe8E+yZjMRwMgXUK4tbVRnBwOchMTM9ycgs4x+BvJIiy/
 yH9ghbUqox/voeviRvZ7olJ9psY2d9lDJRNUmfOpxfy+xYjLl5KNDWiRmzuXLjjW6q/q
 TKTg==
X-Gm-Message-State: AOJu0YxKGkoeHbfvoKz1SgqNU0JrQ6KXSMLsEEQxOAqULQJCoERzh/Av
 wz8hRoaZEosy1Oa4oYrUEO6hOFKIcFWZRt2rse0ydC/4zrIpfPm4ZUwYtzQ2+1M73QE0Vf+fAXq
 xeZV2SWk=
X-Gm-Gg: AeBDiesovH6COAcCbOc5jq4stT+H0dCNcBUpOrxPrtHrCXGwTn9g++9SaEkXCzIr/JR
 42BkBwNzcIyc9gRWV9TysigycoD17vM6HS+xvixHvN2OTxRZAlkOjldqLLf0n0FPpHvIRa/T4hH
 SXwcMzK3HROG4nGLpr4DJ0ciLKiOETi/kvnQwxGcBOqRdYM/vO2LvItjBlJuNv7SRuHtNJ+OGXH
 bVeAdkbqXOeywbSmK0V4cJk8vcqi6e6JYpFH7pw25xLZuV7Hck+Pe68v6pWs8tcaqijZu9SK3Id
 aTqq9DYkB6AwhK6MCPR8Is3Fr6LEiL+vI/K42m2mxgClKajABx9mtWskq5nUl/L2WL8jL5U/Mb7
 hb6RJ6HN8eL/lO9ukW/IcXXK9ggJ65TD35SR6bjd8tM1SraHZRxH44GY+D8nOu2mKZL/3NjZgwQ
 omYs8YURcTvT038VHKnPWdAHrm3byNE7Ha96f3qA1Y
X-Received: by 2002:a05:6a20:e212:b0:3a3:327:c5c8 with SMTP id
 adf61e73a8af0-3a3cf1059f6mr778773637.0.1777508738169; 
 Wed, 29 Apr 2026 17:25:38 -0700 (PDT)
Received: from stoup.. ([180.233.125.15]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-c7fd64f21b4sm3204112a12.21.2026.04.29.17.25.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Apr 2026 17:25:37 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v3 47/47] target/arm: Enable FEAT_FP8FMA,
 FEAT_SSVE_FP8FMA for -cpu max
Date: Thu, 30 Apr 2026 10:20:46 +1000
Message-ID: <20260430002046.59739-48-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260430002046.59739-1-richard.henderson@linaro.org>
References: <20260430002046.59739-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x434.google.com
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
 target/arm/tcg/cpu64.c        | 2 ++
 docs/system/arm/emulation.rst | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/target/arm/tcg/cpu64.c b/target/arm/tcg/cpu64.c
index 90214a355a..93cd7ee1a6 100644
--- a/target/arm/tcg/cpu64.c
+++ b/target/arm/tcg/cpu64.c
@@ -1377,6 +1377,7 @@ void aarch64_max_tcg_initfn(Object *obj)
     SET_IDREG(isar, ID_AA64DFR0, t);
 
     t = GET_IDREG(isar, ID_AA64SMFR0);
+    t = FIELD_DP64(t, ID_AA64SMFR0, SF8FMA, 1);   /* FEAT_SSVE_FP8FMA */
     t = FIELD_DP64(t, ID_AA64SMFR0, F32F32, 1);   /* FEAT_SME */
     t = FIELD_DP64(t, ID_AA64SMFR0, BI32I32, 1);  /* FEAT_SME2 */
     t = FIELD_DP64(t, ID_AA64SMFR0, B16F32, 1);   /* FEAT_SME */
@@ -1395,6 +1396,7 @@ void aarch64_max_tcg_initfn(Object *obj)
     t = GET_IDREG(isar, ID_AA64FPFR0);
     t = FIELD_DP64(t, ID_AA64FPFR0, F8E5M2, 1);   /* FEAT_FP8 */
     t = FIELD_DP64(t, ID_AA64FPFR0, F8E4M3, 1);   /* FEAT_FP8 */
+    t = FIELD_DP64(t, ID_AA64FPFR0, F8FMA, 1);    /* FEAT_FP8FMA */
     t = FIELD_DP64(t, ID_AA64FPFR0, F8CVT, 1);    /* FEAT_FP8 */
     SET_IDREG(isar, ID_AA64FPFR0, t);
 
diff --git a/docs/system/arm/emulation.rst b/docs/system/arm/emulation.rst
index 0dd6b554a0..a6b48f9c60 100644
--- a/docs/system/arm/emulation.rst
+++ b/docs/system/arm/emulation.rst
@@ -75,6 +75,7 @@ the following architecture extensions:
 - FEAT_FP (Floating Point extensions)
 - FEAT_FP16 (Half-precision floating-point data processing)
 - FEAT_FP8 (FP8 convert instructions)
+- FEAT_FP8FMA (FP8 multiply-accumulate to half-precision and single-precision instructions)
 - FEAT_FPAC (Faulting on AUT* instructions)
 - FEAT_FPACCOMBINE (Faulting on combined pointer authentication instructions)
 - FEAT_FPACC_SPEC (Speculative behavior of combined pointer authentication instructions)
@@ -159,6 +160,7 @@ the following architecture extensions:
 - FEAT_SME_F64F64 (Double-precision floating-point outer product instructions)
 - FEAT_SME_I16I64 (16-bit to 64-bit integer widening outer product instructions)
 - FEAT_SME_LUTv2 (Lookup table instructions with 4-bit indices and 8-bit elements)
+- FEAT_SSVE_FP8FMA (SVE2 FP8 multiply-accumulate to half-precision and single-precision instructions in Streaming SVE mode)
 - FEAT_SVE (Scalable Vector Extension)
 - FEAT_SVE_AES (Scalable Vector AES instructions)
 - FEAT_SVE_B16B16 (Non-widening BFloat16 arithmetic for SVE2)
-- 
2.43.0


