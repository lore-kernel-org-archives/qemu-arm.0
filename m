Received: by 10.25.44.15 with SMTP id s15csp614144lfs;
        Fri, 14 Jul 2017 01:18:21 -0700 (PDT)
X-Received: by 10.223.153.106 with SMTP id x97mr3581323wrb.32.1500020301367;
        Fri, 14 Jul 2017 01:18:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1500020301; cv=none;
        d=google.com; s=arc-20160816;
        b=rCeZn6BJFWQvkjx6rJLgqHnJyHJrwRnqSR11wGh8MGryvfCNuur8LUknater6BdtI3
         qe3kfG1zyMy5bOE6eYdb0VH9iuht6JuVfXdK+l4JbWlsF8Ti2HOlpO0PBXXgRMnr+l7J
         cp4efwSwlFAT0qAVZ4ZRUekNLqOqMcxvDtOYre6a+mhldrrgOi5xyh1rcUpdFA5umaO0
         af9YGZ3hxU12p6ryrcetTIbPb0y9dzuRdEzubKlJ2GVZ8heh9AXM95cLxfmOAVRZAmn9
         IXTTPSxFAkpM265RCyh8NT8y9DRjHfQL2GteCNZCmGHppKb9vAoeqvWsVwArgLRH0iWf
         G0sQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:user-agent:references
         :in-reply-to:message-id:date:subject:cc:to:from
         :arc-authentication-results;
        bh=3oXQ2M0TpjfD8lmxG4oaA4kcuxRS5dl1DHxRGejvLB4=;
        b=D9zhLl14QOcii/1VWwdUr3Hxk2yaXTFAON0KnBjD7yJtvejixJVs2vtLGhTVMei20e
         8xww7T7ftm00QVjo7ekBB8ysyRFZwsIjKAnhOnDcWfXNBKKkxLyIvKM6NSLuQjnPiIY9
         2mgY8KN3X+9vwuhtHpQ0PZ5TQtdeQLDC0plHSstUALRyrLrnMuWR9lnTnNOjlvpTCLsE
         zB1kJX+TPeLDlCn64i/8fKhT+U2OPbK1BzhExrG33psJ0o9PIttggKKSusQtaVW0p0/P
         tWhD3VzIUEBqt6cgR7nZgF40lRkoFzHvbdNG+8dEUurkovMjzIob4VsfXqxwGYnJNb8+
         0O8w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of vilanova@ac.upc.edu designates 147.83.33.10 as permitted sender) smtp.mailfrom=vilanova@ac.upc.edu
Return-Path: <vilanova@ac.upc.edu>
Received: from roura.ac.upc.es (roura.ac.upc.es. [147.83.33.10])
        by mx.google.com with ESMTP id q27si402132wra.187.2017.07.14.01.18.21;
        Fri, 14 Jul 2017 01:18:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of vilanova@ac.upc.edu designates 147.83.33.10 as permitted sender) client-ip=147.83.33.10;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of vilanova@ac.upc.edu designates 147.83.33.10 as permitted sender) smtp.mailfrom=vilanova@ac.upc.edu
Received: from correu-2.ac.upc.es (correu-2.ac.upc.es [147.83.30.92])
	by roura.ac.upc.es (8.13.8/8.13.8) with ESMTP id v6E8HgZ1007588;
	Fri, 14 Jul 2017 10:17:42 +0200
Received: from localhost (unknown [31.210.188.120])
	by correu-2.ac.upc.es (Postfix) with ESMTPSA id 727637D8;
	Fri, 14 Jul 2017 10:17:36 +0200 (CEST)
