Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 347C5CDE00E
	for <qemu-arm@archiver.kernel.org>; Thu, 25 Jun 2026 22:38:03 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wcsfW-0004kd-V3; Thu, 25 Jun 2026 18:35:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wcsf6-0004bD-U0
 for qemu-arm@nongnu.org; Thu, 25 Jun 2026 18:35:14 -0400
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wcsex-0002Jm-0X
 for qemu-arm@nongnu.org; Thu, 25 Jun 2026 18:35:08 -0400
Received: by mail-pf1-x42d.google.com with SMTP id
 d2e1a72fcca58-845b733e82cso155176b3a.2
 for <qemu-arm@nongnu.org>; Thu, 25 Jun 2026 15:32:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1782426722; x=1783031522; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rh0jxi2qCmB4n3gHnWVvwU8lQ0gEebULAbRxFw11d+8=;
 b=oT10JYk+ZFAZ5gtbZLWkwvRNHMUrE3Jhiojd1UUnRt9fIY3UlKrcxyc5L5CgPOBiYq
 qKehwrUHhDs5VuNzPfAWxQaIohC0RYcQ5hMaja8iBDCYh4yvyMaYPBqz+a7DRzOoTlqA
 H3jRxsLdoF2iQc8yjV8G5Bxd6EPq0kSa8TJXQZkV1zhTKerJ2SVXMMcaS3YDV/XG5fhP
 kk9SKpF8tFtbjuppft39aOzUNQABFOUHqGteAbAKyLnUfms0V26/NKNnEAL3vfaxCQAY
 cir3GJHQuZhWXLceC+lbGTmGZXSJPXoIrK0k345edv0X7Wibqx7pKYwb0F8hCoHTCU6F
 uKmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782426722; x=1783031522;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=rh0jxi2qCmB4n3gHnWVvwU8lQ0gEebULAbRxFw11d+8=;
 b=oSnAHAI6IRUr2C99Gi9tBuVZa9+KXjxr7W0gX2mHXuqB4OwaSWTMpLxdOAZQAhfO+8
 fFbSfOL1f3dIlsNQ0wK7b+8/1VEHpA/7KZLKlalsqy+5AReZ8vkNo3tjOWyLT67k07by
 TkdB9fXNTW9Fb0cfNVYGoINos2l0SOzWXGfdIKCGAUVcHZNxQLwpxXbXnmIAoPwzpyoa
 lFTz2zwcN+GaisP85roJfOv6mgEbQnaEfYpuZSHpd5vnB7YUhD7vwFAP6OkMU89+3KMj
 TTsW3ZF66UOfFDmfM+H/QHZiVxeTJjKKxzXa7fbMXMmSeqVpWCig5ocwMQ964S1XoFK6
 dOZQ==
X-Gm-Message-State: AOJu0YwqnF5DHXcTl2slA1eNpGboBeCnl1cq2Fvxuwq3fpgY7mO0r6aL
 5cIuWYxSeXnxIcT5qkNOvo0kTAeCEuaxm2reKu0jfY039uzP2JWkwYbngckguV+xPWbj0425mk6
 DMLFw
X-Gm-Gg: AfdE7cnibTKupovsO6QtDNuVM1atoOQH37cNB+PMlwqGyFxrej05Q+Va8u371ZktnFI
 oRA0YpvWMmPoLQITVgv8t0WrHAPj8AlH6n++jsX/Zspz08OcZ1p/rE5ej8kQ3T7BLn0AP0EZf0l
 rr8d7OeLvmG2ZHsNZF/Doozlke/Or2cDHT8XhkKWzCGqlz5RkLpStXImAjxqbt+KSApd/utSjQr
 OtPX7SHMp/v+FkRmXEQRloJyZOuof4NCVu4gmg6vFCDpVbtJgvgkXXAwZU+1dkcjtNoM7T4g+XA
 YbEqgR/KqqlDBqBqsUU2I6IrwNCZXarvz+yBTnPNrA/qDb/fa19cj9F0rnb//k0UWxxtxQCS3OX
 dTY9r+6+9DreQsSqCFCgxn34e1py+e2a2WSpc3/uZzW9DNE31WSviwjvrzN5kacuBnoyN7MSLDq
 ff/ZtdYMi8/pKWIIRMAK6HOZu/xaabFc/DGQPU0BfGlQRtQo2d1w==
