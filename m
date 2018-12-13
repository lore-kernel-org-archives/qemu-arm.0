Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id v5sm2174274wrn.71.2018.12.13.03.55.03
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 13 Dec 2018 03:55:04 -0800 (PST)
Received: from zen.linaroharston (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTP id 844A43E035F;
	Thu, 13 Dec 2018 11:55:03 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	mark.rutland@arm.com,
	ard.biesheuvel@linaro.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Omair Javaid <omair.javaid@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH  v1 1/2] target/arm: kvm64 make guest debug AA32 break point aware
Date: Thu, 13 Dec 2018 11:55:02 +0000
Message-Id: <20181213115503.24188-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20181213115503.24188-1-alex.bennee@linaro.org>
References: <20181213115503.24188-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 8k6eQTce0RnR

When supported by the hardware we can run AA32 guests or even AA64 EL1
code with AA32 EL0 mode code. Inserting a AA64 break point into AA32
code tends to break things. This is especially acute with gdb as it
inserts temporary breakpoints when stepping through code.

The heuristic of checking the current mode works but it's not perfect.
A user could be placing a break point in code after a mode switch and
that will still fail. However there doesn't seem to be a way to force
a hbreak by default. According to "set breakpoint auto-hw on":

  This is the default behavior. When GDB sets a breakpoint, it will try
  to use the target memory map to decide if software or hardware
  breakpoint must be used.

Reported-by: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: Omair Javaid <omair.javaid@linaro.org>
---
 target/arm/kvm64.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
index 0a502091e7..dd564a59b7 100644
--- a/target/arm/kvm64.c
+++ b/target/arm/kvm64.c
@@ -989,14 +989,20 @@ int kvm_arch_get_registers(CPUState *cs)
     return ret;
 }
 
-/* C6.6.29 BRK instruction */
+/* BRK (A64) and BKPT (A32) instructions */
 static const uint32_t brk_insn = 0xd4200000;
+static const uint32_t bkpt_insn = 0xe1200070;
 
 int kvm_arch_insert_sw_breakpoint(CPUState *cs, struct kvm_sw_breakpoint *bp)
 {
+    CPUARMState *env = &ARM_CPU(cs)->env;
+    int el = arm_current_el(env);
+    bool is_aa64 = arm_el_is_aa64(env, el);
+    const uint32_t *bpi = is_aa64 ? &brk_insn : &bkpt_insn;
+
     if (have_guest_debug) {
         if (cpu_memory_rw_debug(cs, bp->pc, (uint8_t *)&bp->saved_insn, 4, 0) ||
-            cpu_memory_rw_debug(cs, bp->pc, (uint8_t *)&brk_insn, 4, 1)) {
+            cpu_memory_rw_debug(cs, bp->pc, (uint8_t *)bpi, 4, 1)) {
             return -EINVAL;
         }
         return 0;
@@ -1012,7 +1018,7 @@ int kvm_arch_remove_sw_breakpoint(CPUState *cs, struct kvm_sw_breakpoint *bp)
 
     if (have_guest_debug) {
         if (cpu_memory_rw_debug(cs, bp->pc, (uint8_t *)&brk, 4, 0) ||
-            brk != brk_insn ||
+            !(brk == brk_insn || brk == bkpt_insn) ||
             cpu_memory_rw_debug(cs, bp->pc, (uint8_t *)&bp->saved_insn, 4, 1)) {
             return -EINVAL;
         }
@@ -1055,6 +1061,7 @@ bool kvm_arm_handle_debug(CPUState *cs, struct kvm_debug_exit_arch *debug_exit)
             return false;
         }
         break;
+    case EC_AA32_BKPT:
     case EC_AA64_BKPT:
         if (kvm_find_sw_breakpoint(cs, env->pc)) {
             return true;
-- 
2.17.1
