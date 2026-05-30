Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE077CD6E4C
	for <qemu-arm@archiver.kernel.org>; Sat, 30 May 2026 23:21:31 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wTSrN-0000BW-D9; Sat, 30 May 2026 19:12:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wTSrJ-00008R-HM
 for qemu-arm@nongnu.org; Sat, 30 May 2026 19:12:49 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wTSrH-0007Vq-7L
 for qemu-arm@nongnu.org; Sat, 30 May 2026 19:12:49 -0400
Received: by mail-pl1-x62e.google.com with SMTP id
 d9443c01a7336-2c0c3315c5dso2096905ad.3
 for <qemu-arm@nongnu.org>; Sat, 30 May 2026 16:12:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1780182766; x=1780787566; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xE3KMG5cW4IY3yVG0QDZhmffEgJg5P3OLmBBtd/P8a8=;
 b=LEEYh6nqQiIut+0aDzSZvZ8ZP0L3TyfjRfiIzLahjZath1XFscGPZk+4w22+gli4Od
 qcNQmCdwxy1tOILt0hpocm2GDE18HzABb9uQ6UD5qR1u6bB9RVslDAEwRFVhSyiVDIpy
 d2BnlMPpdyPTYWBQRQFPf8OuhIWIExE5dhwcdixnpCqXa4z/5kVhI2cCI60Tjxe/v1hL
 v6Zwav5LxMHzJs4o2/6zURaiClFMIx7uVtmQCKNpNyU9QUa3SGXNd2BkUEb3xXIV2rj5
 j+XjcZXoRCg0ydxwERwHSJ/1sksAAczoX3EkD7wZSOjbd3txfBHdgpIkzTAQ3TJOZnNF
 yi2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780182766; x=1780787566;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=xE3KMG5cW4IY3yVG0QDZhmffEgJg5P3OLmBBtd/P8a8=;
 b=TUZvkJICCaGnL+LAriatd32I2c9UNUC96a7OtjekrcdGViVwALAOerqU422ENd0OTG
 lU4Sgn3HOGB8mojXruFqB68196Kn1YEj6ckeOmt+x1UvWlQSrw1vnYJb+FUPi3ZU4wHC
 +5mLMouiX2yAot5S6vLYK9SVw6UTILKfsUE38JzJU2STkIGWPL946BML2wJEHRLOBEAb
 KPQS/Snah3KxG9issYzjpajXFyp5ScZn3hMrvCefp2zUHQ/9P5bBD27D2EBYkIWWFcPc
 TUd3cy2LSfSKHTDTgqW5qNSKF6+TNIYEGyoh78ha+m5acoRAPLRuRjeaZWdtS6a8zR0F
 iQAw==
X-Gm-Message-State: AOJu0YwYqeJ3BxCiAKfg0Nu1uCZP8u8+ZXentqT2ziR+aUVxefnFgjJN
 /B+hOwXHUpkTqwnkB5bXVbj21njWuJ3E3b3lGT34d5RxlhFcBTLUkkBQ4kHmlk9+UUJ79lkhkig
 u+jxH3To=
X-Gm-Gg: Acq92OGJxRbyNwOEWHyj0+qJU2oKaTveEyciIulScSfRou0kISHx2hzXaiq4nBP5DON
 8FqVIRUWHsljsUPq2Db0MHciOEXowQCknV/6O/MT3LrFKb9LZySmK8hh1DMnGbGsXoAcn8hb9qT
 MEyotE22rAEU9HiaG6ONRSpfJcr+/Ld121i2xCyZnH9sdr1YjiTM2XvV/seZENM6PDZq6q9ex26
 a3RohorO0BU21qyJsVhJP/NXYz4KISRTu2bSiRcEbe79ap0iylRW1RzpGuiqjv8MiZ0nVg4uUXD
 eKQESFuDq9SXJxMF5Jh9H805BnKNg8nfEfM2ha5jiFJjhHMlFAAM5WUrzUDdZ3vXSrgfFW1Ha4P
 24xlIgVH4wYMlA5tKeARbDvWmbWqvk1nbNwh3C/1IIsPcg7iGKPhCxwTFUAzLXAEyUDocS1Z8x/
 Xf7RTZfm/nG2k73uyB4UefrwJDrJyLHvS2AbaWZgM=
X-Received: by 2002:a05:6a20:e68e:b0:398:919a:ddf5 with SMTP id
 adf61e73a8af0-3b4280a3e46mr5083658637.24.1780182765586; 
 Sat, 30 May 2026 16:12:45 -0700 (PDT)
Received: from stoup.. ([71.212.142.33]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-c857729d3d1sm5634356a12.21.2026.05.30.16.12.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 May 2026 16:12:45 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v8 13/41] target/arm: Implement FCVTN (16- to 8-bit fp) for SVE
Date: Sat, 30 May 2026 16:12:01 -0700
Message-ID: <20260530231229.400441-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260530231229.400441-1-richard.henderson@linaro.org>
References: <20260530231229.400441-1-richard.henderson@linaro.org>
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
 target/arm/tcg/helper-fp8-defs.h |  1 +
 target/arm/tcg/fp8_helper.c      | 23 +++++++++++++++++++++++
 target/arm/tcg/translate-sve.c   |  2 ++
 target/arm/tcg/sve.decode        |  1 +
 4 files changed, 27 insertions(+)

