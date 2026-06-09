Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04F72CD8CB9
	for <qemu-arm@archiver.kernel.org>; Tue,  9 Jun 2026 19:24:25 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wX23g-0004Tu-5F; Tue, 09 Jun 2026 15:24:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wX21S-0003Hi-F5
 for qemu-arm@nongnu.org; Tue, 09 Jun 2026 15:22:11 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wX21C-00047D-7I
 for qemu-arm@nongnu.org; Tue, 09 Jun 2026 15:21:52 -0400
Received: by mail-pj1-x1034.google.com with SMTP id
 98e67ed59e1d1-36dac5d5da0so3137467a91.2
 for <qemu-arm@nongnu.org>; Tue, 09 Jun 2026 12:21:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1781032892; x=1781637692; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aEZChDC1OdtmKFkGf/mgdW+kDHfZFX5ELTDL9qf9qag=;
 b=XfoGLT/8jH1Tuh9OAb5+SIhnMUgRHwzVU5wTrTxiLKMV2DehWzIf5hFVFIL0vXeX9Q
 DXqC5sz64R4q3gQEIqiVt2g5UY1cQBIhgTm0Lwd1cYi02I1uXM+HxMNMIuzdy0dr8/Sm
 cPTZZE693PwchVkDCudDZbBsp/OCnsSh1Nhhb9LnpmQZ97HfQiphyh2/RnskgxEcaTNl
 QdCO81+I/sr+PMK+yyfPC6/DSkNvKA+jpTc43UGDAtuQfGiBbXDBGrqXlt4+Eu34mrSI
 0I2W93d4/AkMQ4fWL/9sRv+tGNvYP5omip/dC7bgxF4bgpYzrOaw96+TuVa5vuOUMvAn
 jJSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781032892; x=1781637692;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=aEZChDC1OdtmKFkGf/mgdW+kDHfZFX5ELTDL9qf9qag=;
 b=kODUt5iqkVPaJ8SEgK1GH9S7JN+lXXDGdr8DEMY7SLe0bgbuc96D4itVO9QtHSROrd
 8dOXhCCzJRQL0oLtaggJp8FI1dx8Pgb696wuu6gNLx7OjhuUoaM4ZhoBi999krShovX3
 tvjf42jZnlN8Z0bU8jy7xejSQ3xg8fGZgyqCUQNhqQh3vXPoZGgiI4McaO8fUGgpJ9NT
 68QDH7w1klZVBInGpz36a+X4w+ZZuaQ4nVVdCBj3/QpteBTuIP76WmTrXC8/tQSkRlYi
 Ma7khTWJjnV79lqAj03lVStZAY4xCR5r9rVZvKXA6ETQaiPyaOSz65JrjGa+YDSKWBId
 24ig==
X-Gm-Message-State: AOJu0YwqQX5nDGasGxYz0PKBVuOXhJmjqQrZJI1GrSvyebG2kpB1Ncvb
 pkqFVukYB7Rb/fvXk3LL2xmXyDtTCv398xRtk2TfC35g2qKLl7pBKPA4Iid+ol0caXE=
X-Gm-Gg: Acq92OF1WvlGXNJPw10bm8BbOGdtJVUWyn7jDYYM3ftKJe5xqSGO5KdCSHXf12IYU8h
 IKXpTT15M+0ftbM9PbPAQxNIK0qKKweFj+KCdjamnKG0uDqMGwz4CPdsCd/viLOJO6u9K6tpAR2
 8Mfyox7cgT/CpN2aCvCxyMaHly12n/f4pK4iw1dMDxaXAs4k6zjnkf+MQVDAN1xSIvVchmwV5kj
 fKzDa1UXEiojta8ssBPzwsoKG6n16HKVz9SeoMPQCdOIiVGdappzucnjKzyh2O4uF7KozkcSCVh
 mOCbIf9AzC02a7YyElQz93u7KYvsMIKfAqyJH9zhckex8wh0j9lhHa6arxwEhGdlSUp8LJFBdCR
 nmq7kj5qmiKiIYQs0wchE0aSlelm4NC5mwYoZJVBaWM6aOjMlsjS8/THRq3F5xvnbmgkKOZcGe0
 c4zdDlpI2TW54SXiKCwE3YZwkbb+3uUbqzYXQxpwU=
