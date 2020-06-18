Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1286797lfm;
        Wed, 17 Jun 2020 22:12:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzH+OUWUnBALgZWXHfRSMy43T4tDVUikBERKanzCpGagHAdCl4ihwbQ4NniXkJb5J6cbvp4
X-Received: by 2002:a5b:808:: with SMTP id x8mr3551280ybp.134.1592457174421;
        Wed, 17 Jun 2020 22:12:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592457174; cv=none;
        d=google.com; s=arc-20160816;
        b=bOlZ/x8naKt433lG0Pu+bnyqmQE63L8wE3XJXLLvbuV+a6ywzjslLzClf5AbPn+HJd
         w7+3ELsPXGPHzyf3NEHy1H3wdFC2Hq1wwcepXTvEDmZ1Cn7rtSFIaNCftyHjJn3HKox4
         lrxij76+qfvrB/wUe1XDgp/VtjayiWLb1lSuG5cj9QvU9bdqOfjWq99jQmxMhGMSj0+7
         7jyCnlQqCQhudspyaBRKBF2hcrqNlOEL8LkC1lvwQ0jGExM89woukYnpCUjBUcy2wp1P
         VCvQIQhJuR2ONEp4VqN/91jteuPr2QSrMMsh+hQeWjHtRGueMRZr9HjgHKWVg90DZIhB
         X2Zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=uvFEvF/p8/7miI8vDptcp/r8cSHt9E6GhBE3KGgZk6E=;
        b=tR3UJgQk+n0Mnfow9N+UrepD5wpQYSuopnHvBCRglNLhsRCVZZMbpTxuBuft5ihfwP
         g3cjAH7dESNxPSf3pm0+bw322Q70YOQoTBKT/bCpD9RJFKvNCMyCnQsBux5uVrXZxlsM
         MuQYn7c6zwab11q7ucYbk6qlL32QMVFQh0zIsNGBE/I0n8pJOqyFYEw3tOOIQHOzOvGR
         TyD4GmyU1XipZoBuLafdY9rkeBkR0JHAh9w1ZxxpK9AYjyh+DZrkaNEnJ5yURrbNosi2
         ju22Q4sPl5xR8cJRB+GRmZdtpw/p/OcEw88w2gymONZ9V+mpmif8OqnUyKxG3OgM1jaI
         itwQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Q6GuEvO9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r63si1619523ybc.159.2020.06.17.22.12.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 17 Jun 2020 22:12:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Q6GuEvO9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47682 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jlmr7-00082L-N8
	for alex.bennee@linaro.org; Thu, 18 Jun 2020 01:12:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34144)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jlmES-0006FU-Fs
 for qemu-arm@nongnu.org; Thu, 18 Jun 2020 00:32:56 -0400
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641]:43182)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jlmEO-0003cx-Jp
 for qemu-arm@nongnu.org; Thu, 18 Jun 2020 00:32:56 -0400
Received: by mail-pl1-x641.google.com with SMTP id g12so1903779pll.10
 for <qemu-arm@nongnu.org>; Wed, 17 Jun 2020 21:32:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uvFEvF/p8/7miI8vDptcp/r8cSHt9E6GhBE3KGgZk6E=;
 b=Q6GuEvO9+QE2iF5C/PElDjaZuN0udc6re6TMffN8JTUHNbhZ1uLBgrZvIMBNK4VLu0
 UFa/xZ+gRFq1xsbSUaogbMH+pN2mRQTmEUbWAEFWgreBUoX40Gddmiu7At/mvop3nsAz
 aI97QbcQThFansnExZSbsynbmKPdPuBVvj7iRJGCnzqFuNULh3FozbdQ7/7L18zZlDBf
 IcbOTEcuq3nc1CBoolD4ChyZK7pRTDzCsdFjOuTkupX51yjE0PLQ42ZfnRCLkY51JtHz
 Ch4fAhJS3B6LZeMz0s16KAUaaWipGDb7429e5ph9tJ7ZUlA5ZOQaGZcShp0EHOroalNq
 qj0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uvFEvF/p8/7miI8vDptcp/r8cSHt9E6GhBE3KGgZk6E=;
 b=Kjo+qBcDRe2jSgnnOBfhBF9hvbd1o1WsGCtC3kZopnINTjhaRCyyig7DsYoAllVJea
 rQAuOgdyOeGOrrFIC7vRC88YXhbbPp+81xJGn+y8gkN9X17gQt7qS2Y3AYarsf66cSzA
 hhXd6zETZsdgZ+UINuu2GQl6vXrYsawHJ0J46mo92sYlek9riBJ1rHB7K9ZO+GvRSEtj
 SxI38nXue6OevGoiLKaUGGFpFEorIw1AkdaJ3bwmk5JPSjodxKEIJ/30Oc7bvGWlXsSN
 drcS8Dq5lPvHpaGNJPDNLOX3y/7+9vhSW7w0bzSnUCofFf9ZTL67L1eQMmZoUi+KilBb
 BWng==
