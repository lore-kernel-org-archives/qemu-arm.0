Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 465DDCD8CA8
	for <qemu-arm@archiver.kernel.org>; Tue,  9 Jun 2026 19:32:02 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wX27C-0002NF-Cw; Tue, 09 Jun 2026 15:27:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wX220-0003d7-VU
 for qemu-arm@nongnu.org; Tue, 09 Jun 2026 15:22:43 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wX21s-00045c-TI
 for qemu-arm@nongnu.org; Tue, 09 Jun 2026 15:22:33 -0400
Received: by mail-pj1-x102d.google.com with SMTP id
 98e67ed59e1d1-36dac5d5da0so3137433a91.2
 for <qemu-arm@nongnu.org>; Tue, 09 Jun 2026 12:21:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1781032887; x=1781637687; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=v8z7vsZPtDt29Sx0GIH5ZsIK6mtaOAuGTD0EuX2TyFE=;
 b=IUn0i5dTwQxsOdjXJ3Do9gPENGQPUh7inVQacwRBULVSqIb9U4wV8to/lkOxulBdFB
 XutfIxCQLGREb2MKTf8TemsTG/0LevYSOzy4ZY7n/x7s7iIGp6YaebwJKP8OvXntx8G/
 mDCDPiUV+rwc0YJQDXN6YeJxg5L89MZSAnfm7ZxfgYDlfMoiqCwiy7lKj5ZFZiM0wLL7
 s+gIxk9qWEzdRuz4Z5CCQ2BGheb7FJjgOvHZ7CgvaRpSeI4bc8H0XeUnB9AZNQxHUrci
 TaMgkRtZIv0w19h6kAm4aY2yAhSFakLESq5EJrOEwVLJRcrKotsxSE8bwPCcPb4GRA3T
 U88g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781032887; x=1781637687;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=v8z7vsZPtDt29Sx0GIH5ZsIK6mtaOAuGTD0EuX2TyFE=;
 b=pyB0Nex6snQmGO/IqjpGLJhdVc7LdkWROV4S6Htuq4+c/fBPFccMfMJY/i70Mt529B
 VAowz/pw7za+5fFZXJ0yQpHibOqTdYfWECdCkCWtNWVI5NWemhaq+Zc07QSWxr1KUbep
 rBH0OTx95DJsDbQzSQNc820C073S+3VKdUbr3tnOXjwFTIXJXOG+3BMcwr9FPREB5kaX
 CydqlWAD0gz5PbIOmoXIN1CSo/S+XNCwBY/FFh7KDUSTfXuTF54UZYqR1MXB3m7dB37s
 D0Umt7eA0oVRlL2entTAXs33iKao4zFHMwLHDoVLz/3FhU6R2YRcyZOSTmkkBbP5AeJC
 hEtQ==
X-Gm-Message-State: AOJu0YyTadgExZtLNHB+HOLwNBoutbXddpdoTr3tujfeL40G0LRZQyK2
 G+lH5aaCrogYl3UqvL1xK6ZxIuV8ztttM8iTHMwmH6m/d+tJJbFz6svJPnJIfAUHqQc=
X-Gm-Gg: Acq92OHgO+KJfolZ0un4HPbqItod49JIQMPmk5ee/eFs3jI9/YjFJDIEGZ0I6b39QK0
 ypKa0QJAJc19/yNrHu0jejfGlVKgk8CHn8EVfS/BNgoZPCgRrH8BuY3RTC+Kvq65MwyFDAo59wC
 1sp4gN2bxNoqbbsCcS7owpjTk1YbPQvPlI7xvxx+Dmka/Gxzri6IV5SA9I/V8b92g0ZTqOv/Woo
 ZPngAXk98E+HRa8ok3MLFcblkHe3gUQU6f6hxDHRiPfu6FnAx6Gp+mpcDIjEEu45+VcrBvG+9bq
 h5jKVLdNkF01NIIOTu3HpzK6eRjj/xTymO95xTWFQFEHp67jyveAcauWvmNm+KGY71Ed25aOa7m
 +IqTRcbysF12wE/ISpJToQ0yxqY+8TVz8m2LcOJ/ForwciCyOi5MN9EP8g8Z6c40PxZkEMKLKKs
 UkiuePwp6JUlVUkyzDDKA8KjNfhIDgcqyZQ/Ye1z4=
X-Received: by 2002:a17:903:2451:b0:2c0:3400:5c34 with SMTP id
 d9443c01a7336-2c1e78e03e8mr249258765ad.3.1781032887147; 
 Tue, 09 Jun 2026 12:21:27 -0700 (PDT)
Received: from stoup.. ([71.212.142.33]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2c164f88473sm240806095ad.25.2026.06.09.12.21.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jun 2026 12:21:26 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v10 22/45] target/arm: Implement LUTI2, LUTI4 for SVE
Date: Tue,  9 Jun 2026 12:20:46 -0700
Message-ID: <20260609192110.752384-23-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260609192110.752384-1-richard.henderson@linaro.org>
References: <20260609192110.752384-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
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
index beaffe914e..7c9beb30e6 100644
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
index 065f16d899..0e0bc4cbfe 100644
--- a/target/arm/tcg/translate-sve.c
+++ b/target/arm/tcg/translate-sve.c
@@ -8287,3 +8287,71 @@ TRANS_FEAT(LD1_zcrr_stride, aa64_sme2, gen_ldst_zcrr_c, a, false, true)
 TRANS_FEAT(LD1_zcri_stride, aa64_sme2, gen_ldst_zcri_c, a, false, true)
 TRANS_FEAT(ST1_zcrr_stride, aa64_sme2, gen_ldst_zcrr_c, a, true, true)
 TRANS_FEAT(ST1_zcri_stride, aa64_sme2, gen_ldst_zcri_c, a, true, true)
+
+TRANS_FEAT_STREAMING_IF(LUTI2_1b, aa64_sme2_or_sve2_lut, aa64_sme2,
+                        gen_gvec_ool_zzz, gen_helper_gvec_luti2_b,
+                        a->rd, a->rn, a->rm, a->index)
+TRANS_FEAT_STREAMING_IF(LUTI2_1h, aa64_sme2_or_sve2_lut, aa64_sme2,
+                        gen_gvec_ool_zzz, gen_helper_gvec_luti2_h,
+                        a->rd, a->rn, a->rm, a->index)
+TRANS_FEAT_STREAMING_IF(LUTI4_1b, aa64_sme2_or_sve2_lut, aa64_sme2,
+                        gen_gvec_ool_zzz, gen_helper_gvec_luti4_b,
+                        a->rd, a->rn, a->rm, a->index)
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


