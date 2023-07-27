Received: by 2002:a17:906:2484:b0:98d:b2f5:1316 with SMTP id e4csp1228713ejb;
        Thu, 27 Jul 2023 04:57:15 -0700 (PDT)
X-Google-Smtp-Source: APBJJlGF9fI7xTHVKEIwDdzyJKAzfZvz/4oBnVmEH42H/XilTq2r+lLBI/WNFds2iPTlgT52iNcK
X-Received: by 2002:a05:6358:990d:b0:135:51a5:4da0 with SMTP id w13-20020a056358990d00b0013551a54da0mr2206213rwa.1.1690459034766;
        Thu, 27 Jul 2023 04:57:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1690459034; cv=none;
        d=google.com; s=arc-20160816;
        b=QOQvC6GQGqkIIwBdvHFjXYWNoVPiUi2lZrcF7BDAVQOhqNDfso2oandECO20473g/4
         nySldUEfqFRrvCAvvgNBgonf//EDVkEQ08TSA2VcyLf4c6eh93S7bBN4ewvQkSAKnerU
         LHq1ydGey/Hc4aToMrcfIkXA10uIdS9Kh0LhAyl6+jkjBzeV2/pjI+XzT0DORDQjle9Z
         gYL5PegTQflkZvZSefXS1DMmL3sd+B4eSeESeEyW8wS7511CqW8YZRR8i6XaAs8TdyiA
         SWr64y6ZJqeLWCr2pAs9ZCfFO0ZW12g1yptKE6SJJAaPgiY0R3/b+FIPCb5vOQwpOGB8
         mZng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=uXfHqz+RHJ/O21c1DjEA4/cGZpHuHI1aduBBkgJ49gQ=;
        fh=JUXg3dueAqP+mYuf9ko2qwG7+0qNEOa/D1sI5OKab+M=;
        b=CEhFIGof4GaHdrVeAhllpxrexjcW1K8KOOIYnH00XtKb+LlAlRmMwehl5enJOEMSRV
         rQS9BOgZKK3BpJlmL7Nv/i2/QTEZgD1rD3BJT421yDNIgPfgO6u9FtD56b1XrPFGmNKG
         nyEKnr27lsqpKpc1+8Drpmj9TkA/qFO22dpWRNWaa3KiqEsp+BjHhBjMyXJOratxLz1M
         +P+Tl+PeGinj1+6y1RGND+jgdXRALV91p+8ZDXBJTxnOTvNWd98vqc7w1WoRguL8V035
         pyQRC4QiZi2UxrLZ8Q61i/m7KwDFKYjMdQjTTD03WGL6MwJFRxN4RaMOCCA3eNWpGeb1
         LJKg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=v2ys6ePf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r3-20020a05620a298300b0076838b06660si660210qkp.373.2023.07.27.04.57.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 27 Jul 2023 04:57:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=v2ys6ePf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qOyOm-0005d8-OG; Thu, 27 Jul 2023 06:39:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qOyOl-0005cH-EE
 for qemu-arm@nongnu.org; Thu, 27 Jul 2023 06:39:11 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qOyOj-0000TG-Qc
 for qemu-arm@nongnu.org; Thu, 27 Jul 2023 06:39:11 -0400
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-31751d7d96eso797879f8f.1
 for <qemu-arm@nongnu.org>; Thu, 27 Jul 2023 03:39:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1690454348; x=1691059148;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=uXfHqz+RHJ/O21c1DjEA4/cGZpHuHI1aduBBkgJ49gQ=;
 b=v2ys6ePfPlWbMK7qpNrCRyXx5ekx4+Tx32ThbEq0xZwfM0yOH4x7x/iPPuDPMEiwX3
 edOsRPIjRg2etXhBreUIXmc9SQHEhj8nLQ2cfKXdx+7t1ypSUjg5HXPhfJYM5SmjQjxh
 gkdMavaJlCrfjyQNJd17wxt/k3Ux4V3BqpnGAKCHT8WDAg0NZ4U6m02yluoB2uljZ8uP
 RiqGNg6pMMULXsoC8EsI/3h6u88n0avvuV9hSoo5LLD0OEo7vkORHaxB9ShSOo7wUQtd
 9qslgr0L2KFVEQI4A1jZji5Tn66vejWjztn7daTcwXCIoOjIgvoh5IsobCag4JegOu+h
 roSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690454348; x=1691059148;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=uXfHqz+RHJ/O21c1DjEA4/cGZpHuHI1aduBBkgJ49gQ=;
 b=czzgY1CNAX4czTlzT0z+WPom05cvjD6fcR5RlcDUeeZhd83PEbGz7iGwW4C/SHenQG
 QU47JZd6mSPPUVJ1f3UNFChUvNnWDuImNiTURvgCN03/xOTxQmEkrmmeJMIpCeQwKDIS
 SRrGGlYTpa0M2SQP1+Yjzm5SK05YUsYyLJIc6GE9H9B9BT9vRqiDkzEkkQJmou2TMyON
 BIFO5yJJSjSx7EKg92lhx7BoMOzrpavHVEBQ2JgF+AWyXIQKN/iTAlcPWaljz9fJV3r1
 h23kKN3RV92oGBXls+0iU4KDkosHeOm9x/DjZnLlWuXPHQNDD5V6FK1hQtnfrDnxwUJU
 utsg==
