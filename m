Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp489391lfg;
        Fri, 30 Apr 2021 14:00:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyxMv9lXOugAc+AaY8nTcnAMQ1A58rmsJcDGl2tp+JwqsWeZGhqR/Lk2QiMAGmY1kIXyFl1
X-Received: by 2002:a05:6e02:1152:: with SMTP id o18mr5714830ill.174.1619816419196;
        Fri, 30 Apr 2021 14:00:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1619816419; cv=none;
        d=google.com; s=arc-20160816;
        b=rYzmUe2Tc3w8F2uiPT/h92mJzDPP5LmWwRCLvk2/nSQ/TAkdRW347cFHbwUrKx38eW
         C96mGbciS41vrRTNkDYwdJM3elgNBXsihUnKb4Rs1OXyJngTIGauff0um3RLjBuBSIRl
         zQlSG2TnMSkubaRUq+rgJDGzr9pLhZgEItNkPbZOE6QRcUGMagvVnBwoMRN82fpnAhIb
         yGZatRr4vooSvmFF1VtJxVEKPV8F3wzdHtT/8YyjZCSpq8TZuN2lirEPIe332ll5b99m
         hcKt2tQSR86G6/u44UCmA2uKhzFRbK1N/VqhFCd5ZMmtX5XeWYO0vwx38Xis/5vwisu/
         WbMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=W45GPMZZVBfCUkRw+wO8T3FyCeab3ADQB7NYg/wbXMs=;
        b=BEX8JfFfK1VYCmrYuPoHpIJnTuWxV/rvc93j0fyN8VQYb2vohifuz3vJN6aqhWGTC0
         q+QBtEuKh8k20LA0RmatEjftSBFfYSi91RsAIEfxLI+XrOuW1KYmCV7A4P6RQS6p1QlR
         to9I0NGDlHMPKmv4MIjVzh4DVqoA2KnLrCwHswNzPNYoJuteASjSIXq7qaepIi2+sSeb
         7F2gdkftquSJnY8eaIDMV/37A8+dcXiMVHHCI9Bz7VPqVZHviBpkfnPRip3PGBkan/mh
         GoUgbkwY7BhMqOElxR2HsnQlDr4mpnodx5NhwVwO7WzGW+x8y8wb4mvC31NhVVYl3Sej
         D5AA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EuLYShNq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y1si5039686iow.83.2021.04.30.14.00.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 30 Apr 2021 14:00:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EuLYShNq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42164 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lcaFG-0000PN-Co
	for alex.bennee@linaro.org; Fri, 30 Apr 2021 17:00:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52338)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcZj0-0000nl-AC
 for qemu-arm@nongnu.org; Fri, 30 Apr 2021 16:27:00 -0400
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530]:39722)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcZid-0006D7-Lp
 for qemu-arm@nongnu.org; Fri, 30 Apr 2021 16:26:57 -0400
Received: by mail-pg1-x530.google.com with SMTP id s22so29069825pgk.6
 for <qemu-arm@nongnu.org>; Fri, 30 Apr 2021 13:26:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=W45GPMZZVBfCUkRw+wO8T3FyCeab3ADQB7NYg/wbXMs=;
 b=EuLYShNqUmxSrjnvpVsqSKIdC74QaOOZ/NbgbkNOrCG6GspsUzlf2FvFTAQZ81T6gV
 HaGvUs9B244pY2aMr5HUEDVtaRLV4lM3NEnri9P+7+egH+EErS+2VJXbX1hcLUKQJN/M
 DHq3lmFdkReVH/4KQpDc0gR+ULOw3Ri61Wt2zWymECPtrbm2dO5KzR1fjFR0MN1UetYC
 fqS9mwPhU5uJH637+ijlQTXIfFaHh6X8low6XTymBPA62lcCu3mY9yGM6jcRW82dcmpA
 CeufPN1Pp7JorE5FUd3Et2sf35AZKcZMLWw6y4qb2Pnb1Fn0UPqAI3w2luTfzpmv2DcS
 hniQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=W45GPMZZVBfCUkRw+wO8T3FyCeab3ADQB7NYg/wbXMs=;
 b=G5yJ6w5hIubVp/JenzRr+KQpCKyRXcgI3yfKgKqmsucs26ZhrFOzbih8yxX+oYlE7z
 wKUdU6gVpSVHKcEy+nrvuGO3AXNBQ9sOb41HV0sToMo/BBy/VeEiDybwTmVLdRJDOtrp
 s3jnR11YnEdV2NQ55ob1A863hZzz61YgG+t8WzbTjMdlhpNZRdhyxtgR7jl1OOztCNwT
 4bup7nT43yP5caSUkeNJGdc3FBehglA5iMWoPHy19oO7BQfDbupb9N6w+qXlH7oRYZYK
 f0k8VrWVWbQlXacJ0XB4rzamMwAbBu525gxEROwBScms2AiwAFNHJV/OdCu3Dw8jl4WA
 FPZw==
