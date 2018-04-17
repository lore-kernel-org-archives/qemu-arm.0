Received: by 10.28.4.212 with SMTP id 203csp4250993wme;
        Tue, 17 Apr 2018 13:40:05 -0700 (PDT)
X-Google-Smtp-Source: AIpwx4/zX9atnGsag7+NU8Fv2ZyqK5GGvu9cLE4excKVc47mjOdHwsPVSUsr1/eQ90fHH1Af/Bfy
X-Received: by 10.55.6.145 with SMTP id 139mr3477965qkg.232.1523997605266;
        Tue, 17 Apr 2018 13:40:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1523997605; cv=none;
        d=google.com; s=arc-20160816;
        b=QtgXn/b/6s8kgiYVsoDtO+ru9qG9xYDPyYhchfEuyQigOixAt82ezFNMXQ/7aCJCkd
         1LkvjPK4o3m6TmlNiyu/D5yGQXTAq82nNPfRBgh2+q0qI8ReLkHMo/lXPbZLmAMMkUA5
         pyswV18pXW8YXQZhzFnAcFu5Mu2W4Y1JzIwNYba0HrnXqgyZvX0ASYU38j0KVMT5a5XW
         vsFx4/P7fLmt2Hc7svMmM3/cXun601zC+myav/p2KadmMyI4VGYrYvbH7vSmg2gFlA87
         18yaVW0AQm14S5kIZs5mcoK0DtfFvjvyUErcUlR6GWSp1akpYi/bYZz+e3ZFCWGK05RP
         Rtwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dmarc-filter:dkim-signature:dkim-signature
         :arc-authentication-results;
        bh=W286HjSeOdvAnFRBQGDEJyVMv9Y6pxYTv09U565CbyY=;
        b=dFxEGBunx2hV4+Ak8M/UaE/Tnm6yllPsfaWFJHSs1AwKOXRMv5Iu8rXNIdHgePeQzc
         KJEpiwQHGUDf8jEPVvC//TdueKT2XjN8V7ynOBpMibqirgD3W1qakqFzy/QDFzdEkf9O
         ax41p6UQJuk7i7zy8q4Fgq7hjGbN2nPq4pn3KsE5BRu5JTyliF5wDg26U4CHisQDbVP9
         d0deAch32uBeRLQSyP5JiPgtC9+WorXyekD9ePncUU4NKuXg36A7wDRjXpAPWkAS0WeJ
         Bu3jkLKUpy3ZAP7k9Ji6VoIV2XffYeWil5YFrR5QuS+GGdqCughsyDRKyenhj1BNZmSJ
         f+/A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=M8rJ/0Ck;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=ZTSPwaUS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 3si3304701qtp.263.2018.04.17.13.40.05
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 17 Apr 2018 13:40:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=M8rJ/0Ck;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=ZTSPwaUS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:33293 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1f8XOW-0003fV-NH
	for alex.bennee@linaro.org; Tue, 17 Apr 2018 16:40:04 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50489)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alindsay@codeaurora.org>) id 1f8XNS-0002qG-85
	for qemu-arm@nongnu.org; Tue, 17 Apr 2018 16:39:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alindsay@codeaurora.org>) id 1f8XNP-0004up-6J
	for qemu-arm@nongnu.org; Tue, 17 Apr 2018 16:38:58 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:39508)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <alindsay@codeaurora.org>)
	id 1f8XNO-0004ks-Mk; Tue, 17 Apr 2018 16:38:54 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
	id 837A56081C; Tue, 17 Apr 2018 20:38:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
	s=default; t=1523997533;
	bh=pKHHlnkDIueaN38xQZ32d12ndkBEvfAczS3U73kwyRE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=M8rJ/0Ckc2m2PfY1EqfL2z3O6mKIMqfV245L49nt9Ei17vnVsNMb3VMDtgo7qZ46E
	Lf82xhYY9HnjKesbyLQlhqQs9TlKroP07wLSmxCzGsQNtKlGMWAB11LXZa/0XiB/8p
	rYubgCIXOOzqSbTN+C3CsU1TGYokiX7CUrPlwWIk=
Received: from mossypile.qualcomm.com (global_nat1_iad_fw.qualcomm.com
	[129.46.232.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: alindsay@smtp.codeaurora.org)
	by smtp.codeaurora.org (Postfix) with ESMTPSA id 8794E6081C;
	Tue, 17 Apr 2018 20:38:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
	s=default; t=1523997532;
	bh=pKHHlnkDIueaN38xQZ32d12ndkBEvfAczS3U73kwyRE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZTSPwaUSQVsSogkefP9h97A91skLafWf3Tblr+AU8kX3bNAefIaQ1Q8sRc+N3KsvX
	mgsSHiqD1KCjvRrkRFLM52geO8N0Sc1Du8kzZhJhyHLFbVQSmEZ4Y53v4KCEjdfsxC
	B4/NTuuAtwpyvU5FhSViBtK9hRUbb+5QckpPA4sk=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 8794E6081C
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
	dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
	spf=none smtp.mailfrom=alindsay@codeaurora.org
From: Aaron Lindsay <alindsay@codeaurora.org>
To: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Alistair Francis <alistair.francis@xilinx.com>, Wei Huang <wei@redhat.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>
Date: Tue, 17 Apr 2018 16:37:50 -0400
Message-Id: <1523997485-1905-7-git-send-email-alindsay@codeaurora.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1523997485-1905-1-git-send-email-alindsay@codeaurora.org>
References: <1523997485-1905-1-git-send-email-alindsay@codeaurora.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 198.145.29.96
Subject: [Qemu-arm] [PATCH v4 06/21] target/arm: Support multiple EL change
 hooks
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
X-TUID: yEVvZNK3KC+i

Signed-off-by: Aaron Lindsay <alindsay@codeaurora.org>
---
 target/arm/cpu.c       | 21 ++++++++++++++++-----
 target/arm/cpu.h       | 20 ++++++++++----------
 target/arm/internals.h |  7 ++++---
 3 files changed, 30 insertions(+), 18 deletions(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 022d8c5..1f689f6 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -55,13 +55,15 @@ static bool arm_cpu_has_work(CPUState *cs)
          | CPU_INTERRUPT_EXITTB);
 }
 
