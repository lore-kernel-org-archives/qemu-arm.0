Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp3519590lfb;
        Mon, 13 Sep 2021 03:07:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxuSNL/15P5tsFB2DsZ5lJa9SC4GY07mDpPXKrtoOBUnrL371iwtgI4Y5/jkC9HRvdCPgrO
X-Received: by 2002:a02:878e:: with SMTP id t14mr8866074jai.4.1631527634224;
        Mon, 13 Sep 2021 03:07:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1631527634; cv=none;
        d=google.com; s=arc-20160816;
        b=mTfIaAT/2oqCF809NkrYDInIT9ipjWqsEb8ajPSRwfatzUXeI6mPDs/DS/HBail0+J
         uBWap0eHQsGa3QthK4IGWS7dr6QsJoQs/wj4ERKnG6gzHO+rmsCtKcJafeE2WlYnm9kR
         oaoro2weWqKab3vUC9q6cXgpYqoQsztKMNrlFN6DsjMmT56H9khvYKatiVWsFe5W2Q1c
         K7XBPoPQhG+73BU7FpKRegEYWbYcu/Le4CPNiKFN6jUAzocJY5PkY6WeeK/kLUYCHgYY
         CJu74M0yPmbCdwxoAnJrnzmIN4lvjN98/AoSmQvePSMwiwIs8H1arO1UBBW8uKVaPcuP
         iwOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=JC4vSsgRJG98HE/fQrzJfWYreBbSmRKMA++s1R3fyBA=;
        b=f+2reDCeWmtYMt2C9LcWHtZr4juoSDPMxdVJcZxDkPUzfOuc92fO/xagq28+3JCg49
         Vpgrkt+iBn6/cAFumO/Q6aB0IbQAA9bMtMerZsJYU/IYTXgK43H5Aq6/uFGZc7oEwqvz
         fYBD4EV97j+HgbCTHxi0R6Q1MgaRR+XFxjzROBQRaDCKle9N/vjBsgZ0Td+H4s936qLb
         ONv0QDxFGXw9TY4iRD5Y2QCCw6KwFQc3kD49mU8V+XgmLyGVD7jAFdLw+ocSqMJuhjf3
         I/63tGy7YOy2luALm+ck/wJ6MQby+Zd/Mu34DUPFp4ysLQGr7hJBdkWxpX0cF8QlgYVo
         EdIQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=P1xfNYtd;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m18si7463814jav.88.2021.09.13.03.07.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 13 Sep 2021 03:07:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=P1xfNYtd;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mPirn-0007Dw-M7
	for alex.bennee@linaro.org; Mon, 13 Sep 2021 06:07:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45306)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mPift-0007KP-3J
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 05:54:53 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:36688)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mPifp-0001sD-5M
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 05:54:52 -0400
Received: by mail-wr1-x430.google.com with SMTP id g16so13725390wrb.3
 for <qemu-devel@nongnu.org>; Mon, 13 Sep 2021 02:54:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JC4vSsgRJG98HE/fQrzJfWYreBbSmRKMA++s1R3fyBA=;
 b=P1xfNYtdDUUUnfklfMmYa4pISsjDOMRaGQN7x+32BnKCAhuyPoQ5rXfeELQZNSSvts
 yZ3KlCdjR5Y/Q1Mt4yQQtFcqJVX9TJnddS75uykcc/olwBmby3bk+ggyKysIeIwKsesd
 Ko1pk5IVzSmhaC4jmNAgL0SEkcRkoG75W59Fkfu5CuHD7vUac+iS1TkhHLRW+63IE1Tw
 wU9d6DL96HXumRs5vA+enoVB6L0a2l49wYZHNRopBiaPS4F/yMY+7I+9IxEJRTHW1uXi
 RD3lzjWwlP0kzwS4PvmG8LF3U54bjfBxS1n00BRfyDFoAfYN1m8P7is8YYlpHWEyHtdQ
 2W/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JC4vSsgRJG98HE/fQrzJfWYreBbSmRKMA++s1R3fyBA=;
 b=aDou/gG25neMQFx0KdRkGxdXxjpAUgzujbHQyfCnJ71UXnNW54FyPxMr9BnO+wS8AU
 GiX/BcgOlwDow1RNcNqivEFgdcxgmQLk7jgw0123o2+PhI5KBR+gcHjhiJf1d91Gc1En
 7TxrF4G1bmhK/TxuL1HI3bdqUFZGlArIUq9/PqxIiekBEgytENAzVgdNiakGuME5nffZ
 rNgzH8rjVaQW3KDDO/yDDQqzfLxNIlfgQGd1qdxPH6ALdILmwjdjLlT6/LeRgYlQ8Xol
 hjeVA0k74VouOKwFVaKjuBC5DOzvQfoGvXI06UQbmjQx39Mgx6ru+8pQw1GYRhNmoUie
 CBmg==
