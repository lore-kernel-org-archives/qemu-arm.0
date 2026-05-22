Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92E8DCD4F3D
	for <qemu-arm@archiver.kernel.org>; Fri, 22 May 2026 22:08:10 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wQY08-0003po-JB; Fri, 22 May 2026 18:05:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wQXy9-0007q6-Tl
 for qemu-arm@nongnu.org; Fri, 22 May 2026 18:03:55 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wQXy2-0008Nx-AU
 for qemu-arm@nongnu.org; Fri, 22 May 2026 18:03:46 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 98e67ed59e1d1-366330b6751so6133501a91.1
 for <qemu-arm@nongnu.org>; Fri, 22 May 2026 15:03:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1779487419; x=1780092219; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mZG6EW6/GfRBE1GtxZh7D+KSpEH9mqbRD1NNXwi1658=;
 b=g8KPw9Tt7ZkWYGjysH+8njx+ByK6cfq11jxBKm2ZjIX4bsnkg8qEaPKPui7oez4lau
 utE1oOFQ6vxpwqp/mPUzL1X60YHuHGfxeVgQK1j2RN8mRLR5k5Ldx34bdbBh5DMzGfXr
 jIE16jabYeVuvh1FYcDOiuYvCU7TdB7Ve5TTh6b+QNHPt6C0OTBd2diN5yJlV2gbWP/2
 DwNrsDweY9rDgH7IAwGBmsGy9rGr509UBY9S0dYzsdIQD8OSy8NObsK8LKYZ7Dw82pP8
 uzujsAVj0h30ROar1JS0WZi0uBnsS8efSuwBYckfi3rNSrjNY1prwLp0gcZNrCFruocx
 yGtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779487419; x=1780092219;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=mZG6EW6/GfRBE1GtxZh7D+KSpEH9mqbRD1NNXwi1658=;
 b=Mj6DJl9D1Dg6BazllifKcX1ybQ3m8YTvrV9k+wCWTQau75mHiqppiR7IjVa73IyMaH
 ZyVuIjHVCIFm6YFcufJ/L21bNvcPiv9Fz90BWiJkTh0QxCR3cMS/PE1iAi/mS7sW3VYO
 TZuwHqz543COp+tqEkITvjQ4gft7i4uq/bIW7uPSPsB48AqdP9LZ5RPWu7MwTFMHXv7K
 a2dRaPdqxLJMgbWBHiCHfVMf+KHPc7c+68/HlUggsllYzi2Fxp7s2nGgjKKgDUVOGfmG
 QNPGDMWJUgl82gGpaAxzPs4u7qhkxMDbta0FIqLi5WJNLSOH695ui0RcTozcUiP64Jms
 iQNw==
X-Gm-Message-State: AOJu0YwByttyFL+irmqO/dw243BJaRZ9XGNLQSdxL33fJTfib6Dm0hYE
 X6lqUnaoUwRdHrsbUwJltalPCJfI6en+NWI+2oHcNEcrRrLEjr+QIQ3RJsmdkH0SiGOrZ/XzVo6
 zeJK9
X-Gm-Gg: Acq92OGChFjM2Rv+ukOymgehnoytYgwf+K1A5RqAH7Zcscz6QDIXeDjBqg9YXQWYTa0
 xmitgTNaSzw2Zay2heEYwjbpLFMPvnAFQcV4whJhN3cwpFuLJRelNaU3ho8rxhD+8zjobP5kHQJ
 9cplKgVfmcY4BEvkiBaAO07JicA6xw85eq+B7nM9U8ZXkF4LrAEpkD/ZXGGOIz5IQ74twpKDanL
 GjnxMt9U9qZQG7wht0UjnyuzR4FHqfelWkIPEJ92uCB2mZ7E/NYs3lV9JRay3QhE7JcVMh5ysWq
 sqO8mWqNvqaUl1B31PQYwbkkk2Z48wfXGEfAet6ld7GcITDb0mDc7I6MS6gCbkbA72eZ3N3NULG
 R2MmKMMRzY40bXtn9beeOtb1l6K7Kb08718hnTzA2JxHdK9g3yaTXGHLh3lvLUZeHDgflMDaWke
 9ROXyZTpsj7HtRuJGuZJMG34ydtyYK
