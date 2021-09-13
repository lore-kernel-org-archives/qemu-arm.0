Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp3520753lfb;
        Mon, 13 Sep 2021 03:09:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw3H7mZ1WUq1Ef02VwLeRtfBfS8LRx89NPrxP+wNhhMzWSHgbYQuNTTD2dO79k8CUyzq7I9
X-Received: by 2002:a25:2cca:: with SMTP id s193mr16098822ybs.66.1631527741299;
        Mon, 13 Sep 2021 03:09:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1631527741; cv=none;
        d=google.com; s=arc-20160816;
        b=mhEctJLazei1AEstO7AsvUu9tXsPV4uWd78vn8S3K1zWUi+RLP2/r2q0Z3jqeRV9mZ
         TNP6t+Vo1iHWvEbRx/pU0wmGPnfOC3SVP4rFqTU3QpXxMphJRtFAci8BsqQRBrgJ7lDE
         tBN2r53esjbp3Wz2m/05XZUhknu/mV5zX7/U//7TBjfSLVNJ68XEzb5g5jv7uLSiprHc
         t4Ym6LQkwXKmybSoQlmSr6ZAnCaoc1v7xxjwM7RJuA0p0k+1gLlUWqFR1D0D3Dxnq86C
         oWekdoVzqAaWt2bsxhs9EWqMGiMA6meGSld9lUgDlQrFE/Up3Old6eBfQUhA1R+m6z8U
         CqFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=U3CtlRUa2Pflsx0SilrWyUarKoRlgAOB6ic9qq7mvCY=;
        b=SlHs0RuKRLq+VqYeoJAuFbJ058SCS9v/Zl3ouOvwM8CQrqXr1f6hFF3fmrb5KMoy8w
         KyKnwO6XSKYVXVT78YbpVAUw9HtMF9VcGSr8e0+gCX9aeWFzzQqKr8wEFNvmHx6ea4kZ
         Hwtco+pwQNZI4W4fB0uai2VWrnNdqas0sjy2PTlLki9mFX6fHuCMrSPFLP8ZhiPQAHuc
         nF/uX5PqUurvdH0DOLTftBw+zGzwcx0kWUVkEbPia15FIqkyMvmRSQ0xhiWoX2mIqDOL
         29ZB9xDvHhDth0zpJ3OSg2c8FB969ew0whbJEEsKbD+N8YrMpXx61DS7jg+keQ7xGhdz
         J4cA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tTShjKmC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c65si7513862ybc.278.2021.09.13.03.09.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 13 Sep 2021 03:09:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tTShjKmC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:49298 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mPitY-0002fS-Hc
	for alex.bennee@linaro.org; Mon, 13 Sep 2021 06:09:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45390)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mPifx-0007YC-QF
 for qemu-arm@nongnu.org; Mon, 13 Sep 2021 05:54:57 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:42681)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mPifq-0001vM-79
 for qemu-arm@nongnu.org; Mon, 13 Sep 2021 05:54:57 -0400
