Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp2605975lfy;
        Mon, 24 Aug 2020 07:29:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxeWcjR5MC/B4g8B0CQUrIeUpR2Tga/fdYe5/qYhHCsmOo61Cxgj9Yrotm9OYLLwJNZGsx7
X-Received: by 2002:a25:ce07:: with SMTP id x7mr8463980ybe.18.1598279398951;
        Mon, 24 Aug 2020 07:29:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598279398; cv=none;
        d=google.com; s=arc-20160816;
        b=JRNO6zFEZtnIjRAwKPpGxG3KjoSwgw/zVIAzjGsHQV3ERFjsb3OEuWLHBKFpRhSkxq
         YjrZYsZbR93Rzm3XZrv8FwXJ0/a9lNBTPLb6ZSSHaiL5l7ib4lE41eiINwOvy5LOOOgl
         OwT83frhIFdQJlsIp2fA/6Q83f5hVdDgQRFeuhwZ1793Et7eIwk+ItCBZB2099pdX4PZ
         UuWAKbMIofSVIsBCrncmA3MtbmWmv8ZI5YPWLqs4660fSV4VvJLJo53/oB1G8ieyNVN1
         DNDiN6ofbzEsUCx4L9t2A9SGSqbQ4GbLX1YdW5kCHjAeMBDOWrnxhAsUfEMnunNytxC6
         lqeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=ci/ulDsit8wkhMp971B43GkiVu05JRtE/XvKE+cel5E=;
        b=XKVSOmet55SbnWjVyAOubrgG6DdmXUq8T7Qeqp5aSmz7s9x6Z29j05nhX6JznXAp9p
         SEs7rbq2R6Q26mDouX6Dff0kkutCRJH1Lf2jZ86vtFQap7Sm43SXwUwxzeyzJBy5LlNI
         iWiupcjQ+MulhkIdGtlwe1cO1+cpq9j3a1OaI8OSef2xjqNV2W54vnuV0t2mLodv1pFX
         FzNBbFb+kj/b4uMqOOQjwry1qrk+rSQtCcgeVLol/uIlNrXkYXsWsfvj0rVMB8JXwuUo
         79JxexgELWNFHFFYkA1jcuGVr6QgHX+50LUT1PJm4bqTJjX/AWYe4pwk8MSfh6XLK1XB
         3Iag==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="g/P5YcAo";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d74si11845515ybh.58.2020.08.24.07.29.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 Aug 2020 07:29:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="g/P5YcAo";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39718 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kADTy-0008EX-6y
	for alex.bennee@linaro.org; Mon, 24 Aug 2020 10:29:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43090)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kADTm-0008C5-GT
 for qemu-arm@nongnu.org; Mon, 24 Aug 2020 10:29:46 -0400
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:42783)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kADTj-0002gE-Rh
 for qemu-arm@nongnu.org; Mon, 24 Aug 2020 10:29:46 -0400
Received: by mail-wr1-x444.google.com with SMTP id d16so8894504wrq.9
 for <qemu-arm@nongnu.org>; Mon, 24 Aug 2020 07:29:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=ci/ulDsit8wkhMp971B43GkiVu05JRtE/XvKE+cel5E=;
 b=g/P5YcAoEi4sI2RiJxfwzIlyrHoslMtq9+pNNDM+cYeObKWqh4HJ+bH5K40gFV06k5
 Xc0IWjxE4PO2974mEvr+49n3X43cNEAm6tgJnntZOQHrUIm/sdAAz65Vctj7zLGE3y8V
 EhQnx+sbiDEp8FQFKyh9qG4yCS/xKCH/+aaWl8e49l3gYghN5aRoyWdgdPBj7AmJ0dWZ
 bgoEHcYbMOkASxcf6qk+mxzTCLCqQkrWrYmwlvRZwmFWyL72wUKRPjSmjXLbBqzRtyfZ
 c/XrO+YXWKg9br8KW2Hr9h8mpmH7TMGFgt4YIoA5nRUZzxRheyG2jaeuFfQnCH/1zBl0
 6RMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ci/ulDsit8wkhMp971B43GkiVu05JRtE/XvKE+cel5E=;
 b=H6TxdsZZvJ6VXFCg7HM8pVQCjQLD1Pa4o8BCoSXqcMgmWy4s6Vq8lKAmThSXRq0h0O
 EMG064aENWtJEfQjxuiRUYkljX9qFipsyFsWFJykWHCYxS3KF5qvtLk3eBENdvK67nBC
 P9KyeJ4q+fjkng2F6sSDSapZ4j397gOvn8wGkGDtxs02j6J9aeGYnjKj0VfFkcDW9zfP
 0ps6YWvuQx1mxoiJbiAL9X7IDZSd7AqIR3IkCGH5VhRonHlM2NGk3iUatej/ICp06a5G
 ajlW6ICcjRs7bH5W5uTo4fTBQOobQ304wL+cGdGvWyiXT6q28lk1I9kVE/ddjcNmgiG/
 K05Q==