X-Received: by 2002:a17:90a:d646:b0:369:1dcf:4a56 with SMTP id
 98e67ed59e1d1-36a678045c2mr5742624a91.21.1779487419026; 
 Fri, 22 May 2026 15:03:39 -0700 (PDT)
Received: from stoup.. ([50.78.183.177]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-36a6772f486sm1726789a91.2.2026.05.22.15.03.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 May 2026 15:03:38 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v7 32/64] target/arm: Implement F1CVT, F1CVTL, F2CVT,
 F2CVTL for SME
Date: Fri, 22 May 2026 15:02:34 -0700
Message-ID: <20260522220306.235200-33-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260522220306.235200-1-richard.henderson@linaro.org>
References: <20260522220306.235200-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
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
 target/arm/tcg/helper-fp8-defs.h |  2 ++
 target/arm/tcg/fp8_helper.c      | 47 ++++++++++++++++++++++++++++++++
 target/arm/tcg/translate-sme.c   |  5 ++++
 target/arm/tcg/sme.decode        |  5 ++++
 4 files changed, 59 insertions(+)

diff --git a/target/arm/tcg/helper-fp8-defs.h b/target/arm/tcg/helper-fp8-defs.h
index 3021dafd44..b5dc2b7064 100644
--- a/target/arm/tcg/helper-fp8-defs.h
+++ b/target/arm/tcg/helper-fp8-defs.h
@@ -10,3 +10,5 @@ DEF_HELPER_FLAGS_4(sme2_bfcvtl_hb, TCG_CALL_NO_RWG, void, ptr, ptr, env, i32)
 
 DEF_HELPER_FLAGS_4(advsimd_fcvtl_hb, TCG_CALL_NO_RWG, void, ptr, ptr, env, i32)
 DEF_HELPER_FLAGS_4(sve2_fcvt_hb, TCG_CALL_NO_RWG, void, ptr, ptr, env, i32)
+DEF_HELPER_FLAGS_4(sme2_fcvt_hb, TCG_CALL_NO_RWG, void, ptr, ptr, env, i32)
+DEF_HELPER_FLAGS_4(sme2_fcvtl_hb, TCG_CALL_NO_RWG, void, ptr, ptr, env, i32)
diff --git a/target/arm/tcg/fp8_helper.c b/target/arm/tcg/fp8_helper.c
index 75c89203fe..e2330177ec 100644
--- a/target/arm/tcg/fp8_helper.c
+++ b/target/arm/tcg/fp8_helper.c
@@ -211,6 +211,33 @@ void HELPER(sme2_bfcvt_hb)(void *vd, void *vn, CPUARMState *env, uint32_t desc)
     fp8_cvt_finish(env, &ctx);
 }
 
+void HELPER(sme2_fcvt_hb)(void *vd, void *vn, CPUARMState *env, uint32_t desc)
+{
+    FP8Context ctx = fp8_src_start(env, desc, 0xf);
+    fp8_input_fn *input_fmt = fp8_input_fmt[ctx.f8fmt];
+    uint8_t *n = vn;
+    uint16_t *d0 = vd;
+    uint16_t *d1 = vd + sizeof(ARMVectorReg);
+    size_t oprsz = simd_oprsz(desc);
+    size_t nelem = oprsz / 2;
+    ARMVectorReg scratch;
+
+    if (vectors_overlap(vd, 2, vn, 1)) {
+        n = memcpy(&scratch, vn, oprsz);
+    }
+
+    for (size_t i = 0; i < nelem; ++i) {
+        d0[H2(i)] = fcvt_fp8_to_f16(n[H1(i)], input_fmt,
+                                    ctx.scale, &ctx.stat);
+    }
+    for (size_t i = 0; i < nelem; ++i) {
+        d1[H2(i)] = fcvt_fp8_to_f16(n[H1(i + nelem)], input_fmt,
+                                    ctx.scale, &ctx.stat);
+    }
+
+    fp8_cvt_finish(env, &ctx);
+}
+
 void HELPER(sme2_bfcvtl_hb)(void *vd, void *vn, CPUARMState *env, uint32_t desc)
 {
     FP8Context ctx = fp8_src_start(env, desc, 0x3f);
@@ -230,3 +257,23 @@ void HELPER(sme2_bfcvtl_hb)(void *vd, void *vn, CPUARMState *env, uint32_t desc)
 
     fp8_cvt_finish(env, &ctx);
 }
