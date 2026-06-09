Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B72E4CD8CAD
	for <qemu-arm@archiver.kernel.org>; Tue,  9 Jun 2026 19:24:32 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wX23b-0004S4-IJ; Tue, 09 Jun 2026 15:24:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wX21a-0003Kl-7u
 for qemu-arm@nongnu.org; Tue, 09 Jun 2026 15:22:11 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wX21P-0004AK-2F
 for qemu-arm@nongnu.org; Tue, 09 Jun 2026 15:22:03 -0400
Received: by mail-pl1-x62e.google.com with SMTP id
 d9443c01a7336-2bf125989f2so44085455ad.3
 for <qemu-arm@nongnu.org>; Tue, 09 Jun 2026 12:21:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1781032899; x=1781637699; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tJfpy+xJLZOiImz54Y7mNvfbbMCkdR2h/mEqIv4LlnM=;
 b=Y19brQtxTrKpA36Fs2B7X98iAyiFPuzIvtZR1gtOyKns9FtgSUZ+1l7YUBgYzLW92N
 g0TEAP56Uw3gl6hgimcN23TCDQXP2xPGXRf9FrAGFfN4H/hSDUcir/x6oyKCAy9Fh1EO
 SEqxJSuDTZ3LSjtiy5Rf9uI5zCTQ+4aBB/O0wGg1QXXWYbBByx3+p4YbY4eQtcr/Bnkn
 bBRTFBTWa9fX3KWjuLlQ8qEP5boY4FVqUM4txNvnosNckfIv3Xd3q820f6/WcsUXb8Uw
 lG56EAM51q35izs8IGeS9GDQUDIdTkwpLWL2mgQtIkGmZhijn1Zt2tCGOnESK+6lwmXS
 w2cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781032899; x=1781637699;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=tJfpy+xJLZOiImz54Y7mNvfbbMCkdR2h/mEqIv4LlnM=;
 b=J3h5ZAw+gTYeipc09XdnOziyEBTwWeSU8rK1TvEkvlU+5gSY7MAfuG/VqPEY61/SKB
 RQxXYgvz7n8mu3DQEZxq/GUeEmtalt0OSCBh0QlnSQw8fP695KVwHBTYF6g98mMigj01
 gY+zZNNsaHkpGIz98GvYVqPO42S8h/YhabwKLZx7SqUBSjV5igvbCclsX1XWOAX1R2N4
 qPalOgZWdjtS0iqpu3FPL7C3zxL5GQ5kMosu9aq4gXQkiL4XrKaekTASk6OHy11w/LhN
 UNkjjZmnMTQRcRqIiMX9caJXM11cTZFIy4Ep7cHcMn0YSBiI08g4LaOGgDLj5fgAWtjR
 4t6A==
X-Gm-Message-State: AOJu0YzeQ4E+nML9V1z4j54HfqrDU6kyMvQeEAsq950EB5fYDNoJHxYZ
 gFmN8zXw0IQZj2q/PNSKSDy/eEc2XeJOdrtFs9VU++pT4cOxUVikW/z8j3Mv80MnZ3+0X8hAN28
 CPSBvbi8=
X-Gm-Gg: Acq92OGWg9awPuQbjWBHtgHnTAvCRdpchZBABAUzXt9oDl8p9w4u13XB/uREc7C2VIK
 AJKNoTWg5QH5j3yzc8KMyLrwxUjfKmRv9X9ZlXfRZ2XNRHI+/15BOhaQZDnvdW4sOzPrHX1sn7R
 Ap/JAn/nTLWn14KkKuW44gT81l3jo6CjGhR8WQTFrCc86pb8DDaPOcBNK9d0kAhJAgd0GpPUZzj
 QC9GR0fsSJuPas//deeYVd9xPbfaDCwaFcX/lueznD3CoVUvI2lpMfY4QkrI4BTCEtiHH/sMkc9
 6JdN6Gpp8G/KaK8Ztbbnsf1+k6WcqUFE3vELQeAtsFCOpdwGx4ov+7obsAki/EJ2OryqNU71ud3
 xFMr3YTGu6uKcUSbtfGbPFgkjzx/dmY5oFHeDqnhP0R7HPLAHWlx5iz0PErFIJPssEFU4BniRkh
 ic0XwNfADzY79m2GcgHUEP3P3JUEhGp4ad2kKORb0=
X-Received: by 2002:a17:902:e5cf:b0:2c0:d8ee:7d73 with SMTP id
 d9443c01a7336-2c1e8218185mr240638355ad.37.1781032899310; 
 Tue, 09 Jun 2026 12:21:39 -0700 (PDT)
Received: from stoup.. ([71.212.142.33]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2c164f88473sm240806095ad.25.2026.06.09.12.21.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jun 2026 12:21:38 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v10 36/45] target/arm: Enable FEAT_FP8DOT4,
 FEAT_SSVE_FP8DOT4 for -cpu max