From: =?utf-8?b?TGx1w61z?= Vilanova <vilanova@ac.upc.edu>
To: qemu-devel@nongnu.org
Cc: "Emilio G. Cota" <cota@braap.org>,
        =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
        Richard Henderson <rth@twiddle.net>,
        Peter Crosthwaite <crosthwaite.peter@gmail.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Peter Maydell <peter.maydell@linaro.org>,
        "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
        Eduardo Habkost <ehabkost@redhat.com>,
        Michael Walle <michael@walle.cc>, Laurent Vivier <laurent@vivier.eu>,
        Aurelien Jarno <aurelien@aurel32.net>,
        Yongbok Kim <yongbok.kim@imgtec.com>,
        Anthony Green <green@moxielogic.com>, Chris Wulff <crwulff@gmail.com>,
        Marek Vasut <marex@denx.de>, Stafford Horne <shorne@gmail.com>,
        David Gibson <david@gibson.dropbear.id.au>,
        Alexander Graf <agraf@suse.de>,
        Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
        Artyom Tarasenko <atar4qemu@gmail.com>,
        Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
        Guan Xuetao <gxt@mprc.pku.edu.cn>, Max Filippov <jcmvbkbc@gmail.com>,
        qemu-arm@nongnu.org (open list:ARM),
        qemu-ppc@nongnu.org (open list:PowerPC)
Subject: [PATCH v13 01/26] Pass generic CPUState to gen_intermediate_code()
Date: Fri, 14 Jul 2017 11:17:35 +0300
Message-Id: <150002025498.22386.18051908483085660588.stgit@frigg.lan>
X-Mailer: git-send-email 2.13.2
In-Reply-To: <150002001195.22386.4679134058536830996.stgit@frigg.lan>
References: <150002001195.22386.4679134058536830996.stgit@frigg.lan>
User-Agent: StGit/0.17.1-dirty
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TUID: 4TOS9INtM/uT

Needed to implement a target-agnostic gen_intermediate_code() in the
future.

Signed-off-by: Lluís Vilanova <vilanova@ac.upc.edu>
Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
Reviewed-by: Richard Henderson <rth@twiddle.net>
Reviewed-by: Alex Benneé <alex.benee@linaro.org>
---
 accel/tcg/translate-all.c     |    2 +-
 include/exec/exec-all.h       |    2 +-
 target/alpha/translate.c      |    5 ++---
 target/arm/translate-a64.c    |    6 +++---
 target/arm/translate.c        |    6 +++---
 target/arm/translate.h        |    4 ++--
 target/cris/translate.c       |    7 +++----
 target/hppa/translate.c       |    5 ++---
 target/i386/translate.c       |    5 ++---
 target/lm32/translate.c       |    4 ++--
 target/m68k/translate.c       |    5 ++---
 target/microblaze/translate.c |    4 ++--
 target/mips/translate.c       |    5 ++---
 target/moxie/translate.c      |    4 ++--
 target/nios2/translate.c      |    5 ++---
 target/openrisc/translate.c   |    4 ++--
 target/ppc/translate.c        |    5 ++---
 target/s390x/translate.c      |    5 ++---
 target/sh4/translate.c        |    5 ++---
 target/sparc/translate.c      |    5 ++---
 target/tilegx/translate.c     |    5 ++---
 target/tricore/translate.c    |    5 ++---
 target/unicore32/translate.c  |    5 ++---
 target/xtensa/translate.c     |    5 ++---
 24 files changed, 49 insertions(+), 64 deletions(-)

diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
index 0caf80db75..59fac13e2d 100644
--- a/accel/tcg/translate-all.c
+++ b/accel/tcg/translate-all.c
@@ -1273,7 +1273,7 @@ TranslationBlock *tb_gen_code(CPUState *cpu,
     tcg_func_start(&tcg_ctx);
 
     tcg_ctx.cpu = ENV_GET_CPU(env);
-    gen_intermediate_code(env, tb);
+    gen_intermediate_code(cpu, tb);
     tcg_ctx.cpu = NULL;
 
     trace_translate_block(tb, tb->pc, tb->tc_ptr);
diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
index 8096d64a1d..e2a82d5151 100644
--- a/include/exec/exec-all.h
+++ b/include/exec/exec-all.h
@@ -43,7 +43,7 @@ typedef ram_addr_t tb_page_addr_t;
 
 #include "qemu/log.h"
 
-void gen_intermediate_code(CPUArchState *env, struct TranslationBlock *tb);
+void gen_intermediate_code(CPUState *cpu, struct TranslationBlock *tb);
 void restore_state_to_opc(CPUArchState *env, struct TranslationBlock *tb,
                           target_ulong *data);
 
diff --git a/target/alpha/translate.c b/target/alpha/translate.c
index 232af9e177..7b39101053 100644
--- a/target/alpha/translate.c
+++ b/target/alpha/translate.c
@@ -2911,10 +2911,9 @@ static ExitStatus translate_one(DisasContext *ctx, uint32_t insn)
     return ret;
 }
 
-void gen_intermediate_code(CPUAlphaState *env, struct TranslationBlock *tb)
+void gen_intermediate_code(CPUState *cs, struct TranslationBlock *tb)
 {
-    AlphaCPU *cpu = alpha_env_get_cpu(env);
-    CPUState *cs = CPU(cpu);
+    CPUAlphaState *env = cs->env_ptr;
     DisasContext ctx, *ctxp = &ctx;
     target_ulong pc_start;
     target_ulong pc_mask;
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index e55547d95d..f9bd1a9679 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -11190,10 +11190,10 @@ static void disas_a64_insn(CPUARMState *env, DisasContext *s)
     free_tmp_a64(s);
 }
 
-void gen_intermediate_code_a64(ARMCPU *cpu, TranslationBlock *tb)
+void gen_intermediate_code_a64(CPUState *cs, TranslationBlock *tb)
 {
-    CPUState *cs = CPU(cpu);
-    CPUARMState *env = &cpu->env;
+    CPUARMState *env = cs->env_ptr;
+    ARMCPU *cpu = arm_env_get_cpu(env);
     DisasContext dc1, *dc = &dc1;
     target_ulong pc_start;
     target_ulong next_page_start;
diff --git a/target/arm/translate.c b/target/arm/translate.c
index 0862f9e4aa..e80cc357c1 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -11787,10 +11787,10 @@ static bool insn_crosses_page(CPUARMState *env, DisasContext *s)
 }
 
 /* generate intermediate code for basic block 'tb'.  */