+
+void HELPER(sme2_fcvtl_hb)(void *vd, void *vn, CPUARMState *env, uint32_t desc)
+{
+    FP8Context ctx = fp8_src_start(env, desc, 0xf);
+    fp8_input_fn *input_fmt = fp8_input_fmt[ctx.f8fmt];
+    uint8_t *n = vn;
+    uint16_t *d0 = vd;
+    uint16_t *d1 = vd + sizeof(ARMVectorReg);
+    size_t oprsz = simd_oprsz(desc);
+    size_t nelem = oprsz / 2;
+
+    for (size_t i = 0; i < nelem; ++i) {
+        uint8_t e0 = n[H1(2 * i + 0)];
+        uint8_t e1 = n[H1(2 * i + 1)];
+        d0[H2(i)] = fcvt_fp8_to_f16(e0, input_fmt, ctx.scale, &ctx.stat);
+        d1[H2(i)] = fcvt_fp8_to_f16(e1, input_fmt, ctx.scale, &ctx.stat);
+    }
+
+    fp8_cvt_finish(env, &ctx);
+}
diff --git a/target/arm/tcg/translate-sme.c b/target/arm/tcg/translate-sme.c
index 2841b2b8cb..0cbad3e006 100644
--- a/target/arm/tcg/translate-sme.c
+++ b/target/arm/tcg/translate-sme.c
@@ -1546,6 +1546,11 @@ static bool do_f8cvt(DisasContext *s, arg_zz_n *a,
     return true;
 }
 
+TRANS_FEAT(F1CVT, aa64_sme2_f8cvt, do_f8cvt, a, gen_helper_sme2_fcvt_hb, 0)
+TRANS_FEAT(F2CVT, aa64_sme2_f8cvt, do_f8cvt, a, gen_helper_sme2_fcvt_hb, 1)
+TRANS_FEAT(F1CVTL, aa64_sme2_f8cvt, do_f8cvt, a, gen_helper_sme2_fcvtl_hb, 0)
+TRANS_FEAT(F2CVTL, aa64_sme2_f8cvt, do_f8cvt, a, gen_helper_sme2_fcvtl_hb, 1)
+
 TRANS_FEAT(BF1CVT, aa64_sme2_f8cvt, do_f8cvt, a, gen_helper_sme2_bfcvt_hb, 0)
 TRANS_FEAT(BF2CVT, aa64_sme2_f8cvt, do_f8cvt, a, gen_helper_sme2_bfcvt_hb, 1)
 TRANS_FEAT(BF1CVTL, aa64_sme2_f8cvt, do_f8cvt, a, gen_helper_sme2_bfcvtl_hb, 0)
diff --git a/target/arm/tcg/sme.decode b/target/arm/tcg/sme.decode
index df9586c1a5..d6192eb59d 100644
--- a/target/arm/tcg/sme.decode
+++ b/target/arm/tcg/sme.decode
@@ -853,6 +853,11 @@ UUNPK_4bh       11000001 011 10101 111000 ....0 ...01       @zz_4x2_n1
 UUNPK_4hs       11000001 101 10101 111000 ....0 ...01       @zz_4x2_n1
 UUNPK_4sd       11000001 111 10101 111000 ....0 ...01       @zz_4x2_n1
 
+F1CVT           11000001 001 00110 111000 ..... ....0       @zz_2x1
+F2CVT           11000001 101 00110 111000 ..... ....0       @zz_2x1
+F1CVTL          11000001 001 00110 111000 ..... ....1       @zz_2x1
+F2CVTL          11000001 101 00110 111000 ..... ....1       @zz_2x1
+
 BF1CVT          11000001 011 00110 111000 ..... ....0       @zz_2x1
 BF2CVT          11000001 111 00110 111000 ..... ....0       @zz_2x1
 BF1CVTL         11000001 011 00110 111000 ..... ....1       @zz_2x1
-- 
2.43.0


