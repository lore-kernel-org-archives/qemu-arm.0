Received: by 2002:ac2:5e6c:0:0:0:0:0 with SMTP id a12csp754260lfr;
        Fri, 16 Apr 2021 14:55:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzOC0JD9prlQMPAESTr1DywDb4ao/flj1FhcmKK5j+Ka4vt/IEfzhr1bB2rcgbiE0jcMa2a
X-Received: by 2002:a25:6c85:: with SMTP id h127mr1541463ybc.341.1618610122973;
        Fri, 16 Apr 2021 14:55:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618610122; cv=none;
        d=google.com; s=arc-20160816;
        b=lXKQFj0noXGLNGRaF9Wc8P55cN+Ss/br0Gz/S6ppadHerKT41UAcBlAgtxIf6upW2g
         OGNIZvyKn2b1onzHdsRQiXlm7mzNLA8XrVgROmM5405qQU1liNuTSNLPZRnd7/0aXnBg
         /2R/d+C7VdKCl5jSocnxT2PyPjMLbYv0zwsEMebb04UVnKNIdNQ37lXR1o/x063ojiwW
         82RcbPW7hyqPw/GRcfs1+P0AkIH7ZV+UIUyGZfc2iGmKfMhF2/hv9ftJNVS+oh2EuxnI
         dlj+HmOd110bncPJ27TJYqGw7LSOdzFd1nhLdOB69HYh+ZaPqu1g+NOO+iQv+9Hn+0Ci
         mG2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=iExyyyc5vS9YN2Us+0ohNYVQqJJ+6cn11cKRgRG0gvI=;
        b=mQh0FnXy/s+HrJhHQXiLrFWwWFD1BVNF99cNLSLsZ/uDlIO4qeizkzEz5WcirPdDpY
         Q61P27GbMMiOPVeQswPQdBOBgx90pq8bIFY1tJe6oF5SjA8Rn8P1JpQVfhGZJJQoOGFF
         Nu4lEubcww0uXLJnFnlvGhIdIQAbmOJGENXb1alW0QQ8UCldkgniiOMTISBcXhK8LllW
         jVqNHSXZ7rL3hVuxEQqtkDmSIxhWjnmPhWRn8Cwh9srxhNHMi1aZEDavohjvQO+EF0oD
         QaLhLXbdrYTKatVMU+ASXgcj1Ac3Hctci41uuu6B8jK5U9vNHpXYfPYOrwgtAUDl87la
         3eXg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rtoHt451;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k13si6485534ybh.38.2021.04.16.14.55.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 16 Apr 2021 14:55:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rtoHt451;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58048 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lXWQs-0003GH-7n
	for alex.bennee@linaro.org; Fri, 16 Apr 2021 17:55:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45612)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXVdu-0006kw-BZ
 for qemu-arm@nongnu.org; Fri, 16 Apr 2021 17:04:46 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:39636)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXVdZ-0001oP-4x
 for qemu-arm@nongnu.org; Fri, 16 Apr 2021 17:04:46 -0400
Received: by mail-pj1-x102d.google.com with SMTP id
 ot17-20020a17090b3b51b0290109c9ac3c34so17057739pjb.4
 for <qemu-arm@nongnu.org>; Fri, 16 Apr 2021 14:04:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iExyyyc5vS9YN2Us+0ohNYVQqJJ+6cn11cKRgRG0gvI=;
 b=rtoHt451I847eBMZvh+094Fc/MYa26KuD0kUdbz/e9vxi+gvfdQww13wutjvJ7ePCH
 PWiIelM0mCVuNm/pZeIcXhNNZuDB7vyOerwtmZCKDlz9YiChOeZHNhAS6N59l7JjqeFL
 hw6QtWXuPhSOtwxFVT+TxCpnfL6iAVvGOVi/oWJRd6QluxcD5XAaQSCSfAI1D18j2qGx
 Vgnj8m/b9ODGufyAgqPSPxqMKdCZOWpfBbB1LgqmvuEIVOxtg14UCNFrOK5aTCKtWJyh
 i/ORVmU/1Qd0Ooyp9L8icoo/XWOBq43VKfop4Klk1pMqx+jYfO8Bpfjd5EdJ10hyfQfQ
 JrHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iExyyyc5vS9YN2Us+0ohNYVQqJJ+6cn11cKRgRG0gvI=;
 b=dINLFmEEEb1M9aa6pAfB6TpDMpBPwHPKBcdPl+FZeq6Uhh9TsZbyylp8DBVPOkGUbm
 isiNbXT1JHmkCNPNmSs8+Ot5YRALz+MTCTNgVYug13qcZ/Xyb/KSn9TRK5ntfJDWCBXE
 ekT7F0KquT7VFxfJmiI4mjDp+yy8KPxTJLBXQzI/HgthDJowrxfijsCYfhlXCkxA0FsN
 RbMpsqZ5NYysok9frpQi6GDHtJh3/dGe2xccD0btoHKX1Y7xDFN6yduVSfImr6qLBNYO
 5qz44Fhu1NBHkBCPkhYccCKX7YoNY3gbL6sArKrORpqj9d8umE3VK6bDTdRe8Tqecak2
 Xyvw==
