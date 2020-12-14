Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp2877463lfq;
        Mon, 14 Dec 2020 12:07:19 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzRSf8idzV9J4WPzvkmE5h/MzeCepabsGWDUiv5yWMkEZNAI/Zf4m39LwwEx7KsyFvau74K
X-Received: by 2002:a17:90a:902:: with SMTP id n2mr26824905pjn.126.1607976439276;
        Mon, 14 Dec 2020 12:07:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1607976439; cv=none;
        d=google.com; s=arc-20160816;
        b=i6c3vIv6AKzmznMc/LqfccP0mqROYC5spnz1Yk8kinCvgdJoJwfVWx9YmBJI/BFoIO
         Q3jJ06vc/XPm6+V8VD7dA/rKIFSfRxmEAmO4kXFIJYjxSua8EEWzw8seZVMRp3BNlmwp
         kZlHYO7JmsKAKRN+job0xbKDnuwP+p0+9y4BJQZmDOUQKljgUCLlM2u1ACn6iKviLBY0
         cniC2rdyHWLDxzGX5TYGPxJI6dtT7g0bDlSTWmtSSknm8AjhV+ev8ZmZ7+e+BJIuXtGb
         J1IlCsMNYePCzBaDnP+qXXZtI6R0D19f3kCQ26+s35Zw3vbpjqC3/EcM0RILgWMQOI7T
         Rdhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:dkim-signature;
        bh=1BpmSXFO0VpD1OygwWpbmFViV3UQGca7pns5nGDEs70=;
        b=rY6N0ruKAi1VQGbe+9FMudUBKJbPmu9BVmiimfpZ/0mQSijMy11U1qLIjNAD9TcJOf
         /YKxXYJPKcMn8ne2PfY39KW6Q3SX0Oo8BN3jCd53JWRhN/KykuyBzhRGmZsdTIrL7YOA
         JBI1gdR0hiXr6duol/ZORDZNFyco0fX1DK0ac0N+LMOZsbI2igtpUAHxOhVy8Btp7iR8
         FvaNUcRFX0jSeeGgLTF4x3hgOXJC/Em1baCHfQJR49WUvCfptcdOJzyVJgr0K/l/prqZ
         263d94oqw6OZpl1XYTUCwMo1erljew9165D7VNo84eHwJR3TVYgi1K6szUCESzTWjdDH
         YKnQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@keithp.com header.s=mail header.b=Vh7Dw+hY;
       dkim=pass header.i=@keithp.com header.s=mail header.b=QihwazvX;
       spf=pass (google.com: domain of keithp@keithp.com designates 63.227.221.253 as permitted sender) smtp.mailfrom=keithp@keithp.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=keithp.com
Return-Path: <keithp@keithp.com>
Received: from elaine.keithp.com (home.keithp.com. [63.227.221.253])
        by mx.google.com with ESMTPS id a127si16948862pgc.109.2020.12.14.12.07.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Dec 2020 12:07:19 -0800 (PST)
Received-SPF: pass (google.com: domain of keithp@keithp.com designates 63.227.221.253 as permitted sender) client-ip=63.227.221.253;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@keithp.com header.s=mail header.b=Vh7Dw+hY;
       dkim=pass header.i=@keithp.com header.s=mail header.b=QihwazvX;
       spf=pass (google.com: domain of keithp@keithp.com designates 63.227.221.253 as permitted sender) smtp.mailfrom=keithp@keithp.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=keithp.com
Received: from localhost (localhost [127.0.0.1])
	by elaine.keithp.com (Postfix) with ESMTP id 267713F2E394;
	Mon, 14 Dec 2020 12:07:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=keithp.com; s=mail;
	t=1607976438; bh=4dXdMly3qtM9hVz89H2BlNVZ7tjHHM6eL8X8Oa5buEA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Vh7Dw+hYdJ44yVDP4jZ5oNEbnYDJ62LDTMbftFPmiVks8Xwvvlp0bzKBTMiisYC5V
	 iqQvDX6e/NmbxUwG7opBqGozWYza8j3o5sttcRU/PxFY/HE0W527Np6TiLvKPt+dp3
	 j4RqQp3CYO3/tlYkfskeIeUyTskwiFzV/NAXOq/ABW/UshQhV727N5HBfPhm6PoLiB
	 BXg8kPmlGn1Q1v57KDq5B5+1Dh2f8GEMZz/00BBumjYyRbIQxAt/VBTFyp+NuOPntr
	 GOCpiBHXYOvQj8GfRgtDBwzKA0x+kWAdsm67GpPDKQvx5ssS10hHafXgSYY2PgLGLm
	 pFV1bLnsI3big==
