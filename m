Received: by 2002:a17:906:dac7:b0:886:babc:7eeb with SMTP id xi7csp4123125ejb;
        Mon, 6 Feb 2023 04:19:03 -0800 (PST)
X-Google-Smtp-Source: AK7set+xbc/9SGixn6DUgGplzIQvxxnnqVtMsqH2QN8gKRqy7hkMH+xwwjq3WcmD1uzDT8mJmzKU
X-Received: by 2002:a05:6214:252d:b0:56b:fadf:d02c with SMTP id gg13-20020a056214252d00b0056bfadfd02cmr3588764qvb.33.1675685943604;
        Mon, 06 Feb 2023 04:19:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1675685943; cv=none;
        d=google.com; s=arc-20160816;
        b=ECTwBMNh4y7Meru+K6kbOlK3gexARWHA+Y5tkjlcds9K0pPHx/IFUTs1/gQfSbUcan
         R3AjbJDmwGcoeV1yfw8b74FSPpdh1V9bmSME4F6CxrNnbiNX7IDkSgT4muPvQnTkxFFu
         M00xTFw3nz0Xa62MBHkmSCLRTVKLgrlYgiRI6+Xoo9YiJSxMq4tB+0HTnpaJUGfIPbks
         7I587QZNpNZ8xhaMNY7v/wEKjw25COiD5c96rzLwVfEKYY7bBYZlTbccvjikfWLzQ5bG
         8dw6Lwi40AZ872qvi8tlfwF3iTtyMutxZiNeZ8WD/eFX7g0D2GOCupzHAluo5zM96g9u
         kx1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=tL3/k24S8qIoCILSvx8NiXq6cZwR+o29+9/j7EF7mVM=;
        b=DMzAmLhJe2ViR/yCfp62/9+IT1EgFGG7YPl2a3vKg5NuEIxWkbPNzDx0MIOCVZVWur
         6wVhSKOVoIFVQDYcz3Px3fa/XI5DNSuBenXddnteMbAQnwgGDBoqXIHD5q8YVX5IfdMd
         fjSKr/98yxSpbt/ht+3e7b4rkNWApCC0N2mIsGuH/aIXZm/b1VvPV1KAFxVn73nx/T+y
         ezkhQk99anmXG/kTlqEczD5e5GIT+f4BUKnCz9R66yXK3wXnu4xr9VPmOECmXt+bnWqU
         sVtYJrrCDoQNSZvU90b1VGOsHM+MI2paYhpbpyTCrbBGPtdRazMoTwIHtUk3ta/gkLku
         qdUg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PxzXPiKN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id cx15-20020a05620a51cf00b00732f8b09521si3024058qkb.663.2023.02.06.04.19.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 Feb 2023 04:19:03 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PxzXPiKN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pP0Ra-0008Ng-RN; Mon, 06 Feb 2023 07:17:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pP0RY-00089i-Ur
 for qemu-arm@nongnu.org; Mon, 06 Feb 2023 07:17:57 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pP0RW-0005rb-NL
 for qemu-arm@nongnu.org; Mon, 06 Feb 2023 07:17:56 -0500
Received: by mail-wr1-x42c.google.com with SMTP id i5so2996294wrc.0
 for <qemu-arm@nongnu.org>; Mon, 06 Feb 2023 04:17:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tL3/k24S8qIoCILSvx8NiXq6cZwR+o29+9/j7EF7mVM=;
 b=PxzXPiKNjsEZ02X3gSoglNG2GPJPbl8NYsR/Cqr8ImT1QqeAy5qejHxBTEsMJkFinp
 BFoh3n6TkPG1D1pwCnwwLEu2FIk+GWeS228CkXIC30hNnbL8XaBvK0HA5B6G/T5YVVUw
 ozEUYgN5G+43Z/aJu+JtoT4f4O36JtZwcUcB0nw9tHhxxVEzHmtpl7dKomLOkGQLHRNE
 e89plwFkO0Vpt3w6vYENBL3MMLS+cNfN19jpkIKUnogQomdTE2oVCwk3U2iYq7yCIVgK
 3xGR7Wy9oXmnQtF1FtP+IiAPCK57nIMV8BZcalQxl+EBADkeKMq9nC8ROMPE3GCpFHXc
 XygA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tL3/k24S8qIoCILSvx8NiXq6cZwR+o29+9/j7EF7mVM=;
 b=RDeIEj0GXCkHQ05AnkbmhgNh7bruWSbfkwHt0RtuOeq2gLrJhA3o4uC33vOG1En+Je
 fRtbx7R5UWiAais9WE97vPedaRBz9faKlJCO6npjTf2s8k/p9c7mTNzPFou+QmfXwXah
 BwzY+pbzPdidlRzct4PlPc7Fo9DB4PrLNL//Wq4eNHd/+w/GMRBPxUq7asBc+BGpt3L/
 7+akyQJSImvcF5fSj+tOQnvcyOUCBLd5QCNJ37/Uv9DjhhUQUJRm8VAoqSjT4HSJQzTW
 I7awq81v3QBl+iUeD6oJWkjVuAoZI3b6r77W087+3B/r8+0jiPltPAUMZpoGyobsZkNz
 VrDg==