-void gen_intermediate_code(CPUARMState *env, TranslationBlock *tb)
+void gen_intermediate_code(CPUState *cs, TranslationBlock *tb)
 {
+    CPUARMState *env = cs->env_ptr;
     ARMCPU *cpu = arm_env_get_cpu(env);
-    CPUState *cs = CPU(cpu);
     DisasContext dc1, *dc = &dc1;
     target_ulong pc_start;
     target_ulong next_page_start;
@@ -11804,7 +11804,7 @@ void gen_intermediate_code(CPUARMState *env, TranslationBlock *tb)
      * the A32/T32 complexity to do with conditional execution/IT blocks/etc.
      */
     if (ARM_TBFLAG_AARCH64_STATE(tb->flags)) {
-        gen_intermediate_code_a64(cpu, tb);
+        gen_intermediate_code_a64(cs, tb);
         return;
     }
 
diff --git a/target/arm/translate.h b/target/arm/translate.h
index 15d383d9af..e5da614db5 100644
--- a/target/arm/translate.h
+++ b/target/arm/translate.h
@@ -146,7 +146,7 @@ static void disas_set_insn_syndrome(DisasContext *s, uint32_t syn)
 
 #ifdef TARGET_AARCH64
 void a64_translate_init(void);
-void gen_intermediate_code_a64(ARMCPU *cpu, TranslationBlock *tb);
+void gen_intermediate_code_a64(CPUState *cpu, TranslationBlock *tb);
 void gen_a64_set_pc_im(uint64_t val);
 void aarch64_cpu_dump_state(CPUState *cs, FILE *f,
                             fprintf_function cpu_fprintf, int flags);
@@ -155,7 +155,7 @@ static inline void a64_translate_init(void)
 {
 }
 
-static inline void gen_intermediate_code_a64(ARMCPU *cpu, TranslationBlock *tb)
+static inline void gen_intermediate_code_a64(CPUState *cpu, TranslationBlock *tb)
 {
 }
 
diff --git a/target/cris/translate.c b/target/cris/translate.c
index 0ee05ca02d..12b96eb68f 100644
--- a/target/cris/translate.c
+++ b/target/cris/translate.c
@@ -3080,10 +3080,9 @@ static unsigned int crisv32_decoder(CPUCRISState *env, DisasContext *dc)
  */
 
 /* generate intermediate code for basic block 'tb'.  */
-void gen_intermediate_code(CPUCRISState *env, struct TranslationBlock *tb)
+void gen_intermediate_code(CPUState *cs, struct TranslationBlock *tb)
 {
-    CRISCPU *cpu = cris_env_get_cpu(env);
-    CPUState *cs = CPU(cpu);
+    CPUCRISState *env = cs->env_ptr;
     uint32_t pc_start;
     unsigned int insn_len;
     struct DisasContext ctx;
@@ -3105,7 +3104,7 @@ void gen_intermediate_code(CPUCRISState *env, struct TranslationBlock *tb)
      * delayslot, like in real hw.
      */
     pc_start = tb->pc & ~1;
-    dc->cpu = cpu;
+    dc->cpu = cris_env_get_cpu(env);
     dc->tb = tb;
 
     dc->is_jmp = DISAS_NEXT;
diff --git a/target/hppa/translate.c b/target/hppa/translate.c
index e10abc5e04..900870cd5a 100644
--- a/target/hppa/translate.c
+++ b/target/hppa/translate.c
@@ -3740,10 +3740,9 @@ static ExitStatus translate_one(DisasContext *ctx, uint32_t insn)
     return gen_illegal(ctx);
 }
 
-void gen_intermediate_code(CPUHPPAState *env, struct TranslationBlock *tb)
+void gen_intermediate_code(CPUState *cs, struct TranslationBlock *tb)
 {
-    HPPACPU *cpu = hppa_env_get_cpu(env);
-    CPUState *cs = CPU(cpu);
+    CPUHPPAState *env = cs->env_ptr;
     DisasContext ctx;
     ExitStatus ret;
     int num_insns, max_insns, i;
diff --git a/target/i386/translate.c b/target/i386/translate.c
index ed3b896db4..cab9e32f91 100644
--- a/target/i386/translate.c
+++ b/target/i386/translate.c
@@ -8378,10 +8378,9 @@ void tcg_x86_init(void)
 }
 
 /* generate intermediate code for basic block 'tb'.  */
-void gen_intermediate_code(CPUX86State *env, TranslationBlock *tb)
+void gen_intermediate_code(CPUState *cs, TranslationBlock *tb)
 {
-    X86CPU *cpu = x86_env_get_cpu(env);
-    CPUState *cs = CPU(cpu);
+    CPUX86State *env = cs->env_ptr;
     DisasContext dc1, *dc = &dc1;
     target_ulong pc_ptr;
     uint32_t flags;
diff --git a/target/lm32/translate.c b/target/lm32/translate.c
index 692882f447..f68f372f15 100644
--- a/target/lm32/translate.c
+++ b/target/lm32/translate.c
@@ -1044,10 +1044,10 @@ static inline void decode(DisasContext *dc, uint32_t ir)
 }
 
 /* generate intermediate code for basic block 'tb'.  */
-void gen_intermediate_code(CPULM32State *env, struct TranslationBlock *tb)
+void gen_intermediate_code(CPUState *cs, struct TranslationBlock *tb)
 {
+    CPULM32State *env = cs->env_ptr;
     LM32CPU *cpu = lm32_env_get_cpu(env);
-    CPUState *cs = CPU(cpu);
     struct DisasContext ctx, *dc = &ctx;
     uint32_t pc_start;
     uint32_t next_page_start;
diff --git a/target/m68k/translate.c b/target/m68k/translate.c
index 3a519b790d..9161df2476 100644
--- a/target/m68k/translate.c
+++ b/target/m68k/translate.c
@@ -5519,10 +5519,9 @@ static void disas_m68k_insn(CPUM68KState * env, DisasContext *s)
 }
 
 /* generate intermediate code for basic block 'tb'.  */
-void gen_intermediate_code(CPUM68KState *env, TranslationBlock *tb)
+void gen_intermediate_code(CPUState *cs, TranslationBlock *tb)
 {
-    M68kCPU *cpu = m68k_env_get_cpu(env);
-    CPUState *cs = CPU(cpu);
+    CPUM68KState *env = cs->env_ptr;
     DisasContext dc1, *dc = &dc1;
     target_ulong pc_start;
     int pc_offset;
diff --git a/target/microblaze/translate.c b/target/microblaze/translate.c
index cb65d1e129..a24373c0be 100644
--- a/target/microblaze/translate.c
+++ b/target/microblaze/translate.c
@@ -1625,10 +1625,10 @@ static inline void decode(DisasContext *dc, uint32_t ir)
 }
 
 /* generate intermediate code for basic block 'tb'.  */
-void gen_intermediate_code(CPUMBState *env, struct TranslationBlock *tb)
+void gen_intermediate_code(CPUState *cs, struct TranslationBlock *tb)
 {
+    CPUMBState *env = cs->env_ptr;
     MicroBlazeCPU *cpu = mb_env_get_cpu(env);
-    CPUState *cs = CPU(cpu);
     uint32_t pc_start;
     struct DisasContext ctx;
     struct DisasContext *dc = &ctx;
diff --git a/target/mips/translate.c b/target/mips/translate.c
index 559f8fed89..97314e470a 100644
--- a/target/mips/translate.c
+++ b/target/mips/translate.c
@@ -19878,10 +19878,9 @@ static void decode_opc(CPUMIPSState *env, DisasContext *ctx)
     }
 }
 
