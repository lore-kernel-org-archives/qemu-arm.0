Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp770735lfa;
        Wed, 28 Oct 2020 11:57:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwIHmaR/DtqjzoE2zr0tS3DDbXhZBONq0k1RPRf0wFOTq+D0E41ctQhJQfbgS2VZuboPR+1
X-Received: by 2002:a63:4960:: with SMTP id y32mr668310pgk.369.1603911458548;
        Wed, 28 Oct 2020 11:57:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603911458; cv=none;
        d=google.com; s=arc-20160816;
        b=qlQ0MK1/nIwps+6YAiKDImxZCOD89PJyztFQIf4eb6INDLSK8LZUkwWZA6xYQ2jpiS
         uG29ldskjGgzFZAFWyKctfDwm+nk1zykvBqtOJS73nWCcPKaOma5fo5fH9tvr2JWwMZS
         NQiDvxUdF4N3oM+afyr48rH8vnOb4q0C8qfZgj9n29CiLas5VvmQVn3L/hzzSFGh0St1
         uadcjc7CayUUWt08F9gQR5rx/2dAiZ8YrtM591h7kMNlvD27rpH6Mq+m4RYgn2DNlNYY
         joDHFcHBwV/uHAQsfEDJK9N10N8n8HOLU7rzyjcbmF/crVBtKidKAUciW2878IFiap3n
         dU8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:dkim-signature;
        bh=eUs8xKFsku30Hcyufi6svnEAD+rV2cKe7aSXwOI12eM=;
        b=PNu7TLdVROH9hy0UVksnTJjaJaDTlWqeKTtXhKKMTLZZ/2jnT6CYhGq6svAqXTYDc6
         1VypED70OEPuAzjqO6nClqRMU7DLCaAn0Zk7M84GwJSq7vUvRSzLa4/SXT7nLEWmcp/K
         3d5EtMMkyyA69vcxt2mU6zjUzwHfjqr664Qaf79ljzNdLAlXeWVu5f9rJnvXFlAbpteR
         4woREp2uKgBlrPbYGBTp/g3qbA6yPR727cbVonXRjgF6Red8dPlPDkh8uQ+Ki4wBMDiP
         VlRwH2ccETqkQ2bZmTP3HJgMpg0brU0cF49cu3Y1zAcicz7UymfRZw7FpCv44auXcNax
         ya5w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@keithp.com header.s=mail header.b=oNQDCWW5;
       dkim=pass header.i=@keithp.com header.s=mail header.b=nzyNj0Yn;
       spf=pass (google.com: domain of keithp@keithp.com designates 63.227.221.253 as permitted sender) smtp.mailfrom=keithp@keithp.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=keithp.com
Return-Path: <keithp@keithp.com>
Received: from elaine.keithp.com (home.keithp.com. [63.227.221.253])
        by mx.google.com with ESMTPS id f1si227588plj.264.2020.10.28.11.57.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2020 11:57:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of keithp@keithp.com designates 63.227.221.253 as permitted sender) client-ip=63.227.221.253;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@keithp.com header.s=mail header.b=oNQDCWW5;
       dkim=pass header.i=@keithp.com header.s=mail header.b=nzyNj0Yn;
       spf=pass (google.com: domain of keithp@keithp.com designates 63.227.221.253 as permitted sender) smtp.mailfrom=keithp@keithp.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=keithp.com
Received: from localhost (localhost [127.0.0.1])
	by elaine.keithp.com (Postfix) with ESMTP id E51303F2DDB4;
	Wed, 28 Oct 2020 11:57:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=keithp.com; s=mail;
	t=1603911456; bh=4pwdaiTLWI0Ilmi2DoQB90QNFyqA2Q3wdiX2Yv9BCfY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=oNQDCWW5sIw3EzxMcoN1xoxEArigPHrg2TdkuQNCZP03NFgmkJSmuvPtMinQgeyDL
	 ASu8nKMQqMhVNj+ITBbD5lSeqEsvsPuX58u9cgi5fhNQKRC0E6f9U3tEpgJif9YQR0
	 ZzH4XJLY22qORAPIcrTXW/zL//OxcUEUnFYXJVniB7W7PbJO00iz6BbIU1vm8qFM89
	 8F6Ew/KWruaRZaqKL8yWZ3oSXabNn6pomtttYshpWlJZv00q0jQBlBneABtLvOhLyF
	 rnWhsMwy80Yf+iUUjcADuuJlk9E+5PUChDHHPDzaY99qVvJZnXSTHEQmctX0euY0fJ
	 LC861zjFd+6fQ==