diff --git a/target/arm/tcg/helper-fp8-defs.h b/target/arm/tcg/helper-fp8-defs.h
index 023a49e12f..e67fb191c2 100644
--- a/target/arm/tcg/helper-fp8-defs.h
+++ b/target/arm/tcg/helper-fp8-defs.h
@@ -16,5 +16,6 @@ DEF_HELPER_FLAGS_4(sme2_fcvtl_hb, TCG_CALL_NO_RWG, void, ptr, ptr, env, i32)
 DEF_HELPER_FLAGS_4(sve2_bfcvtn_bh, TCG_CALL_NO_RWG, void, ptr, ptr, env, i32)
 
 DEF_HELPER_FLAGS_5(gvec_fcvt_bh, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, env, i32)
+DEF_HELPER_FLAGS_4(sve2_fcvtn_bh, TCG_CALL_NO_RWG, void, ptr, ptr, env, i32)
 
 DEF_HELPER_FLAGS_5(advsimd_fcvt_bs, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, env, i32)
diff --git a/target/arm/tcg/fp8_helper.c b/target/arm/tcg/fp8_helper.c
index 0b86ed9eb9..8295725b83 100644
--- a/target/arm/tcg/fp8_helper.c
+++ b/target/arm/tcg/fp8_helper.c
@@ -414,6 +414,29 @@ void HELPER(gvec_fcvt_bh)(void *vd, void *vn, void *vm,
     clear_tail(vd, oprsz, simd_maxsz(desc));
 }
 
+void HELPER(sve2_fcvtn_bh)(void *vd, void *vn, CPUARMState *env, uint32_t desc)
+{
+    FP8Context ctx = fp8_dst_start(env, desc, true);
+    fcvt_fp8_output_fn *output_fmt = fcvt_fp8_output_fmt[ctx.f8fmt];
+    uint16_t *n0 = vn;
+    uint16_t *n1 = vn + sizeof(ARMVectorReg);
+    uint8_t *d = vd;
+    bool osc = FIELD_EX64(env->vfp.fpmr, FPMR, OSC);
+    size_t oprsz = simd_oprsz(desc);
+    size_t nelem = oprsz / 2;
+
+    for (size_t i = 0; i < nelem; ++i) {
+        float16 e0 = n0[H2(i)];
+        float16 e1 = n1[H2(i)];
+        d[H1(2 * i + 0)] = fcvt_f16_to_fp8(e0, output_fmt,
+                                           ctx.scale, osc, &ctx.stat);
+        d[H1(2 * i + 1)] = fcvt_f16_to_fp8(e1, output_fmt,
+                                           ctx.scale, osc, &ctx.stat);
+    }
+
+    fp8_cvt_finish(env, &ctx);
+}
+
 void HELPER(advsimd_fcvt_bs)(void *vd, void *vn, void *vm,
                              CPUARMState *env, uint32_t desc)
 {
diff --git a/target/arm/tcg/translate-sve.c b/target/arm/tcg/translate-sve.c
index f3d9c8f01d..4ae1d2a75a 100644
--- a/target/arm/tcg/translate-sve.c
+++ b/target/arm/tcg/translate-sve.c
@@ -4100,6 +4100,8 @@ TRANS_FEAT_STREAMING_SME2(BF1CVTLT, aa64_sme2_or_sve2_f8cvt, do_f8cvt, a,
 TRANS_FEAT_STREAMING_SME2(BF2CVTLT, aa64_sme2_or_sve2_f8cvt, do_f8cvt, a,
                           gen_helper_sve2_bfcvt, true, true)
 
+TRANS_FEAT(FCVTN, aa64_sme2_or_sve2_f8cvt, do_f8cvt,
+           a, gen_helper_sve2_fcvtn_bh, false, false)
 TRANS_FEAT(BFCVTN, aa64_sme2_or_sve2_f8cvt, do_f8cvt,
            a, gen_helper_sve2_bfcvtn_bh, false, false)
 
diff --git a/target/arm/tcg/sve.decode b/target/arm/tcg/sve.decode
index b6ef8ed8de..806953bc35 100644
--- a/target/arm/tcg/sve.decode
+++ b/target/arm/tcg/sve.decode
@@ -1101,6 +1101,7 @@ BF2CVT          01100101 00 001 000 001111 ..... .....          @rd_rn_e0
 BF1CVTLT        01100101 00 001 001 001110 ..... .....          @rd_rn_e0
 BF2CVTLT        01100101 00 001 001 001111 ..... .....          @rd_rn_e0
 
+FCVTN           01100101 00 001 010 001100 ....0 .....          @rd_rnx2 esz=1
 BFCVTN          01100101 00 001 010 001110 ....0 .....          @rd_rnx2 esz=1
 
 ### SVE FP Compare with Zero Group
-- 
2.43.0


