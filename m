Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp824723wro;
        Thu, 25 Oct 2018 08:07:26 -0700 (PDT)
X-Google-Smtp-Source: AJdET5fLU2sd3AtB4bcX9cjOSd40u72059u9IVOU9yI/AD5DHQYuzI7K436mfX/zA9sLVUKYEZ/K
X-Received: by 2002:aed:3923:: with SMTP id l32-v6mr1832037qte.378.1540480046186;
        Thu, 25 Oct 2018 08:07:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1540480046; cv=none;
        d=google.com; s=arc-20160816;
        b=tu6L+ywSWXLjYyX4YPG7RcWQyr3ZeZgBRJfX27vzygmXwnse82NjGvUlGUt7Msf+d/
         aa5uAbbnjBtenB2HVI7X6zEefDf0F+NnL30/b92tmFqFCeyTR3u8DRmOnQaFiqkosX6v
         q0LXvetB3QqV2Y6KQZ7Mve2SzrZag+dsoOsizzmg0ws6DBq9PdsbHnBxGPwMxsfNU698
         3JxJDVuKEH7V6LPR339iQJPaywjovAgozBZZO6xrFJacxJdGOdoOFDW/piyVnB99pHA3
         qxKgH4zzLPnxRLl51jobCe4S33WL2JYG5fxopD4EbS3yhouIqP/lhAGj8stz1/c0CLT7
         g9GA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:dkim-signature;
        bh=VbIEip8n9oE+z5PTq8aYajVjwOcR/rBLjOQFjrUxMo0=;
        b=qJqZAWzI8SNob+38MYk2HAV7YaTpSaWsYqni/mO/3kEZ8dXAvA6Mb5mdaR9G/P/WK3
         16WnCQJQeqHETnW86TkKUUyxuhmG3n3hm2HCXi/FBke44l7LkIzTHJ3BevexbJadjt03
         B2a+1bTpypre2/LuRaoDwD2+vqMNwOOR+BKtP0wuitqhwDOxdG2cJRyH2shWC77nvTPE
         /7RHf7ggfsYvKHR0qjux0DueRY/HG1tJNcjJTxxJZ5RQG9gVwWqhx2Kl+qJONeDZEwwJ
         oMy44h3WRflq0uzSNrnX1UoieBh9KqaO68S9jEa31iAf/hcd0kS22kwUCue+hOVgAegv
         A2Dg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@braap.org header.s=mesmtp header.b=rRwfaar3;
       dkim=fail header.i=@messagingengine.com header.s=fm1 header.b=TZz+DYp7;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u5-v6si2545386qvi.102.2018.10.25.08.07.26
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 25 Oct 2018 08:07:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@braap.org header.s=mesmtp header.b=rRwfaar3;
       dkim=fail header.i=@messagingengine.com header.s=fm1 header.b=TZz+DYp7;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:55064 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gFhEL-0004a2-Fj
	for alex.bennee@linaro.org; Thu, 25 Oct 2018 11:07:25 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59489)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cota@braap.org>) id 1gFh5I-0002yq-St
	for qemu-devel@nongnu.org; Thu, 25 Oct 2018 10:58:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <cota@braap.org>) id 1gFgvP-0008R6-UD
	for qemu-devel@nongnu.org; Thu, 25 Oct 2018 10:47:52 -0400
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:52989)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <cota@braap.org>)
	id 1gFgvN-00082R-Mh; Thu, 25 Oct 2018 10:47:49 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id 8870F21F2B;
	Thu, 25 Oct 2018 10:46:54 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
	by compute4.internal (MEProxy); Thu, 25 Oct 2018 10:46:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=braap.org; h=
	from:to:cc:subject:date:message-id:in-reply-to:references; s=
	mesmtp; bh=VbIEip8n9oE+z5PTq8aYajVjwOcR/rBLjOQFjrUxMo0=; b=rRwfa
	ar3pbSTuskoLIePGUnZiDcLexPDdbbRwUvbmhvQR6h7kqmhiYxlyX9XsWa4UyiQT
	g186bBJdLvYigoFPt9sfDW7J6M2+kVIzrevZdpDEYPCxiezEzyfpMxVJ0K9htqQZ
	q3jvbAZNjKl9R4kNp1SIMy+GiCKWtqg2YdWoUU=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:date:from:in-reply-to:message-id
	:references:subject:to:x-me-proxy:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm1; bh=VbIEip8n9oE+z5PTq8aYajVjwOcR/
	rBLjOQFjrUxMo0=; b=TZz+DYp76UgpX7BOlaZdW8BlgJjQcnpRv6Jg1mHFb4+DS
	ULDWpMOasX3HhAjlaBduehv/LcZuy54nzAKGxrAJjDVWeY11l5IOSH5qWGyOnEMv
	5ArX4RGye/NBiV6QkerB26w/DjOtP7rxKObrvNfx2xESYAkxbovEyVStfHdgxDei
	DtPJ45STBiog8mCVVmiPTMd1Pja6SZs28eHpCT3V7lhpeNfbwz3/DmtDidzONwVN
	XUeKgB9J8ptjlIDGI0VlZWQcpixp3S2nTcwv73c+vLotvGgU9sq4bz25frMNCfQA
	BzYC9CgR+pW+RnTjaz9ltr8D8u1iVd2hS5ziEtxOg==
