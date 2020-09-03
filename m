Received: by 2002:a19:ad09:0:0:0:0:0 with SMTP id t9csp538320lfc;
        Thu, 3 Sep 2020 06:34:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwwj+wxlME04CPgEebXu1IJZUhmixyLSdFXfcyPpbxD4gIQ7O/jaCApYiKuSOLFZhQC5Dqa
X-Received: by 2002:a25:cc02:: with SMTP id l2mr2715668ybf.308.1599140058097;
        Thu, 03 Sep 2020 06:34:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1599140058; cv=none;
        d=google.com; s=arc-20160816;
        b=GRYonv1mFOwY6ELibxnTVZPIbGR+gJnyjW4rVlGGB0/hacixRUC+WQV535qKfnVJHm
         oBvRnB5FkeNmU4eglct3eYp9pOKgrwposBMHlry5xA7QUBI3mrKLaSOk1KR/w4lKX58R
         ugqlGzO8iu3yuZuxZeuapCtIE/39Cq25aBQi6FLRJCWtiXUfQk/R2GLfE9rqmcUMOPiX
         0GK1C/P8wBJ1p7k0VJAxcE9RIKlvCELfdSYFmHS+/sXwRX2vRQ+U5Q7dYWRJNoS7t2uC
         seI0owxNiwPcD9lAhJnhUvUCuiAokMUzIBjisRNuxsToAsymieuWZyJcNeFh52TKu8Jf
         ZpGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=4YiQdBJ1hxjT11XkjIFT4NIt+VV3HO6udxhsJSHRVWc=;
        b=oz5NEXMjAe8AlmDOrpIBumz1Kqt3brfdjJttH4KDx8AJo1Ph38pfrU/4be3UOm+c/t
         Gcp5uUCSJ2gCshvOEhP/kJj9T5yi9hWqyXePZp861wd+NlQ//K+1VJYLkswTJ8GFmiFA
         SiATI/4M/TbHm4dBFDx/OFmJ/kJChNev7tpWlFzLlmPdEkj3xoJJ9BFYON6U32v3icaq
         LUva88ZjYGg8oZ1BQNyocK6NLR+CtX11oLqWBYxoU2wC19Cs1mPrEDyRppSgc21Fd//E
         Pbnr57kMm+steDgdoXMPwqtlMfpCGNdEaWRCXCqGnpauibhLTXuqfV8wXftSHp8hBvZe
         W58Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=d5CTtmeB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d82si3189249ybd.421.2020.09.03.06.34.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 03 Sep 2020 06:34:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=d5CTtmeB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kDpNZ-0002Q7-BQ
	for alex.bennee@linaro.org; Thu, 03 Sep 2020 09:34:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kDpLf-0007K0-6I
 for qemu-arm@nongnu.org; Thu, 03 Sep 2020 09:32:19 -0400
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:37311)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kDpLb-0007vA-Vg
 for qemu-arm@nongnu.org; Thu, 03 Sep 2020 09:32:18 -0400
Received: by mail-wm1-x343.google.com with SMTP id a9so2916971wmm.2
 for <qemu-arm@nongnu.org>; Thu, 03 Sep 2020 06:32:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4YiQdBJ1hxjT11XkjIFT4NIt+VV3HO6udxhsJSHRVWc=;
 b=d5CTtmeBhsM8Eb973i6HmTNgAWS6GnlU5KMxXj5CURQoQExfQ46o7C+fGa4Bue8OQI
 Y10y3Dl9fNJyIcouNOFVNBhc4l8+esPAPanQnhREHPtgO+exuvNyIhBkujZtpHRV3/jq
 7kMr6Wf2kBlQL5kL+HtbXhS3MkdAKDTUDvu9uzRxwr85x42kP7pTbjD/JwiwVXjQ8q9B
 IhNw4sTZ6RfFZgp3gciwpnCgNuhTaRThOl1FkTPjSI0tA7OCuCRdfUr4oewmgaKz+o1U
 dF4a5XZENpoG2yFowUUKaR1/bRC4gfQZFjCGTmeNc2zM92/xCQfJ4ESXlEMbZX9DBQ2V
 9kww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4YiQdBJ1hxjT11XkjIFT4NIt+VV3HO6udxhsJSHRVWc=;
 b=mAeIJIi36mRoSwzXEHudCF+FVJC5lpiZckX6iP8gqVXr+6E+A4IhVGHxV1SvtLIrqS
 f/Z3MGS1WFjgd0Iz4lAXn4ZXaow2i2vRwZAQe0RTZ+VNGNEkWluJNFPv8taFRM0FJ7cg
 JYKgh+yaIoYXlzkZll2/eTr/e6AaOLRo3wREGCIchjIl9+X45Kd7/wwv+J6F3snPQPLQ
 rlAO7wL+9/PCiJB4c7JnVxzsUgJQjjwtPs2teszk11RvodW0AdBB6XN8Ubj347/ZFXzL
 IQ4ksJT6jC7Z3jZqP9fkvZvYNU7VhzPCf7sU4HgPIDSzADlZ3IG9bOwzN+hyrJdEoOpv
 iN/w==
