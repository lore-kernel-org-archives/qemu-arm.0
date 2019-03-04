Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp3890946wrx;
        Mon, 4 Mar 2019 10:18:26 -0800 (PST)
X-Google-Smtp-Source: APXvYqzx2SgfK+bWxgGqrY0/pmL6D+jny8IvaR105z+tAlYc683cyTUIAdTdydqJLUqBlIEoUfyd
X-Received: by 2002:a0c:b597:: with SMTP id g23mr15272222qve.142.1551723506100;
        Mon, 04 Mar 2019 10:18:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1551723506; cv=none;
        d=google.com; s=arc-20160816;
        b=A3e3X/NKpjBJ/6HhCjS5HjrBWM+/ZcpENe0W2jJDH3r6G24s4num+UuM4SZeJx0EDY
         64xX40mjzzYFJiKtsJHMO+QdTLmf2o5OVK1pshn3ZZwtl1i0QfkSrPnkNbdkRx6egh7I
         CKoEYESzh+I66JeUZJFw0n0yWw/i/I/69OfttqqOUGKmIWgeamjD5JP8q76iqjPU6E+p
         SmBNxhuo24ejr2an7ARGm5PSawbOjY8MTV/UnpLPuRnhP+Cys3XwM/Ktj+miedKUsDEx
         ndg84le4unoXywlMDgT54jh8jnRpjYc0tKsrgSRizQOAqx50V0st3FUnOuSzGUliMrEc
         mhRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:dkim-signature;
        bh=FPbopEfX3DCU5tyPHThHNKbNHYi4C4irP7knpRtWl1M=;
        b=qpSacfFQ0/l+HRmbQf8OMnAJInhFiTho82vno5ixgdxojiCVQC1zXqTVSOr4rhxck7
         tNQnwOd6Pb9QiqGzZ1Cg2xq8ewCriPKBDy7fJ3ZnEPzGYNW62hRxJaBqVaaFHdwaNOAN
         YLysEQ2xsntw68OIq86Rkldj4Lar9/TGjJwxlLwkg/N50FIs2pE2xCkmJgUW0HF5RQAy
         kLe5EP1QRKGdmacjDnlslvqekssLNzwMx0JQmGHX2fn8mVbpNDB0+nIucr+KBrAc6FHy
         cZ4MRI3AOvMpkDx57YHHG/DCNS0KThzJBhPpE8+lECVZbmwHNkOPy1DHQiH5jdBaxXwf
         XRSw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@braap.org header.s=mesmtp header.b=T+SsFQzT;
       dkim=pass header.i=@messagingengine.com header.s=fm2 header.b=UTEMkFTc;
       spf=pass (google.com: domain of cota@braap.org designates 64.147.123.25 as permitted sender) smtp.mailfrom=cota@braap.org
Return-Path: <cota@braap.org>
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com. [64.147.123.25])
        by mx.google.com with ESMTPS id g14si3561171qte.339.2019.03.04.10.18.25
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 04 Mar 2019 10:18:26 -0800 (PST)
Received-SPF: pass (google.com: domain of cota@braap.org designates 64.147.123.25 as permitted sender) client-ip=64.147.123.25;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@braap.org header.s=mesmtp header.b=T+SsFQzT;
       dkim=pass header.i=@messagingengine.com header.s=fm2 header.b=UTEMkFTc;
       spf=pass (google.com: domain of cota@braap.org designates 64.147.123.25 as permitted sender) smtp.mailfrom=cota@braap.org
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.west.internal (Postfix) with ESMTP id AE31E371C;
	Mon,  4 Mar 2019 13:18:24 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Mon, 04 Mar 2019 13:18:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=braap.org; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding; s=mesmtp;
	 bh=FPbopEfX3DCU5tyPHThHNKbNHYi4C4irP7knpRtWl1M=; b=T+SsFQzTAgnT
	pr5JqJh1Db/iKReoVtyw8t1sKsag6Ot0O4sIaD/q+D67lL1C0WeC3rJfGhRTzUP2
	xjPqlFmDjkLyPjZX8+j22aZ8iHx/b1J3/24p0SsjQLEU6SYPhA8xAEqePH6r6MFx
	py2nj8c9GfxA5Shd1TG161xjLNWCapY=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:date:from:in-reply-to:message-id:mime-version:references
	:subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; bh=FPbopEfX3DCU5tyPHThHNKbNHYi4C4irP7knpRtWl
	1M=; b=UTEMkFTcrWyV54Gq6Ww8CuLiqAvwrzEouDSwV/RIjoHTqUNRsUMYmqCFp
	VRBQzAecwZmiHhkSSBfaO4gbpOwxK0xUYE5FPbwkg5oVNu03LQOGKsdjVBoePgQg
	5ePojMa/I7ufZh10zfG2mNR3Mu84xz75CU1bV2GTmI36k20+qZ+8YigjQ/6Akohq
	bhERjMXxYpC+nqsVHfhHeOZ53Gzfui648gRSqszWtDQBnHzorIosGAgaSEYdWCr6
	itMrQR+ZV+4r9utBZcQuC6FW1u0y43w38wrIXKtqghzsqYRQxTNxDP8N6yXwDAAu
	c0A2PBB4GsuKPzdb05J+O1OF5FXag==
X-ME-Sender: <xms:8Gt9XCR4Ii5JxBMiCJcJxV1YodUmg7hROBo2DZA3iKXT2NEkgWFk0A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedutddrfedugdduuddtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvufffkffojghfgggtgfesthekredtredtjeenucfhrhhomhepfdfgmhhi
    lhhiohcuifdrucevohhtrgdfuceotghothgrsegsrhgrrghprdhorhhgqeenucfkphepud
    dvkedrheelrddvtddrvdduieenucfrrghrrghmpehmrghilhhfrhhomheptghothgrsegs
    rhgrrghprdhorhhgnecuvehluhhsthgvrhfuihiivgepvdeh
