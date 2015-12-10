Received: by 10.182.158.201 with SMTP id ww9csp676327obb;
        Thu, 10 Dec 2015 10:48:12 -0800 (PST)
X-Received: by 10.140.234.147 with SMTP id f141mr8835815qhc.61.1449773292933;
        Thu, 10 Dec 2015 10:48:12 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w189si16048181qka.117.2015.12.10.10.48.12
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 10 Dec 2015 10:48:12 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:43933 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1a76GC-0002w5-Ko
	for alex.bennee@linaro.org; Thu, 10 Dec 2015 13:48:12 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41633)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <serge.fdrv@gmail.com>) id 1a76Fj-0002Rk-Rw
	for qemu-devel@nongnu.org; Thu, 10 Dec 2015 13:47:46 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <serge.fdrv@gmail.com>) id 1a76Fd-0003iQ-8F
	for qemu-devel@nongnu.org; Thu, 10 Dec 2015 13:47:43 -0500
Received: from mail-lb0-x241.google.com ([2a00:1450:4010:c04::241]:32898)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <serge.fdrv@gmail.com>)
	id 1a76Fc-0003hn-O1; Thu, 10 Dec 2015 13:47:37 -0500
Received: by lbbcs9 with SMTP id cs9so5290819lbb.0;
	Thu, 10 Dec 2015 10:47:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=NWHuMGRA5nZwQuSGu1yoW0N3NfhwmNEWArn7iy/Lyek=;
	b=UNXj3pBpDDIGaHmGy9FM7/mL4z4sbcN/A+hTwA6lvyrmULLleJzfkkhNWuZ82tMhn5
	JAe4np2Bf5WKbwmCctDdVLVcyRQZo8yEYZ2GexNMl/1a5FIC+w+qXMzZ0XwKySXgyddU
	YmYudCJA8zsdAneCXujpk3Lv+n34UsuejZjJgjC5ZKxx4+6EOUuQH6XhfKX6SSQ/mCTM
	bdYGVipVFFRKNr0F4WoY0UI5gEzfQk/qZGGzGXrOBgRy7hWrrPzfL0x4wwPWwmqN6mQ8
	GtkM+ks+b9yEsIvT+SCN3hmJAH4LJqR4XFtTI8j3uWIkqnBKsEXcX20WjjtI3UiPPNIM
	vZqw==
X-Received: by 10.112.146.234 with SMTP id tf10mr6048236lbb.45.1449773255567; 
	Thu, 10 Dec 2015 10:47:35 -0800 (PST)
Received: from sfedorov-laptop.Dlink (broadband-46-188-121-155.2com.net.
	[46.188.121.155]) by smtp.gmail.com with ESMTPSA id
	d130sm2580117lfe.18.2015.12.10.10.47.33
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 10 Dec 2015 10:47:34 -0800 (PST)
From: Sergey Fedorov <serge.fdrv@gmail.com>
To: qemu-devel@nongnu.org
Date: Thu, 10 Dec 2015 21:47:24 +0300
Message-Id: <1449773244-17078-1-git-send-email-serge.fdrv@gmail.com>
X-Mailer: git-send-email 1.9.1
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:4010:c04::241
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Jia Liu <proljc@gmail.com>, Anthony Green <green@moxielogic.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Alexander Graf <agraf@suse.de>, Max Filippov <jcmvbkbc@gmail.com>,
	Michael Walle <michael@walle.cc>, qemu-arm@nongnu.org,
	qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	Sergey Fedorov <serge.fdrv@gmail.com>, Guan Xuetao <gxt@mprc.pku.edu.cn>,
	Leon Alrae <leon.alrae@imgtec.com>, Aurelien Jarno <aurelien@aurel32.net>,
	Richard Henderson <rth@twiddle.net>
Subject: [Qemu-devel] [PATCH] target-*: Get rid of "PC advancement" trick
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: RE1u51sPM1uJ


