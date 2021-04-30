Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp495734lfg;
        Fri, 30 Apr 2021 14:07:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzG6LFfgv2A6wAoWlRBh3+1v3K6HT0GMCjuXZV2cB7eNV6eU/FD60IFJgH+KsDqo4hvIRRp
X-Received: by 2002:a92:d305:: with SMTP id x5mr5536726ila.205.1619816870701;
        Fri, 30 Apr 2021 14:07:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1619816870; cv=none;
        d=google.com; s=arc-20160816;
        b=YfU3WGgrvYirqzEi3ennoMWEAZ81QUShmtCtin1171UhM6dGaE9m4Wkb9u+zT++qz2
         9KsH3Gua9KPnYUhBbRDJu/m1WLCogMvBafa+x31TVvkOYEVvYWIzb6OFmo52jvuC0N/w
         Ag0Psbn8U/MJxjerrFgDQdwFvyaewjuJkTiWtnxF0ED3tuULDKqujVQJKl7S26t9Rhp1
         a5H4xcOINNY2HQvfxCUpgWTDm5DieLwVnUXIyWJpkUDA/SyWOMzDzpWHztUeqrH6q+VS
         lbNb9S7yFjfRwjGOgZF6H4fT9bb7N1C9bFwEmkHkh42wCrO7hOo0Vqvks0AmQ/d0k7Fo
         us+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=FrURjPokXJn/LkVchLyJhBRsfW1xgk5qHq2OmKbnw0s=;
        b=uXGuMo7up9WhbEA1ZRG5UpPAlVfGqXUdTxcgog4mUegH9suxIWvNHpjDmLaDrmyWn8
         Gxxuuy2G04ahiHSU1MADGT1lT1QO+j2Bdqt03UKZ31TjgZ2EOKKjBDp6BI+vmvNR68lW
         Ums++Ac4kAvJiQtsFnGe7YMOE2bv+QeDTOQJQZOaMi1G3hqf+jbAt/L85FrOdaD+LupU
         F33YxAbCeAs2CBJ3eKEMk0X02FvPbbm3UoQKO7YI1xfXVog+db1cmILuAIzwefcGBaz1
         TMDQNMV+YV/0JV25pIwgg+QCT4/aRxGeHPDNEvRu2IjdVzSf48Z4eOaL8QZikZcDn2i/
         BuqA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="f9Kf0r/w";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g17si4894918ioo.77.2021.04.30.14.07.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 30 Apr 2021 14:07:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="f9Kf0r/w";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lcaMY-0001E3-0S
	for alex.bennee@linaro.org; Fri, 30 Apr 2021 17:07:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53270)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcZmE-0004Hj-93
 for qemu-arm@nongnu.org; Fri, 30 Apr 2021 16:30:18 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635]:34699)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcZlm-0007jX-2O
 for qemu-arm@nongnu.org; Fri, 30 Apr 2021 16:30:15 -0400
Received: by mail-pl1-x635.google.com with SMTP id h7so8668597plt.1
 for <qemu-arm@nongnu.org>; Fri, 30 Apr 2021 13:29:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FrURjPokXJn/LkVchLyJhBRsfW1xgk5qHq2OmKbnw0s=;
 b=f9Kf0r/wjJqlxw7JoVwHti6r8rOrzc/Kq43XNSKoqA5CK3AYc9hsB5kowpHVtrrVfQ
 uVYThXnZfV1DY97K2kaAiW9MENeyyNA7jLVRscVypq+YtaYyuBZj1NeYkKZS4Rld6XnV
 RI5jxrNoiWKr9nAQr7MmHLW+OgFsbN/7MSaXoYyL1GskQDNnkMyVDaypiwdaxMo2y/IZ
 6UtUPtJP+TCzVeAjHHi5aFpFdD3mPa8E5qTKS/aF2WV9xzg5taj1+pUCH2lxtF4cHnep
 VDm+Lh+yjfOwVXwoNGNY163KhZtLeoGcsP2NtkFU8HCSKPviVNpYF2BW12+kkDBGTwIf
 +0eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FrURjPokXJn/LkVchLyJhBRsfW1xgk5qHq2OmKbnw0s=;
 b=MYUYTJUsH2yMfyESDNYM0cJ6kyCYVKMWUoA7pzmQjL6h4wje3Ttn15Fdsiqlvz0Q5G
 srTthJNCGHgIkJv4xq9kHpyWkitKuOQ9a3FZtMRVPg3i/719iz8z3fI30SsqQGpjkQGs
 78rVVKP7fEYXAPkbaJPSEZNdhwrYneurm3rqRhhUFedwZzdlM049s/TwwhEdTNVLE9ng
 hFjEm5LKxJ/KwUHaCCJK5YONH1K7ghgwPABgD3vG0x/UE8Uh8VTgmGR1H7Wgit4XSom5
 BQUxZ/L8CGM5O9MRjPPyRkBVAWQB4NMdq3NX0+PrDj9aT5EVm8k8mDK34Jx+/FUDCeKy
 758g==
