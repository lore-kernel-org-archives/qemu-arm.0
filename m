Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp5102428wrt;
        Tue, 29 Jan 2019 17:39:12 -0800 (PST)
X-Google-Smtp-Source: ALg8bN4eFz3L+ELMmoZO+coE2R+IkW7q0CS6Qrj+9L2q4cdAwEdlotyCePv0S9/BfFV0JOyqZOQl
X-Received: by 2002:a25:bd3:: with SMTP id 202mr26782540ybl.474.1548812352422;
        Tue, 29 Jan 2019 17:39:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1548812352; cv=none;
        d=google.com; s=arc-20160816;
        b=EwfueKQltofEM+dEVk7wG//04m0ytk1CwXcC5a3Fd2uhiwPcUed5y0nh9b22kwUlKU
         mda5lzs/BaJ1DBqmys692hMqKxdWlg+JlMSh8+81+C1kPk3dfdF5nV+02RE4L3Y8oX/o
         fNuKmwtaqoCshUkqL4ebO84GBuSHXpE0+3sjf8odugeO+ymANL4BXCmhsax+y+EQyNBk
         4etOMMN53Oc86BoTeJyKqbrpTZ/P3+gfas00ROI6osFGUp2Q3CegPROz7wTwKBu9ohlx
         nsX9f6AEti8bpW8YKW1UoxP6aPeeELS8tKslUx44bhvDdE4uCPjBVhsduDK8pmbQkLYb
         nlnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:dkim-signature;
        bh=yk831HbKd5vwJg9BfpZlW22rFvgBxVFAiKaaqEReLsY=;
        b=DDUKrPMfv+yf5gXceFlcESVy9Zqx/zLusPbty8CKl2lE1OncbtPdAGpaEQxRAUhHJd
         1wANtiOfS4Iwil4P0pCD/XGSI0aBD2SYpXRRznZSSsnfJLoDXn6e8qQYcMTR47f6eY/l
         OXkJLEd3kK6qJksDzruy/vY5b53o8Zk75taeG4nRB1RJCqLDCvUEVBGwr0YEk8SktlVm
         sSK6+TT3vD2BmDbP/0YKLvHbkG3+ho8bxBlHqUx0w8HETtdgymzy6Tgq4D1zYJc8iwFJ
         xYzqi4q18GMXUT2amO2Wk3foEaCx4incNH4FA5n71plKkKc7UR4S1KNGzZRHYbjPrjcy
         WkoA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@braap.org header.s=mesmtp header.b=XfKEgk4M;
       dkim=fail header.i=@messagingengine.com header.s=fm1 header.b=sZ0fHJz2;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k189si62114ywg.81.2019.01.29.17.39.12
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 29 Jan 2019 17:39:12 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@braap.org header.s=mesmtp header.b=XfKEgk4M;
       dkim=fail header.i=@messagingengine.com header.s=fm1 header.b=sZ0fHJz2;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:58516 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1goeqN-0000F3-N5
	for alex.bennee@linaro.org; Tue, 29 Jan 2019 20:39:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36253)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cota@braap.org>) id 1goe4F-0000Y0-FU
	for qemu-devel@nongnu.org; Tue, 29 Jan 2019 19:49:28 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <cota@braap.org>) id 1goe4E-0001ju-5B
	for qemu-devel@nongnu.org; Tue, 29 Jan 2019 19:49:27 -0500
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:57535)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <cota@braap.org>)
	id 1goe4B-000107-3W; Tue, 29 Jan 2019 19:49:23 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id E121622155;
	Tue, 29 Jan 2019 19:48:22 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
	by compute4.internal (MEProxy); Tue, 29 Jan 2019 19:48:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=braap.org; h=
	from:to:cc:subject:date:message-id:in-reply-to:references; s=
	mesmtp; bh=yk831HbKd5vwJg9BfpZlW22rFvgBxVFAiKaaqEReLsY=; b=XfKEg
	k4M1NCcrAgg9EFDFr4ngBnP++2iuxeZd+g/ONMWpGDV/Xus7lkTCcvfhH2Q203ih
	1yzHgfur4+xy6jw8zcJmImxLOydsmCqIo+JTDbTTsOSwolUqnPV7Jq0iy235VVec
	2wskrITmtlTDbkAMXtkSRyryUnmi+8//nIuUrA=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:date:from:in-reply-to:message-id
	:references:subject:to:x-me-proxy:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm1; bh=yk831HbKd5vwJg9BfpZlW22rFvgBx
	VFAiKaaqEReLsY=; b=sZ0fHJz2cI8aOkaZcwN1gJ/eWe8zfkdY8D3E6EIvaqjAp
	HOtzlVp/WghQO3eSNhcS7jIRgmtiAiC5z62pPDsnZ12pW08oOExwFQVJ9tTm7M5p
	i6v10rBvXqFNx6Kt52xVlJOBTY8o7oF/bABnXOoT+S/mi8YhgcTVfOiwyHdGSUh+
	EAQ+GtUthAgnjzhPz4YdL4E6AqhT7us1WUbReWXou01OL+vm6F1rP2KislFSbQA7
	agn4Gf+DZn4Eoig10dldANUO4jpaByZElZPgoIt0dShdpsE2z3uytPohNXPtINqS
	XKuusv4rzY7oFfxAxj7UgapdT3mLwuLxbLjir65hg==
