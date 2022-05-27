Received: by 2002:ac2:4318:0:0:0:0:0 with SMTP id l24csp1255584lfh;
        Fri, 27 May 2022 13:00:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw+Sm4VUq+1PRqkyolEzL3jxG4dJCO3g0USfddgd/Z1p2ZVTJpJgdA684fz3AI7X+6ji3c9
X-Received: by 2002:a0c:dd12:0:b0:464:3176:39d6 with SMTP id u18-20020a0cdd12000000b00464317639d6mr2982846qvk.25.1653681602131;
        Fri, 27 May 2022 13:00:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1653681602; cv=none;
        d=google.com; s=arc-20160816;
        b=V5PXJguCNMNDHlTlAxGPPrj1KWrK2Z5ccDcArYWGQb44+6BsNBxibUdh1w3wcTMC/f
         WrNwnXo+yDHbaPffIHzE2ZEO1S/qf+EwOQVCgeOhVzqvAAjOnZeH93bUlpm3OSkHAsS6
         w6rmf/9XgtUZjf6Q2d2md424hU6JoZ0FaJBL3tr4F7CF2pVTaCUbt49Tt9KyO1s7liD9
         IsrTB8uhixwS0+XNmva1HlyM7E5mfrG1+HKhh/qUIaGZeTR6umdBkUwlf7bENoG+KTu4
         cxoHz+DolSJlGfgcaqj5VVoc3jmDzdgQBUJgAtAkaYLeZiQC3rJ44ljjfsquPxDlob6e
         vRGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=11N5+YHeZIXnN7sKpy/puuW1Y/2Ud1NGhUoj8udVQrk=;
        b=SRFinOP3Omn7EG8sO2Oqy1pGNhJ2TVcerVRk2SLzLp2F8sd5GRQTYaqZ6z3zBmsHR9
         WcnmzfWcZ5rQPnmXuPdvSIH+X6v0Fbn830CAKXfs2dIET5HJ07e7Ln5SITzJqcb6BKGI
         lgk/q2EJSklsPg60JC6NYTj2p1rsN33KzTGy8wvowj4utkmCTOXU/ZWRwV6c+DBls+zH
         /DppF+DkXgeQ8f/ho21XQT51W2i0aW9MiN8V/NaBYHTdCRWfLnOnzR1+a39ygeKP78T1
         doFBxmfpXU9KrfkWthPc/eXgSkZPYfalZtFt+bH9QIdp0FQerNpFTMxzgNC5fu14ZNoL
         lmzQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HGxuv272;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h1-20020ae9ec01000000b006a57ea3ee9csi3604545qkg.744.2022.05.27.12.59.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 27 May 2022 13:00:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HGxuv272;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56428 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nug7q-0005hV-M4
	for alex.bennee@linaro.org; Fri, 27 May 2022 15:59:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45766)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nuefh-0001wv-Mm
 for qemu-arm@nongnu.org; Fri, 27 May 2022 14:26:50 -0400
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f]:43772)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nuefZ-0005LY-Pp
 for qemu-arm@nongnu.org; Fri, 27 May 2022 14:26:47 -0400
Received: by mail-pg1-x52f.google.com with SMTP id s68so4562727pgs.10
 for <qemu-arm@nongnu.org>; Fri, 27 May 2022 11:26:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=11N5+YHeZIXnN7sKpy/puuW1Y/2Ud1NGhUoj8udVQrk=;
 b=HGxuv272bgLj8sqY4ZpfWQPw8dxRyAwubzKUgXKBZKG6BNfmTQ4FI+UjeLIzvkyvZE
 D3CfvGIfIoKvI7WcSO2NJ7+Og2pHr9XtiVUMTqjGZfCzTiwT1eXa+Qw/hjU6xBFq/sn8
 05LCqs4zi7KJaQCCNeMsnpwuRyoME8ds7epAlFp8aZ8er8NMntMC3W40vpKJwG6I1mcH
 aogkcwz25B6Fv+zIBDDvwQQ+l8VOzStApnlaDo4Ulx5/I9tFtw7DpA44V3/ocbwSKUQm
 X3RRZ5QTmpfCeGAtlub7bXdb1rCFD8SZsbVLWMGfV8T6Qj1K4ELcQpWwhIQVTBjQpGfa
 hgvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=11N5+YHeZIXnN7sKpy/puuW1Y/2Ud1NGhUoj8udVQrk=;
 b=CIYxtj8smEV0H1yfEvMW7MTCUil3nPIyVT3/pX2bdw9DHwASJGui81ATRPLVd9dzqC
 QZMN2kJ7heROJ+yhYqM4gdJu4JkN7qoWT0sBbQXR6vVrF285uyZh9b8Z2JbnINUWdxp9
 X4YiqpgyqbQxoh6kTOFYfVJykqi6PiehQ2y8AV92lpqCXid8uEkGSS4oCDNPdpJj7Co9
 QsoABf1IXxY3ProM/hDHDUDTxXoKqk3clZFsmpj1DRAC4pcWwJOHT+ZZqsRdZPuT/XSd
 migQ1YpwDpqQFcctdm9qv9BjFcWLm9aj9sMKoVx3T1w+lsYNHgptsRMxhbyE9yqMmVP9
 LAqg==
