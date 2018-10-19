Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp3121171wrt;
        Thu, 18 Oct 2018 18:33:24 -0700 (PDT)
X-Google-Smtp-Source: ACcGV62Ock70eBzcCDcUtUgu2s8BePmbe7KHkz+XWfhWtMVMLGbpacmlGS+5DdeRXtmeT67vxc3P
X-Received: by 2002:ac8:1770:: with SMTP id u45-v6mr31073065qtk.285.1539912804864;
        Thu, 18 Oct 2018 18:33:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1539912804; cv=none;
        d=google.com; s=arc-20160816;
        b=V4ZF/nOUWXzAbgKPJGZTzqZqTJZdK35wm8VEiFTuxARYgwPrhQAuEbhRVURlX4+iVN
         75k+JfiGqBRWckOERzgUQ6xqgyMtWOoQvnEdrdXhWpZe8J7j9RDfkgwpF1Kroscywoap
         jdEQsQMQPHf7iqcsihOziPFo9FpgKkI34M1XDk5SMQVb/IR5FH+BK8a7Jhy8qE4QinTO
         499n/AH3UUUXi4TE4MVniaFbTjxpgDmR8obNAtivF0TBqvjgjlSMmstbQ31wVn9A8A5S
         sJMHp+QZeqtNfpwDMOwkwS9Aa085d9XUIg4JJHOHbH5oJy00lGWNqOY8JkZT0o+eiK/4
         Sviw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:dkim-signature;
        bh=PTWHollnOpCy3S7RQrHt3R2+4fi5XVnfoaRDFl3+oYE=;
        b=gxnOXXDafXEvfXq7EC7BbPnYTFrnEBwKGvlDVmA0sr9KrRcknl83KXR2IRDNmIOZUz
         Mop98D97ewwf6OfzRNChVePMqTSq/guuhGrzFxX0Wgs4z2KfQ0vuA6qWEhZ14IXtmWRI
         mTS2j25nl0UWefeKP1A/WSzYwGJyHpyZuGNZVA8rr8CjMyf47CT94lEFbhOvLT3gAYwM
         lZ1ibUtV15hHPRjLx55Kp/VXD3ifgnS//HyfwidlUoPAMsVcEq4eka3zsiTZxHCqF+Ke
         XtSb1+FD4d8KOLPYPgBBDfoA6wMQ/Rrh7h5EOBrF0ZrgJ5Xacope6iuNWnqwVWArZlhW
         m4fg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@braap.org header.s=mesmtp header.b=T6IlZJq1;
       dkim=fail header.i=@messagingengine.com header.s=fm1 header.b=XMnMfsLL;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n6si8430923qvq.48.2018.10.18.18.33.24
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 18 Oct 2018 18:33:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@braap.org header.s=mesmtp header.b=T6IlZJq1;
       dkim=fail header.i=@messagingengine.com header.s=fm1 header.b=XMnMfsLL;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:46023 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gDJfI-0002g6-AK
	for alex.bennee@linaro.org; Thu, 18 Oct 2018 21:33:24 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59636)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cota@braap.org>) id 1gDJGJ-0005MW-1E
	for qemu-devel@nongnu.org; Thu, 18 Oct 2018 21:07:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <cota@braap.org>) id 1gDJG8-0003kn-A4
	for qemu-devel@nongnu.org; Thu, 18 Oct 2018 21:07:27 -0400
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:57149)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <cota@braap.org>)
	id 1gDJFs-00031T-9d; Thu, 18 Oct 2018 21:07:09 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id BAB2F2292C;
	Thu, 18 Oct 2018 21:06:32 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
	by compute4.internal (MEProxy); Thu, 18 Oct 2018 21:06:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=braap.org; h=
	from:to:cc:subject:date:message-id:in-reply-to:references; s=
	mesmtp; bh=PTWHollnOpCy3S7RQrHt3R2+4fi5XVnfoaRDFl3+oYE=; b=T6IlZ
	Jq17Ktrl2NLc5dgPcjbEfWYB7mqZnDyrZcQbMAlmZRxmD085tjTySxTTfyFDQ/lU
	VjWYQLKzz08w9Ejqbv5OBQucsRtU8shhpBXuD4ZIhWQXFsBR0KGFgVOJgaruPID0
	Vx/YSsnpqovdDXbcJCBTRUi5cAcqN9J452bPII=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:date:from:in-reply-to:message-id
	:references:subject:to:x-me-proxy:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm1; bh=PTWHollnOpCy3S7RQrHt3R2+4fi5X
	VnfoaRDFl3+oYE=; b=XMnMfsLLa/1WWIz0DX4gX2l02k0i48tymyePhPMMboBhX
	ECTgmXSAEBIQYNIwkVyr+s+4MAKDQAdCHXbEkjNaW0i760KStVSDdfIBoYpDgLnK
	mcsL34iKCy1WT8gxwFfZc0jI3Y+iCW7BinFozBEJA812veTo1zMMAYUI4Km3dBuN
	UHyqlnFCeYCWFiUARB+M39HxTu/yUWxUHXaXHHrSeKir+onz9bWo9vmN7XXhs7Es
	1EuQUTpekEd+S4jZ79qxNrbb2Pjq9O/+9fNj6Xl964WSFzPxNbUO2cRa96njYkDp
	2BRg3nIwP/xahM57hKx+AnSmMUuoVmnuX9IV9Lv+g==