X-Received: by 2002:a05:6a00:1d1a:b0:845:48be:b046 with SMTP id
 d2e1a72fcca58-845b3adfba9mr4350691b3a.36.1782426722297; 
 Thu, 25 Jun 2026 15:32:02 -0700 (PDT)
Received: from stoup.. (174-21-129-215.tukw.qwest.net. [174.21.129.215])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-845a412e5e9sm5450139b3a.54.2026.06.25.15.32.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Jun 2026 15:32:01 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 01/15] target/arm: Implement FMOP4 (non-widening) for float32
Date: Thu, 25 Jun 2026 15:31:46 -0700
Message-ID: <20260625223200.763198-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260625223200.763198-1-richard.henderson@linaro.org>
References: <20260625223200.763198-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42d.google.com
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
 target/arm/cpu-features.h        |  5 +++
 target/arm/tcg/helper-sme-defs.h |  4 ++
 target/arm/tcg/translate.h       |  5 +++
 target/arm/tcg/vec_internal.h    |  8 ++++
 target/arm/tcg/sme_helper.c      | 76 ++++++++++++++++++++++++++++++++
 target/arm/tcg/translate-sme.c   | 29 ++++++++++++
 target/arm/tcg/sme.decode        | 12 +++++
 7 files changed, 139 insertions(+)

diff --git a/target/arm/cpu-features.h b/target/arm/cpu-features.h
index cd78353609..a0afbd4fd4 100644
--- a/target/arm/cpu-features.h
+++ b/target/arm/cpu-features.h
@@ -1575,6 +1575,11 @@ static inline bool isar_feature_aa64_sve_b16b16(const ARMISARegisters *id)
     return FIELD_EX64_IDREG(id, ID_AA64ZFR0, B16B16);
 }
 
+static inline bool isar_feature_aa64_sme_mop4(const ARMISARegisters *id)
+{
+    return FIELD_EX64_IDREG(id, ID_AA64SMFR0, SMOP4);
+}
+
 static inline bool isar_feature_aa64_ssve_aes(const ARMISARegisters *id)
 {
     return FIELD_EX64_IDREG(id, ID_AA64SMFR0, AES);
diff --git a/target/arm/tcg/helper-sme-defs.h b/target/arm/tcg/helper-sme-defs.h
index 01aad4c231..9e1f09ce5b 100644
--- a/target/arm/tcg/helper-sme-defs.h
+++ b/target/arm/tcg/helper-sme-defs.h
@@ -355,3 +355,7 @@ DEF_HELPER_FLAGS_5(sme2_sel_b, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32, i32)
 DEF_HELPER_FLAGS_5(sme2_sel_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32, i32)
 DEF_HELPER_FLAGS_5(sme2_sel_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32, i32)
 DEF_HELPER_FLAGS_5(sme2_sel_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32, i32)
+
+DEF_HELPER_FLAGS_5(sme_fmop4a_ss, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, fpst, i32)
+DEF_HELPER_FLAGS_5(sme_fmop4s_ss, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, fpst, i32)
+DEF_HELPER_FLAGS_5(sme_ah_fmop4s_ss, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, fpst, i32)
diff --git a/target/arm/tcg/translate.h b/target/arm/tcg/translate.h
index 462d4c1c74..4a2cc95034 100644
--- a/target/arm/tcg/translate.h
+++ b/target/arm/tcg/translate.h
@@ -268,6 +268,11 @@ static inline int times_2_plus_1(DisasContext *s, int x)
     return x * 2 + 1;
 }
 
