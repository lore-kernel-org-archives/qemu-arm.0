Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF6CAFB44A5
	for <qemu-arm@archiver.kernel.org>; Fri, 24 Apr 2026 04:35:32 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wG8DQ-0002Wu-V2; Fri, 24 Apr 2026 00:32:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wG8DO-0002Sc-VA
 for qemu-arm@nongnu.org; Fri, 24 Apr 2026 00:32:31 -0400
Received: from mail-oi1-x22b.google.com ([2607:f8b0:4864:20::22b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wG8DN-0003Yy-7N
 for qemu-arm@nongnu.org; Fri, 24 Apr 2026 00:32:30 -0400
Received: by mail-oi1-x22b.google.com with SMTP id
 5614622812f47-4645dde00a7so5972196b6e.1
 for <qemu-arm@nongnu.org>; Thu, 23 Apr 2026 21:32:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1777005148; x=1777609948; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GJ1VXgG74f8s4Xmso5BQZxSExdCoj+QRYM7tqnseBPw=;
 b=Hjl0gD4kvCkDSXsMMYymGeapzmruk81d3Qigg+yjqLw8+eqcjLXKbzAN4PcJlQgOBR
 UfQm+B3/Ql9kr6Hpob78eI8ofQiFb46BpYXneZedhQVOKqldhyZM7GVtxZK1545D+Uhj
 j2s10rrf4qSHsPi9Qj2jPyZmtPZb2pHs56W1lpF6dloOeFM9fUcRrLix5/4seLAdOeMD
 T42+9SRtii277GRE2SkPODgsPDy7rSJcS2yhvqZHWjlpmKplQ6kN2e9GBanG2EbqhApd
 f/s47O+1h9eTyyeee3DpC7hf9LXJevtwc2yzARSsU2NtixuPJnMifqoOPgq+9iz224wX
 hjXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777005148; x=1777609948;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=GJ1VXgG74f8s4Xmso5BQZxSExdCoj+QRYM7tqnseBPw=;
 b=G5CkUNVoHekQGSJrbVeD5dqjdt3RW4lamCdwLqR9DsYrMMiFbcQjugsCj8Ihtn2ifH
 TPBbAmdDU2SzTVIoucg4dHGHHjfTP0EhC66IRXJnoCGYNdmlCizAJ1v2Dixpg+cpfm2w
 uGKqX1RCnVzdeZGmYOvd+baFcf6G+i+14GPZhSolHDLZSqMu6PVki4okteEqL3eExaTo
 U0jKLGi3qPlTR6/c2/R6lkION0u5Vf3tKMpii7filiqIzS0KFQ/A8PIoDOLWmfkMsPVe
 kntfYGj8fRDVWvRkRtmQ4xVkrYmSLbD27FRpaoglYqJ0Bj0YafWNHrfLhb3k/QHB0axi
 XLqw==
X-Gm-Message-State: AOJu0Yz8ijkbzlh1U71xYFxLUtYZV8NBqL3XCxWzKcBwqAGcK1oY7X1c
 1gFuTnYw1GTr/gwpeLhJ9FM1bBSPelRVW6m4njDrvfoFnDLZtv0NiWCTmsttAhf2EzU=
X-Gm-Gg: AeBDiesPdAItFNPOoXmceJrIZgV56p+boMTCNzTLGsJh0CnKLaTo5ABPCFN8kTHwRVC
 GgrlZGn83Qq9cBDFnBPk2QC5WJ/e/179a4BCtDMLtmjpqqskMB2R12Nw945LnZTfURwyDUol3tJ
 YDDdTLevHZvbp0atgp1luNayegBfq6OAR74tfbMVdFTHvajNxFLzzWv69fuEBTsYVcT1z8tIU5C
 YcQ0+BUXQmGJR0b4LOm5a5OWlnLGoyH54FOGbnsweNYjFfSDZ3h80t7ROI3/QkLsjX+4btW7zSY
 56oJyAr6Xvm+d5FmMJrraust1pB6U/pXcRt9yELNvWrUSa2/pEjy0a28MM3o4jsSThNjdOi+BY9
 JpJczn2gfZxXBMqU8w1DigykYugW9PeEH0rDorZ4NVnCfWOhx7LqE7a6E88CIOJhtOBgSyLRUPC
 9bd0DNBLqKVvOzd8aVQ9vMrZ50lWMAGz+tMFey8+2jhw1QY+RKi7X1FoPbHUc0Xw==
X-Received: by 2002:a05:6870:aa08:b0:41c:af81:2e7f with SMTP id
 586e51a60fabf-42a99a90d08mr16298142fac.20.1777005147841; 
 Thu, 23 Apr 2026 21:32:27 -0700 (PDT)
Received: from stoup.. ([172.58.183.19]) by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-42b9ac54ec5sm18880864fac.13.2026.04.23.21.32.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Apr 2026 21:32:27 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v2 31/40] target/arm: Implement FCVTN (16- to 8-bit fp) for
 AdvSIMD
Date: Fri, 24 Apr 2026 14:30:05 +1000
Message-ID: <20260424043014.46305-32-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260424043014.46305-1-richard.henderson@linaro.org>
References: <20260424043014.46305-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22b;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x22b.google.com
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
 target/arm/tcg/fp8_helper.c      | 48 ++++++++++++++++++++++++++++++++
 target/arm/tcg/translate-a64.c   | 15 ++++++++++
 target/arm/tcg/a64.decode        |  2 ++
 4 files changed, 67 insertions(+)

diff --git a/target/arm/tcg/helper-fp8-defs.h b/target/arm/tcg/helper-fp8-defs.h
index bbc8d69e28..6530d1a6da 100644
--- a/target/arm/tcg/helper-fp8-defs.h
+++ b/target/arm/tcg/helper-fp8-defs.h
@@ -14,3 +14,5 @@ DEF_HELPER_FLAGS_4(sme2_fcvt_hb, TCG_CALL_NO_RWG, void, ptr, ptr, env, i32)
 DEF_HELPER_FLAGS_4(sme2_fcvtl_hb, TCG_CALL_NO_RWG, void, ptr, ptr, env, i32)
 
 DEF_HELPER_FLAGS_4(sve2_bfcvtn_bh, TCG_CALL_NO_RWG, void, ptr, ptr, env, i32)
+
+DEF_HELPER_FLAGS_5(gvec_fcvt_bh, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, env, i32)
diff --git a/target/arm/tcg/fp8_helper.c b/target/arm/tcg/fp8_helper.c
index ad5a2dc64d..6241297269 100644
--- a/target/arm/tcg/fp8_helper.c
+++ b/target/arm/tcg/fp8_helper.c
@@ -432,3 +432,51 @@ void HELPER(sve2_bfcvtn_bh)(void *vd, void *vn, CPUARMState *env, uint32_t desc)
 
     fp8_finish(env, &ctx);
 }
