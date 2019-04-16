Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp3896806wrx;
        Tue, 16 Apr 2019 06:01:36 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxkEZKIUfTLk/6BTxc4SAFQrXXSkM6UMfHFyAFkgMz3e04zj+yJpNeq4QF7nXR9tozE4X0l
X-Received: by 2002:a1c:720a:: with SMTP id n10mr25641187wmc.107.1555419696156;
        Tue, 16 Apr 2019 06:01:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1555419696; cv=none;
        d=google.com; s=arc-20160816;
        b=V7xlEpN9A/ZqIf05Gr8zz9ZZvim6NQ6K3dIDAvwus6GoYP/dYptXjBT+84kU+ElGzV
         D2GtF41IBVaN+ywG/whknxW9Yb0golRFymlvQ7l4fxv5lqs5d/FezRyEHjIbVC7rQS6P
         OOmOnNOB997HlURtKe8JLhKtg3jVQ1w7ljMKf5QE2hBI6dKDdOxvFjmZT3XPxQPnIlge
         mEEVHMkpA8VUPR4rDrh1ie7DRUuSlVokPAMSG7VrCrn/BFOXQc73Wd5k9bORifs8Gb3d
         nIv5KZUX4nKCorxhze+L8NJYKKv4sTCTAmBOBvF5vcNsxgLRxWv1momemKy1zHYtpXde
         UX7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=BFL/4mmLnGxA0smTiBCKZfrdKeTsfE6ZtDY8NLO49os=;
        b=lctxDHd2oHE8CVXcHBb/m9g/oTmQJ1+g4vP5vbbXXhB1jm8q65QprYY5DktuNbJzih
         JIwpBtKsLbtUgeAacUJO0vChHZ0rToBakNnu3Wn0v+DjYieap3ysISAQOnby97SM9WnE
         rlvzbm7MMHjryCJGJmnTlC+IaqDG7KLmeNu3pimnjCNj8Z57eLlJc4b/py4jb4XUjugf
         pU1KXMWk1kGRkPKYqkRLnbLOABXwxt6pBFV/Lqk8E0rFNIduk8PZdo6NUSY1HZx50xWn
         hTAky/3gF5aukVVbFyMKVwwlFVGqrrEae2cuQhoPLkSvK31cd2I3PZ40cgYm2wJ3SqDr
         6sNg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=e0Ilpe1N;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x81si12808679wmg.167.2019.04.16.06.01.35
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 16 Apr 2019 06:01:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=e0Ilpe1N;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:36311 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hGNiR-0006tU-6D
	for alex.bennee@linaro.org; Tue, 16 Apr 2019 09:01:35 -0400
Received: from eggs.gnu.org ([209.51.188.92]:34497)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hGNf8-0004cf-IM
	for qemu-devel@nongnu.org; Tue, 16 Apr 2019 08:58:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hGNf6-0001Bt-VT
	for qemu-devel@nongnu.org; Tue, 16 Apr 2019 08:58:10 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:36135)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1hGNf6-00019V-KM
	for qemu-devel@nongnu.org; Tue, 16 Apr 2019 08:58:08 -0400
Received: by mail-wm1-x329.google.com with SMTP id h18so25326435wml.1
	for <qemu-devel@nongnu.org>; Tue, 16 Apr 2019 05:58:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=BFL/4mmLnGxA0smTiBCKZfrdKeTsfE6ZtDY8NLO49os=;
	b=e0Ilpe1NU8SWZ4EcFHTIQOONo+Vj7nYG75Oum+SzAr3zQfR5WwR9fkNbHE7r29s+pH
	oNnXCH/bHBS95C5VsCeXYTYVT7RAnRjDTQXdry0QwixKSit9jHCpKt0Chh97TY+16MqV
	kSz54y2buvyI5iR6cWQ4rG7Ff5yaoMz1dHzZKak0zzUVic+ku0oFv32ku53zzUfc+BfE
	MoKzbmfbtDnA7q4uoxTURYsz9Yj+EJEquh2dSosSK8K2J/JfZ5GGCiJVYV8WYeNCQAzO
	jiWvAQCAwTNib5RK9ADU8hbWniprDy7KzXyGzKbSjz/NKMyWITE9SD9Rg8tAmKDsBHrf
	clQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=BFL/4mmLnGxA0smTiBCKZfrdKeTsfE6ZtDY8NLO49os=;
	b=dDvsKX18/oVOwLg+rQTMLsZo2HQIThsO9Ep8TlEDw/AR8AnNlNGQtIRnynclAM99UM
	b58hrZyx+IzZFThiIdT94aitYDGZZEtJ0nNiBM8e5dnH6/AXop1ayGwqW19AgMm2q+lD
	dn2JK/hmCaU9Sc7t29k6yD3fmWOq7pPUg0yFV+5BJieOsPergksYUp0qaPZwXzAZBjqi
	cOzf0gOGyB81dpv/LrHVDjve+4+7jZp3m94U2qolpB+3E+beBBuRfiSWgvSpxHnxVxa5
	TkwCEPeO8KEbFYR7N3DV8Vh4lh6ae+uC9zAiuR/dltX7VIgcK650m5mgvvJdUGqf/ey0
	drQw==