-void gen_intermediate_code(CPUMIPSState *env, struct TranslationBlock *tb)
+void gen_intermediate_code(CPUState *cs, struct TranslationBlock *tb)
 {
-    MIPSCPU *cpu = mips_env_get_cpu(env);
-    CPUState *cs = CPU(cpu);
+    CPUMIPSState *env = cs->env_ptr;
     DisasContext ctx;
     target_ulong pc_start;
     target_ulong next_page_start;
diff --git a/target/moxie/translate.c b/target/moxie/translate.c
index 0660b44c08..3cfd232558 100644
--- a/target/moxie/translate.c
+++ b/target/moxie/translate.c
@@ -822,10 +822,10 @@ static int decode_opc(MoxieCPU *cpu, DisasContext *ctx)
 }
 
 /* generate intermediate code for basic block 'tb'.  */
-void gen_intermediate_code(CPUMoxieState *env, struct TranslationBlock *tb)
+void gen_intermediate_code(CPUState *cs, struct TranslationBlock *tb)
 {
+    CPUMoxieState *env = cs->env_ptr;
     MoxieCPU *cpu = moxie_env_get_cpu(env);
-    CPUState *cs = CPU(cpu);
     DisasContext ctx;
     target_ulong pc_start;
     int num_insns, max_insns;
diff --git a/target/nios2/translate.c b/target/nios2/translate.c
index 2f3c2e5dfb..8b97d6585f 100644
--- a/target/nios2/translate.c
+++ b/target/nios2/translate.c
@@ -799,10 +799,9 @@ static void gen_exception(DisasContext *dc, uint32_t excp)
 }
 
 /* generate intermediate code for basic block 'tb'.  */