X-Gm-Message-State: AOAM530Ol4rBenrAj3dAcgSp2hVWmbRAdhtv97/7/I39hXtpcWfv5gBt
 chONp+FeuRs9vgrxuKeBUfQWTg==
X-Received: by 2002:a17:902:d4d0:b029:eb:59ea:2f32 with SMTP id
 o16-20020a170902d4d0b02900eb59ea2f32mr11416058plg.58.1618607063749; 
 Fri, 16 Apr 2021 14:04:23 -0700 (PDT)
Received: from localhost.localdomain ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id m9sm5766734pgt.65.2021.04.16.14.04.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Apr 2021 14:04:23 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 73/81] target/arm: Implement SVE2 fp multiply-add long
Date: Fri, 16 Apr 2021 14:02:32 -0700
Message-Id: <20210416210240.1591291-74-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210416210240.1591291-1-richard.henderson@linaro.org>
References: <20210416210240.1591291-1-richard.henderson@linaro.org>
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
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm@nongnu.org, Stephen Long <steplong@quicinc.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 2ogm7vXdm/4J

From: Stephen Long <steplong@quicinc.com>

Implements both vectored and indexed FMLALB, FMLALT, FMLSLB, FMLSLT

Signed-off-by: Stephen Long <steplong@quicinc.com>
Message-Id: <20200504171240.11220-1-steplong@quicinc.com>
[rth: Rearrange to use float16_to_float32_by_bits.]
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.h        |  5 +++
 target/arm/sve.decode      | 14 +++++++
 target/arm/translate-sve.c | 75 ++++++++++++++++++++++++++++++++++++++
 target/arm/vec_helper.c    | 51 ++++++++++++++++++++++++++
 4 files changed, 145 insertions(+)

