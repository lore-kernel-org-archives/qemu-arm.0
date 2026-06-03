Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3013DCD6E6B
	for <qemu-arm@archiver.kernel.org>; Wed,  3 Jun 2026 03:29:34 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wUcIF-0006rA-0D; Tue, 02 Jun 2026 23:29:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wUcI2-0006fp-RC
 for qemu-arm@nongnu.org; Tue, 02 Jun 2026 23:29:10 -0400
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wUcI0-0003dQ-Ac
 for qemu-arm@nongnu.org; Tue, 02 Jun 2026 23:29:10 -0400
Received: by mail-pg1-x52f.google.com with SMTP id
 41be03b00d2f7-c8583b8fd89so2535471a12.0
 for <qemu-arm@nongnu.org>; Tue, 02 Jun 2026 20:29:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1780457347; x=1781062147; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XREooIk8/Ytryetxg3cSydG2ExCCSz7Qnq/NqYJ+6FE=;
 b=KwW1ISu5YFtpbPeFiQyeXsFcQRXZqXJDWM5uLQBr/SrvUAb45JtbIK75w8xGClxIh+
 9J1m/pCBGSL9rFwwoMcywDB9vj7irPl1X5zydn4e5sAUrtW9L5QKzr+X+ijI+m7rJ28y
 sonyUD2CpdoyQLebc9SeTrwYUtR0v1L7O/0GN1ngdxuL6pK57bctn3yx0qSVwkwsedZy
 pLDj4vLj4G3/IxEeXt9rgwXukj7Q1B0T3t9vni1k1/UlLXuvD7ksZcxDdVcwA7NorisJ
 NGzDDRsvVtqrlwDRwJWsdWPAhed87Mn584bqRzmfh3Opago5bbxIro+f6F0b4R7k6AdQ
 zENQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780457347; x=1781062147;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=XREooIk8/Ytryetxg3cSydG2ExCCSz7Qnq/NqYJ+6FE=;
 b=ht1EB/Z2x027aZ0ZVn2wzi9/iB++Uh8tmTc65yh+jkgNy0+4yfhahpFPv+QoUDcgaC
 xOhkDyN//GjXIZeJ3un/AAULQHTqhOkesOwphZPk+GMVGToOoGalJJkIRPCMlwK5k0Zf
 A9BfiihrQoqgEpCJ4b2McWcOUQ1cJm7ME/YmthMhXuagh0IEDbJkm6ozC06Gd1w0m3oX
 A6eZDEPXXBxS8GJv7jgJgoVmsVZDOfQHcmUiLYIG7LRYY3W447WIi/HkUO7zzx9Xjxya
 4op/IqG920lIQ7IBGQRmM492adX5dO3tgvlRa736j/cU7yKIZvNijyU2LFT3JnBwk+pm
 NPHw==
X-Gm-Message-State: AOJu0YwXfDI9LtL4oBtWgPu0L8EHCcQ7AWSu9cvW3gbzlYioaxpXSfvy
 uJyMytX9nCisB/4HoSxg9MXxdqV8JkRrbM7o8vVd2JbmKwwgiuiCZsMEr+h5dJl0LbA=
X-Gm-Gg: Acq92OGHEpjl3NLA/nuh3exjjDqp2RedHUA5fl3GQ9RdGNgUPoSsPuunqOClZvzDRxV
 2l5RQ1mhj8EzQbO2PYNXnjbZ/wlUv43eFCrwW3aKwT2spVGgQZdclfk6LxYVXj6jEWXd3VOHALk
 1x+79l7u0TbG6Kg4SJ54TLTN7mE2V/vTehubXRpk66FljcENtNnYQooUdGXpTQszemYYlDfVH2L
 zkydVH7HyMfV6HNNeNCeZ6PkTD2SUb54nht4ZIwKHtfcZGD5xXAo7BQFguB3tBufW5/rpl9V1fc
 EDcEMMaXi6wxJK4VBp3OjSBSRfJwIvsmMnrpY349r+XVo8kkLRc0aMYdpNyImyaoqY45gdKLlaf
 uC5K+VlAKWPKydSoYfgndV1qLhs9NFYo3rh6KxvUlfkknEBeTxpRsb9FKZjeeiOQ6Jt6Z4OaivX
 srrAXzAjb5vCASh+xxAerHQXSqZWqHQ68Z4i0dCCU=
