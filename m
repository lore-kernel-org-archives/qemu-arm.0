Received: by 10.28.91.67 with SMTP id p64csp1279620wmb;
        Fri, 16 Mar 2018 13:39:45 -0700 (PDT)
X-Google-Smtp-Source: AG47ELseWkqyLhjP7hhpjf3nv0ptnGeHj0NAB6cMmYOG/LH/tWZE5YU7dWFFeergyS5WhVAjM3bK
X-Received: by 10.55.196.1 with SMTP id d1mr4508706qki.247.1521232785660;
        Fri, 16 Mar 2018 13:39:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1521232785; cv=none;
        d=google.com; s=arc-20160816;
        b=FCGDzhkJjFn+f+FUWsTipmGp+59iFDwyw3IKWCjW6dLISf7SMkaHrEo3Tqnw+Qpf7y
         fOFly+uSqzRrJHE0nu0VRy0ohstNt0yNmJHz8V/o0OdFrcwxY8d3muPj9pKoCngG1sWV
         yA2Yv4pBbMX5ZxP0T8CSObf4icAJnik3W0QwVRjVQu7GkmCHYstEmAQut2ai1hQaR9mV
         tNdYHR/91qVWo2bW2+iaj3m1bhJXy6y4+AaT7s1oNgZ9gN+/AMVAJDwxdjk/0lqgj56X
         d/ad6mRa9Dl9hU+1VftU4Vfiv7FTyP1Y0Z/2eB4JdvCdPSKXhgDmozzwGW11vWOFiu9Y
         8qSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dmarc-filter:dkim-signature:dkim-signature
         :arc-authentication-results;
        bh=bNeYnS2wlIV0rKGAv2u5Thmwj8OLixozUDEErsY1QVw=;
        b=L15zFwet3rxAYp9uDXJ6vMFVUbMawyfcsEuaW6CkBhDeXKX/w8RxJxpGtz2S0wp1xj
         i1I35dM53TY6/7fJYHZ37aaXK33Y85SEFD6EMaD5/vJZiDSZM/2/X13kTmjgMyxkKYtG
         UGyKIpboF5Qj7g1dpIbM3nI5fY4wXEQTQf/9CMTXqusMB2Er5HMpavzPiAefDuolkNtk
         kNfAYdhPJfynNWpUK3+mtBlobLAdxD7bYzlB6mwOvFhw62p4vw9BX4x1oopBp32bBo5F
         7UW7tzcBZaAbdWCdyM2OmRX1/RG+MGbbd784C73k4u5ot1IJMy+8dkicehToka4joHY+
         6igg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=P5A8F1Ng;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=oonkuxFk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z40si4997760qta.452.2018.03.16.13.39.45
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 16 Mar 2018 13:39:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=P5A8F1Ng;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=oonkuxFk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:59474 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eww8f-0003gP-4q
	for alex.bennee@linaro.org; Fri, 16 Mar 2018 16:39:45 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44029)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alindsay@codeaurora.org>) id 1eww1N-0005oR-UI
	for qemu-arm@nongnu.org; Fri, 16 Mar 2018 16:32:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alindsay@codeaurora.org>) id 1eww1M-0003H1-JO
	for qemu-arm@nongnu.org; Fri, 16 Mar 2018 16:32:13 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:55930)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <alindsay@codeaurora.org>)
	id 1eww1M-0003Fs-9W; Fri, 16 Mar 2018 16:32:12 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
	id 0D1BC60D81; Fri, 16 Mar 2018 20:32:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
	s=default; t=1521232331;
	bh=3l8vY/oVAgpFoTIYeZx9r5HsOKCzalxyT4ouiCTQrDg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=P5A8F1Ng+psp1ZUQNkkDAGGtgQMDDXvyMB6btZUVEvhfEB+NkhNt/37hGEF2mavfI
	R5ZmcPIKVloJISsHOfMrk1av+6pU+sUQciUkpMeym4alHtxp2tNsByB9K9EZWLg4q9
	QiPVTbCGOOJ3pJsJWXgqsAuxl1TfdanFbueJrwtM=
