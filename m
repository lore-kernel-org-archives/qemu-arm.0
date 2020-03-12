Received: by 2002:a19:f015:0:0:0:0:0 with SMTP id p21csp1087401lfc;
        Thu, 12 Mar 2020 12:42:38 -0700 (PDT)
X-Received: by 2002:a17:90a:c383:: with SMTP id h3mr5853608pjt.119.1584042158730;
        Thu, 12 Mar 2020 12:42:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584042158; cv=none;
        d=google.com; s=arc-20160816;
        b=vS63qpJYKvgD4Kmcs17M0mj3tntxdTyh8K48YTvNlfckMvEZt7mgVhboPlKPiBA4pb
         1MQL9IbdY8MJkvraItg8jMyKOanWgWjOwkmjxmQalwCiA2aCY1kY1eXU+9FsSWqG3Cgh
         mNxbVFETJ2cYJTOYMENL2xolhic0aMddI8RphIrlGQ8Y8+VJMNyFcZ5eGctmuOYtNDCP
         su/91lHjPdZeHUSwd98OB0pofH/3sAVN6bmA8KcWoOY5/7+Z3JOmftbj+dOyCibMbNwl
         DaS5bA4VbPq8mKTjxlHPZKVWxcRNpYSUYsexGo59LcXXG6C9qM0IHwrBOBC8aLW9bWdI
         AQtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=vOc7ZuIgleZgJxOlgoEqlYtRf9AKklvLS59uoi/QsS0=;
        b=DKhywUVx/Yx20DIl4LUqZC2rHtT5kk3Ukq1KSCH0R7sJLCT6xP09k9e691nDthGyqW
         dESerNZaladO+lqhcshpB4y0eFkSyUDX+HFaEC8y1Luf6sGQsRJ4Z6kZmEmrXWt48+na
         3OprwXcYPLU3LgeEou974IU3xWuO7NCq8jguGvI9q8ZJJuLXLH3tmkugqnmwpi1NYFkc
         eLqyhS+E5Mw3FfObuq2mg8YQgFAg5ntxOK5KEgTdbkIibv69O3KG1UFfJRvqfdv/KKh5
         HjXOboAO/lLRBaoD0fSJSwVVSx5R9MVK1w9JL2mhndmQqjK91TJenu/A0zAe336IoUOT
         zPiA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IFlOqtGf;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id f17sor6931821pjq.4.2020.03.12.12.42.38
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 12 Mar 2020 12:42:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IFlOqtGf;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=vOc7ZuIgleZgJxOlgoEqlYtRf9AKklvLS59uoi/QsS0=;
        b=IFlOqtGfWq1iMqXTuyU+3m+mptLlC2hlRPuPsNrGog1gzbkUfb5GrqXKWOdGFXhFtR
         CS3dEV1SDG1POMqJyfNr4YxNdTgRd/hKwrm0rSZ8S0s/Oe5h6tPvJWPzVqsC0X2A55Dg
         YjhYUjr4VcBD4F0T7ZCBGsIDhCRxB6/OBIua4JRZp0O/TGetRmEIsTGF5mYFxIsffClg
         WPFnbDIQIG3DauiIUaM8/NK/EIis+nILn60G0z+/wDt7OHWIkjEOXKFB7sLB/1d1PllH
         78ma0/nXlNv68oCzM5bc6SkIhaAA5f+H9ogHB/hXEAByooSrGTkDNxfCx0vbS2Css1R5
         Xq8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vOc7ZuIgleZgJxOlgoEqlYtRf9AKklvLS59uoi/QsS0=;
        b=TfiTGwKW3NhjahZQOTZEDxf2G1hbDblKTXP7JMfYLhvTCcGKIUx6H3LqbJYpcsK1g6
         rt+Du3OzbTPIOpK+vsJ1S+p232dPC1Kg1hEF2Bu6M8op22xh+kDrXy9zI1o0q0ys5TYd
         dvciKBh9SZq+vmSgoyNFM1TOPV4A5LERbZgVwhcWvxOMcTVwtjsMLI9LGq34R+xjtIWz
         oTQ5dopmZJiMzN8l8H2b/o97oIjf9XPoS1ApCU9CAH3tryCc7iQlMqXKVj6DXkOcLAQc
         HhBYogSC9lioo7TNNd8aWHNUSXrGJZgSfOaqDgcJ79YsZRL2LY5+iQQs2HTESqsouBG8
         2I2g==
X-Gm-Message-State: ANhLgQ2f6FoRhXLxj0hLOS/oCFKYJgJASRDEsFhVSC2j28gJzA3c+VYq
	DOnJbcBrq1Rui1SPpT/iwDwmS4Me
X-Google-Smtp-Source: ADFU+vvZLD+z2DX3O7qKjJAFWxPaKaLsyNkrst8CU0ENJUUsbShw3K7LCngI4kznaQ9t9Ea9KPgt7w==
X-Received: by 2002:a17:90a:8403:: with SMTP id j3mr5886357pjn.8.1584042158178;
        Thu, 12 Mar 2020 12:42:38 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain (97-126-123-70.tukw.qwest.net. [97.126.123.70])
        by smtp.gmail.com with ESMTPSA id g69sm6824842pje.34.2020.03.12.12.42.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2020 12:42:37 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	qemu-arm@nongnu.org,
	alex.bennee@linaro.org
Subject: [PATCH v6 13/42] target/arm: Define arm_cpu_do_unaligned_access for user-only
Date: Thu, 12 Mar 2020 12:41:50 -0700
Message-Id: <20200312194219.24406-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200312194219.24406-1-richard.henderson@linaro.org>
References: <20200312194219.24406-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: V/LFMsV8sDMo

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
index cf618daa1c..d2ce78ae73 100644
--- a/linux-user/arm/cpu_loop.c
+++ b/linux-user/arm/cpu_loop.c
@@ -395,6 +395,13 @@ void cpu_loop(CPUARMState *env)
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
         excp_debug:
             info.si_signo = TARGET_SIGTRAP;
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 3623ecefbd..cb3c3fe8c2 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -2831,8 +2831,8 @@ static void arm_cpu_class_init(ObjectClass *oc, void *data)
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
index e63f8bda29..44d7bcc783 100644
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
2.20.1
