Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D795CD8CB2
	for <qemu-arm@archiver.kernel.org>; Tue,  9 Jun 2026 19:26:44 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wX25a-0006Qj-Ll; Tue, 09 Jun 2026 15:26:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wX21k-0003VP-K5
 for qemu-arm@nongnu.org; Tue, 09 Jun 2026 15:22:26 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wX21e-000428-78
 for qemu-arm@nongnu.org; Tue, 09 Jun 2026 15:22:18 -0400
Received: by mail-pl1-x630.google.com with SMTP id
 d9443c01a7336-2c0c2c7e0c5so40495885ad.1
 for <qemu-arm@nongnu.org>; Tue, 09 Jun 2026 12:21:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1781032877; x=1781637677; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=giMwesWh9NCdYz1zhq/Gz+wrqIEKpyXE05tOlN6Ru/Y=;
 b=wRsCGhgjkrwKFFyRndqcnEB/dO3ek1AFp59jRUHpaTLJf+9sCqQQxf9sk942DAFlIn
 Thz6ADDjgf407leLEM9IdwxoYcWFOVaWtpHlpLz16gGAuDOD1bwYCwysTmpt8sn9jLsG
 SPTg/Fv+guBN8TBPYEsR0TgByUlY2bkDCAMgxY7z/Iy7VNWFJWMRwiq5TfQQRBDpSmJo
 40rJ+SggUX7bcQDSkXQBpNronf/29as8nD4JhnEmc04cGRUVRFIvNh8UnRVl51TsE+2Y
 Oj5yy+EBoJpXj7o1LMnSJQPxMU/WQsZWAU6OCAiiOShgqXSomoeC6Bzf3fjpmo1pCYrt
 jTmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781032877; x=1781637677;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=giMwesWh9NCdYz1zhq/Gz+wrqIEKpyXE05tOlN6Ru/Y=;
 b=oOU+cuTSby5lvpH6AWAH9uFdJUq7pVjIhk3/7I+NjJZQfsOWeTtBxnKp5aLn81yn20
 ebsv+kafnhScfOSAeumJamCAKVx9yf8Y8Diyk1k0TW3iZgYk4tYzf4cd9X3/XyXbHlcs
 KVVpTjhfC6LouC0PxEevu3j0bn+P7+PFbGTzWzn1ss7ZRTbLFzcXIR6xisAXJz4BnIFc
 Ont+XZPiGBhuFDzgwQ9hHf04+HIqpLYlx+O9A1aiAPcezLKxGSSxrOVLQhC+l3eX37Qv
 cqM+08W3QxRamax/DssMvkJMZqCV2Pu3ETCeXJ705ziAmcfmOj/GsFQ98rILqVlKphzv
 4iSg==
X-Gm-Message-State: AOJu0Ywj3BgHOCxg+y8HMnVkp2NIrTHrBo6yM2VfHLNF5iq3v8ewo7DK
 S5Ntvp6quSIKNFoWWkb7210B3zirq0VM9jdwd4lw6xJCitvLtLN4AbAYEr6pTBT1L4Tm2t2n34u
 5W8JNNe4=
X-Gm-Gg: Acq92OE4rGQ5k1hC99Hq8zEtHAGVYKoJBt9FtVdbQMl/Fb4d1zUBArjWOItj1/h0xwt
 Q2psfeWQ8Is04TBjzCan5RAGw4QQ8xBDgsppDEcddC7L593hMb8UgYD+SJ4LKERdq3fr6ZeYC7X
 i+WjkIsGanFgFKiwqcxeOhHHxf4tCx3pKSZIzreoY8YNRxPX5+U2m8vmimPWs754MjPbRv6BJ7U
 +0qD8JHcdD0hnKSqMxpn9RXBK1qrzb4B8AqIuxBFwU0IrVNM5iyknx71ucSfwz3HiyHoBmHmxNg
 LP9JaSqpqS4Nz24wdLNZr7kiz8d7GH7+sbnZNK7e1VGLGxRtRY0hWDvvaL7gMoM3yJM2w6y9sbp
 buJ1WBelV1gMqMV5OeYSqTeT2T51VIU4MTtgGRMYhE+TNOBZJIOaGEiq1BB1Q1e10T/AHdMDNjw
 X5FPKRHZ5cl2XMX4adL18c868oCOO5UM+HDkjZ6Us=