Received: by mail-wr1-x42c.google.com with SMTP id q11so13673484wrr.9
 for <qemu-arm@nongnu.org>; Mon, 13 Sep 2021 02:54:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=U3CtlRUa2Pflsx0SilrWyUarKoRlgAOB6ic9qq7mvCY=;
 b=tTShjKmCAJ3kxiBWpWRxGckXKlXC8lu0libaEs+REwWKMpNYnWaePVKsI3HpRx2QOE
 ibjzan6iX2FvoSwMZg8OqTqanNfozUSDLeaVfRYakmw5tudQmQLk2voSP5a7oKhuEqTZ
 LGGa0sEbtRzFa9Xw57CETuKLQbNvICLhb79AmxCxLRrsgPhMps/v06WhTSmb6Roflbsf
 cXwCzydX7AypCuohY2m8PtlzDzaoSWoYo50IZ4UdjVNzIFgLYC65L6SsFSEINr88TobA
 PIbQK5d82XDu/UpyPE86WdsPpgrg2YFZ/mA/Rn0IRdRD4AFZimUYQ+jncTd70E/ln1D0
 6DDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=U3CtlRUa2Pflsx0SilrWyUarKoRlgAOB6ic9qq7mvCY=;
 b=sALsf79ljnOJjETSlI9FEoQrpJmmGwIuxU4XE6FU1nwiJ2qeG61uD+kAA2vamLKh1c
 Md3M8lzyfhVEG1+i/djGpDuup0u3sVlApTxgqsfoK0ad8FVBhJOynCLj7h3A/PMldDPK
 2lFl0CVFVqq2p2a8U4HnpygsCT0bEluQlFNvgjmtXDcAseIDtQOVuuBe1++lOGEb8ANt
 3ZBn93oKZ2LKkKI+na9yVBUhwUjmDuUmqtxmxfov5fC1dysF/YGblPg+WRybKBwWSqlV
 1csYVMvLQLlSkvngBJ1v38eNwRLpLEH34lMRVjLw4Y35fr8AcIk3GnnVya2TIXtAel3Q
 vQhg==
X-Gm-Message-State: AOAM531ag/oUvq07ELIiNu7cOAY2u3KRB98f5Jgq5lVzTXoJxgDtieIv
 pVjnbG0f1TCxTsLxmoRgBK+ZHispGbcQoA==
X-Received: by 2002:a5d:44d1:: with SMTP id z17mr2563253wrr.187.1631526888781; 
 Mon, 13 Sep 2021 02:54:48 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id m184sm6475338wmm.3.2021.09.13.02.54.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Sep 2021 02:54:48 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 09/12] target/arm: Optimize MVE VSHL, VSHR immediate forms
Date: Mon, 13 Sep 2021 10:54:37 +0100
Message-Id: <20210913095440.13462-10-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210913095440.13462-1-peter.maydell@linaro.org>
References: <20210913095440.13462-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42c.google.com
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: XPchlIHR8Yt+

Optimize the MVE VSHL and VSHR immediate forms by using TCG vector
ops when possible.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate-mve.c | 83 +++++++++++++++++++++++++++++---------
 1 file changed, 63 insertions(+), 20 deletions(-)

diff --git a/target/arm/translate-mve.c b/target/arm/translate-mve.c
index 4583e22f21c..00fa4379a74 100644
--- a/target/arm/translate-mve.c
+++ b/target/arm/translate-mve.c
@@ -1570,8 +1570,8 @@ static bool trans_Vimm_1r(DisasContext *s, arg_1imm *a)
     return do_1imm(s, a, fn);
 }
 
-static bool do_2shift(DisasContext *s, arg_2shift *a, MVEGenTwoOpShiftFn fn,
-                      bool negateshift)
+static bool do_2shift_vec(DisasContext *s, arg_2shift *a, MVEGenTwoOpShiftFn fn,
+                          bool negateshift, GVecGen2iFn vecfn)
 {
     TCGv_ptr qd, qm;
     int shift = a->shift;
@@ -1594,34 +1594,77 @@ static bool do_2shift(DisasContext *s, arg_2shift *a, MVEGenTwoOpShiftFn fn,
         shift = -shift;
     }
 
-    qd = mve_qreg_ptr(a->qd);
-    qm = mve_qreg_ptr(a->qm);
-    fn(cpu_env, qd, qm, tcg_constant_i32(shift));
-    tcg_temp_free_ptr(qd);
-    tcg_temp_free_ptr(qm);
+    if (vecfn && mve_no_predication(s)) {
+        vecfn(a->size, mve_qreg_offset(a->qd), mve_qreg_offset(a->qm),
+              shift, 16, 16);
+    } else {
+        qd = mve_qreg_ptr(a->qd);
+        qm = mve_qreg_ptr(a->qm);
+        fn(cpu_env, qd, qm, tcg_constant_i32(shift));
+        tcg_temp_free_ptr(qd);
+        tcg_temp_free_ptr(qm);
+    }
     mve_update_eci(s);
     return true;
 }
 
