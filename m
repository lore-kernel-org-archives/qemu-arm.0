Received: by 10.25.77.65 with SMTP id a62csp2552559lfb;
        Thu, 16 Feb 2017 08:36:08 -0800 (PST)
X-Received: by 10.25.160.211 with SMTP id j202mr938228lfe.18.1487262968599;
        Thu, 16 Feb 2017 08:36:08 -0800 (PST)
Return-Path: <pm215@archaic.org.uk>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by mx.google.com with ESMTPS id f65si3709735lji.14.2017.02.16.08.36.08
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 16 Feb 2017 08:36:08 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::2 as permitted sender) client-ip=2001:8b0:1d0::2;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::2 as permitted sender) smtp.mailfrom=pm215@archaic.org.uk;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.84_2)
	(envelope-from <pm215@archaic.org.uk>)
	id 1ceP2N-00034q-R7; Thu, 16 Feb 2017 16:36:07 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: patches@linaro.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v2 08/13] armv7m: Simpler and faster exception start
Date: Thu, 16 Feb 2017 16:35:58 +0000
Message-Id: <1487262963-11519-9-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1487262963-11519-1-git-send-email-peter.maydell@linaro.org>
References: <1487262963-11519-1-git-send-email-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: sUfGMC6ZCTB/

From: Michael Davidsaver <mdavidsaver@gmail.com>

All the places in armv7m_cpu_do_interrupt() which pend an
exception in the NVIC are doing so for synchronous
exceptions. We know that we will always take some
exception in this case, so we can just acknowledge it
immediately, rather than returning and then immediately
being called again because the NVIC has raised its outbound
IRQ line.

Signed-off-by: Michael Davidsaver <mdavidsaver@gmail.com>
[PMM: tweaked commit message; added DEBUG to the set of
exceptions we handle immediately, since it is synchronous
when it results from the BKPT instruction]
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/arm/helper.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 050d8df..1844852 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -6109,22 +6109,22 @@ void arm_v7m_cpu_do_interrupt(CPUState *cs)
     case EXCP_UDEF:
         armv7m_nvic_set_pending(env->nvic, ARMV7M_EXCP_USAGE);
         env->v7m.cfsr |= R_V7M_CFSR_UNDEFINSTR_MASK;
-        return;
+        break;
     case EXCP_NOCP:
         armv7m_nvic_set_pending(env->nvic, ARMV7M_EXCP_USAGE);
         env->v7m.cfsr |= R_V7M_CFSR_NOCP_MASK;
-        return;
+        break;
     case EXCP_SWI:
         /* The PC already points to the next instruction.  */
         armv7m_nvic_set_pending(env->nvic, ARMV7M_EXCP_SVC);
-        return;
+        break;
     case EXCP_PREFETCH_ABORT:
     case EXCP_DATA_ABORT:
         /* TODO: if we implemented the MPU registers, this is where we
          * should set the MMFAR, etc from exception.fsr and exception.vaddress.
          */
         armv7m_nvic_set_pending(env->nvic, ARMV7M_EXCP_MEM);
-        return;
+        break;
     case EXCP_BKPT:
         if (semihosting_enabled()) {
             int nr;
@@ -6139,9 +6139,8 @@ void arm_v7m_cpu_do_interrupt(CPUState *cs)
             }
         }
         armv7m_nvic_set_pending(env->nvic, ARMV7M_EXCP_DEBUG);
-        return;
+        break;
     case EXCP_IRQ:
-        armv7m_nvic_acknowledge_irq(env->nvic);
         break;
     case EXCP_EXCEPTION_EXIT:
         do_v7m_exception_exit(env);
@@ -6151,6 +6150,10 @@ void arm_v7m_cpu_do_interrupt(CPUState *cs)
         return; /* Never happens.  Keep compiler happy.  */
     }
 
+    armv7m_nvic_acknowledge_irq(env->nvic);
+
+    qemu_log_mask(CPU_LOG_INT, "... as %d\n", env->v7m.exception);
+
     /* Align stack pointer if the guest wants that */
     if ((env->regs[13] & 4) && (env->v7m.ccr & R_V7M_CCR_STKALIGN_MASK)) {
         env->regs[13] -= 4;
-- 
2.7.4
