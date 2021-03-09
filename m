Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp2956189lfg;
        Tue, 9 Mar 2021 08:22:23 -0800 (PST)
X-Received: by 2002:a05:6830:1bc2:: with SMTP id v2mr19069608ota.245.1615306943253;
        Tue, 09 Mar 2021 08:22:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1615306943; cv=none;
        d=google.com; s=arc-20160816;
        b=n7KJ4akYPN8ap6fBQJ0g6Gy8xrrj5U1P2e9pTuicazpqxdUWsWJ6Ur83a5xzSxLv4V
         GbyeJXGXe8Pt3btXOx8LOUn+UbJyhPCFZCH08ZSoJap1Khwb4cx6YfDsyuk/UTNkw4vR
         CoESnOgRpGASZHHk3iEAv+8e2Mn2Vdryi4NSgK+8nNPzl9fg7maZlPc9ivIilDoeeOjq
         MnHrzkm/hj5TbPLT4sWGWYZ0j73apzbsR/wMV0wT38t5cP4PY5FeMpgUuMccL8q+obH2
         9S4d84xfiumh2iGekkVCgNromdsD68Ok5+mZuOTVAVyGcY7oDmv1vsH1fy4SqPxIIYdf
         nxSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=LG30+AJqxoFo0xo1KAMI/CixIM8aZhWQwPJGMcWeV98=;
        b=HNMq56dNcoR4QBpKtK9sPwtwDOlKeWkRRyg9UsD46TwyGWYfgOwCWEdO02rGQfLzXd
         DlJNbnKIDYVzrRkDOo9fmPu96nmeVWJeoZFkFKxI8En+A1jDnLaxIcKW3zlR8xvR25b/
         aU7uF1dAoJQq2MjwyrmCnr3WFnoqqp3R7W8oqG/ENrxK8SNUxwhffya/U8QfsPe0FrDu
         m0kvQg9sYC93kE+yfz/+ydYsGO8pM5A7p6GRCW1ZNUS5JwJZQJx8M6+GUkCQpw+wRXtn
         gjzT6lzDXeamYW875vjqbCpTfXtb9NzZA1Gx41jnl8/s+KaDwoM71tB6BXI2jZzPeM13
         uvsg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=arjvTj6t;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id l9sor676192otk.131.2021.03.09.08.22.23
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 09 Mar 2021 08:22:23 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=arjvTj6t;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=LG30+AJqxoFo0xo1KAMI/CixIM8aZhWQwPJGMcWeV98=;
        b=arjvTj6tHpYeYB1gVsgbRtL9+kH0IVBQtAnBJift33UPd0Eh/Onxhs2yK1c643utgg
         B8eO3PHNv+wNrLRuDKaXP6/bIkNbDh2AmQ7CzdabCJqHbMf3v8LzjRYNFrPMHYk+KIIj
         ODspbC3FPQ0ixNOLN0k5PSpwb44dPPWVGrF1zQ6C7CC96hPfbiVK2dvVTkI/tQ1Xt1eh
         3XmcnYY7x0fEO0a2+d3o2AdIegE8p+Hy4rPuCcfM2KACnb5pwzuCHje+UrJNxzCndkr2
         wLZoNA7L+HCz9ZNosMS+g8+Uwu8WfpB8DZk/U52ywS5qkxK64EFbqIB3sSE+uaYI5llo
         fq1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LG30+AJqxoFo0xo1KAMI/CixIM8aZhWQwPJGMcWeV98=;
        b=Y0zQIpnEnLAMLOUKeVisaaCImOb3Jkg5mCkvU6TzmyhRq5l1z5BxtY0oqdmqb5bQch
         yh0O0PWtUwAojm//gcD+YoTE7ApVSppk6/TbRxuaO+mgOuXYzh8/NH8TFSuVlfsa3Fkb
         xyBFfs52mQkl4W+kQkPwJNjh2lkOF2Y25L6Xbiu4a38eL3bW0LTAL+YjbemTT2qq33qz
         aoUbHXsGNYVrL4teeLRJ8mgq1aKfoVM/dM1SKIVlzjFPZWfGp8tI9QpOIwRaumInhG9v
         T5fc23vA+aKAZ730HaefucB5kmPYMSid7WrgEj/d3lk3qm8I97bIYEr7JjdoyBL5PjTz
         dZsw==