X-Received: by 2002:a05:6a00:bd84:b0:837:db4e:a35d with SMTP id
 d2e1a72fcca58-84284e8e33amr1652325b3a.23.1780457346807; 
 Tue, 02 Jun 2026 20:29:06 -0700 (PDT)
Received: from stoup.. ([71.212.142.33]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-8428222263dsm1477831b3a.2.2026.06.02.20.29.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jun 2026 20:29:06 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v9 15/45] target/arm: Implement FCVTN (16- to 8-bit fp) for
 AdvSIMD
Date: Tue,  2 Jun 2026 20:28:24 -0700
Message-ID: <20260603032855.106930-16-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260603032855.106930-1-richard.henderson@linaro.org>
References: <20260603032855.106930-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52f.google.com
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
 target/arm/tcg/helper-fp8-defs.h |  2 ++
 target/arm/tcg/fp8_helper.c      | 37 ++++++++++++++++++++++++++++++++
 target/arm/tcg/translate-a64.c   | 15 +++++++++++++
 target/arm/tcg/a64.decode        |  2 ++
 4 files changed, 56 insertions(+)

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
index ffeaf02f97..8e7982a888 100644
--- a/target/arm/tcg/fp8_helper.c
+++ b/target/arm/tcg/fp8_helper.c
@@ -180,6 +180,13 @@ static uint8_t fcvt_b16_to_fp8(bfloat16 x, fcvt_fp8_output_fn *f8fmt,
     return f8fmt(&p, scale, saturate, s);
 }
 
+static uint8_t fcvt_f16_to_fp8(float16 x, fcvt_fp8_output_fn *f8fmt,
+                               int scale, bool saturate, float_status *s)
+{
+    FloatParts64 p = float16_unpack_canonical(x, s);
+    return f8fmt(&p, scale, saturate, s);
+}
+
 void HELPER(advsimd_bfcvtl)(void *vd, void *vn, CPUARMState *env, uint32_t desc)
 {
     FP8Context ctx = fp8_src_start(env, desc, 0x3f);
@@ -369,3 +376,33 @@ void HELPER(sve2_bfcvtn_bh)(void *vd, void *vn, CPUARMState *env, uint32_t desc)
 
     fp8_cvt_finish(env, &ctx);
 }
+
+void HELPER(gvec_fcvt_bh)(void *vd, void *vn, void *vm,
+                          CPUARMState *env, uint32_t desc)
+{
+    FP8Context ctx = fp8_dst_start(env, desc, true);
+    fcvt_fp8_output_fn *output_fmt = fcvt_fp8_output_fmt[ctx.f8fmt];
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
+    for (size_t i = 0; i < nelem; ++i) {
+        d[H1(i)] = fcvt_f16_to_fp8(n[H2(i)], output_fmt,
+                                   ctx.scale, osc, &ctx.stat);
+    }
+    for (size_t i = 0; i < nelem; ++i) {
+        d[H1(i) + nelem] = fcvt_f16_to_fp8(m[H2(i)], output_fmt,
+                                           ctx.scale, osc, &ctx.stat);
+    }
+
+    fp8_cvt_finish(env, &ctx);
+    clear_tail(vd, oprsz, simd_maxsz(desc));
+}
diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index 5266bbc413..9415419f19 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -6605,6 +6605,21 @@ static gen_helper_gvec_3_ptr * const f_vector_fscale[3] = {
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
index 3c806259f9..b08895d917 100644
--- a/target/arm/tcg/a64.decode
+++ b/target/arm/tcg/a64.decode
@@ -1212,6 +1212,8 @@ FAMIN           0.10 1110 1.1 ..... 11011 1 ..... ..... @qrrr_sd
 FSCALE          0.10 1110 110 ..... 00111 1 ..... ..... @qrrr_h
 FSCALE          0.10 1110 1.1 ..... 11111 1 ..... ..... @qrrr_sd
 
+FCVTN_bh        0.00 1110 010 ..... 11110 1 ..... ..... @qrrr_h
+
 ### Advanced SIMD scalar x indexed element
 
 FMUL_si         0101 1111 00 .. .... 1001 . 0 ..... .....   @rrx_h
-- 
2.43.0