X-Gm-Message-State: AO0yUKVtjWVqZdnb/rRgHRdIhLLQ7Xzu+kiUpesZ97m8Uos11hbhbZZR
 oVty6IcikWxyLtkZcvbvtxhuFPCcpSS6r7N/
X-Received: by 2002:a5d:5e81:0:b0:2bf:eb0e:cccc with SMTP id
 ck1-20020a5d5e81000000b002bfeb0eccccmr17380058wrb.43.1675685872950; 
 Mon, 06 Feb 2023 04:17:52 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 c16-20020a056000105000b002bbb2d43f65sm8625576wrx.14.2023.02.06.04.17.46
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 06 Feb 2023 04:17:49 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 6/9] target/arm: Restrict CPUARMState::nvic to sysemu and
 store as NVICState*
Date: Mon,  6 Feb 2023 13:17:11 +0100
Message-Id: <20230206121714.85084-7-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230206121714.85084-1-philmd@linaro.org>
References: <20230206121714.85084-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: 59QPZVhX6FLj

There is no point in using a void pointer to access the NVIC.
Use the real type to avoid casting it while debugging.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/intc/armv7m_nvic.c         | 38 ++++++++++-------------------
 include/hw/intc/armv7m_nvic.h |  5 +---
 target/arm/cpu.c              |  1 +
 target/arm/cpu.h              | 46 ++++++++++++++++++-----------------
 target/arm/m_helper.c         |  2 +-
 5 files changed, 40 insertions(+), 52 deletions(-)

diff --git a/hw/intc/armv7m_nvic.c b/hw/intc/armv7m_nvic.c
index 1f7763964c..e54553283f 100644
--- a/hw/intc/armv7m_nvic.c
+++ b/hw/intc/armv7m_nvic.c
@@ -389,7 +389,7 @@ static inline int nvic_exec_prio(NVICState *s)
     return MIN(running, s->exception_prio);
 }
 
-bool armv7m_nvic_neg_prio_requested(void *opaque, bool secure)
+bool armv7m_nvic_neg_prio_requested(NVICState *s, bool secure)
 {
     /* Return true if the requested execution priority is negative
      * for the specified security state, ie that security state
@@ -399,8 +399,6 @@ bool armv7m_nvic_neg_prio_requested(void *opaque, bool secure)
      * mean we don't allow FAULTMASK_NS to actually make the execution
      * priority negative). Compare pseudocode IsReqExcPriNeg().
      */
-    NVICState *s = opaque;
-
     if (s->cpu->env.v7m.faultmask[secure]) {
         return true;
     }
@@ -418,17 +416,13 @@ bool armv7m_nvic_neg_prio_requested(void *opaque, bool secure)
     return false;
 }
 
-bool armv7m_nvic_can_take_pending_exception(void *opaque)
+bool armv7m_nvic_can_take_pending_exception(NVICState *s)
 {
-    NVICState *s = opaque;
-
     return nvic_exec_prio(s) > nvic_pending_prio(s);
 }
 
-int armv7m_nvic_raw_execution_priority(void *opaque)
+int armv7m_nvic_raw_execution_priority(NVICState *s)
 {
-    NVICState *s = opaque;
-
     return s->exception_prio;
 }
 
@@ -506,9 +500,8 @@ static void nvic_irq_update(NVICState *s)
  * if @secure is true and @irq does not specify one of the fixed set
  * of architecturally banked exceptions.
  */