The "PC advancement" trick was used just after recognizing that a
breakpoint exception was going to be generated. This trick has had two
points:
 1. Guarantee that tb->size isn't zero: there are many places where it's
    expected to be non-zero. In fact, that is even stated in the comment
    for this field.
 2. Try to satisfy disassembler's check for instruction length. To this
    end, PC advancement was done for estimated instruction length, but
    actually, didn't work properly in variable-instruction-length cases.

Substitute this trick with checking for TB size at the end of
translation. If we get an empty TB then just set tb->size to 1 and skip
disassembling. Setting tb->size to 1 is enough to get correct behaviour,
whereas an empty TB doesn't obviously need to be disassembled.

Suggested-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Sergey Fedorov <serge.fdrv@gmail.com>
---
 target-alpha/translate.c      | 15 ++++++++++-----
 target-arm/translate-a64.c    | 16 ++++++++++------
 target-arm/translate.c        | 18 ++++++++++--------
 target-cris/translate.c       | 15 ++++++++++-----
 target-i386/translate.c       | 15 ++++++++++-----
 target-lm32/translate.c       | 15 ++++++++++-----
 target-m68k/translate.c       | 15 ++++++++++-----
 target-microblaze/translate.c | 15 ++++++++++-----
 target-mips/translate.c       | 15 ++++++++++-----
 target-moxie/translate.c      | 15 ++++++++++-----
 target-openrisc/translate.c   | 15 ++++++++++-----
 target-ppc/translate.c        | 15 ++++++++++-----
 target-s390x/translate.c      | 15 ++++++++++-----
 target-sh4/translate.c        | 15 ++++++++++-----
 target-unicore32/translate.c  | 15 ++++++++++-----
 target-xtensa/translate.c     | 15 ++++++++++-----
 16 files changed, 160 insertions(+), 84 deletions(-)

diff --git a/target-alpha/translate.c b/target-alpha/translate.c
index 9909c70..d27f504 100644
--- a/target-alpha/translate.c
+++ b/target-alpha/translate.c
@@ -2917,11 +2917,6 @@ void gen_intermediate_code(CPUAlphaState *env, struct TranslationBlock *tb)
 
         if (unlikely(cpu_breakpoint_test(cs, ctx.pc, BP_ANY))) {
             ret = gen_excp(&ctx, EXCP_DEBUG, 0);
-            /* The address covered by the breakpoint must be included in
-               [tb->pc, tb->pc + tb->size) in order to for it to be
-               properly cleared -- thus we increment the PC here so that
-               the logic setting tb->size below does the right thing.  */
-            ctx.pc += 4;
             break;
         }
         if (num_insns == max_insns && (tb->cflags & CF_LAST_IO)) {
@@ -2983,6 +2978,16 @@ void gen_intermediate_code(CPUAlphaState *env, struct TranslationBlock *tb)
 
     gen_tb_end(tb, num_insns);
 
+    if (ctx.pc == pc_start) {
+        /* We have got an empty TB but there are many places where tb->size is
+         * expected it to be non-zero. Just setting it to 1 is enough to get
+         * correct behaviour.
+         */
+        tb->size = 1;
+        tb->icount = 0;
+        return;
+    }
+
     tb->size = ctx.pc - pc_start;
     tb->icount = num_insns;
 
diff --git a/target-arm/translate-a64.c b/target-arm/translate-a64.c
index 14e8131..11719f8 100644
--- a/target-arm/translate-a64.c
+++ b/target-arm/translate-a64.c
@@ -11097,12 +11097,6 @@ void gen_intermediate_code_a64(ARMCPU *cpu, TranslationBlock *tb)
                         dc->is_jmp = DISAS_UPDATE;
                     } else {
                         gen_exception_internal_insn(dc, 0, EXCP_DEBUG);
-                        /* The address covered by the breakpoint must be
-                           included in [tb->pc, tb->pc + tb->size) in order
-                           to for it to be properly cleared -- thus we
-                           increment the PC here so that the logic setting
-                           tb->size below does the right thing.  */
-                        dc->pc += 4;
                         goto done_generating;
                     }
                     break;
