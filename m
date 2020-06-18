Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1275147lfm;
        Wed, 17 Jun 2020 21:54:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxfnxK2lskniUpWkzFX4jHvE0uRFOXvG90vg9wKCMYTE1v1fnjza5Mtz+ZBmjzmQCEQV32h
X-Received: by 2002:a25:bf8c:: with SMTP id l12mr3811711ybk.447.1592456047851;
        Wed, 17 Jun 2020 21:54:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592456047; cv=none;
        d=google.com; s=arc-20160816;
        b=ysXK1xdhaUv1ioAH+zKik5GDqWkGwfLjOA9+IT3RhAdXUxETILVICEEicDYUPi8oiC
         e0qlv1L32B9XVo+WaP6EuM6pmebyRjxE91u9em7tp7+jvMfD4Ae61vrazC9+1VGB4DBs
         hUUa2Fe20HtaJFbN0smRyQ1hDJ53Vy7Zi0i2/Tls7DBnfOaGCm6cUUnAvWWtS7IB0CkX
         ExEGc6wHJhCIPtWU2uuV0YN8VPv4hQ5QhV3c5ZnCyrNpnXp3YSqIHUkDX4V/UTZxgPd6
         DLKwCRoi8YjhVlWYOEYnsUoCFOdCCBzVxPfHHwaunLyUUMOhWnZbH5+GMwk8gTbTqOSR
         0jkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=qt7I+dVhtjIMoFbyKK1VHbS017i0jj10IVKx+nltxb4=;
        b=ldtjaQhVpjZp6P8o1DyFkNdXEAtcsICj9Dq74tnF3Tr7jQUVteKAGAPl5LoLZdwgG/
         k6qSBpjR03ZTl4Brv+dHN1DduFaKyFo21UJjAsEWr7nXGtJ2Q36Ws+e6aWAZdB6NVT8K
         iBZyhOZz4biwD/SaOYrjpEysuSxkCxNwS2U+Htjfel2LmOEAcGC290lww998Il/0vWma
         VdbLQ7mbUe1BNfScU6SSvbRgw5mxNET3MaT/raeoJXcvTFy60yMzbUmOBmU31xTcgTv8
         5tCPeVfglxzSLqgAawc89jJ167qk7CS9BLu6X4hMT9fOuMqKdO5JAkKsWEtgU4L+2yfd
         5Uhg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=XJiMJxD6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y6si62313ybm.401.2020.06.17.21.54.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 17 Jun 2020 21:54:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=XJiMJxD6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35150 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jlmYx-0006Ut-3S
	for alex.bennee@linaro.org; Thu, 18 Jun 2020 00:54:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60794)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jlmBZ-0000Kn-N7
 for qemu-arm@nongnu.org; Thu, 18 Jun 2020 00:29:57 -0400
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d]:39299)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jlmBX-0002wr-Ug
 for qemu-arm@nongnu.org; Thu, 18 Jun 2020 00:29:57 -0400
Received: by mail-pf1-x42d.google.com with SMTP id d66so2195631pfd.6
 for <qemu-arm@nongnu.org>; Wed, 17 Jun 2020 21:29:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qt7I+dVhtjIMoFbyKK1VHbS017i0jj10IVKx+nltxb4=;
 b=XJiMJxD6bOqkFPcQCXVG8SA+nVOzARlhytGz7bO6jl7CFMHg8Gl2cHxgeBTqLTF0lk
 ZLZezOTl4ONRcEIHG9T3pcAPvVrf88GqJOE2u19y2zF7TUVs+xvXQ2zTQasVp3bHw2eq
 tRyWfCp3xHlIHNyLzuiquhkpsP5VcJlR8NgC6GkCtEgnBkbVBPo5K9DM3ijRyBJdg0Op
 5yVQDEH7JAU4SzhMWeG+YFaTT6PFuUFwj/OyTx4nKIlULyd6t7dk+p3pWU0/HgYlCwVe
 hlmdDfS+jcHH4b/l0x0+WO9VIuvmBBwmCekNnKePvZGL0pzyBxGQ+Lq6I4TvteoePazl
 LwrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qt7I+dVhtjIMoFbyKK1VHbS017i0jj10IVKx+nltxb4=;
 b=i3xr7lvRszDEgk+PybjOBhF+ieUwf3iMudJIikkkdOhwp+uD46AiaZGOFgLD20zhEs
 oC6czDMA0Yk2dv+wmLtHAra9cces1cb6gUVG7uUAJZkyR4xuVq6Z2674qNuyMkmRfPQ/
 MuVOwoLQuBed/bRcxTlyxTbJ/uHtzuqW6/3N3HICGEOGnJz1PysjAyIx5UZYyZD2Vf7L
 L+jy9O4DTUqAUeUNPa0Syc7YSiBS0oe5uDU7bn4zEbC4MZ59dojt0j3xhSzNcaHkfZll
 5r/VwsKbUuZmDgJWPuS/+JE86z7xyRt6z2ormODUoUVqOfIydz0Zwsb6XL3lmIuOxjAr
 970w==
