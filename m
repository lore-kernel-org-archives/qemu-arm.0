Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A478BC4451C
	for <qemu-arm@archiver.kernel.org>; Tue, 21 Jul 2026 18:52:47 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wmFVn-0001PP-1Q; Tue, 21 Jul 2026 14:48:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wmFUm-00011G-Lq
 for qemu-arm@nongnu.org; Tue, 21 Jul 2026 14:47:15 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wmFUi-0006cA-05
 for qemu-arm@nongnu.org; Tue, 21 Jul 2026 14:47:12 -0400
Received: by mail-pj1-x102b.google.com with SMTP id
 98e67ed59e1d1-38e041ea211so9543763a91.0
 for <qemu-arm@nongnu.org>; Tue, 21 Jul 2026 11:47:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1784659626; x=1785264426; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=spbqFsj4ef0lgeAb1xckcbK6UBZG5gECJFtg+qsB86g=;
 b=UA2xgm7A18tnil/kTX9GS8oyh7PYELjB8uGrT6XYcVRKyzGKvzfjE8sq9VbEqekO1U
 wExvUwg4oCLlJhX07tG/6P6/woSR3F1b7Fwv/Y8+WABTHYRqyPwyR5hDFSCySKMhMxXu
 EiGpLOwZco9XDOXGWY6HTtuVMntMN6/7NDG7ysCV2psm7fatoNQ5Q7soUhxepsFxLlqw
 o8yMqPRrN5Q36+8XcZHkU7H1MttrOSQ9B+LZdQFmdqEzcmOv4t5yovdE2HmJQEDqsZft
 3dq1Ldck7552YaTESl30lfk/7Mv/hEeogBwl/dy7Jb7Wr15OwMjps25zlIElAYjVG9Zg
 45ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784659626; x=1785264426;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=spbqFsj4ef0lgeAb1xckcbK6UBZG5gECJFtg+qsB86g=;
 b=bG1c7zCsf0eeBYKhv8hgScLXPXgBSV+oI8LSQF8i7Ckp4hC4+O7tqOpioxnhQA5eF9
 xG+gNGXZfcnew+V8MPHLT0RAXPW51wcwMxdtyf7SLQ2m/Lr2r7nno3po9UlFE402sjq1
 rkjBavi/xW4mNnrZYWlkXLN2xvaIN0mcMJ3//PWxpT4BglROHvPTw9RmD74LIdaN1MzS
 dHYmtd7J9JkAsMCMsmjXqZKU9kq0DufBSt+wypU0VMnQYZpoGyTfIgC/AW6JXEp+qoVU
 w8MWQdUDS2TG2EgY8iE/5CyRInGuh6+6eQ4vNBqCWb846vx6vq7OfFTYycCw0YKMFnaj
 Azuw==
X-Gm-Message-State: AOJu0YykggYhqe8lbF7Y+iD8r7D4MxcrNxHEEW/7sOz7Gz0qXcSAxPvj
 IoXB8U95VO7j3rR6ovyft8PSsZRJRoUajfHHEjPs6kZ8FErP9vszo4/LEU40bLLFgXngFof8XCq
 vzMwo
X-Gm-Gg: AR+sD12FtH611UZHZ309txD/nm8HQAPiSH5px0+90Qq2+53Y3TY3RIeM6oH5GnS0alJ
 O9ZNCRzLADk+Tc+Bg0akOdpZXFMKJ1q8QUVCKYxm7BEFjlxiz7zyTi0lziJPXKPD9rCg1tf+x99
 pZwAzdZFpCqkGn6rdBEyJ6+8zr16jXhe70UAzEbSQxcuXQmOoUlL5F8xFYfme8b24CCX9EwOrBS
 8Gf+azvqe7mutZZsG+V5vu0LVQKUyfAedTpGpF6gZ06/YevFvqcggarBNGnjFMEUuT5vc48Opbp
 EjBDFjB09XklJ5rbLNjYkkDvkRh5m2zFQf+QTv+gt/Unkm4QgLuwRTLhLlKss7icG2tvFhOH33c
 EnsA+2cMaJEsDF1qngWXZtS02utnvrvvXp5rkIXO+kqD5Z/P+QVdPf0nV4m77GhLPQD27IxgkHv
 QA7pRJMRE=