@@ -11213,6 +11207,16 @@ void gen_intermediate_code_a64(ARMCPU *cpu, TranslationBlock *tb)
 done_generating:
     gen_tb_end(tb, num_insns);
 
+    if (dc->pc == pc_start) {
+        /* We have got an empty TB but there are many places where tb->size is
+         * expected it to be non-zero. Just setting it to 1 is enough to get
+         * correct behaviour.
+         */
+        tb->size = 1;
+        tb->icount = 0;
+        return;
+    }
+
 #ifdef DEBUG_DISAS
     if (qemu_loglevel_mask(CPU_LOG_TB_IN_ASM)) {
         qemu_log("----------------\n");
diff --git a/target-arm/translate.c b/target-arm/translate.c
index 5d22879..07d5d02 100644
--- a/target-arm/translate.c
+++ b/target-arm/translate.c
@@ -11381,14 +11381,6 @@ void gen_intermediate_code(CPUARMState *env, TranslationBlock *tb)
                         dc->is_jmp = DISAS_UPDATE;
                     } else {
                         gen_exception_internal_insn(dc, 0, EXCP_DEBUG);
-                        /* The address covered by the breakpoint must be
-                           included in [tb->pc, tb->pc + tb->size) in order
-                           to for it to be properly cleared -- thus we
-                           increment the PC here so that the logic setting
-                           tb->size below does the right thing.  */
-                        /* TODO: Advance PC by correct instruction length to
-                         * avoid disassembler error messages */
-                        dc->pc += 2;
                         goto done_generating;
                     }
                     break;
@@ -11583,6 +11575,16 @@ void gen_intermediate_code(CPUARMState *env, TranslationBlock *tb)
 done_generating:
     gen_tb_end(tb, num_insns);
 
+    if (dc->pc == pc_start) {
+        /* We have got an empty TB but there are many places where tb->size is
+         * expected it to be non-zero. Just setting it to 1 is enough to get
+         * correct behaviour.
+         */
+        tb->size = 1;
+        tb->icount = 0;
+        return;
+    }
+
 #ifdef DEBUG_DISAS
     if (qemu_loglevel_mask(CPU_LOG_TB_IN_ASM)) {
         qemu_log("----------------\n");
diff --git a/target-cris/translate.c b/target-cris/translate.c
index 2d710cc..b3274a3 100644
--- a/target-cris/translate.c
+++ b/target-cris/translate.c
@@ -3166,11 +3166,6 @@ void gen_intermediate_code(CPUCRISState *env, struct TranslationBlock *tb)
             tcg_gen_movi_tl(env_pc, dc->pc);
             t_gen_raise_exception(EXCP_DEBUG);
             dc->is_jmp = DISAS_UPDATE;
-            /* The address covered by the breakpoint must be included in
-               [tb->pc, tb->pc + tb->size) in order to for it to be
-               properly cleared -- thus we increment the PC here so that
-               the logic setting tb->size below does the right thing.  */
-            dc->pc += 2;
             break;
         }
 
@@ -3293,6 +3288,16 @@ void gen_intermediate_code(CPUCRISState *env, struct TranslationBlock *tb)
     }
     gen_tb_end(tb, num_insns);
 
+    if (dc->pc == pc_start) {
+        /* We have got an empty TB but there are many places where tb->size is
+         * expected it to be non-zero. Just setting it to 1 is enough to get
+         * correct behaviour.
+         */
+        tb->size = 1;
+        tb->icount = 0;
+        return;
+    }
+
     tb->size = dc->pc - pc_start;
     tb->icount = num_insns;
 