X-ME-Sender: <xms:XtfRW0MNJMpQCZv6bZl2feBWFF1SwGs-skUKwRvBUHVGPZv_VnpWtw>
X-ME-Proxy: <xmx:XtfRW7lVonvJF5CvIMiN4Egn7ynFzN1paM9O5lwKZL-VQM8NiKaBgw>
	<xmx:XtfRW5Vdapyc5ee236qj4d56tHhmZl2C5FTwP7O_45dKZFrzMFS8bg>
	<xmx:XtfRW-lT3-roECiM-4h2d_2Zx0D0_9tDmgUHLNy3KDwnAdMseIBy1Q>
	<xmx:XtfRW2TXsioyGrTVq4ffswHWJrLHaPCNtrK9K9v0ua-ydaGH0FNUfQ>
	<xmx:XtfRWyHRl_icTsHBPWHZF8xdFJEQePCI3Ej5Ibrfw0R7TRHBsu3-8w>
	<xmx:XtfRWx49pgICgOSB7FHhRJ6BENfA3de5D-eAOk9M7G7YMYQmOAKP2A>
Received: from localhost (flamenco.cs.columbia.edu [128.59.20.216])
	by mail.messagingengine.com (Postfix) with ESMTPA id 0DF50E4A44;
	Thu, 25 Oct 2018 10:46:54 -0400 (EDT)
From: "Emilio G. Cota" <cota@braap.org>
To: qemu-devel@nongnu.org
Date: Thu, 25 Oct 2018 10:46:09 -0400
Message-Id: <20181025144644.15464-36-cota@braap.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20181025144644.15464-1-cota@braap.org>
References: <20181025144644.15464-1-cota@braap.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 66.111.4.27
Subject: [Qemu-devel] [RFC v4 36/71] arm: convert to cpu_interrupt_request
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
	Richard Henderson <richard.henderson@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: IDbiVDKkTATO

Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Emilio G. Cota <cota@braap.org>
---
 target/arm/cpu.c    |  2 +-
 target/arm/helper.c | 12 +++++-------
 2 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 9c5cda8eb7..7330c2dae1 100644
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
diff --git a/target/arm/helper.c b/target/arm/helper.c
index c83f7c1109..454954a56c 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -1294,11 +1294,12 @@ static uint64_t isr_read(CPUARMState *env, const ARMCPRegInfo *ri)
 {
     CPUState *cs = ENV_GET_CPU(env);
     uint64_t ret = 0;
+    uint32_t interrupt_request = cpu_interrupt_request(cs);
 
-    if (cs->interrupt_request & CPU_INTERRUPT_HARD) {
+    if (interrupt_request & CPU_INTERRUPT_HARD) {
         ret |= CPSR_I;
     }
-    if (cs->interrupt_request & CPU_INTERRUPT_FIQ) {
+    if (interrupt_request & CPU_INTERRUPT_FIQ) {
         ret |= CPSR_F;
     }
     /* External aborts are not possible in QEMU so A bit is always clear */
@@ -8579,10 +8580,7 @@ void arm_cpu_do_interrupt(CPUState *cs)
         return;
     }
 
-    /* Hooks may change global state so BQL should be held, also the
-     * BQL needs to be held for any modification of
-     * cs->interrupt_request.
-     */
+    /* Hooks may change global state so BQL should be held */
     g_assert(qemu_mutex_iothread_locked());
 
     arm_call_pre_el_change_hook(cpu);
@@ -8597,7 +8595,7 @@ void arm_cpu_do_interrupt(CPUState *cs)
     arm_call_el_change_hook(cpu);
 
     if (!kvm_enabled()) {
-        cs->interrupt_request |= CPU_INTERRUPT_EXITTB;
+        cpu_interrupt_request_or(cs, CPU_INTERRUPT_EXITTB);
     }
 }
 
-- 
2.17.1