X-Virus-Scanned: Debian amavisd-new at keithp.com
Received: from elaine.keithp.com ([127.0.0.1])
	by localhost (elaine.keithp.com [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id citFJ3wb0b66; Wed, 28 Oct 2020 11:57:36 -0700 (PDT)
Received: from keithp.com (koto.keithp.com [10.0.0.2])
	by elaine.keithp.com (Postfix) with ESMTPSA id 765593F2DDAF;
	Wed, 28 Oct 2020 11:57:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=keithp.com; s=mail;
	t=1603911453; bh=4pwdaiTLWI0Ilmi2DoQB90QNFyqA2Q3wdiX2Yv9BCfY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nzyNj0YnlnxUtdmrKNIouyqDh0oehUwTVkK2M+xcI5RCJDDdnI9bNPY2pCofwrWz1
	 EkjAKWF5t+5L3FtCI/Fzee+LmtzQoU9lpPl95dY3LLrTGsS/03B/TbNBFFnS34e/7h
	 CrlCIDoyRzqdVS+mS8fIkOQaSRcJJ74bKQYf+3opQ3vYwEeJnv0BridbrRAl5+GEJG
	 7FLDL3ngSrqcAMYcLP9MbIvOt+kCOIboWgFKHmzuvpIS/5yqWV/w/dJapbqy+UKCwE
	 et+QGqTQHAJwLBpO+R7lCKYZ0sKj0wKdhnFrSYJeL/qJuIQLViAz/tFKlUqvX3i8Ue
	 tgD5vrpOOxzUw==
Received: by keithp.com (Postfix, from userid 1000)
	id 376CD1582212; Wed, 28 Oct 2020 11:57:33 -0700 (PDT)
From: Keith Packard <keithp@keithp.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Laurent Vivier <laurent@vivier.eu>,
	Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alistair Francis <Alistair.Francis@wdc.com>,
	Sagar Karandikar <sagark@eecs.berkeley.edu>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	qemu-riscv@nongnu.org,
	Keith Packard <keithp@keithp.com>
Subject: [PATCH 2/4] semihosting: Change common-semi API to be architecture-independent
Date: Wed, 28 Oct 2020 11:57:20 -0700
Message-Id: <20201028185722.2783532-3-keithp@keithp.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201028185722.2783532-1-keithp@keithp.com>
References: <20201028185722.2783532-1-keithp@keithp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 4DVaxhOySt7D

The public API is now defined in
hw/semihosting/common-semi.h. do_common_semihosting takes CPUState *
instead of CPUARMState *. All internal functions have been renamed
common_semi_ instead of arm_semi_ or arm_. Aside from the API change,
there are no functional changes in this patch.

Signed-off-by: Keith Packard <keithp@keithp.com>
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
index 8718fd0194..e0c59bc599 100644
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
@@ -371,12 +375,12 @@ static target_ulong arm_gdb_syscall(ARMCPU *cpu, gdb_syscall_complete_cb cb,
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
 
@@ -673,10 +677,10 @@ static const GuestFDFunctions guestfd_fns[] = {
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
index 13629ee1f6..31dbb4d1af 100644
--- a/linux-user/arm/cpu_loop.c
+++ b/linux-user/arm/cpu_loop.c
@@ -22,6 +22,7 @@
 #include "qemu.h"
 #include "elf.h"
 #include "cpu_loop-common.h"
+#include "hw/semihosting/common-semi.h"
 
 #define get_user_code_u32(x, gaddr, env)                \
     ({ abi_long __r = get_user_u32((x), (gaddr));       \
@@ -393,7 +394,7 @@ void cpu_loop(CPUARMState *env)
             }
             break;
         case EXCP_SEMIHOST:
-            env->regs[0] = do_arm_semihosting(env);
+            env->regs[0] = do_common_semihosting(cs);
             env->regs[15] += env->thumb ? 2 : 4;
             break;
         case EXCP_INTERRUPT:
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 49cd5cabcf..c7ece27c56 100644
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
index 97bb6b8c01..8dbb0ef5d3 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -34,6 +34,7 @@
 #ifdef CONFIG_TCG
 #include "arm_ldst.h"
 #include "exec/cpu_ldst.h"
+#include "hw/semihosting/common-semi.h"
 #endif
 
 #define ARM_CPU_FREQ 1000000000 /* FIXME: 1 GHz, should be configurable */
@@ -9889,13 +9890,13 @@ static void handle_semihosting(CPUState *cs)
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
index 036454234c..ef897382de 100644
--- a/target/arm/m_helper.c
+++ b/target/arm/m_helper.c
@@ -31,6 +31,7 @@
 #ifdef CONFIG_TCG
 #include "arm_ldst.h"
 #include "exec/cpu_ldst.h"
+#include "hw/semihosting/common-semi.h"
 #endif
 
 static void v7m_msr_xpsr(CPUARMState *env, uint32_t mask,
@@ -2188,7 +2189,11 @@ void arm_v7m_cpu_do_interrupt(CPUState *cs)
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
2.28.0