-void gen_intermediate_code(CPUNios2State *env, TranslationBlock *tb)
+void gen_intermediate_code(CPUState *cs, TranslationBlock *tb)
 {
-    Nios2CPU *cpu = nios2_env_get_cpu(env);
-    CPUState *cs = CPU(cpu);
+    CPUNios2State *env = cs->env_ptr;
     DisasContext dc1, *dc = &dc1;
     int num_insns;
     int max_insns;
diff --git a/target/openrisc/translate.c b/target/openrisc/translate.c
index e49518e893..a01413113b 100644
--- a/target/openrisc/translate.c
+++ b/target/openrisc/translate.c
@@ -1518,10 +1518,10 @@ static void disas_openrisc_insn(DisasContext *dc, OpenRISCCPU *cpu)
     }
 }
 
-void gen_intermediate_code(CPUOpenRISCState *env, struct TranslationBlock *tb)
+void gen_intermediate_code(CPUState *cs, struct TranslationBlock *tb)
 {
+    CPUOpenRISCState *env = cs->env_ptr;
     OpenRISCCPU *cpu = openrisc_env_get_cpu(env);
-    CPUState *cs = CPU(cpu);
     struct DisasContext ctx, *dc = &ctx;
     uint32_t pc_start;
     uint32_t next_page_start;
diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index c0cd64d927..acb6e881ad 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -7203,10 +7203,9 @@ void ppc_cpu_dump_statistics(CPUState *cs, FILE*f,
 }
 
 /*****************************************************************************/
-void gen_intermediate_code(CPUPPCState *env, struct TranslationBlock *tb)
+void gen_intermediate_code(CPUState *cs, struct TranslationBlock *tb)
 {
-    PowerPCCPU *cpu = ppc_env_get_cpu(env);
-    CPUState *cs = CPU(cpu);
+    CPUPPCState *env = cs->env_ptr;
     DisasContext ctx, *ctxp = &ctx;
     opc_handler_t **table, *handler;
     target_ulong pc_start;
diff --git a/target/s390x/translate.c b/target/s390x/translate.c
index 592d6b0f38..cd8c38d6d5 100644
--- a/target/s390x/translate.c
+++ b/target/s390x/translate.c
@@ -5764,10 +5764,9 @@ static ExitStatus translate_one(CPUS390XState *env, DisasContext *s)
     return ret;
 }
 
-void gen_intermediate_code(CPUS390XState *env, struct TranslationBlock *tb)
+void gen_intermediate_code(CPUState *cs, struct TranslationBlock *tb)
 {
-    S390CPU *cpu = s390_env_get_cpu(env);
-    CPUState *cs = CPU(cpu);
+    CPUS390XState *env = cs->env_ptr;
     DisasContext dc;
     target_ulong pc_start;
     uint64_t next_page_start;
diff --git a/target/sh4/translate.c b/target/sh4/translate.c
index 8bc132b27b..1a5ca39cd6 100644
--- a/target/sh4/translate.c
+++ b/target/sh4/translate.c
@@ -1815,10 +1815,9 @@ static void decode_opc(DisasContext * ctx)
     }
 }
 
-void gen_intermediate_code(CPUSH4State * env, struct TranslationBlock *tb)
+void gen_intermediate_code(CPUState *cs, struct TranslationBlock *tb)
 {
-    SuperHCPU *cpu = sh_env_get_cpu(env);
-    CPUState *cs = CPU(cpu);
+    CPUSH4State *env = cs->env_ptr;
     DisasContext ctx;
     target_ulong pc_start;
     int num_insns;
diff --git a/target/sparc/translate.c b/target/sparc/translate.c
index aa6734d54e..293b9c65ea 100644
--- a/target/sparc/translate.c
+++ b/target/sparc/translate.c
@@ -5747,10 +5747,9 @@ static void disas_sparc_insn(DisasContext * dc, unsigned int insn)
     }
 }
 