X-Gm-Message-State: AOAM531FUthniROpd3dk8U3gp1K4hlJuhxEOzphnl9T7Vhz2sVfmAR0V
 lRVqcf1Ehb8LeOQIb4r/UtqYvysKKFYr9A==
X-Received: by 2002:aa7:84d0:0:b029:27d:fff:40c9 with SMTP id
 x16-20020aa784d00000b029027d0fff40c9mr6427276pfn.7.1619814394100; 
 Fri, 30 Apr 2021 13:26:34 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id e6sm2905257pfd.219.2021.04.30.13.26.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Apr 2021 13:26:33 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 37/82] target/arm: Implement SVE2 complex integer
 multiply-add
Date: Fri, 30 Apr 2021 13:25:25 -0700
Message-Id: <20210430202610.1136687-38-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210430202610.1136687-1-richard.henderson@linaro.org>
References: <20210430202610.1136687-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x530.google.com
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /6Sg1xZ7pL9p

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v2: Fix do_sqrdmlah_d (laurent desnogues)
---
 target/arm/helper-sve.h    | 18 ++++++++++++++++
 target/arm/vec_internal.h  |  5 +++++
 target/arm/sve.decode      |  5 +++++
 target/arm/sve_helper.c    | 42 ++++++++++++++++++++++++++++++++++++++
 target/arm/translate-sve.c | 32 +++++++++++++++++++++++++++++
 target/arm/vec_helper.c    | 15 +++++++-------
 6 files changed, 109 insertions(+), 8 deletions(-)