X-Gm-Message-State: ABy/qLb63EePpll1QPeaa1BE8NK6URM/U89wRGIIa0gDYREEKco6eJwy
 mVta3peyx9NT/pMC6H2yLP3kwg1bewnB1aS9ngM=
X-Received: by 2002:a5d:6706:0:b0:316:e422:38e8 with SMTP id
 o6-20020a5d6706000000b00316e42238e8mr1466785wru.66.1690454348154; 
 Thu, 27 Jul 2023 03:39:08 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 c4-20020a056000104400b003143b14848dsm1633205wrx.102.2023.07.27.03.39.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jul 2023 03:39:07 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: qemu-stable@nongnu.org
Subject: [PATCH] target/arm: Avoid writing to constant TCGv in trans_CSEL()
Date: Thu, 27 Jul 2023 11:39:06 +0100
Message-Id: <20230727103906.2641264-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x431.google.com
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 64zvNYRAW2Dx

In commit 0b188ea05acb5 we changed the implementation of
trans_CSEL() to use tcg_constant_i32(). However, this change
was incorrect, because the implementation of the function
sets up the TCGv_i32 rn and rm to be either zero or else
a TCG temp created in load_reg(), and these TCG temps are
then in both cases written to by the emitted TCG ops.
The result is that we hit a TCG assertion:

qemu-system-arm: ../../tcg/tcg.c:4455: tcg_reg_alloc_mov: Assertion `!temp_readonly(ots)' failed.

(or on a non-debug build, just produce a garbage result)

Adjust the code so that rn and rm are always writeable
temporaries whether the instruction is using the special
case "0" or a normal register as input.

Cc: qemu-stable@nongnu.org
Fixes: 0b188ea05acb5 ("target/arm: Use tcg_constant in trans_CSEL")
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
These insns are v8.1M-only, which is why this bug has
lingered for so long.
---
 target/arm/tcg/translate.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/target/arm/tcg/translate.c b/target/arm/tcg/translate.c
index 13c88ba1b9f..b71ac2d0d53 100644
--- a/target/arm/tcg/translate.c
+++ b/target/arm/tcg/translate.c
@@ -8799,7 +8799,7 @@ static bool trans_IT(DisasContext *s, arg_IT *a)
 /* v8.1M CSEL/CSINC/CSNEG/CSINV */
 static bool trans_CSEL(DisasContext *s, arg_CSEL *a)
 {
-    TCGv_i32 rn, rm, zero;
+    TCGv_i32 rn, rm;
     DisasCompare c;
 
     if (!arm_dc_feature(s, ARM_FEATURE_V8_1M)) {
@@ -8817,16 +8817,17 @@ static bool trans_CSEL(DisasContext *s, arg_CSEL *a)
     }
 
     /* In this insn input reg fields of 0b1111 mean "zero", not "PC" */
-    zero = tcg_constant_i32(0);
+    rn = tcg_temp_new_i32();
+    rm = tcg_temp_new_i32();
     if (a->rn == 15) {
-        rn = zero;
+        tcg_gen_movi_i32(rn, 0);
     } else {
-        rn = load_reg(s, a->rn);
+        load_reg_var(s, rn, a->rn);
     }
     if (a->rm == 15) {
-        rm = zero;
+        tcg_gen_movi_i32(rm, 0);
     } else {
-        rm = load_reg(s, a->rm);
+        load_reg_var(s, rm, a->rm);
     }
 
     switch (a->op) {
@@ -8846,7 +8847,7 @@ static bool trans_CSEL(DisasContext *s, arg_CSEL *a)
     }
 
     arm_test_cc(&c, a->fcond);
-    tcg_gen_movcond_i32(c.cond, rn, c.value, zero, rn, rm);
+    tcg_gen_movcond_i32(c.cond, rn, c.value, tcg_constant_i32(0), rn, rm);
 
     store_reg(s, a->rd, rn);
     return true;
-- 
2.34.1

