Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp406855wrt;
        Wed, 12 Dec 2018 21:05:46 -0800 (PST)
X-Google-Smtp-Source: AFSGD/WEgcNV81E7Zfd722V06kVtYBW3e8zs4pKLTjyHaEMRYr7RhCcGPZcRE+iKrbDhHz0PPT86
X-Received: by 2002:aed:2a64:: with SMTP id k33mr22557369qtf.102.1544677545987;
        Wed, 12 Dec 2018 21:05:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1544677545; cv=none;
        d=google.com; s=arc-20160816;
        b=M55TMhYWyjHUeXd1rcWGFt16BQW43cw4OPPMh0gz+NUql92T4CQvG06XTKKSS8/UtI
         3OMWsz8DU4dLLWkPCBrc2WlQ9mWUY/6xHsWfrnGr2idkn1e9adRRr0sYOAGlrAY2t/uG
         2YPhwD/7+jsEy6wj/yXxSnZyroBHskBWcrssjh1jRNxkfG1knQ748i+hB7cawtgp5P8i
         WvNDA1tUVLNtR7nxhAzvLPY0EtpBKjM2xgebJ1yFVVPI7vp1VqLWkWDLrkt/Cuv07z5w
         sNDjfBPVt7wwG33F8kRfsiz7wauM590JZqQ3wZDGlKO0vrqOXh7fZtSQS07Cx1JuMAUv
         xA1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :dkim-signature:dkim-signature;
        bh=2UZm98S9fe8V+prdQ4qHhvVJPZj1bEdQY1dnNc1jvXg=;
        b=Xq7rWwKUbidwISu8bFn4Yuql86iZDkwHwTbBEznAFdOQyLs0gTu1tYwlN6AZDgMpVq
         vdbJDf+FX09obgtFzcET3DVcQedeyXZqAeteDecVuura38BKhmKIqhfz8RDn6bTJywyu
         O2HB9y6QcBHRgB2bB77RUQt2kGeSdFb3XUF1+TlY/kptR17+9wVZusaK0bIXqhrKzXup
         v0CevxGHmgmuFeY0aI9x3iV0Xrpexd6vsj51zSIWbZ9LS5niRhGu80pRpGfsmQzhqO3Q
         7hT9EchmYf45RmI2pH7MnFFQcmaJ4InYvqXtCBmhqUBIVUUQrAEQdGyaKt03GbCjcBdK
         5nfA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@braap.org header.s=mesmtp header.b="V/oJhgtB";
       dkim=pass header.i=@messagingengine.com header.s=fm1 header.b=phO4Gmp0;
       spf=pass (google.com: domain of cota@braap.org designates 66.111.4.25 as permitted sender) smtp.mailfrom=cota@braap.org
Return-Path: <cota@braap.org>
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com. [66.111.4.25])
        by mx.google.com with ESMTPS id d22si455810qvf.130.2018.12.12.21.05.45
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 12 Dec 2018 21:05:45 -0800 (PST)
Received-SPF: pass (google.com: domain of cota@braap.org designates 66.111.4.25 as permitted sender) client-ip=66.111.4.25;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@braap.org header.s=mesmtp header.b="V/oJhgtB";
       dkim=pass header.i=@messagingengine.com header.s=fm1 header.b=phO4Gmp0;
       spf=pass (google.com: domain of cota@braap.org designates 66.111.4.25 as permitted sender) smtp.mailfrom=cota@braap.org
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id 8777622233;
	Thu, 13 Dec 2018 00:05:45 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Thu, 13 Dec 2018 00:05:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=braap.org; h=
	from:to:cc:subject:date:message-id:in-reply-to:references; s=
	mesmtp; bh=2UZm98S9fe8V+prdQ4qHhvVJPZj1bEdQY1dnNc1jvXg=; b=V/oJh
	gtBjkgtJfuxAc9OU/EdA+fRHTWYnQfImLIvjzJchtE91zhTHqCo7E3qMH0XodTYG
	j6vSHy1b7kwu9F6vPJlXrJ4+MjdXC6vIkDVdo3S/zzSZBlglxm8ndaiTyWwRBPgs
	ItbT4xeD34NG1yiuFFc2KBz+7/50JO0a13ebSU=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:date:from:in-reply-to:message-id
	:references:subject:to:x-me-proxy:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm1; bh=2UZm98S9fe8V+prdQ4qHhvVJPZj1b
	EdQY1dnNc1jvXg=; b=phO4Gmp0PAnSmOzNW40fqHPI/717GGMkXuSOtIIR5Y1zE
	i9iflf4WbYFLA7iPXFGYO8mfec4zUvRNk2l7Mn0Uk/6xbs8q9/hS3+SMRUqf6wOb
	R9gqtm2E2Uk1jHElFbgoNyBEZARV3tiaOWtBkOu10PmFtP/P6e4SVDwLIuvESXy2
	wi7he6/SlEK0dvPtR0EiRJMUu0yP/pnxwwc+ET6+Rqc6QfnjPgx6+5Wk74G0bmpy
	dTUUl1iQHqsfO2qgc164/AN+mPWTcLcAY/oNIp1s5MIVu7IbsMSMcH3jqIAFjOKk
	A3hRT8aaBZV73jXv6oh9KORa96gzPhuFhLSzPjf9w==
