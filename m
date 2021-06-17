Received: by 2002:a19:f807:0:0:0:0:0 with SMTP id a7csp497047lff;
        Thu, 17 Jun 2021 05:36:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx2wfos5UAwTj5MF144RyfaLyU0/sI1Lco4frPCf0IMmTJeizAFC+IjsNcrEUAtQmer2DKl
X-Received: by 2002:a17:906:c1d2:: with SMTP id bw18mr4963483ejb.123.1623933372555;
        Thu, 17 Jun 2021 05:36:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623933372; cv=none;
        d=google.com; s=arc-20160816;
        b=WKZUq6CLRx4SErxsXQu825EvSBnOVQjDWSZmJOOSvP9is4G8MjXtaskZ23kNAk8Sm8
         M38ow+vsmbAm8irc+RiHFet74SV0WKmmWK5j5h/jSJPxqJ7C68/Zai/hZ2wbTXMe/dEG
         SRFtRbvVfNVamFICxm9q9QMvRdVh3sF0OajOygkm4gKwcFYrTIRgG1Z5NxySah3GCnZE
         PPVl/p1JQDVeQ1A9rTMi558Yp1AGYUB5j+tdrgnawinDdL2yPePVFoMEDd297T11tftI
         XIEIzUZnEZKUFBz4uU7xgfQpHSu3ii1zaWxm+L72UfqDrS6Q9IFzY8Lps/Y3uEtKQ7J5
         GAvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=cbkHoSNs6J2houYuZnK6YCgx5+RFrPH2605DmnBtA9o=;
        b=ZY1RA+v7vAlcuxA2iRZElA+gR2PGFr1x8pglUlH9UsSMv0v4udM5VexQisl866ohBb
         t3aeZwA5Fzm/+rEe8txbV4z42fUTRwocxyaa6ZTHK6JDr8v/7Q5lF069wON9KIEstgY8
         9bPshCQr3CFB81hIS6uvBJONwihYCrgRh0FCOEWkbWDz2rPN7cxHqhBw1gl1hTTBwsbF
         j/+8B8pKntVkpQ90YdCcwpxWkuElQAD3PNJhhlC4TflK6/J/Ue71DxFSaiotTgkpopNn
         MeH78i1XLBD6KLIhc9xNG7PpRh8syqEu5YIT/drbXgO3Yaha24LYRwelc0hoRPg1CRua
         mrbw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Jlxte7Is;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y4si5373975edi.355.2021.06.17.05.36.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 17 Jun 2021 05:36:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Jlxte7Is;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ltrFj-00033a-HZ
	for alex.bennee@linaro.org; Thu, 17 Jun 2021 08:36:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60974)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ltqx9-0001lv-7T
 for qemu-arm@nongnu.org; Thu, 17 Jun 2021 08:16:59 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:46848)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ltqwy-00074R-Uh
 for qemu-arm@nongnu.org; Thu, 17 Jun 2021 08:16:58 -0400
Received: by mail-wr1-x42d.google.com with SMTP id a11so6523769wrt.13
 for <qemu-arm@nongnu.org>; Thu, 17 Jun 2021 05:16:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cbkHoSNs6J2houYuZnK6YCgx5+RFrPH2605DmnBtA9o=;
 b=Jlxte7Is7q1W+L6tbJcAdwR3FjCNoYWe2DhdHlyqWYON/pmT2OQsiqLZD5Ub7Vgwfb
 Kq/VE0DRLrjzNY0wngc4T69oEkaQlTibWWdk6XRYiZ6G44CFxhQZAltANI49o1K9hhyV
 yCbMb/AIJq5CxnGxV9DlqvkBWKt9QumbvQW9Oj8sEutanbm/EETTaWJ4LUkgmT3I2405
 AqoIoY/XxadE5yqJ1BDHwnr7fn5gx8OTbKVc6VaX+xbirsQFD1yfw/Ae4CjN6p0XHlXA
 4/BRqbQ04S00EPUBrxeQr390QHMd3cCy/k10pGcacp2pFjAxs/msDpElnKCJDMkSdEQT
 6P0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cbkHoSNs6J2houYuZnK6YCgx5+RFrPH2605DmnBtA9o=;
 b=aLEzoe+nYuv9YY6ZXgWul+noHSP3fOlJSZ566bIvt2IQZLj7l/dMnz2WpyPuMfbLec
 2HtQk0DZZnZxlFScYjA8Im9dMYurXFZTOwJEUm0LYQHkIZZpuho6AzBoC2L2Fj9bHA4X
 h17x/cp7fzPpdpZAXaGK9m7xH3wWSCSUAu8EBrcAgq8ZMiFOahXQJD0oW2tUGwGoVHdt
 ImH5nRY1xq1MTjy6DkHQxc5HOEw0a9+GcEDtAA8GZdUThFpCf81Po0qsvshWJzscoMGw
 RrY1SYg1H/PytxjwR3HwmPCxVbG2Yz2khyCJxQimBks/J8jE+pdu6IE8ZM6BD3gXCuSe
 Wz3w==