X-Gm-Message-State: AOAM532nKOLJOIOzBGnZXk0BLIXgTgXC6VnFEBx5qjSgO3bkA/QvkasO
	c1yPl7A64ni2sp+zJiYR32xBHewj0kFynT/MJ/4=
X-Google-Smtp-Source: ABdhPJzEWPC10xNIvOLlXU4BF9DHg/1V65gcb50gvy/YDTlcnFl+XDaO8RdQn41tJq0E3biVzlUpbQ==
X-Received: by 2002:a9d:3c1:: with SMTP id f59mr13381622otf.330.1615306942778;
        Tue, 09 Mar 2021 08:22:22 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net. [187.189.51.144])
        by smtp.gmail.com with ESMTPSA id u19sm3470898ote.15.2021.03.09.08.22.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Mar 2021 08:22:22 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	qemu-arm@nongnu.org,
	alex.bennee@linaro.org
Subject: [PATCH v4 61/78] target/arm: Implement SVE2 complex integer multiply-add (indexed)
Date: Tue,  9 Mar 2021 08:20:24 -0800
Message-Id: <20210309162041.23124-62-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210309162041.23124-1-richard.henderson@linaro.org>
References: <20210309162041.23124-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: vzbZxWWOcIJd

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-sve.h    |   9 +++
 target/arm/sve.decode      |  12 ++++
 target/arm/sve_helper.c    | 142 +++++++++++++++++++++++++++++++------
 target/arm/translate-sve.c |  38 +++++++---
 4 files changed, 169 insertions(+), 32 deletions(-)