Received: from mossypile.qualcomm.com (global_nat1_iad_fw.qualcomm.com
	[129.46.232.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: alindsay@smtp.codeaurora.org)
	by smtp.codeaurora.org (Postfix) with ESMTPSA id 25E2660FA8;
	Fri, 16 Mar 2018 20:32:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
	s=default; t=1521232328;
	bh=3l8vY/oVAgpFoTIYeZx9r5HsOKCzalxyT4ouiCTQrDg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=oonkuxFkGOylWKywpPflIeEk9njcW5WQUc9dXVSAAEBqmqDlkl5Hp9QWl/2Oe4r32
	sWNdmwfyn5htQdAcms8gFp0KbRz/mYjafHH42c9nd8Ri0cj/lrsazAi5cmgx0AKhBp
	6z8+ifKsXzxUleUErHSdjy6GoKnkr5Tfuum97YqU=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 25E2660FA8
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
	dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
	spf=none smtp.mailfrom=alindsay@codeaurora.org
From: Aaron Lindsay <alindsay@codeaurora.org>
To: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Alistair Francis <alistair.francis@xilinx.com>, Wei Huang <wei@redhat.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>
Date: Fri, 16 Mar 2018 16:31:07 -0400
Message-Id: <1521232280-13089-10-git-send-email-alindsay@codeaurora.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1521232280-13089-1-git-send-email-alindsay@codeaurora.org>
References: <1521232280-13089-1-git-send-email-alindsay@codeaurora.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 198.145.29.96
Subject: [Qemu-arm] [PATCH v3 09/22] target/arm: Add pre-EL change hooks
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
Cc: Aaron Lindsay <alindsay@codeaurora.org>,
	Michael Spradling <mspradli@codeaurora.org>,
	qemu-devel@nongnu.org, Digant Desai <digantd@codeaurora.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: e3OMBc6/akiP

Because the design of the PMU requires that the counter values be
converted between their delta and guest-visible forms for mode
filtering, an additional hook which occurs before the EL is changed is
necessary.

Signed-off-by: Aaron Lindsay <alindsay@codeaurora.org>
---
 target/arm/cpu.c       | 13 +++++++++++++
 target/arm/cpu.h       | 12 ++++++++----
 target/arm/helper.c    | 14 ++++++++------
 target/arm/internals.h |  7 +++++++
 target/arm/op_helper.c |  8 ++++++++
 5 files changed, 44 insertions(+), 10 deletions(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 5f782bf..a2cb21e 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -55,6 +55,18 @@ static bool arm_cpu_has_work(CPUState *cs)
          | CPU_INTERRUPT_EXITTB);
 }
 
+void arm_register_pre_el_change_hook(ARMCPU *cpu, ARMELChangeHookFn *hook,
+                                 void *opaque)
+{
+    ARMELChangeHook *entry;
+    entry = g_malloc0(sizeof (*entry));
+
+    entry->hook = hook;
+    entry->opaque = opaque;
+
+    QLIST_INSERT_HEAD(&cpu->pre_el_change_hooks, entry, node);
+}
+
 void arm_register_el_change_hook(ARMCPU *cpu, ARMELChangeHookFn *hook,
                                  void *opaque)
 {
@@ -747,6 +759,7 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
         return;
     }
 
