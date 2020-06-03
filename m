Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp33429lfc;
        Tue, 2 Jun 2020 18:18:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzkfcPrsssJWuWZaEqUksA7gP+K/JZMV350fE8wV06FKKb2Pd5NSGfBX2bLNx0Ebej7woF2
X-Received: by 2002:a25:748b:: with SMTP id p133mr50546142ybc.476.1591147099854;
        Tue, 02 Jun 2020 18:18:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591147099; cv=none;
        d=google.com; s=arc-20160816;
        b=faPwkMupVBRxj9wGMbL9byjZ+KWtL0nOAne0a0znS/DxxI8CfqvJeod2L2c8hMrG9f
         8DnMtKc5EqEUzKt98Hx/ERM0FjYas5SxIzl2ihD1kEukv54U7VDU4wUzhCDYS7tDN8/s
         rIh6nEPg0enVdSZovuZH88Min1TuhC1uS4wE/TnQa3XsEtGawpcnO0etbc5AVWSde8P7
         M53/BjcHv6jZeqqZtNikaItywMGAGTCsbhC8w2t2r6SxM5xM2RoKO6uCcO6tb2Zb7EfC
         on1TRSFGf/hmI5a6J7bEpk/8sY231EesCtxwrvy9v8q45qXtWPRei1/qmCjkoxyjsP7P
         jn0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=0EIkcVZM7CTGPx7yRFPLzi2q/BnEPgFyUzrQe3RUVmw=;
        b=f9oWqN/x3+wlWJ9UFNgWXuEwYbeljQ9bi+2EsEuNwQO1pvP5MoLiZF0TyoWmkShYfy
         2lc3nd6yRzblgtq31knHq1mWbwTwLHoQL5Q608d3VcXnBBjquV2oE5kyirXeQfN529P1
         7VRjEYqjrGjPHHcfbmj7y6sSF/jkC0mthn2TTrcOjQdunxEEnSvaVMGjNTTbWDawrekM
         LnOI5iw0TsdR6xajPPSzMJ4I+HhRf7aGc9p6GxpiHbiJmGebsDhB2nUNqn2EocdLigq5
         UJOcDlItl1dnkGUNRoHiyZAkQOqz64Oly6QBGxQqIv9VtKUqKk8/o1CyyF7ugleFi4En
         qZcw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=A3TJV5nC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g5si363545ybg.300.2020.06.02.18.18.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 02 Jun 2020 18:18:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=A3TJV5nC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38194 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jgI2t-0003wI-7V
	for alex.bennee@linaro.org; Tue, 02 Jun 2020 21:18:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48674)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jgHyP-0003sd-Jt
 for qemu-arm@nongnu.org; Tue, 02 Jun 2020 21:13:41 -0400
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644]:33272)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jgHyL-0003Yv-NS
 for qemu-arm@nongnu.org; Tue, 02 Jun 2020 21:13:41 -0400
Received: by mail-pl1-x644.google.com with SMTP id t7so209400plr.0
 for <qemu-arm@nongnu.org>; Tue, 02 Jun 2020 18:13:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0EIkcVZM7CTGPx7yRFPLzi2q/BnEPgFyUzrQe3RUVmw=;
 b=A3TJV5nCnr3oYovFU1ADFd+5yfFGhL0YsAB6KWudClLp1wvvmNicYYxE+o0VmSob5o
 p138YpdPOZiQNyBhJmc2bHHEra6CcwLLkoatJTvmxsPrgGSSvEAF+e1+6S886KwhNE9q
 DOSTP2M15CU1MV1HQMlQ4H9byezhmyDDVF6j6FHTcFkBsx+AIvklRPWXzbStPUSYl116
 vacfPn1/3C3TUSMtjVRqiATU/ah4CEfQA/3gnBiXw7lLJwoW8+9ldG9hbcDDQGl27Vmu
 SBfWVCdk6F4oUAXCg0bSLVlM2TKvyudy1T/vvlfpgnwX87pb8GtZY9kwnZp4SzUsQ2iq
 6xLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0EIkcVZM7CTGPx7yRFPLzi2q/BnEPgFyUzrQe3RUVmw=;
 b=lID+8H5YQtYL7LZtUG2AR5mpNSHBTF3Yj4rNM+wLdwF/q1JF/U0VJcVyhxovLDb5WF
 tZTcBp0BUdxBTmKPDN8+qkUg8cbQZY1NmjqLhYHNu/p3Ook/WlliMx3XKPi4XeC6KdgL
 fM4SDo51OszSKckMuABqEX/xhM4EnPfDTUSJZsBINLChtveeVIVhlVqvfgQpJOvPs3Xz
 7ZkydVFMrK47trW63Wyjjh6lE348KZsx2YJ2lRIHm99VYaPlE8ouQ1y6WH4NBpbMUIie
 3PagJDEzKQ2jSCVunFnQcYPDMeHNdMfUzkqWKvlLDw/mE6XrzJOuoBLeeg3JhOy3Wqh9
 /gtw==
X-Gm-Message-State: AOAM533p4IQgeyAP7v07BYOm5/82DEEAiitD4BlnKMxSMTSXKOb7yVtq
 i/paqFlNPhuQ0O5MegHigDIwvg==
X-Received: by 2002:a17:902:8218:: with SMTP id
 x24mr27620797pln.150.1591146815640; 
 Tue, 02 Jun 2020 18:13:35 -0700 (PDT)