X-ME-Sender: <xms:GC7JWzMHQEAy3LlAeu0wx2bu0-gtAoH5SP3JBbWEEY0y50psc_UGXw>
X-ME-Proxy: <xmx:GC7JW6dNiimDZBcc69uRY56W4zO4M3rK5i3HKle2_EERPQyLlMUo_g>
	<xmx:GC7JW6O5LjJHAC4vG2faNof2L316SrNAE5xKul32JhYo4wO8W7HHzg>
	<xmx:GC7JW5JyOglp5T75EJKZdJwurYGP6EoialXp9m8wEEjqFWgbXG9-Xg>
	<xmx:GC7JWzE9RNMQsk8H4Qb4JeP8LDMBKcYrneDc4L5KGJHuRHoCLCxnYg>
	<xmx:GC7JW5SR-hPnNfoUM4RJVfq46ak9dxtSTgrjVJ8ceT0zN9ODg4W8Aw>
	<xmx:GC7JWxi8-TEbJH2k4KfVwzHAhKGVLmTSRshKRzW_H7cVW7qyIwpEVw>
Received: from localhost (flamenco.cs.columbia.edu [128.59.20.216])
	by mail.messagingengine.com (Postfix) with ESMTPA id 326C9102E2;
	Thu, 18 Oct 2018 21:06:32 -0400 (EDT)
From: "Emilio G. Cota" <cota@braap.org>
To: qemu-devel@nongnu.org
Date: Thu, 18 Oct 2018 21:05:58 -0400
Message-Id: <20181019010625.25294-30-cota@braap.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20181019010625.25294-1-cota@braap.org>
References: <20181019010625.25294-1-cota@braap.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 66.111.4.29
Subject: [Qemu-devel] [RFC v3 29/56] arm: convert to cpu_interrupt_request
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
	Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 4h4XXV3kkP3/

Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org
Signed-off-by: Emilio G. Cota <cota@braap.org>
---
 target/arm/cpu.c    |  2 +-
 target/arm/helper.c | 13 ++++++-------
 2 files changed, 7 insertions(+), 8 deletions(-)

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
index c83f7c1109..85e0b9645e 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -1295,12 +1295,14 @@ static uint64_t isr_read(CPUARMState *env, const ARMCPRegInfo *ri)
     CPUState *cs = ENV_GET_CPU(env);
     uint64_t ret = 0;
 
-    if (cs->interrupt_request & CPU_INTERRUPT_HARD) {
+    cpu_mutex_lock(cs);
+    if (cpu_interrupt_request(cs) & CPU_INTERRUPT_HARD) {
         ret |= CPSR_I;
     }
-    if (cs->interrupt_request & CPU_INTERRUPT_FIQ) {
+    if (cpu_interrupt_request(cs) & CPU_INTERRUPT_FIQ) {
         ret |= CPSR_F;
     }
+    cpu_mutex_unlock(cs);
     /* External aborts are not possible in QEMU so A bit is always clear */
     return ret;
 }
@@ -8579,10 +8581,7 @@ void arm_cpu_do_interrupt(CPUState *cs)
         return;
     }
 
-    /* Hooks may change global state so BQL should be held, also the
-     * BQL needs to be held for any modification of
-     * cs->interrupt_request.
-     */
+    /* Hooks may change global state so BQL should be held */
     g_assert(qemu_mutex_iothread_locked());
 
     arm_call_pre_el_change_hook(cpu);
@@ -8597,7 +8596,7 @@ void arm_cpu_do_interrupt(CPUState *cs)
     arm_call_el_change_hook(cpu);
 
     if (!kvm_enabled()) {
-        cs->interrupt_request |= CPU_INTERRUPT_EXITTB;
+        cpu_interrupt_request_or(cs, CPU_INTERRUPT_EXITTB);
     }
 }
 
-- 
2.17.1

