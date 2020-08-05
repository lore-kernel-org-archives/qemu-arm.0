Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp859569lfy;
        Wed, 5 Aug 2020 11:17:12 -0700 (PDT)
X-Received: by 2002:a17:902:9a41:: with SMTP id x1mr4457346plv.323.1596651432476;
        Wed, 05 Aug 2020 11:17:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1596651432; cv=none;
        d=google.com; s=arc-20160816;
        b=A4EQ8mq6O8Yl4NY9petZh2iP+76iZlJ1hfWWvriuFZsaCjBujx5jblZborWpnwwy3c
         WK/Sjwb/2MzpOCJTgzlTjHj6JWiTydH593/w+h2Tb0X/LnX9FL5jLaBWW/uZXhXRmq6h
         T0Mp/dnzJE/HoIQdVKWO3/Qu71ooNOYKpsYbKtegN8RdalWxrqvCSaiIXqF/nmWZPJcK
         dlCmd/xQ5HW5hgUXxSaro0gaoMKdv2cdWOr1kxgqDzhVYhjN9ObhMu5CKDP09gCroqev
         siRFO0iuZGw3tSkb8QpSY8RQIaej80pYagGqk4G31diAX26YZ5vqvpT/A//a5LEYKlG5
         8xxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :dkim-signature;
        bh=sqXifhGhW3rwKZgyTrB18rperPby0ZelegDudFYBpjk=;
        b=jFua7KmqNR7epARWxbyDldDbTp9x1BVPvDwEuw6fqKWCsQbQaECtUe01gYpgjHDtM1
         Q5hxp5QL986QvdzxLbSbeCLNA6LzQ/ANwM1creT8uz1NMTJN2cqpEZBoqJZ9KNmiLdmW
         d0iGU964lfDV8ZNImEF7PPSR4yih98o4aFjfI7rvrmM6otJFQc7RbDXDDHpnZdVH/qMq
         tMmBPdrF6EyZnvCInPg2GCMwvqn7XRX7qnT20SQXvp2v/sqBabyE60s+OdnijawMNTx7
         a5d1NxIaFBxqzP4Ft7LWRT3g4Y+U6S5d2Dn4G3zHMKkJK78P7a1bdpHrR7Wb7M3EDyb5
         ySzA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=E6OLKc6N;
       spf=pass (google.com: domain of robert.foley@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=robert.foley@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <robert.foley@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id o44sor3562935pje.1.2020.08.05.11.17.12
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 05 Aug 2020 11:17:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of robert.foley@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=E6OLKc6N;
       spf=pass (google.com: domain of robert.foley@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=robert.foley@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=sqXifhGhW3rwKZgyTrB18rperPby0ZelegDudFYBpjk=;
        b=E6OLKc6NLdUktyGjvvVvhPNt5dAd9K5VQRSXtUcMKl+kVkBqql3YZXUFHfGm9CwV49
         0BxYt4B/IiLbsZrGOPugnRpO1hjDejeDdnrSqt5ffAnk3LYzDAsCjMI0kqzSeaB4rV1q
         V67KJyzCvZrxhGdhS/HkAK8xm2GF4NPxaambIFdpjLPltmbU/0WuYQCjWBB5Zsro2YXv
         j5KKlZ/hQMU4OPIdjCp1fUixfigBWLyfUiS5xwlWJQEYjojhnoYDBn7rmG+BxDvtzu3i
         wjCD5KujPRw9tULzug78tBoyX79u5g2bBKFj9TiFlXHpb2FLTCN+Fo3Uuj3JxKPZ3jPE
         4tFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=sqXifhGhW3rwKZgyTrB18rperPby0ZelegDudFYBpjk=;
        b=M7D2KYjNsOgQP0WwXQUaV/yusFQZc3MX7Ljcwra5/texKx5+d7D5ZQ0eIdYga3ozU0
         jAsYGOcqasuXUMTkNR5hdTw+GYqjd1WRw6tIsf719DuhxER+aFADa/CFAHfQ6yIbYbBg
         xSriYacF4A9jWTuQ79bE0TkpO6UDmKqmGE129kW2FNL5RHGrNyiKFUJ6u3cPAmfIRfON
         sR6R5ZxhDTNiIV2e5JXICfgMucZillK/MeaiorpRDhZI+4yjmLgykZTojG1SQwyP1Wa3
         dPOR62I5YpE87aNxB10oOAgCCc4Vjaw9S4zUVnrScjlq9qvWQBCyGKQCZeO6h7hppDZy
         wWhw==
X-Gm-Message-State: AOAM532/MpEomnMUvsi0L1iydxuoguhIbn2FYrs2VNpwIRpfMikEPDcN
	1IU9HWnwSCC+o9QimWFc3Qr1bgio
X-Google-Smtp-Source: ABdhPJw8Zx4kakl8T5S0K51cLOjK1lVkwtVj4Y/d4ewFjHh3mHAlt8DrxlBzFrsMeQLjxBlP30n+8Q==
X-Received: by 2002:a17:90b:46d3:: with SMTP id jx19mr4582194pjb.158.1596651431914;
        Wed, 05 Aug 2020 11:17:11 -0700 (PDT)
Return-Path: <robert.foley@linaro.org>
Received: from Rfoley-MA01.hsd1.ma.comcast.net ([2601:199:4480:60c0:38ab:50b1:ff8a:26ef])
        by smtp.gmail.com with ESMTPSA id a15sm3670196pfo.185.2020.08.05.11.17.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2020 11:17:11 -0700 (PDT)
From: Robert Foley <robert.foley@linaro.org>
To: qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org,
	cota@braap.org,
	pbonzini@redhat.com,
	peter.puhov@linaro.org,
	robert.foley@linaro.org,
	Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org (open list:ARM TCG CPUs)
Subject: [PATCH v1 03/21] target/arm: add BQL to do_interrupt and cpu_exec_interrupt
Date: Wed,  5 Aug 2020 14:12:45 -0400
Message-Id: <20200805181303.7822-4-robert.foley@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200805181303.7822-1-robert.foley@linaro.org>
References: <20200805181303.7822-1-robert.foley@linaro.org>
X-TUID: ph0mhOS0/otT

This is part of a series of changes to remove the implied BQL
from the common code of cpu_handle_interrupt and
cpu_handle_exception.  As part of removing the implied BQL
from the common code, we are pushing the BQL holding
down into the per-arch implementation functions of
do_interrupt and cpu_exec_interrupt.

The purpose of this set of changes is to set the groundwork
so that an arch could move towards removing
the BQL from the cpu_handle_interrupt/exception paths.

This approach was suggested by Paolo Bonzini.
For reference, here are two key posts in the discussion, explaining
the reasoning/benefits of this approach.
https://lists.gnu.org/archive/html/qemu-devel/2020-07/msg08731.html
https://lists.gnu.org/archive/html/qemu-devel/2020-08/msg00044.html

Signed-off-by: Robert Foley <robert.foley@linaro.org>
---
 target/arm/cpu.c    | 13 ++++++++++---
 target/arm/helper.c | 17 ++++++++++++++++-
 2 files changed, 26 insertions(+), 4 deletions(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 401832ea95..b8544f0f0a 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -528,12 +528,17 @@ bool arm_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
 {
     CPUClass *cc = CPU_GET_CLASS(cs);
     CPUARMState *env = cs->env_ptr;
-    uint32_t cur_el = arm_current_el(env);
-    bool secure = arm_is_secure(env);
-    uint64_t hcr_el2 = arm_hcr_el2_eff(env);
+    uint32_t cur_el;
+    bool secure;
+    uint64_t hcr_el2;
     uint32_t target_el;
     uint32_t excp_idx;
 
+    qemu_mutex_lock_iothread();
+    cur_el = arm_current_el(env);
+    secure = arm_is_secure(env);
+    hcr_el2 = arm_hcr_el2_eff(env);
+
     /* The prioritization of interrupts is IMPLEMENTATION DEFINED. */
 
     if (interrupt_request & CPU_INTERRUPT_FIQ) {
@@ -568,12 +573,14 @@ bool arm_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
             goto found;
         }
     }
+    qemu_mutex_unlock_iothread();
     return false;
 
  found:
     cs->exception_index = excp_idx;
     env->exception.target_el = target_el;
     cc->do_interrupt(cs);
+    qemu_mutex_unlock_iothread();
     return true;
 }
 
diff --git a/target/arm/helper.c b/target/arm/helper.c
index c5ea2c25ea..3a22d40598 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -9759,7 +9759,13 @@ void arm_cpu_do_interrupt(CPUState *cs)
 {
     ARMCPU *cpu = ARM_CPU(cs);
     CPUARMState *env = &cpu->env;
-    unsigned int new_el = env->exception.target_el;
+    unsigned int new_el;
+
+    bool bql = !qemu_mutex_iothread_locked();
+    if (bql) {
+        qemu_mutex_lock_iothread();
+    }
+    new_el = env->exception.target_el;
 
     assert(!arm_feature(env, ARM_FEATURE_M));
 
@@ -9776,6 +9782,9 @@ void arm_cpu_do_interrupt(CPUState *cs)
     if (arm_is_psci_call(cpu, cs->exception_index)) {
         arm_handle_psci_call(cpu);
         qemu_log_mask(CPU_LOG_INT, "...handled as PSCI call\n");
+        if (bql) {
+            qemu_mutex_unlock_iothread();
+        }
         return;
     }
 
@@ -9787,6 +9796,9 @@ void arm_cpu_do_interrupt(CPUState *cs)
 #ifdef CONFIG_TCG
     if (cs->exception_index == EXCP_SEMIHOST) {
         handle_semihosting(cs);
+        if (bql) {
+            qemu_mutex_unlock_iothread();
+        }
         return;
     }
 #endif
@@ -9808,6 +9820,9 @@ void arm_cpu_do_interrupt(CPUState *cs)
     if (!kvm_enabled()) {
         cpu_interrupt_request_or(cs, CPU_INTERRUPT_EXITTB);
     }
+    if (bql) {
+        qemu_mutex_unlock_iothread();
+    }
 }
 #endif /* !CONFIG_USER_ONLY */
 
-- 
2.17.1
