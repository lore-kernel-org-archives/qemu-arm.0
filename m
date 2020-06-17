Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp967360lfm;
        Wed, 17 Jun 2020 14:04:12 -0700 (PDT)
X-Received: by 2002:ad4:598f:: with SMTP id ek15mr581315qvb.196.1592427851876;
        Wed, 17 Jun 2020 14:04:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592427851; cv=none;
        d=google.com; s=arc-20160816;
        b=rKmqhUhW9jE0ePot5G8e24+EX5EKgqa7OYdaf4CsXGov4GeBSFcTorwcRANQEPEIbe
         sgjhm5thseUQRDg+DJ1GIq+ZfKpItOepuZKLAwBd/yP+GkOvyZA6XB0Q5VBX4pmwH/eq
         Zd4slZFVB8YL0hWmxeFOifj0r5ld5K5CqHeeNbfwqDF+m9tEQpMnmRdIY3LQCiUbFgjd
         XGwpEEMQITJJNsaclKXQkhk0fTwOW1p/Cp540MFIjjVAEth+B2MgmitEDDPS4cz/Ugl4
         ouN4H/sgWiUk6es06kWLyL2RtL3qL9vAxW0ksWVcU3vQs0AS9n6NUOPI9bxGod1lt+rq
         8Zdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=w3X/TBVNKMn8EXCp7BpdBrJlJ5hMtFe3cm30uQpq+d0=;
        b=lmxnyxAZp7I6xjYKoTzrhDdkJIzwnoGmXsl41E5muGoKdu91qtMTN8PUUHmfs9GMYa
         u9VXn0dj+8EuU1qbgZz7g7V4APWNwWsgFXCNrQbKSLkBhB/OhyRfwGwTwep5I0k6svab
         Q3kLZtquFwpZLMyUxljKGbhSO0pI+U4AqV9qUOTUMh9+YN/FUmf91sQOKhvmB4uLAOwj
         3DhQYLduH3hD+XliZD2wa/maoP/rWfwJYqmWqv8U0hA3UkFPJ3rykuG7ZpId7CUn0nCT
         X/VvK4e/F7wHXl2dsl7YkOdTZIs1tIL9ZKxbnS9BrKL95ihOOzIN00kVxjzBzpISZIhO
         V56A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GozekeXF;
       spf=pass (google.com: domain of robert.foley@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=robert.foley@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <robert.foley@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id e1sor1188119qtw.25.2020.06.17.14.04.11
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 17 Jun 2020 14:04:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of robert.foley@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GozekeXF;
       spf=pass (google.com: domain of robert.foley@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=robert.foley@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=w3X/TBVNKMn8EXCp7BpdBrJlJ5hMtFe3cm30uQpq+d0=;
        b=GozekeXFYlWQXc1tMVUl/JqyJ9gj3I7wtlDcVuLTMgtCkIfkbkJSx66XqbZX6HxjoW
         xCTsRkmRhQmNSiIw3YYxP5pPqAP5gYylI4rPfzid97zPwDhcrSSDjgV6zBDuB1AACSad
         VKcvAdjwP2F0UgMR59wTRkSGMBy0FyxyLA4jScOfkz0Wja3f1qpwzzySRiKEij+xlNGE
         NrFf/C+jji+/nRN0A1eQIjENRQiM9lzVkepDE5DczAy/ZsXzlJsyWI7J77ox2rbkHsve
         MLmLE+ww80hJYbPM6Dat6tcyxeuBSOivaHKkjcl8hhuXco23AAsBmU/ec7CceBYzrzdu
         DFCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=w3X/TBVNKMn8EXCp7BpdBrJlJ5hMtFe3cm30uQpq+d0=;
        b=isNPhiNVbrrkT9b1Evlp4nrshoKJNyq12VNBe9sSUzi42B3z+YVWAj7vBM7VhE/iZH
         2HhC8by10OIbgJnqX9bKtP7ry6D3jBUX6qzuZw6wSsTehUOMytsAByF+YTE8BSaZFGoO
         0FQ7E/CGpwPYo36B/YJQnEbWRaQwBphS9rRmH2c12vhkZ6WXNhUwAtLPjNdh3Nd4a6kf
         Uu+ywKeqiCcoXf/OwDyXflBjNbOCb63xGxHA10/E/tcWMkB/qfbCcPui6RmGzetRWlGu
         y9dTPk/sIStXzlCljuAK1UbR+DxdKicWMdEb4QziduOUsppFdsff0qjdrc96Aa1B5CNm
         p78A==
X-Gm-Message-State: AOAM531k2Sj7TQ62sIgbSGEDjG/tCBffqi9RO3q8uMkUY9CPoBf9rORk
	8TwGnEFaKnmATY/JpCA/yqJp0fvz
X-Google-Smtp-Source: ABdhPJw7/ieyWQ3tZwJNV12DlE9QivM4axAwt8bvqYtOPk6CdxHncwUi33b7qpMrvkTRJltoS05k+w==
X-Received: by 2002:ac8:5354:: with SMTP id d20mr1105252qto.363.1592427851478;
        Wed, 17 Jun 2020 14:04:11 -0700 (PDT)
Return-Path: <robert.foley@linaro.org>
Received: from Rfoley-MA01.hsd1.ma.comcast.net ([2601:199:4480:60c0:fc79:714c:9711:2e9c])
        by smtp.gmail.com with ESMTPSA id w13sm997245qkb.91.2020.06.17.14.04.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2020 14:04:10 -0700 (PDT)
From: Robert Foley <robert.foley@linaro.org>
To: qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org,
	cota@braap.org,
	peter.puhov@linaro.org,
	robert.foley@linaro.org,
	Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org
Subject: [PATCH v10 38/73] arm: convert to cpu_interrupt_request
Date: Wed, 17 Jun 2020 17:01:56 -0400
Message-Id: <20200617210231.4393-39-robert.foley@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200617210231.4393-1-robert.foley@linaro.org>
References: <20200617210231.4393-1-robert.foley@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: ax784L56n1F/

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
index df5c019145..2b11e126a8 100644
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
@@ -586,7 +586,7 @@ void arm_cpu_update_virq(ARMCPU *cpu)
     bool new_state = (env->cp15.hcr_el2 & HCR_VI) ||
         (env->irq_line_state & CPU_INTERRUPT_VIRQ);
 
-    if (new_state != ((cs->interrupt_request & CPU_INTERRUPT_VIRQ) != 0)) {
+    if (new_state != ((cpu_interrupt_request(cs) & CPU_INTERRUPT_VIRQ) != 0)) {
         if (new_state) {
             cpu_interrupt(cs, CPU_INTERRUPT_VIRQ);
         } else {
@@ -607,7 +607,7 @@ void arm_cpu_update_vfiq(ARMCPU *cpu)
     bool new_state = (env->cp15.hcr_el2 & HCR_VF) ||
         (env->irq_line_state & CPU_INTERRUPT_VFIQ);
 
-    if (new_state != ((cs->interrupt_request & CPU_INTERRUPT_VFIQ) != 0)) {
+    if (new_state != ((cpu_interrupt_request(cs) & CPU_INTERRUPT_VFIQ) != 0)) {
         if (new_state) {
             cpu_interrupt(cs, CPU_INTERRUPT_VFIQ);
         } else {
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 972a766730..37ac1cabfe 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -2079,26 +2079,27 @@ static uint64_t isr_read(CPUARMState *env, const ARMCPRegInfo *ri)
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
@@ -9591,10 +9592,7 @@ void arm_cpu_do_interrupt(CPUState *cs)
     }
 #endif
 
-    /* Hooks may change global state so BQL should be held, also the
-     * BQL needs to be held for any modification of
-     * cs->interrupt_request.
-     */
+    /* Hooks may change global state so BQL should be held */
     g_assert(qemu_mutex_iothread_locked());
 
     arm_call_pre_el_change_hook(cpu);
@@ -9609,7 +9607,7 @@ void arm_cpu_do_interrupt(CPUState *cs)
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