+static inline int times_2_plus_16(DisasContext *s, int x)
+{
+    return x * 2 + 16;
+}
+
 static inline int rsub_64(DisasContext *s, int x)
 {
     return 64 - x;
diff --git a/target/arm/tcg/vec_internal.h b/target/arm/tcg/vec_internal.h
index 77e5b01550..d7b558034d 100644
--- a/target/arm/tcg/vec_internal.h
+++ b/target/arm/tcg/vec_internal.h
@@ -547,4 +547,12 @@ void HELPER(NAME)(void *vd, void *vn, void *vm,                            \
     clear_tail(d, oprsz, simd_maxsz(desc));                                \
 }
 
+/*
+ * Perform SME2p2 quarter-tile outer product.
+ * Iterate over ZAtile[] for esize, calling fn for each element.
+ */
+void sme_mop4(void *vza, void *vzn, void *vzm, void *fn_opaque,
+              uint32_t desc, size_t esize,
+              void (*fn)(void *, void *, void *, void *));
+
 #endif /* TARGET_ARM_VEC_INTERNAL_H */
diff --git a/target/arm/tcg/sme_helper.c b/target/arm/tcg/sme_helper.c
index 685b6b46be..b08d91e6de 100644
--- a/target/arm/tcg/sme_helper.c
+++ b/target/arm/tcg/sme_helper.c
@@ -2601,3 +2601,79 @@ void HELPER(sme2_sel_d)(void *vd, void *vn, void *vm,
         }
     }
 }
+
+void sme_mop4(void *vza, void *vzn, void *vzm, void *fn_opaque,
+              uint32_t desc, size_t esize,
+              void (*fn)(void *, void *, void *, void *))
+{
+    intptr_t oprsz = simd_maxsz(desc);
+    intptr_t dim = oprsz / 2;  /* in bytes */
+    bool nreg_m1 = extract32(desc, SIMD_DATA_SHIFT + 0, 1);
+    bool mreg_m1 = extract32(desc, SIMD_DATA_SHIFT + 1, 1);
+    intptr_t host_adj = HOST_BIG_ENDIAN ? 8 - esize : 0;
+
+    for (int outprod = 0; outprod < 4; outprod++) {
+        bool row_hv = outprod & 2;
+        bool col_hv = outprod & 1;
+        intptr_t row_base = row_hv ? dim : 0;
+        intptr_t col_base = col_hv ? dim : 0;
+        void *op1 = vzn + (col_hv && nreg_m1 ? sizeof(ARMVectorReg) : 0);
+        void *op2 = vzm + (row_hv && mreg_m1 ? sizeof(ARMVectorReg) : 0);
+
+        for (intptr_t row = 0; row < dim; row += esize) {
+            intptr_t row_idx = row_base + row;
+            void *vza_row = vza + tile_vslice_offset(row_idx);
+            void *e1 = op1 + (row_idx ^ host_adj);
+
+            for (intptr_t col = 0; col < dim; col += esize) {
+                intptr_t col_idx = col_base + col;
+                void *e2 = op2 + (col_idx ^ host_adj);
+                void *e3 = vza_row + (col_idx ^ host_adj);
+
+                fn(e3, e1, e2, fn_opaque);
+            }
+        }
+    }
+}
+
+static void inner_fmop4a_ss(void *vd, void *vn, void *vm, void *vinfo)
+{
+    float32 *d = vd, *n = vn, *m = vm;
+    float_status *fpst = vinfo;
+
+    *d = float32_muladd(*n, *m, *d, 0, fpst);
+}
+
+void HELPER(sme_fmop4a_ss)(void *vza, void *vzn, void *vzm,
+                           float_status *fpst, uint32_t desc)
+{
+    sme_mop4(vza, vzn, vzm, fpst, desc, sizeof(float32), inner_fmop4a_ss);
+}
+
+static void inner_fmop4s_ss(void *vd, void *vn, void *vm, void *vinfo)
+{
+    float32 *d = vd, *n = vn, *m = vm;
+    float_status *fpst = vinfo;
+
+    *d = float32_muladd(float32_chs(*n), *m, *d, 0, fpst);
+}
+
+void HELPER(sme_fmop4s_ss)(void *vza, void *vzn, void *vzm,
+                           float_status *fpst, uint32_t desc)
+{
+    sme_mop4(vza, vzn, vzm, fpst, desc, sizeof(float32), inner_fmop4s_ss);
+}
+
+static void inner_ah_fmop4s_ss(void *vd, void *vn, void *vm, void *vinfo)
+{
+    float32 *d = vd, *n = vn, *m = vm;
+    float_status *fpst = vinfo;
+
+    *d = float32_muladd(*n, *m, *d, float_muladd_negate_product, fpst);
+}
+
+void HELPER(sme_ah_fmop4s_ss)(void *vza, void *vzn, void *vzm,
+                              float_status *fpst, uint32_t desc)
+{
+    sme_mop4(vza, vzn, vzm, fpst, desc, sizeof(float32), inner_ah_fmop4s_ss);
+}
diff --git a/target/arm/tcg/translate-sme.c b/target/arm/tcg/translate-sme.c
index ff5554eefb..aab5eab9df 100644
--- a/target/arm/tcg/translate-sme.c
+++ b/target/arm/tcg/translate-sme.c
@@ -2002,3 +2002,32 @@ TRANS_FEAT(LUTI4_s_4h, aa64_sme2p1, do_lut_s4, a, gen_helper_sme2_luti4_4h)
 
 TRANS_FEAT(LUTI4_s_4b, aa64_sme2p1_lutv2, do_lut_s4, a,
            gen_helper_sme2_luti4_4b)