diff --git a/target/arm/helper-sve.h b/target/arm/helper-sve.h
index 5e3a2922c8..0243ac32ec 100644
--- a/target/arm/helper-sve.h
+++ b/target/arm/helper-sve.h
@@ -2715,3 +2715,12 @@ DEF_HELPER_FLAGS_5(sve2_umlsl_idx_s, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_5(sve2_umlsl_idx_d, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_5(sve2_cmla_idx_h, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_cmla_idx_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_sqrdcmlah_idx_h, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_sqrdcmlah_idx_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index c77adf8ca6..9117196352 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -825,6 +825,18 @@ SQDMLSLB_zzxw_d 01000100 .. 1 ..... 0011.0 ..... .....          @rrxw_d
 SQDMLSLT_zzxw_s 01000100 .. 1 ..... 0011.1 ..... .....          @rrxw_s
 SQDMLSLT_zzxw_d 01000100 .. 1 ..... 0011.1 ..... .....          @rrxw_d
 
+# SVE2 complex integer multiply-add (indexed)
+CMLA_zzxz_h     01000100 10 1 index:2 rm:3 0110 rot:2 rn:5 rd:5 \
+                ra=%reg_movprfx
+CMLA_zzxz_s     01000100 11 1 index:1 rm:4 0110 rot:2 rn:5 rd:5 \
+                ra=%reg_movprfx
+
+# SVE2 complex saturating integer multiply-add (indexed)
+SQRDCMLAH_zzxz_h  01000100 10 1 index:2 rm:3 0111 rot:2 rn:5 rd:5 \
+                  ra=%reg_movprfx
+SQRDCMLAH_zzxz_s  01000100 11 1 index:1 rm:4 0111 rot:2 rn:5 rd:5 \
+                  ra=%reg_movprfx
+
 # SVE2 multiply-add long (indexed)
 SMLALB_zzxw_s   01000100 .. 1 ..... 1000.0 ..... .....          @rrxw_s
 SMLALB_zzxw_d   01000100 .. 1 ..... 1000.0 ..... .....          @rrxw_d
diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index c64321368f..13f40acd88 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -1466,34 +1466,132 @@ void HELPER(NAME)(void *vd, void *vn, void *vm, void *va, uint32_t desc) \
     }                                                           \
 }
 
-#define do_cmla(N, M, A, S) (A + (N * M) * (S ? -1 : 1))
+static int8_t do_cmla_b(int8_t n, int8_t m, int8_t a, bool sub)
+{
+    return n * m * (sub ? -1 : 1) + a;
+}
 
-DO_CMLA(sve2_cmla_zzzz_b, uint8_t, H1, do_cmla)
-DO_CMLA(sve2_cmla_zzzz_h, uint16_t, H2, do_cmla)
-DO_CMLA(sve2_cmla_zzzz_s, uint32_t, H4, do_cmla)
-DO_CMLA(sve2_cmla_zzzz_d, uint64_t,   , do_cmla)
+static int16_t do_cmla_h(int16_t n, int16_t m, int16_t a, bool sub)
+{
+    return n * m * (sub ? -1 : 1) + a;
+}
 
-#define DO_SQRDMLAH_B(N, M, A, S) \
-    do_sqrdmlah_b(N, M, A, S, true)
-#define DO_SQRDMLAH_H(N, M, A, S) \
-    ({ uint32_t discard; do_sqrdmlah_h(N, M, A, S, true, &discard); })
-#define DO_SQRDMLAH_S(N, M, A, S) \
-    ({ uint32_t discard; do_sqrdmlah_s(N, M, A, S, true, &discard); })
-#define DO_SQRDMLAH_D(N, M, A, S) \
-    do_sqrdmlah_d(N, M, A, S, true)
+static int32_t do_cmla_s(int32_t n, int32_t m, int32_t a, bool sub)
+{
+    return n * m * (sub ? -1 : 1) + a;
+}
 
-DO_CMLA(sve2_sqrdcmlah_zzzz_b, int8_t, H1, DO_SQRDMLAH_B)
-DO_CMLA(sve2_sqrdcmlah_zzzz_h, int16_t, H2, DO_SQRDMLAH_H)
-DO_CMLA(sve2_sqrdcmlah_zzzz_s, int32_t, H4, DO_SQRDMLAH_S)
-DO_CMLA(sve2_sqrdcmlah_zzzz_d, int64_t,   , DO_SQRDMLAH_D)
+static int64_t do_cmla_d(int64_t n, int64_t m, int64_t a, bool sub)
+{
+    return n * m * (sub ? -1 : 1) + a;
+}
+
+DO_CMLA(sve2_cmla_zzzz_b, uint8_t, H1, do_cmla_b)
+DO_CMLA(sve2_cmla_zzzz_h, uint16_t, H2, do_cmla_h)
+DO_CMLA(sve2_cmla_zzzz_s, uint32_t, H4, do_cmla_s)
+DO_CMLA(sve2_cmla_zzzz_d, uint64_t,   , do_cmla_d)
+
+static int8_t do_sqrdcmlah_b(int8_t n, int8_t m, int8_t a, bool sub)
+{
+    return do_sqrdmlah_b(n, m, a, sub, true);
+}
+
+static int16_t do_sqrdcmlah_h(int16_t n, int16_t m, int16_t a, bool sub)
+{
+    uint32_t discard;
+    return do_sqrdmlah_h(n, m, a, sub, true, &discard);
+}
+
+static int32_t do_sqrdcmlah_s(int32_t n, int32_t m, int32_t a, bool sub)
+{
+    uint32_t discard;
+    return do_sqrdmlah_s(n, m, a, sub, true, &discard);
+}
+
+static int64_t do_sqrdcmlah_d(int64_t n, int64_t m, int64_t a, bool sub)
+{
+    return do_sqrdmlah_d(n, m, a, sub, true);
+}
+
+DO_CMLA(sve2_sqrdcmlah_zzzz_b, int8_t, H1, do_sqrdcmlah_b)
+DO_CMLA(sve2_sqrdcmlah_zzzz_h, int16_t, H2, do_sqrdcmlah_h)
+DO_CMLA(sve2_sqrdcmlah_zzzz_s, int32_t, H4, do_sqrdcmlah_s)
+DO_CMLA(sve2_sqrdcmlah_zzzz_d, int64_t,   , do_sqrdcmlah_d)
 
-#undef DO_SQRDMLAH_B
-#undef DO_SQRDMLAH_H
-#undef DO_SQRDMLAH_S
-#undef DO_SQRDMLAH_D
-#undef do_cmla
 #undef DO_CMLA
 
+static void do_cmla_idx_h(int16_t *d, int16_t *n, int16_t *m,
+                          int16_t *a, uint32_t desc,
+                          int16_t (*fn)(int16_t, int16_t, int16_t, bool))
+{
+    intptr_t i, j, oprsz = simd_oprsz(desc);
+    int rot = extract32(desc, SIMD_DATA_SHIFT, 2);
+    int idx = extract32(desc, SIMD_DATA_SHIFT + 2, 2) * 2;
+    int sel_a = rot & 1, sel_b = sel_a ^ 1;
+    bool sub_r = rot == 1 || rot == 2;
+    bool sub_i = rot >= 2;
+
+    for (i = 0; i < oprsz / 2; i += 16 / 2) {
+        int16_t elt2_a = m[H2(i + idx + sel_a)];
+        int16_t elt2_b = m[H2(i + idx + sel_b)];
+
+        for (j = 0; j < 16 / 2; j += 2) {
+            int16_t elt1_a = n[H2(i + j + sel_a)];
+
+            d[H2(i + j)] = fn(elt1_a, elt2_a, a[H2(i + j)], sub_r);
+            d[H2(i + j + 1)] = fn(elt1_a, elt2_b, a[H2(i + j + 1)], sub_i);
+        }
+    }
+}
+
+void HELPER(sve2_cmla_idx_h)(void *vd, void *vn, void *vm,
+                             void *va, uint32_t desc)
+{
+    do_cmla_idx_h(vd, vn, vm, va, desc, do_cmla_h);
+}
+
+void HELPER(sve2_sqrdcmlah_idx_h)(void *vd, void *vn, void *vm,
+                                  void *va, uint32_t desc)
+{
+    do_cmla_idx_h(vd, vn, vm, va, desc, do_sqrdcmlah_h);
+}
+
+static void do_cmla_idx_s(int32_t *d, int32_t *n, int32_t *m,
+                          int32_t *a, uint32_t desc,
+                          int32_t (*fn)(int32_t, int32_t, int32_t, bool))
+{
+    intptr_t i, j, oprsz = simd_oprsz(desc);
+    int rot = extract32(desc, SIMD_DATA_SHIFT, 2);
+    int idx = extract32(desc, SIMD_DATA_SHIFT + 2, 2) * 2;
+    int sel_a = rot & 1, sel_b = sel_a ^ 1;
+    bool sub_r = rot == 1 || rot == 2;
+    bool sub_i = rot >= 2;
+
+    for (i = 0; i < oprsz / 4; i += 16 / 4) {
+        int32_t elt2_a = m[H4(i + idx + sel_a)];
+        int32_t elt2_b = m[H4(i + idx + sel_b)];
+
+        for (j = 0; j < 16 / 4; j += 2) {
+            int32_t elt1_a = n[H4(i + j + sel_a)];
+
+            d[H4(i + j)] = fn(elt1_a, elt2_a, a[H4(i + j)], sub_r);
+            d[H4(i + j + 1)] = fn(elt1_a, elt2_b, a[H4(i + j + 1)], sub_i);
+        }
+    }
+}
+
+void HELPER(sve2_cmla_idx_s)(void *vd, void *vn, void *vm,
+                             void *va, uint32_t desc)
+{
+    do_cmla_idx_s(vd, vn, vm, va, desc, do_cmla_s);
+}
+
+void HELPER(sve2_sqrdcmlah_idx_s)(void *vd, void *vn, void *vm,
+                                  void *va, uint32_t desc)
+{
+    do_cmla_idx_s(vd, vn, vm, va, desc, do_sqrdcmlah_s);
+}
+
 #define DO_ZZXZ(NAME, TYPE, H, OP) \
 void HELPER(NAME)(void *vd, void *vn, void *vm, void *va, uint32_t desc) \
 {                                                                       \
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 6a6698bfe9..371e8cf05a 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -3817,21 +3817,21 @@ static bool trans_DOT_zzzz(DisasContext *s, arg_DOT_zzzz *a)
  * SVE Multiply - Indexed
  */
 
-static bool do_zzxz_data(DisasContext *s, arg_rrxr_esz *a,
+static bool do_zzxz_data(DisasContext *s, int rd, int rn, int rm, int ra,
                          gen_helper_gvec_4 *fn, int data)
 {
     if (fn == NULL) {
         return false;
     }
     if (sve_access_check(s)) {
-        gen_gvec_ool_zzzz(s, fn, a->rd, a->rn, a->rm, a->ra, data);
+        gen_gvec_ool_zzzz(s, fn, rd, rn, rm, ra, data);
     }
     return true;
 }
 
 #define DO_RRXR(NAME, FUNC) \
     static bool NAME(DisasContext *s, arg_rrxr_esz *a)  \
-    { return do_zzxz_data(s, a, FUNC, a->index); }
+    { return do_zzxz_data(s, a->rd, a->rn, a->rm, a->ra, FUNC, a->index); }
 
 DO_RRXR(trans_SDOT_zzxw_s, gen_helper_gvec_sdot_idx_b)
 DO_RRXR(trans_SDOT_zzxw_d, gen_helper_gvec_sdot_idx_h)
@@ -3895,18 +3895,18 @@ DO_SVE2_RRX_TB(trans_SQDMULLT_zzx_d, gen_helper_sve2_sqdmull_idx_d, true)
 
 #undef DO_SVE2_RRX_TB
 
-static bool do_sve2_zzxz_data(DisasContext *s, arg_rrxr_esz *a,
-                              gen_helper_gvec_4 *fn, int data)
+static bool do_sve2_zzxz_data(DisasContext *s, int rd, int rn, int rm,
+                              int ra, gen_helper_gvec_4 *fn, int data)
 {
     if (!dc_isar_feature(aa64_sve2, s)) {
         return false;
     }
-    return do_zzxz_data(s, a, fn, data);
+    return do_zzxz_data(s, rd, rn, rm, ra, fn, data);
 }
 
 #define DO_SVE2_RRXR(NAME, FUNC) \
-    static bool NAME(DisasContext *s, arg_rrxr_esz *a)  \
-    { return do_sve2_zzxz_data(s, a, FUNC, a->index); }
+static bool NAME(DisasContext *s, arg_rrxr_esz *a)  \
+{ return do_sve2_zzxz_data(s, a->rd, a->rn, a->rm, a->ra, FUNC, a->index); }
 
 DO_SVE2_RRXR(trans_MLA_zzxz_h, gen_helper_gvec_mla_idx_h)
 DO_SVE2_RRXR(trans_MLA_zzxz_s, gen_helper_gvec_mla_idx_s)
@@ -3927,8 +3927,11 @@ DO_SVE2_RRXR(trans_SQRDMLSH_zzxz_d, gen_helper_sve2_sqrdmlsh_idx_d)
 #undef DO_SVE2_RRXR
 
 #define DO_SVE2_RRXR_TB(NAME, FUNC, TOP) \
-    static bool NAME(DisasContext *s, arg_rrxr_esz *a)  \
-    { return do_sve2_zzxz_data(s, a, FUNC, (a->index << 1) | TOP); }
+static bool NAME(DisasContext *s, arg_rrxr_esz *a)           \
+{                                                            \
+    return do_sve2_zzxz_data(s, a->rd, a->rn, a->rm, a->ra,  \
+                             FUNC, (a->index << 1) | TOP);   \
+}
 
 DO_SVE2_RRXR_TB(trans_SQDMLALB_zzxw_s, gen_helper_sve2_sqdmlal_idx_s, false)
 DO_SVE2_RRXR_TB(trans_SQDMLALB_zzxw_d, gen_helper_sve2_sqdmlal_idx_d, false)
@@ -3962,6 +3965,21 @@ DO_SVE2_RRXR_TB(trans_UMLSLT_zzxw_d, gen_helper_sve2_umlsl_idx_d, true)
 
 #undef DO_SVE2_RRXR_TB
 
+#define DO_SVE2_RRXR_ROT(NAME, FUNC) \
+static bool trans_##NAME(DisasContext *s, arg_##NAME *a)       \
+{                                                              \
+    return do_sve2_zzxz_data(s, a->rd, a->rn, a->rm, a->ra,    \
+                             FUNC, (a->index << 2) | a->rot);  \
+}
+
+DO_SVE2_RRXR_ROT(CMLA_zzxz_h, gen_helper_sve2_cmla_idx_h)
+DO_SVE2_RRXR_ROT(CMLA_zzxz_s, gen_helper_sve2_cmla_idx_s)
+
+DO_SVE2_RRXR_ROT(SQRDCMLAH_zzxz_h, gen_helper_sve2_sqrdcmlah_idx_h)
+DO_SVE2_RRXR_ROT(SQRDCMLAH_zzxz_s, gen_helper_sve2_sqrdcmlah_idx_s)
+
+#undef DO_SVE2_RRXR_ROT
+
 /*
  *** SVE Floating Point Multiply-Add Indexed Group
  */
-- 
2.25.1
