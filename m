Received: by 2002:ac2:5e6c:0:0:0:0:0 with SMTP id a12csp823467lfr;
        Fri, 16 Apr 2021 17:02:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJySj2h3F57HXx6TH3Y6QEzhZmlAqZL7aaCf5x97F5CTEnptnpOXMLa0OPQ6Ryts4wiihzvs
X-Received: by 2002:a67:eacf:: with SMTP id s15mr9211062vso.46.1618617737340;
        Fri, 16 Apr 2021 17:02:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618617737; cv=none;
        d=google.com; s=arc-20160816;
        b=jCyA9HKCdKiygx6yvWGxycegxlEmzqUkksrZuhdVQUDazOTzijqqNCv8pTxzKre43D
         5jdo48lHRWFjX+tebFCLKMgHO2CVmQhsTgAdhwM19jAjqyEEtw3ZYGlUmeS4tn6BWdj8
         Obchq9VNrgnPm7nxltJblMzMUFdqtLdy3tjXwoanLWioLIlfncdxhyjuZTeCq34FRi+a
         V8zgIX8QcSpkEA/CyelBGg7yhTnXjecZQMKLbetLLuc6JunpKRlzlIgHm7pUeqR1xR9Z
         CB8hXa7PPStfkRcXHBW+kifQLrR0ShS3YprZQinDZ81veI/qHq/HdKpFIkrxBVY+n884
         FcQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=/PkbqLegCo8bMrZ94sGp7SVbjSmm25utWP6wUjeAjjU=;
        b=KytcVMOqTGvuj2OcILbCRbYpATAGayes78vsIAyZgsB21xbHjfzc7Dit9ZYeJD6aLc
         s0vLO1VVb5EiuIrry/OuaFeyKVGJq8cWNhSWx+Qtc8Rn6JuwJjYuTUPY9C7Cs/AJnHOL
         bSu9JdeSdamhXSdHUkQ4cXnHIGoB6QyhvSBeawNh35tei0DZ09HuA4xgHWCuf+wbsZRn
         5rh0LpPxrWHbKFAv+cNuoIQ2zxQ+FDUcui/70jCicFJLUg6UyV/K3tfv5ixMORSD6+rP
         o9ifnu7bYcr8rFcTCbg6q8rWtkw8kVlJSbgF52yHRnmjnlgtgoud2Gl6bEYf9Kf5Eo02
         4hMA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=z8e1r8Z2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h17si3359763uaw.117.2021.04.16.17.02.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 16 Apr 2021 17:02:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=z8e1r8Z2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35360 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lXYPg-0000zb-I6
	for alex.bennee@linaro.org; Fri, 16 Apr 2021 20:02:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42098)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXYNB-0005N9-8i
 for qemu-arm@nongnu.org; Fri, 16 Apr 2021 19:59:41 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634]:42947)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXYN8-0005gF-Je
 for qemu-arm@nongnu.org; Fri, 16 Apr 2021 19:59:40 -0400
Received: by mail-pl1-x634.google.com with SMTP id v13so1204346ple.9
 for <qemu-arm@nongnu.org>; Fri, 16 Apr 2021 16:59:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/PkbqLegCo8bMrZ94sGp7SVbjSmm25utWP6wUjeAjjU=;
 b=z8e1r8Z2IhJqGbH0vHVkeT7GQmTYPO/x7qXn6P1nDOVXkHob/WnS0d7MwWyTAoT/Er
 PYMGJ8Y58Dv/2ygpJFhGBu/78qqQQ6ShPTL5FdRy2MH46QwYxdEPEcwXeDygHZvl1OSk
 wSoMAezAh7Mxrz9VgE5aZd8SLwLk2VAgdA1+u8ZAA7Q9XrhObUtEgTZLINJU3JZjOkiF
 ZJbdvfnWdPZMUxGs92542iLvCK1NjfTmbmX5w99zSe117AxIyHI9zA6/obtoG+p2D84T
 AtfxvHIQY2qUL8y9bO/zyHQdVUUhKIPu483Y3VtQoEiOSTKEWXqRYpCjU3ybB35IFqwk
 wLVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/PkbqLegCo8bMrZ94sGp7SVbjSmm25utWP6wUjeAjjU=;
 b=ZCm6H84j+1i5EA+gq/mYRoxKk4UQOQ7Ihex4hTdS7TZpvWPyR3fPHr2E4ynXHcuzqH
 +VPEHcxbgcWLngbTmlEpmrjm+3hizqAXDsRSo2KAJ/1r/dSyO+ZpZiK63zXOig7HqLqO
 ZM0CMG/UcwB+mbGQ+pxmBPRIKydj7iFRhNl34CuHAT5Bw7WUy21OQP50KqlWWPmvbLZy
 gu2qAf+dZnIRgpCJrgiSn6EqNckB3RkPmLX7lYD6FO0TNd1QT3kV1HR7hIDV/h1qU0kr
 qDYA0EWc1fIznqLaOPBQMtChv31v5IX0XRCpUzNu8b2HYnyzeBrzqzP9TIMPnuVYfpSE
 XFyA==
