Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp2870027wru;
        Fri, 20 Jul 2018 08:00:16 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpc2WSrqAfZmD86npp1Ode1dIMpvAOrHbLID1/shuY6SsNRB/jeUr/sozj8ZJ5Q5aEviJJ3l
X-Received: by 2002:a0c:dc0c:: with SMTP id s12-v6mr2075861qvk.155.1532098816689;
        Fri, 20 Jul 2018 08:00:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1532098816; cv=none;
        d=google.com; s=arc-20160816;
        b=jCbSyX6ozBzWPm0AdcSfafUkSfJ54JjY0aVrjDqdBGWZSLAXkQDkMLnG7pswGg2gas
         oJ6DITcJrVGSj1Wik3tPaspQAINBm/MjItasDLTg0DESJ8dmJTgfdGT/dhT6XysfUEy3
         kKIkuj54Q2ggFVNx6vypi9wGwPIwnHXb6mLYAseyklAAfcUvBdlPO2+/50YSjcUpgsq+
         dR3CNR0gma3O+qXtJNvEIgWSo7c6Oq/fkbNGTQgvSo0UQdHZNIwdPnnAGIrm+KKm+KCj
         Inu0RU1F5B1Gayg3+xAxSeizDyj+zs3w1UX7T8pCouNNHqGARB1wOR+cdsSeWp4wvPcf
         qp+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=nZRN+dFeCyh/loFDU/UTK+pRYByJg05J7SoZLYL7zf0=;
        b=CK8qk+pJepQ4RbYSfn3ikmZ6ipskPCgUzw+GlApt99/pG8kVTKiw1imJ4E4AV7ehp9
         DZR5WHWaJEDgb2pq+M1KwW7eE0FCE+Dmf84wDTS68bgwVS5uOCLgCJDa0mUVKOqhvuh8
         J9tU0ML10szs+Z0d839FBpldtDhCatf55zw4Z0v483NeIbfStS4YP/tr5Aws8aO0Suv6
         +Pwt61hkbLsf21GK4XYQfnpC2ED98uv1qZ4LLDaqmBZ5K4yJbTYkQ0ecvbdktGCfnYAT
         XFeeY+x/aOhvDaou5tsA4B8N9Ul3WM5mzHs8H7JcEOGtlx+95INHI16qp8t9KK9mwLaH
         oBbw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 41-v6si1846697qvc.142.2018.07.20.08.00.16
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 20 Jul 2018 08:00:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48508 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fgWtE-0002xc-4g
	for alex.bennee@linaro.org; Fri, 20 Jul 2018 11:00:16 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48699)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1fgWq5-0000UH-Kk
	for qemu-arm@nongnu.org; Fri, 20 Jul 2018 10:57:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1fgWq4-00061g-HN
	for qemu-arm@nongnu.org; Fri, 20 Jul 2018 10:57:01 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:43636)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1fgWq4-0005xz-8C; Fri, 20 Jul 2018 10:57:00 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1fgWpt-0004zg-4R; Fri, 20 Jul 2018 15:56:49 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Fri, 20 Jul 2018 15:56:44 +0100
Message-Id: <20180720145647.8810-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180720145647.8810-1-peter.maydell@linaro.org>
References: <20180720145647.8810-1-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 1/4] target/arm: Improve exception-taken logging
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
X-TUID: 77826RObfGQz

Improve the exception-taken logging by logging in
v7m_exception_taken() the exception we're going to take
and whether it is secure/nonsecure.

This requires us to move logging at many callsites from after the
call to before it, so that the logging appears in a sensible order.

