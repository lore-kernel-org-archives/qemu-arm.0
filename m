Received: by 10.28.91.67 with SMTP id p64csp1278700wmb;
        Fri, 16 Mar 2018 13:38:43 -0700 (PDT)
X-Google-Smtp-Source: AG47ELvwWaD3DgcYwCm2OjgQzHI5CxbT2AonOiNQIGV8x2UIvOfzzet4FFkmuF2OrXgS/TKNwjPC
X-Received: by 10.55.50.205 with SMTP id y196mr4770400qky.206.1521232723222;
        Fri, 16 Mar 2018 13:38:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1521232723; cv=none;
        d=google.com; s=arc-20160816;
        b=KJaBidO2mvYNZQtbBDFitGdyXX4CeTSBJEbxZ6RPkTKKLEx2bDzdeYPSTt2WQ4Nfuk
         18E/TF81zlVgxq5QX9RAysJhHpq+tJLd/isR2Ueeh3xx66LArFyD2LkP/4HFvARlizS6
         WqqBcQpzTWD4WfLw2lxnEGszxSnj/bKqPdCKUe1Sg1yiGoYC6Rrao0u2bG70NUJPyZOh
         MOfK9HPs/WK/4NfAx8pUKa0PqrbnHga9gUmffSw9MZFzeTEJhw6hFt5VTNsrl42Mciou
         6tAkhdbpyHSgdWsDCYIcxhfaOQ5QEw2eNvn4M3TN/MZQyJlN4NIJowPZBkDMyo4YnApM
         DdZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dmarc-filter:dkim-signature:dkim-signature
         :arc-authentication-results;
        bh=nYVMvzyZLVGcXD9ErxGTFj3R2VLN5usy1ndM9jqgwvQ=;
        b=DBpFSWo564SmiA7Qk/4j5hQQVQaMiNMwnozaFdz4/xPSWZ0cFZcz4aUebwtdcP1B3w
         pSJ7crv/XRPfjGEV/9sQaZmqAajai9M3aIysJHSQ31LdB89otVjxtpMYtriwCkQBcuEg
         Tn87rvrjpzdNg2cSPrxUjgISsJsjBTaiKKigjA9Qp2vGPP3zDhG4DkiEWP+95G5EbydF
         YYtEUgywO4jSN7BHYAAbiQfh3SnRkiJq1b3DY2zSUioZtMPcGRohyNdUhv+rJ/Yk9hyz
         YaawO+wCidF8ciRHHZJsPNjxu1RRyBwE9KlSAVhcxYAGSThziMd1XhEqm6CKdVj2Uu/O
         AKCg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=GHG1Oy2a;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=NVWtpkXn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u66si4864076qkd.334.2018.03.16.13.38.43
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 16 Mar 2018 13:38:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=GHG1Oy2a;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=NVWtpkXn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:59467 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eww7e-0002m5-M2
	for alex.bennee@linaro.org; Fri, 16 Mar 2018 16:38:42 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43982)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alindsay@codeaurora.org>) id 1eww1M-0005mo-03
	for qemu-arm@nongnu.org; Fri, 16 Mar 2018 16:32:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alindsay@codeaurora.org>) id 1eww1K-0003Ej-OE
	for qemu-arm@nongnu.org; Fri, 16 Mar 2018 16:32:12 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:55830)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <alindsay@codeaurora.org>)
	id 1eww1K-0003Dg-Fp; Fri, 16 Mar 2018 16:32:10 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
	id 3C7DA60FE9; Fri, 16 Mar 2018 20:32:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
	s=default; t=1521232329;
	bh=sDuiE6LXXfdX5487SXN6aqIm5QZvYG3GALksd6/HLRs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GHG1Oy2a8efoshu+o0yBccOTd39C7Syg4wYWGh0+YTpDAJwvwRSUWDPfxtLlEgHnA
	lbabjSEZahYu3ljWd6o8LkFvWlIrcgBQ9JDaE+is7FwwKcAlX4ee5rgAVpwFMPSfEq
	MovvNvok8oTV3K/XHT8sqfTdC/X48/DfUYAFObJs=