X-Received: by 2002:a17:903:3bc5:b0:2bf:2015:5b94 with SMTP id
 d9443c01a7336-2c2a1bafec0mr53911555ad.3.1781032877110; 
 Tue, 09 Jun 2026 12:21:17 -0700 (PDT)
Received: from stoup.. ([71.212.142.33]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2c164f88473sm240806095ad.25.2026.06.09.12.21.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jun 2026 12:21:16 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v10 08/45] target/arm: Implement BF1CVT, BF1CVTLT, BF2CVT,
 BF2CVTLT for SVE
Date: Tue,  9 Jun 2026 12:20:32 -0700
Message-ID: <20260609192110.752384-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260609192110.752384-1-richard.henderson@linaro.org>
References: <20260609192110.752384-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
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

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu-features.h        |  6 ++++++
 target/arm/tcg/helper-fp8-defs.h |  1 +
 target/arm/tcg/fp8_helper.c      | 16 ++++++++++++++++
 target/arm/tcg/translate-sve.c   | 23 +++++++++++++++++++++++
 target/arm/tcg/sve.decode        |  6 ++++++
 5 files changed, 52 insertions(+)

diff --git a/target/arm/cpu-features.h b/target/arm/cpu-features.h
index 38a695ded7..70649fe894 100644
--- a/target/arm/cpu-features.h
+++ b/target/arm/cpu-features.h
@@ -1653,6 +1653,12 @@ isar_feature_aa64_sme2_or_sve2_faminmax(const ARMISARegisters *id)
     return isar_feature_aa64_sme2_or_sve2(id) && isar_feature_aa64_faminmax(id);
 }
 
+static inline bool
+isar_feature_aa64_sme2_or_sve2_f8cvt(const ARMISARegisters *id)
+{
+    return isar_feature_aa64_sme2_or_sve2(id) && isar_feature_aa64_f8cvt(id);
+}
+
 /*
  * Feature tests for "does this exist in either 32-bit or 64-bit?"
  */
diff --git a/target/arm/tcg/helper-fp8-defs.h b/target/arm/tcg/helper-fp8-defs.h
index 0caaf63749..18ff483bb0 100644
--- a/target/arm/tcg/helper-fp8-defs.h
+++ b/target/arm/tcg/helper-fp8-defs.h
@@ -4,3 +4,4 @@
  */
 
 DEF_HELPER_FLAGS_4(advsimd_bfcvtl, TCG_CALL_NO_RWG, void, ptr, ptr, env, i32)
+DEF_HELPER_FLAGS_4(sve2_bfcvt, TCG_CALL_NO_RWG, void, ptr, ptr, env, i32)
diff --git a/target/arm/tcg/fp8_helper.c b/target/arm/tcg/fp8_helper.c
index bb3e8dae5f..c62fb2ffd6 100644
--- a/target/arm/tcg/fp8_helper.c
+++ b/target/arm/tcg/fp8_helper.c
@@ -122,3 +122,19 @@ void HELPER(advsimd_bfcvtl)(void *vd, void *vn, CPUARMState *env, uint32_t desc)
     fp8_cvt_finish(env, &ctx);
     clear_tail(vd, 16, simd_maxsz(desc));
 }
+
+void HELPER(sve2_bfcvt)(void *vd, void *vn, CPUARMState *env, uint32_t desc)
+{
+    FP8Context ctx = fp8_src_start(env, desc, 0x3f);
+    fp8_input_fn *input_fmt = fp8_input_fmt[ctx.f8fmt];
+    uint8_t *n = vn;
+    uint16_t *d = vd;
+    size_t nelem = simd_oprsz(desc) / 2;
+
+    for (size_t i = 0; i < nelem; ++i) {
+        d[H2(i)] = fcvt_fp8_to_b16(n[H1(2 * i + ctx.high)],
+                                   input_fmt, ctx.scale, &ctx.stat);
+    }
+
+    fp8_cvt_finish(env, &ctx);
+}
diff --git a/target/arm/tcg/translate-sve.c b/target/arm/tcg/translate-sve.c
index 997d6b0451..718a21de70 100644
--- a/target/arm/tcg/translate-sve.c
+++ b/target/arm/tcg/translate-sve.c
@@ -21,6 +21,7 @@
 #include "cpu.h"
 #include "helper-sme.h"
 #include "helper-sve.h"