Received: from localhost.localdomain (174-21-143-238.tukw.qwest.net.
 [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id 3sm290067pfe.85.2020.06.02.18.13.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jun 2020 18:13:34 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 13/42] target/arm: Define arm_cpu_do_unaligned_access for
 user-only
Date: Tue,  2 Jun 2020 18:12:48 -0700
Message-Id: <20200603011317.473934-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200603011317.473934-1-richard.henderson@linaro.org>
References: <20200603011317.473934-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::644;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x644.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, steplong@quicinc.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: aKQaBMf8QNLq

We need this to raise unaligned exceptions from user mode.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v6: Use EXCP_UNALIGNED for user-only and update cpu_loop.c.
---
 linux-user/aarch64/cpu_loop.c |  7 ++++++
 linux-user/arm/cpu_loop.c     |  7 ++++++
 target/arm/cpu.c              |  2 +-
 target/arm/tlb_helper.c       | 41 ++++++++++++++++++++++-------------
 4 files changed, 41 insertions(+), 16 deletions(-)

diff --git a/linux-user/aarch64/cpu_loop.c b/linux-user/aarch64/cpu_loop.c
index bbe9fefca8..3cca637bb9 100644
--- a/linux-user/aarch64/cpu_loop.c
+++ b/linux-user/aarch64/cpu_loop.c
@@ -121,6 +121,13 @@ void cpu_loop(CPUARMState *env)
             info._sifields._sigfault._addr = env->exception.vaddress;
             queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
             break;
+        case EXCP_UNALIGNED:
+            info.si_signo = TARGET_SIGBUS;
+            info.si_errno = 0;
+            info.si_code = TARGET_BUS_ADRALN;
+            info._sifields._sigfault._addr = env->exception.vaddress;
+            queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
+            break;
         case EXCP_DEBUG:
         case EXCP_BKPT:
             info.si_signo = TARGET_SIGTRAP;
diff --git a/linux-user/arm/cpu_loop.c b/linux-user/arm/cpu_loop.c
index 13629ee1f6..0d568d2d69 100644
--- a/linux-user/arm/cpu_loop.c
+++ b/linux-user/arm/cpu_loop.c
@@ -411,6 +411,13 @@ void cpu_loop(CPUARMState *env)
                 queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
             }
             break;
+        case EXCP_UNALIGNED:
+            info.si_signo = TARGET_SIGBUS;
+            info.si_errno = 0;
+            info.si_code = TARGET_BUS_ADRALN;
+            info._sifields._sigfault._addr = env->exception.vaddress;
+            queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
+            break;
         case EXCP_DEBUG:
         case EXCP_BKPT:
         excp_debug:
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 32bec156f2..0f1a46f531 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -2166,8 +2166,8 @@ static void arm_cpu_class_init(ObjectClass *oc, void *data)
     cc->tlb_fill = arm_cpu_tlb_fill;
     cc->debug_excp_handler = arm_debug_excp_handler;
     cc->debug_check_watchpoint = arm_debug_check_watchpoint;
-#if !defined(CONFIG_USER_ONLY)
     cc->do_unaligned_access = arm_cpu_do_unaligned_access;
+#if !defined(CONFIG_USER_ONLY)
     cc->do_transaction_failed = arm_cpu_do_transaction_failed;
     cc->adjust_watchpoint_address = arm_adjust_watchpoint_address;
 #endif /* CONFIG_TCG && !CONFIG_USER_ONLY */
diff --git a/target/arm/tlb_helper.c b/target/arm/tlb_helper.c
index 7388494a55..d4e6d37f4f 100644
--- a/target/arm/tlb_helper.c
+++ b/target/arm/tlb_helper.c
@@ -107,21 +107,6 @@ static void QEMU_NORETURN arm_deliver_fault(ARMCPU *cpu, vaddr addr,
     raise_exception(env, exc, syn, target_el);
 }
 
-/* Raise a data fault alignment exception for the specified virtual address */
-void arm_cpu_do_unaligned_access(CPUState *cs, vaddr vaddr,
-                                 MMUAccessType access_type,
-                                 int mmu_idx, uintptr_t retaddr)
-{
-    ARMCPU *cpu = ARM_CPU(cs);
-    ARMMMUFaultInfo fi = {};
-
-    /* now we have a real cpu fault */
-    cpu_restore_state(cs, retaddr, true);
-
-    fi.type = ARMFault_Alignment;
-    arm_deliver_fault(cpu, vaddr, access_type, mmu_idx, &fi);
-}
-
 /*
  * arm_cpu_do_transaction_failed: handle a memory system error response
  * (eg "no device/memory present at address") by raising an external abort
@@ -198,3 +183,29 @@ bool arm_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
     }
 #endif
 }
+
+/* Raise a data fault alignment exception for the specified virtual address */
+void arm_cpu_do_unaligned_access(CPUState *cs, vaddr vaddr,
+                                 MMUAccessType access_type,
+                                 int mmu_idx, uintptr_t retaddr)
+{
+    ARMCPU *cpu = ARM_CPU(cs);
+
+#ifdef CONFIG_USER_ONLY
+    cpu->env.exception.vaddress = vaddr;
+    /*
+     * For HW, this is EXCP_DATA_ABORT with a proper syndrome.
+     * Make it easier for ourselves in linux-user/arm/cpu_loop.c.
+     */
+    cs->exception_index = EXCP_UNALIGNED;
+    cpu_loop_exit_restore(cs, retaddr);
+#else
+    ARMMMUFaultInfo fi = {};
+
+    /* now we have a real cpu fault */
+    cpu_restore_state(cs, retaddr, true);
+
+    fi.type = ARMFault_Alignment;
+    arm_deliver_fault(cpu, vaddr, access_type, mmu_idx, &fi);
+#endif
+}
-- 
2.25.1

