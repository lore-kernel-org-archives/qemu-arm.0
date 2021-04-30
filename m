Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp492888lfg;
        Fri, 30 Apr 2021 14:04:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyy9Zl849ozwtClg4oEWK6CpxFcyeqTShwNfwGTy7aXgX2PmxTIOV2i9FfmDjDkfZ2lW35/
X-Received: by 2002:a05:6e02:1bc3:: with SMTP id x3mr5586429ilv.47.1619816661174;
        Fri, 30 Apr 2021 14:04:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1619816661; cv=none;
        d=google.com; s=arc-20160816;
        b=ECq09ireIMZV8dY1mf1dTj1SF/D9ra6UfbEgLfb5G6aJhfSDOVKaH381ZDpjaVZXAY
         Uj/TlWRBY9onvKe6MB+3W/5eW3JOD/icUGt2iezMQYPOC1gVyzv19Yf6MKckONmmkarY
         FwAynMMY5HLzHbIAKpVqsyhciOIyZFYg5KggW6JwWHiTUPXphzLrubysVYVzt+M610a6
         brdI3754CR1koiguuGtJkGt8NgeGNkiRqCmg8y2kBiZNoRj4qIGWc7313QjUB492W4Nv
         9VsFX8uM97qOCPsun0gD5AaRIYVBduvra5pyGiPR/8Co1Hx2vaXfDx2P7mngWnpXa2/w
         WnAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=I4fHMYBO4ihQ+/Yw2g+7CZYltNBdKISEE3KJi6AN1fs=;
        b=adEFxPfkULpzCaCFBhYHwr2NWP8CJkLkGa1OUi8G+pNWJVrgjBcGufpplHvE6dX56m
         DMJI9Cd+oZan6YolpS6cdXNuhrCMTySeITvkdpgB7zG43XhNA2wVjNEOKDLBWxu7coRN
         LvI44fimLNmdYvBKRLncDEu69b7ecabQtvl8f6DKu+UeS222A8peMpxdpCqDd6LnUQBt
         gE9n79irkrtUQSUiB/e4ddIFgH0gchlnzH1E8IA7QFlN9bZVP3cNGFFXpl64z9viipeI
         yb4K32mrcfTHNmxVyAdEP4SaTznh9rNrvKJ46ywB5ViRaP+2CvzFMkF6OCZnXOLqE5fe
         tzlA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="aYR+Bf/4";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p15si5616379iov.79.2021.04.30.14.04.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 30 Apr 2021 14:04:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="aYR+Bf/4";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lcaJA-0004w4-E2
	for alex.bennee@linaro.org; Fri, 30 Apr 2021 17:04:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53358)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcZmI-0004PV-13
 for qemu-arm@nongnu.org; Fri, 30 Apr 2021 16:30:22 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a]:40956)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcZlm-0007k0-7x
 for qemu-arm@nongnu.org; Fri, 30 Apr 2021 16:30:21 -0400
Received: by mail-pf1-x42a.google.com with SMTP id a12so6951823pfc.7
 for <qemu-arm@nongnu.org>; Fri, 30 Apr 2021 13:29:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=I4fHMYBO4ihQ+/Yw2g+7CZYltNBdKISEE3KJi6AN1fs=;
 b=aYR+Bf/4Xy2a4VMMkTtg/PQWDEK+5BWGPx1BJOD3mMCH7wTnddeXUD7g3gbggVyXFR
 nQEIxIdivC0NPJwUOeAiamjKXbJT3l903LMr3DRtEVi83YIOl3crCXAdqY4uGqA5uIP3
 t44Xcz7RVL+sH9CNtnaf9FFbl2ss4d7XayoPllTTJFerb2r3X5SY384XUbEeZYyR6Vdd
 83GlJQp2+ylvkHEfDIPjecC8EGYm7H5Pz86ce3VPyiuqwRTH7LwA5nemjO25JI+ocoTM
 u3AgkiYHR1eB91BJ9kuOZMoyzZoFukfPd1q8id//vllKfAbAWFLLE3zLQBBT2rUTo2HD
 fFAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=I4fHMYBO4ihQ+/Yw2g+7CZYltNBdKISEE3KJi6AN1fs=;
 b=N9CpFV1z9hb5wSaQ3jhvJ82q3eSrrfp6AD6QU3G/Ottdd/DXxEVuD7x0HcTC8BcB8Y
 KPYyB4D9bAOPfej+H0emRFMvwDf24GOuv8zHA+l+BEp9JZuKMZ2lODFwfPTH1SSvJDA3
 wMWTLndx3WeOVI7AB7mr49y/oAF0Ioavi48r4rMGMbgXsovCRmnhmjS3AmarE25sxfyu
 zw9ym1BxNKGNHb7ETh9zEFwkwg6ikP7s1icjhrpdpGE6GfOg3pcwCvwwW3JGo04kX7Wk
 ZgKxpGy8eePPdkzIrLAjEhGwf2aAX8vxpQgNHF4q/E2Edlk3XLBy7vsA4L1d5xaaKFqP
 msjg==