X-Gm-Message-State: AOAM533jNDHwM8RjeygLEaEFx4AladtJOktWc1zS6aCCfHqTsXZnPdWj
 hZ69YxT+SGbpT3XrWHjbwXA6Sw==
X-Received: by 2002:a17:90a:ee82:: with SMTP id
 i2mr2373555pjz.29.1592454771123; 
 Wed, 17 Jun 2020 21:32:51 -0700 (PDT)
Received: from localhost.localdomain (174-21-143-238.tukw.qwest.net.
 [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id d2sm1165766pgp.56.2020.06.17.21.32.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Jun 2020 21:32:50 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 089/100] target/arm: Implement SVE2 TBL, TBX
Date: Wed, 17 Jun 2020 21:26:33 -0700
Message-Id: <20200618042644.1685561-90-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200618042644.1685561-1-richard.henderson@linaro.org>
References: <20200618042644.1685561-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::641;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x641.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: qemu-arm@nongnu.org, steplong@quicinc.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 33sA3d5qO3h3

From: Stephen Long <steplong@quicinc.com>

Signed-off-by: Stephen Long <steplong@quicinc.com>
Message-Id: <20200428144352.9275-1-steplong@quicinc.com>
[rth: rearrange the macros a little and rebase]
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-sve.h    | 10 +++++
 target/arm/sve.decode      |  5 +++
 target/arm/sve_helper.c    | 90 ++++++++++++++++++++++++++++++--------
 target/arm/translate-sve.c | 33 ++++++++++++++
 4 files changed, 119 insertions(+), 19 deletions(-)

diff --git a/target/arm/helper-sve.h b/target/arm/helper-sve.h
index d7e2d168ba..a3d49506d0 100644
--- a/target/arm/helper-sve.h
+++ b/target/arm/helper-sve.h
@@ -661,6 +661,16 @@ DEF_HELPER_FLAGS_4(sve_tbl_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(sve_tbl_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(sve_tbl_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 
+DEF_HELPER_FLAGS_5(sve2_tbl_b, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_tbl_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_tbl_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_tbl_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_4(sve2_tbx_b, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_tbx_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_tbx_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_tbx_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+
 DEF_HELPER_FLAGS_3(sve_sunpk_h, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
 DEF_HELPER_FLAGS_3(sve_sunpk_s, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
 DEF_HELPER_FLAGS_3(sve_sunpk_d, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index 5f2fad4754..609ecce520 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -560,6 +560,11 @@ TBL             00000101 .. 1 ..... 001100 ..... .....          @rd_rn_rm
 # SVE unpack vector elements
 UNPK            00000101 esz:2 1100 u:1 h:1 001110 rn:5 rd:5
 
+# SVE2 Table Lookup (three sources)
+
+TBL_sve2        00000101 .. 1 ..... 001010 ..... .....          @rd_rn_rm
+TBX             00000101 .. 1 ..... 001011 ..... .....          @rd_rn_rm
+
 ### SVE Permute - Predicates Group
 
 # SVE permute predicate elements
diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index 4b54ec8c25..6e9e43a1f9 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -3014,28 +3014,80 @@ void HELPER(sve_rev_d)(void *vd, void *vn, uint32_t desc)
     }
 }
 
-#define DO_TBL(NAME, TYPE, H) \
-void HELPER(NAME)(void *vd, void *vn, void *vm, uint32_t desc) \
-{                                                              \
-    intptr_t i, opr_sz = simd_oprsz(desc);                     \
-    uintptr_t elem = opr_sz / sizeof(TYPE);                    \
-    TYPE *d = vd, *n = vn, *m = vm;                            \
-    ARMVectorReg tmp;                                          \
-    if (unlikely(vd == vn)) {                                  \
-        n = memcpy(&tmp, vn, opr_sz);                          \
-    }                                                          \
-    for (i = 0; i < elem; i++) {                               \
-        TYPE j = m[H(i)];                                      \
-        d[H(i)] = j < elem ? n[H(j)] : 0;                      \
-    }                                                          \
+typedef void tb_impl_fn(void *, void *, void *, void *, uintptr_t, bool);
+
+static inline void do_tbl1(void *vd, void *vn, void *vm, uint32_t desc,
+                           bool is_tbx, tb_impl_fn *fn)
+{
+    ARMVectorReg scratch;
+    uintptr_t oprsz = simd_oprsz(desc);
+
+    if (unlikely(vd == vn)) {
+        vn = memcpy(&scratch, vn, oprsz);
+    }
+
+    fn(vd, vn, NULL, vm, oprsz, is_tbx);
 }
 
-DO_TBL(sve_tbl_b, uint8_t, H1)
-DO_TBL(sve_tbl_h, uint16_t, H2)
-DO_TBL(sve_tbl_s, uint32_t, H4)
-DO_TBL(sve_tbl_d, uint64_t, )
+static inline void do_tbl2(void *vd, void *vn0, void *vn1, void *vm,
+                           uint32_t desc, bool is_tbx, tb_impl_fn *fn)
+{
+    ARMVectorReg scratch;
+    uintptr_t oprsz = simd_oprsz(desc);
 
-#undef TBL
+    if (unlikely(vd == vn0)) {
+        vn0 = memcpy(&scratch, vn0, oprsz);
+        if (vd == vn1) {
+            vn1 = vn0;
+        }
+    } else if (unlikely(vd == vn1)) {
+        vn1 = memcpy(&scratch, vn1, oprsz);
+    }
+
+    fn(vd, vn0, vn1, vm, oprsz, is_tbx);
+}
+
+#define DO_TB(SUFF, TYPE, H)                                            \
+static inline void do_tb_##SUFF(void *vd, void *vt0, void *vt1,         \
+                                void *vm, uintptr_t oprsz, bool is_tbx) \
+{                                                                       \
+    TYPE *d = vd, *tbl0 = vt0, *tbl1 = vt1, *indexes = vm;              \
+    uintptr_t i, nelem = oprsz / sizeof(TYPE);                          \
+    for (i = 0; i < nelem; ++i) {                                       \
+        TYPE index = indexes[H1(i)], val = 0;                           \
+        if (index < nelem) {                                            \
+            val = tbl0[H(index)];                                       \
+        } else {                                                        \
+            index -= nelem;                                             \
+            if (tbl1 && index < nelem) {                                \
+                val = tbl1[H(index)];                                   \
+            } else if (is_tbx) {                                        \
+                continue;                                               \
+            }                                                           \
+        }                                                               \
+        d[H(i)] = val;                                                  \
+    }                                                                   \
+}                                                                       \
+void HELPER(sve_tbl_##SUFF)(void *vd, void *vn, void *vm, uint32_t desc) \
+{                                                                       \
+    do_tbl1(vd, vn, vm, desc, false, do_tb_##SUFF);                     \
+}                                                                       \
+void HELPER(sve2_tbl_##SUFF)(void *vd, void *vn0, void *vn1,            \
+                             void *vm, uint32_t desc)                   \
+{                                                                       \
+    do_tbl2(vd, vn0, vn1, vm, desc, false, do_tb_##SUFF);               \
+}                                                                       \
+void HELPER(sve2_tbx_##SUFF)(void *vd, void *vn, void *vm, uint32_t desc) \
+{                                                                       \
+    do_tbl1(vd, vn, vm, desc, true, do_tb_##SUFF);                      \
+}
+
+DO_TB(b, uint8_t, H1)
+DO_TB(h, uint16_t, H2)
+DO_TB(s, uint32_t, H4)
+DO_TB(d, uint64_t,   )
+
+#undef DO_TB
 
 #define DO_UNPK(NAME, TYPED, TYPES, HD, HS) \
 void HELPER(NAME)(void *vd, void *vn, uint32_t desc)           \
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 3da42e2743..6b9d715c2d 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -2417,6 +2417,39 @@ static bool trans_TBL(DisasContext *s, arg_rrr_esz *a)
     return true;
 }
 
+static bool trans_TBL_sve2(DisasContext *s, arg_rrr_esz *a)
+{
+    static gen_helper_gvec_4 * const fns[4] = {
+        gen_helper_sve2_tbl_b, gen_helper_sve2_tbl_h,
+        gen_helper_sve2_tbl_s, gen_helper_sve2_tbl_d
+    };
+
+    if (!dc_isar_feature(aa64_sve2, s)) {
+        return false;
+    }
+    if (sve_access_check(s)) {
+        gen_gvec_ool_zzzz(s, fns[a->esz], a->rd, a->rn,
+                          (a->rn + 1) % 32, a->rm, 0);
+    }
+    return true;
+}
+
+static bool trans_TBX(DisasContext *s, arg_rrr_esz *a)
+{
+    static gen_helper_gvec_3 * const fns[4] = {
+        gen_helper_sve2_tbx_b, gen_helper_sve2_tbx_h,
+        gen_helper_sve2_tbx_s, gen_helper_sve2_tbx_d
+    };
+
+    if (!dc_isar_feature(aa64_sve2, s)) {
+        return false;
+    }
+    if (sve_access_check(s)) {
+        gen_gvec_ool_zzz(s, fns[a->esz], a->rd, a->rn, a->rm, 0);
+    }
+    return true;
+}
+
 static bool trans_UNPK(DisasContext *s, arg_UNPK *a)
 {
     static gen_helper_gvec_2 * const fns[4][2] = {
-- 
2.25.1

