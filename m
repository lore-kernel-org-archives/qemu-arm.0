Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp758421lfb;
        Thu, 19 Nov 2020 14:09:05 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy1JlIY7YPVB6sCn/Yff1Ju9kU5YPBDmIBBW3zdWhdRmySHG9ltjc9V2D1okXn02XSKCE6b
X-Received: by 2002:a25:ae14:: with SMTP id a20mr20863357ybj.43.1605823745759;
        Thu, 19 Nov 2020 14:09:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1605823745; cv=none;
        d=google.com; s=arc-20160816;
        b=o+neZJuB2luon5n9gasEE3OBqvjqkA/gO7dUuWc1lR7kQkhUMXU+3SZKchwkSrebJb
         8d68oykgJezPwnMi6LgljSYppCQzEWbc0e2+yUXEyBmQ4rz3sJBvOk13qIhzlVGZ+tap
         EiCZFSWuR/1mciFoQs5bKi32x6vH26FXTJk9Osb0uMie5+nPHYOWja4kt+QK0mute3ZE
         Nm2QZNcRYlNBfN4r8azCxAuLGQEHMDx5KuTHnlMC7xTQkrNNpobIhVTO9MsLKuXOFXId
         kefT55m9pcY+qsD53G7uD3Ai0K26pHRcM5zSE+CW3NYVdoo01oMrn/A5FqAfs1IUo3fD
         u19g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=ztib3BbeM9JUbGctUP1Ui7NNujTzQdmeDBZWCNALq4Y=;
        b=fA3nNt0O35AwBBwBNdw6iVm934UcCmMRXqmDZkTZ5Ynxhpg5SgG4LQwBKL9ryAKmxz
         t6FnGAKywIdKot/tmScxuZ+vyYEaQS64D0q5oBAANfQUb7vCtv/RVmRrb12YT+4cnKdo
         fnI10shCT65iyCxs9os3juCeIN4NXAgEVPqqmqquN0m99+Dql6OmwfVodmRvteVEueoc
         h90xIOOl/QnY0CXLMhYRcCBH441fMZjt0Eqjdo9i0qxYhq+YjhHcN5RdQ1sg8X/1PEoU
         Wg8uy8VhXyaRZzMcvk4LirVhmL+Bf3BY+j7bnXjVs1fTzQs/q2nNx3KuPBqR+POMPs0B
         +Xhg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mUXBV4Y+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k8si769161ybh.95.2020.11.19.14.09.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Nov 2020 14:09:05 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mUXBV4Y+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kfs6z-0000Bg-3L
	for alex.bennee@linaro.org; Thu, 19 Nov 2020 17:09:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51620)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kfrvG-0000yx-Fw
 for qemu-arm@nongnu.org; Thu, 19 Nov 2020 16:56:58 -0500
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:34720)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kfrv3-0004Ee-2N
 for qemu-arm@nongnu.org; Thu, 19 Nov 2020 16:56:58 -0500
Received: by mail-wm1-x343.google.com with SMTP id x13so1671577wmj.1
 for <qemu-arm@nongnu.org>; Thu, 19 Nov 2020 13:56:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=ztib3BbeM9JUbGctUP1Ui7NNujTzQdmeDBZWCNALq4Y=;
 b=mUXBV4Y+GEwgY3duB07dfXllNzghYWt8Z2qs1Ffwu7SivtqckZ2A2G9CFDsP8kAsdN
 woUBO8uPbrj7ezmWhc0KnpEyJm6WIJ7p2N1xSJlMwlt9hSjrTmJlUUd1k8zjb6A2qHbD
 YP02FDN3y3BnILNvMEtlraIr9M6WAnX1JNyfms0kTSwqjgMHdEnG1HfMAXw/f20Mr43h
 vodutjC8lSytAyUqlTCBbXNLP6XaGF7hGiQxLTpOig9zN4W4dIjMfUOo5qhm0QsrD2Pj
 mLbfKdXbk+7vMhT3fweZnAkXsGWARfJe4NAUN+4KHbSvqIdm3SW6dBEoTBblOrGB4ZYJ
 PW+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ztib3BbeM9JUbGctUP1Ui7NNujTzQdmeDBZWCNALq4Y=;
 b=TPRPyI0PBDmpGtBmpU6I5Je5qXkpp0iArlABBEjqIBRk/Ic09YwgkRaIDf2CEUOm9y
 ortaA3oyPc+C95XACsQU1K5AKgMzhjKb4x4Incsg0SoplNISGaRsIHbFmoiggSH/rhRL
 u58kWRCadknDUD9Izb2ZbQpLYt44saioCSBQd9up6ECzektmjT1aLhc3yceezMI5iNqw
 Q8b/k+xA9b1lCH2ErPXNcrf+j2+aYPgjVTwBCWRhIJxYCI3tpc4HS3UlnL+BYiaSwCxB
 ykyQ54U2C/T2nW07REOq5nsVVqb7cpx57Y+moT72FGECfLWeUmcO71JAp0rVrGZk/H4C
 riZw==