diff --git a/target/arm/helper-sve.h b/target/arm/helper-sve.h
index 457a421455..d154218452 100644
--- a/target/arm/helper-sve.h
+++ b/target/arm/helper-sve.h
@@ -2601,3 +2601,21 @@ DEF_HELPER_FLAGS_5(sve2_umlsl_zzzw_s, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_5(sve2_umlsl_zzzw_d, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_5(sve2_cmla_zzzz_b, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_cmla_zzzz_h, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_cmla_zzzz_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_cmla_zzzz_d, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_5(sve2_sqrdcmlah_zzzz_b, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_sqrdcmlah_zzzz_h, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_sqrdcmlah_zzzz_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_sqrdcmlah_zzzz_d, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
diff --git a/target/arm/vec_internal.h b/target/arm/vec_internal.h
index 0102547a10..200fb55909 100644
--- a/target/arm/vec_internal.h
+++ b/target/arm/vec_internal.h
@@ -168,4 +168,9 @@ static inline int64_t do_suqrshl_d(int64_t src, int64_t shift,
     return do_uqrshl_d(src, shift, round, sat);
 }
 
+int8_t do_sqrdmlah_b(int8_t, int8_t, int8_t, bool, bool);
+int16_t do_sqrdmlah_h(int16_t, int16_t, int16_t, bool, bool, uint32_t *);
+int32_t do_sqrdmlah_s(int32_t, int32_t, int32_t, bool, bool, uint32_t *);
+int64_t do_sqrdmlah_d(int64_t, int64_t, int64_t, bool, bool);
+
 #endif /* TARGET_ARM_VEC_INTERNALS_H */
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index b28b50e05c..936977eacb 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -1362,3 +1362,8 @@ SMLSLB_zzzw     01000100 .. 0 ..... 010 100 ..... .....  @rda_rn_rm
 SMLSLT_zzzw     01000100 .. 0 ..... 010 101 ..... .....  @rda_rn_rm
 UMLSLB_zzzw     01000100 .. 0 ..... 010 110 ..... .....  @rda_rn_rm
 UMLSLT_zzzw     01000100 .. 0 ..... 010 111 ..... .....  @rda_rn_rm
+
+## SVE2 complex integer multiply-add
+
+CMLA_zzzz       01000100 esz:2 0 rm:5 0010 rot:2 rn:5 rd:5  ra=%reg_movprfx
+SQRDCMLAH_zzzz  01000100 esz:2 0 rm:5 0011 rot:2 rn:5 rd:5  ra=%reg_movprfx
diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index 8b86e7ecd6..572d41a26c 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -1448,6 +1448,48 @@ DO_SQDMLAL(sve2_sqdmlsl_zzzw_d, int64_t, int32_t,     , H1_4,
 
 #undef DO_SQDMLAL
 
+#define DO_CMLA(NAME, TYPE, H, OP) \
+void HELPER(NAME)(void *vd, void *vn, void *vm, void *va, uint32_t desc) \
+{                                                               \
+    intptr_t i, opr_sz = simd_oprsz(desc) / sizeof(TYPE);       \
+    int rot = simd_data(desc);                                  \
+    int sel_a = rot & 1, sel_b = sel_a ^ 1;                     \
+    bool sub_r = rot == 1 || rot == 2;                          \
+    bool sub_i = rot >= 2;                                      \
+    TYPE *d = vd, *n = vn, *m = vm, *a = va;                    \
+    for (i = 0; i < opr_sz; i += 2) {                           \
+        TYPE elt1_a = n[H(i + sel_a)];                          \
+        TYPE elt2_a = m[H(i + sel_a)];                          \
+        TYPE elt2_b = m[H(i + sel_b)];                          \
+        d[H(i)] = OP(elt1_a, elt2_a, a[H(i)], sub_r);           \
+        d[H(i + 1)] = OP(elt1_a, elt2_b, a[H(i + 1)], sub_i);   \
+    }                                                           \
+}
+
+#define do_cmla(N, M, A, S) (A + (N * M) * (S ? -1 : 1))
+
+DO_CMLA(sve2_cmla_zzzz_b, uint8_t, H1, do_cmla)
+DO_CMLA(sve2_cmla_zzzz_h, uint16_t, H2, do_cmla)
+DO_CMLA(sve2_cmla_zzzz_s, uint32_t, H4, do_cmla)
+DO_CMLA(sve2_cmla_zzzz_d, uint64_t,   , do_cmla)
+
+#define DO_SQRDMLAH_B(N, M, A, S) \
+    do_sqrdmlah_b(N, M, A, S, true)
+#define DO_SQRDMLAH_H(N, M, A, S) \
+    ({ uint32_t discard; do_sqrdmlah_h(N, M, A, S, true, &discard); })
+#define DO_SQRDMLAH_S(N, M, A, S) \
+    ({ uint32_t discard; do_sqrdmlah_s(N, M, A, S, true, &discard); })
+#define DO_SQRDMLAH_D(N, M, A, S) \
+    do_sqrdmlah_d(N, M, A, S, true)
+
+DO_CMLA(sve2_sqrdcmlah_zzzz_b, int8_t, H1, DO_SQRDMLAH_B)
+DO_CMLA(sve2_sqrdcmlah_zzzz_h, int16_t, H2, DO_SQRDMLAH_H)
+DO_CMLA(sve2_sqrdcmlah_zzzz_s, int32_t, H4, DO_SQRDMLAH_S)
+DO_CMLA(sve2_sqrdcmlah_zzzz_d, int64_t,   , DO_SQRDMLAH_D)
+
+#undef do_cmla
+#undef DO_CMLA
+
 #define DO_BITPERM(NAME, TYPE, OP) \
 void HELPER(NAME)(void *vd, void *vn, void *vm, uint32_t desc) \
 {                                                              \
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 0fdfd1e9e0..6e92abbd8f 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -7656,3 +7656,35 @@ static bool trans_UMLSLT_zzzw(DisasContext *s, arg_rrrr_esz *a)
 {
     return do_umlsl_zzzw(s, a, true);
 }
+
+static bool trans_CMLA_zzzz(DisasContext *s, arg_CMLA_zzzz *a)
+{
+    static gen_helper_gvec_4 * const fns[] = {
+        gen_helper_sve2_cmla_zzzz_b, gen_helper_sve2_cmla_zzzz_h,
+        gen_helper_sve2_cmla_zzzz_s, gen_helper_sve2_cmla_zzzz_d,
+    };
+
+    if (!dc_isar_feature(aa64_sve2, s)) {
+        return false;
+    }
+    if (sve_access_check(s)) {
+        gen_gvec_ool_zzzz(s, fns[a->esz], a->rd, a->rn, a->rm, a->ra, a->rot);
+    }
+    return true;
+}
+
+static bool trans_SQRDCMLAH_zzzz(DisasContext *s, arg_SQRDCMLAH_zzzz *a)
+{
+    static gen_helper_gvec_4 * const fns[] = {
+        gen_helper_sve2_sqrdcmlah_zzzz_b, gen_helper_sve2_sqrdcmlah_zzzz_h,
+        gen_helper_sve2_sqrdcmlah_zzzz_s, gen_helper_sve2_sqrdcmlah_zzzz_d,
+    };
+
+    if (!dc_isar_feature(aa64_sve2, s)) {
+        return false;
+    }
+    if (sve_access_check(s)) {
+        gen_gvec_ool_zzzz(s, fns[a->esz], a->rd, a->rn, a->rm, a->ra, a->rot);
+    }
+    return true;
+}
diff --git a/target/arm/vec_helper.c b/target/arm/vec_helper.c
index c56337e724..19006f50f7 100644
--- a/target/arm/vec_helper.c
+++ b/target/arm/vec_helper.c
@@ -38,8 +38,8 @@
 #endif
 
 /* Signed saturating rounding doubling multiply-accumulate high half, 8-bit */
-static int8_t do_sqrdmlah_b(int8_t src1, int8_t src2, int8_t src3,
-                            bool neg, bool round)
+int8_t do_sqrdmlah_b(int8_t src1, int8_t src2, int8_t src3,
+                     bool neg, bool round)
 {
     /*
      * Simplify:
@@ -82,8 +82,8 @@ void HELPER(sve2_sqrdmlsh_b)(void *vd, void *vn, void *vm,
 }
 
 /* Signed saturating rounding doubling multiply-accumulate high half, 16-bit */
-static int16_t do_sqrdmlah_h(int16_t src1, int16_t src2, int16_t src3,
-                             bool neg, bool round, uint32_t *sat)
+int16_t do_sqrdmlah_h(int16_t src1, int16_t src2, int16_t src3,
+                      bool neg, bool round, uint32_t *sat)
 {
     /* Simplify similarly to do_sqrdmlah_b above.  */
     int32_t ret = (int32_t)src1 * src2;
@@ -199,8 +199,8 @@ void HELPER(sve2_sqrdmlsh_h)(void *vd, void *vn, void *vm,
 }
 
 /* Signed saturating rounding doubling multiply-accumulate high half, 32-bit */
-static int32_t do_sqrdmlah_s(int32_t src1, int32_t src2, int32_t src3,
-                             bool neg, bool round, uint32_t *sat)
+int32_t do_sqrdmlah_s(int32_t src1, int32_t src2, int32_t src3,
+                      bool neg, bool round, uint32_t *sat)
 {
     /* Simplify similarly to do_sqrdmlah_b above.  */
     int64_t ret = (int64_t)src1 * src2;
@@ -321,8 +321,7 @@ static int64_t do_sat128_d(Int128 r)
     return ls;
 }
 
-static int64_t do_sqrdmlah_d(int64_t n, int64_t m, int64_t a,
-                             bool neg, bool round)
+int64_t do_sqrdmlah_d(int64_t n, int64_t m, int64_t a, bool neg, bool round)
 {
     uint64_t l, h;
     Int128 r, t;
-- 
2.25.1