+#include "helper-fp8.h"
 #include "translate.h"
 #include "translate-a64.h"
 #include "tcg/tcg-op.h"
@@ -4068,6 +4069,28 @@ TRANS_FEAT(FRSQRTE, aa64_sme_or_sve, gen_gvec_fpst_ah_arg_zz,
            s->fpcr_ah && dc_isar_feature(aa64_rpres, s) ?
            frsqrte_rpres_fns[a->esz] : frsqrte_fns[a->esz], a, 0)
 
+static bool do_f8cvt(DisasContext *s, arg_rr_esz *a,
+                     gen_helper_gvec_2_ptr *fn, bool issrc2, bool isodd)
+{
+    if (fpmr_access_check(s) && sve_access_check(s)) {
+        unsigned vsz = vec_full_reg_size(s);
+        tcg_gen_gvec_2_ptr(vec_full_reg_offset(s, a->rd),
+                           vec_full_reg_offset(s, a->rn),
+                           tcg_env, vsz, vsz,
+                           issrc2 | (isodd << 1) | (FPST_A64 << 2), fn);
+    }
+    return true;
+}
+
+TRANS_FEAT_STREAMING_IF(BF1CVT, aa64_sme2_or_sve2_f8cvt, aa64_sme2,
+                        do_f8cvt, a, gen_helper_sve2_bfcvt, false, false)
+TRANS_FEAT_STREAMING_IF(BF2CVT, aa64_sme2_or_sve2_f8cvt, aa64_sme2,
+                        do_f8cvt, a, gen_helper_sve2_bfcvt, true, false)
+TRANS_FEAT_STREAMING_IF(BF1CVTLT, aa64_sme2_or_sve2_f8cvt, aa64_sme2,
+                        do_f8cvt, a, gen_helper_sve2_bfcvt, false, true)
+TRANS_FEAT_STREAMING_IF(BF2CVTLT, aa64_sme2_or_sve2_f8cvt, aa64_sme2,
+                        do_f8cvt, a, gen_helper_sve2_bfcvt, true, true)
+
 /*
  *** SVE Floating Point Compare with Zero Group
  */
diff --git a/target/arm/tcg/sve.decode b/target/arm/tcg/sve.decode
index 078a085a79..e7984fa8e0 100644
--- a/target/arm/tcg/sve.decode
+++ b/target/arm/tcg/sve.decode
@@ -108,6 +108,7 @@
 # Two operand
 @pd_pn          ........ esz:2 .. .... ....... rn:4 . rd:4      &rr_esz
 @rd_rn          ........ esz:2 ...... ...... rn:5 rd:5          &rr_esz
+@rd_rn_e0       ........ .. ...... ...... rn:5 rd:5             &rr_esz esz=0
 @rd_rnx2        ........ ... ..... ...... ..... rd:5            &rr_esz rn=%rn_ax2
 
 # Two operand with governing predicate, flags setting
@@ -1090,6 +1091,11 @@ FMINQV          01100100 .. 010 111 101 ... ..... .....         @rd_pg_rn
 FRECPE          01100101 .. 001 110 001100 ..... .....          @rd_rn
 FRSQRTE         01100101 .. 001 111 001100 ..... .....          @rd_rn
 
+BF1CVT          01100101 00 001 000 001110 ..... .....          @rd_rn_e0
+BF2CVT          01100101 00 001 000 001111 ..... .....          @rd_rn_e0
+BF1CVTLT        01100101 00 001 001 001110 ..... .....          @rd_rn_e0
+BF2CVTLT        01100101 00 001 001 001111 ..... .....          @rd_rn_e0
+
 ### SVE FP Compare with Zero Group
 
 FCMGE_ppz0      01100101 .. 0100 00 001 ... ..... 0 ....        @pd_pg_rn
-- 
2.43.0


