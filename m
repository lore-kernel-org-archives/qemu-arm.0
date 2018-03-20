Received: by 10.28.91.67 with SMTP id p64csp3848966wmb;
        Tue, 20 Mar 2018 06:41:44 -0700 (PDT)
X-Google-Smtp-Source: AG47ELt5+rPj6FfhvirqkAnRMpVaPpawSz3RHlLN3jkclGagfr7t7NWxuGUtRjWA9pw4qql7fHhJ
X-Received: by 10.200.46.139 with SMTP id h11mr6738829qta.253.1521553304111;
        Tue, 20 Mar 2018 06:41:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1521553304; cv=none;
        d=google.com; s=arc-20160816;
        b=E1PqdeHtIZFegRnUrX9bSd2tjiXAcvUA7FCzUG37I+z97CB8BvBx8/dK+2AUUJsboP
         6mREZkQBfYyJnoG9w3cWgcLsjycXvd9l3HlMyp05uiQy0wiWeq7borR4l87jN6tGtNBP
         kJk2w8q9DOgU29+Hkr6FDDS3RTKW0sBNbBC9d/0nhdUN5X+HlyOGMwq4+joL4agzT8mM
         xtXxTMnJvXCbzCY7Q7oKv8yX9dnsMn9veAD9mOLhPvB1SBMyGAUIzNOwJwmtDzX5cd+e
         X/jgF5iF06ti4WP1c5UPzlW1j/6jPW21wqswL8BTFDzWybYs2cXETqhBpe9iBOeSvMjX
         VUKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=W27jp9ZZKBsVTF4/ByPRGcfZ/hlRyxCxkyjcFXZiww4=;
        b=fomiveZETZlwqSAXJKtGDBX8MHN7iN/1TDevdXO5bnVpeyq235w5NZrtzB08s5iYpQ
         kcO81ctxZKw4WCQ63OYwVPS8AuKYpDfjwhpvSS/sbP/Vk+MupcjTOhuytmiJzAvi0xID
         Gvmp471QiUYV4V+g1C+Oy/emCt0dnTZkOAhFL7OCAztKUDBuuqpGAAn0lGm/8UnYT4Ry
         DlGAIwo6aT65UzRPT19RcBi3N/cSTTcjdsSooQ6rHlxY8t9DHO2KqAOlJFoRr2t2Zq2p
         uPESDa3/LfPAw8m7KBViEsvI3F7/W50IxEkTMR3N6ZYbzrN4Gob+WArZzuT4Tmfv3wyf
         ctyg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 141si2164129qke.370.2018.03.20.06.41.43
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 20 Mar 2018 06:41:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48685 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eyHWJ-00037O-Id
	for alex.bennee@linaro.org; Tue, 20 Mar 2018 09:41:43 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:32856)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1eyHW3-00035F-Aj
	for qemu-arm@nongnu.org; Tue, 20 Mar 2018 09:41:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1eyHW2-00041L-5y
	for qemu-arm@nongnu.org; Tue, 20 Mar 2018 09:41:27 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:40476)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1eyHW1-0003s8-Vf; Tue, 20 Mar 2018 09:41:26 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1eyHVu-00045A-Fa; Tue, 20 Mar 2018 13:41:18 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue, 20 Mar 2018 13:41:13 +0000
Message-Id: <20180320134114.30418-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.16.2
In-Reply-To: <20180320134114.30418-1-peter.maydell@linaro.org>
References: <20180320134114.30418-1-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH for-2.12 3/4] target/arm: Set FSR for BKPT,
 BRK when raising exception
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
X-TUID: ZA2h7TfNcGxI

Now that we have a helper function specifically for the BRK and
BKPT instructions, we can set the exception.fsr there rather
than in arm_cpu_do_interrupt_aarch32(). This allows us to
use our new arm_debug_exception_fsr() helper.

In particular this fixes a bug where we were hardcoding the
short-form IFSR value, which is wrong if the target exception
level has LPAE enabled.

Fixes: https://bugs.launchpad.net/qemu/+bug/1756927
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.c    | 1 -
 target/arm/op_helper.c | 2 ++
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 09893e3f72..dcb8476d9e 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -7910,7 +7910,6 @@ static void arm_cpu_do_interrupt_aarch32(CPUState *cs)
         offset = 0;
         break;
     case EXCP_BKPT:
-        env->exception.fsr = 2;
         /* Fall through to prefetch abort.  */
     case EXCP_PREFETCH_ABORT:
         A32_BANKED_CURRENT_REG_SET(env, ifsr, env->exception.fsr);
diff --git a/target/arm/op_helper.c b/target/arm/op_helper.c
index 75efff9edf..8e1e521193 100644
--- a/target/arm/op_helper.c
+++ b/target/arm/op_helper.c
@@ -488,6 +488,8 @@ void HELPER(exception_with_syndrome)(CPUARMState *env, uint32_t excp,
  */
 void HELPER(exception_bkpt_insn)(CPUARMState *env, uint32_t syndrome)
 {
+    /* FSR will only be used if the debug target EL is AArch32. */
+    env->exception.fsr = arm_debug_exception_fsr(env);
     raise_exception(env, EXCP_BKPT, syndrome, arm_debug_target_el(env));
 }
 
-- 
2.16.2