X-Gm-Message-State: AOAM532NfRfQMLXm2cm/XjOofcd0wgT74sTBlF+7gKj6P7JNkN6MraLw
 BqCOVs8hgAv2yOjuLKy3bHfYEQ==
X-Received: by 2002:a17:902:122:b029:e8:bde2:7f6c with SMTP id
 31-20020a1709020122b02900e8bde27f6cmr12055573plb.29.1618617576175; 
 Fri, 16 Apr 2021 16:59:36 -0700 (PDT)
Received: from localhost.localdomain ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id d71sm560853pfd.83.2021.04.16.16.59.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Apr 2021 16:59:35 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 06/11] target/arm: Implement bfloat16 dot product (vector)
Date: Fri, 16 Apr 2021 16:59:23 -0700
Message-Id: <20210416235928.1631788-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210416235928.1631788-1-richard.henderson@linaro.org>
References: <20210416235928.1631788-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
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
X-TUID: USF6L08uKLeT

This is BFDOT for both AArch64 AdvSIMD and SVE,
and VDOT.BF16 for AArch32 NEON.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.h             |  3 +++
 target/arm/neon-shared.decode   |  2 ++
 target/arm/sve.decode           |  3 +++
 target/arm/translate-a64.c      | 20 +++++++++++++++++
 target/arm/translate-sve.c      | 12 ++++++++++
 target/arm/vec_helper.c         | 40 +++++++++++++++++++++++++++++++++
 target/arm/translate-neon.c.inc |  9 ++++++++
 7 files changed, 89 insertions(+)

diff --git a/target/arm/helper.h b/target/arm/helper.h
index 0b52ee6256..eb4cb2b65b 100644
--- a/target/arm/helper.h
+++ b/target/arm/helper.h
@@ -1003,6 +1003,9 @@ DEF_HELPER_FLAGS_5(gvec_ummla_b, TCG_CALL_NO_RWG,
 DEF_HELPER_FLAGS_5(gvec_usmmla_b, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, i32)
 
+DEF_HELPER_FLAGS_5(gvec_bfdot, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+
 #ifdef TARGET_AARCH64
 #include "helper-a64.h"
 #include "helper-sve.h"
diff --git a/target/arm/neon-shared.decode b/target/arm/neon-shared.decode
index cc9f4cdd85..31a0839bbb 100644
--- a/target/arm/neon-shared.decode
+++ b/target/arm/neon-shared.decode
@@ -52,6 +52,8 @@ VUDOT          1111 110 00 . 10 .... .... 1101 . q:1 . 1 .... \
                vm=%vm_dp vn=%vn_dp vd=%vd_dp
 VUSDOT         1111 110 01 . 10 .... .... 1101 . q:1 . 0 .... \
                vm=%vm_dp vn=%vn_dp vd=%vd_dp
+VDOT_b16       1111 110 00 . 00 .... .... 1101 . q:1 . 0 .... \
+               vm=%vm_dp vn=%vn_dp vd=%vd_dp
 
 # VFM[AS]L
 VFML           1111 110 0 s:1 . 10 .... .... 1000 . 0 . 1 .... \
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index bad81580c5..523140ca56 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -1576,6 +1576,9 @@ FMLALT_zzzw     01100100 10 1 ..... 10 0 00 1 ..... .....  @rda_rn_rm_e0
 FMLSLB_zzzw     01100100 10 1 ..... 10 1 00 0 ..... .....  @rda_rn_rm_e0
 FMLSLT_zzzw     01100100 10 1 ..... 10 1 00 1 ..... .....  @rda_rn_rm_e0
 
+### SVE2 floating-point bfloat16 dot-product
+BFDOT_zzzz      01100100 01 1 ..... 10 0 00 0 ..... .....  @rda_rn_rm_e0
+
 ### SVE2 floating-point multiply-add long (indexed)
 FMLALB_zzxw     01100100 10 1 ..... 0100.0 ..... .....     @rrxr_3a esz=2
 FMLALT_zzxw     01100100 10 1 ..... 0100.1 ..... .....     @rrxr_3a esz=2
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index c528fb2cf0..fc16e0a126 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -12243,6 +12243,16 @@ static void disas_simd_three_reg_same_extra(DisasContext *s, uint32_t insn)
         }
         feature = dc_isar_feature(aa64_fcma, s);
         break;
+    case 0x1f: /* BFDOT */
+        switch (size) {
+        case 1:
+            feature = dc_isar_feature(aa64_bf16, s);
+            break;
+        default:
+            unallocated_encoding(s);
+            return;
+        }
+        break;
     default:
         unallocated_encoding(s);
         return;
@@ -12326,6 +12336,16 @@ static void disas_simd_three_reg_same_extra(DisasContext *s, uint32_t insn)
         }
         return;
 