X-ME-Proxy: <xmx:8Gt9XFdm4Z5klKFura0Q1-mPIGBq6vBBBof7nPocl1eQH3fMhCEBAQ>
    <xmx:8Gt9XBmnkUUZFa6pJSctFXrBTzwMtohhWz-fUKvcFBSqYfgr7JN0fw>
    <xmx:8Gt9XKhUnK8EOJ7TI98uogWtgWABFc8xWgLrahM7t4J-_r4SnGOlRQ>
    <xmx:8Gt9XCEWq2y6wuc9adAshKPz3sfma0U46on8SZtrunH8yAIKGecK6A>
Received: from localhost (flamenco.cs.columbia.edu [128.59.20.216])
	by mail.messagingengine.com (Postfix) with ESMTPA id D798C1033A;
	Mon,  4 Mar 2019 13:18:23 -0500 (EST)
From: "Emilio G. Cota" <cota@braap.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org
Subject: [PATCH v7 38/73] arm: convert to cpu_interrupt_request
Date: Mon,  4 Mar 2019 13:17:38 -0500
Message-Id: <20190304181813.8075-39-cota@braap.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190304181813.8075-1-cota@braap.org>
References: <20190304181813.8075-1-cota@braap.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 4uEMAm4sOId8

Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Emilio G. Cota <cota@braap.org>
---
 target/arm/cpu.c     |  6 +++---
 target/arm/helper.c  | 16 +++++++---------
 target/arm/machine.c |  2 +-
 3 files changed, 11 insertions(+), 13 deletions(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 845730c00c..7037e22580 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -73,7 +73,7 @@ static bool arm_cpu_has_work(CPUState *cs)
     ARMCPU *cpu = ARM_CPU(cs);
 
     return (cpu->power_state != PSCI_OFF)
-        && cs->interrupt_request &
+        && cpu_interrupt_request(cs) &
         (CPU_INTERRUPT_FIQ | CPU_INTERRUPT_HARD
          | CPU_INTERRUPT_VFIQ | CPU_INTERRUPT_VIRQ
          | CPU_INTERRUPT_EXITTB);
@@ -484,7 +484,7 @@ void arm_cpu_update_virq(ARMCPU *cpu)
     bool new_state = (env->cp15.hcr_el2 & HCR_VI) ||
         (env->irq_line_state & CPU_INTERRUPT_VIRQ);
 
-    if (new_state != ((cs->interrupt_request & CPU_INTERRUPT_VIRQ) != 0)) {
+    if (new_state != ((cpu_interrupt_request(cs) & CPU_INTERRUPT_VIRQ) != 0)) {
         if (new_state) {
             cpu_interrupt(cs, CPU_INTERRUPT_VIRQ);
         } else {
@@ -505,7 +505,7 @@ void arm_cpu_update_vfiq(ARMCPU *cpu)
     bool new_state = (env->cp15.hcr_el2 & HCR_VF) ||
         (env->irq_line_state & CPU_INTERRUPT_VFIQ);
 
-    if (new_state != ((cs->interrupt_request & CPU_INTERRUPT_VFIQ) != 0)) {
+    if (new_state != ((cpu_interrupt_request(cs) & CPU_INTERRUPT_VFIQ) != 0)) {
         if (new_state) {
             cpu_interrupt(cs, CPU_INTERRUPT_VFIQ);
         } else {
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 1fa282a7fc..2affe7965c 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -1893,23 +1893,24 @@ static uint64_t isr_read(CPUARMState *env, const ARMCPRegInfo *ri)
     CPUState *cs = ENV_GET_CPU(env);
     uint64_t hcr_el2 = arm_hcr_el2_eff(env);
     uint64_t ret = 0;
+    uint32_t interrupt_request = cpu_interrupt_request(cs);
 
     if (hcr_el2 & HCR_IMO) {
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
 
     if (hcr_el2 & HCR_FMO) {
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
@@ -9647,10 +9648,7 @@ void arm_cpu_do_interrupt(CPUState *cs)
         return;
     }
 
-    /* Hooks may change global state so BQL should be held, also the
-     * BQL needs to be held for any modification of
-     * cs->interrupt_request.
-     */
+    /* Hooks may change global state so BQL should be held */
     g_assert(qemu_mutex_iothread_locked());
 
     arm_call_pre_el_change_hook(cpu);
@@ -9665,7 +9663,7 @@ void arm_cpu_do_interrupt(CPUState *cs)
     arm_call_el_change_hook(cpu);
 
     if (!kvm_enabled()) {
-        cs->interrupt_request |= CPU_INTERRUPT_EXITTB;
+        cpu_interrupt_request_or(cs, CPU_INTERRUPT_EXITTB);
     }
 }
 #endif /* !CONFIG_USER_ONLY */
diff --git a/target/arm/machine.c b/target/arm/machine.c
index b292549614..4f2099ecde 100644
--- a/target/arm/machine.c
+++ b/target/arm/machine.c
@@ -693,7 +693,7 @@ static int cpu_post_load(void *opaque, int version_id)
     if (env->irq_line_state == UINT32_MAX) {
         CPUState *cs = CPU(cpu);
 
-        env->irq_line_state = cs->interrupt_request &
+        env->irq_line_state = cpu_interrupt_request(cs) &
             (CPU_INTERRUPT_HARD | CPU_INTERRUPT_FIQ |
              CPU_INTERRUPT_VIRQ | CPU_INTERRUPT_VFIQ);
     }
-- 
2.17.1