X-ME-Sender: <xms:qegRXPeA1e4tPKCDojzB4luP_qd4-k14RFUq-Tg5bsSiLuoY5T-pqg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedtkedrudehuddgkedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfquhhtnecuuegrihhlohhuthemucef
    tddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvffufffkof
    gjfhestddtredtredttdenucfhrhhomhepfdfgmhhilhhiohcuifdrucevohhtrgdfuceo
    tghothgrsegsrhgrrghprdhorhhgqeenucfkphepuddvkedrheelrddvtddrvdduieenuc
    frrghrrghmpehmrghilhhfrhhomheptghothgrsegsrhgrrghprdhorhhgnecuvehluhhs
    thgvrhfuihiivgepke
X-ME-Proxy: <xmx:qegRXGwQKMtz4Tp0EJ_1yudCOyu00rD_TYZ1ZB3AAPIRyRw7Vwlm8g>
    <xmx:qegRXHyc6pAsSkvGAr476QD-h6bNxnG-dg2ae37pPr2M0a5prwUaJA>
    <xmx:qegRXHbaynFl9p8byPt6jecpHg5DOMGojICM_oof3VjpDOEEL3SbRA>
    <xmx:qegRXDT5hTWdcZziM1SqL4twN_6nLw483P-NvEV5bn0RsGsWDCVMOQ>
Received: from localhost (flamenco.cs.columbia.edu [128.59.20.216])
	by mail.messagingengine.com (Postfix) with ESMTPA id 17F311045C;
	Thu, 13 Dec 2018 00:05:45 -0500 (EST)
From: "Emilio G. Cota" <cota@braap.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org
Subject: [PATCH v5 38/73] arm: convert to cpu_interrupt_request
Date: Thu, 13 Dec 2018 00:04:18 -0500
Message-Id: <20181213050453.9677-39-cota@braap.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20181213050453.9677-1-cota@braap.org>
References: <20181213050453.9677-1-cota@braap.org>
X-TUID: VkKQPIzQ8bz2

Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Emilio G. Cota <cota@braap.org>
---
 target/arm/cpu.c    |  6 +++---
 target/arm/helper.c | 16 +++++++---------
 2 files changed, 10 insertions(+), 12 deletions(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 8baa5bb891..738b80944c 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -49,7 +49,7 @@ static bool arm_cpu_has_work(CPUState *cs)
     ARMCPU *cpu = ARM_CPU(cs);
 
     return (cpu->power_state != PSCI_OFF)
-        && cs->interrupt_request &
+        && cpu_interrupt_request(cs) &
         (CPU_INTERRUPT_FIQ | CPU_INTERRUPT_HARD
          | CPU_INTERRUPT_VFIQ | CPU_INTERRUPT_VIRQ
          | CPU_INTERRUPT_EXITTB);
@@ -448,7 +448,7 @@ void arm_cpu_update_virq(ARMCPU *cpu)
     bool new_state = (env->cp15.hcr_el2 & HCR_VI) ||
         (env->irq_line_state & CPU_INTERRUPT_VIRQ);
 
-    if (new_state != ((cs->interrupt_request & CPU_INTERRUPT_VIRQ) != 0)) {
+    if (new_state != ((cpu_interrupt_request(cs) & CPU_INTERRUPT_VIRQ) != 0)) {
         if (new_state) {
             cpu_interrupt(cs, CPU_INTERRUPT_VIRQ);
         } else {
@@ -469,7 +469,7 @@ void arm_cpu_update_vfiq(ARMCPU *cpu)
     bool new_state = (env->cp15.hcr_el2 & HCR_VF) ||
         (env->irq_line_state & CPU_INTERRUPT_VFIQ);
 
-    if (new_state != ((cs->interrupt_request & CPU_INTERRUPT_VFIQ) != 0)) {
+    if (new_state != ((cpu_interrupt_request(cs) & CPU_INTERRUPT_VFIQ) != 0)) {
         if (new_state) {
             cpu_interrupt(cs, CPU_INTERRUPT_VFIQ);
         } else {
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 0da1424f72..8c9b1210b2 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -1328,23 +1328,24 @@ static uint64_t isr_read(CPUARMState *env, const ARMCPRegInfo *ri)
 {
     CPUState *cs = ENV_GET_CPU(env);
     uint64_t ret = 0;
+    uint32_t interrupt_request = cpu_interrupt_request(cs);
 
     if (arm_hcr_el2_imo(env)) {
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
 
     if (arm_hcr_el2_fmo(env)) {
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
@@ -8693,10 +8694,7 @@ void arm_cpu_do_interrupt(CPUState *cs)
         return;
     }
 
-    /* Hooks may change global state so BQL should be held, also the
-     * BQL needs to be held for any modification of
-     * cs->interrupt_request.
-     */
+    /* Hooks may change global state so BQL should be held */
     g_assert(qemu_mutex_iothread_locked());
 
     arm_call_pre_el_change_hook(cpu);
@@ -8711,7 +8709,7 @@ void arm_cpu_do_interrupt(CPUState *cs)
     arm_call_el_change_hook(cpu);
 
     if (!kvm_enabled()) {
-        cs->interrupt_request |= CPU_INTERRUPT_EXITTB;
+        cpu_interrupt_request_or(cs, CPU_INTERRUPT_EXITTB);
     }
 }
 
-- 
2.17.1