+    case 0xf: /* BFDOT */
+        switch (size) {
+        case 1:
+            gen_gvec_op4_ool(s, is_q, rd, rn, rm, rd, 0, gen_helper_gvec_bfdot);
+            break;
+        default:
+            g_assert_not_reached();
+        }
+        return;
+
     default:
         g_assert_not_reached();
     }
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index aacbabd11e..3527430c1a 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -8586,3 +8586,15 @@ static bool trans_UMMLA(DisasContext *s, arg_rrrr_esz *a)
 {
     return do_i8mm_zzzz_ool(s, a, gen_helper_gvec_ummla_b, 0);
 }
+
+static bool trans_BFDOT_zzzz(DisasContext *s, arg_rrrr_esz *a)
+{
+    if (!dc_isar_feature(aa64_sve_bf16, s)) {
+        return false;
+    }
+    if (sve_access_check(s)) {
+        gen_gvec_ool_zzzz(s, gen_helper_gvec_bfdot,
+                          a->rd, a->rn, a->rm, a->ra, 0);
+    }
+    return true;
+}
diff --git a/target/arm/vec_helper.c b/target/arm/vec_helper.c
index 6c9f1e5146..e227ba6590 100644
--- a/target/arm/vec_helper.c
+++ b/target/arm/vec_helper.c
@@ -2655,3 +2655,43 @@ static void do_mmla_b(void *vd, void *vn, void *vm, void *va, uint32_t desc,
 DO_MMLA_B(gvec_smmla_b, do_smmla_b)
 DO_MMLA_B(gvec_ummla_b, do_ummla_b)
 DO_MMLA_B(gvec_usmmla_b, do_usmmla_b)
+
+/*
+ * BFloat16 Dot Product
+ */
+
+static float32 bfdotadd(float32 sum, uint32_t e1, uint32_t e2)
+{
+    /* FPCR is ignored for BFDOT and BFMMLA. */
+    float_status bf_status = {
+        .tininess_before_rounding = float_tininess_before_rounding,
+        .float_rounding_mode = float_round_to_odd_inf,
+        .flush_to_zero = true,
+        .flush_inputs_to_zero = true,
+        .default_nan_mode = true,
+    };
+    float32 t1, t2;
+
+    /*
+     * Extract each BFloat16 from the element pair, and shift
+     * them such that they become float32.
+     */
+    t1 = float32_mul(e1 << 16, e2 << 16, &bf_status);
+    t2 = float32_mul(e1 & 0xffff0000u, e2 & 0xffff0000u, &bf_status);
+    t1 = float32_add(t1, t2, &bf_status);
+    t1 = float32_add(sum, t1, &bf_status);
+
+    return t1;
+}
+
+void HELPER(gvec_bfdot)(void *vd, void *vn, void *vm, void *va, uint32_t desc)
+{
+    intptr_t i, opr_sz = simd_oprsz(desc);
+    float32 *d = vd, *a = va;
+    uint32_t *n = vn, *m = vm;
+
+    for (i = 0; i < opr_sz / 4; ++i) {
+        d[i] = bfdotadd(a[i], n[i], m[i]);
+    }
+    clear_tail(d, opr_sz, simd_maxsz(desc));
+}
diff --git a/target/arm/translate-neon.c.inc b/target/arm/translate-neon.c.inc
index 8cc53892d6..aed8a565e0 100644
--- a/target/arm/translate-neon.c.inc
+++ b/target/arm/translate-neon.c.inc
@@ -287,6 +287,15 @@ static bool trans_VUSDOT(DisasContext *s, arg_VUSDOT *a)
                         gen_helper_gvec_usdot_b);
 }
 
+static bool trans_VDOT_b16(DisasContext *s, arg_VDOT_b16 *a)
+{
+    if (!dc_isar_feature(aa32_bf16, s)) {
+        return false;
+    }
+    return do_neon_ddda(s, a->q * 7, a->vd, a->vn, a->vm, 0,
+                        gen_helper_gvec_bfdot);
+}
+
 static bool trans_VFML(DisasContext *s, arg_VFML *a)
 {
     int opr_sz;
-- 
2.25.1

