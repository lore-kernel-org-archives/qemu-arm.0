Received: by 2002:ac2:5ccb:0:0:0:0:0 with SMTP id f11csp2011027lfq;
        Mon, 11 Apr 2022 17:49:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwjXBIpGhCUYZpJXVSO02VsiTA/8uUG3geru/9Wz+c0s64bTI5U6ohw86Kg25lY/sffR2Tf
X-Received: by 2002:a25:aac8:0:b0:641:1873:96a with SMTP id t66-20020a25aac8000000b006411873096amr11711904ybi.565.1649724597949;
        Mon, 11 Apr 2022 17:49:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1649724597; cv=none;
        d=google.com; s=arc-20160816;
        b=sPzDpox8ZCd8oNJO5++TbzLN0LRe3e786XMMHmIR9DII73UX4l5x9J4cFRkRRyB9o5
         Bi/VMIayDU07RygZzyPoryN+2yE3adcmSYykUzppmWEmYtCRB9rSCTd5/i0Aokx7RXea
         m0imEOgHwTrK+LH8jlEo46thD92yKEnixGmXD7jZA9qBKR8K3yZ9SPa6BdoSpRg8pfIG
         e/L50NEHJyWQa1b4eW0orXtAfiZtzQdb5+6YDowyjzcqGDI4ZrrjA6UfEH6I4e+Q6fW/
         ZibfJ5HO50ReMoIwiB4PFkcpZcgdl2MP+H0/PAwxdSMcfzvqLCXKi7Swrei9bIHGodxd
         kriQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=T0NCGCLb0/jnRMpSTq7CEyTx8JltKRBy1weeZ4yC0a0=;
        b=JnqnHefMfPEfrWGH7BaWKrFcRbJCXRCn9rdu++B/NmFvDJtg6KZ2uyqnLn6xu2NNoB
         4vqgFzzC5u9Em0FSb3yqJgwUG5/4lCo6HgZEcPA8Kdm5hKzePQdg2z+DBpJB6bdq6neJ
         1+tQvZlFtPzoI1+PfB3531lw142249YLbjx7L4mi1utaLVV4ImGeNOqCHfjhgY3jL5tk
         FFs+Dk8xjXGnsex2i2eiXv9yprOkdszwNaSou4V4ov7F+wnfZZGFLByW4SUW2+BjhquY
         1lJVgDn+A8LcV2U/A0zLVFsW3qJjZW9cfA7xSD0suRp0uY6kdjiTfJmfzm+l24e4elm7
         xhvQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=TEzj9Fzg;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 206-20020a250bd7000000b006416451888fsi2276555ybl.1.2022.04.11.17.49.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 11 Apr 2022 17:49:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=TEzj9Fzg;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50228 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ne4jF-0000KO-BH
	for alex.bennee@linaro.org; Mon, 11 Apr 2022 20:49:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ne4Te-0001vM-S5
 for qemu-devel@nongnu.org; Mon, 11 Apr 2022 20:33:52 -0400
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536]:34637)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ne4Tb-0001sr-IM
 for qemu-devel@nongnu.org; Mon, 11 Apr 2022 20:33:49 -0400
