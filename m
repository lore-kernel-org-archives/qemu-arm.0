Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp3225185lfa;
        Mon, 26 Oct 2020 14:29:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyw7DeW8+wN4aRLQk2fDMwDG8bv3put7lyXKi/wHSus+yoZZBKLBWJ+Uk//4dm67oYk3bO7
X-Received: by 2002:a62:7e44:0:b029:163:f1c3:3b32 with SMTP id z65-20020a627e440000b0290163f1c33b32mr4300616pfc.62.1603747753249;
        Mon, 26 Oct 2020 14:29:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603747753; cv=none;
        d=google.com; s=arc-20160816;
        b=rxhl2ll9LV2MrPoex7dPtlUQllXZe00Wosr5uL8yUsksdingYNXyy+zW5kAwkPcybR
         dY23eBjtMQ6GZMDLVhDAHtHGKDIpH2+jVR2QbE9IZ3iiavEY7i7jeGYd2+EjAy9gPUeR
         aUrxLiwIozFOTPsV0QL9bkSRRJzqte0Z5Jk6Hw7vnXd9WK1pHOHJiU1ai0lUiJ1a4zod
         lXd5heySfJfAnJVJiCqV57n4gMfLQNFVXHWOX4HIxRCAPiobm0q+YuTHyJoT3hoKUrz+
         85eMlayzex6DJXQV4OE6Nt0iP8elBAIqRWcaDFwyU8NFanwl2FpVyZMCzEEgcrM0uemb
         Vzvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:dkim-signature;
        bh=Iw0aZF+zzAoLnjXo7nHO6WjkMiBd6TLlRDMubpdyS6k=;
        b=SwklOOptlERkQjCzegWc3wXjyKKoki8JECqA6AOJ2C9LNdgHVT8VA4jszb5p8TaFuN
         fBmDNdM2waX9JKybRrZ8wZ/N3BJaxEQV3+a9YfWlMhbGa+05OccysqAfmCZrMpCQs84n
         IvoSaK0ckxSdFoMHlFxU5fxz3H7MutT+0EYDmhKjD/KZj9OLcXv9/ErpnkJFA3ClQfvD
         +JTndrJ9YDajmlqfUHRzuLLweNvAWsmFpR3XDdnpfLu9l33rS6rxezRQB9PgBuAkpWpm
         BYO4xspkT/2/YM8JTIlHoSOdv0lPuxYaYkqp06vSk/zo2Ur5jWgoMAcfG9W1KKt1xQq2
         XlNA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@keithp.com header.s=mail header.b=PrwpeAsA;
       dkim=pass header.i=@keithp.com header.s=mail header.b=BGEItVVi;
       spf=pass (google.com: domain of keithp@keithp.com designates 63.227.221.253 as permitted sender) smtp.mailfrom=keithp@keithp.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=keithp.com
Return-Path: <keithp@keithp.com>
Received: from elaine.keithp.com (home.keithp.com. [63.227.221.253])
        by mx.google.com with ESMTPS id 11si10365787pll.365.2020.10.26.14.29.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2020 14:29:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of keithp@keithp.com designates 63.227.221.253 as permitted sender) client-ip=63.227.221.253;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@keithp.com header.s=mail header.b=PrwpeAsA;
       dkim=pass header.i=@keithp.com header.s=mail header.b=BGEItVVi;
       spf=pass (google.com: domain of keithp@keithp.com designates 63.227.221.253 as permitted sender) smtp.mailfrom=keithp@keithp.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=keithp.com
Received: from localhost (localhost [127.0.0.1])
	by elaine.keithp.com (Postfix) with ESMTP id 751D33F2DD61;
	Mon, 26 Oct 2020 14:29:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=keithp.com; s=mail;
	t=1603747751; bh=JdwJchkLGSkykH3EJoL5EjeZLPkf7Mfy2WmEeU/JlCA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PrwpeAsAPGrDalhX7996VQkdk973Jz8BnaAbJv2JAJFE1R7GQQj19szjSVGF2Th33
	 TKhKKdlZZd+8lFgI3rsHA/5PavlYpIZQqszMIM6Unw61r4qNj7ZH5+j7/uj177BE24
	 24IKiVWh6lZmTq9jQbMkpVKCKwfVpKla8uptOnDmxp35IVakxiFYN3OsjYZwVg25P7
	 wsAjOCmsbeucJdoDb0SOVHhloSb6u6fsL/TiKeQVyZj3XxE8Kiku4msBh/XoksloBh
	 UDrPXdgX348Frxwu9GD7eGRcLh0Q6H0sEn6b/h3bSjde7Nrbu2iwA6bGXPrBNI8Pjs
	 pufnUQ8wlZzRA==