X-Gm-Message-State: AOAM533oezXbCwfMfQNHS9YqiOvfqTHJ1HkdgkVqPumR9D72ye9Tx39F
 fBo/B+eMvoBMnJ+Ao8neZaVTdjAB7v+P0Za2
X-Received: by 2002:a5d:5052:: with SMTP id h18mr6340729wrt.156.1598279382350; 
 Mon, 24 Aug 2020 07:29:42 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id b14sm24499091wrj.93.2020.08.24.07.29.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Aug 2020 07:29:41 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 05/22] target/arm: Macroify trans functions for VFMA, VFMS,
 VFNMA, VFNMS
Date: Mon, 24 Aug 2020 15:29:17 +0100
Message-Id: <20200824142934.20850-6-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200824142934.20850-1-peter.maydell@linaro.org>
References: <20200824142934.20850-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::444;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x444.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: tDH32yV5dgH1

Macroify creation of the trans functions for single and double
precision VFMA, VFMS, VFNMA, VFNMS. The repetition was OK for
two sizes, but we're about to add halfprec and it will get a bit
more than seems reasonable.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate-vfp.c.inc | 50 +++++++++-------------------------
 1 file changed, 13 insertions(+), 37 deletions(-)

diff --git a/target/arm/translate-vfp.c.inc b/target/arm/translate-vfp.c.inc
index 15bb23688bd..9937fa569e4 100644
--- a/target/arm/translate-vfp.c.inc
+++ b/target/arm/translate-vfp.c.inc
@@ -1978,26 +1978,6 @@ static bool do_vfm_sp(DisasContext *s, arg_VFMA_sp *a, bool neg_n, bool neg_d)
     return true;
 }
 
-static bool trans_VFMA_sp(DisasContext *s, arg_VFMA_sp *a)
-{
-    return do_vfm_sp(s, a, false, false);
-}
-
-static bool trans_VFMS_sp(DisasContext *s, arg_VFMS_sp *a)
-{
-    return do_vfm_sp(s, a, true, false);
-}
-
-static bool trans_VFNMA_sp(DisasContext *s, arg_VFNMA_sp *a)
-{
-    return do_vfm_sp(s, a, false, true);
-}
-
-static bool trans_VFNMS_sp(DisasContext *s, arg_VFNMS_sp *a)
-{
-    return do_vfm_sp(s, a, true, true);
-}
-
 static bool do_vfm_dp(DisasContext *s, arg_VFMA_dp *a, bool neg_n, bool neg_d)
 {
     /*
@@ -2069,25 +2049,21 @@ static bool do_vfm_dp(DisasContext *s, arg_VFMA_dp *a, bool neg_n, bool neg_d)
     return true;
 }
 
-static bool trans_VFMA_dp(DisasContext *s, arg_VFMA_dp *a)
-{
-    return do_vfm_dp(s, a, false, false);
-}
+#define MAKE_ONE_VFM_TRANS_FN(INSN, PREC, NEGN, NEGD)                   \
+    static bool trans_##INSN##_##PREC(DisasContext *s,                  \
+                                      arg_##INSN##_##PREC *a)           \
+    {                                                                   \
+        return do_vfm_##PREC(s, a, NEGN, NEGD);                         \
+    }
 
-static bool trans_VFMS_dp(DisasContext *s, arg_VFMS_dp *a)
-{
-    return do_vfm_dp(s, a, true, false);
-}
+#define MAKE_VFM_TRANS_FNS(PREC) \
+    MAKE_ONE_VFM_TRANS_FN(VFMA, PREC, false, false) \
+    MAKE_ONE_VFM_TRANS_FN(VFMS, PREC, true, false) \
+    MAKE_ONE_VFM_TRANS_FN(VFNMA, PREC, false, true) \
+    MAKE_ONE_VFM_TRANS_FN(VFNMS, PREC, true, true)
 
-static bool trans_VFNMA_dp(DisasContext *s, arg_VFNMA_dp *a)
-{
-    return do_vfm_dp(s, a, false, true);
-}
-
-static bool trans_VFNMS_dp(DisasContext *s, arg_VFNMS_dp *a)
-{
-    return do_vfm_dp(s, a, true, true);
-}
+MAKE_VFM_TRANS_FNS(sp)
+MAKE_VFM_TRANS_FNS(dp)
 
 static bool trans_VMOV_imm_sp(DisasContext *s, arg_VMOV_imm_sp *a)
 {
-- 
2.20.1