diff --git a/target-i386/translate.c b/target-i386/translate.c
index a3dd167..b6f4855 100644
--- a/target-i386/translate.c
+++ b/target-i386/translate.c
@@ -7987,11 +7987,6 @@ void gen_intermediate_code(CPUX86State *env, TranslationBlock *tb)
                                          tb->flags & HF_RF_MASK
                                          ? BP_GDB : BP_ANY))) {
             gen_debug(dc, pc_ptr - dc->cs_base);
-            /* The address covered by the breakpoint must be included in
-               [tb->pc, tb->pc + tb->size) in order to for it to be
-               properly cleared -- thus we increment the PC here so that
-               the logic setting tb->size below does the right thing.  */
-            pc_ptr += 1;
             goto done_generating;
         }
         if (num_insns == max_insns && (tb->cflags & CF_LAST_IO)) {
@@ -8046,6 +8041,16 @@ void gen_intermediate_code(CPUX86State *env, TranslationBlock *tb)
 done_generating:
     gen_tb_end(tb, num_insns);
 
+    if (pc_ptr == pc_start) {
+        /* We have got an empty TB but there are many places where tb->size is
+         * expected it to be non-zero. Just setting it to 1 is enough to get
+         * correct behaviour.
+         */
+        tb->size = 1;
+        tb->icount = 0;
+        return;
+    }
+
 #ifdef DEBUG_DISAS
     if (qemu_loglevel_mask(CPU_LOG_TB_IN_ASM)) {
         int disas_flags;
diff --git a/target-lm32/translate.c b/target-lm32/translate.c
index fa5b0b9..ef150bf 100644
--- a/target-lm32/translate.c
+++ b/target-lm32/translate.c
@@ -1078,11 +1078,6 @@ void gen_intermediate_code(CPULM32State *env, struct TranslationBlock *tb)
             tcg_gen_movi_tl(cpu_pc, dc->pc);
             t_gen_raise_exception(dc, EXCP_DEBUG);
             dc->is_jmp = DISAS_UPDATE;
-            /* The address covered by the breakpoint must be included in
-               [tb->pc, tb->pc + tb->size) in order to for it to be
-               properly cleared -- thus we increment the PC here so that
-               the logic setting tb->size below does the right thing.  */
-            dc->pc += 4;
             break;
         }
 
@@ -1131,6 +1126,16 @@ void gen_intermediate_code(CPULM32State *env, struct TranslationBlock *tb)
 
     gen_tb_end(tb, num_insns);
 
+    if (dc->pc == pc_start) {
+        /* We have got an empty TB but there are many places where tb->size is
+         * expected it to be non-zero. Just setting it to 1 is enough to get
+         * correct behaviour.
+         */
+        tb->size = 1;
+        tb->icount = 0;
+        return;
+    }
+
     tb->size = dc->pc - pc_start;
     tb->icount = num_insns;
 
diff --git a/target-m68k/translate.c b/target-m68k/translate.c
index 41ae2c6..583a455 100644
--- a/target-m68k/translate.c
+++ b/target-m68k/translate.c
@@ -3004,11 +3004,6 @@ void gen_intermediate_code(CPUM68KState *env, TranslationBlock *tb)
         if (unlikely(cpu_breakpoint_test(cs, dc->pc, BP_ANY))) {
             gen_exception(dc, dc->pc, EXCP_DEBUG);
             dc->is_jmp = DISAS_JUMP;
-            /* The address covered by the breakpoint must be included in
-               [tb->pc, tb->pc + tb->size) in order to for it to be
-               properly cleared -- thus we increment the PC here so that
-               the logic setting tb->size below does the right thing.  */
-            dc->pc += 2;
             break;
         }
 
@@ -3053,6 +3048,16 @@ void gen_intermediate_code(CPUM68KState *env, TranslationBlock *tb)
     }
     gen_tb_end(tb, num_insns);
 
+    if (dc->pc == pc_start) {
+        /* We have got an empty TB but there are many places where tb->size is
+         * expected it to be non-zero. Just setting it to 1 is enough to get
+         * correct behaviour.
+         */
+        tb->size = 1;
+        tb->icount = 0;
+        return;
+    }
+
 #ifdef DEBUG_DISAS
     if (qemu_loglevel_mask(CPU_LOG_TB_IN_ASM)) {
         qemu_log("----------------\n");
diff --git a/target-microblaze/translate.c b/target-microblaze/translate.c
index 154b9d6..4a4beb7 100644
--- a/target-microblaze/translate.c
+++ b/target-microblaze/translate.c
@@ -1693,11 +1693,6 @@ void gen_intermediate_code(CPUMBState *env, struct TranslationBlock *tb)
         if (unlikely(cpu_breakpoint_test(cs, dc->pc, BP_ANY))) {
             t_gen_raise_exception(dc, EXCP_DEBUG);
             dc->is_jmp = DISAS_UPDATE;
-            /* The address covered by the breakpoint must be included in
-               [tb->pc, tb->pc + tb->size) in order to for it to be
-               properly cleared -- thus we increment the PC here so that
-               the logic setting tb->size below does the right thing.  */
-            dc->pc += 4;
             break;
         }
 
@@ -1803,6 +1798,16 @@ void gen_intermediate_code(CPUMBState *env, struct TranslationBlock *tb)
     }
     gen_tb_end(tb, num_insns);
 