(This will make tail-chaining produce more useful logs; for the
current callers of v7m_exception_taken() we know which exception
we're going to take, so custom log messages at the callsite sufficed;
for tail-chaining only v7m_exception_taken() knows the exception
number that we're going to tail-chain to.)

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.c | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 6f5bb198c3b..3ec6114599b 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -6840,6 +6840,8 @@ static void v7m_exception_taken(ARMCPU *cpu, uint32_t lr, bool dotailchain,
     bool push_failed = false;
 
     armv7m_nvic_get_pending_irq_info(env->nvic, &exc, &targets_secure);
+    qemu_log_mask(CPU_LOG_INT, "...taking pending %s exception %d\n",
+                  targets_secure ? "secure" : "nonsecure", exc);
 
     if (arm_feature(env, ARM_FEATURE_V8)) {
         if (arm_feature(env, ARM_FEATURE_M_SECURITY) &&
@@ -6913,12 +6915,15 @@ static void v7m_exception_taken(ARMCPU *cpu, uint32_t lr, bool dotailchain,
          * we might now want to take a different exception which
          * targets a different security state, so try again from the top.
          */
+        qemu_log_mask(CPU_LOG_INT,
+                      "...derived exception on callee-saves register stacking");
         v7m_exception_taken(cpu, lr, true, true);
         return;
     }
 
     if (!arm_v7m_load_vector(cpu, exc, targets_secure, &addr)) {
         /* Vector load failed: derived exception */
+        qemu_log_mask(CPU_LOG_INT, "...derived exception on vector table load");
         v7m_exception_taken(cpu, lr, true, true);
         return;
     }
@@ -7129,9 +7134,9 @@ static void do_v7m_exception_exit(ARMCPU *cpu)
     if (sfault) {
         env->v7m.sfsr |= R_V7M_SFSR_INVER_MASK;
         armv7m_nvic_set_pending(env->nvic, ARMV7M_EXCP_SECURE, false);
-        v7m_exception_taken(cpu, excret, true, false);
         qemu_log_mask(CPU_LOG_INT, "...taking SecureFault on existing "
                       "stackframe: failed EXC_RETURN.ES validity check\n");
+        v7m_exception_taken(cpu, excret, true, false);
         return;
     }
 
@@ -7141,9 +7146,9 @@ static void do_v7m_exception_exit(ARMCPU *cpu)
          */
         env->v7m.cfsr[env->v7m.secure] |= R_V7M_CFSR_INVPC_MASK;
         armv7m_nvic_set_pending(env->nvic, ARMV7M_EXCP_USAGE, env->v7m.secure);
-        v7m_exception_taken(cpu, excret, true, false);
         qemu_log_mask(CPU_LOG_INT, "...taking UsageFault on existing "
                       "stackframe: failed exception return integrity check\n");
+        v7m_exception_taken(cpu, excret, true, false);
         return;
     }
 
@@ -7198,10 +7203,10 @@ static void do_v7m_exception_exit(ARMCPU *cpu)
                 /* Take a SecureFault on the current stack */
                 env->v7m.sfsr |= R_V7M_SFSR_INVIS_MASK;
                 armv7m_nvic_set_pending(env->nvic, ARMV7M_EXCP_SECURE, false);
-                v7m_exception_taken(cpu, excret, true, false);
                 qemu_log_mask(CPU_LOG_INT, "...taking SecureFault on existing "
                               "stackframe: failed exception return integrity "
                               "signature check\n");
+                v7m_exception_taken(cpu, excret, true, false);
                 return;
             }
 
@@ -7234,6 +7239,7 @@ static void do_v7m_exception_exit(ARMCPU *cpu)
             /* v7m_stack_read() pended a fault, so take it (as a tail
              * chained exception on the same stack frame)
              */
+            qemu_log_mask(CPU_LOG_INT, "...derived exception on unstacking\n");
             v7m_exception_taken(cpu, excret, true, false);
             return;
         }
@@ -7270,10 +7276,10 @@ static void do_v7m_exception_exit(ARMCPU *cpu)
                 armv7m_nvic_set_pending(env->nvic, ARMV7M_EXCP_USAGE,
                                         env->v7m.secure);
                 env->v7m.cfsr[env->v7m.secure] |= R_V7M_CFSR_INVPC_MASK;
-                v7m_exception_taken(cpu, excret, true, false);
                 qemu_log_mask(CPU_LOG_INT, "...taking UsageFault on existing "
                               "stackframe: failed exception return integrity "
                               "check\n");
+                v7m_exception_taken(cpu, excret, true, false);
                 return;
             }
         }
@@ -7309,9 +7315,9 @@ static void do_v7m_exception_exit(ARMCPU *cpu)
         armv7m_nvic_set_pending(env->nvic, ARMV7M_EXCP_USAGE, false);
         env->v7m.cfsr[env->v7m.secure] |= R_V7M_CFSR_INVPC_MASK;
         ignore_stackfaults = v7m_push_stack(cpu);
-        v7m_exception_taken(cpu, excret, false, ignore_stackfaults);
         qemu_log_mask(CPU_LOG_INT, "...taking UsageFault on new stackframe: "
                       "failed exception return integrity check\n");
+        v7m_exception_taken(cpu, excret, false, ignore_stackfaults);
         return;
     }
 
@@ -7727,7 +7733,6 @@ void arm_v7m_cpu_do_interrupt(CPUState *cs)
 
     ignore_stackfaults = v7m_push_stack(cpu);
     v7m_exception_taken(cpu, lr, false, ignore_stackfaults);
-    qemu_log_mask(CPU_LOG_INT, "... as %d\n", env->v7m.exception);
 }
 
 /* Function used to synchronize QEMU's AArch64 register set with AArch32
-- 
2.17.1