X-Gm-Message-State: AOAM5314DxtVLFQqaXE1Iqq9wfXFCG2n/JonmeTPt6x2+XlcDR3Pyp5o
 7fKP4EFpH0fdoAz2e+9A+mih/w==
X-Received: by 2002:adf:fb07:: with SMTP id c7mr11255044wrr.399.1631526885613; 
 Mon, 13 Sep 2021 02:54:45 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id m184sm6475338wmm.3.2021.09.13.02.54.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Sep 2021 02:54:45 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 04/12] target/arm: Optimize MVE logic ops
Date: Mon, 13 Sep 2021 10:54:32 +0100
Message-Id: <20210913095440.13462-5-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210913095440.13462-1-peter.maydell@linaro.org>
References: <20210913095440.13462-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: pZlVY1ubxyQr

When not predicating, implement the MVE bitwise logical insns
directly using TCG vector operations.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
v1->v2: new mve_no_predication() function
---
 target/arm/translate-mve.c | 51 +++++++++++++++++++++++++++-----------
 1 file changed, 36 insertions(+), 15 deletions(-)

diff --git a/target/arm/translate-mve.c b/target/arm/translate-mve.c
index 0eca96e29cf..77b9f0db334 100644
--- a/target/arm/translate-mve.c
+++ b/target/arm/translate-mve.c
@@ -64,6 +64,16 @@ static TCGv_ptr mve_qreg_ptr(unsigned reg)
     return ret;
 }
 
+static bool mve_no_predication(DisasContext *s)
+{
+    /*
+     * Return true if we are executing the entire MVE instruction
+     * with no predication or partial-execution, and so we can safely
+     * use an inline TCG vector implementation.
+     */
+    return s->eci == 0 && s->mve_no_pred;
+}
+
 static bool mve_check_qreg_bank(DisasContext *s, int qmask)
 {
     /*
@@ -774,7 +784,8 @@ static bool trans_VNEG_fp(DisasContext *s, arg_1op *a)
     return do_1op(s, a, fns[a->size]);
 }
 
-static bool do_2op(DisasContext *s, arg_2op *a, MVEGenTwoOpFn fn)
+static bool do_2op_vec(DisasContext *s, arg_2op *a, MVEGenTwoOpFn fn,
+                       GVecGen3Fn *vecfn)
 {
     TCGv_ptr qd, qn, qm;
 
@@ -787,28 +798,38 @@ static bool do_2op(DisasContext *s, arg_2op *a, MVEGenTwoOpFn fn)
         return true;
     }
 
-    qd = mve_qreg_ptr(a->qd);
-    qn = mve_qreg_ptr(a->qn);
-    qm = mve_qreg_ptr(a->qm);
-    fn(cpu_env, qd, qn, qm);
-    tcg_temp_free_ptr(qd);
-    tcg_temp_free_ptr(qn);
-    tcg_temp_free_ptr(qm);
+    if (vecfn && mve_no_predication(s)) {
+        vecfn(a->size, mve_qreg_offset(a->qd), mve_qreg_offset(a->qn),
+              mve_qreg_offset(a->qm), 16, 16);
+    } else {
+        qd = mve_qreg_ptr(a->qd);
+        qn = mve_qreg_ptr(a->qn);
+        qm = mve_qreg_ptr(a->qm);
+        fn(cpu_env, qd, qn, qm);
+        tcg_temp_free_ptr(qd);
+        tcg_temp_free_ptr(qn);
+        tcg_temp_free_ptr(qm);
+    }
     mve_update_eci(s);
     return true;
 }
 
-#define DO_LOGIC(INSN, HELPER)                                  \
+static bool do_2op(DisasContext *s, arg_2op *a, MVEGenTwoOpFn *fn)
+{
+    return do_2op_vec(s, a, fn, NULL);
+}
+
+#define DO_LOGIC(INSN, HELPER, VECFN)                           \
     static bool trans_##INSN(DisasContext *s, arg_2op *a)       \
     {                                                           \
-        return do_2op(s, a, HELPER);                            \
+        return do_2op_vec(s, a, HELPER, VECFN);                 \
     }
 
-DO_LOGIC(VAND, gen_helper_mve_vand)
-DO_LOGIC(VBIC, gen_helper_mve_vbic)
-DO_LOGIC(VORR, gen_helper_mve_vorr)
-DO_LOGIC(VORN, gen_helper_mve_vorn)
-DO_LOGIC(VEOR, gen_helper_mve_veor)
+DO_LOGIC(VAND, gen_helper_mve_vand, tcg_gen_gvec_and)
+DO_LOGIC(VBIC, gen_helper_mve_vbic, tcg_gen_gvec_andc)
+DO_LOGIC(VORR, gen_helper_mve_vorr, tcg_gen_gvec_or)
+DO_LOGIC(VORN, gen_helper_mve_vorn, tcg_gen_gvec_orc)
+DO_LOGIC(VEOR, gen_helper_mve_veor, tcg_gen_gvec_xor)
 
 static bool trans_VPSEL(DisasContext *s, arg_2op *a)
 {
-- 
2.20.1