X-Gm-Message-State: AOAM532lx29wJg4lDjHhcufEk+AXV6/d8OGzSNWcmz3JZWA/RmS33tNl
 X5+sYuiktuxrBA+gQbpuCp9Bzg==
X-Received: by 2002:aa7:83d0:0:b0:50c:eb2b:8e8a with SMTP id
 j16-20020aa783d0000000b0050ceb2b8e8amr44847497pfn.31.1653676000700; 
 Fri, 27 May 2022 11:26:40 -0700 (PDT)
Received: from stoup.. (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 g13-20020aa7874d000000b0050dc762816fsm3781539pfo.73.2022.05.27.11.26.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 May 2022 11:26:40 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 098/114] target/arm: Rename do_zpzz_ptr to
 gen_gvec_fpst_arg_zpzz
Date: Fri, 27 May 2022 11:18:51 -0700
Message-Id: <20220527181907.189259-99-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220527181907.189259-1-richard.henderson@linaro.org>
References: <20220527181907.189259-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: c0XfPitzDVlJ

Rename the function to match other expansion functions and
move to be adjacent.  Split out gen_gvec_fpst_zzzp as a
helper while we're at it.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-sve.c | 52 +++++++++++++++++++++++---------------
 1 file changed, 31 insertions(+), 21 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 2ee48186ba..f0f2db351e 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -369,6 +369,35 @@ static bool gen_gvec_ool_arg_zpzz(DisasContext *s, gen_helper_gvec_4 *fn,
     return gen_gvec_ool_zzzp(s, fn, a->rd, a->rn, a->rm, a->pg, data);
 }
 
+/* Invoke an out-of-line helper on 3 Zregs and a predicate. */
+static bool gen_gvec_fpst_zzzp(DisasContext *s, gen_helper_gvec_4_ptr *fn,
+                               int rd, int rn, int rm, int pg, int data,
+                               ARMFPStatusFlavour flavour)
+{
+    if (fn == NULL) {
+        return false;
+    }
+    if (sve_access_check(s)) {
+        unsigned vsz = vec_full_reg_size(s);
+        TCGv_ptr status = fpstatus_ptr(flavour);
+
+        tcg_gen_gvec_4_ptr(vec_full_reg_offset(s, rd),
+                           vec_full_reg_offset(s, rn),
+                           vec_full_reg_offset(s, rm),
+                           pred_full_reg_offset(s, pg),
+                           status, vsz, vsz, data, fn);
+        tcg_temp_free_ptr(status);
+    }
+    return true;
+}
+
+static bool gen_gvec_fpst_arg_zpzz(DisasContext *s, gen_helper_gvec_4_ptr *fn,
+                                   arg_rprr_esz *a)
+{
+    return gen_gvec_fpst_zzzp(s, fn, a->rd, a->rn, a->rm, a->pg, 0,
+                              a->esz == MO_16 ? FPST_FPCR_F16 : FPST_FPCR);
+}
+
 /* Invoke a vector expander on two Zregs and an immediate.  */
 static bool gen_gvec_fn_zzi(DisasContext *s, GVecGen2iFn *gvec_fn,
                             int esz, int rd, int rn, uint64_t imm)
@@ -3812,25 +3841,6 @@ DO_FP3(FRSQRTS, rsqrts)
  *** SVE Floating Point Arithmetic - Predicated Group
  */
 
-static bool do_zpzz_fp(DisasContext *s, arg_rprr_esz *a,
-                       gen_helper_gvec_4_ptr *fn)
-{
-    if (fn == NULL) {
-        return false;
-    }
-    if (sve_access_check(s)) {
-        unsigned vsz = vec_full_reg_size(s);
-        TCGv_ptr status = fpstatus_ptr(a->esz == MO_16 ? FPST_FPCR_F16 : FPST_FPCR);
-        tcg_gen_gvec_4_ptr(vec_full_reg_offset(s, a->rd),
-                           vec_full_reg_offset(s, a->rn),
-                           vec_full_reg_offset(s, a->rm),
-                           pred_full_reg_offset(s, a->pg),
-                           status, vsz, vsz, 0, fn);
-        tcg_temp_free_ptr(status);
-    }
-    return true;
-}
-
 #define DO_FP3(NAME, name) \
 static bool trans_##NAME(DisasContext *s, arg_rprr_esz *a)          \
 {                                                                   \
@@ -3838,7 +3848,7 @@ static bool trans_##NAME(DisasContext *s, arg_rprr_esz *a)          \
         NULL, gen_helper_sve_##name##_h,                            \
         gen_helper_sve_##name##_s, gen_helper_sve_##name##_d        \
     };                                                              \
-    return do_zpzz_fp(s, a, fns[a->esz]);                           \
+    return gen_gvec_fpst_arg_zpzz(s, fns[a->esz], a);               \
 }
 
 DO_FP3(FADD_zpzz, fadd)
@@ -7121,7 +7131,7 @@ static bool do_sve2_zpzz_fp(DisasContext *s, arg_rprr_esz *a,
     if (!dc_isar_feature(aa64_sve2, s)) {
         return false;
     }
-    return do_zpzz_fp(s, a, fn);
+    return gen_gvec_fpst_arg_zpzz(s, fn, a);
 }
 
 #define DO_SVE2_ZPZZ_FP(NAME, name)                                         \
-- 
2.34.1

