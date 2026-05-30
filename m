Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3098CD4F54
	for <qemu-arm@archiver.kernel.org>; Sat, 30 May 2026 23:15:31 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wTSrP-0000Eo-EA; Sat, 30 May 2026 19:12:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wTSrN-0000Bt-PG
 for qemu-arm@nongnu.org; Sat, 30 May 2026 19:12:53 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wTSrL-0007Xf-Rz
 for qemu-arm@nongnu.org; Sat, 30 May 2026 19:12:53 -0400
Received: by mail-pj1-x102c.google.com with SMTP id
 98e67ed59e1d1-36b9ec98144so1664356a91.1
 for <qemu-arm@nongnu.org>; Sat, 30 May 2026 16:12:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1780182770; x=1780787570; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=M244E1h1nCtAtZcIR/qVHwnSD2XPye1aHSG7GOg4ROI=;
 b=FDp0xF6KVY7UIGHFGwknXRBcoBwt1rMbQhYLuywzZD5Z8CVmKhWzPCz2Y6/JS7uT9p
 vqVjAKlKItUCcTJprW+CuKfxgYZhT5kxOSgztS4oHyVe7G0teNcz1yS3rTlFjR59MIQg
 GOFsapejNivenAoXRn0PNptejMHcXZ3+Lm/E+q6ZgpPmYf0vIRp71Xx5Jx8FolGjYpAR
 +PMIGnu94jyiZFaP1z1zzuS4HTxD4eHlDZKndmbip/vIbeBw62e72UkJqDvMnB8/ms7S
 gcc6n6ha8M1s2WwmCWgd2NmEqGCR5wdnQEOPUtwgWxVm0MzQE4KR1RYveN3mb7oSRLFu
 vxWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780182770; x=1780787570;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=M244E1h1nCtAtZcIR/qVHwnSD2XPye1aHSG7GOg4ROI=;
 b=Mm20LYCrejlNtr7R15MjIBVHyZXWYvnPyb2m/K0+7x1cwkaYlAPO1oS8NPpzN12Ev4
 g20yhzNmp3gu8wg3bBMCJ2oCihyvm5wMnSiZvYIyu1ojJ6aEqAqiwg+rszVmsvDxtNFL
 CS9TjN1Z/EJ1CT0IKNGqazM32yWDoy1dSkkZWhBe42oNPw/YWAQ861sgLZw+haswpixP
 ibNGSc1FPFIpan410hQByX0gVyX15qDd5Bt5oDyqvhtAZcZ5F68Uy43tbgP29ejA3cp2
 Aol+oAwRkQJOfUY2Tc08Ac/64j78bvULD8hK1JIuoQZJrvcXVteffoLlEmuXv3fCL3Ln
 mhfw==
X-Gm-Message-State: AOJu0YxOmxZGB/Um/+9lAfr4483mnX94dqi7//JHnYHoONkmnatzOx//
 KdKGfFa3AxkSldf27m70r+OywPwZdDtFYYUms+SG+9HypIEg2O6yUx/57g2x/jCjVs0=
X-Gm-Gg: Acq92OE/9blYViWpIPe4NhxX+zxcAgMQwy4/BvbtMCVAQ+if5YipG7XjglGrA2xwoFh
 6zbRsxis1rD7PHG32dLMtsc0dYT4FPRpxxqQRUPnuVDUW/al0YpcQR5SJQV9+m0AsQem7twhzM6
 sKIAYZQlHOP/1r5l4Dy7ZUFSYDOJxAXcqiYwxdqtjP/wQitVSfk0WIkWAlRb9pVvL09hXWZcK2v
 xOsw0BD7+hQbcWMLGcNUpmHhZkpFaKT204/h6DKaDPhd6ECacBYpyX8vc+F7w9LCfX8cvsxupq+
 cD/6UOxxjl1A87v/8nDL1oUvLVU9FAEOhaYQs3r2R1uGEniZGqsoo8ukzu4FyrqB6CoobygTAEM
 krsBpogEJfN4Osc7Fe7MzgEUjqvAGWqfCxGU3Hn3QoVZwCBpFCeQ6qh7iFAm+BlQF2b0OwwXj+8
 VckjjsfLVzlJ8gSLaWg7oH4O/W0cg9w9h+7n7hdSA=
X-Received: by 2002:a17:90b:1845:b0:36a:d6dd:9fee with SMTP id
 98e67ed59e1d1-36c4ff6558bmr4515840a91.12.1780182770204; 
 Sat, 30 May 2026 16:12:50 -0700 (PDT)
