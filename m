Received: by 2002:ac2:5937:0:0:0:0:0 with SMTP id v23csp2305938lfi;
        Thu, 26 Mar 2020 12:38:28 -0700 (PDT)
X-Received: by 2002:a05:6214:1471:: with SMTP id c17mr9811893qvy.97.1585251508444;
        Thu, 26 Mar 2020 12:38:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1585251508; cv=none;
        d=google.com; s=arc-20160816;
        b=HA9l4CC8QIiIxsLNPuZQkGTmyHhbF3gd6BV+U67fX2R0IYhVJyctQd+sM0G5hb0ctz
         QZYnuw0UZ2YFQvxGFiJPPHwYAnMVbm/urmLPQp0J/JpMNCwb7K30GjD03U9ihhC27rOC
         o+rodzWkcb7GcaVodSc+F3erjp25gA/YdIfwD/2xjspaXAYejhLp1kQyUHV4zjOy10nG
         EHNWjgL80057GbonQ6J7RsGFPajkALhNolWnEaiWZJqH38UGrWo9hFP0ZXhwrTwm7uo/
         URhE1/yYUbzVXssCg3WmTfkl19f870aOPRtLX06bYvT6y1dmD77saXBeFgqr38QWMkiV
         XhBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=peeEpurfJyQFOk/Y5mv4nylcNl/81VuZK9r+NVDwKgU=;
        b=VbBqGKwnbcq8TBJDSJCmDZxM+o0O8ru897I+QAhYjbmKTxoUm6/mC+EbCkXYqI+Ubw
         FT+K1gwUphSGKsw7nrZRyjiXJQI7vI0eLVHvwk8x/EbtGbxpqrGOEK0o1BK/+BuUD2Wb
         BPSAjC3NZ3/alxAkw5j0B1gLNeOHBnAgIwnak1OrNjhpFW9st2fUO4v5jd7LTTjYDZuQ
         pg5JylaGC9TlRYk2fe+e28VjLDEwUuGb5uEJ1gEgEumysQL+0r+J7PihcJLD5S5XF56I
         0j06wA+P+j0ljl9VoW9EBShdqAQ/wVnLfZgw0th88XjL+mIx+AgtAxf3P7KY8ErtXsob
         28hA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Pu/iQU0w";
       spf=pass (google.com: domain of robert.foley@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=robert.foley@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <robert.foley@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id f17sor5313332qtg.44.2020.03.26.12.38.28
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 26 Mar 2020 12:38:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of robert.foley@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Pu/iQU0w";
       spf=pass (google.com: domain of robert.foley@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=robert.foley@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=peeEpurfJyQFOk/Y5mv4nylcNl/81VuZK9r+NVDwKgU=;
        b=Pu/iQU0wjw5Q8m4vkpiyRh6hZHgO1MATDuKPcN52fchs4/yKvslhi3ViUfiC5XVrYv
         S0ufH3bi5B66iPearsRvFt4wrlX/KecUZxHge8HrIJcx7RPhbqmaRF7OsdDL0THRdqrK
         +dz4NXobhiU9EmgtJS/1i9UIEIPQL3cyni0YrLKAgWgjB+p+5NPJc9xILR70km/y5u8n
         gIJNYyT0HUXohkjQA9+v0/6o+HEUIsjFNuJQcds7Hconv0/3qaKjVJDuIXDf3SWivTcq
         8Cmo3ie79lX0ebNTQOahscj6lqX7+pjy9rMeuYoWW5yrz5BzR+EBRdoEGT5Nj5BJKzrF
         SYHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=peeEpurfJyQFOk/Y5mv4nylcNl/81VuZK9r+NVDwKgU=;
        b=dADSeUuwAk7StP42DWcWk68c0p8lho+ITfY9eoolgFJPe4W6Zx014u13oSaamRusCP
         Mz+yCFCW/aOyj4capxGzP6AyIGX0QXIlBchm5KX1VtjaTG4ADwGwgXQbEPTCxiBjhiKW
         FxzFxv8gpNlbhmJ6NaoYdeuA1RBgJb9wnNzDQ39au3wt0IUqjNhokx8rdOFSXu1vpEp9
         T/JRRAqUUcorTdj6x3rnKC07FVa6NP3+1eeY5azLAT3DAZpoiKVePqPKrvsmJiOIi/Nn
         SfUu6RU+k5fFsEsJJdSjSmcJ+FgeD7rMduETN7KoljZDOQQwtKQI9ErgxiWoVL9d2kOE
         5JeA==
X-Gm-Message-State: ANhLgQ0yya2iDSUgGwP22UPbravlveRCk+tCmjjTmYoj9b7ndCCl55F/
	bph0N+vjo9183SQQjxYfXlwGm5c4
X-Google-Smtp-Source: ADFU+vsRPu2bv++cyos4KLSlEBhrzmTtN5B5ntwiNulTvBwY1L/uAVQLMcEBOkw5jWSvC9zpfdGufg==
X-Received: by 2002:aed:2415:: with SMTP id r21mr1157382qtc.82.1585251507974;
        Thu, 26 Mar 2020 12:38:27 -0700 (PDT)
Return-Path: <robert.foley@linaro.org>
Received: from Rfoley-MA01.hsd1.ma.comcast.net ([2601:199:4480:60c0:fd55:4e67:1038:8302])
        by smtp.gmail.com with ESMTPSA id u51sm2161916qth.46.2020.03.26.12.38.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2020 12:38:27 -0700 (PDT)
From: Robert Foley <robert.foley@linaro.org>
To: qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org,
	richard.henderson@linaro.org,
	peter.puhov@linaro.org,
	robert.foley@linaro.org,
	"Emilio G. Cota" <cota@braap.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org
Subject: [PATCH v8 39/74] arm: convert to cpu_interrupt_request
Date: Thu, 26 Mar 2020 15:31:21 -0400
Message-Id: <20200326193156.4322-40-robert.foley@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200326193156.4322-1-robert.foley@linaro.org>
References: <20200326193156.4322-1-robert.foley@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: fKPfYFm5GGc6

From: "Emilio G. Cota" <cota@braap.org>

Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Emilio G. Cota <cota@braap.org>
Signed-off-by: Robert Foley <robert.foley@linaro.org>
---
 target/arm/cpu.c     |  6 +++---
 target/arm/helper.c  | 16 +++++++---------
 target/arm/machine.c |  2 +-
 3 files changed, 11 insertions(+), 13 deletions(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 9fa514c999..e190604ae2 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -75,7 +75,7 @@ static bool arm_cpu_has_work(CPUState *cs)
     ARMCPU *cpu = ARM_CPU(cs);
 
     return (cpu->power_state != PSCI_OFF)
-        && cs->interrupt_request &
+        && cpu_interrupt_request(cs) &
         (CPU_INTERRUPT_FIQ | CPU_INTERRUPT_HARD
          | CPU_INTERRUPT_VFIQ | CPU_INTERRUPT_VIRQ
          | CPU_INTERRUPT_EXITTB);
@@ -611,7 +611,7 @@ void arm_cpu_update_virq(ARMCPU *cpu)
     bool new_state = (env->cp15.hcr_el2 & HCR_VI) ||
         (env->irq_line_state & CPU_INTERRUPT_VIRQ);
 
-    if (new_state != ((cs->interrupt_request & CPU_INTERRUPT_VIRQ) != 0)) {
+    if (new_state != ((cpu_interrupt_request(cs) & CPU_INTERRUPT_VIRQ) != 0)) {
         if (new_state) {
             cpu_interrupt(cs, CPU_INTERRUPT_VIRQ);
         } else {
@@ -632,7 +632,7 @@ void arm_cpu_update_vfiq(ARMCPU *cpu)
     bool new_state = (env->cp15.hcr_el2 & HCR_VF) ||
         (env->irq_line_state & CPU_INTERRUPT_VFIQ);
 
-    if (new_state != ((cs->interrupt_request & CPU_INTERRUPT_VFIQ) != 0)) {
+    if (new_state != ((cpu_interrupt_request(cs) & CPU_INTERRUPT_VFIQ) != 0)) {
         if (new_state) {
             cpu_interrupt(cs, CPU_INTERRUPT_VFIQ);
         } else {
diff --git a/target/arm/helper.c b/target/arm/helper.c
index b7b6887241..19efdc0b00 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -2132,26 +2132,27 @@ static uint64_t isr_read(CPUARMState *env, const ARMCPRegInfo *ri)
     CPUState *cs = env_cpu(env);
     uint64_t hcr_el2 = arm_hcr_el2_eff(env);
     uint64_t ret = 0;
+    uint32_t interrupt_request = cpu_interrupt_request(cs);
     bool allow_virt = (arm_current_el(env) == 1 &&
                        (!arm_is_secure_below_el3(env) ||
                         (env->cp15.scr_el3 & SCR_EEL2)));
 
     if (allow_virt && (hcr_el2 & HCR_IMO)) {
-        if (cs->interrupt_request & CPU_INTERRUPT_VIRQ) {
+        if (interrupt_request & CPU_INTERRUPT_VIRQ) {
             ret |= CPSR_I;
         }
     } else {
-        if (cs->interrupt_request & CPU_INTERRUPT_HARD) {
+        if (interrupt_request & CPU_INTERRUPT_HARD) {
             ret |= CPSR_I;
         }
     }
 
     if (allow_virt && (hcr_el2 & HCR_FMO)) {
-        if (cs->interrupt_request & CPU_INTERRUPT_VFIQ) {
+        if (interrupt_request & CPU_INTERRUPT_VFIQ) {
             ret |= CPSR_F;
         }
     } else {
-        if (cs->interrupt_request & CPU_INTERRUPT_FIQ) {
+        if (interrupt_request & CPU_INTERRUPT_FIQ) {
             ret |= CPSR_F;
         }
     }
@@ -9676,10 +9677,7 @@ void arm_cpu_do_interrupt(CPUState *cs)
     }
 #endif
 
-    /* Hooks may change global state so BQL should be held, also the
-     * BQL needs to be held for any modification of
-     * cs->interrupt_request.
-     */
+    /* Hooks may change global state so BQL should be held */
     g_assert(qemu_mutex_iothread_locked());
 
     arm_call_pre_el_change_hook(cpu);
@@ -9694,7 +9692,7 @@ void arm_cpu_do_interrupt(CPUState *cs)
     arm_call_el_change_hook(cpu);
 
     if (!kvm_enabled()) {
-        cs->interrupt_request |= CPU_INTERRUPT_EXITTB;
+        cpu_interrupt_request_or(cs, CPU_INTERRUPT_EXITTB);
     }
 }
 #endif /* !CONFIG_USER_ONLY */
diff --git a/target/arm/machine.c b/target/arm/machine.c
index c5a2114f51..42f4368de3 100644
--- a/target/arm/machine.c
+++ b/target/arm/machine.c
@@ -713,7 +713,7 @@ static int cpu_post_load(void *opaque, int version_id)
     if (env->irq_line_state == UINT32_MAX) {
         CPUState *cs = CPU(cpu);
 
-        env->irq_line_state = cs->interrupt_request &
+        env->irq_line_state = cpu_interrupt_request(cs) &
             (CPU_INTERRUPT_HARD | CPU_INTERRUPT_FIQ |
              CPU_INTERRUPT_VIRQ | CPU_INTERRUPT_VFIQ);
     }
-- 
2.17.1