+    if (dc->pc == pc_start) {
+        /* We have got an empty TB but there are many places where tb->size is
+         * expected it to be non-zero. Just setting it to 1 is enough to get
+         * correct behaviour.
+         */
+        tb->size = 1;
+        tb->icount = 0;
+        return;
+    }
+
     tb->size = dc->pc - pc_start;
     tb->icount = num_insns;
 
diff --git a/target-mips/translate.c b/target-mips/translate.c
index 5626647..488603b 100644
--- a/target-mips/translate.c
+++ b/target-mips/translate.c
@@ -19627,11 +19627,6 @@ void gen_intermediate_code(CPUMIPSState *env, struct TranslationBlock *tb)
             save_cpu_state(&ctx, 1);
             ctx.bstate = BS_BRANCH;
             gen_helper_raise_exception_debug(cpu_env);
-            /* The address covered by the breakpoint must be included in
-               [tb->pc, tb->pc + tb->size) in order to for it to be
-               properly cleared -- thus we increment the PC here so that
-               the logic setting tb->size below does the right thing.  */
-            ctx.pc += 4;
             goto done_generating;
         }
 
@@ -19722,6 +19717,16 @@ void gen_intermediate_code(CPUMIPSState *env, struct TranslationBlock *tb)
 done_generating:
     gen_tb_end(tb, num_insns);
 
+    if (ctx.pc == pc_start) {
+        /* We have got an empty TB but there are many places where tb->size is
+         * expected it to be non-zero. Just setting it to 1 is enough to get
+         * correct behaviour.
+         */
+        tb->size = 1;
+        tb->icount = 0;
+        return;
+    }
+
     tb->size = ctx.pc - pc_start;
     tb->icount = num_insns;
 
diff --git a/target-moxie/translate.c b/target-moxie/translate.c
index 6dedcb7..e682735 100644
--- a/target-moxie/translate.c
+++ b/target-moxie/translate.c
@@ -848,11 +848,6 @@ void gen_intermediate_code(CPUMoxieState *env, struct TranslationBlock *tb)
             tcg_gen_movi_i32(cpu_pc, ctx.pc);
             gen_helper_debug(cpu_env);
             ctx.bstate = BS_EXCP;
-            /* The address covered by the breakpoint must be included in
-               [tb->pc, tb->pc + tb->size) in order to for it to be
-               properly cleared -- thus we increment the PC here so that
-               the logic setting tb->size below does the right thing.  */
-            ctx.pc += 2;
             goto done_generating;
         }
 
@@ -890,6 +885,16 @@ void gen_intermediate_code(CPUMoxieState *env, struct TranslationBlock *tb)
  done_generating:
     gen_tb_end(tb, num_insns);
 
+    if (ctx.pc == pc_start) {
+        /* We have got an empty TB but there are many places where tb->size is
+         * expected it to be non-zero. Just setting it to 1 is enough to get
+         * correct behaviour.
+         */
+        tb->size = 1;
+        tb->icount = 0;
+        return;
+    }
+
     tb->size = ctx.pc - pc_start;
     tb->icount = num_insns;
 }