diff --git a/target/arm/helper.h b/target/arm/helper.h
index 86f938c938..e8b16a401f 100644
--- a/target/arm/helper.h
+++ b/target/arm/helper.h
@@ -987,6 +987,11 @@ DEF_HELPER_FLAGS_4(sve2_sqrdmulh_idx_s, TCG_CALL_NO_RWG,
 DEF_HELPER_FLAGS_4(sve2_sqrdmulh_idx_d, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, i32)
 
+DEF_HELPER_FLAGS_6(sve2_fmlal_zzzw_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_6(sve2_fmlal_zzxw_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, ptr, i32)
+
 DEF_HELPER_FLAGS_4(gvec_xar_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 
 #ifdef TARGET_AARCH64
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index cfdee8955b..63870b7539 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -132,6 +132,8 @@
                 &rrrr_esz ra=%reg_movprfx
 
 # Four operand with unused vector element size
+@rda_rn_rm_e0   ........ ... rm:5 ... ... rn:5 rd:5 \
+                &rrrr_esz esz=0 ra=%reg_movprfx
 @rdn_ra_rm_e0   ........ ... rm:5 ... ... ra:5 rd:5 \
                 &rrrr_esz esz=0 rn=%reg_movprfx
 
@@ -1559,3 +1561,15 @@ FCVTLT_sd       01100100 11 0010 11 101 ... ..... .....  @rd_pg_rn_e0
 
 ### SVE2 floating-point convert to integer
 FLOGB           01100101 00 011 esz:2 0101 pg:3 rn:5 rd:5  &rpr_esz
+
+### SVE2 floating-point multiply-add long (vectors)
+FMLALB_zzzw     01100100 10 1 ..... 10 0 00 0 ..... .....  @rda_rn_rm_e0
+FMLALT_zzzw     01100100 10 1 ..... 10 0 00 1 ..... .....  @rda_rn_rm_e0
+FMLSLB_zzzw     01100100 10 1 ..... 10 1 00 0 ..... .....  @rda_rn_rm_e0
+FMLSLT_zzzw     01100100 10 1 ..... 10 1 00 1 ..... .....  @rda_rn_rm_e0
+
+### SVE2 floating-point multiply-add long (indexed)
+FMLALB_zzxw     01100100 10 1 ..... 0100.0 ..... .....     @rrxr_3a esz=2
+FMLALT_zzxw     01100100 10 1 ..... 0100.1 ..... .....     @rrxr_3a esz=2
+FMLSLB_zzxw     01100100 10 1 ..... 0110.0 ..... .....     @rrxr_3a esz=2
+FMLSLT_zzxw     01100100 10 1 ..... 0110.1 ..... .....     @rrxr_3a esz=2
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 26377b1227..ae628968da 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -8468,3 +8468,78 @@ static bool trans_FLOGB(DisasContext *s, arg_rpr_esz *a)
     }
     return true;
 }
+
+static bool do_FMLAL_zzzw(DisasContext *s, arg_rrrr_esz *a, bool sub, bool sel)
+{
+    if (!dc_isar_feature(aa64_sve2, s)) {
+        return false;
+    }
+    if (sve_access_check(s)) {
+        unsigned vsz = vec_full_reg_size(s);
+        tcg_gen_gvec_4_ptr(vec_full_reg_offset(s, a->rd),
+                           vec_full_reg_offset(s, a->rn),
+                           vec_full_reg_offset(s, a->rm),
+                           vec_full_reg_offset(s, a->ra),
+                           cpu_env, vsz, vsz, (sel << 1) | sub,
+                           gen_helper_sve2_fmlal_zzzw_s);
+    }
+    return true;
+}
+
+static bool trans_FMLALB_zzzw(DisasContext *s, arg_rrrr_esz *a)
+{
+    return do_FMLAL_zzzw(s, a, false, false);
+}
+
+static bool trans_FMLALT_zzzw(DisasContext *s, arg_rrrr_esz *a)
+{
+    return do_FMLAL_zzzw(s, a, false, true);
+}
+
+static bool trans_FMLSLB_zzzw(DisasContext *s, arg_rrrr_esz *a)
+{
+    return do_FMLAL_zzzw(s, a, true, false);
+}
+
+static bool trans_FMLSLT_zzzw(DisasContext *s, arg_rrrr_esz *a)
+{
+    return do_FMLAL_zzzw(s, a, true, true);
+}
+
+static bool do_FMLAL_zzxw(DisasContext *s, arg_rrxr_esz *a, bool sub, bool sel)
+{
+    if (!dc_isar_feature(aa64_sve2, s)) {
+        return false;
+    }
+    if (sve_access_check(s)) {
+        unsigned vsz = vec_full_reg_size(s);
+        tcg_gen_gvec_4_ptr(vec_full_reg_offset(s, a->rd),
+                           vec_full_reg_offset(s, a->rn),
+                           vec_full_reg_offset(s, a->rm),
+                           vec_full_reg_offset(s, a->ra),
+                           cpu_env, vsz, vsz,
+                           (a->index << 2) | (sel << 1) | sub,
+                           gen_helper_sve2_fmlal_zzxw_s);
+    }
+    return true;
+}
+
+static bool trans_FMLALB_zzxw(DisasContext *s, arg_rrxr_esz *a)
+{
+    return do_FMLAL_zzxw(s, a, false, false);
+}
+
+static bool trans_FMLALT_zzxw(DisasContext *s, arg_rrxr_esz *a)
+{
+    return do_FMLAL_zzxw(s, a, false, true);
+}
+
+static bool trans_FMLSLB_zzxw(DisasContext *s, arg_rrxr_esz *a)
+{
+    return do_FMLAL_zzxw(s, a, true, false);
+}
+
+static bool trans_FMLSLT_zzxw(DisasContext *s, arg_rrxr_esz *a)
+{
+    return do_FMLAL_zzxw(s, a, true, true);
+}
diff --git a/target/arm/vec_helper.c b/target/arm/vec_helper.c
index 9b2a4d5b7e..ea08b15c55 100644
--- a/target/arm/vec_helper.c
+++ b/target/arm/vec_helper.c
@@ -29,10 +29,14 @@
    so addressing units smaller than that needs a host-endian fixup.  */
 #ifdef HOST_WORDS_BIGENDIAN
 #define H1(x)  ((x) ^ 7)
+#define H1_2(x) ((x) ^ 6)
+#define H1_4(x) ((x) ^ 4)
 #define H2(x)  ((x) ^ 3)
 #define H4(x)  ((x) ^ 1)
 #else
 #define H1(x)  (x)
+#define H1_2(x) (x)
+#define H1_4(x) (x)
 #define H2(x)  (x)
 #define H4(x)  (x)
 #endif
@@ -1907,6 +1911,27 @@ void HELPER(gvec_fmlal_a64)(void *vd, void *vn, void *vm,
              get_flush_inputs_to_zero(&env->vfp.fp_status_f16));
 }
 