X-Gm-Message-State: AOAM530DTkI/MIMK8jpqY4CRgE3RZjgiu/7xHHKgL9Pxv8SCw3L0wcrE
 w1pOCMYtggxOCNT8EZgUr7hqrGYQrodbJQ==
X-Received: by 2002:a1c:1d51:: with SMTP id d78mr6547219wmd.60.1605823001969; 
 Thu, 19 Nov 2020 13:56:41 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id j15sm1934851wrm.62.2020.11.19.13.56.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Nov 2020 13:56:41 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 19/28] target/arm: Implement new v8.1M NOCP check for
 exception return
Date: Thu, 19 Nov 2020 21:56:08 +0000
Message-Id: <20201119215617.29887-20-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201119215617.29887-1-peter.maydell@linaro.org>
References: <20201119215617.29887-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::343;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x343.google.com
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
X-TUID: hllgjaJirCXU

In v8.1M a new exception return check is added which may cause a NOCP
UsageFault (see rule R_XLTP): before we clear s0..s15 and the FPSCR
we must check whether access to CP10 from the Security state of the
returning exception is disabled; if it is then we must take a fault.

(Note that for our implementation CPPWR is always RAZ/WI and so can
never cause CP10 accesses to fail.)

The other v8.1M change to this register-clearing code is that if MVE
is implemented VPR must also be cleared, so add a TODO comment to
that effect.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/m_helper.c | 22 +++++++++++++++++++++-
 1 file changed, 21 insertions(+), 1 deletion(-)

diff --git a/target/arm/m_helper.c b/target/arm/m_helper.c
index 9cdc8a64c29..0bdd3cc10e9 100644
--- a/target/arm/m_helper.c
+++ b/target/arm/m_helper.c
@@ -1515,7 +1515,27 @@ static void do_v7m_exception_exit(ARMCPU *cpu)
             v7m_exception_taken(cpu, excret, true, false);
             return;
         } else {
-            /* Clear s0..s15 and FPSCR */
+            if (arm_feature(env, ARM_FEATURE_V8_1M)) {
+                /* v8.1M adds this NOCP check */
+                bool nsacr_pass = exc_secure ||
+                    extract32(env->v7m.nsacr, 10, 1);
+                bool cpacr_pass = v7m_cpacr_pass(env, exc_secure, true);
+                if (!nsacr_pass) {
+                    armv7m_nvic_set_pending(env->nvic, ARMV7M_EXCP_USAGE, true);
+                    env->v7m.cfsr[M_REG_S] |= R_V7M_CFSR_NOCP_MASK;
+                    qemu_log_mask(CPU_LOG_INT, "...taking UsageFault on existing "
+                        "stackframe: NSACR prevents clearing FPU registers\n");
+                    v7m_exception_taken(cpu, excret, true, false);
+                } else if (!cpacr_pass) {
+                    armv7m_nvic_set_pending(env->nvic, ARMV7M_EXCP_USAGE,
+                                            exc_secure);
+                    env->v7m.cfsr[exc_secure] |= R_V7M_CFSR_NOCP_MASK;
+                    qemu_log_mask(CPU_LOG_INT, "...taking UsageFault on existing "
+                        "stackframe: CPACR prevents clearing FPU registers\n");
+                    v7m_exception_taken(cpu, excret, true, false);
+                }
+            }
+            /* Clear s0..s15 and FPSCR; TODO also VPR when MVE is implemented */
             int i;
 
             for (i = 0; i < 16; i += 2) {
-- 
2.20.1