X-Gm-Message-State: APjAAAWRUFl5WyspKHpIA7Rj+iAG9Im3NDe6SXDcX8ceTP7z3N0acm4D
	GSQvVDDIdLzQGw2QYG54yOfQtg==
X-Received: by 2002:a1c:cfcb:: with SMTP id f194mr25672482wmg.51.1555419485136;
	Tue, 16 Apr 2019 05:58:05 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
	by smtp.gmail.com with ESMTPSA id
	v184sm39476572wma.6.2019.04.16.05.58.02
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 16 Apr 2019 05:58:03 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue, 16 Apr 2019 13:57:27 +0100
Message-Id: <20190416125744.27770-10-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190416125744.27770-1-peter.maydell@linaro.org>
References: <20190416125744.27770-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::329
Subject: [Qemu-devel] [PATCH 09/26] target/arm/helper: don't return early
 for STKOF faults during stacking
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: z8YNhMZUrsRB

Currently the code in v7m_push_stack() which detects a violation
of the v8M stack limit simply returns early if it does so. This
is OK for the current integer-only code, but won't work for the
floating point handling we're about to add. We need to continue
executing the rest of the function so that we check for other
exceptions like not having permission to use the FPU and so
that we correctly set the FPCCR state if we are doing lazy
stacking. Refactor to avoid the early return.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.c | 23 ++++++++++++++++++-----
 1 file changed, 18 insertions(+), 5 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 297eb38fef0..a2222f84803 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -8187,7 +8187,7 @@ static bool v7m_push_stack(ARMCPU *cpu)
      * should ignore further stack faults trying to process
      * that derived exception.)
      */
-    bool stacked_ok;
+    bool stacked_ok = true, limitviol = false;
     CPUARMState *env = &cpu->env;
     uint32_t xpsr = xpsr_read(env);
     uint32_t frameptr = env->regs[13];
@@ -8218,7 +8218,14 @@ static bool v7m_push_stack(ARMCPU *cpu)
             armv7m_nvic_set_pending(env->nvic, ARMV7M_EXCP_USAGE,
                                     env->v7m.secure);
             env->regs[13] = limit;
-            return true;
+            /*
+             * We won't try to perform any further memory accesses but
+             * we must continue through the following code to check for
+             * permission faults during FPU state preservation, and we
+             * must update FPCCR if lazy stacking is enabled.
+             */
+            limitviol = true;
+            stacked_ok = false;
         }
     }
 
@@ -8227,7 +8234,7 @@ static bool v7m_push_stack(ARMCPU *cpu)
      * (which may be taken in preference to the one we started with
      * if it has higher priority).
      */
-    stacked_ok =
+    stacked_ok = stacked_ok &&
         v7m_stack_write(cpu, frameptr, env->regs[0], mmu_idx, false) &&
         v7m_stack_write(cpu, frameptr + 4, env->regs[1], mmu_idx, false) &&
         v7m_stack_write(cpu, frameptr + 8, env->regs[2], mmu_idx, false) &&
@@ -8237,8 +8244,14 @@ static bool v7m_push_stack(ARMCPU *cpu)
         v7m_stack_write(cpu, frameptr + 24, env->regs[15], mmu_idx, false) &&
         v7m_stack_write(cpu, frameptr + 28, xpsr, mmu_idx, false);
 
-    /* Update SP regardless of whether any of the stack accesses failed. */
-    env->regs[13] = frameptr;
+    /*
+     * If we broke a stack limit then SP was already updated earlier;
+     * otherwise we update SP regardless of whether any of the stack
+     * accesses failed or we took some other kind of fault.
+     */
+    if (!limitviol) {
+        env->regs[13] = frameptr;
+    }
 
     return !stacked_ok;
 }
-- 
2.20.1

