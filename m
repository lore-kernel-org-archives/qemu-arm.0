Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp678337lfy;
        Wed, 19 Aug 2020 11:30:21 -0700 (PDT)
X-Received: by 2002:a17:90a:3fc2:: with SMTP id u2mr423962pjm.121.1597861821293;
        Wed, 19 Aug 2020 11:30:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1597861821; cv=none;
        d=google.com; s=arc-20160816;
        b=Q7qCz9AcQROwi5dtAqqfOoostYYnkrwglfp89Z54gOUJ+zuKMuonERH51KHjz0ZAax
         M/5Ndm/xMOcck80hw98y8Od3zPEYCQIEO5Kz3jHnfcpcoFB7FfcbGIBKFwWez1eSLHRS
         KCpg0ZYxAvl010te3Nji5eCWSJ4Sqmwprexg3sbzRolgq6mSnS1sYadc/Eruuy+y0Of4
         KYZP053bfXRk1mI25VDZvC9aRpf/8rSV9p/8jM2c2wSpgAVKUsPNuTUChQ0vzAt0K/pX
         YlVovPRwFP5vJs0Zs6m1EjcMwOeFVAV0S/ip6i/GfNxgq1UkuAHG+mrbFQqU5PYIhPbg
         /K5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :dkim-signature;
        bh=b36LToa8onboShJxNgr5dtEez/ahyl1YS9GUjcjS5dw=;
        b=RJobJj10h5f4XUOnILjoqRWwDeRHa/F6RSE4HOgruwTC+cUak9QzON2eglFdCD+wfB
         3rx2zt4JHZZ+/swTLULAWg9RpalvvDDSE+LAkCM8U8R44ml0i7pE8z8Us1axCmjEHYXg
         v1z//vmndqCgjar7N9IkP1iyQGVQrHSRZRXCrv49GmulQiES9xir+l812uOcVgC1MQ6k
         7zXPEc5QfimcAoTc61xZ/jyQM4eXYit7DJW2BqsXtRa+9by636Sfhwiehkpz66bu2VYC
         kNBa4UsTR3330UZwz7ocVXpx/rDlyW4JhZcF+pDm0/kzxLOypXxFPTePircnki0gCy72
         Yafw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yj7IU0pV;
       spf=pass (google.com: domain of robert.foley@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=robert.foley@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <robert.foley@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id w12sor3437793pgr.46.2020.08.19.11.30.21
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 19 Aug 2020 11:30:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of robert.foley@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yj7IU0pV;
       spf=pass (google.com: domain of robert.foley@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=robert.foley@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=b36LToa8onboShJxNgr5dtEez/ahyl1YS9GUjcjS5dw=;
        b=yj7IU0pVpDgjXCaaQ2W7EM9QAeAgM0LVS+5aLtXkYydFI0pfs8D1d79ExlErngQvIk
         if2nBttd6FGKtxjRgi93elMvGvUvd1KCPONZRrA+TduuSHfRHPzOZCHoNpRwCWhsTGyR
         3PbTCBCcACHwF7QroasUjuxBWhwsMXKU9UJPX5avk4ctJWgMrEhbNL5XNCxTMR0erZPE
         Dzoj9bQv1eqmeghcNU86diDecU/kmWNjXN/at4seFQLPf7ZM2IHBMEEbT7LbvLH8VvS8
         Lv1EaiapVLB0/n55noHyt0ZyGtMLpDA4ISrmZPEYy7mnPtvWV6Vp9mhJzqL4JfJwcu1V
         e7yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=b36LToa8onboShJxNgr5dtEez/ahyl1YS9GUjcjS5dw=;
        b=eYx1QttbHWMSMTQgxWo0R1tyjqMf2qbdE2h34+3WFf2+7d3iLe6Ic1Vmr3MdSVico3
         8k8LeuedXXGHTSaXA7naJ/LBTdlmidzGIvWj1dVijSUivMsRIUJN0MMAJKmlqT6i1vm9
         AZRh3PKGMwwHJj/er0Flg7rdxikES+mdLBIp9WuO9jtxIM09aoK+0Gty/el+eJH3AfV8
         dSRtcjiyYuGLbEewSTWW1l/Z9e5IaWXIb9jWEiczMaUkQsAPbf4IjuKlT3qFjtRzRbUp
         QYUPrfUO9briOMQ/XdH0GI3RmrPxLIydfrv4QsJk+T3Vf2WrMRWbVR7eZZLHnIX/aKiC
         E1Hw==
X-Gm-Message-State: AOAM532/elWpxKNTM/qbpb8Qxjyi/cogQo5BDXtZIIIXl8WW09SPrhiS
	3HC2za6bFHYSWxE/YfyEbxDJGJWD
X-Google-Smtp-Source: ABdhPJySqzms+YW3n5yMjw1ask2U+sAVdA0GegWJ8e3S1hzoJDlwU2b2m6yxjMTkoRbr/7vQ04syOA==
X-Received: by 2002:a63:4c57:: with SMTP id m23mr16973935pgl.77.1597861820774;
        Wed, 19 Aug 2020 11:30:20 -0700 (PDT)
Return-Path: <robert.foley@linaro.org>
Received: from Rfoley-MA01.hsd1.ma.comcast.net (c-73-47-162-176.hsd1.ma.comcast.net. [73.47.162.176])
        by smtp.gmail.com with ESMTPSA id p20sm220766pjg.44.2020.08.19.11.30.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2020 11:30:19 -0700 (PDT)
From: Robert Foley <robert.foley@linaro.org>
To: qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org,
	pbonzini@redhat.com,
	peter.puhov@linaro.org,
	robert.foley@linaro.org,
	Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org (open list:ARM TCG CPUs)
Subject: [PATCH v2 2/7] target/arm: add ARMCPUClass->do_interrupt_locked
Date: Wed, 19 Aug 2020 14:28:51 -0400
Message-Id: <20200819182856.4893-3-robert.foley@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200819182856.4893-1-robert.foley@linaro.org>
References: <20200819182856.4893-1-robert.foley@linaro.org>
X-TUID: +nwCfPWGql3r

Adding ->do_interrupt_locked to ARMCPUClass is preparation for
pushing the BQL down into the per-arch implementation of ->do_interrupt.

This is needed since ARM's *_cpu_exec_interrupt calls to *_do_interrupt.
With the push down of the BQL into *_cpu_exec_interrupt and
*_do_interrupt, *_cpu_exec_interrupt will call to ->do_interrupt
with lock held.  Since ->do_interrupt also has the lock, we need a way
to allow cpu_exec_interrupt to call do_interrupt with lock held.
This patch solves this issue of *_cpu_exec_interrupt needing
to call do_interrupt with lock held.

This patch is part of a series of transitions to move the
BQL down into the do_interrupt per arch functions.  This set of
transitions is needed to maintain bisectability.

This approach was suggested by Paolo Bonzini.
For reference, here are two key posts in the discussion, explaining
the reasoning/benefits of this approach.
https://lists.gnu.org/archive/html/qemu-devel/2020-08/msg00784.html
https://lists.gnu.org/archive/html/qemu-devel/2020-08/msg01517.html
https://lists.gnu.org/archive/html/qemu-devel/2020-07/msg08731.html
https://lists.gnu.org/archive/html/qemu-devel/2020-08/msg00044.html

Signed-off-by: Robert Foley <robert.foley@linaro.org>
---
 target/arm/cpu-qom.h | 3 +++
 target/arm/cpu.c     | 5 +++--
 target/arm/cpu_tcg.c | 5 +++--
 3 files changed, 9 insertions(+), 4 deletions(-)

diff --git a/target/arm/cpu-qom.h b/target/arm/cpu-qom.h
index 56395b87f6..264280194c 100644
--- a/target/arm/cpu-qom.h
+++ b/target/arm/cpu-qom.h
@@ -48,6 +48,7 @@ void aarch64_cpu_register(const ARMCPUInfo *info);
  * ARMCPUClass:
  * @parent_realize: The parent class' realize handler.
  * @parent_reset: The parent class' reset handler.
+ * @do_interrupt_locked: Handler for interrupts (lock already held).
  *
  * An ARM CPU model.
  */
@@ -59,6 +60,8 @@ typedef struct ARMCPUClass {
     const ARMCPUInfo *info;
     DeviceRealize parent_realize;
     DeviceReset parent_reset;
+
+    void (*do_interrupt_locked)(CPUState *cpu);
 } ARMCPUClass;
 
 typedef struct ARMCPU ARMCPU;
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 46c1d92080..d15b459399 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -526,7 +526,7 @@ static inline bool arm_excp_unmasked(CPUState *cs, unsigned int excp_idx,
 
 bool arm_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
 {
-    CPUClass *cc = CPU_GET_CLASS(cs);
+    ARMCPUClass *acc = ARM_CPU_GET_CLASS(cs);
     CPUARMState *env = cs->env_ptr;
     uint32_t cur_el = arm_current_el(env);
     bool secure = arm_is_secure(env);
@@ -573,7 +573,7 @@ bool arm_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
  found:
     cs->exception_index = excp_idx;
     env->exception.target_el = target_el;
-    cc->do_interrupt(cs);
+    acc->do_interrupt_locked(cs);
     return true;
 }
 
@@ -2225,6 +2225,7 @@ static void arm_cpu_class_init(ObjectClass *oc, void *data)
     cc->gdb_write_register = arm_cpu_gdb_write_register;
 #ifndef CONFIG_USER_ONLY
     cc->do_interrupt = arm_cpu_do_interrupt_locked;
+    acc->do_interrupt_locked = arm_cpu_do_interrupt_locked;
     cc->get_phys_page_attrs_debug = arm_cpu_get_phys_page_attrs_debug;
     cc->asidx_from_attrs = arm_asidx_from_attrs;
     cc->vmsd = &vmstate_arm_cpu;
diff --git a/target/arm/cpu_tcg.c b/target/arm/cpu_tcg.c
index 2fc7a29340..caf0d54c2c 100644
--- a/target/arm/cpu_tcg.c
+++ b/target/arm/cpu_tcg.c
@@ -17,7 +17,7 @@
 
 static bool arm_v7m_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
 {
-    CPUClass *cc = CPU_GET_CLASS(cs);
+    ARMCPUClass *acc = ARM_CPU_GET_CLASS(cs);
     ARMCPU *cpu = ARM_CPU(cs);
     CPUARMState *env = &cpu->env;
     bool ret = false;
@@ -33,7 +33,7 @@ static bool arm_v7m_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
     if (interrupt_request & CPU_INTERRUPT_HARD
         && (armv7m_nvic_can_take_pending_exception(env->nvic))) {
         cs->exception_index = EXCP_IRQ;
-        cc->do_interrupt(cs);
+        acc->do_interrupt_locked(cs);
         ret = true;
     }
     return ret;
@@ -602,6 +602,7 @@ static void arm_v7m_class_init(ObjectClass *oc, void *data)
     acc->info = data;
 #ifndef CONFIG_USER_ONLY
     cc->do_interrupt = arm_v7m_cpu_do_interrupt_locked;
+    acc->do_interrupt_locked = arm_v7m_cpu_do_interrupt_locked;
 #endif
 
     cc->cpu_exec_interrupt = arm_v7m_cpu_exec_interrupt;
-- 
2.17.1