diff --git a/target-openrisc/translate.c b/target-openrisc/translate.c
index 606490a..762e82e 100644
--- a/target-openrisc/translate.c
+++ b/target-openrisc/translate.c
@@ -1665,11 +1665,6 @@ void gen_intermediate_code(CPUOpenRISCState *env, struct TranslationBlock *tb)
             tcg_gen_movi_tl(cpu_pc, dc->pc);
             gen_exception(dc, EXCP_DEBUG);
             dc->is_jmp = DISAS_UPDATE;
-            /* The address covered by the breakpoint must be included in
-               [tb->pc, tb->pc + tb->size) in order to for it to be
-               properly cleared -- thus we increment the PC here so that
-               the logic setting tb->size below does the right thing.  */
-            dc->pc += 4;
             break;
         }
 
@@ -1736,6 +1731,16 @@ void gen_intermediate_code(CPUOpenRISCState *env, struct TranslationBlock *tb)
 
     gen_tb_end(tb, num_insns);
 
+    if (dc->pc == pc_start) {
+        /* We have got an empty TB but there are many places where tb->size is
+         * expected it to be non-zero. Just setting it to 1 is enough to get
+         * correct behaviour.
+         */
+        tb->size = 1;
+        tb->icount = 0;
+        return;
+    }
+
     tb->size = dc->pc - pc_start;
     tb->icount = num_insns;
 
diff --git a/target-ppc/translate.c b/target-ppc/translate.c
index 41a7258..ba83e08 100644
--- a/target-ppc/translate.c
+++ b/target-ppc/translate.c
@@ -11488,11 +11488,6 @@ void gen_intermediate_code(CPUPPCState *env, struct TranslationBlock *tb)
 
         if (unlikely(cpu_breakpoint_test(cs, ctx.nip, BP_ANY))) {
             gen_debug_exception(ctxp);
-            /* The address covered by the breakpoint must be included in
-               [tb->pc, tb->pc + tb->size) in order to for it to be
-               properly cleared -- thus we increment the PC here so that
-               the logic setting tb->size below does the right thing.  */
-            ctx.nip += 4;
             break;
         }
 
@@ -11589,6 +11584,16 @@ void gen_intermediate_code(CPUPPCState *env, struct TranslationBlock *tb)
     }
     gen_tb_end(tb, num_insns);
 
+    if (ctx.nip == pc_start) {
+        /* We have got an empty TB but there are many places where tb->size is
+         * expected it to be non-zero. Just setting it to 1 is enough to get
+         * correct behaviour.
+         */
+        tb->size = 1;
+        tb->icount = 0;
+        return;
+    }
+
     tb->size = ctx.nip - pc_start;
     tb->icount = num_insns;
 
diff --git a/target-s390x/translate.c b/target-s390x/translate.c
index c79a2cb..09421ad 100644
--- a/target-s390x/translate.c
+++ b/target-s390x/translate.c
@@ -5360,11 +5360,6 @@ void gen_intermediate_code(CPUS390XState *env, struct TranslationBlock *tb)
         if (unlikely(cpu_breakpoint_test(cs, dc.pc, BP_ANY))) {
             status = EXIT_PC_STALE;
             do_debug = true;
-            /* The address covered by the breakpoint must be included in
-               [tb->pc, tb->pc + tb->size) in order to for it to be
-               properly cleared -- thus we increment the PC here so that
-               the logic setting tb->size below does the right thing.  */
-            dc.pc += 2;
             break;
         }
 
@@ -5417,6 +5412,16 @@ void gen_intermediate_code(CPUS390XState *env, struct TranslationBlock *tb)
 
     gen_tb_end(tb, num_insns);
 
+    if (dc.pc == pc_start) {
+        /* We have got an empty TB but there are many places where tb->size is
+         * expected it to be non-zero. Just setting it to 1 is enough to get
+         * correct behaviour.
+         */
+        tb->size = 1;
+        tb->icount = 0;
+        return;
+    }
+
     tb->size = dc.pc - pc_start;
     tb->icount = num_insns;
 