+
+static bool do_mop4_fp(DisasContext *s, arg_mop4 *a, MemOp esz,
+                       ARMFPStatusFlavour e_fpst,
+                       gen_helper_gvec_3_ptr * const fns[3])
+{
+    int svl = streaming_vec_reg_size(s);
+    uint32_t desc = simd_desc(svl, svl, (a->m << 1) | a->n);
+    int fns_idx = (a->s ? 1 + s->fpcr_ah : 0);
+    TCGv_ptr za, zn, zm, fpst;
+
+    if (!sme_smza_enabled_check(s)) {
+        return true;
+    }
+
+    za = get_tile(s, esz, a->zad);
+    zn = vec_full_reg_ptr(s, a->zn);
+    zm = vec_full_reg_ptr(s, a->zm);
+    fpst = fpstatus_ptr(e_fpst);
+
+    fns[fns_idx](za, zn, zm, fpst, tcg_constant_i32(desc));
+    return true;
+}
+
+static gen_helper_gvec_3_ptr * const fmop4_ss[3] = {
+    gen_helper_sme_fmop4a_ss,
+    gen_helper_sme_fmop4s_ss,
+    gen_helper_sme_ah_fmop4s_ss
+};
+TRANS_FEAT(FMOP4_ss, aa64_sme_mop4, do_mop4_fp, a, MO_32, FPST_ZA, fmop4_ss)
diff --git a/target/arm/tcg/sme.decode b/target/arm/tcg/sme.decode
index 3a65e1ad4b..5a3d47cdfe 100644
--- a/target/arm/tcg/sme.decode
+++ b/target/arm/tcg/sme.decode
@@ -1086,3 +1086,15 @@ LUTI4_s_4h      1100 0000 1001 101 idx:1 10 01 00 zn:5 zd:5     &lut
 
 LUTI4_s_4b      1100 0000 1001 101     1 00 00 00 ....0 zd:5    \
                 &lut zn=%zn_ax2 idx=0
+
+# SME MOP4 Quarter-tile outer products
+
+&mop4           zad zn zm s:bool n:bool m:bool
+
+%mop4_zm        17:3 !function=times_2_plus_16
+%mop4_zn        6:3  !function=times_2
+
+@mop4_o2        .... .... ... m:1 .... .... .. n:1 ... . s:1 .. zad:2 \
+                &mop4 zm=%mop4_zm zn=%mop4_zn
+
+FMOP4_ss        1000 0000 000. ...0 0000 00.. ..0. 00..         @mop4_o2
-- 
2.43.0