Received: from stoup.. ([71.212.142.33]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-c857729d3d1sm5634356a12.21.2026.05.30.16.12.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 May 2026 16:12:49 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v8 18/41] target/arm: Implement LUTI2, LUTI4 for SVE
Date: Sat, 30 May 2026 16:12:06 -0700
Message-ID: <20260530231229.400441-19-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260530231229.400441-1-richard.henderson@linaro.org>
References: <20260530231229.400441-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
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
 target/arm/cpu-features.h      |  6 +++
 target/arm/tcg/translate.h     |  1 +
 target/arm/tcg/translate-a64.c |  1 +
 target/arm/tcg/translate-sve.c | 68 ++++++++++++++++++++++++++++++++++
 target/arm/tcg/sve.decode      | 11 +++++-
 5 files changed, 86 insertions(+), 1 deletion(-)

diff --git a/target/arm/cpu-features.h b/target/arm/cpu-features.h
index 70649fe894..b220ed3437 100644
--- a/target/arm/cpu-features.h
+++ b/target/arm/cpu-features.h
@@ -1659,6 +1659,12 @@ isar_feature_aa64_sme2_or_sve2_f8cvt(const ARMISARegisters *id)
     return isar_feature_aa64_sme2_or_sve2(id) && isar_feature_aa64_f8cvt(id);
 }
 
+static inline bool
+isar_feature_aa64_sme2_or_sve2_lut(const ARMISARegisters *id)
+{
+    return isar_feature_aa64_sme2_or_sve2(id) && isar_feature_aa64_lut(id);
+}
+
 /*
  * Feature tests for "does this exist in either 32-bit or 64-bit?"
  */