+
+void HELPER(gvec_fcvt_bh)(void *vd, void *vn, void *vm,
+                          CPUARMState *env, uint32_t desc)
+{
+    FP8Context ctx = fp8_dst_start(env, desc);
+    uint16_t *n = vn;
+    uint16_t *m = vm;
+    uint8_t *d = vd;
+    bool osc = FIELD_EX64(env->vfp.fpmr, FPMR, OSC);
+    size_t oprsz = simd_oprsz(desc);
+    size_t nelem = oprsz / 2;
+    ARMVectorReg scratch;
+
+    if (vd == vm) {
+        m = memcpy(&scratch, vm, oprsz);
+    }
+
+    switch (ctx.f8fmt) {
+    case OFP8_E5M2:
+        for (size_t i = 0; i < nelem; ++i) {
+            float16 e = n[H2(i)];
+            d[H1(i)] = float16_to_float8_e5m2(e, ctx.scale, osc, &ctx.stat);
+        }
+        for (size_t i = 0; i < nelem; ++i) {
+            float16 e = m[H2(i)];
+            d[H1(i) + nelem] =
+                float16_to_float8_e5m2(e, ctx.scale, osc, &ctx.stat);
+        }
+        break;
+    case OFP8_E4M3:
+        for (size_t i = 0; i < nelem; ++i) {
+            float16 e = n[H2(i)];
+            d[H1(i)] = float16_to_float8_e4m3(e, ctx.scale, osc, &ctx.stat);
+        }
+        for (size_t i = 0; i < nelem; ++i) {
+            float16 e = m[H2(i)];
+            d[H1(i) + nelem] =
+                float16_to_float8_e4m3(e, ctx.scale, osc, &ctx.stat);
+        }
+        break;
+    default:
+        float8_invalid_output(d, oprsz, &ctx.stat);
+        break;
+    }
+
+    fp8_finish(env, &ctx);
+    clear_tail(vd, oprsz, simd_maxsz(desc));
+}
diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index b3fbc5f193..93c883de88 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -6521,6 +6521,21 @@ static gen_helper_gvec_3_ptr * const f_vector_fscale[3] = {
 };
 TRANS_FEAT(FSCALE, aa64_f8cvt, do_fp3_vector, a, 0, f_vector_fscale)
 
+static bool trans_FCVTN_bh(DisasContext *s, arg_qrrr_e *a)
+{
+    if (!dc_isar_feature(aa64_f8cvt, s)) {
+        return false;
+    }
+    if (fpmr_access_check(s) && fp_access_check(s)) {
+        tcg_gen_gvec_3_ptr(vec_full_reg_offset(s, a->rd),
+                           vec_full_reg_offset(s, a->rn),
+                           vec_full_reg_offset(s, a->rm),
+                           tcg_env, a->q ? 16 : 8, vec_full_reg_size(s),
+                           FPST_A64 << 2, gen_helper_gvec_fcvt_bh);
+    }
+    return true;
+}
+
 static bool do_fmlal(DisasContext *s, arg_qrrr_e *a, bool is_s, bool is_2)
 {
     if (fp_access_check(s)) {
diff --git a/target/arm/tcg/a64.decode b/target/arm/tcg/a64.decode
index 26d31d0a33..71456d44e1 100644
--- a/target/arm/tcg/a64.decode
+++ b/target/arm/tcg/a64.decode
@@ -1201,6 +1201,8 @@ FAMIN           0.10 1110 1.1 ..... 11011 1 ..... ..... @qrrr_sd
 FSCALE          0.10 1110 110 ..... 00111 1 ..... ..... @qrrr_h
 FSCALE          0.10 1110 1.1 ..... 11111 1 ..... ..... @qrrr_sd
 
+FCVTN_bh        0.00 1110 010 ..... 11110 1 ..... ..... @qrrr_h
+
 ### Advanced SIMD scalar x indexed element
 
 FMUL_si         0101 1111 00 .. .... 1001 . 0 ..... .....   @rrx_h
-- 
2.43.0