X-Received: by 2002:a17:90b:568c:b0:38e:a32e:5442 with SMTP id
 98e67ed59e1d1-38ea32e57efmr804048a91.31.1784659626071; 
 Tue, 21 Jul 2026 11:47:06 -0700 (PDT)
Received: from stoup.. ([32.140.233.50]) by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-13ce29e340esm41108094c88.5.2026.07.21.11.47.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jul 2026 11:47:05 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 05/20] target/arm: Split decode of BFloat SVE FADD, FSUB, FMUL,
 FMIN*, FMAX*
Date: Tue, 21 Jul 2026 11:46:41 -0700
Message-ID: <20260721184656.530230-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260721184656.530230-1-richard.henderson@linaro.org>
References: <20260721184656.530230-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
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

Split decode so that feature detection can be handled
external to gen_gvec_fpst_arg_zpzz

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/translate-sve.c | 32 ++++++++++++++++++----------
 target/arm/tcg/sve.decode      | 38 +++++++++++++++++++++++++++-------
 2 files changed, 52 insertions(+), 18 deletions(-)

diff --git a/target/arm/tcg/translate-sve.c b/target/arm/tcg/translate-sve.c
index 62610e0394..919ff1b217 100644
--- a/target/arm/tcg/translate-sve.c
+++ b/target/arm/tcg/translate-sve.c
@@ -412,10 +412,6 @@ static bool gen_gvec_fpst_zzzp(DisasContext *s, gen_helper_gvec_4_ptr *fn,
 static bool gen_gvec_fpst_arg_zpzz(DisasContext *s, gen_helper_gvec_4_ptr *fn,
                                    arg_rprr_esz *a)
 {
-    /* These insns use MO_8 to encode BFloat16. */
-    if (a->esz == MO_8 && !dc_isar_feature(aa64_sve_b16b16, s)) {
-        return false;
-    }
     return gen_gvec_fpst_zzzp(s, fn, a->rd, a->rn, a->rm, a->pg, 0,
                               a->esz == MO_16 ? FPST_A64_F16 : FPST_A64);
 }
@@ -4416,65 +4412,79 @@ TRANS_FEAT_NONSTREAMING(FTSMUL, aa64_sve, gen_gvec_fpst_arg_zzz,
  */
 
 static gen_helper_gvec_4_ptr * const sve_fadd_zpzz_fns[4] = {
-    gen_helper_sve_fadd_b16,
+    NULL,
     gen_helper_sve_fadd_h,
     gen_helper_sve_fadd_s,
     gen_helper_sve_fadd_d
 };
+TRANS_FEAT(BFADD_zpzz, aa64_sve_b16b16, gen_gvec_fpst_arg_zpzz,
+           gen_helper_sve_fadd_b16, a)
 TRANS_FEAT(FADD_zpzz, aa64_sme_or_sve, gen_gvec_fpst_arg_zpzz,
            sve_fadd_zpzz_fns[a->esz], a)
 
 static gen_helper_gvec_4_ptr * const sve_fsub_zpzz_fns[4] = {
-    gen_helper_sve_fsub_b16,
+    NULL,
     gen_helper_sve_fsub_h,
     gen_helper_sve_fsub_s,
     gen_helper_sve_fsub_d
 };
+TRANS_FEAT(BFSUB_zpzz, aa64_sve_b16b16, gen_gvec_fpst_arg_zpzz,
+           gen_helper_sve_fsub_b16, a)
 TRANS_FEAT(FSUB_zpzz, aa64_sme_or_sve, gen_gvec_fpst_arg_zpzz,
            sve_fsub_zpzz_fns[a->esz], a)
 
 static gen_helper_gvec_4_ptr * const sve_fmul_zpzz_fns[4] = {
-    gen_helper_sve_fmul_b16,
+    NULL,
     gen_helper_sve_fmul_h,
     gen_helper_sve_fmul_s,
     gen_helper_sve_fmul_d
 };
+TRANS_FEAT(BFMUL_zpzz, aa64_sve_b16b16, gen_gvec_fpst_arg_zpzz,
+           gen_helper_sve_fmul_b16, a)
 TRANS_FEAT(FMUL_zpzz, aa64_sme_or_sve, gen_gvec_fpst_arg_zpzz,
            sve_fmul_zpzz_fns[a->esz], a)
 
 static gen_helper_gvec_4_ptr * const sve_fmin_fns[4][2] = {
-    { gen_helper_sve_fmin_b16, gen_helper_sve_ah_fmin_b16 },
+    { NULL, NULL },
     { gen_helper_sve_fmin_h, gen_helper_sve_ah_fmin_h },
     { gen_helper_sve_fmin_s, gen_helper_sve_ah_fmin_s },
     { gen_helper_sve_fmin_d, gen_helper_sve_ah_fmin_d },
 };
+TRANS_FEAT(BFMIN_zpzz, aa64_sve_b16b16, gen_gvec_fpst_arg_zpzz,
+           s->fpcr_ah ? gen_helper_sve_ah_fmin_b16 : gen_helper_sve_fmin_b16, a)
 TRANS_FEAT(FMIN_zpzz, aa64_sme_or_sve, gen_gvec_fpst_arg_zpzz,
            sve_fmin_fns[a->esz][s->fpcr_ah], a)
 
 static gen_helper_gvec_4_ptr * const sve_fmax_fns[4][2] = {
-    { gen_helper_sve_fmax_b16, gen_helper_sve_ah_fmax_b16 },
+    { NULL, NULL },
     { gen_helper_sve_fmax_h, gen_helper_sve_ah_fmax_h },
     { gen_helper_sve_fmax_s, gen_helper_sve_ah_fmax_s },
     { gen_helper_sve_fmax_d, gen_helper_sve_ah_fmax_d },
 };
+TRANS_FEAT(BFMAX_zpzz, aa64_sve_b16b16, gen_gvec_fpst_arg_zpzz,
+           s->fpcr_ah ? gen_helper_sve_ah_fmax_b16 : gen_helper_sve_fmax_b16, a)
 TRANS_FEAT(FMAX_zpzz, aa64_sme_or_sve, gen_gvec_fpst_arg_zpzz,
            sve_fmax_fns[a->esz][s->fpcr_ah], a)
 
 static gen_helper_gvec_4_ptr * const sve_fmaxnum_fns[4] = {
-    gen_helper_sve_fmaxnum_b16,
+    NULL,
     gen_helper_sve_fmaxnum_h,
     gen_helper_sve_fmaxnum_s,
     gen_helper_sve_fmaxnum_d
 };
+TRANS_FEAT(BFMAXNM_zpzz, aa64_sve_b16b16, gen_gvec_fpst_arg_zpzz,
+           gen_helper_sve_fmaxnum_b16, a)
 TRANS_FEAT(FMAXNM_zpzz, aa64_sme_or_sve, gen_gvec_fpst_arg_zpzz,
            sve_fmaxnum_fns[a->esz], a)
 
 static gen_helper_gvec_4_ptr * const sve_fminnum_fns[4] = {
-    gen_helper_sve_fminnum_b16,
+    NULL,
     gen_helper_sve_fminnum_h,
     gen_helper_sve_fminnum_s,
     gen_helper_sve_fminnum_d
 };
+TRANS_FEAT(BFMINNM_zpzz, aa64_sve_b16b16, gen_gvec_fpst_arg_zpzz,
+           gen_helper_sve_fminnum_b16, a)
 TRANS_FEAT(FMINNM_zpzz, aa64_sme_or_sve, gen_gvec_fpst_arg_zpzz,
            sve_fminnum_fns[a->esz], a)
 
diff --git a/target/arm/tcg/sve.decode b/target/arm/tcg/sve.decode
index bdc2b7f0c0..07dac681ac 100644
--- a/target/arm/tcg/sve.decode
+++ b/target/arm/tcg/sve.decode
@@ -159,6 +159,9 @@
 @rd_pg4_rn_rm   ........ esz:2 . rm:5  .. pg:4  rn:5 rd:5       &rprr_esz
 @pd_pg_rn_rm    ........ esz:2 . rm:5 ... pg:3 rn:5 . rd:4      &rprr_esz
 
+@rdn_pg_rm_e0   ........ .. ... ... ... pg:3 rm:5 rd:5 \
+                &rprr_esz esz=0 rn=%reg_movprfx
+
 # Three register operand, with governing predicate, vector element size
 @rda_pg_rn_rm   ........ esz:2 . rm:5  ... pg:3 rn:5 rd:5 \
                 &rprrr_esz ra=%reg_movprfx
@@ -1163,14 +1166,35 @@ FRSQRTS         01100101 .. 0 ..... 000 111 ..... .....         @rd_rn_rm
 ### SVE FP Arithmetic Predicated Group
 
 # SVE floating-point arithmetic (predicated)
-FADD_zpzz       01100101 .. 00 0000 100 ... ..... .....    @rdn_pg_rm
-FSUB_zpzz       01100101 .. 00 0001 100 ... ..... .....    @rdn_pg_rm
-FMUL_zpzz       01100101 .. 00 0010 100 ... ..... .....    @rdn_pg_rm
+{
+  BFADD_zpzz    01100101 00 00 0000 100 ... ..... .....    @rdn_pg_rm_e0
+  FADD_zpzz     01100101 .. 00 0000 100 ... ..... .....    @rdn_pg_rm
+}
+{
+  BFSUB_zpzz    01100101 00 00 0001 100 ... ..... .....    @rdn_pg_rm_e0
+  FSUB_zpzz     01100101 .. 00 0001 100 ... ..... .....    @rdn_pg_rm
+}
+{
+  BFMUL_zpzz    01100101 00 00 0010 100 ... ..... .....    @rdn_pg_rm_e0
+  FMUL_zpzz     01100101 .. 00 0010 100 ... ..... .....    @rdn_pg_rm
+}
 FSUB_zpzz       01100101 .. 00 0011 100 ... ..... .....    @rdm_pg_rn # FSUBR
-FMAXNM_zpzz     01100101 .. 00 0100 100 ... ..... .....    @rdn_pg_rm
-FMINNM_zpzz     01100101 .. 00 0101 100 ... ..... .....    @rdn_pg_rm
-FMAX_zpzz       01100101 .. 00 0110 100 ... ..... .....    @rdn_pg_rm
-FMIN_zpzz       01100101 .. 00 0111 100 ... ..... .....    @rdn_pg_rm
+{
+  BFMAXNM_zpzz  01100101 00 00 0100 100 ... ..... .....    @rdn_pg_rm_e0
+  FMAXNM_zpzz   01100101 .. 00 0100 100 ... ..... .....    @rdn_pg_rm
+}
+{
+  BFMINNM_zpzz  01100101 00 00 0101 100 ... ..... .....    @rdn_pg_rm_e0
+  FMINNM_zpzz   01100101 .. 00 0101 100 ... ..... .....    @rdn_pg_rm
+}
+{
+  BFMAX_zpzz    01100101 00 00 0110 100 ... ..... .....    @rdn_pg_rm_e0
+  FMAX_zpzz     01100101 .. 00 0110 100 ... ..... .....    @rdn_pg_rm
+}
+{
+  BFMIN_zpzz    01100101 00 00 0111 100 ... ..... .....    @rdn_pg_rm_e0
+  FMIN_zpzz     01100101 .. 00 0111 100 ... ..... .....    @rdn_pg_rm
+}
 FABD            01100101 .. 00 1000 100 ... ..... .....    @rdn_pg_rm
 FSCALE          01100101 .. 00 1001 100 ... ..... .....    @rdn_pg_rm
 FMULX           01100101 .. 00 1010 100 ... ..... .....    @rdn_pg_rm
-- 
2.43.0