diff --git a/target/arm/tcg/translate.h b/target/arm/tcg/translate.h
index d4bcc5bad4..63d83cac55 100644
--- a/target/arm/tcg/translate.h
+++ b/target/arm/tcg/translate.h
@@ -90,6 +90,7 @@ typedef struct DisasContext {
     int vl;          /* current vector length in bytes */
     int svl;         /* current streaming vector length in bytes */
     int max_svl;     /* maximum implemented streaming vector length */
+    int max_any_vl;  /* maximum implemented vector length */
     bool vfp_enabled; /* FP enabled via FPSCR.EN */
     int vec_len;
     int vec_stride;
diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index b076605429..d6466de03f 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -10903,6 +10903,7 @@ static void aarch64_tr_init_disas_context(DisasContextBase *dcbase,
     dc->vl = (EX_TBFLAG_A64(tb_flags, VL) + 1) * 16;
     dc->svl = (EX_TBFLAG_A64(tb_flags, SVL) + 1) * 16;
     dc->max_svl = arm_cpu->sme_max_vq * 16;
+    dc->max_any_vl = MAX(dc->max_svl, arm_cpu->sve_max_vq * 16);
     dc->pauth_active = EX_TBFLAG_A64(tb_flags, PAUTH_ACTIVE);
     dc->bt = EX_TBFLAG_A64(tb_flags, BT);
     dc->btype = EX_TBFLAG_A64(tb_flags, BTYPE);
diff --git a/target/arm/tcg/translate-sve.c b/target/arm/tcg/translate-sve.c
index 31e120af68..a891117916 100644
--- a/target/arm/tcg/translate-sve.c
+++ b/target/arm/tcg/translate-sve.c
@@ -8287,3 +8287,71 @@ TRANS_FEAT(LD1_zcrr_stride, aa64_sme2, gen_ldst_zcrr_c, a, false, true)
 TRANS_FEAT(LD1_zcri_stride, aa64_sme2, gen_ldst_zcri_c, a, false, true)
 TRANS_FEAT(ST1_zcrr_stride, aa64_sme2, gen_ldst_zcrr_c, a, true, true)
 TRANS_FEAT(ST1_zcri_stride, aa64_sme2, gen_ldst_zcri_c, a, true, true)
+
+TRANS_FEAT_STREAMING_SME2(LUTI2_1b, aa64_sme2_or_sve2_lut,
+                          gen_gvec_ool_zzz, gen_helper_gvec_luti2_b,
+                          a->rd, a->rn, a->rm, a->index)
+TRANS_FEAT_STREAMING_SME2(LUTI2_1h, aa64_sme2_or_sve2_lut,
+                          gen_gvec_ool_zzz, gen_helper_gvec_luti2_h,
+                          a->rd, a->rn, a->rm, a->index)
+TRANS_FEAT_STREAMING_SME2(LUTI4_1b, aa64_sme2_or_sve2_lut,
+                          gen_gvec_ool_zzz, gen_helper_gvec_luti4_b,
+                          a->rd, a->rn, a->rm, a->index)
+
+static bool trans_LUTI4_1h(DisasContext *s, arg_LUTI4_1h *a)
+{
+    if (!dc_isar_feature(aa64_sme2_or_sve2_lut, s)) {
+        return false;
+    }
+    s->is_nonstreaming = !dc_isar_feature(aa64_sme2, s);
+
+    /*
+     * The MaxImplementedAnyVL check happens in the decode pseudocode,
+     * before the Check*SVEEnabled check in the operation pseudocode.
+     */
+    if (s->max_any_vl < 32) {
+        unallocated_encoding(s);
+    } else if (sve_access_check(s)) {
+        unsigned vsz = vec_full_reg_size(s);
+
+        /* Then there's a second check against CurrentVL. */
+        if (vsz < 32) {
+            unallocated_encoding(s);
+        } else {
+            tcg_gen_gvec_3_ool(vec_full_reg_offset(s, a->rd),
+                               vec_full_reg_offset(s, a->rn),
+                               vec_full_reg_offset(s, a->rm),
+                               vsz, vsz, a->index,
+                               gen_helper_gvec_luti4_h);
+        }
+    }
+    return true;
+}
+
+static bool trans_LUTI4_2h(DisasContext *s, arg_LUTI4_2h *a)
+{
+    if (!dc_isar_feature(aa64_sme2_or_sve2_lut, s)) {
+        return false;
+    }
+    s->is_nonstreaming = !dc_isar_feature(aa64_sme2, s);
+
+    if (sve_access_check(s)) {
+        unsigned vsz = vec_full_reg_size(s);
+        /*
+         * (Ab)use preg_tmp to merge two disjoint 128-bit quantities
+         * into a sequential 256-bit table.
+         */
+        QEMU_BUILD_BUG_ON(sizeof_field(CPUARMState, vfp.preg_tmp) < 32);
+        unsigned tmp_ofs = offsetof(CPUARMState, vfp.preg_tmp);
+        unsigned rn0_ofs = vec_full_reg_offset(s, a->rn);
+        unsigned rn1_ofs = vec_full_reg_offset(s, (a->rn + 1) % 32);
+
+        tcg_gen_gvec_mov(MO_64, tmp_ofs, rn0_ofs, 16, 16);
+        tcg_gen_gvec_mov(MO_64, tmp_ofs + 16, rn1_ofs, 16, 16);
+
+        tcg_gen_gvec_3_ool(vec_full_reg_offset(s, a->rd), tmp_ofs,
+                           vec_full_reg_offset(s, a->rm),
+                           vsz, vsz, a->index, gen_helper_gvec_luti4_h);
+    }
+    return true;
+}
diff --git a/target/arm/tcg/sve.decode b/target/arm/tcg/sve.decode
index 72755b27af..e2106fc7f5 100644
--- a/target/arm/tcg/sve.decode
+++ b/target/arm/tcg/sve.decode
@@ -31,6 +31,7 @@
 %dtype_23_13    23:2 13:2
 %index3_22_19   22:1 19:2
 %index3_22_17   22:1 17:2
+%index3_22_12   22:2 12:1
 %index3_19_11   19:2 11:1
 %index2_20_11   20:1 11:1
 
@@ -1737,11 +1738,19 @@ RSUBHNT         01000101 .. 1 ..... 011 111 ..... .....  @rd_rn_rm
 MATCH           01000101 .. 1 ..... 100 ... ..... 0 .... @pd_pg_rn_rm
 NMATCH          01000101 .. 1 ..... 100 ... ..... 1 .... @pd_pg_rn_rm
 
-### SVE2 Histogram Computation
+### SVE2 Histogram Computation and Lookup Table
 
 HISTCNT         01000101 .. 1 ..... 110 ... ..... .....  @rd_pg_rn_rm
 HISTSEG         01000101 .. 1 ..... 101 000 ..... .....  @rd_rn_rm
 
+LUTI2_1b        01000101 index:2  1 rm:5 101100 rn:5 rd:5 &rrx_esz esz=0
+LUTI2_1h        01000101 ..       1 rm:5 101.10 rn:5 rd:5 \
+                &rrx_esz esz=1 index=%index3_22_12
+
+LUTI4_1b        01000101 index:1 11 rm:5 101001 rn:5 rd:5 &rrx_esz esz=0
+LUTI4_1h        01000101 index:2  1 rm:5 101111 rn:5 rd:5 &rrx_esz esz=1
+LUTI4_2h        01000101 index:2  1 rm:5 101101 rn:5 rd:5 &rrx_esz esz=1
+
 ## SVE2 floating-point pairwise operations
 
 FADDP           01100100 .. 010 00 0 100 ... ..... ..... @rdn_pg_rm
-- 
2.43.0