X-Gm-Message-State: AOAM532CC14pM7ciiS3PnKi/qOvoos0zpI7HBJm9B1Kxd2fuCgeqLLwG
 IgFpDUBAIaEEKBlcIWTKWgWZmWrU3PY=
X-Received: by 2002:a62:7b41:: with SMTP id w62mr1850832pfc.142.1592454594621; 
 Wed, 17 Jun 2020 21:29:54 -0700 (PDT)
Received: from localhost.localdomain (174-21-143-238.tukw.qwest.net.
 [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id j17sm1157899pgk.66.2020.06.17.21.29.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Jun 2020 21:29:53 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 049/100] target/arm: Implement SVE2 saturating multiply-add
 long
Date: Wed, 17 Jun 2020 21:25:53 -0700
Message-Id: <20200618042644.1685561-50-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200618042644.1685561-1-richard.henderson@linaro.org>
References: <20200618042644.1685561-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42d.google.com
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
X-TUID: Pi+bXCI3u38M

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-sve.h    | 14 ++++++++++
 target/arm/sve.decode      | 14 ++++++++++
 target/arm/sve_helper.c    | 30 +++++++++++++++++++++
 target/arm/translate-sve.c | 54 ++++++++++++++++++++++++++++++++++++++
 4 files changed, 112 insertions(+)

diff --git a/target/arm/helper-sve.h b/target/arm/helper-sve.h
index 78172cb281..f85b7be12e 100644
--- a/target/arm/helper-sve.h
+++ b/target/arm/helper-sve.h
@@ -2071,3 +2071,17 @@ DEF_HELPER_FLAGS_5(sve2_bcax, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_5(sve2_bsl1n, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_5(sve2_bsl2n, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_5(sve2_nbsl, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_5(sve2_sqdmlal_zzzw_h, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_sqdmlal_zzzw_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_sqdmlal_zzzw_d, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_5(sve2_sqdmlsl_zzzw_h, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_sqdmlsl_zzzw_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_sqdmlsl_zzzw_d, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index 2207693d28..d0d24978bb 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -1332,3 +1332,17 @@ FMAXNMP         01100100 .. 010 10 0 100 ... ..... ..... @rdn_pg_rm
 FMINNMP         01100100 .. 010 10 1 100 ... ..... ..... @rdn_pg_rm
 FMAXP           01100100 .. 010 11 0 100 ... ..... ..... @rdn_pg_rm
 FMINP           01100100 .. 010 11 1 100 ... ..... ..... @rdn_pg_rm
+
+#### SVE Integer Multiply-Add (unpredicated)
+
+## SVE2 saturating multiply-add long
+
+SQDMLALB_zzzw   01000100 .. 0 ..... 0110 00 ..... .....  @rda_rn_rm
+SQDMLALT_zzzw   01000100 .. 0 ..... 0110 01 ..... .....  @rda_rn_rm
+SQDMLSLB_zzzw   01000100 .. 0 ..... 0110 10 ..... .....  @rda_rn_rm
+SQDMLSLT_zzzw   01000100 .. 0 ..... 0110 11 ..... .....  @rda_rn_rm
+
+## SVE2 saturating multiply-add interleaved long
+
+SQDMLALBT       01000100 .. 0 ..... 00001 0 ..... .....  @rda_rn_rm
+SQDMLSLBT       01000100 .. 0 ..... 00001 1 ..... .....  @rda_rn_rm
diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index 31538e4720..4c8b0fe9f1 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -1400,6 +1400,36 @@ void HELPER(sve2_adcl_d)(void *vd, void *vn, void *vm, void *va, uint32_t desc)
     }
 }
 
+#define DO_SQDMLAL(NAME, TYPEW, TYPEN, HW, HN, DMUL_OP, SUM_OP) \
+void HELPER(NAME)(void *vd, void *vn, void *vm, void *va, uint32_t desc) \
+{                                                                       \
+    intptr_t i, opr_sz = simd_oprsz(desc);                              \
+    int sel1 = extract32(desc, SIMD_DATA_SHIFT, 1) * sizeof(TYPEN);     \
+    int sel2 = extract32(desc, SIMD_DATA_SHIFT + 1, 1) * sizeof(TYPEN); \
+    for (i = 0; i < opr_sz; i += sizeof(TYPEW)) {                       \
+        TYPEW nn = *(TYPEN *)(vn + HN(i + sel1));                       \
+        TYPEW mm = *(TYPEN *)(vm + HN(i + sel2));                       \
+        TYPEW aa = *(TYPEW *)(va + HW(i));                              \
+        *(TYPEW *)(vd + HW(i)) = SUM_OP(aa, DMUL_OP(nn, mm));           \
+    }                                                                   \
+}
+
+DO_SQDMLAL(sve2_sqdmlal_zzzw_h, int16_t, int8_t, H1_2, H1,
+           do_sqdmull_h, DO_SQADD_H)
+DO_SQDMLAL(sve2_sqdmlal_zzzw_s, int32_t, int16_t, H1_4, H1_2,
+           do_sqdmull_s, DO_SQADD_S)
+DO_SQDMLAL(sve2_sqdmlal_zzzw_d, int64_t, int32_t,     , H1_4,
+           do_sqdmull_d, do_sqadd_d)
+
+DO_SQDMLAL(sve2_sqdmlsl_zzzw_h, int16_t, int8_t, H1_2, H1,
+           do_sqdmull_h, DO_SQSUB_H)
+DO_SQDMLAL(sve2_sqdmlsl_zzzw_s, int32_t, int16_t, H1_4, H1_2,
+           do_sqdmull_s, DO_SQSUB_S)
+DO_SQDMLAL(sve2_sqdmlsl_zzzw_d, int64_t, int32_t,     , H1_4,
+           do_sqdmull_d, do_sqsub_d)
+
+#undef DO_SQDMLAL
+
 #define DO_BITPERM(NAME, TYPE, OP) \
 void HELPER(NAME)(void *vd, void *vn, void *vm, uint32_t desc) \
 {                                                              \
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 15546d9ad2..00488915aa 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -7069,3 +7069,57 @@ DO_SVE2_ZPZZ_FP(FMAXNMP, fmaxnmp)
 DO_SVE2_ZPZZ_FP(FMINNMP, fminnmp)
 DO_SVE2_ZPZZ_FP(FMAXP, fmaxp)
 DO_SVE2_ZPZZ_FP(FMINP, fminp)
+
+/*
+ * SVE Integer Multiply-Add (unpredicated)
+ */
+
+static bool do_sqdmlal_zzzw(DisasContext *s, arg_rrrr_esz *a,
+                            bool sel1, bool sel2)
+{
+    static gen_helper_gvec_4 * const fns[] = {
+        NULL,                           gen_helper_sve2_sqdmlal_zzzw_h,
+        gen_helper_sve2_sqdmlal_zzzw_s, gen_helper_sve2_sqdmlal_zzzw_d,
+    };
+    return do_sve2_zzzz_ool(s, a, fns[a->esz], (sel2 << 1) | sel1);
+}
+
+static bool do_sqdmlsl_zzzw(DisasContext *s, arg_rrrr_esz *a,
+                            bool sel1, bool sel2)
+{
+    static gen_helper_gvec_4 * const fns[] = {
+        NULL,                           gen_helper_sve2_sqdmlsl_zzzw_h,
+        gen_helper_sve2_sqdmlsl_zzzw_s, gen_helper_sve2_sqdmlsl_zzzw_d,
+    };
+    return do_sve2_zzzz_ool(s, a, fns[a->esz], (sel2 << 1) | sel1);
+}
+
+static bool trans_SQDMLALB_zzzw(DisasContext *s, arg_rrrr_esz *a)
+{
+    return do_sqdmlal_zzzw(s, a, false, false);
+}
+
+static bool trans_SQDMLALT_zzzw(DisasContext *s, arg_rrrr_esz *a)
+{
+    return do_sqdmlal_zzzw(s, a, true, true);
+}
+
+static bool trans_SQDMLALBT(DisasContext *s, arg_rrrr_esz *a)
+{
+    return do_sqdmlal_zzzw(s, a, false, true);
+}
+
+static bool trans_SQDMLSLB_zzzw(DisasContext *s, arg_rrrr_esz *a)
+{
+    return do_sqdmlsl_zzzw(s, a, false, false);
+}
+
+static bool trans_SQDMLSLT_zzzw(DisasContext *s, arg_rrrr_esz *a)
+{
+    return do_sqdmlsl_zzzw(s, a, true, true);
+}
+
+static bool trans_SQDMLSLBT(DisasContext *s, arg_rrrr_esz *a)
+{
+    return do_sqdmlsl_zzzw(s, a, false, true);
+}
-- 
2.25.1