X-Virus-Scanned: Debian amavisd-new at keithp.com
Received: from elaine.keithp.com ([127.0.0.1])
	by localhost (elaine.keithp.com [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id x68ILsHY1TNo; Mon, 26 Oct 2020 14:29:10 -0700 (PDT)
Received: from keithp.com (koto.keithp.com [10.0.0.2])
	by elaine.keithp.com (Postfix) with ESMTPSA id C26943F2DD64;
	Mon, 26 Oct 2020 14:29:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=keithp.com; s=mail;
	t=1603747749; bh=JdwJchkLGSkykH3EJoL5EjeZLPkf7Mfy2WmEeU/JlCA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BGEItVVi8ujN/6eK8Q9ukuZik9Rux6nN30DvK8L0l58aOHv7bsI3NV0CyoSiRvLXS
	 pJbbSq/bFSq+MW+sAaly76OVQnT04R07afzi0wjyiD8Jt5jOAxVnB1tFddgeGQ88Nr
	 xVI5ha07yDVpk89U30ZZ0H/xWR3UWz3NA836vtVGuvZE8A1EkmNvh1Ti+/uLMLXr0N
	 33pKnQb595iX1eG2NgnxpP7JqiqUtIPktvpLvHY0q/ZiPxMX/TwLVf7mDNs6XFOmX+
	 +lOxFIbYYyr7trqRKKGuXJTNmchFwvI9NrRmFBrbX9hGDKan6qnkyHgxoRQaWAAWXm
	 cqwrHsQ4g2Wtg==
Received: by keithp.com (Postfix, from userid 1000)
	id A48D9158225B; Mon, 26 Oct 2020 14:29:09 -0700 (PDT)
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
Subject: [PATCH 4/4] riscv: Add semihosting support [v10]
Date: Mon, 26 Oct 2020 14:28:53 -0700
Message-Id: <20201026212853.92880-5-keithp@keithp.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201026212853.92880-1-keithp@keithp.com>
References: <20201026212853.92880-1-keithp@keithp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: x1j4mcrNPoLc

Adapt the arm semihosting support code for RISCV. This implementation
is based on the standard for RISC-V semihosting version 0.2 as
documented in

   https://github.com/riscv/riscv-semihosting-spec/releases/tag/0.2

Signed-off-by: Keith Packard <keithp@keithp.com>

---

v2:
	Update PC after exception is handled to follow
	change in the ARM version for SYS_READC

v3:
	Disallow semihosting in user mode; report a regular
	breakpoint in that case.

v4:
	Fix errors reported by checkpatch

v5:
	Reference current RISC-V semihosting specification

v6:
	Add support for semihosting in riscv64-linux-user and
	riscv32-linux-user

v7:
	Add meson build support

v8:
	Fix errors reported by checkpatch that crept in.

v9:
	Changes suggested by Alistair Francis <alistair23@gmail.com>:
	Don't add me to the MAINTAINERS file.
	Remove duplicate #include in target/riscv/cpu.h
	Reference RISC-V semihosting spec in target/riscv/riscv-semi.c

v10:
	Use common semihosting implementation instead of a separate copy.

	Make sure addresses of the three breakpoint-signaling
	instructions all lie within the same page. Change suggested by
	Richard Henderson <richard.henderson@linaro.org>
---
 default-configs/devices/riscv32-softmmu.mak   |  1 +
 default-configs/devices/riscv64-softmmu.mak   |  1 +
 hw/semihosting/common-semi.c                  | 51 ++++++++++++++++++-
 hw/semihosting/common-semi.h                  |  5 +-
 hw/semihosting/meson.build                    |  2 +
 linux-user/meson.build                        |  3 ++
 linux-user/qemu.h                             |  4 +-
 linux-user/semihost.c                         |  8 +--
 qemu-options.hx                               | 10 ++--
 target/riscv/cpu_bits.h                       |  1 +
 target/riscv/cpu_helper.c                     | 10 ++++
 .../riscv/insn_trans/trans_privileged.c.inc   | 37 +++++++++++++-
 target/riscv/translate.c                      | 11 ++++
 13 files changed, 132 insertions(+), 12 deletions(-)

diff --git a/default-configs/devices/riscv32-softmmu.mak b/default-configs/devices/riscv32-softmmu.mak
index 94a236c9c2..e8a4eeebec 100644
--- a/default-configs/devices/riscv32-softmmu.mak
+++ b/default-configs/devices/riscv32-softmmu.mak
@@ -3,6 +3,7 @@
 # Uncomment the following lines to disable these optional devices:
 #
 #CONFIG_PCI_DEVICES=n
+CONFIG_SEMIHOSTING=y
 
 # Boards:
 #
diff --git a/default-configs/devices/riscv64-softmmu.mak b/default-configs/devices/riscv64-softmmu.mak
index 76b6195648..d8a87b7671 100644
--- a/default-configs/devices/riscv64-softmmu.mak
+++ b/default-configs/devices/riscv64-softmmu.mak
@@ -3,6 +3,7 @@
 # Uncomment the following lines to disable these optional devices:
 #
 #CONFIG_PCI_DEVICES=n
+CONFIG_SEMIHOSTING=y
 
 # Boards:
 #
diff --git a/hw/semihosting/common-semi.c b/hw/semihosting/common-semi.c
index c77fb21bec..8675934a71 100644
--- a/hw/semihosting/common-semi.c
+++ b/hw/semihosting/common-semi.c
@@ -1,6 +1,6 @@
 /*
  *  Semihosting support for systems modeled on the Arm "Angel"
- *  semihosting syscalls design.
+ *  semihosting syscalls design. This includes Arm and RISC-V processors
  *
  *  Copyright (c) 2005, 2007 CodeSourcery.
  *  Copyright (c) 2019 Linaro
@@ -25,6 +25,10 @@
  *  ARM Semihosting is documented in:
  *     Semihosting for AArch32 and AArch64 Release 2.0
  *     https://static.docs.arm.com/100863/0200/semihosting.pdf
+ *
+ *  RISC-V Semihosting is documented in:
+ *     RISC-V Semihosting
+ *     https://github.com/riscv/riscv-semihosting-spec/blob/main/riscv-semihosting-spec.adoc
  */
 
 #include "qemu/osdep.h"
@@ -163,6 +167,30 @@ common_semi_sys_exit_extended(CPUState *cs, int nr)
 }
 #endif /* TARGET_ARM */
 
+#ifdef TARGET_RISCV
+static inline target_ulong
+common_semi_arg(CPUState *cs, int argno)
+{
+    RISCVCPU *cpu = RISCV_CPU(cs);
+    CPURISCVState *env = &cpu->env;
+    return env->gpr[xA0 + argno];
+}
+
+static inline void
+common_semi_set_ret(CPUState *cs, target_ulong ret)
+{
+    RISCVCPU *cpu = RISCV_CPU(cs);
+    CPURISCVState *env = &cpu->env;
+    env->gpr[xA0] = ret;
+}
+
+static inline bool
+common_semi_sys_exit_extended(CPUState *cs, int nr)
+{
+    return (nr == TARGET_SYS_EXIT_EXTENDED || sizeof(target_ulong) == 0);
+}
+#endif
+
 /*
  * Allocate a new guest file descriptor and return it; if we
  * couldn't allocate a new fd then return -1.
@@ -339,6 +367,12 @@ static target_ulong common_semi_flen_buf(CPUState *cs)
         sp = env->regs[13];
     }
 #endif
+#ifdef TARGET_RISCV
+    RISCVCPU *cpu = RISCV_CPU(cs);
+    CPURISCVState *env = &cpu->env;
+
+    sp = env->gpr[xSP];
+#endif
 
     return sp - 64;
 }
@@ -678,6 +712,18 @@ static const GuestFDFunctions guestfd_fns[] = {
      put_user_u32(val, args + (n) * 4))
 #endif
 
+#ifdef TARGET_RISCV
+#define GET_ARG(n) do {                                                 \
+        if (get_user_ual(arg ## n, args + (n) * sizeof(target_ulong))) { \
+            errno = EFAULT;                                             \
+            return set_swi_errno(cs, -1);                              \
+        }                                                               \
+    } while (0)
+
+#define SET_ARG(n, val)                                 \
+    put_user_ual(val, args + (n) * sizeof(target_ulong))
+#endif
+
 /*
  * Do a semihosting call.
  *
@@ -1112,6 +1158,9 @@ target_ulong do_common_semihosting(CPUState *cs)
         if (is_a64(cs->env_ptr)) {
             return 0;
         }
+#endif
+#ifdef TARGET_RISCV
+        return 0;
 #endif
         /* fall through -- invalid for A32/T32 */
     default:
diff --git a/hw/semihosting/common-semi.h b/hw/semihosting/common-semi.h
index bc53e92c79..0bfab1c669 100644
--- a/hw/semihosting/common-semi.h
+++ b/hw/semihosting/common-semi.h
@@ -1,6 +1,6 @@
 /*
  *  Semihosting support for systems modeled on the Arm "Angel"
- *  semihosting syscalls design.
+ *  semihosting syscalls design. This includes Arm and RISC-V processors
  *
  *  Copyright (c) 2005, 2007 CodeSourcery.
  *  Copyright (c) 2019 Linaro
@@ -26,6 +26,9 @@
  *     Semihosting for AArch32 and AArch64 Release 2.0
  *     https://static.docs.arm.com/100863/0200/semihosting.pdf
  *
+ *  RISC-V Semihosting is documented in:
+ *     RISC-V Semihosting
+ *     https://github.com/riscv/riscv-semihosting-spec/blob/main/riscv-semihosting-spec.adoc
  */
 
 #ifndef COMMON_SEMI_H
diff --git a/hw/semihosting/meson.build b/hw/semihosting/meson.build
index fbd2841e59..48a6c9b3e5 100644
--- a/hw/semihosting/meson.build
+++ b/hw/semihosting/meson.build
@@ -4,3 +4,5 @@ specific_ss.add(when: 'CONFIG_SEMIHOSTING', if_true: files(
 ))
 
 specific_ss.add(when: 'CONFIG_TCG', if_true: files ('common-semi.c'))
+specific_ss.add(when: 'TARGET_RISCV32', if_true: files ('common-semi.c'))
+specific_ss.add(when: 'TARGET_RISCV64', if_true: files ('common-semi.c'))
diff --git a/linux-user/meson.build b/linux-user/meson.build
index 2fdd12cee5..68fce095fb 100644
--- a/linux-user/meson.build
+++ b/linux-user/meson.build
@@ -20,6 +20,9 @@ linux_user_ss.add(when: 'TARGET_I386', if_true: files('vm86.c'))
 linux_user_ss.add(when: 'TARGET_AARCH64', if_true: files('semihost.c'))
 linux_user_ss.add(when: 'TARGET_ARM', if_true: files('semihost.c'))
 
+linux_user_ss.add(when: 'TARGET_RISCV64', if_true: files('semihost.c'))
+linux_user_ss.add(when: 'TARGET_RISCV32', if_true: files('semihost.c'))
+
 syscall_nr_generators = {}
 
 subdir('alpha')
diff --git a/linux-user/qemu.h b/linux-user/qemu.h
index 941ca99722..faeaab9614 100644
--- a/linux-user/qemu.h
+++ b/linux-user/qemu.h
@@ -105,6 +105,8 @@ typedef struct TaskState {
     /* FPA state */
     FPA11 fpa;
 # endif
+#endif
+#if defined(TARGET_ARM) || defined(TARGET_RISCV)
     int swi_errno;
 #endif
 #if defined(TARGET_I386) && !defined(TARGET_X86_64)
@@ -118,7 +120,7 @@ typedef struct TaskState {
 #ifdef TARGET_M68K
     abi_ulong tp_value;
 #endif
-#if defined(TARGET_ARM) || defined(TARGET_M68K)
+#if defined(TARGET_ARM) || defined(TARGET_M68K) || defined(TARGET_RISCV)
     /* Extra fields for semihosted binaries.  */
     abi_ulong heap_base;
     abi_ulong heap_limit;
diff --git a/linux-user/semihost.c b/linux-user/semihost.c
index a1f0f6050e..c0015ee7f6 100644
--- a/linux-user/semihost.c
+++ b/linux-user/semihost.c
@@ -1,11 +1,11 @@
 /*
- * ARM Semihosting Console Support
+ * ARM Compatible Semihosting Console Support.
  *
  * Copyright (c) 2019 Linaro Ltd
  *
- * Currently ARM is unique in having support for semihosting support
- * in linux-user. So for now we implement the common console API but
- * just for arm linux-user.
+ * Currently ARM and RISC-V are unique in having support for
+ * semihosting support in linux-user. So for now we implement the
+ * common console API but just for arm and risc-v linux-user.
  *
  * SPDX-License-Identifier: GPL-2.0-or-later
  */
diff --git a/qemu-options.hx b/qemu-options.hx
index 2c83390504..9a606946c4 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -4184,10 +4184,10 @@ ERST
 DEF("semihosting", 0, QEMU_OPTION_semihosting,
     "-semihosting    semihosting mode\n",
     QEMU_ARCH_ARM | QEMU_ARCH_M68K | QEMU_ARCH_XTENSA | QEMU_ARCH_LM32 |
-    QEMU_ARCH_MIPS | QEMU_ARCH_NIOS2)
+    QEMU_ARCH_MIPS | QEMU_ARCH_NIOS2 | QEMU_ARCH_RISCV)
 SRST
 ``-semihosting``
-    Enable semihosting mode (ARM, M68K, Xtensa, MIPS, Nios II only).
+    Enable semihosting mode (ARM, M68K, Xtensa, MIPS, Nios II, RISC-V only).
 
     Note that this allows guest direct access to the host filesystem, so
     should only be used with a trusted guest OS.
@@ -4199,10 +4199,10 @@ DEF("semihosting-config", HAS_ARG, QEMU_OPTION_semihosting_config,
     "-semihosting-config [enable=on|off][,target=native|gdb|auto][,chardev=id][,arg=str[,...]]\n" \
     "                semihosting configuration\n",
 QEMU_ARCH_ARM | QEMU_ARCH_M68K | QEMU_ARCH_XTENSA | QEMU_ARCH_LM32 |
-QEMU_ARCH_MIPS | QEMU_ARCH_NIOS2)
+QEMU_ARCH_MIPS | QEMU_ARCH_NIOS2 | QEMU_ARCH_RISCV)
 SRST
 ``-semihosting-config [enable=on|off][,target=native|gdb|auto][,chardev=id][,arg=str[,...]]``
-    Enable and configure semihosting (ARM, M68K, Xtensa, MIPS, Nios II
+    Enable and configure semihosting (ARM, M68K, Xtensa, MIPS, Nios II, RISC-V
     only).
 
     Note that this allows guest direct access to the host filesystem, so
@@ -4217,6 +4217,8 @@ SRST
     open/read/write/seek/select. Tensilica baremetal libc for ISS and
     linux platform "sim" use this interface.
 
+    On RISC-V this implements the standard semihosting API, version 0.2.
+
     ``target=native|gdb|auto``
         Defines where the semihosting calls will be addressed, to QEMU
         (``native``) or to GDB (``gdb``). The default is ``auto``, which
diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
index bd36062877..26a60b9e27 100644
--- a/target/riscv/cpu_bits.h
+++ b/target/riscv/cpu_bits.h
@@ -556,6 +556,7 @@
 #define RISCV_EXCP_INST_PAGE_FAULT               0xc /* since: priv-1.10.0 */
 #define RISCV_EXCP_LOAD_PAGE_FAULT               0xd /* since: priv-1.10.0 */
 #define RISCV_EXCP_STORE_PAGE_FAULT              0xf /* since: priv-1.10.0 */
+#define RISCV_EXCP_SEMIHOST                      0x10
 #define RISCV_EXCP_INST_GUEST_PAGE_FAULT         0x14
 #define RISCV_EXCP_LOAD_GUEST_ACCESS_FAULT       0x15
 #define RISCV_EXCP_VIRT_INSTRUCTION_FAULT        0x16
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 4652082df1..d71611ec02 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -24,6 +24,7 @@
 #include "exec/exec-all.h"
 #include "tcg/tcg-op.h"
 #include "trace.h"
+#include "hw/semihosting/common-semi.h"
 
 int riscv_cpu_mmu_index(CPURISCVState *env, bool ifetch)
 {
@@ -875,6 +876,15 @@ void riscv_cpu_do_interrupt(CPUState *cs)
     target_ulong htval = 0;
     target_ulong mtval2 = 0;
 
+    if  (cause == RISCV_EXCP_SEMIHOST) {
+        if (env->priv >= PRV_S) {
+            env->gpr[xA0] = do_common_semihosting(cs);
+            env->pc += 4;
+            return;
+        }
+        cause = RISCV_EXCP_BREAKPOINT;
+    }
+
     if (!async) {
         /* set tval to badaddr for traps with address information */
         switch (cause) {
diff --git a/target/riscv/insn_trans/trans_privileged.c.inc b/target/riscv/insn_trans/trans_privileged.c.inc
index 2a61a853bf..32312be202 100644
--- a/target/riscv/insn_trans/trans_privileged.c.inc
+++ b/target/riscv/insn_trans/trans_privileged.c.inc
@@ -29,7 +29,42 @@ static bool trans_ecall(DisasContext *ctx, arg_ecall *a)
 
 static bool trans_ebreak(DisasContext *ctx, arg_ebreak *a)
 {
-    generate_exception(ctx, RISCV_EXCP_BREAKPOINT);
+    target_ulong    ebreak_addr = ctx->base.pc_next;
+    target_ulong    pre_addr = ebreak_addr - 4;
+    target_ulong    post_addr = ebreak_addr + 4;
+    uint32_t pre    = 0;
+    uint32_t ebreak = 0;
+    uint32_t post   = 0;
+
+    /*
+     * The RISC-V semihosting spec specifies the following
+     * three-instruction sequence to flag a semihosting call:
+     *
+     *      slli zero, zero, 0x1f       0x01f01013
+     *      ebreak                      0x00100073
+     *      srai zero, zero, 0x7        0x40705013
+     *
+     * The two shift operations on the zero register are no-ops, used
+     * here to signify a semihosting exception, rather than a breakpoint.
+     *
+     * Uncompressed instructions are required so that the sequence is easy
+     * to validate.
+     *
+     * The three instructions are required to lie in the same page so
+     * that no exception will be raised when fetching them.
+     */
+
+    if ((pre_addr & TARGET_PAGE_MASK) == (post_addr & TARGET_PAGE_MASK)) {
+        pre    = opcode_at(&ctx->base, pre_addr);
+        ebreak = opcode_at(&ctx->base, ebreak_addr);
+        post   = opcode_at(&ctx->base, post_addr);
+    }
+
+    if  (pre == 0x01f01013 && ebreak == 0x00100073 && post == 0x40705013) {
+        generate_exception(ctx, RISCV_EXCP_SEMIHOST);
+    } else {
+        generate_exception(ctx, RISCV_EXCP_BREAKPOINT);
+    }
     exit_tb(ctx); /* no chaining */
     ctx->base.is_jmp = DISAS_NORETURN;
     return true;
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 79dca2291b..ecf594babc 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -63,6 +63,7 @@ typedef struct DisasContext {
     uint16_t vlen;
     uint16_t mlen;
     bool vl_eq_vlmax;
+    CPUState *cs;
 } DisasContext;
 
 #ifdef TARGET_RISCV64
@@ -746,6 +747,15 @@ static bool gen_shift(DisasContext *ctx, arg_r *a,
     return true;
 }
 
+static uint32_t opcode_at(DisasContextBase *dcbase, target_ulong pc)
+{
+    DisasContext *ctx = container_of(dcbase, DisasContext, base);
+    CPUState *cpu = ctx->cs;
+    CPURISCVState *env = cpu->env_ptr;
+
+    return cpu_ldl_code(env, pc);
+}
+
 /* Include insn module translation function */
 #include "insn_trans/trans_rvi.c.inc"
 #include "insn_trans/trans_rvm.c.inc"
@@ -812,6 +822,7 @@ static void riscv_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
     ctx->lmul = FIELD_EX32(tb_flags, TB_FLAGS, LMUL);
     ctx->mlen = 1 << (ctx->sew  + 3 - ctx->lmul);
     ctx->vl_eq_vlmax = FIELD_EX32(tb_flags, TB_FLAGS, VL_EQ_VLMAX);
+    ctx->cs = cs;
 }
 
 static void riscv_tr_tb_start(DisasContextBase *db, CPUState *cpu)
-- 
2.28.0