X-Gm-Message-State: AOAM532UQAI+7TOVD3YyDEZqo+AKTjDxO2aTSmy0Se2c9p1zLnE02AwZ
 1YhDejuManFoQ9gLHk/HjjX5XA==
X-Received: by 2002:aa7:9a8d:0:b029:27c:a7c8:b7b0 with SMTP id
 w13-20020aa79a8d0000b029027ca7c8b7b0mr6425186pfi.17.1619814587087; 
 Fri, 30 Apr 2021 13:29:47 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id q23sm3788781pgt.42.2021.04.30.13.29.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Apr 2021 13:29:46 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 57/82] target/arm: Implement SVE2 signed saturating
 doubling multiply high
Date: Fri, 30 Apr 2021 13:25:45 -0700
Message-Id: <20210430202610.1136687-58-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210430202610.1136687-1-richard.henderson@linaro.org>
References: <20210430202610.1136687-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42a.google.com
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
X-TUID: AjZiWUPZSHBh

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.h        | 10 +++++
 target/arm/sve.decode      |  4 ++
 target/arm/translate-sve.c | 18 ++++++++
 target/arm/vec_helper.c    | 84 ++++++++++++++++++++++++++++++++++++++
 4 files changed, 116 insertions(+)

diff --git a/target/arm/helper.h b/target/arm/helper.h
index 72c5bf6aca..eb94b6b1e6 100644
--- a/target/arm/helper.h
+++ b/target/arm/helper.h
@@ -957,6 +957,16 @@ DEF_HELPER_FLAGS_5(neon_sqrdmulh_h, TCG_CALL_NO_RWG,
 DEF_HELPER_FLAGS_5(neon_sqrdmulh_s, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, i32)
 
+DEF_HELPER_FLAGS_4(sve2_sqdmulh_b, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_sqdmulh_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_sqdmulh_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_sqdmulh_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_4(sve2_sqrdmulh_b, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_sqrdmulh_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_sqrdmulh_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_sqrdmulh_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+
 DEF_HELPER_FLAGS_4(gvec_xar_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 
 #ifdef TARGET_AARCH64
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index a3b9fb95f9..407d3019d1 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -1202,6 +1202,10 @@ SMULH_zzz       00000100 .. 1 ..... 0110 10 ..... .....  @rd_rn_rm
 UMULH_zzz       00000100 .. 1 ..... 0110 11 ..... .....  @rd_rn_rm
 PMUL_zzz        00000100 00 1 ..... 0110 01 ..... .....  @rd_rn_rm_e0
 
+# SVE2 signed saturating doubling multiply high (unpredicated)
+SQDMULH_zzz     00000100 .. 1 ..... 0111 00 ..... .....  @rd_rn_rm
+SQRDMULH_zzz    00000100 .. 1 ..... 0111 01 ..... .....  @rd_rn_rm
+
 ### SVE2 Integer - Predicated
 
 SADALP_zpzz     01000100 .. 000 100 101 ... ..... .....  @rdm_pg_rn
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index acf16c4c43..e32094dcdb 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -6419,6 +6419,24 @@ static bool trans_PMUL_zzz(DisasContext *s, arg_rrr_esz *a)
     return do_sve2_zzz_ool(s, a, gen_helper_gvec_pmul_b);
 }
 
+static bool trans_SQDMULH_zzz(DisasContext *s, arg_rrr_esz *a)
+{
+    static gen_helper_gvec_3 * const fns[4] = {
+        gen_helper_sve2_sqdmulh_b, gen_helper_sve2_sqdmulh_h,
+        gen_helper_sve2_sqdmulh_s, gen_helper_sve2_sqdmulh_d,
+    };
+    return do_sve2_zzz_ool(s, a, fns[a->esz]);
+}
+
+static bool trans_SQRDMULH_zzz(DisasContext *s, arg_rrr_esz *a)
+{
+    static gen_helper_gvec_3 * const fns[4] = {
+        gen_helper_sve2_sqrdmulh_b, gen_helper_sve2_sqrdmulh_h,
+        gen_helper_sve2_sqrdmulh_s, gen_helper_sve2_sqrdmulh_d,
+    };
+    return do_sve2_zzz_ool(s, a, fns[a->esz]);
+}
+
 /*
  * SVE2 Integer - Predicated
  */
diff --git a/target/arm/vec_helper.c b/target/arm/vec_helper.c
index b19877e0d3..25061c15e1 100644
--- a/target/arm/vec_helper.c
+++ b/target/arm/vec_helper.c
@@ -81,6 +81,26 @@ void HELPER(sve2_sqrdmlsh_b)(void *vd, void *vn, void *vm,
     }
 }
 
+void HELPER(sve2_sqdmulh_b)(void *vd, void *vn, void *vm, uint32_t desc)
+{
+    intptr_t i, opr_sz = simd_oprsz(desc);
+    int8_t *d = vd, *n = vn, *m = vm;
+
+    for (i = 0; i < opr_sz; ++i) {
+        d[i] = do_sqrdmlah_b(n[i], m[i], 0, false, false);
+    }
+}
+
+void HELPER(sve2_sqrdmulh_b)(void *vd, void *vn, void *vm, uint32_t desc)
+{
+    intptr_t i, opr_sz = simd_oprsz(desc);
+    int8_t *d = vd, *n = vn, *m = vm;
+
+    for (i = 0; i < opr_sz; ++i) {
+        d[i] = do_sqrdmlah_b(n[i], m[i], 0, false, true);
+    }
+}
+
 /* Signed saturating rounding doubling multiply-accumulate high half, 16-bit */
 int16_t do_sqrdmlah_h(int16_t src1, int16_t src2, int16_t src3,
                       bool neg, bool round, uint32_t *sat)
@@ -198,6 +218,28 @@ void HELPER(sve2_sqrdmlsh_h)(void *vd, void *vn, void *vm,
     }
 }
 
+void HELPER(sve2_sqdmulh_h)(void *vd, void *vn, void *vm, uint32_t desc)
+{
+    intptr_t i, opr_sz = simd_oprsz(desc);
+    int16_t *d = vd, *n = vn, *m = vm;
+    uint32_t discard;
+
+    for (i = 0; i < opr_sz / 2; ++i) {
+        d[i] = do_sqrdmlah_h(n[i], m[i], 0, false, false, &discard);
+    }
+}
+
+void HELPER(sve2_sqrdmulh_h)(void *vd, void *vn, void *vm, uint32_t desc)
+{
+    intptr_t i, opr_sz = simd_oprsz(desc);
+    int16_t *d = vd, *n = vn, *m = vm;
+    uint32_t discard;
+
+    for (i = 0; i < opr_sz / 2; ++i) {
+        d[i] = do_sqrdmlah_h(n[i], m[i], 0, false, true, &discard);
+    }
+}
+
 /* Signed saturating rounding doubling multiply-accumulate high half, 32-bit */
 int32_t do_sqrdmlah_s(int32_t src1, int32_t src2, int32_t src3,
                       bool neg, bool round, uint32_t *sat)
@@ -309,6 +351,28 @@ void HELPER(sve2_sqrdmlsh_s)(void *vd, void *vn, void *vm,
     }
 }
 