+void HELPER(sve2_fmlal_zzzw_s)(void *vd, void *vn, void *vm, void *va,
+                               void *venv, uint32_t desc)
+{
+    intptr_t i, oprsz = simd_oprsz(desc);
+    uint16_t negn = extract32(desc, SIMD_DATA_SHIFT, 1) << 15;
+    intptr_t sel = extract32(desc, SIMD_DATA_SHIFT + 1, 1) * sizeof(float16);
+    CPUARMState *env = venv;
+    float_status *status = &env->vfp.fp_status;
+    bool fz16 = get_flush_inputs_to_zero(&env->vfp.fp_status_f16);
+
+    for (i = 0; i < oprsz; i += sizeof(float32)) {
+        float16 nn_16 = *(float16 *)(vn + H1_2(i + sel)) ^ negn;
+        float16 mm_16 = *(float16 *)(vm + H1_2(i + sel));
+        float32 nn = float16_to_float32_by_bits(nn_16, fz16);
+        float32 mm = float16_to_float32_by_bits(mm_16, fz16);
+        float32 aa = *(float32 *)(va + H1_4(i));
+
+        *(float32 *)(vd + H1_4(i)) = float32_muladd(nn, mm, aa, 0, status);
+    }
+}
+
 static void do_fmlal_idx(float32 *d, void *vn, void *vm, float_status *fpst,
                          uint32_t desc, bool fz16)
 {
@@ -1951,6 +1976,32 @@ void HELPER(gvec_fmlal_idx_a64)(void *vd, void *vn, void *vm,
                  get_flush_inputs_to_zero(&env->vfp.fp_status_f16));
 }
 
+void HELPER(sve2_fmlal_zzxw_s)(void *vd, void *vn, void *vm, void *va,
+                               void *venv, uint32_t desc)
+{
+    intptr_t i, j, oprsz = simd_oprsz(desc);
+    uint16_t negn = extract32(desc, SIMD_DATA_SHIFT, 1) << 15;
+    intptr_t sel = extract32(desc, SIMD_DATA_SHIFT + 1, 1) * sizeof(float16);
+    intptr_t idx = extract32(desc, SIMD_DATA_SHIFT + 2, 3) * sizeof(float16);
+    CPUARMState *env = venv;
+    float_status *status = &env->vfp.fp_status;
+    bool fz16 = get_flush_inputs_to_zero(&env->vfp.fp_status_f16);
+
+    for (i = 0; i < oprsz; i += 16) {
+        float16 mm_16 = *(float16 *)(vm + i + idx);
+        float32 mm = float16_to_float32_by_bits(mm_16, fz16);
+
+        for (j = 0; j < 16; j += sizeof(float32)) {
+            float16 nn_16 = *(float16 *)(vn + H1_2(i + j + sel)) ^ negn;
+            float32 nn = float16_to_float32_by_bits(nn_16, fz16);
+            float32 aa = *(float32 *)(va + H1_4(i + j));
+
+            *(float32 *)(vd + H1_4(i + j)) =
+                float32_muladd(nn, mm, aa, 0, status);
+        }
+    }
+}
+
 void HELPER(gvec_sshl_b)(void *vd, void *vn, void *vm, uint32_t desc)
 {
     intptr_t i, opr_sz = simd_oprsz(desc);
-- 
2.25.1

