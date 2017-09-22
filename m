Received: by 10.223.172.38 with SMTP id v35csp3212178wrc;
        Fri, 22 Sep 2017 08:02:39 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QAoxC2x3juOYqeBkGekU8IZ0k1tIhtxJOdFH9W2sB1HTvQRjDi+45E4+9DZF2+fX8IncjvP
X-Received: by 10.200.24.203 with SMTP id o11mr8622751qtk.35.1506092559645;
        Fri, 22 Sep 2017 08:02:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1506092559; cv=none;
        d=google.com; s=arc-20160816;
        b=w9L1sAZB8YtRPwrUUgP0G9CUL4BdoR2vdHqQ9IqHKUWwWAEYkfdmdEtFLfj824XQjb
         WXkj193Wto1c6CeRnm4gIIXuXb7Shpsvhpkk/fmpEGdF4PF9q6VZtJSTvXpbXdrNpk6g
         IKpBUeRu3rp6EKnGwahKMhKZmIhWAXv3j8HZNRkQybgEXQWAdhJlTXCxHi9CkEtgwFuy
         yKtUSzc0kSxA/uFlQkGdEHeALnraXAR+6DciQurZsCMFOBZEwq5cEWKSTqpEREamldk6
         f+xaG9DdLRozIohUP6JRevS+qBZ46Q4XUAvTkrt+FQulplmjyG8cgbHgpEdVEARaoHPV
         fIPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=6HmA2U4klQOsgHF1rsyUvRRab2OhshniWamNmBWDaNA=;
        b=RLvLlyYX8BVA3qysPeT4y4XzjI0ZZR4+wnHDO9sFAFW/tMRkZiCgQ8b8hjmfjauUpS
         RsNGuoyK1gvOABrAuPj4eXVDgE1JmE3xbL7f1uMQPq1MeB1DUV1IfrJVIQFA0vsaRk3Y
         4PSkAPpM5hvUFBiyrNjwYruoOM3hyxzgCXGSLbHHszUIfOP/tioiQ1KHBD0Yaw7REROh
         5SdoKZkByLTwuCi/I1U8VhoyyQpmwRyQ9zHWvHCkqWdpb75bGXbDOavSIxJr7WhXroRr
         hqYaWRSBGKL8FhDPIxnz2uLQdVHgkHebTN7OTz4+VvRIK0/OGzTsbEyzzumJomcCQXZu
         +YcA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i132si23971qke.166.2017.09.22.08.02.39
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 22 Sep 2017 08:02:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59324 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dvPTR-0001z2-9Z
	for alex.bennee@linaro.org; Fri, 22 Sep 2017 11:02:37 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46877)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1dvPQW-0007tY-7O
	for qemu-arm@nongnu.org; Fri, 22 Sep 2017 10:59:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1dvPQV-00042M-6O
	for qemu-arm@nongnu.org; Fri, 22 Sep 2017 10:59:36 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:37550)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1dvPQV-00041E-0K; Fri, 22 Sep 2017 10:59:35 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1dvPQT-00079n-Rq; Fri, 22 Sep 2017 15:59:33 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Fri, 22 Sep 2017 15:59:53 +0100
Message-Id: <1506092407-26985-7-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1506092407-26985-1-git-send-email-peter.maydell@linaro.org>
References: <1506092407-26985-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 06/20] target/arm: Check for xPSR mismatch usage
 faults earlier for v8M
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: c5IiGmzYMq7t

ARM v8M specifies that the INVPC usage fault for mismatched
xPSR exception field and handler mode bit should be checked
before updating the PSR and SP, so that the fault is taken
with the existing stack frame rather than by pushing a new one.
Perform this check in the right place for v8M.

Since v7M specifies in its pseudocode that this usage fault
check should happen later, we have to retain the original
code for that check rather than being able to merge the two.
(The distinction is architecturally visible but only in
very obscure corner cases like attempting an invalid exception
return with an exception frame in read only memory.)

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.c | 30 +++++++++++++++++++++++++++---
 1 file changed, 27 insertions(+), 3 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 4444d04..a2e46fb 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -6426,6 +6426,29 @@ static void do_v7m_exception_exit(ARMCPU *cpu)
         }
         xpsr = ldl_phys(cs->as, frameptr + 0x1c);
 
+        if (arm_feature(env, ARM_FEATURE_V8)) {
+            /* For v8M we have to check whether the xPSR exception field
+             * matches the EXCRET value for return to handler/thread
+             * before we commit to changing the SP and xPSR.
+             */
+            bool will_be_handler = (xpsr & XPSR_EXCP) != 0;
+            if (return_to_handler != will_be_handler) {
+                /* Take an INVPC UsageFault on the current stack.
+                 * By this point we will have switched to the security state
+                 * for the background state, so this UsageFault will target
+                 * that state.
+                 */
+                armv7m_nvic_set_pending(env->nvic, ARMV7M_EXCP_USAGE,
+                                        env->v7m.secure);
+                env->v7m.cfsr[env->v7m.secure] |= R_V7M_CFSR_INVPC_MASK;
+                v7m_exception_taken(cpu, excret);
+                qemu_log_mask(CPU_LOG_INT, "...taking UsageFault on existing "
+                              "stackframe: failed exception return integrity "
+                              "check\n");
+                return;
+            }
+        }
+
         /* Commit to consuming the stack frame */
         frameptr += 0x20;
         /* Undo stack alignment (the SPREALIGN bit indicates that the original
@@ -6445,12 +6468,13 @@ static void do_v7m_exception_exit(ARMCPU *cpu)
     /* The restored xPSR exception field will be zero if we're
      * resuming in Thread mode. If that doesn't match what the
      * exception return excret specified then this is a UsageFault.
+     * v7M requires we make this check here; v8M did it earlier.
      */
     if (return_to_handler != arm_v7m_is_handler_mode(env)) {
-        /* Take an INVPC UsageFault by pushing the stack again.
-         * TODO: the v8M version of this code should target the
-         * background state for this exception.
+        /* Take an INVPC UsageFault by pushing the stack again;
+         * we know we're v7M so this is never a Secure UsageFault.
          */
+        assert(!arm_feature(env, ARM_FEATURE_V8));
         armv7m_nvic_set_pending(env->nvic, ARMV7M_EXCP_USAGE, false);
         env->v7m.cfsr[env->v7m.secure] |= R_V7M_CFSR_INVPC_MASK;
         v7m_push_stack(cpu);
-- 
2.7.4

