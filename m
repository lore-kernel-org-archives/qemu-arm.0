Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp1737096lfb;
        Thu, 21 May 2020 09:44:07 -0700 (PDT)
X-Received: by 2002:a37:84c5:: with SMTP id g188mr10131010qkd.344.1590079447684;
        Thu, 21 May 2020 09:44:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1590079447; cv=none;
        d=google.com; s=arc-20160816;
        b=AbvNuI6nmY+U59rKKNEthenfqZwEa0qoUrS1nTshI7GaGOpVoAqdXN32wmwS9mrThn
         GKpdSjA+V+ck7BHxXUfQkxNiRPCwJi4bTd9dM8wzuMS2cphrnWFv0Jxvn5v9d91lQ/eZ
         ifTCr7mm+dBEQis2bKXhwTsvDKUhTMOS79D6TawY61z2s8zZqUoGpe3tGgAsmPSUHjH3
         s0zTHugn6y7reuA/m9si9/WLdpdpTPcWO541eutvpnQAnVrDSbS+cOYXZYrrXSZGfaSi
         RRTnssPQVu0mpK7SRLWDCq31SaoOuhOwseJluxDOGD2YyvYmSDr9nU7Qy6db1rq+/A/J
         287w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=yGVX5kDKORVWzWyGlj0YwmQls1Q4ENhSP5KQMqWdryo=;
        b=VJKvbvRI5aBDI4ZJPDX64YUqpD0Rwi6kgg7Z1xfWrMUpszZpNKj4tQDFCT0jfTGqYM
         DoBaK7wwWW30bHpOBF0+WdzSCAMdqUJlEx7BZEgxqzQ+TIvrV70LHLwPnlOdNgbdR54B
         sDR8aNP7UdViXABfo7Ht9bqSYfnYKSfZU212RPmRyLClRODSBSbxqV9yra18wg8bFFt6
         m0FyJD/qpiHiSkSNb83vRxecJAZaL0VW29EsX3ItLlzAIPaC4tS6+3DhFPn2XVuGGO7L
         00w6MscUUbIS/K+fXLxDZMNv1j+ZhCpS3FLXraS6SdA8h6/vfgsM3YyBrxZ2DOeClAMg
         EvJw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PnNuNSdi;
       spf=pass (google.com: domain of robert.foley@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=robert.foley@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <robert.foley@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id p7sor6120516qki.72.2020.05.21.09.44.07
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 21 May 2020 09:44:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of robert.foley@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PnNuNSdi;
       spf=pass (google.com: domain of robert.foley@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=robert.foley@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=yGVX5kDKORVWzWyGlj0YwmQls1Q4ENhSP5KQMqWdryo=;
        b=PnNuNSdiscK9zZByW9Q9FHuJsaSawEAEhX4G1K9tT0Il1Yy0rgKX38wsSLAoBrT3l4
         5Sp1OwBk016raKFaypH/c/EwNpdr1gc/zpv3dC3jqbDoMqJ8aYyzq7PusgBRjO9hpmjO
         ieL2HrKusmEbRzD27Mn7G2LCviU6YXjLGJqR7+2RE12+jMWaNVzZX7RTvNAb9ZB2KZHs
         6QAf1qls0gjP5hVPwMoBULz4bjtpd9dJJ4G0TPrOsECwoU/NCJkODQ8G9rSk6p3Qq32W
         T0NeTw+xMcpon/Kvfn7Q2m9lT9u8PW6pEpCcAOf68jKFlxZaLftr2LJ1hGEDlCksE/y5
         y0OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=yGVX5kDKORVWzWyGlj0YwmQls1Q4ENhSP5KQMqWdryo=;
        b=A5r1NiEPyXy5xrGMgGbSkh+M4XJMUeqE3vccow1XGnGD1dR28/PZeOlS3K/5nEz8Di
         9MreFOQrnjF3mH1IYgdRAwGkPKsqT61w2aPzmQ57p2O6fSPE258CJtVXPevD1sMpkQ+6
         fqXyQcY23Ye9E5na1kj5XbIfZZnPnlrb4YeixXnrpNnnbQZaQIZ9F4+aHPpSlrjeJJUv
         hM0Ikd39+kZZuJU9npJpgBS1zR2DT1mecMVRgRJFT5iV1pJGxPs9adp+Q2nef+Bb0fPj
         petCS/aKlIMXjCUo4tY5/dcByac2k3UrmMF0WpgKaum3T+tw5inRJ9fkbAcWK4a8DY7c
         0KRw==
X-Gm-Message-State: AOAM532AmyCjVbGyJScTICmIq0JvI70RU/a5rf1W6+aqvndWC9vh9QyQ
	u/iiC2+DwEBt4FOcNCz6r3bT1ZOa
X-Google-Smtp-Source: ABdhPJwVipEc+70rUkpGn5Lvk1kyNeCvJKL4TGjOc8O6aQBBiWdbJZUaOzHQjJWK3C/nZPGprQpbYg==
X-Received: by 2002:a37:46c9:: with SMTP id t192mr7538363qka.3.1590079447298;
        Thu, 21 May 2020 09:44:07 -0700 (PDT)
Return-Path: <robert.foley@linaro.org>
Received: from Rfoley-MA01.hsd1.ma.comcast.net ([2601:199:4480:60c0:1944:c530:655c:5583])
        by smtp.gmail.com with ESMTPSA id x24sm5923829qth.57.2020.05.21.09.44.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2020 09:44:06 -0700 (PDT)
From: Robert Foley <robert.foley@linaro.org>
To: qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org,
	richard.henderson@linaro.org,
	cota@braap.org,
	peter.puhov@linaro.org,
	robert.foley@linaro.org,
	Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org
Subject: [PATCH v9 39/74] arm: convert to cpu_interrupt_request
Date: Thu, 21 May 2020 12:39:36 -0400
Message-Id: <20200521164011.638-40-robert.foley@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200521164011.638-1-robert.foley@linaro.org>
References: <20200521164011.638-1-robert.foley@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: XI88iMyFyzO2

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
index dc435a18a1..6c308268a9 100644
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
index a92ae55672..5d018b2d88 100644
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