X-Gm-Message-State: AOAM5330f1PMvZg6DJ1smH6aXgxumfRyB0ZtblIomrz/F2FVcKgY1IlF
 +VwwgG8VuEljGOULisr2EvQiShXM5ggE14M3
X-Received: by 2002:a7b:c401:: with SMTP id k1mr2517484wmi.18.1599139934297;
 Thu, 03 Sep 2020 06:32:14 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id k24sm4301988wmj.19.2020.09.03.06.32.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Sep 2020 06:32:13 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 2/3] target/arm: Convert Neon VCVT fp size field to MO_* in
 decode
Date: Thu,  3 Sep 2020 14:32:08 +0100
Message-Id: <20200903133209.5141-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200903133209.5141-1-peter.maydell@linaro.org>
References: <20200903133209.5141-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::343;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x343.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
X-TUID: hogBOE8oDe+D

Convert the insns using the 2reg_vcvt and 2reg_vcvt_f16 formats
to pass the size through to the trans function as a MO_* value
rather than the '0==f32, 1==f16' used in the fp 3-same encodings.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/neon-dp.decode       | 3 +--
 target/arm/translate-neon.c.inc | 4 ++--
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/target/arm/neon-dp.decode b/target/arm/neon-dp.decode
index f453833396f..d7da2e7db3c 100644
--- a/target/arm/neon-dp.decode
+++ b/target/arm/neon-dp.decode
@@ -256,9 +256,8 @@ VMINNM_fp_3s     1111 001 1 0 . 1 . .... .... 1111 ... 1 .... @3same_fp
 @2reg_shll_b     .... ... . . . 001 shift:3  .... .... 0 . . . .... \
                  &2reg_shift vm=%vm_dp vd=%vd_dp size=0 q=0
 
-# We use size=0 for fp32 and size=1 for fp16 to match the 3-same encodings.
 @2reg_vcvt       .... ... . . . 1 ..... .... .... . q:1 . . .... \
-                 &2reg_shift vm=%vm_dp vd=%vd_dp size=0 shift=%neon_rshift_i5
+                 &2reg_shift vm=%vm_dp vd=%vd_dp size=2 shift=%neon_rshift_i5
 @2reg_vcvt_f16   .... ... . . . 11 .... .... .... . q:1 . . .... \
                  &2reg_shift vm=%vm_dp vd=%vd_dp size=1 shift=%neon_rshift_i4
 
diff --git a/target/arm/translate-neon.c.inc b/target/arm/translate-neon.c.inc
index 255c1cf8a2a..213c1c2174a 100644
--- a/target/arm/translate-neon.c.inc
+++ b/target/arm/translate-neon.c.inc
@@ -1626,7 +1626,7 @@ static bool do_fp_2sh(DisasContext *s, arg_2reg_shift *a,
         return false;
     }
 
-    if (a->size != 0) {
+    if (a->size == MO_16) {
         if (!dc_isar_feature(aa32_fp16_arith, s)) {
             return false;
         }
@@ -1646,7 +1646,7 @@ static bool do_fp_2sh(DisasContext *s, arg_2reg_shift *a,
         return true;
     }
 
-    fpst = fpstatus_ptr(a->size ? FPST_STD_F16 : FPST_STD);
+    fpst = fpstatus_ptr(a->size == MO_16 ? FPST_STD_F16 : FPST_STD);
     tcg_gen_gvec_2_ptr(rd_ofs, rm_ofs, fpst, vec_size, vec_size, a->shift, fn);
     tcg_temp_free_ptr(fpst);
     return true;
-- 
2.20.1