-static void armv7m_nvic_clear_pending(void *opaque, int irq, bool secure)
+static void armv7m_nvic_clear_pending(NVICState *s, int irq, bool secure)
 {
-    NVICState *s = (NVICState *)opaque;
     VecInfo *vec;
 
     assert(irq > ARMV7M_EXCP_RESET && irq < s->num_irq);
@@ -666,17 +659,17 @@ static void do_armv7m_nvic_set_pending(void *opaque, int irq, bool secure,
     }
 }
 
-void armv7m_nvic_set_pending(void *opaque, int irq, bool secure)
+void armv7m_nvic_set_pending(NVICState *s, int irq, bool secure)
 {
-    do_armv7m_nvic_set_pending(opaque, irq, secure, false);
+    do_armv7m_nvic_set_pending(s, irq, secure, false);
 }
 
-void armv7m_nvic_set_pending_derived(void *opaque, int irq, bool secure)
+void armv7m_nvic_set_pending_derived(NVICState *s, int irq, bool secure)
 {
-    do_armv7m_nvic_set_pending(opaque, irq, secure, true);
+    do_armv7m_nvic_set_pending(s, irq, secure, true);
 }
 
-void armv7m_nvic_set_pending_lazyfp(void *opaque, int irq, bool secure)
+void armv7m_nvic_set_pending_lazyfp(NVICState *s, int irq, bool secure)
 {
     /*
      * Pend an exception during lazy FP stacking. This differs
@@ -684,7 +677,6 @@ void armv7m_nvic_set_pending_lazyfp(void *opaque, int irq, bool secure)
      * whether we should escalate depends on the saved context
      * in the FPCCR register, not on the current state of the CPU/NVIC.
      */
-    NVICState *s = (NVICState *)opaque;
     bool banked = exc_is_banked(irq);
     VecInfo *vec;
     bool targets_secure;
@@ -773,9 +765,8 @@ void armv7m_nvic_set_pending_lazyfp(void *opaque, int irq, bool secure)
 }
 
 /* Make pending IRQ active.  */
-void armv7m_nvic_acknowledge_irq(void *opaque)
+void armv7m_nvic_acknowledge_irq(NVICState *s)
 {
-    NVICState *s = (NVICState *)opaque;
     CPUARMState *env = &s->cpu->env;
     const int pending = s->vectpending;
     const int running = nvic_exec_prio(s);
@@ -814,10 +805,9 @@ static bool vectpending_targets_secure(NVICState *s)
         exc_targets_secure(s, s->vectpending);
 }
 
