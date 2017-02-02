Received: by 10.25.77.65 with SMTP id a62csp303163lfb;
        Thu, 2 Feb 2017 12:02:28 -0800 (PST)
X-Received: by 10.28.93.68 with SMTP id r65mr9629239wmb.133.1486065747956;
        Thu, 02 Feb 2017 12:02:27 -0800 (PST)
Return-Path: <pm215@archaic.org.uk>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by mx.google.com with ESMTPS id p10si3360732wmb.167.2017.02.02.12.02.27
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 02 Feb 2017 12:02:27 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::2 as permitted sender) client-ip=2001:8b0:1d0::2;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::2 as permitted sender) smtp.mailfrom=pm215@archaic.org.uk;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.84_2)
	(envelope-from <pm215@archaic.org.uk>)
	id 1cZNaN-0001wM-CD; Thu, 02 Feb 2017 20:02:27 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: patches@linaro.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Michael Davidsaver <mdavidsaver@gmail.com>,
	Liviu Ionescu <ilg@livius.net>
Subject: [PATCH 7/9] armv7m: Remove unused armv7m_nvic_acknowledge_irq() return value
Date: Thu,  2 Feb 2017 20:02:20 +0000
Message-Id: <1486065742-28639-8-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1486065742-28639-1-git-send-email-peter.maydell@linaro.org>
References: <1486065742-28639-1-git-send-email-peter.maydell@linaro.org>
X-TUID: IKOQW+qihQV5

Having armv7m_nvic_acknowledge_irq() return the new value of
env->v7m.exception and its one caller assign the return value
back to env->v7m.exception is pointless. Just make the return
type void instead.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.h      | 2 +-
 hw/intc/armv7m_nvic.c | 4 +---
 target/arm/helper.c   | 2 +-
 3 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index ac20a56..36cccfc 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1344,7 +1344,7 @@ static inline bool armv7m_nvic_can_take_pending_exception(void *opaque)
 }
 #endif
 void armv7m_nvic_set_pending(void *opaque, int irq);
-int armv7m_nvic_acknowledge_irq(void *opaque);
+void armv7m_nvic_acknowledge_irq(void *opaque);
 void armv7m_nvic_complete_irq(void *opaque, int irq);
 
 /* Interface for defining coprocessor registers.
diff --git a/hw/intc/armv7m_nvic.c b/hw/intc/armv7m_nvic.c
index 2eaac3d..7b61fe6 100644
--- a/hw/intc/armv7m_nvic.c
+++ b/hw/intc/armv7m_nvic.c
@@ -394,7 +394,7 @@ void armv7m_nvic_set_pending(void *opaque, int irq)
 }
 
 /* Make pending IRQ active.  */
-int armv7m_nvic_acknowledge_irq(void *opaque)
+void armv7m_nvic_acknowledge_irq(void *opaque)
 {
     NVICState *s = (NVICState *)opaque;
     CPUARMState *env = &s->cpu->env;
@@ -421,8 +421,6 @@ int armv7m_nvic_acknowledge_irq(void *opaque)
     env->v7m.exception = s->vectpending;
 
     nvic_irq_update(s);
-
-    return env->v7m.exception;
 }
 
 void armv7m_nvic_complete_irq(void *opaque, int irq)
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 6c86eac..78bf9ab 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -6103,7 +6103,7 @@ void arm_v7m_cpu_do_interrupt(CPUState *cs)
         armv7m_nvic_set_pending(env->nvic, ARMV7M_EXCP_DEBUG);
         return;
     case EXCP_IRQ:
-        env->v7m.exception = armv7m_nvic_acknowledge_irq(env->nvic);
+        armv7m_nvic_acknowledge_irq(env->nvic);
         break;
     case EXCP_EXCEPTION_EXIT:
         do_v7m_exception_exit(env);
-- 
2.7.4
