Received: by 2002:ac2:5e6c:0:0:0:0:0 with SMTP id a12csp751816lfr;
        Fri, 16 Apr 2021 14:50:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJya0olF5z6NfRe/Zv1DXbjRq7h6nbrSpIYNaeL8hIl6BGBU9008wZUngBoUPUh5EZp9BAJ2
X-Received: by 2002:a5e:c911:: with SMTP id z17mr2489404iol.73.1618609806566;
        Fri, 16 Apr 2021 14:50:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618609806; cv=none;
        d=google.com; s=arc-20160816;
        b=HdaqQ2n6ahBV+YVIZ0ELl5J+mvVyHx0r9Diq42rA3CxYJWsJLkCCxfUTfy5MpGIriG
         Z5yoNZyxcCdPG4as57A19JZmvlq5HlHANDU9IXfGEBAOLIrO1wUJEqfZV8QwylP8tGYh
         btY6B1/4wdiEmCWJo4hiq2WJ0Vi3gJPoaxxfzbH6zTHg94Ovx07nEoMi9AtR7d8/B8hc
         obONyfcW52EuVJ1xO+RRrQp2CjRrcXtF2AXy9XSuTpePcwPGrrqgcKH+BKtfm1XaPXAM
         pTS4L/3cvNm9duxX3NCaobvcwo09OAjNSANcOQ7CIH5PexsyZp7r+G3zAhHFIKq8BGbn
         Mvxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=W45GPMZZVBfCUkRw+wO8T3FyCeab3ADQB7NYg/wbXMs=;
        b=DfXFGEDLmdPY3FmmssQjz/5vWFCwj1mIVu3JktSgGRPgZm1OnYLTdzFWnrlKzo74sn
         jxkMW/zOHoz//l1xFAed5qZEGFKVnYyybMYsz8KZNdQprMiTKUCl0aj0y/+3dfTevMEH
         FlJmkfvcaDIdtl+88VoI6vMS1vaVThsnZUGGcqh1TQ6EEJeqx2MEEn+CL+1IG6ErbNiI
         8Z5toPXX9+882/BTMG4fQWDL14pI9ATPjbv9eFoJEBz6Ood8fxf9T+YvXIjOyX5wbEFN
         mIC0+u4YRlBbxDbQaJL+IfNv1rHxFQ+HiDfALFTJRqBAIu0ZcrZTp33BSBk33NPWQv4L
         XhlQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="X//tLQZp";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z25si8023414iox.64.2021.04.16.14.50.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 16 Apr 2021 14:50:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="X//tLQZp";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38816 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lXWLl-0003tN-Ti
	for alex.bennee@linaro.org; Fri, 16 Apr 2021 17:50:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44384)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXVcp-0004zK-7L
 for qemu-arm@nongnu.org; Fri, 16 Apr 2021 17:03:39 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:56084)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXVcW-0001Lg-1L
 for qemu-arm@nongnu.org; Fri, 16 Apr 2021 17:03:38 -0400
Received: by mail-pj1-x1034.google.com with SMTP id s14so9823290pjl.5
 for <qemu-arm@nongnu.org>; Fri, 16 Apr 2021 14:03:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=W45GPMZZVBfCUkRw+wO8T3FyCeab3ADQB7NYg/wbXMs=;
 b=X//tLQZph5I8XN8zp2pUcW9bQ87S2TuVEtp4GuEOOhsD5uGlZ47AxPDNuurBvDdKSW
 PZoGAZrr89D+biUy3/3ahXFI2Dg3R73o4xbCX0tsc8W+767h7OzbUbffZg1CoDHbbL8s
 BoV7962avGjiFjm/KMg5vfRSJHRFpFVJ11QAM1a6j9BAjJ8jNuEW2v4Vork78Wl9TBRl
 i74YS4eZdSJVdKHv86yKuDHymzN9y1kSDo2JlMtFxZTxUpUDG3TfRqAWwto7Q3Rekrpr
 DxLknScU1W/+t3tjCFyt/RHjltOa+nlfji3VaY450t/InNLkRIpF7w4YhZCfh7OXtCRQ
 MReA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=W45GPMZZVBfCUkRw+wO8T3FyCeab3ADQB7NYg/wbXMs=;
 b=Xk9TOR3LeSPJuc8ZAEPGu30Hkio/mjyP4Fs9XKI+Ibw3XtOhgu6cqh6iSySdRmb8mO
 FRWjic/rrK9xy8v2/KACMlxU1GCf1tbACf5l9n1nXjMbwTWHz1Rm4yHr+fKPDUsvJbxD
 HQRoZgBcClOdOLMLoKK9igUwasHQUUYBQEPnh4RChVuVeGbF4/6Nx/AKVWjdhvOMH3LT
 oypiuNVaItEDDasB/06SzORMj5VBHjNoZqZLb07s22xarOrqhdGX5YYxdK1kUQx1OTZj
 0vvoaEZ0eME/BW81Oxj8tgXwX47+eSIodVxS0SFt8g6ORG2jU7aZ0ZqblPC+6XYtn25w
 rD1A==
X-Gm-Message-State: AOAM533uK1MxvzfS7n2MEqFFgg3QrtVzMxgzEmJiJpuhEzcFYoQKm3XT
 sBywal2o2ZCJToQ/P5VRTWjOdA==
X-Received: by 2002:a17:90a:ee95:: with SMTP id
 i21mr12159726pjz.160.1618606998856; 
 Fri, 16 Apr 2021 14:03:18 -0700 (PDT)
Received: from localhost.localdomain ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id m15sm5920640pjz.36.2021.04.16.14.03.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Apr 2021 14:03:18 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 37/81] target/arm: Implement SVE2 complex integer
 multiply-add
Date: Fri, 16 Apr 2021 14:01:56 -0700
Message-Id: <20210416210240.1591291-38-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210416210240.1591291-1-richard.henderson@linaro.org>
References: <20210416210240.1591291-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
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
X-TUID: uOtlrnS18YQb

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