diff --git a/target-sh4/translate.c b/target-sh4/translate.c
index 7bc6216..ed2fa57 100644
--- a/target-sh4/translate.c
+++ b/target-sh4/translate.c
@@ -1855,11 +1855,6 @@ void gen_intermediate_code(CPUSH4State * env, struct TranslationBlock *tb)
             tcg_gen_movi_i32(cpu_pc, ctx.pc);
             gen_helper_debug(cpu_env);
             ctx.bstate = BS_BRANCH;
-            /* The address covered by the breakpoint must be included in
-               [tb->pc, tb->pc + tb->size) in order to for it to be
-               properly cleared -- thus we increment the PC here so that
-               the logic setting tb->size below does the right thing.  */
-            ctx.pc += 2;
             break;
         }
 
@@ -1908,6 +1903,16 @@ void gen_intermediate_code(CPUSH4State * env, struct TranslationBlock *tb)
 
     gen_tb_end(tb, num_insns);
 
+    if (ctx.pc == pc_start) {
+        /* We have got an empty TB but there are many places where tb->size is
+         * expected it to be non-zero. Just setting it to 1 is enough to get
+         * correct behaviour.
+         */
+        tb->size = 1;
+        tb->icount = 0;
+        return;
+    }
+
     tb->size = ctx.pc - pc_start;
     tb->icount = num_insns;
 
diff --git a/target-unicore32/translate.c b/target-unicore32/translate.c
index d2f92f0..b02783f 100644
--- a/target-unicore32/translate.c
+++ b/target-unicore32/translate.c
@@ -1917,11 +1917,6 @@ void gen_intermediate_code(CPUUniCore32State *env, TranslationBlock *tb)
             gen_set_pc_im(dc->pc);
             gen_exception(EXCP_DEBUG);
             dc->is_jmp = DISAS_JUMP;
-            /* The address covered by the breakpoint must be included in
-               [tb->pc, tb->pc + tb->size) in order to for it to be
-               properly cleared -- thus we increment the PC here so that
-               the logic setting tb->size below does the right thing.  */
-            dc->pc += 4;
             goto done_generating;
         }
 
@@ -2017,6 +2012,16 @@ void gen_intermediate_code(CPUUniCore32State *env, TranslationBlock *tb)
 done_generating:
     gen_tb_end(tb, num_insns);
 
+    if (dc->pc == pc_start) {
+        /* We have got an empty TB but there are many places where tb->size is
+         * expected it to be non-zero. Just setting it to 1 is enough to get
+         * correct behaviour.
+         */
+        tb->size = 1;
+        tb->icount = 0;
+        return;
+    }
+
 #ifdef DEBUG_DISAS
     if (qemu_loglevel_mask(CPU_LOG_TB_IN_ASM)) {
         qemu_log("----------------\n");
diff --git a/target-xtensa/translate.c b/target-xtensa/translate.c
index 06b0163..6e5f8ba 100644
--- a/target-xtensa/translate.c
+++ b/target-xtensa/translate.c
@@ -3088,11 +3088,6 @@ void gen_intermediate_code(CPUXtensaState *env, TranslationBlock *tb)
             tcg_gen_movi_i32(cpu_pc, dc.pc);
             gen_exception(&dc, EXCP_DEBUG);
             dc.is_jmp = DISAS_UPDATE;
-            /* The address covered by the breakpoint must be included in
-               [tb->pc, tb->pc + tb->size) in order to for it to be
-               properly cleared -- thus we increment the PC here so that
-               the logic setting tb->size below does the right thing.  */
-            dc.pc += 2;
             break;
         }
 
@@ -3146,6 +3141,16 @@ void gen_intermediate_code(CPUXtensaState *env, TranslationBlock *tb)
     }
     gen_tb_end(tb, insn_count);
 
+    if (dc.pc == pc_start) {
+        /* We have got an empty TB but there are many places where tb->size is
+         * expected it to be non-zero. Just setting it to 1 is enough to get
+         * correct behaviour.
+         */
+        tb->size = 1;
+        tb->icount = 0;
+        return;
+    }
+
 #ifdef DEBUG_DISAS
     if (qemu_loglevel_mask(CPU_LOG_TB_IN_ASM)) {
         qemu_log("----------------\n");
-- 
1.9.1

