Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp4139804wrd;
        Mon, 17 Sep 2018 09:34:46 -0700 (PDT)
X-Google-Smtp-Source: ANB0VdY/xoihSCSQRvNzcvGg8LK735uZi/rH6uITCGXmjg7jr0g0rwAlwxRgnjmiEHtzEOOuzBH2
X-Received: by 2002:a0c:b031:: with SMTP id k46-v6mr17802426qvc.42.1537202086434;
        Mon, 17 Sep 2018 09:34:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1537202086; cv=none;
        d=google.com; s=arc-20160816;
        b=gnOGjedHQW4RyFgpR2lLalYFNFq8zLb9q472EAsbhSVHELq1gNUwHj8D+jLnYM9djp
         u3vzSnIBZvlHSFgTP5tZ0c1x/UYdzo48m2JsVlgXtg6LimrI4BClYu6bH71lSEV7xpUE
         uumHGHIgDELZC/xAsUeBNYEbS3seyyI+qudNbpdUBux8GkwUpiHmuf0CvSg4jOPCWxTE
         yrPlEXX7teX2N17+z+r1Ok7TdFH3q5gAsBkOKcN5qiOsR2Uz+8VlwHg2kxoqMIykZW89
         y/KtDEKV9eHO7yJCR8byZIYfgFKH5nTZiOGTaC4b/vgEYBE830tlYkebo3loXt+TiV3+
         H61w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:dkim-signature;
        bh=BvVnBhDDR1H4DQKVvA7EIqJq573VYzYS0LWQrB3mODc=;
        b=LQFLpgfVlUQKmOi51E2UeWMQ55nXbsukE/duhB7efuPuEmmXAPurjANUu+E3SAmISc
         Mp0WAWzb5uFNswMSp/kWshzm5vYqJnaDEr/LVh5dF/4efux+yClCO6ux0N0hvM/dSfDD
         MsG51/oluM602cRskOKrL3WsxOIQxfpyg26pPM2Ev8hzpeV3LpmOaWvGnkmtOS7LzQoB
         9q4mcqNmuBQboFYTooNY6BZEeqk3LR5Wxi1OcceSj7kWuB0k0ljbkbPctBbW5E5tZZfj
         Z6wji/wvVwYVz7zv8/Igsd/AMHKt1Hfohx9vOR1jDhzZ6pwFwtlDsx7Sh2dFZ+ORUAch
         VXhg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@braap.org header.s=mesmtp header.b=EcUYugOe;
       dkim=fail header.i=@messagingengine.com header.s=fm3 header.b=py6Msk5K;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k8-v6si5808651qtp.52.2018.09.17.09.34.46
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 17 Sep 2018 09:34:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@braap.org header.s=mesmtp header.b=EcUYugOe;
       dkim=fail header.i=@messagingengine.com header.s=fm3 header.b=py6Msk5K;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:36445 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g1wU1-0000RK-Un
	for alex.bennee@linaro.org; Mon, 17 Sep 2018 12:34:46 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40787)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cota@braap.org>) id 1g1wQd-0006F2-Me
	for qemu-arm@nongnu.org; Mon, 17 Sep 2018 12:31:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <cota@braap.org>) id 1g1wQa-0001qb-Mp
	for qemu-arm@nongnu.org; Mon, 17 Sep 2018 12:31:15 -0400
Received: from wout2-smtp.messagingengine.com ([64.147.123.25]:38503)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <cota@braap.org>)
	id 1g1wQa-0001oA-C9; Mon, 17 Sep 2018 12:31:12 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.west.internal (Postfix) with ESMTP id DFA04515;
	Mon, 17 Sep 2018 12:31:06 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
	by compute4.internal (MEProxy); Mon, 17 Sep 2018 12:31:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=braap.org; h=cc
	:date:from:in-reply-to:message-id:references:subject:to
	:x-me-sender:x-me-sender:x-sasl-enc; s=mesmtp; bh=BvVnBhDDR1H4DQ
	KVvA7EIqJq573VYzYS0LWQrB3mODc=; b=EcUYugOejbtorYL9I6EV3KVrzGvM6e
	ph0Te0J+HEgKmyc5r3Mr4yPa5EdbbKvGtJYnCpQjwhT7cpVBAPyqBmHbxNXzYqUZ
	Y3R0yrilRT+UrPBRTQmwYn4MPNMe68aIXKm5qqpOG4R7YYoOm1yZdOZ7tU6w9kQp
	8KcQcEelWNeHc=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:date:from:in-reply-to:message-id
	:references:subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; bh=BvVnBhDDR1H4DQKVvA7EIqJq573VYzYS0LWQrB3mODc=; b=py6Msk5K
	RFDfJ3MG1hpOibAYOnAQO68EU4s2FVGBJvf/kSlrWFKY9w+lFO1r26l8aFDdI4gB
	c/hayJP1/6jb0T23n6sYj1OAgo6n/siDlgnhggdpLLP6tgMTJyMdg4nrG/X90AvL
	08V5L4kVaZ2PPtJrnSJEef3p5YcMKK6YT/fXMxnuwgsiIWSWbDuZvzfjISSfcnTB
	IncOB8sAQecWYe61Jwm0+C85bibinkWvBnk6pCvLM3qj8AcGjQp8h+SqfJD89AhE
	0A6pTMG5uxllTcIl38slnkKYrtYG5OVwWNLeiPQGWwPAbYT6A+xhgSOXqnDa+7W9
	G4RhNvJg4sb1lA==