Received: by mail-pg1-x536.google.com with SMTP id t4so15649613pgc.1
 for <qemu-devel@nongnu.org>; Mon, 11 Apr 2022 17:33:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=T0NCGCLb0/jnRMpSTq7CEyTx8JltKRBy1weeZ4yC0a0=;
 b=TEzj9Fzg0ZrGdKmzZGeqDQbJM4phOLbTeoo6oJAuEPgbFgXqsA7ROtv6YdPz5Y+SIG
 b5cQCcNvtu88ghO1jK5dhjFlL7PlwsfjsMtTBY18FUf0OTryUhryD4uyaqh0dKiVBZ/J
 efNMesSBLhIFfOKo8yhp6E/daTVl4U3lxB+h0qxvLqMMGx+TxxaJqwO1nuuGoC2cHYwL
 6+GyQZHjHr3LdKg5D4Bm7LQPk1Ovib3IAY+HchfNvjXUcZYGbSZlNza+FCNfbSX8+SH4
 c6UCdKnDe6L7Cex30bwFdJbCFJ/r7oEMScE3eCidXRDvEJxzZwyn+cWcWiEA81tsu5Ue
 l1oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=T0NCGCLb0/jnRMpSTq7CEyTx8JltKRBy1weeZ4yC0a0=;
 b=OPFjhVP6MLNVMoWZC3Jhk1i4ESoQJ4fo9+lw3kSQB+orBJwbepBQjKwceMBqERjAHl
 VQD+dJ+b731ujqKZFmg7UuRBaSe1x94csGY+IOU97HLm3rg6+cGaF9TJDAwxq2/PSsJn
 QEN2cxT0D5bnZ3L6Z7gXjGg3SfeFn97vWH+8vTTSRt56D4R0ZR3TgbfVKsod8eyfcW3d
 3E8V4feUZUIMWamWtEqBQjvfjdntPaHrkfccx6Z1/SbdUR54fO2eYdU7M/NgNNf1gqoA
 erPc24/Jt2P+mWdgMa9gKFOMbwPiGIQ9a58De85SecybY3n4OVxnpIdkTzQ3KHt2NPVh
 g5Hw==
X-Gm-Message-State: AOAM530UcBpur+8JitMIe4GCcv0odgp00kh4N/P6jcqYO/gsmAbhaN1Z
 tNrEBmaA+YgnHa7aOF8O3sm7bWVkonU+vA==
X-Received: by 2002:a65:604b:0:b0:398:ebeb:ad8f with SMTP id
 a11-20020a65604b000000b00398ebebad8fmr29161043pgp.89.1649723623253; 
 Mon, 11 Apr 2022 17:33:43 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 g15-20020a056a0023cf00b004e17e11cb17sm38346669pfc.111.2022.04.11.17.33.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Apr 2022 17:33:42 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 17/24] target/arm: Enable FEAT_IESB for -cpu max
Date: Mon, 11 Apr 2022 17:33:19 -0700
Message-Id: <20220412003326.588530-18-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220412003326.588530-1-richard.henderson@linaro.org>
References: <20220412003326.588530-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x536.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: gwtT9zUJSO0S

This feature is AArch64 only, and applies to physical SErrors,
which QEMU does not implement, thus the feature is a nop.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v2: Update emulation.rst
---
 docs/system/arm/emulation.rst | 1 +
 target/arm/cpu64.c            | 1 +
 2 files changed, 2 insertions(+)

diff --git a/docs/system/arm/emulation.rst b/docs/system/arm/emulation.rst
index 35b6f7d4de..ebd9e418cc 100644
--- a/docs/system/arm/emulation.rst
+++ b/docs/system/arm/emulation.rst
@@ -24,6 +24,7 @@ the following architecture extensions:
 - FEAT_FlagM2 (Enhancements to flag manipulation instructions)
 - FEAT_HPDS (Hierarchical permission disables)
 - FEAT_I8MM (AArch64 Int8 matrix multiplication instructions)
+- FEAT_IESB (Implicit error synchronization event)
 - FEAT_JSCVT (JavaScript conversion instructions)
 - FEAT_LOR (Limited ordering regions)
 - FEAT_LPA (Large Physical Address space)
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 3525aba610..c91528a12e 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -781,6 +781,7 @@ static void aarch64_max_initfn(Object *obj)
     t = cpu->isar.id_aa64mmfr2;
     t = FIELD_DP64(t, ID_AA64MMFR2, CNP, 1);      /* FEAT_TTCNP */
     t = FIELD_DP64(t, ID_AA64MMFR2, UAO, 1);      /* FEAT_UAO */
+    t = FIELD_DP64(t, ID_AA64MMFR2, IESB, 1);     /* FEAT_IESB */
     t = FIELD_DP64(t, ID_AA64MMFR2, VARANGE, 1);  /* FEAT_LVA */
     t = FIELD_DP64(t, ID_AA64MMFR2, ST, 1);       /* FEAT_TTST */
     cpu->isar.id_aa64mmfr2 = t;
-- 
2.25.1