+void HELPER(sve2_sqdmulh_s)(void *vd, void *vn, void *vm, uint32_t desc)
+{
+    intptr_t i, opr_sz = simd_oprsz(desc);
+    int32_t *d = vd, *n = vn, *m = vm;
+    uint32_t discard;
+
+    for (i = 0; i < opr_sz / 4; ++i) {
+        d[i] = do_sqrdmlah_s(n[i], m[i], 0, false, false, &discard);
+    }
+}
+
+void HELPER(sve2_sqrdmulh_s)(void *vd, void *vn, void *vm, uint32_t desc)
+{
+    intptr_t i, opr_sz = simd_oprsz(desc);
+    int32_t *d = vd, *n = vn, *m = vm;
+    uint32_t discard;
+
+    for (i = 0; i < opr_sz / 4; ++i) {
+        d[i] = do_sqrdmlah_s(n[i], m[i], 0, false, true, &discard);
+    }
+}
+
 /* Signed saturating rounding doubling multiply-accumulate high half, 64-bit */
 static int64_t do_sat128_d(Int128 r)
 {
@@ -368,6 +432,26 @@ void HELPER(sve2_sqrdmlsh_d)(void *vd, void *vn, void *vm,
     }
 }
 
+void HELPER(sve2_sqdmulh_d)(void *vd, void *vn, void *vm, uint32_t desc)
+{
+    intptr_t i, opr_sz = simd_oprsz(desc);
+    int64_t *d = vd, *n = vn, *m = vm;
+
+    for (i = 0; i < opr_sz / 8; ++i) {
+        d[i] = do_sqrdmlah_d(n[i], m[i], 0, false, false);
+    }
+}
+
+void HELPER(sve2_sqrdmulh_d)(void *vd, void *vn, void *vm, uint32_t desc)
+{
+    intptr_t i, opr_sz = simd_oprsz(desc);
+    int64_t *d = vd, *n = vn, *m = vm;
+
+    for (i = 0; i < opr_sz / 8; ++i) {
+        d[i] = do_sqrdmlah_d(n[i], m[i], 0, false, true);
+    }
+}
+
 /* Integer 8 and 16-bit dot-product.
  *
  * Note that for the loops herein, host endianness does not matter
-- 
2.25.1

