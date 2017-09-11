Received: by 10.223.172.38 with SMTP id v35csp5562747wrc;
        Mon, 11 Sep 2017 06:54:17 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QDOSOMBGhSYNC6imLXihw8lCBdZPQpvyN2OtoXtjKkR4kRNW1QjvGQinmH8fOGOKw8zBDR5
X-Received: by 10.233.237.7 with SMTP id c7mr15082029qkg.69.1505138057543;
        Mon, 11 Sep 2017 06:54:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1505138057; cv=none;
        d=google.com; s=arc-20160816;
        b=wXLosNK4IUtVxXV0kk1v+85gVeAHZsUdbNx8UCj9JvZrSuYQugHK8vYR7j0Q5ONQCP
         6707q89cBwSOuOIU2k5ksUbfCZFPZyLCekdQCKH6B2xOcToGpMjbzGjBRghh6LRBrAKt
         qpew/M7gEk9P5xE9D7vDXLfcacEFIfNNew+pLCamakYXCUG0wr4zgemMyMDAlTM0P0Xb
         Dscp4HhlMySuDDBmDEahW0y8SdJGhA3lKFD7OffGbHg04UCVVQlg8hfpNEvVXcp1uKBN
         Q0oUJFAkLXDFN932UWhACqUfME7EQUYcatnC+jIx9pB1pNmNSAJquc7qhOLwbOrhGo/4
         3xiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=OAQAEcY47GohXWNIe8wik0dL6owj/qwY92P7fleqBa4=;
        b=rFsn5OrFY8VAdZrKn9V7MXpOEPQV+59mJqAnailTlWOOm57hYSGOq0oK6lJAEv32G0
         FkAcDOA0/yKOhaflsX5rsPKOj1/wUV0PH8lG37K0TXbyz3u1TqF/fSMRhP3ccVQ4SrSM
         tiCMhtIrNw8+C1rq5EQhPmFgOjae2H6jB2Ezg1+PDsWBoIjPe/q38d1IN0lWzkVmIfRe
         Cxm26BwKrYtFZ9OIm8Xfr/PRnR5k/7KzxXDwXTMZp1L1D21IEDRuUfZKG6n7rg3jz59D
         3686nEiCyKAMdH+8E9RnJC6Ai86/fQ7gXGrqlcI+QQfRUbpigWu0EUsRgdWI0J4EBh3k
         VS1w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r65si9145332qkf.155.2017.09.11.06.54.17
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 11 Sep 2017 06:54:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57909 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1drPAF-0003M1-7c
	for alex.bennee@linaro.org; Mon, 11 Sep 2017 09:54:15 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41726)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1drP87-0001gn-6l
	for qemu-devel@nongnu.org; Mon, 11 Sep 2017 09:52:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1drP86-0002Dl-9d
	for qemu-devel@nongnu.org; Mon, 11 Sep 2017 09:52:03 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:37238)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1drP83-00023m-SN; Mon, 11 Sep 2017 09:52:00 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1drP7q-0007m1-6B; Mon, 11 Sep 2017 14:51:46 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Mon, 11 Sep 2017 14:52:05 +0100
Message-Id: <1505137930-13255-3-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1505137930-13255-1-git-send-email-peter.maydell@linaro.org>
References: <1505137930-13255-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-devel] [PATCH 2/7] target/arm: Clear exclusive monitor on v7M
 reset, exception entry/exit
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
Cc: patches@linaro.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: F1+B2G/afswn

For M profile we must clear the exclusive monitor on reset, exception
entry and exception exit.  We weren't doing any of these things; fix
this bug.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/internals.h | 10 ++++++++++
 target/arm/cpu.c       |  6 ++++++
 target/arm/helper.c    |  2 ++
 target/arm/op_helper.c |  2 +-
 4 files changed, 19 insertions(+), 1 deletion(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index 5d7f24c..a315354 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -444,6 +444,16 @@ void arm_handle_psci_call(ARMCPU *cpu);
 #endif
 
 /**
+ * arm_clear_exclusive: clear the exclusive monitor
+ * @env: CPU env
+ * Clear the CPU's exclusive monitor, like the guest CLREX instruction.
+ */
+static inline void arm_clear_exclusive(CPUARMState *env)
+{
+    env->exclusive_addr = -1;
+}
+
+/**
  * ARMMMUFaultInfo: Information describing an ARM MMU Fault
  * @s2addr: Address that caused a fault at stage 2
  * @stage2: True if we faulted at stage 2
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index a1acce3..412e94c 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -235,6 +235,12 @@ static void arm_cpu_reset(CPUState *s)
         env->regs[15] = 0xFFFF0000;
     }
 
+    /* M profile requires that reset clears the exclusive monitor;
+     * A profile does not, but clearing it makes more sense than having it
+     * set with an exclusive access on address zero.
+     */
+    arm_clear_exclusive(env);
+
     env->vfp.xregs[ARM_VFP_FPEXC] = 0;
 #endif
 
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 329e517..668e367 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -6175,6 +6175,7 @@ static void v7m_exception_taken(ARMCPU *cpu, uint32_t lr)
 
     armv7m_nvic_acknowledge_irq(env->nvic);
     switch_v7m_sp(env, 0);
+    arm_clear_exclusive(env);
     /* Clear IT bits */
     env->condexec_bits = 0;
     env->regs[14] = lr;
@@ -6354,6 +6355,7 @@ static void do_v7m_exception_exit(ARMCPU *cpu)
     }
 
     /* Otherwise, we have a successful exception exit. */
+    arm_clear_exclusive(env);
     qemu_log_mask(CPU_LOG_INT, "...successful exception return\n");
 }
 
diff --git a/target/arm/op_helper.c b/target/arm/op_helper.c
index d1bca46..6a60464 100644
--- a/target/arm/op_helper.c
+++ b/target/arm/op_helper.c
@@ -1022,7 +1022,7 @@ void HELPER(exception_return)(CPUARMState *env)
 
     aarch64_save_sp(env, cur_el);
 
-    env->exclusive_addr = -1;
+    arm_clear_exclusive(env);
 
     /* We must squash the PSTATE.SS bit to zero unless both of the
      * following hold:
-- 
2.7.4