+    QLIST_INIT(&cpu->pre_el_change_hooks);
     QLIST_INIT(&cpu->el_change_hooks);
 
     /* Some features automatically imply others: */
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 3b45d3d..b0ef727 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -832,6 +832,7 @@ struct ARMCPU {
      */
     bool cfgend;
 
+    QLIST_HEAD(, ARMELChangeHook) pre_el_change_hooks;
     QLIST_HEAD(, ARMELChangeHook) el_change_hooks;
 
     int32_t node_id; /* NUMA node this CPU belongs to */
@@ -2895,12 +2896,15 @@ static inline AddressSpace *arm_addressspace(CPUState *cs, MemTxAttrs attrs)
 #endif
 
 /**
+ * arm_register_pre_el_change_hook:
  * arm_register_el_change_hook:
- * Register a hook function which will be called back whenever this
- * CPU changes exception level or mode. The hook function will be
- * passed a pointer to the ARMCPU and the opaque data pointer passed
- * to this function when the hook was registered.
+ * Register a hook function which will be called back before or after this CPU
+ * changes exception level or mode. The hook function will be passed a pointer
+ * to the ARMCPU and the opaque data pointer passed to this function when the
+ * hook was registered.
  */
+void arm_register_pre_el_change_hook(ARMCPU *cpu, ARMELChangeHookFn *hook,
+                                 void *opaque);
 void arm_register_el_change_hook(ARMCPU *cpu, ARMELChangeHookFn *hook,
                                  void *opaque);
 
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 5d5c738..50eaed7 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -8253,6 +8253,14 @@ void arm_cpu_do_interrupt(CPUState *cs)
         return;
     }
 
+    /* Hooks may change global state so BQL should be held, also the
+     * BQL needs to be held for any modification of
+     * cs->interrupt_request.
+     */
+    g_assert(qemu_mutex_iothread_locked());
+
+    arm_call_pre_el_change_hook(cpu);
+
     assert(!excp_is_internal(cs->exception_index));
     if (arm_el_is_aa64(env, new_el)) {
         arm_cpu_do_interrupt_aarch64(cs);
@@ -8260,12 +8268,6 @@ void arm_cpu_do_interrupt(CPUState *cs)
         arm_cpu_do_interrupt_aarch32(cs);
     }
 
-    /* Hooks may change global state so BQL should be held, also the
-     * BQL needs to be held for any modification of
-     * cs->interrupt_request.
-     */
-    g_assert(qemu_mutex_iothread_locked());
-
     arm_call_el_change_hook(cpu);
 
     if (!kvm_enabled()) {
diff --git a/target/arm/internals.h b/target/arm/internals.h
index 7df3eda..6ea6766 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -728,6 +728,13 @@ void arm_cpu_do_transaction_failed(CPUState *cs, hwaddr physaddr,
                                    MemTxResult response, uintptr_t retaddr);
 
 /* Call any registered EL change hooks */
+static inline void arm_call_pre_el_change_hook(ARMCPU *cpu)
+{
+    ARMELChangeHook *hook, *next;
+    QLIST_FOREACH_SAFE(hook, &cpu->pre_el_change_hooks, node, next) {
+        hook->hook(cpu, hook->opaque);
+    }
+}
 static inline void arm_call_el_change_hook(ARMCPU *cpu)
 {
     ARMELChangeHook *hook, *next;
diff --git a/target/arm/op_helper.c b/target/arm/op_helper.c
index 7a88fd2..be417ce 100644
--- a/target/arm/op_helper.c
+++ b/target/arm/op_helper.c
@@ -496,6 +496,10 @@ void HELPER(cpsr_write)(CPUARMState *env, uint32_t val, uint32_t mask)
 /* Write the CPSR for a 32-bit exception return */
 void HELPER(cpsr_write_eret)(CPUARMState *env, uint32_t val)
 {
+    qemu_mutex_lock_iothread();
+    arm_call_pre_el_change_hook(arm_env_get_cpu(env));
+    qemu_mutex_unlock_iothread();
+
     cpsr_write(env, val, CPSR_ERET_MASK, CPSRWriteExceptionReturn);
 
     /* Generated code has already stored the new PC value, but
@@ -1013,6 +1017,10 @@ void HELPER(exception_return)(CPUARMState *env)
         goto illegal_return;
     }
 
+    qemu_mutex_lock_iothread();
+    arm_call_pre_el_change_hook(arm_env_get_cpu(env));
+    qemu_mutex_unlock_iothread();
+
     if (!return_to_aa64) {
         env->aarch64 = 0;
         /* We do a raw CPSR write because aarch64_sync_64_to_32()
-- 
Qualcomm Datacenter Technologies as an affiliate of Qualcomm Technologies, Inc.
Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.