X-Virus-Scanned: Debian amavisd-new at keithp.com
Received: from elaine.keithp.com ([127.0.0.1])
	by localhost (elaine.keithp.com [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id s2Eh7SMAV8QM; Mon, 14 Dec 2020 12:07:17 -0800 (PST)
Received: from keithp.com (koto.keithp.com [10.0.0.2])
	by elaine.keithp.com (Postfix) with ESMTPSA id 7DEB53F2DF09;
	Mon, 14 Dec 2020 12:07:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=keithp.com; s=mail;
	t=1607976437; bh=4dXdMly3qtM9hVz89H2BlNVZ7tjHHM6eL8X8Oa5buEA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QihwazvXI50vBlZA/3BjDiC9EB7YqEUWe7vmIb8n/E3B+Vvajsb1tYpFNPGqddhIr
	 m2CF802NzEj20OZHYM+nfpgQRn15gtuNa+ZZtp6vz8Ky4dPEXCDh/GftZft6qV9Eok
	 6A5aCKhhYVgPkLBL6qQhBvOua1kFzdNzkjwd5Bqsvh1At/it1zTioLalCQQafYVU7+
	 pWZF2C89gJvPTSEFpACVwBAMBrzfWY1CcVHV47rHioEF0emo51wjPXfRGrKmUO/Rnm
	 6+BIHT2+DtrgkuPZVb6MLMawyTSm5cY/NI8GOudEpyrkqAc5b0ae910Btqvb+9idhd
	 IUnqXoVi1cEOQ==
Received: by keithp.com (Postfix, from userid 1000)
	id 3F5681582188; Mon, 14 Dec 2020 12:07:17 -0800 (PST)
From: Keith Packard <keithp@keithp.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Alistair Francis <Alistair.Francis@wdc.com>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Laurent Vivier <laurent@vivier.eu>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org,
	qemu-riscv@nongnu.org,
	Sagar Karandikar <sagark@eecs.berkeley.edu>,
	Keith Packard <keithp@keithp.com>,
	Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH 2/9] semihosting: Change common-semi API to be architecture-independent
Date: Mon, 14 Dec 2020 12:07:06 -0800
Message-Id: <20201214200713.3886611-3-keithp@keithp.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201214200713.3886611-1-keithp@keithp.com>
References: <87wnxktost.fsf@linaro.org>
 <20201214200713.3886611-1-keithp@keithp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: pCkkr0S+q70m

The public API is now defined in
hw/semihosting/common-semi.h. do_common_semihosting takes CPUState *
instead of CPUARMState *. All internal functions have been renamed
common_semi_ instead of arm_semi_ or arm_. Aside from the API change,
there are no functional changes in this patch.

Signed-off-by: Keith Packard <keithp@keithp.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 hw/semihosting/common-semi.c  | 16 ++++++++++------
 hw/semihosting/common-semi.h  | 36 +++++++++++++++++++++++++++++++++++
 linux-user/aarch64/cpu_loop.c |  3 ++-
 linux-user/arm/cpu_loop.c     |  3 ++-
 target/arm/cpu.h              |  8 --------
 target/arm/helper.c           |  5 +++--
 target/arm/m_helper.c         |  7 ++++++-
 7 files changed, 59 insertions(+), 19 deletions(-)
 create mode 100644 hw/semihosting/common-semi.h

diff --git a/hw/semihosting/common-semi.c b/hw/semihosting/common-semi.c
index f7b7bff522..74f09c038c 100644
--- a/hw/semihosting/common-semi.c
+++ b/hw/semihosting/common-semi.c
@@ -1,10 +1,14 @@
 /*
- *  Arm "Angel" semihosting syscalls
+ *  Semihosting support for systems modeled on the Arm "Angel"
+ *  semihosting syscalls design.
  *
  *  Copyright (c) 2005, 2007 CodeSourcery.
  *  Copyright (c) 2019 Linaro
  *  Written by Paul Brook.
  *
+ *  Copyright © 2020 by Keith Packard <keithp@keithp.com>
+ *  Adapted for systems other than ARM, including RISC-V, by Keith Packard
+ *
  *  This program is free software; you can redistribute it and/or modify
  *  it under the terms of the GNU General Public License as published by
  *  the Free Software Foundation; either version 2 of the License, or
@@ -373,12 +377,12 @@ static target_ulong arm_gdb_syscall(ARMCPU *cpu, gdb_syscall_complete_cb cb,
      * do anything with its return value, because it is not necessarily
      * the result of the syscall, but could just be the old value of X0.
      * The only thing safe to do with this is that the callers of
-     * do_arm_semihosting() will write it straight back into X0.
+     * do_common_semihosting() will write it straight back into X0.
      * (In linux-user mode, the callback will have happened before
      * gdb_do_syscallv() returns.)
      *
      * We should tidy this up so neither this function nor
-     * do_arm_semihosting() return a value, so the mistake of
+     * do_common_semihosting() return a value, so the mistake of
      * doing something with the return value is not possible to make.
      */
 
@@ -675,10 +679,10 @@ static const GuestFDFunctions guestfd_fns[] = {
  * leave the register unchanged. We use 0xdeadbeef as the return value
  * when there isn't a defined return value for the call.
  */
-target_ulong do_arm_semihosting(CPUARMState *env)
+target_ulong do_common_semihosting(CPUState *cs)
 {
-    ARMCPU *cpu = env_archcpu(env);
-    CPUState *cs = env_cpu(env);
+    ARMCPU *cpu = ARM_CPU(cs);
+    CPUARMState *env = &cpu->env;
     target_ulong args;
     target_ulong arg0, arg1, arg2, arg3;
     char * s;
diff --git a/hw/semihosting/common-semi.h b/hw/semihosting/common-semi.h
new file mode 100644
index 0000000000..bc53e92c79
--- /dev/null
+++ b/hw/semihosting/common-semi.h
@@ -0,0 +1,36 @@
+/*
+ *  Semihosting support for systems modeled on the Arm "Angel"
+ *  semihosting syscalls design.
+ *
+ *  Copyright (c) 2005, 2007 CodeSourcery.
+ *  Copyright (c) 2019 Linaro
+ *  Written by Paul Brook.
+ *
+ *  Copyright © 2020 by Keith Packard <keithp@keithp.com>
+ *  Adapted for systems other than ARM, including RISC-V, by Keith Packard
+ *
+ *  This program is free software; you can redistribute it and/or modify
+ *  it under the terms of the GNU General Public License as published by
+ *  the Free Software Foundation; either version 2 of the License, or
+ *  (at your option) any later version.
+ *
+ *  This program is distributed in the hope that it will be useful,
+ *  but WITHOUT ANY WARRANTY; without even the implied warranty of
+ *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ *  GNU General Public License for more details.
+ *
+ *  You should have received a copy of the GNU General Public License
+ *  along with this program; if not, see <http://www.gnu.org/licenses/>.
+ *
+ *  ARM Semihosting is documented in:
+ *     Semihosting for AArch32 and AArch64 Release 2.0
+ *     https://static.docs.arm.com/100863/0200/semihosting.pdf
+ *
+ */
+
+#ifndef COMMON_SEMI_H
+#define COMMON_SEMI_H
+
+target_ulong do_common_semihosting(CPUState *cs);
+
+#endif /* COMMON_SEMI_H */
diff --git a/linux-user/aarch64/cpu_loop.c b/linux-user/aarch64/cpu_loop.c
index bbe9fefca8..42b9c15f53 100644
--- a/linux-user/aarch64/cpu_loop.c
+++ b/linux-user/aarch64/cpu_loop.c
@@ -22,6 +22,7 @@
 #include "qemu.h"
 #include "cpu_loop-common.h"
 #include "qemu/guest-random.h"
+#include "hw/semihosting/common-semi.h"
 
 #define get_user_code_u32(x, gaddr, env)                \
     ({ abi_long __r = get_user_u32((x), (gaddr));       \
@@ -129,7 +130,7 @@ void cpu_loop(CPUARMState *env)
             queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
             break;
         case EXCP_SEMIHOST:
-            env->xregs[0] = do_arm_semihosting(env);
+            env->xregs[0] = do_common_semihosting(cs);
             env->pc += 4;
             break;
         case EXCP_YIELD:
diff --git a/linux-user/arm/cpu_loop.c b/linux-user/arm/cpu_loop.c
index 3d272b56ef..cadfb7fa43 100644
--- a/linux-user/arm/cpu_loop.c
+++ b/linux-user/arm/cpu_loop.c
@@ -22,6 +22,7 @@
 #include "qemu.h"
 #include "elf.h"
 #include "cpu_loop-common.h"
+#include "hw/semihosting/common-semi.h"
 
 #define get_user_code_u32(x, gaddr, env)                \
     ({ abi_long __r = get_user_u32((x), (gaddr));       \
@@ -421,7 +422,7 @@ void cpu_loop(CPUARMState *env)
             }
             break;
         case EXCP_SEMIHOST:
-            env->regs[0] = do_arm_semihosting(env);
+            env->regs[0] = do_common_semihosting(cs);
             env->regs[15] += env->thumb ? 2 : 4;
             break;
         case EXCP_INTERRUPT:
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 7e6c881a7e..49d9a314db 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1068,14 +1068,6 @@ static inline void aarch64_sve_change_el(CPUARMState *env, int o,
 static inline void aarch64_add_sve_properties(Object *obj) { }
 #endif
 
-#if !defined(CONFIG_TCG)
-static inline target_ulong do_arm_semihosting(CPUARMState *env)
-{
-    g_assert_not_reached();
-}
-#else
-target_ulong do_arm_semihosting(CPUARMState *env);
-#endif
 void aarch64_sync_32_to_64(CPUARMState *env);
 void aarch64_sync_64_to_32(CPUARMState *env);
 
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 7b8bcd6903..9e0bbc1e90 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -34,6 +34,7 @@
 #ifdef CONFIG_TCG
 #include "arm_ldst.h"
 #include "exec/cpu_ldst.h"
+#include "hw/semihosting/common-semi.h"
 #endif
 
 #define ARM_CPU_FREQ 1000000000 /* FIXME: 1 GHz, should be configurable */
@@ -9879,13 +9880,13 @@ static void handle_semihosting(CPUState *cs)
         qemu_log_mask(CPU_LOG_INT,
                       "...handling as semihosting call 0x%" PRIx64 "\n",
                       env->xregs[0]);
-        env->xregs[0] = do_arm_semihosting(env);
+        env->xregs[0] = do_common_semihosting(cs);
         env->pc += 4;
     } else {
         qemu_log_mask(CPU_LOG_INT,
                       "...handling as semihosting call 0x%x\n",
                       env->regs[0]);
-        env->regs[0] = do_arm_semihosting(env);
+        env->regs[0] = do_common_semihosting(cs);
         env->regs[15] += env->thumb ? 2 : 4;
     }
 }
diff --git a/target/arm/m_helper.c b/target/arm/m_helper.c
index 643dcafb83..6176003029 100644
--- a/target/arm/m_helper.c
+++ b/target/arm/m_helper.c
@@ -31,6 +31,7 @@
 #ifdef CONFIG_TCG
 #include "arm_ldst.h"
 #include "exec/cpu_ldst.h"
+#include "hw/semihosting/common-semi.h"
 #endif
 
 static void v7m_msr_xpsr(CPUARMState *env, uint32_t mask,
@@ -2306,7 +2307,11 @@ void arm_v7m_cpu_do_interrupt(CPUState *cs)
         qemu_log_mask(CPU_LOG_INT,
                       "...handling as semihosting call 0x%x\n",
                       env->regs[0]);
-        env->regs[0] = do_arm_semihosting(env);
+#ifdef CONFIG_TCG
+        env->regs[0] = do_common_semihosting(cs);
+#else
+        g_assert_not_reached();
+#endif
         env->regs[15] += env->thumb ? 2 : 4;
         return;
     case EXCP_BKPT:
-- 
2.29.2