-#define DO_2SHIFT(INSN, FN, NEGATESHIFT)                         \
-    static bool trans_##INSN(DisasContext *s, arg_2shift *a)    \
-    {                                                           \
-        static MVEGenTwoOpShiftFn * const fns[] = {             \
-            gen_helper_mve_##FN##b,                             \
-            gen_helper_mve_##FN##h,                             \
-            gen_helper_mve_##FN##w,                             \
-            NULL,                                               \
-        };                                                      \
-        return do_2shift(s, a, fns[a->size], NEGATESHIFT);      \
+static bool do_2shift(DisasContext *s, arg_2shift *a, MVEGenTwoOpShiftFn fn,
+                      bool negateshift)
+{
+    return do_2shift_vec(s, a, fn, negateshift, NULL);
+}
+
+#define DO_2SHIFT_VEC(INSN, FN, NEGATESHIFT, VECFN)                     \
+    static bool trans_##INSN(DisasContext *s, arg_2shift *a)            \
+    {                                                                   \
+        static MVEGenTwoOpShiftFn * const fns[] = {                     \
+            gen_helper_mve_##FN##b,                                     \
+            gen_helper_mve_##FN##h,                                     \
+            gen_helper_mve_##FN##w,                                     \
+            NULL,                                                       \
+        };                                                              \
+        return do_2shift_vec(s, a, fns[a->size], NEGATESHIFT, VECFN);   \
     }
 
-DO_2SHIFT(VSHLI, vshli_u, false)
+#define DO_2SHIFT(INSN, FN, NEGATESHIFT)        \
+    DO_2SHIFT_VEC(INSN, FN, NEGATESHIFT, NULL)
+
+static void do_gvec_shri_s(unsigned vece, uint32_t dofs, uint32_t aofs,
+                           int64_t shift, uint32_t oprsz, uint32_t maxsz)
+{
+    /*
+     * We get here with a negated shift count, and we must handle
+     * shifts by the element size, which tcg_gen_gvec_sari() does not do.
+     */
+    shift = -shift;
+    if (shift == (8 << vece)) {
+        shift--;
+    }
+    tcg_gen_gvec_sari(vece, dofs, aofs, shift, oprsz, maxsz);
+}
+
+static void do_gvec_shri_u(unsigned vece, uint32_t dofs, uint32_t aofs,
+                           int64_t shift, uint32_t oprsz, uint32_t maxsz)
+{
+    /*
+     * We get here with a negated shift count, and we must handle
+     * shifts by the element size, which tcg_gen_gvec_shri() does not do.
+     */
+    shift = -shift;
+    if (shift == (8 << vece)) {
+        tcg_gen_gvec_dup_imm(vece, dofs, oprsz, maxsz, 0);
+    } else {
+        tcg_gen_gvec_shri(vece, dofs, aofs, shift, oprsz, maxsz);
+    }
+}
+
+DO_2SHIFT_VEC(VSHLI, vshli_u, false, tcg_gen_gvec_shli)
 DO_2SHIFT(VQSHLI_S, vqshli_s, false)
 DO_2SHIFT(VQSHLI_U, vqshli_u, false)
 DO_2SHIFT(VQSHLUI, vqshlui_s, false)
 /* These right shifts use a left-shift helper with negated shift count */
-DO_2SHIFT(VSHRI_S, vshli_s, true)
-DO_2SHIFT(VSHRI_U, vshli_u, true)
+DO_2SHIFT_VEC(VSHRI_S, vshli_s, true, do_gvec_shri_s)
+DO_2SHIFT_VEC(VSHRI_U, vshli_u, true, do_gvec_shri_u)
 DO_2SHIFT(VRSHRI_S, vrshli_s, true)
 DO_2SHIFT(VRSHRI_U, vrshli_u, true)
 
-- 
2.20.1