X-Gm-Message-State: AOAM531S7XpGWXG/sVgmHLZ9iorFpoMTSkcvFEOWZUIMlNe0mfifeWwh
 USk9+wyz3+sY7zCmSjAlWrZobk7LAcacyg==
X-Received: by 2002:a17:90a:8410:: with SMTP id
 j16mr7044250pjn.120.1619814585348; 
 Fri, 30 Apr 2021 13:29:45 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id q23sm3788781pgt.42.2021.04.30.13.29.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Apr 2021 13:29:45 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 55/82] target/arm: Implement SVE2 saturating multiply-add
 (indexed)
Date: Fri, 30 Apr 2021 13:25:43 -0700
Message-Id: <20210430202610.1136687-56-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210430202610.1136687-1-richard.henderson@linaro.org>
References: <20210430202610.1136687-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x635.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: k2SthbGMjRqX

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-sve.h    |  9 +++++++++
 target/arm/sve.decode      | 18 ++++++++++++++++++
 target/arm/sve_helper.c    | 30 ++++++++++++++++++++++++++++++
 target/arm/translate-sve.c | 32 ++++++++++++++++++++++++--------
 4 files changed, 81 insertions(+), 8 deletions(-)

diff --git a/target/arm/helper-sve.h b/target/arm/helper-sve.h
index fe67574741..08398800bd 100644
--- a/target/arm/helper-sve.h
+++ b/target/arm/helper-sve.h
@@ -2679,3 +2679,12 @@ DEF_HELPER_FLAGS_5(sve2_sqrdmlsh_idx_s, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_5(sve2_sqrdmlsh_idx_d, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_5(sve2_sqdmlal_idx_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_sqdmlal_idx_d, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_sqdmlsl_idx_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_sqdmlsl_idx_d, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index 1956d96ad5..8d2709d3cc 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -30,6 +30,8 @@
 %size_23        23:2
 %dtype_23_13    23:2 13:2
 %index3_22_19   22:1 19:2
+%index3_19_11   19:2 11:1
+%index2_20_11   20:1 11:1
 
 # A combination of tsz:imm3 -- extract esize.
 %tszimm_esz     22:2 5:5 !function=tszimm_esz
@@ -261,6 +263,12 @@
 @rrxr_1         ........ .. . index:1 rm:4 ...... rn:5 rd:5 \
                 &rrxr_esz ra=%reg_movprfx
 
+# Three registers and a scalar by N-bit index, alternate
+@rrxr_3a        ........ .. ... rm:3 ...... rn:5 rd:5 \
+                &rrxr_esz ra=%reg_movprfx index=%index3_19_11
+@rrxr_2a        ........ .. ..  rm:4 ...... rn:5 rd:5 \
+                &rrxr_esz ra=%reg_movprfx index=%index2_20_11
+
 ###########################################################################
 # Instruction patterns.  Grouped according to the SVE encodingindex.xhtml.
 
@@ -799,6 +807,16 @@ SQRDMLSH_zzxz_h 01000100 0. 1 ..... 000101 ..... .....   @rrxr_3 esz=1
 SQRDMLSH_zzxz_s 01000100 10 1 ..... 000101 ..... .....   @rrxr_2 esz=2
 SQRDMLSH_zzxz_d 01000100 11 1 ..... 000101 ..... .....   @rrxr_1 esz=3
 
+# SVE2 saturating multiply-add (indexed)
+SQDMLALB_zzxw_s 01000100 10 1 ..... 0010.0 ..... .....   @rrxr_3a esz=2
+SQDMLALB_zzxw_d 01000100 11 1 ..... 0010.0 ..... .....   @rrxr_2a esz=3
+SQDMLALT_zzxw_s 01000100 10 1 ..... 0010.1 ..... .....   @rrxr_3a esz=2
+SQDMLALT_zzxw_d 01000100 11 1 ..... 0010.1 ..... .....   @rrxr_2a esz=3
+SQDMLSLB_zzxw_s 01000100 10 1 ..... 0011.0 ..... .....   @rrxr_3a esz=2
+SQDMLSLB_zzxw_d 01000100 11 1 ..... 0011.0 ..... .....   @rrxr_2a esz=3
+SQDMLSLT_zzxw_s 01000100 10 1 ..... 0011.1 ..... .....   @rrxr_3a esz=2
+SQDMLSLT_zzxw_d 01000100 11 1 ..... 0011.1 ..... .....   @rrxr_2a esz=3
+
 # SVE2 integer multiply (indexed)
 MUL_zzx_h       01000100 0. 1 ..... 111110 ..... .....   @rrx_3 esz=1
 MUL_zzx_s       01000100 10 1 ..... 111110 ..... .....   @rrx_2 esz=2
diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index fc4a943029..c43c38044b 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -1530,6 +1530,36 @@ DO_ZZXZ(sve2_sqrdmlsh_idx_d, int64_t,   , DO_SQRDMLSH_D)
 
 #undef DO_ZZXZ
 
+#define DO_ZZXW(NAME, TYPEW, TYPEN, HW, HN, OP) \
+void HELPER(NAME)(void *vd, void *vn, void *vm, void *va, uint32_t desc)  \
+{                                                                         \
+    intptr_t i, j, oprsz = simd_oprsz(desc);                              \
+    intptr_t sel = extract32(desc, SIMD_DATA_SHIFT, 1) * sizeof(TYPEN);   \
+    intptr_t idx = extract32(desc, SIMD_DATA_SHIFT + 1, 3) * sizeof(TYPEN); \
+    for (i = 0; i < oprsz; i += 16) {                                     \
+        TYPEW mm = *(TYPEN *)(vm + i + idx);                              \
+        for (j = 0; j < 16; j += sizeof(TYPEW)) {                         \
+            TYPEW nn = *(TYPEN *)(vn + HN(i + j + sel));                  \
+            TYPEW aa = *(TYPEW *)(va + HW(i + j));                        \
+            *(TYPEW *)(vd + HW(i + j)) = OP(nn, mm, aa);                  \
+        }                                                                 \
+    }                                                                     \
+}
+
+#define DO_SQDMLAL_S(N, M, A)  DO_SQADD_S(A, do_sqdmull_s(N, M))
+#define DO_SQDMLAL_D(N, M, A)  do_sqadd_d(A, do_sqdmull_d(N, M))
+
+DO_ZZXW(sve2_sqdmlal_idx_s, int32_t, int16_t, H1_4, H1_2, DO_SQDMLAL_S)
+DO_ZZXW(sve2_sqdmlal_idx_d, int64_t, int32_t,     , H1_4, DO_SQDMLAL_D)
+
+#define DO_SQDMLSL_S(N, M, A)  DO_SQSUB_S(A, do_sqdmull_s(N, M))
+#define DO_SQDMLSL_D(N, M, A)  do_sqsub_d(A, do_sqdmull_d(N, M))
+
+DO_ZZXW(sve2_sqdmlsl_idx_s, int32_t, int16_t, H1_4, H1_2, DO_SQDMLSL_S)
+DO_ZZXW(sve2_sqdmlsl_idx_d, int64_t, int32_t,     , H1_4, DO_SQDMLSL_D)
+
+#undef DO_ZZXW
+
 #define DO_BITPERM(NAME, TYPE, OP) \
 void HELPER(NAME)(void *vd, void *vn, void *vm, uint32_t desc) \
 {                                                              \
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index d9d444d3ca..1915f68af6 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -3817,21 +3817,21 @@ static bool trans_DOT_zzzz(DisasContext *s, arg_DOT_zzzz *a)
  * SVE Multiply - Indexed
  */
 
-static bool do_zzxz_ool(DisasContext *s, arg_rrxr_esz *a,
-                        gen_helper_gvec_4 *fn)
+static bool do_zzxz_data(DisasContext *s, arg_rrxr_esz *a,
+                         gen_helper_gvec_4 *fn, int data)
 {
     if (fn == NULL) {
         return false;
     }
     if (sve_access_check(s)) {
-        gen_gvec_ool_zzzz(s, fn, a->rd, a->rn, a->rm, a->ra, a->index);
+        gen_gvec_ool_zzzz(s, fn, a->rd, a->rn, a->rm, a->ra, data);
     }
     return true;
 }
 
 #define DO_RRXR(NAME, FUNC) \
     static bool NAME(DisasContext *s, arg_rrxr_esz *a)  \
-    { return do_zzxz_ool(s, a, FUNC); }
+    { return do_zzxz_data(s, a, FUNC, a->index); }
 
 DO_RRXR(trans_SDOT_zzxw_s, gen_helper_gvec_sdot_idx_b)
 DO_RRXR(trans_SDOT_zzxw_d, gen_helper_gvec_sdot_idx_h)
@@ -3866,18 +3866,18 @@ DO_SVE2_RRX(trans_MUL_zzx_d, gen_helper_gvec_mul_idx_d)
 
 #undef DO_SVE2_RRX
 
-static bool do_sve2_zzxz_ool(DisasContext *s, arg_rrxr_esz *a,
-                             gen_helper_gvec_4 *fn)
+static bool do_sve2_zzxz_data(DisasContext *s, arg_rrxr_esz *a,
+                              gen_helper_gvec_4 *fn, int data)
 {
     if (!dc_isar_feature(aa64_sve2, s)) {
         return false;
     }
-    return do_zzxz_ool(s, a, fn);
+    return do_zzxz_data(s, a, fn, data);
 }
 
 #define DO_SVE2_RRXR(NAME, FUNC) \
     static bool NAME(DisasContext *s, arg_rrxr_esz *a)  \
-    { return do_sve2_zzxz_ool(s, a, FUNC); }
+    { return do_sve2_zzxz_data(s, a, FUNC, a->index); }
 
 DO_SVE2_RRXR(trans_MLA_zzxz_h, gen_helper_gvec_mla_idx_h)
 DO_SVE2_RRXR(trans_MLA_zzxz_s, gen_helper_gvec_mla_idx_s)
@@ -3897,6 +3897,22 @@ DO_SVE2_RRXR(trans_SQRDMLSH_zzxz_d, gen_helper_sve2_sqrdmlsh_idx_d)
 
 #undef DO_SVE2_RRXR
 
+#define DO_SVE2_RRXR_TB(NAME, FUNC, TOP) \
+    static bool NAME(DisasContext *s, arg_rrxr_esz *a)  \
+    { return do_sve2_zzxz_data(s, a, FUNC, (a->index << 1) | TOP); }
+
+DO_SVE2_RRXR_TB(trans_SQDMLALB_zzxw_s, gen_helper_sve2_sqdmlal_idx_s, false)
+DO_SVE2_RRXR_TB(trans_SQDMLALB_zzxw_d, gen_helper_sve2_sqdmlal_idx_d, false)
+DO_SVE2_RRXR_TB(trans_SQDMLALT_zzxw_s, gen_helper_sve2_sqdmlal_idx_s, true)
+DO_SVE2_RRXR_TB(trans_SQDMLALT_zzxw_d, gen_helper_sve2_sqdmlal_idx_d, true)
+
+DO_SVE2_RRXR_TB(trans_SQDMLSLB_zzxw_s, gen_helper_sve2_sqdmlsl_idx_s, false)
+DO_SVE2_RRXR_TB(trans_SQDMLSLB_zzxw_d, gen_helper_sve2_sqdmlsl_idx_d, false)
+DO_SVE2_RRXR_TB(trans_SQDMLSLT_zzxw_s, gen_helper_sve2_sqdmlsl_idx_s, true)
+DO_SVE2_RRXR_TB(trans_SQDMLSLT_zzxw_d, gen_helper_sve2_sqdmlsl_idx_d, true)
+
+#undef DO_SVE2_RRXR_TB
+
 /*
  *** SVE Floating Point Multiply-Add Indexed Group
  */
-- 
2.25.1

