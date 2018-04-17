Received: by 10.28.4.212 with SMTP id 203csp4251225wme;
        Tue, 17 Apr 2018 13:40:24 -0700 (PDT)
X-Google-Smtp-Source: AIpwx4+NJy+d/IQq7JVC6iVM4tDCTqN47P6NwVm1HdGSRUAcpD9dtH9t0yC9E//pis26jiI9bBYB
X-Received: by 10.55.79.129 with SMTP id d123mr3675473qkb.50.1523997624534;
        Tue, 17 Apr 2018 13:40:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1523997624; cv=none;
        d=google.com; s=arc-20160816;
        b=J1vQS9kzoSZRWhHpzjP25meKrlKqKY9vqYs3LzSXK9ndmEqQp7zSYZlQhiIqoWbV0O
         QPMT/44FsY91q1H7DLDD/pvYIl2RUwrnicH9Wl4Aw8QMHb9vKB2+iE8hqxCQzYDgcC+3
         Op3FGSD2mOgKavlD7wh4F5Y8MTNI7HSyLeH2fQ9WcTPMMTv93e9QUJ79b6TvhPRE+LCJ
         GCaYI1IigxPj9spK/KlS5Ulr4rZlsiiz0w6BR4SQ+Aie+ZbEotFpkFOD4HD/wsY1yGb5
         YsxTMAgM3kjJui590tR59cOAZVwR4QP1oYeinu1xcLEzjAlcbA6CpzrZbafw7IETyWoU
         ewuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dmarc-filter:dkim-signature:dkim-signature
         :arc-authentication-results;
        bh=PA5IVGsEFp0kRpVvlf0LhvJ7TWx4bLrR+fEQD91zddA=;
        b=cJ7qdAx8GI2OtNDzvBEYiB8+cUCmLX948CWhDoOTTLF1xs+SutKJqP4nLAJ6CVGOuu
         A11HzD2nHjSt4VaKjDyR+XVqjvafICA+T0XRozmnGSZsVvR2pxzfJnQE2pZoe65tqfC7
         2F7VuTHV19xMsNqJwerj3kqZ7NjRnSPQFepkV+s0VeNFu+FBZUs8jC6nqY/Mw4zJlwSl
         U9C/8gQfZvDx3DOjJWV08u43C0eX/1ba882m3mSoRyFtaJ0QLf+sQIX12m9iWsjCNicV
         S5NG4eBGtwxZUyPy+iCgEVLcnVLS5aLHjyW89MNcCced+s9/6Mckl0YOXDZ0BmmF2UlJ
         dFSw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=GiMA3W9a;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=lN7OiUnY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z5si8938754qke.238.2018.04.17.13.40.24
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 17 Apr 2018 13:40:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=GiMA3W9a;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=lN7OiUnY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:33300 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1f8XOp-0003xc-Vj
	for alex.bennee@linaro.org; Tue, 17 Apr 2018 16:40:24 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50522)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alindsay@codeaurora.org>) id 1f8XNT-0002ro-Lu
	for qemu-arm@nongnu.org; Tue, 17 Apr 2018 16:39:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alindsay@codeaurora.org>) id 1f8XNQ-00054I-H6
	for qemu-arm@nongnu.org; Tue, 17 Apr 2018 16:38:59 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:39592)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <alindsay@codeaurora.org>)
	id 1f8XNP-0004u6-V3; Tue, 17 Apr 2018 16:38:56 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
	id 750F760FF7; Tue, 17 Apr 2018 20:38:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
	s=default; t=1523997534;
	bh=1wk2rJNc8/YgipEMiiuL+Ylg3Wck1lH/NhAHrIThAlc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GiMA3W9aT91M4XrrJQUx4pspGCPE++oiMUizyi0g1l8Bg2fjT8Gmpa/6IWGDVw0Ak
	RWVcuSk1Vo5w8msUuBi9T2ZPSE6cHiQCikAePEpNYY0xhTpJma+ISVLa9ejy7ut9jp
	Em/5Z/NYedtE2Yxg+eQoVvWDW8HbQGphY93JcOs8=
Received: from mossypile.qualcomm.com (global_nat1_iad_fw.qualcomm.com
	[129.46.232.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: alindsay@smtp.codeaurora.org)
	by smtp.codeaurora.org (Postfix) with ESMTPSA id AA0AA60FEA;
	Tue, 17 Apr 2018 20:38:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
	s=default; t=1523997533;
	bh=1wk2rJNc8/YgipEMiiuL+Ylg3Wck1lH/NhAHrIThAlc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lN7OiUnYq5ckfg773ThgzGBtcSOsAUk47Fqa7uo6cIx+5QgVIOlKl9Rs5eLdip+ew
	TbRg4vo5knmQphJK+XgO5PnwAg5bVbBVFGFltd/ORaGcsL/djZyFERGvRwPMk5WEkX
	Bm9uftsaw6ipl5edOaHGaJtURGQEm74FF6UR1p8c=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org AA0AA60FEA
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
	dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
	spf=none smtp.mailfrom=alindsay@codeaurora.org
From: Aaron Lindsay <alindsay@codeaurora.org>
To: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Alistair Francis <alistair.francis@xilinx.com>, Wei Huang <wei@redhat.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>
Date: Tue, 17 Apr 2018 16:37:51 -0400
Message-Id: <1523997485-1905-8-git-send-email-alindsay@codeaurora.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1523997485-1905-1-git-send-email-alindsay@codeaurora.org>
References: <1523997485-1905-1-git-send-email-alindsay@codeaurora.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 198.145.29.96
Subject: [Qemu-arm] [PATCH v4 07/21] target/arm: Add pre-EL change hooks
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
X-TUID: yN1Gi12e4+9h

Because the design of the PMU requires that the counter values be
converted between their delta and guest-visible forms for mode
filtering, an additional hook which occurs before the EL is changed is
necessary.

Signed-off-by: Aaron Lindsay <alindsay@codeaurora.org>
---
 target/arm/cpu.c       | 16 ++++++++++++++++
 target/arm/cpu.h       | 22 +++++++++++++++++++---
 target/arm/helper.c    | 14 ++++++++------
 target/arm/internals.h |  7 +++++++
 target/arm/op_helper.c |  8 ++++++++
 5 files changed, 58 insertions(+), 9 deletions(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 1f689f6..d175c5e 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -55,6 +55,17 @@ static bool arm_cpu_has_work(CPUState *cs)
          | CPU_INTERRUPT_EXITTB);
 }
 