X-Gm-Message-State: AOAM530S8onrWtdYZh69r+GhIIhZm8t4i2+2/oM/J2PcluXnx3dVb0DZ
 MC0xaerVGj71QLpa74SLPL0FhOaq6vdTuA==
X-Received: by 2002:a5d:4d50:: with SMTP id a16mr5285240wru.133.1623932207641; 
 Thu, 17 Jun 2021 05:16:47 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id a1sm6961970wra.63.2021.06.17.05.16.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Jun 2021 05:16:47 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v3 22/44] target/arm: Implement MVE VADD (scalar)
Date: Thu, 17 Jun 2021 13:16:06 +0100
Message-Id: <20210617121628.20116-23-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210617121628.20116-1-peter.maydell@linaro.org>
References: <20210617121628.20116-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42d.google.com
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
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ek/z33Dp5swZ

Implement the scalar form of the MVE VADD insn. This takes the
scalar operand from a general purpose register.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-mve.h    |  4 ++++
 target/arm/mve.decode      |  7 ++++++
 target/arm/mve_helper.c    | 22 +++++++++++++++++++
 target/arm/translate-mve.c | 45 ++++++++++++++++++++++++++++++++++++++
 4 files changed, 78 insertions(+)

diff --git a/target/arm/helper-mve.h b/target/arm/helper-mve.h
index f9d4b242beb..16b974a4270 100644
--- a/target/arm/helper-mve.h
+++ b/target/arm/helper-mve.h
@@ -145,6 +145,10 @@ DEF_HELPER_FLAGS_4(mve_vmulltub, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
 DEF_HELPER_FLAGS_4(mve_vmulltuh, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
 DEF_HELPER_FLAGS_4(mve_vmulltuw, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
 
+DEF_HELPER_FLAGS_4(mve_vadd_scalarb, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(mve_vadd_scalarh, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(mve_vadd_scalarw, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+
 DEF_HELPER_FLAGS_4(mve_vmlaldavsh, TCG_CALL_NO_WG, i64, env, ptr, ptr, i64)
 DEF_HELPER_FLAGS_4(mve_vmlaldavsw, TCG_CALL_NO_WG, i64, env, ptr, ptr, i64)
 DEF_HELPER_FLAGS_4(mve_vmlaldavxsh, TCG_CALL_NO_WG, i64, env, ptr, ptr, i64)
diff --git a/target/arm/mve.decode b/target/arm/mve.decode
index ac68f072bbe..0ee7a727081 100644
--- a/target/arm/mve.decode
+++ b/target/arm/mve.decode
@@ -26,6 +26,7 @@
 &vldr_vstr rn qd imm p a w size l u
 &1op qd qm size
 &2op qd qm qn size
+&2scalar qd qn rm size
 
 @vldr_vstr ....... . . . . l:1 rn:4 ... ...... imm:7 &vldr_vstr qd=%qd u=0
 # Note that both Rn and Qd are 3 bits only (no D bit)
@@ -36,6 +37,8 @@
 @2op .... .... .. size:2 .... .... .... .... .... &2op qd=%qd qm=%qm qn=%qn
 @2op_nosz .... .... .... .... .... .... .... .... &2op qd=%qd qm=%qm qn=%qn size=0
 
+@2scalar .... .... .. size:2 .... .... .... .... rm:4 &2scalar qd=%qd qn=%qn
+
 # Vector loads and stores
 
 # Widening loads and narrowing stores:
@@ -154,3 +157,7 @@ VRMLALDAVH_S     1110 1110 1 ... ... 0 ... x:1 1111 . 0 a:1 0 ... 0 @vmlaldav_no
 VRMLALDAVH_U     1111 1110 1 ... ... 0 ... x:1 1111 . 0 a:1 0 ... 0 @vmlaldav_nosz
 
 VRMLSLDAVH       1111 1110 1 ... ... 0 ... x:1 1110 . 0 a:1 0 ... 1 @vmlaldav_nosz
+
+# Scalar operations
+
+VADD_scalar      1110 1110 0 . .. ... 1 ... 0 1111 . 100 .... @2scalar
diff --git a/target/arm/mve_helper.c b/target/arm/mve_helper.c
index b51b7cd52e4..19cd1964f86 100644
--- a/target/arm/mve_helper.c
+++ b/target/arm/mve_helper.c
@@ -506,6 +506,28 @@ DO_2OP_S(vhsubs, do_vhsub_s)
 DO_2OP_U(vhsubu, do_vhsub_u)
 
 
+#define DO_2OP_SCALAR(OP, ESIZE, TYPE, FN)                              \
+    void HELPER(glue(mve_, OP))(CPUARMState *env, void *vd, void *vn,   \
+                                uint32_t rm)                            \
+    {                                                                   \
+        TYPE *d = vd, *n = vn;                                          \
+        TYPE m = rm;                                                    \
+        uint16_t mask = mve_element_mask(env);                          \
+        unsigned e;                                                     \
+        for (e = 0; e < 16 / ESIZE; e++, mask >>= ESIZE) {              \
+            mergemask(&d[H##ESIZE(e)], FN(n[H##ESIZE(e)], m), mask);    \
+        }                                                               \
+        mve_advance_vpt(env);                                           \
+    }
+
+/* provide unsigned 2-op scalar helpers for all sizes */
+#define DO_2OP_SCALAR_U(OP, FN)                 \
+    DO_2OP_SCALAR(OP##b, 1, uint8_t, FN)        \
+    DO_2OP_SCALAR(OP##h, 2, uint16_t, FN)       \
+    DO_2OP_SCALAR(OP##w, 4, uint32_t, FN)
+
+DO_2OP_SCALAR_U(vadd_scalar, DO_ADD)
+
 /*
  * Multiply add long dual accumulate ops.
  */
diff --git a/target/arm/translate-mve.c b/target/arm/translate-mve.c
index a0c4f10a935..388848b4ff0 100644
--- a/target/arm/translate-mve.c
+++ b/target/arm/translate-mve.c
@@ -31,6 +31,7 @@
 typedef void MVEGenLdStFn(TCGv_ptr, TCGv_ptr, TCGv_i32);
 typedef void MVEGenOneOpFn(TCGv_ptr, TCGv_ptr, TCGv_ptr);
 typedef void MVEGenTwoOpFn(TCGv_ptr, TCGv_ptr, TCGv_ptr, TCGv_ptr);
+typedef void MVEGenTwoOpScalarFn(TCGv_ptr, TCGv_ptr, TCGv_ptr, TCGv_i32);
 typedef void MVEGenDualAccOpFn(TCGv_i64, TCGv_ptr, TCGv_ptr, TCGv_ptr, TCGv_i64);
 
 /* Return the offset of a Qn register (same semantics as aa32_vfp_qreg()) */
@@ -383,6 +384,50 @@ DO_2OP(VMULL_BU, vmullbu)
 DO_2OP(VMULL_TS, vmullts)
 DO_2OP(VMULL_TU, vmulltu)
 
+static bool do_2op_scalar(DisasContext *s, arg_2scalar *a,
+                          MVEGenTwoOpScalarFn fn)
+{
+    TCGv_ptr qd, qn;
+    TCGv_i32 rm;
+
+    if (!dc_isar_feature(aa32_mve, s) ||
+        !mve_check_qreg_bank(s, a->qd | a->qn) ||
+        !fn) {
+        return false;
+    }
+    if (a->rm == 13 || a->rm == 15) {
+        /* UNPREDICTABLE */
+        return false;
+    }
+    if (!mve_eci_check(s) || !vfp_access_check(s)) {
+        return true;
+    }
+
+    qd = mve_qreg_ptr(a->qd);
+    qn = mve_qreg_ptr(a->qn);
+    rm = load_reg(s, a->rm);
+    fn(cpu_env, qd, qn, rm);
+    tcg_temp_free_i32(rm);
+    tcg_temp_free_ptr(qd);
+    tcg_temp_free_ptr(qn);
+    mve_update_eci(s);
+    return true;
+}
+
+#define DO_2OP_SCALAR(INSN, FN) \
+    static bool trans_##INSN(DisasContext *s, arg_2scalar *a)   \
+    {                                                           \
+        static MVEGenTwoOpScalarFn * const fns[] = {            \
+            gen_helper_mve_##FN##b,                             \
+            gen_helper_mve_##FN##h,                             \
+            gen_helper_mve_##FN##w,                             \
+            NULL,                                               \
+        };                                                      \
+        return do_2op_scalar(s, a, fns[a->size]);               \
+    }
+
+DO_2OP_SCALAR(VADD_scalar, vadd_scalar)
+
 static bool do_long_dual_acc(DisasContext *s, arg_vmlaldav *a,
                              MVEGenDualAccOpFn *fn)
 {
-- 
2.20.1