X-ME-Proxy: <xmx:ytafW68atH5SlMvvm_fl2QnGrNKRtwUPmvV-hwPmgb8RejxXFbAnOw>
	<xmx:ytafW3XimFqRsmaUYp4kRo1GeuY56P86cePNq8fmW7WUNViZ89Coyw>
	<xmx:ytafW2bvicySt1_QlsPOhm86vjeJ6MmxTEjKKowI8coHAWC22OPAQQ>
	<xmx:ytafW8UoZgdumRvzSfQo8YP0elxXdXO9RwrpTFHakaaG64ZS3ajBIQ>
	<xmx:ytafW1IlvnKgYQEFrx2AA8u9Uuf2vBdnPJi9APAJA2rzfjabYq9JwQ>
	<xmx:ytafW03dHrDsHlT1eRPihq_Fc04OOCK9AwAtMCl1hHXCDyV54tONbw>
X-ME-Sender: <xms:ytafW6Tgmx52qDXoYuCv4ZLjyxKdIaY3nKh1PWSEPxOOfwNTC0e2KA>
Received: from localhost (flamenco.cs.columbia.edu [128.59.20.216])
	by mail.messagingengine.com (Postfix) with ESMTPA id 3E074E49C5;
	Mon, 17 Sep 2018 12:31:06 -0400 (EDT)
From: "Emilio G. Cota" <cota@braap.org>
To: qemu-devel@nongnu.org
Date: Mon, 17 Sep 2018 12:30:36 -0400
Message-Id: <20180917163103.6113-9-cota@braap.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180917163103.6113-1-cota@braap.org>
References: <20180917163103.6113-1-cota@braap.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 64.147.123.25
Subject: [Qemu-arm] [PATCH 08/35] target/arm: access cpu->interrupt_request
 with atomics
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: nUknSN3YRlqK

From: Paolo Bonzini <pbonzini@redhat.com>

Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Emilio G. Cota <cota@braap.org>
---
 target/arm/cpu.c    |  2 +-
 target/arm/helper.c | 12 +++++-------
 2 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 258ba6dcaa..e2c492efdf 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -49,7 +49,7 @@ static bool arm_cpu_has_work(CPUState *cs)
     ARMCPU *cpu = ARM_CPU(cs);
 
     return (cpu->power_state != PSCI_OFF)
-        && cs->interrupt_request &
+        && atomic_read(&cs->interrupt_request) &
         (CPU_INTERRUPT_FIQ | CPU_INTERRUPT_HARD
          | CPU_INTERRUPT_VFIQ | CPU_INTERRUPT_VIRQ
          | CPU_INTERRUPT_EXITTB);
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 088f452716..22dbc42305 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -1293,12 +1293,13 @@ static void csselr_write(CPUARMState *env, const ARMCPRegInfo *ri,
 static uint64_t isr_read(CPUARMState *env, const ARMCPRegInfo *ri)
 {
     CPUState *cs = ENV_GET_CPU(env);
+    int interrupt_request = atomic_read(&cs->interrupt_request);
     uint64_t ret = 0;
 
-    if (cs->interrupt_request & CPU_INTERRUPT_HARD) {
+    if (interrupt_request & CPU_INTERRUPT_HARD) {
         ret |= CPSR_I;
     }
-    if (cs->interrupt_request & CPU_INTERRUPT_FIQ) {
+    if (interrupt_request & CPU_INTERRUPT_FIQ) {
         ret |= CPSR_F;
     }
     /* External aborts are not possible in QEMU so A bit is always clear */
@@ -8514,10 +8515,7 @@ void arm_cpu_do_interrupt(CPUState *cs)
         return;
     }
 
-    /* Hooks may change global state so BQL should be held, also the
-     * BQL needs to be held for any modification of
-     * cs->interrupt_request.
-     */
+    /* Hooks may change global state so BQL should be held */
     g_assert(qemu_mutex_iothread_locked());
 
     arm_call_pre_el_change_hook(cpu);
@@ -8532,7 +8530,7 @@ void arm_cpu_do_interrupt(CPUState *cs)
     arm_call_el_change_hook(cpu);
 
     if (!kvm_enabled()) {
-        cs->interrupt_request |= CPU_INTERRUPT_EXITTB;
+        atomic_or(&cs->interrupt_request, CPU_INTERRUPT_EXITTB);
     }
 }
 
-- 
2.17.1