-void gen_intermediate_code(CPUSPARCState * env, TranslationBlock * tb)
+void gen_intermediate_code(CPUState *cs, TranslationBlock * tb)
 {
-    SPARCCPU *cpu = sparc_env_get_cpu(env);
-    CPUState *cs = CPU(cpu);
+    CPUSPARCState *env = cs->env_ptr;
     target_ulong pc_start, last_pc;
     DisasContext dc1, *dc = &dc1;
     int num_insns;
diff --git a/target/tilegx/translate.c b/target/tilegx/translate.c
index ff2ef7b63d..ace2830a84 100644
--- a/target/tilegx/translate.c
+++ b/target/tilegx/translate.c
@@ -2370,12 +2370,11 @@ static void translate_one_bundle(DisasContext *dc, uint64_t bundle)
     }
 }
 
-void gen_intermediate_code(CPUTLGState *env, struct TranslationBlock *tb)
+void gen_intermediate_code(CPUState *cs, struct TranslationBlock *tb)
 {
-    TileGXCPU *cpu = tilegx_env_get_cpu(env);
+    CPUTLGState *env = cs->env_ptr;
     DisasContext ctx;
     DisasContext *dc = &ctx;
-    CPUState *cs = CPU(cpu);
     uint64_t pc_start = tb->pc;
     uint64_t next_page_start = (pc_start & TARGET_PAGE_MASK) + TARGET_PAGE_SIZE;
     int num_insns = 0;
diff --git a/target/tricore/translate.c b/target/tricore/translate.c
index ddd2dd07dd..4e4198e887 100644
--- a/target/tricore/translate.c
+++ b/target/tricore/translate.c
@@ -8782,10 +8782,9 @@ static void decode_opc(CPUTriCoreState *env, DisasContext *ctx, int *is_branch)
     }
 }
 
-void gen_intermediate_code(CPUTriCoreState *env, struct TranslationBlock *tb)
+void gen_intermediate_code(CPUState *cs, struct TranslationBlock *tb)
 {
-    TriCoreCPU *cpu = tricore_env_get_cpu(env);
-    CPUState *cs = CPU(cpu);
+    CPUTriCoreState *env = cs->env_ptr;
     DisasContext ctx;
     target_ulong pc_start;
     int num_insns, max_insns;
diff --git a/target/unicore32/translate.c b/target/unicore32/translate.c
index 666a2016a8..8f30cff932 100644
--- a/target/unicore32/translate.c
+++ b/target/unicore32/translate.c
@@ -1869,10 +1869,9 @@ static void disas_uc32_insn(CPUUniCore32State *env, DisasContext *s)
 }
 
 /* generate intermediate code for basic block 'tb'.  */
-void gen_intermediate_code(CPUUniCore32State *env, TranslationBlock *tb)
+void gen_intermediate_code(CPUState *cs, TranslationBlock *tb)
 {
-    UniCore32CPU *cpu = uc32_env_get_cpu(env);
-    CPUState *cs = CPU(cpu);
+    CPUUniCore32State *env = cs->env_ptr;
     DisasContext dc1, *dc = &dc1;
     target_ulong pc_start;
     uint32_t next_page_start;
diff --git a/target/xtensa/translate.c b/target/xtensa/translate.c
index 263002486c..f3f0ff589c 100644
--- a/target/xtensa/translate.c
+++ b/target/xtensa/translate.c
@@ -3117,10 +3117,9 @@ static void gen_ibreak_check(CPUXtensaState *env, DisasContext *dc)
     }
 }
 
-void gen_intermediate_code(CPUXtensaState *env, TranslationBlock *tb)
+void gen_intermediate_code(CPUState *cs, TranslationBlock *tb)
 {
-    XtensaCPU *cpu = xtensa_env_get_cpu(env);
-    CPUState *cs = CPU(cpu);
+    CPUXtensaState *env = cs->env_ptr;
     DisasContext dc;
     int insn_count = 0;
     int max_insns = tb->cflags & CF_COUNT_MASK;