-void arm_register_el_change_hook(ARMCPU *cpu, ARMELChangeHook *hook,
+void arm_register_el_change_hook(ARMCPU *cpu, ARMELChangeHookFn *hook,
                                  void *opaque)
 {
-    /* We currently only support registering a single hook function */
-    assert(!cpu->el_change_hook);
-    cpu->el_change_hook = hook;
-    cpu->el_change_hook_opaque = opaque;
+    ARMELChangeHook *entry = g_new0(ARMELChangeHook, 1);
+
+    entry->hook = hook;
+    entry->opaque = opaque;
+
+    QLIST_INSERT_HEAD(&cpu->el_change_hooks, entry, node);
 }
 
 static void cp_reg_reset(gpointer key, gpointer value, gpointer opaque)
@@ -552,6 +554,8 @@ static void arm_cpu_initfn(Object *obj)
     cpu->cp_regs = g_hash_table_new_full(g_int_hash, g_int_equal,
                                          g_free, g_free);
 
+    QLIST_INIT(&cpu->el_change_hooks);
+
 #ifndef CONFIG_USER_ONLY
     /* Our inbound IRQ and FIQ lines */
     if (kvm_enabled()) {
@@ -713,7 +717,14 @@ static void arm_cpu_post_init(Object *obj)
 static void arm_cpu_finalizefn(Object *obj)
 {
     ARMCPU *cpu = ARM_CPU(obj);
+    ARMELChangeHook *hook, *next;
+
     g_hash_table_destroy(cpu->cp_regs);
+
+    QLIST_FOREACH_SAFE(hook, &cpu->el_change_hooks, node, next) {
+        QLIST_REMOVE(hook, node);
+        g_free(hook);
+    }
 }
 
 static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index ff349f5..50d129b 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -642,12 +642,17 @@ typedef struct CPUARMState {
 } CPUARMState;
 
 /**
- * ARMELChangeHook:
+ * ARMELChangeHookFn:
  * type of a function which can be registered via arm_register_el_change_hook()
  * to get callbacks when the CPU changes its exception level or mode.
  */
-typedef void ARMELChangeHook(ARMCPU *cpu, void *opaque);
-
+typedef void ARMELChangeHookFn(ARMCPU *cpu, void *opaque);
+typedef struct ARMELChangeHook ARMELChangeHook;
+struct ARMELChangeHook {
+    ARMELChangeHookFn *hook;
+    void *opaque;
+    QLIST_ENTRY(ARMELChangeHook) node;
+};
 
 /* These values map onto the return values for
  * QEMU_PSCI_0_2_FN_AFFINITY_INFO */
@@ -836,8 +841,7 @@ struct ARMCPU {
      */
     bool cfgend;
 
-    ARMELChangeHook *el_change_hook;
-    void *el_change_hook_opaque;
+    QLIST_HEAD(, ARMELChangeHook) el_change_hooks;
 
     int32_t node_id; /* NUMA node this CPU belongs to */
 
@@ -2906,12 +2910,8 @@ static inline AddressSpace *arm_addressspace(CPUState *cs, MemTxAttrs attrs)
  * CPU changes exception level or mode. The hook function will be
  * passed a pointer to the ARMCPU and the opaque data pointer passed
  * to this function when the hook was registered.
- *
- * Note that we currently only support registering a single hook function,
- * and will assert if this function is called twice.
- * This facility is intended for the use of the GICv3 emulation.
  */
-void arm_register_el_change_hook(ARMCPU *cpu, ARMELChangeHook *hook,
+void arm_register_el_change_hook(ARMCPU *cpu, ARMELChangeHookFn *hook,
                                  void *opaque);
 
 /**
diff --git a/target/arm/internals.h b/target/arm/internals.h
index 8ce944b..6358c2a 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -727,11 +727,12 @@ void arm_cpu_do_transaction_failed(CPUState *cs, hwaddr physaddr,
                                    int mmu_idx, MemTxAttrs attrs,
                                    MemTxResult response, uintptr_t retaddr);
 
-/* Call the EL change hook if one has been registered */
+/* Call any registered EL change hooks */
 static inline void arm_call_el_change_hook(ARMCPU *cpu)
 {
-    if (cpu->el_change_hook) {
-        cpu->el_change_hook(cpu, cpu->el_change_hook_opaque);
+    ARMELChangeHook *hook, *next;
+    QLIST_FOREACH_SAFE(hook, &cpu->el_change_hooks, node, next) {
+        hook->hook(cpu, hook->opaque);
     }
 }
 
-- 
Qualcomm Datacenter Technologies as an affiliate of Qualcomm Technologies, Inc.
Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.

