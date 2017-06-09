Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id b8sm2423863wrb.7.2017.06.09.10.00.42
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 09 Jun 2017 10:00:44 -0700 (PDT)
Received: from zen.linaroharston (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTP id BC4E93E0464;
	Fri,  9 Jun 2017 18:01:11 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org,
	pbonzini@redhat.com,
	edgar.iglesias@xilinx.com,
	cota@braap.org
Cc: qemu-devel@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	Richard Henderson <rth@twiddle.net>,
	qemu-arm@nongnu.org (open list:ARM)
Subject: [RFC DEBUG PATCH 3/3] translate-a64: fix lookup_tb_ptr hang (DEBUG!)
Date: Fri,  9 Jun 2017 18:01:00 +0100
Message-Id: <20170609170100.3599-4-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.13.0
In-Reply-To: <20170609170100.3599-1-alex.bennee@linaro.org>
References: <20170609170100.3599-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: xXojmshJ2oH4

THIS IS A DEBUG PATCH DO NOT MERGE

I include all the comments to show my working. I was trying to
isolate which instructions cause the problem. It turns out it is the
RET instruction. I don't understand why because AFAICT it is a
pretty much a BR instruction.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 include/exec/exec-all.h    |  2 ++
 target/arm/translate-a64.c | 21 +++++++++++++++++----
 target/arm/translate.h     |  2 ++
 tcg-runtime.c              |  4 +++-
 4 files changed, 24 insertions(+), 5 deletions(-)

diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
index 87ae10bcc9..6c0c4825aa 100644
--- a/include/exec/exec-all.h
+++ b/include/exec/exec-all.h
@@ -326,6 +326,8 @@ struct TranslationBlock {
 
     uint16_t invalid;
 
+    bool is_magic;
+
     void *tc_ptr;    /* pointer to the translated code */
     uint8_t *tc_search;  /* pointer to search data */
     /* original tb when cflags has CF_NOCACHE */
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 860e279658..6dd6fd70d0 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -1394,6 +1394,7 @@ static void handle_sync(DisasContext *s, uint32_t insn,
          * any pending interrupts immediately.
          */
         s->is_jmp = DISAS_UPDATE;
+        /* s->is_magic = true; */
         return;
     default:
         unallocated_encoding(s);
@@ -1423,6 +1424,7 @@ static void handle_msr_i(DisasContext *s, uint32_t insn,
         tcg_temp_free_i32(tcg_imm);
         tcg_temp_free_i32(tcg_op);
         s->is_jmp = DISAS_UPDATE;
+        /* s->is_magic = true; */
         break;
     }
     default:
@@ -1592,12 +1594,14 @@ static void handle_sys(DisasContext *s, uint32_t insn, bool isread,
         /* I/O operations must end the TB here (whether read or write) */
         gen_io_end();
         s->is_jmp = DISAS_UPDATE;
+        /* s->is_magic = true; */
     } else if (!isread && !(ri->type & ARM_CP_SUPPRESS_TB_END)) {
         /* We default to ending the TB on a coprocessor register write,
          * but allow this to be suppressed by the register definition
          * (usually only necessary to work around guest bugs).
          */
         s->is_jmp = DISAS_UPDATE;
+        /* s->is_magic = true; */
     }
 }
 
@@ -1772,13 +1776,18 @@ static void disas_uncond_b_reg(DisasContext *s, uint32_t insn)
 
     switch (opc) {
     case 0: /* BR */
+        /* s->is_magic = true; */
+        gen_a64_set_pc(s, cpu_reg(s, rn));
+        break;
     case 1: /* BLR */
-    case 2: /* RET */
+        /* s->is_magic = true; */
         gen_a64_set_pc(s, cpu_reg(s, rn));
         /* BLR also needs to load return address */
-        if (opc == 1) {
-            tcg_gen_movi_i64(cpu_reg(s, 30), s->pc);
-        }
+        tcg_gen_movi_i64(cpu_reg(s, 30), s->pc);
+        break;
+    case 2: /* RET */
+        s->is_magic = true;
+        gen_a64_set_pc(s, cpu_reg(s, rn));
         break;
     case 4: /* ERET */
         if (s->current_el == 0) {
@@ -1787,6 +1796,7 @@ static void disas_uncond_b_reg(DisasContext *s, uint32_t insn)
         }
         gen_helper_exception_return(cpu_env);
         s->is_jmp = DISAS_JUMP;
+        /* s->is_magic = true; */
         return;
     case 5: /* DRPS */
         if (rn != 0x1f) {
@@ -11250,6 +11260,7 @@ void gen_intermediate_code_a64(ARMCPU *cpu, TranslationBlock *tb)
     dc->pstate_ss = ARM_TBFLAG_PSTATE_SS(tb->flags);
     dc->is_ldex = false;
     dc->ss_same_el = (arm_debug_target_el(env) == dc->current_el);
+    dc->is_magic = false;
 
     init_tmp_a64_array(dc);
 
@@ -11281,6 +11292,7 @@ void gen_intermediate_code_a64(ARMCPU *cpu, TranslationBlock *tb)
                         gen_helper_check_breakpoints(cpu_env);
                         /* End the TB early; it likely won't be executed */
                         dc->is_jmp = DISAS_UPDATE;
+                        /* dc->is_magic = true; */
                     } else {
                         gen_exception_internal_insn(dc, 0, EXCP_DEBUG);
                         /* The address covered by the breakpoint must be
@@ -11367,6 +11379,7 @@ void gen_intermediate_code_a64(ARMCPU *cpu, TranslationBlock *tb)
             gen_a64_set_pc_im(dc->pc);
             /* fall through */
         case DISAS_JUMP:
+            tb->is_magic = dc->is_magic;
             tcg_gen_lookup_and_goto_ptr(cpu_pc);
             break;
         case DISAS_TB_JUMP:
diff --git a/target/arm/translate.h b/target/arm/translate.h
index 15d383d9af..786eb19335 100644
--- a/target/arm/translate.h
+++ b/target/arm/translate.h
@@ -62,6 +62,8 @@ typedef struct DisasContext {
     bool ss_same_el;
     /* Bottom two bits of XScale c15_cpar coprocessor access control reg */
     int c15_cpar;
+
+    bool is_magic;
     /* TCG op index of the current insn_start.  */
     int insn_start_idx;
 #define TMP_A64_MAX 16
diff --git a/tcg-runtime.c b/tcg-runtime.c
index e987c1f6bb..d9d7c52ae9 100644
--- a/tcg-runtime.c
+++ b/tcg-runtime.c
@@ -168,7 +168,9 @@ void *HELPER(lookup_tb_ptr)(CPUArchState *env, target_ulong addr)
             tb = tb_htable_lookup(cpu, addr, cs_base, flags);
             if (likely(tb)) {
                 atomic_set(&cpu->tb_jmp_cache[addr_hash], tb);
-                code_ptr = tb->tc_ptr;
+                if (!tb->is_magic) {
+                    code_ptr = tb->tc_ptr;
+                }
             }
         }
     }
-- 
2.13.0