+void arm_register_pre_el_change_hook(ARMCPU *cpu, ARMELChangeHookFn *hook,
+                                 void *opaque)
+{
+    ARMELChangeHook *entry = g_new0(ARMELChangeHook, 1);
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
@@ -554,6 +565,7 @@ static void arm_cpu_initfn(Object *obj)
     cpu->cp_regs = g_hash_table_new_full(g_int_hash, g_int_equal,
                                          g_free, g_free);
 
+    QLIST_INIT(&cpu->pre_el_change_hooks);
     QLIST_INIT(&cpu->el_change_hooks);
 
 #ifndef CONFIG_USER_ONLY
@@ -721,6 +733,10 @@ static void arm_cpu_finalizefn(Object *obj)
 
     g_hash_table_destroy(cpu->cp_regs);
 
+    QLIST_FOREACH_SAFE(hook, &cpu->pre_el_change_hooks, node, next) {
+        QLIST_REMOVE(hook, node);
+        g_free(hook);
+    }
     QLIST_FOREACH_SAFE(hook, &cpu->el_change_hooks, node, next) {
         QLIST_REMOVE(hook, node);
         g_free(hook);
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 50d129b..4f0d914 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -841,6 +841,7 @@ struct ARMCPU {
      */
     bool cfgend;
 
+    QLIST_HEAD(, ARMELChangeHook) pre_el_change_hooks;
     QLIST_HEAD(, ARMELChangeHook) el_change_hooks;
 
     int32_t node_id; /* NUMA node this CPU belongs to */
@@ -2905,14 +2906,29 @@ static inline AddressSpace *arm_addressspace(CPUState *cs, MemTxAttrs attrs)
 #endif
 
 /**
- * arm_register_el_change_hook:
- * Register a hook function which will be called back whenever this
+ * arm_register_pre_el_change_hook:
+ * Register a hook function which will be called immediately before this
  * CPU changes exception level or mode. The hook function will be
  * passed a pointer to the ARMCPU and the opaque data pointer passed
  * to this function when the hook was registered.
+ *
+ * Note that if a pre-change hook is called, any registered post-change hooks
+ * are guaranteed to subsequently be called.
  */
-void arm_register_el_change_hook(ARMCPU *cpu, ARMELChangeHookFn *hook,
+void arm_register_pre_el_change_hook(ARMCPU *cpu, ARMELChangeHookFn *hook,
                                  void *opaque);
+/**
+ * arm_register_el_change_hook:
+ * Register a hook function which will be called immediately after this
+ * CPU changes exception level or mode. The hook function will be
+ * passed a pointer to the ARMCPU and the opaque data pointer passed
+ * to this function when the hook was registered.
+ *
+ * Note that any registered hooks registered here are guaranteed to be called
+ * if pre-change hooks have been.
+ */
+void arm_register_el_change_hook(ARMCPU *cpu, ARMELChangeHookFn *hook, void
+        *opaque);
 
 /**
  * aa32_vfp_dreg:
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 8bec07e..de3be11 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -8254,6 +8254,14 @@ void arm_cpu_do_interrupt(CPUState *cs)
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
@@ -8261,12 +8269,6 @@ void arm_cpu_do_interrupt(CPUState *cs)
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
index 6358c2a..dc93577 100644
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
index 84f08bf..f728f25 100644
--- a/target/arm/op_helper.c
+++ b/target/arm/op_helper.c
@@ -511,6 +511,10 @@ void HELPER(cpsr_write)(CPUARMState *env, uint32_t val, uint32_t mask)
 /* Write the CPSR for a 32-bit exception return */
 void HELPER(cpsr_write_eret)(CPUARMState *env, uint32_t val)
 {
+    qemu_mutex_lock_iothread();
+    arm_call_pre_el_change_hook(arm_env_get_cpu(env));
+    qemu_mutex_unlock_iothread();
+
     cpsr_write(env, val, CPSR_ERET_MASK, CPSRWriteExceptionReturn);
 
     /* Generated code has already stored the new PC value, but
@@ -1028,6 +1032,10 @@ void HELPER(exception_return)(CPUARMState *env)
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