X-ME-Sender: <xms:VvRQXL-ceUd0qBuXc5zVWUUdbVturTBdsrRWQVc6efcjm4JMOAt5zA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedtledrjeefgddvkecutefuodetggdotefrodftvf
	curfhrohhfihhlvgemucfhrghsthforghilhdpqfhuthenuceurghilhhouhhtmecufedt
	tdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvufffkffojg
	hfsedttdertdertddtnecuhfhrohhmpedfgfhmihhlihhoucfirdcuvehothgrfdcuoegt
	ohhtrgessghrrggrphdrohhrgheqnecukfhppeduvdekrdehledrvddtrddvudeinecurf
	grrhgrmhepmhgrihhlfhhrohhmpegtohhtrgessghrrggrphdrohhrghenucevlhhushht
	vghrufhiiigvpeek
X-ME-Proxy: <xmx:VvRQXNrgAeZVwh8lNyl5CfkFA01fQtZI-6LQj6IFGkg01y86AZ03sQ>
	<xmx:VvRQXCukDfvrrGQtiFwEnZW3QGZ0lMUTBb-8awUNVHt39JGOn7uzGQ>
	<xmx:VvRQXISsDbv6521tPJzVNbqFx50yD5C_5sjgW8tLxs_az3IHcHpOXw>
	<xmx:VvRQXCHJ1BEFpE1Kn3v0A2O8h7jw5O-YdCk_-jzZm_9HzNeZ6GG1zA>
Received: from localhost (flamenco.cs.columbia.edu [128.59.20.216])
	by mail.messagingengine.com (Postfix) with ESMTPA id 4B666E4559;
	Tue, 29 Jan 2019 19:48:22 -0500 (EST)
From: "Emilio G. Cota" <cota@braap.org>
To: qemu-devel@nongnu.org
Date: Tue, 29 Jan 2019 19:47:36 -0500
Message-Id: <20190130004811.27372-39-cota@braap.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190130004811.27372-1-cota@braap.org>
References: <20190130004811.27372-1-cota@braap.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 66.111.4.25
Subject: [Qemu-devel] [PATCH v6 38/73] arm: convert to cpu_interrupt_request
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
X-TUID: dxEBP3dRvhqJ

Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Emilio G. Cota <cota@braap.org>
---
 target/arm/cpu.c     |  6 +++---
 target/arm/helper.c  | 16 +++++++---------
 target/arm/machine.c |  2 +-
 3 files changed, 11 insertions(+), 13 deletions(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 8cf2f5466b..ef652ebdc2 100644
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
@@ -451,7 +451,7 @@ void arm_cpu_update_virq(ARMCPU *cpu)
     bool new_state = (env->cp15.hcr_el2 & HCR_VI) ||
         (env->irq_line_state & CPU_INTERRUPT_VIRQ);
 
-    if (new_state != ((cs->interrupt_request & CPU_INTERRUPT_VIRQ) != 0)) {
+    if (new_state != ((cpu_interrupt_request(cs) & CPU_INTERRUPT_VIRQ) != 0)) {
         if (new_state) {
             cpu_interrupt(cs, CPU_INTERRUPT_VIRQ);
         } else {
@@ -472,7 +472,7 @@ void arm_cpu_update_vfiq(ARMCPU *cpu)
     bool new_state = (env->cp15.hcr_el2 & HCR_VF) ||
         (env->irq_line_state & CPU_INTERRUPT_VFIQ);
 
-    if (new_state != ((cs->interrupt_request & CPU_INTERRUPT_VFIQ) != 0)) {
+    if (new_state != ((cpu_interrupt_request(cs) & CPU_INTERRUPT_VFIQ) != 0)) {
         if (new_state) {
             cpu_interrupt(cs, CPU_INTERRUPT_VFIQ);
         } else {
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 66faebea8e..cb42d19fe8 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -1782,23 +1782,24 @@ static uint64_t isr_read(CPUARMState *env, const ARMCPRegInfo *ri)
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
@@ -9435,10 +9436,7 @@ void arm_cpu_do_interrupt(CPUState *cs)
         return;
     }
 
-    /* Hooks may change global state so BQL should be held, also the
-     * BQL needs to be held for any modification of
-     * cs->interrupt_request.
-     */
+    /* Hooks may change global state so BQL should be held */
     g_assert(qemu_mutex_iothread_locked());
 
     arm_call_pre_el_change_hook(cpu);
@@ -9453,7 +9451,7 @@ void arm_cpu_do_interrupt(CPUState *cs)
     arm_call_el_change_hook(cpu);
 
     if (!kvm_enabled()) {
-        cs->interrupt_request |= CPU_INTERRUPT_EXITTB;
+        cpu_interrupt_request_or(cs, CPU_INTERRUPT_EXITTB);
     }
 }
 
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

