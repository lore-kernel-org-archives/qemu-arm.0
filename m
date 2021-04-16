Received: by 2002:ac2:5e6c:0:0:0:0:0 with SMTP id a12csp749051lfr;
        Fri, 16 Apr 2021 14:44:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy9Qi06xzo1TVqV5PkED+96EWJz5OqNrJf5VfBTT6cAAi82t2sbeGZ7n/YOul6Kw4Ak1AAS
X-Received: by 2002:a25:918c:: with SMTP id w12mr1491457ybl.443.1618609497503;
        Fri, 16 Apr 2021 14:44:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618609497; cv=none;
        d=google.com; s=arc-20160816;
        b=gtfrt5m4tq5AfyqMYdUrpp7eiBjOZTeKXj20XA8AdhhnPt5PIBOxKfZpAECGq2EDV9
         YuXWFStXADHJvAnQxDFB1kwfmYs5/gwcfmn4Ex+Ade43nq6fawqf9vPIx+JVe4nUw7aG
         enJRyXJc4zr88ZrCOOhxe4KtNeGV1/W6M3NDrFDlQ6KsFctterM8Zig0iPRqUNi7rfsb
         vcJkCX6sbnxBdLPOOgxksgxcsRmTFz2ZNLogT50yUQXE5ZxGDrFvuLuTYSl7FCfVfLFy
         vfmgJ34P9syRo06DRF/PUsW6MLrQqa/1iTGA62aH7qugNPQfcn24MFAwOBa3doPx0oeZ
         6szw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=gXohVRGuyQOJc/h/jdj7wHe2XbYitvQhklfiQ4g4gH8=;
        b=O1728EQDM7/iCXtomcRGIrULXYMA3la4scmBVf9JvhSa2NL5DCDPWyUnt27Li8qTVI
         ZYQpzXO18BZiJ/NC7LFiTosh3cPt3ocbbM3d8Zxw2doQBvFmMHlXSpERjfM6AAF9GnAk
         yHSMT0rYcts1OSIA5hHcErti2F1mo9aL7vGkuLiY9iM4oPI7634UQ300PYwBMAWIoQal
         4Q1SJdqn2ScLyhDys5j4vBSkyfTF1pGcjkx4LVJqp/JfTnCqdpRFaKelnphmMNJbUI0W
         pAhi2MqTMszsKs9tOhtG6fMUIo+FJ5aLankiNqmYJMFnBzlijBmQtHeAHisLperZwXIl
         rCxw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mF8Psq2v;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l185si6893340ybc.261.2021.04.16.14.44.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 16 Apr 2021 14:44:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mF8Psq2v;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55388 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lXWGm-0007WI-QW
	for alex.bennee@linaro.org; Fri, 16 Apr 2021 17:44:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45184)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXVdd-00063K-Sh
 for qemu-arm@nongnu.org; Fri, 16 Apr 2021 17:04:29 -0400
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d]:41623)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXVdO-0001io-6w
 for qemu-arm@nongnu.org; Fri, 16 Apr 2021 17:04:29 -0400
Received: by mail-pg1-x52d.google.com with SMTP id f29so20003155pgm.8
 for <qemu-arm@nongnu.org>; Fri, 16 Apr 2021 14:04:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gXohVRGuyQOJc/h/jdj7wHe2XbYitvQhklfiQ4g4gH8=;
 b=mF8Psq2vYNRu2HerlvWqmATI/6I1O9SCfsrGnptgRSlZunri6FL95ufh11woI+jK7M
 g544rkKAn0Dx/AicCIaWjwdnfUU56oJyqKweVImSUIAsTv5KMypAoFC4q5ds5mJwnNuH
 L+LOjVEQuvPOzgIx0f+tZrcj6KX3lMj+UGeSKwDoVS413UJK7avdNKXTS6m4YBclAQQN
 A3TVjATMvdSO8DiYdE62t7utk74dZuYoPNs2ukFOAJgkk+Ya0PNVJI5pzUqnwEtuA/KH
 3yyBsN+AwdHUZcggq+OVjAHoxGFmgn+A4uER0kvZzWV6hGujzZn3bf5YyYSDpiPZupXi
 WwfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gXohVRGuyQOJc/h/jdj7wHe2XbYitvQhklfiQ4g4gH8=;
 b=gCdF08XJsR1b1bylJ5uU9/0RAeEeePiFq+Ulx9Sno9qpEEf0Og2LQLh1Zk3S90rsEa
 NhFhYaSDwcAypkY4C/X7VZUcXtvcnzHLX54PB74z/jgaPqjQkNl+CoZTxqNVCdsa1YSE
 LxzKIjVLoVHd6JEXhRxzyA2kgcBOmLh8/kah12NmW6kKGm8b9HAJ1HjFO0l3ZeJl9tMk
 ineZ1y7/Ziv8NaPU84Z8+yhCe34qfisfGjmXKTBO8dYLFedHKvc+E/gfKa34GQTaY377
 O1euCefFf7l4z+RStBWNkQC7bPERb+cMbJRKb/Zuy81joGCoJ3aMxxlF5frIUvt2ch9d
 1sKw==
X-Gm-Message-State: AOAM531svahH3scDt4wEUBAV7wF6KY2liHwKlDD6fyEkNGGskRq1IJSN
 BZ2I2fKQD32F3AU1FSGX2mtNA5eDJIvznQ==
X-Received: by 2002:a63:d714:: with SMTP id d20mr807021pgg.285.1618607048212; 
 Fri, 16 Apr 2021 14:04:08 -0700 (PDT)
Received: from localhost.localdomain ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id m9sm5766734pgt.65.2021.04.16.14.04.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Apr 2021 14:04:07 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 57/81] target/arm: Implement SVE2 signed saturating
 doubling multiply high
Date: Fri, 16 Apr 2021 14:02:16 -0700
Message-Id: <20210416210240.1591291-58-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210416210240.1591291-1-richard.henderson@linaro.org>
References: <20210416210240.1591291-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52d.google.com
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
X-TUID: +s0BwR/Zqzmg

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
index d3fcf2e4c1..dd4de9e57f 100644
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