X-Received: by 2002:a17:90b:4b0b:b0:36b:a2cc:4857 with SMTP id
 98e67ed59e1d1-370efdaca8fmr26729008a91.18.1781032891694; 
 Tue, 09 Jun 2026 12:21:31 -0700 (PDT)
Received: from stoup.. ([71.212.142.33]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2c164f88473sm240806095ad.25.2026.06.09.12.21.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jun 2026 12:21:31 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v10 28/45] target/arm: Enable FEAT_SME_LUTv2 for -cpu max
Date: Tue,  9 Jun 2026 12:20:52 -0700
Message-ID: <20260609192110.752384-29-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260609192110.752384-1-richard.henderson@linaro.org>
References: <20260609192110.752384-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
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

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/aarch64/elfload.c  | 1 +
 target/arm/tcg/cpu64.c        | 1 +
 docs/system/arm/emulation.rst | 1 +
 3 files changed, 3 insertions(+)

diff --git a/linux-user/aarch64/elfload.c b/linux-user/aarch64/elfload.c
index 1c0c404b7c..06c14e82ea 100644
--- a/linux-user/aarch64/elfload.c
+++ b/linux-user/aarch64/elfload.c
@@ -222,6 +222,7 @@ abi_ulong get_elf_hwcap2(CPUState *cs)
     GET_FEATURE_ID(aa64_faminmax, ARM_HWCAP2_A64_FAMINMAX);
     GET_FEATURE_ID(aa64_fpmr, ARM_HWCAP2_A64_FPMR);
     GET_FEATURE_ID(aa64_lut, ARM_HWCAP2_A64_LUT);
+    GET_FEATURE_ID(aa64_sme2p1_lutv2, ARM_HWCAP2_A64_SME_LUTV2);
     GET_FEATURE_ID(aa64_f8cvt, ARM_HWCAP2_A64_F8CVT |
                                ARM_HWCAP2_A64_F8E4M3 |
                                ARM_HWCAP2_A64_F8E5M2);
diff --git a/target/arm/tcg/cpu64.c b/target/arm/tcg/cpu64.c
index b48dd01a2c..e466ab5b8a 100644
--- a/target/arm/tcg/cpu64.c
+++ b/target/arm/tcg/cpu64.c
@@ -1389,6 +1389,7 @@ void aarch64_max_tcg_initfn(Object *obj)
     t = FIELD_DP64(t, ID_AA64SMFR0, F64F64, 1);   /* FEAT_SME_F64F64 */
     t = FIELD_DP64(t, ID_AA64SMFR0, I16I64, 0xf); /* FEAT_SME_I16I64 */
     t = FIELD_DP64(t, ID_AA64SMFR0, SMEVER, 2);   /* FEAT_SME2p1 */
+    t = FIELD_DP64(t, ID_AA64SMFR0, LUTv2, 1);    /* FEAT_SME_LUTv2 */
     t = FIELD_DP64(t, ID_AA64SMFR0, FA64, 1);     /* FEAT_SME_FA64 */
     SET_IDREG(isar, ID_AA64SMFR0, t);
 
diff --git a/docs/system/arm/emulation.rst b/docs/system/arm/emulation.rst
index 470f7d891e..41fa9bfca3 100644
--- a/docs/system/arm/emulation.rst
+++ b/docs/system/arm/emulation.rst
@@ -160,6 +160,7 @@ the following architecture extensions:
 - FEAT_SME_F16F16 (Non-widening half-precision FP16 arithmetic for SME2)
 - FEAT_SME_F64F64 (Double-precision floating-point outer product instructions)
 - FEAT_SME_I16I64 (16-bit to 64-bit integer widening outer product instructions)
+- FEAT_SME_LUTv2 (Lookup table instructions with 4-bit indices and 8-bit elements)
 - FEAT_SVE (Scalable Vector Extension)
 - FEAT_SVE_AES (Scalable Vector AES instructions)
 - FEAT_SVE_B16B16 (Non-widening BFloat16 arithmetic for SVE2)
-- 
2.43.0