-void armv7m_nvic_get_pending_irq_info(void *opaque,
+void armv7m_nvic_get_pending_irq_info(NVICState *s,
                                       int *pirq, bool *ptargets_secure)
 {
-    NVICState *s = (NVICState *)opaque;
     const int pending = s->vectpending;
     bool targets_secure;
 
@@ -831,9 +821,8 @@ void armv7m_nvic_get_pending_irq_info(void *opaque,
     *pirq = pending;
 }
 
-int armv7m_nvic_complete_irq(void *opaque, int irq, bool secure)
+int armv7m_nvic_complete_irq(NVICState *s, int irq, bool secure)
 {
-    NVICState *s = (NVICState *)opaque;
     VecInfo *vec = NULL;
     int ret = 0;
 
@@ -915,7 +904,7 @@ int armv7m_nvic_complete_irq(void *opaque, int irq, bool secure)
     return ret;
 }
 
-bool armv7m_nvic_get_ready_status(void *opaque, int irq, bool secure)
+bool armv7m_nvic_get_ready_status(NVICState *s, int irq, bool secure)
 {
     /*
      * Return whether an exception is "ready", i.e. it is enabled and is
@@ -926,7 +915,6 @@ bool armv7m_nvic_get_ready_status(void *opaque, int irq, bool secure)
      * for non-banked exceptions secure is always false; for banked exceptions
      * it indicates which of the exceptions is required.
      */
-    NVICState *s = (NVICState *)opaque;
     bool banked = exc_is_banked(irq);
     VecInfo *vec;
     int running = nvic_exec_prio(s);
diff --git a/include/hw/intc/armv7m_nvic.h b/include/hw/intc/armv7m_nvic.h
index 0180c7b0ca..07f9c21a5f 100644
--- a/include/hw/intc/armv7m_nvic.h
+++ b/include/hw/intc/armv7m_nvic.h
@@ -16,10 +16,7 @@
 #include "qom/object.h"
 
 #define TYPE_NVIC "armv7m_nvic"
-
-typedef struct NVICState NVICState;
-DECLARE_INSTANCE_CHECKER(NVICState, NVIC,
-                         TYPE_NVIC)
+OBJECT_DECLARE_SIMPLE_TYPE(NVICState, NVIC)
 
 /* Highest permitted number of exceptions (architectural limit) */
 #define NVIC_MAX_VECTORS 512
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 5f63316dbf..b3a2275b08 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -36,6 +36,7 @@
 #if !defined(CONFIG_USER_ONLY)
 #include "hw/loader.h"
 #include "hw/boards.h"
+#include "hw/intc/armv7m_nvic.h"
 #endif
 #include "sysemu/tcg.h"
 #include "sysemu/qtest.h"
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 61681101a5..683e186599 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -227,6 +227,8 @@ typedef struct CPUARMTBFlags {
 
 typedef struct ARMMMUFaultInfo ARMMMUFaultInfo;
 
+typedef struct NVICState NVICState;
+
 typedef struct CPUArchState {
     /* Regs for current mode.  */
     uint32_t regs[16];
@@ -774,8 +776,8 @@ typedef struct CPUArchState {
     const struct arm_boot_info *boot_info;
     /* Store GICv3CPUState to access from this struct */
     void *gicv3state;
+    NVICState *nvic;
 #endif
-    void *nvic;
 
 #ifdef TARGET_TAGGED_ADDRESSES
     /* Linux syscall tagged address support */
@@ -2559,16 +2561,16 @@ uint32_t arm_phys_excp_target_el(CPUState *cs, uint32_t excp_idx,
 
 /* Interface between CPU and Interrupt controller.  */
 #ifndef CONFIG_USER_ONLY
-bool armv7m_nvic_can_take_pending_exception(void *opaque);
+bool armv7m_nvic_can_take_pending_exception(NVICState *s);
 #else
-static inline bool armv7m_nvic_can_take_pending_exception(void *opaque)
+static inline bool armv7m_nvic_can_take_pending_exception(NVICState *s)
 {
     return true;
 }
 #endif
 /**
  * armv7m_nvic_set_pending: mark the specified exception as pending
- * @opaque: the NVIC
+ * @s: the NVIC
  * @irq: the exception number to mark pending
  * @secure: false for non-banked exceptions or for the nonsecure
  * version of a banked exception, true for the secure version of a banked
@@ -2578,10 +2580,10 @@ static inline bool armv7m_nvic_can_take_pending_exception(void *opaque)
  * if @secure is true and @irq does not specify one of the fixed set
  * of architecturally banked exceptions.
  */
-void armv7m_nvic_set_pending(void *opaque, int irq, bool secure);
+void armv7m_nvic_set_pending(NVICState *s, int irq, bool secure);
 /**
  * armv7m_nvic_set_pending_derived: mark this derived exception as pending
- * @opaque: the NVIC
+ * @s: the NVIC
  * @irq: the exception number to mark pending
  * @secure: false for non-banked exceptions or for the nonsecure
  * version of a banked exception, true for the secure version of a banked
@@ -2591,10 +2593,10 @@ void armv7m_nvic_set_pending(void *opaque, int irq, bool secure);
  * exceptions (exceptions generated in the course of trying to take
  * a different exception).
  */
-void armv7m_nvic_set_pending_derived(void *opaque, int irq, bool secure);
+void armv7m_nvic_set_pending_derived(NVICState *s, int irq, bool secure);
 /**
  * armv7m_nvic_set_pending_lazyfp: mark this lazy FP exception as pending
- * @opaque: the NVIC
+ * @s: the NVIC
  * @irq: the exception number to mark pending
  * @secure: false for non-banked exceptions or for the nonsecure
  * version of a banked exception, true for the secure version of a banked
@@ -2603,11 +2605,11 @@ void armv7m_nvic_set_pending_derived(void *opaque, int irq, bool secure);
  * Similar to armv7m_nvic_set_pending(), but specifically for exceptions
  * generated in the course of lazy stacking of FP registers.
  */
-void armv7m_nvic_set_pending_lazyfp(void *opaque, int irq, bool secure);
+void armv7m_nvic_set_pending_lazyfp(NVICState *s, int irq, bool secure);
 /**
  * armv7m_nvic_get_pending_irq_info: return highest priority pending
  *    exception, and whether it targets Secure state
- * @opaque: the NVIC
+ * @s: the NVIC
  * @pirq: set to pending exception number
  * @ptargets_secure: set to whether pending exception targets Secure
  *
@@ -2617,20 +2619,20 @@ void armv7m_nvic_set_pending_lazyfp(void *opaque, int irq, bool secure);
  * to true if the current highest priority pending exception should
  * be taken to Secure state, false for NS.
  */
-void armv7m_nvic_get_pending_irq_info(void *opaque, int *pirq,
+void armv7m_nvic_get_pending_irq_info(NVICState *s, int *pirq,
                                       bool *ptargets_secure);
 /**
  * armv7m_nvic_acknowledge_irq: make highest priority pending exception active
- * @opaque: the NVIC
+ * @s: the NVIC
  *
  * Move the current highest priority pending exception from the pending
  * state to the active state, and update v7m.exception to indicate that
  * it is the exception currently being handled.
  */
-void armv7m_nvic_acknowledge_irq(void *opaque);
+void armv7m_nvic_acknowledge_irq(NVICState *s);
 /**
  * armv7m_nvic_complete_irq: complete specified interrupt or exception
- * @opaque: the NVIC
+ * @s: the NVIC
  * @irq: the exception number to complete
  * @secure: true if this exception was secure
  *
@@ -2639,10 +2641,10 @@ void armv7m_nvic_acknowledge_irq(void *opaque);
  *           0 if there is still an irq active after this one was completed
  * (Ignoring -1, this is the same as the RETTOBASE value before completion.)
  */
-int armv7m_nvic_complete_irq(void *opaque, int irq, bool secure);
+int armv7m_nvic_complete_irq(NVICState *s, int irq, bool secure);
 /**
  * armv7m_nvic_get_ready_status(void *opaque, int irq, bool secure)
- * @opaque: the NVIC
+ * @s: the NVIC
  * @irq: the exception number to mark pending
  * @secure: false for non-banked exceptions or for the nonsecure
  * version of a banked exception, true for the secure version of a banked
@@ -2653,28 +2655,28 @@ int armv7m_nvic_complete_irq(void *opaque, int irq, bool secure);
  * interrupt the current execution priority. This controls whether the
  * RDY bit for it in the FPCCR is set.
  */
-bool armv7m_nvic_get_ready_status(void *opaque, int irq, bool secure);
+bool armv7m_nvic_get_ready_status(NVICState *s, int irq, bool secure);
 /**
  * armv7m_nvic_raw_execution_priority: return the raw execution priority
- * @opaque: the NVIC
+ * @s: the NVIC
  *
  * Returns: the raw execution priority as defined by the v8M architecture.
  * This is the execution priority minus the effects of AIRCR.PRIS,
  * and minus any PRIMASK/FAULTMASK/BASEPRI priority boosting.
  * (v8M ARM ARM I_PKLD.)
  */
-int armv7m_nvic_raw_execution_priority(void *opaque);
+int armv7m_nvic_raw_execution_priority(NVICState *s);
 /**
  * armv7m_nvic_neg_prio_requested: return true if the requested execution
  * priority is negative for the specified security state.
- * @opaque: the NVIC
+ * @s: the NVIC
  * @secure: the security state to test
  * This corresponds to the pseudocode IsReqExecPriNeg().
  */
 #ifndef CONFIG_USER_ONLY
-bool armv7m_nvic_neg_prio_requested(void *opaque, bool secure);
+bool armv7m_nvic_neg_prio_requested(NVICState *s, bool secure);
 #else
-static inline bool armv7m_nvic_neg_prio_requested(void *opaque, bool secure)
+static inline bool armv7m_nvic_neg_prio_requested(NVICState *s, bool secure)
 {
     return false;
 }
diff --git a/target/arm/m_helper.c b/target/arm/m_helper.c
index 1e7e4e33bd..f73d3f2264 100644
--- a/target/arm/m_helper.c
+++ b/target/arm/m_helper.c
@@ -973,7 +973,7 @@ static void v7m_update_fpccr(CPUARMState *env, uint32_t frameptr,
      * that we will need later in order to do lazy FP reg stacking.
      */
     bool is_secure = env->v7m.secure;
-    void *nvic = env->nvic;
+    NVICState *nvic = env->nvic;
     /*
      * Some bits are unbanked and live always in fpccr[M_REG_S]; some bits
      * are banked and we want to update the bit in the bank for the
-- 
2.38.1