Date: Tue,  9 Jun 2026 12:21:00 -0700
Message-ID: <20260609192110.752384-37-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260609192110.752384-1-richard.henderson@linaro.org>
References: <20260609192110.752384-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
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
 linux-user/aarch64/elfload.c  | 2 ++
 target/arm/tcg/cpu64.c        | 2 ++
 docs/system/arm/emulation.rst | 2 ++
 3 files changed, 6 insertions(+)

diff --git a/linux-user/aarch64/elfload.c b/linux-user/aarch64/elfload.c
index a82d65a681..be33fede6b 100644
--- a/linux-user/aarch64/elfload.c
+++ b/linux-user/aarch64/elfload.c
@@ -227,7 +227,9 @@ abi_ulong get_elf_hwcap2(CPUState *cs)
                                ARM_HWCAP2_A64_F8E4M3 |
                                ARM_HWCAP2_A64_F8E5M2);
     GET_FEATURE_ID(aa64_f8fma, ARM_HWCAP2_A64_F8FMA);
+    GET_FEATURE_ID(aa64_f8dp4, ARM_HWCAP2_A64_F8DP4);
     GET_FEATURE_ID(aa64_ssve_f8fma, ARM_HWCAP2_A64_SME_SF8FMA);
+    GET_FEATURE_ID(aa64_ssve_f8dp4, ARM_HWCAP2_A64_SME_SF8DP4);
 
     return hwcaps;
 }
diff --git a/target/arm/tcg/cpu64.c b/target/arm/tcg/cpu64.c
index 6ad841c51b..1e2d1311b9 100644
--- a/target/arm/tcg/cpu64.c
+++ b/target/arm/tcg/cpu64.c
@@ -1378,6 +1378,7 @@ void aarch64_max_tcg_initfn(Object *obj)
     SET_IDREG(isar, ID_AA64DFR0, t);
 
     t = GET_IDREG(isar, ID_AA64SMFR0);
+    t = FIELD_DP64(t, ID_AA64SMFR0, SF8DP4, 1);   /* FEAT_SSVE_FP8DOT4 */
     t = FIELD_DP64(t, ID_AA64SMFR0, SF8FMA, 1);   /* FEAT_SSVE_FP8FMA */
     t = FIELD_DP64(t, ID_AA64SMFR0, F32F32, 1);   /* FEAT_SME */
     t = FIELD_DP64(t, ID_AA64SMFR0, BI32I32, 1);  /* FEAT_SME2 */
@@ -1397,6 +1398,7 @@ void aarch64_max_tcg_initfn(Object *obj)
     t = GET_IDREG(isar, ID_AA64FPFR0);
     t = FIELD_DP64(t, ID_AA64FPFR0, F8E5M2, 1);   /* FEAT_FP8 */
     t = FIELD_DP64(t, ID_AA64FPFR0, F8E4M3, 1);   /* FEAT_FP8 */
+    t = FIELD_DP64(t, ID_AA64FPFR0, F8DP4, 1);    /* FEAT_FP8DOT4 */
     t = FIELD_DP64(t, ID_AA64FPFR0, F8FMA, 1);    /* FEAT_FP8FMA */
     t = FIELD_DP64(t, ID_AA64FPFR0, F8CVT, 1);    /* FEAT_FP8 */
     SET_IDREG(isar, ID_AA64FPFR0, t);
diff --git a/docs/system/arm/emulation.rst b/docs/system/arm/emulation.rst
index 78d1938656..8d786f9dae 100644
--- a/docs/system/arm/emulation.rst
+++ b/docs/system/arm/emulation.rst
@@ -76,6 +76,7 @@ the following architecture extensions:
 - FEAT_FP (Floating Point extensions)
 - FEAT_FP16 (Half-precision floating-point data processing)
 - FEAT_FP8 (FP8 convert instructions)
+- FEAT_FP8DOT4 (FP8 4-way dot product to single-precision instructions)
 - FEAT_FP8FMA (FP8 multiply-accumulate to half-precision and single-precision instructions)
 - FEAT_FPAC (Faulting on AUT* instructions)
 - FEAT_FPACCOMBINE (Faulting on combined pointer authentication instructions)
@@ -162,6 +163,7 @@ the following architecture extensions:
 - FEAT_SME_F64F64 (Double-precision floating-point outer product instructions)
 - FEAT_SME_I16I64 (16-bit to 64-bit integer widening outer product instructions)
 - FEAT_SME_LUTv2 (Lookup table instructions with 4-bit indices and 8-bit elements)
+- FEAT_SSVE_FP8DOT4 (SVE2 FP8 4-way dot product to single-precision instructions in Streaming SVE mode)
 - FEAT_SSVE_FP8FMA (SVE2 FP8 multiply-accumulate to half-precision and single-precision instructions in Streaming SVE mode)
 - FEAT_SVE (Scalable Vector Extension)
 - FEAT_SVE_AES (Scalable Vector AES instructions)
-- 
2.43.0