Received: from mossypile.qualcomm.com (global_nat1_iad_fw.qualcomm.com
	[129.46.232.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: alindsay@smtp.codeaurora.org)
	by smtp.codeaurora.org (Postfix) with ESMTPSA id AE9156055D;
	Fri, 16 Mar 2018 20:32:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
	s=default; t=1521232326;
	bh=sDuiE6LXXfdX5487SXN6aqIm5QZvYG3GALksd6/HLRs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=NVWtpkXnz0h2DzfcDngwegkw3fq+FoD3w77K08wzVKMLJJENZcaoUXJWOqfiTBRkt
	8nIYbxUDHfQaVKlO1gJtB4yKjTOEcXfhw5v9olGbvdB2NZZ726WE6CClDQKNLmgK/Z
	5HHYMUrL1sTnx7tznRyaaTJLy8BjuK8SANMJjEDs=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org AE9156055D
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
	dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
	spf=none smtp.mailfrom=alindsay@codeaurora.org
From: Aaron Lindsay <alindsay@codeaurora.org>
To: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Alistair Francis <alistair.francis@xilinx.com>, Wei Huang <wei@redhat.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>
Date: Fri, 16 Mar 2018 16:31:06 -0400
Message-Id: <1521232280-13089-9-git-send-email-alindsay@codeaurora.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1521232280-13089-1-git-send-email-alindsay@codeaurora.org>
References: <1521232280-13089-1-git-send-email-alindsay@codeaurora.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 198.145.29.96
Subject: [Qemu-arm] [PATCH v3 08/22] target/arm: Support multiple EL change
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
X-TUID: O+QST9MD8iyo

Signed-off-by: Aaron Lindsay <alindsay@codeaurora.org>
---
 target/arm/cpu.c       | 15 ++++++++++-----
 target/arm/cpu.h       | 23 ++++++++++++-----------
 target/arm/internals.h |  7 ++++---
 3 files changed, 26 insertions(+), 19 deletions(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 072cbbf..5f782bf 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -55,13 +55,16 @@ static bool arm_cpu_has_work(CPUState *cs)
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
+    ARMELChangeHook *entry;
+    entry = g_malloc0(sizeof (*entry));
+
+    entry->hook = hook;
+    entry->opaque = opaque;
+
+    QLIST_INSERT_HEAD(&cpu->el_change_hooks, entry, node);
 }
 
 static void cp_reg_reset(gpointer key, gpointer value, gpointer opaque)
@@ -744,6 +747,8 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
         return;
     }
 
+    QLIST_INIT(&cpu->el_change_hooks);
+
     /* Some features automatically imply others: */
     if (arm_feature(env, ARM_FEATURE_V8)) {
         set_feature(env, ARM_FEATURE_V7);
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index f17592b..3b45d3d 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -633,11 +633,17 @@ typedef struct CPUARMState {
 
 /**
  * ARMELChangeHook:
- * type of a function which can be registered via arm_register_el_change_hook()
- * to get callbacks when the CPU changes its exception level or mode.
+ * Support registering functions with ARMELChangeHookFn's signature via
+ * arm_register_el_change_hook() to get callbacks when the CPU changes its
+ * exception level or mode.
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
@@ -826,8 +832,7 @@ struct ARMCPU {
      */
     bool cfgend;
 
-    ARMELChangeHook *el_change_hook;
-    void *el_change_hook_opaque;
+    QLIST_HEAD(, ARMELChangeHook) el_change_hooks;
 
     int32_t node_id; /* NUMA node this CPU belongs to */
 
@@ -2895,12 +2900,8 @@ static inline AddressSpace *arm_addressspace(CPUState *cs, MemTxAttrs attrs)
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
index 47cc224..7df3eda 100644
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

