Received: by 10.25.44.15 with SMTP id s15csp706641lfs;
        Fri, 14 Jul 2017 02:58:47 -0700 (PDT)
X-Received: by 10.223.179.8 with SMTP id j8mr1411731wrd.190.1500026327653;
        Fri, 14 Jul 2017 02:58:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1500026327; cv=none;
        d=google.com; s=arc-20160816;
        b=AYDoKqfjcz1Y6fRU7T+KSZUCJN1dtYvrsEs1adSVgk1kO5Lw9iBkxML1vKXCBPH9yj
         1FhBa8KMiIWW8jTAHLMEJyI7xipIxuT7cg20NcJ+XwKclAb0IBsNpzpLnwnvQ7I2kGaA
         cLvInmAFFFXgwtbE/UZPK1gxnESCU8rhxBt4kuIQk8H/e7mFJVPVNZYF0EAzykOroNY6
         9i2VuS/J10sps6ev90SNPsT9sb11nPAMS2kd/UyK/jR6rdAW7IGJTbM3fgU0zo8X5lPm
         /++uADPyuTubTalthVvuO5RSc5sQS2UFf7DlwqN84uywwxWgmPU35GveE/EvghJ2Z7Tr
         CFkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:user-agent:references
         :in-reply-to:message-id:date:subject:cc:to:from
         :arc-authentication-results;
        bh=2tz178rp8V2WNIk6+iYUMd+NGkBVqR9y4plWnPvv8hg=;
        b=O5kusgHendXU74jOuJj3TGgVnseB4QEEtQC9MLQrCYJjPrsbczrtvb6e1+HrFrXLXJ
         fG3nBQKTazQuA2LxT7eVcDDaiLki6gs3bO7aTbxKwuKD2Kj8PXjowCQWGHibN2FCyxCJ
         7MdMCYPXOY1PXe3POyV9+4d2loewVmSy/bZVmkM7UEJXi4Gp7ojvT2lhLzGwhboWIUkH
         QrAEJDFJZ2eYZ+GAv9eD84iL3gH+h63LlcopFDomGj08OFtIJoAd+oG2zRNcepOmBEK3
         25XvARIi12S/iImCLnYKzRsQ5vVm7tTAQ0AcSnLBiRowbYUo79vwUIQFJu19huUumL9d
         08Kw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of vilanova@ac.upc.edu designates 147.83.33.10 as permitted sender) smtp.mailfrom=vilanova@ac.upc.edu
Return-Path: <vilanova@ac.upc.edu>
Received: from roura.ac.upc.es (roura.ac.upc.es. [147.83.33.10])
        by mx.google.com with ESMTP id p195si1929444wmb.9.2017.07.14.02.58.47;
        Fri, 14 Jul 2017 02:58:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of vilanova@ac.upc.edu designates 147.83.33.10 as permitted sender) client-ip=147.83.33.10;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of vilanova@ac.upc.edu designates 147.83.33.10 as permitted sender) smtp.mailfrom=vilanova@ac.upc.edu
Received: from correu-2.ac.upc.es (correu-2.ac.upc.es [147.83.30.92])
	by roura.ac.upc.es (8.13.8/8.13.8) with ESMTP id v6E9whHE010554;
	Fri, 14 Jul 2017 11:58:44 +0200
Received: from localhost (unknown [31.210.188.120])
	by correu-2.ac.upc.es (Postfix) with ESMTPSA id 003B03A9;
	Fri, 14 Jul 2017 11:58:36 +0200 (CEST)
From: =?utf-8?b?TGx1w61z?= Vilanova <vilanova@ac.upc.edu>
To: qemu-devel@nongnu.org
Cc: "Emilio G. Cota" <cota@braap.org>,
        =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
        Richard Henderson <rth@twiddle.net>,
        Peter Crosthwaite <crosthwaite.peter@gmail.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Peter Maydell <peter.maydell@linaro.org>,
        qemu-arm@nongnu.org (open list:ARM)
Subject: [PATCH v13 26/26] target/arm: [tcg] Port to generic translation framework
Date: Fri, 14 Jul 2017 12:58:33 +0300
Message-Id: <150002631325.22386.10348327185029496649.stgit@frigg.lan>
X-Mailer: git-send-email 2.13.2
In-Reply-To: <150002001195.22386.4679134058536830996.stgit@frigg.lan>
References: <150002001195.22386.4679134058536830996.stgit@frigg.lan>
User-Agent: StGit/0.17.1-dirty
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TUID: pLza0BZKhBQu

Signed-off-by: Lluís Vilanova <vilanova@ac.upc.edu>
---
 target/arm/translate-a64.c |  106 +++++++------------------------------------
 target/arm/translate.c     |  108 ++++++++------------------------------------
 target/arm/translate.h     |    8 ---
 3 files changed, 38 insertions(+), 184 deletions(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 5de7fbde29..963e0c3433 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -11250,6 +11250,11 @@ static void aarch64_tr_init_disas_context(DisasContextBase *dcbase,
     init_tmp_a64_array(dc);
 }
 
+static void aarch64_tr_tb_start(DisasContextBase *db, CPUState *cpu,
+                                int *max_insns)
+{
+}
+
 static void aarch64_tr_insn_start(DisasContextBase *dcbase, CPUState *cpu)
 {
     DisasContext *dc = container_of(dcbase, DisasContext, base);
@@ -11378,6 +11383,9 @@ static void aarch64_tr_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
             break;
         }
     }
+
+    /* Functions above can change dc->pc, so re-align db->pc_next */
+    dc->base.pc_next = dc->pc;
 }
 
 static void aarch64_tr_disas_log(const DisasContextBase *dcbase,
@@ -11390,92 +11398,12 @@ static void aarch64_tr_disas_log(const DisasContextBase *dcbase,
                      4 | (bswap_code(dc->sctlr_b) ? 2 : 0));
 }
 
-void gen_intermediate_code_a64(DisasContextBase *dcbase, CPUState *cs,
-                               TranslationBlock *tb)
-{
-    DisasContext *dc = container_of(dcbase, DisasContext, base);
-    int max_insns;
-
-    dc->base.tb = tb;
-    dc->base.pc_first = dc->base.tb->pc;
-    dc->base.pc_next = dc->base.pc_first;
-    dc->base.is_jmp = DISAS_NEXT;
-    dc->base.num_insns = 0;
-    dc->base.singlestep_enabled = cs->singlestep_enabled;
-    aarch64_tr_init_disas_context(&dc->base, cs);
-
-    max_insns = dc->base.tb->cflags & CF_COUNT_MASK;
-    if (max_insns == 0) {
-        max_insns = CF_COUNT_MASK;
-    }
-    if (max_insns > TCG_MAX_INSNS) {
-        max_insns = TCG_MAX_INSNS;
-    }
-
-    gen_tb_start(tb);
-
-    tcg_clear_temp_count();
-
-    do {
-        dc->base.num_insns++;
-        aarch64_tr_insn_start(&dc->base, cs);
-
-        if (unlikely(!QTAILQ_EMPTY(&cs->breakpoints))) {
-            CPUBreakpoint *bp;
-            QTAILQ_FOREACH(bp, &cs->breakpoints, entry) {
-                if (bp->pc == dc->base.pc_next) {
-                    if (aarch64_tr_breakpoint_check(&dc->base, cs, bp)) {
-                        break;
-                    }
-                }
-            }
-
-            if (dc->base.is_jmp == DISAS_NORETURN) {
-                break;
-            }
-        }
-
-        if (dc->base.num_insns == max_insns && (dc->base.tb->cflags & CF_LAST_IO)) {
-            gen_io_start();
-        }
-
-        dc->base.pc_next = aarch64_tr_translate_insn(&dc->base, cs);
-
-        if (tcg_check_temp_count()) {
-            fprintf(stderr, "TCG temporary leak before "TARGET_FMT_lx"\n",
-                    dc->pc);
-        }
-
-        if (!dc->base.is_jmp && (tcg_op_buf_full() || cs->singlestep_enabled ||
-                            singlestep || dc->base.num_insns >= max_insns)) {
-            dc->base.is_jmp = DISAS_TOO_MANY;
-        }
-
-        /* Translation stops when a conditional branch is encountered.
-         * Otherwise the subsequent code could get translated several times.
-         * Also stop translation when a page boundary is reached.  This
-         * ensures prefetch aborts occur at the right place.
-         */
-    } while (!dc->base.is_jmp);
-
-    aarch64_tr_tb_stop(&dc->base, cs);
-
-    if (dc->base.tb->cflags & CF_LAST_IO) {
-        gen_io_end();
-    }
-
-    gen_tb_end(tb, dc->base.num_insns);
-
-#ifdef DEBUG_DISAS
-    if (qemu_loglevel_mask(CPU_LOG_TB_IN_ASM) &&
-        qemu_log_in_addr_range(dc->base.pc_first)) {
-        qemu_log_lock();
-        qemu_log("----------------\n");
-        aarch64_tr_disas_log(&dc->base, cs);
-        qemu_log("\n");
-        qemu_log_unlock();
-    }
-#endif
-    dc->base.tb->size = dc->pc - dc->base.pc_first;
-    dc->base.tb->icount = dc->base.num_insns;
-}
+const TranslatorOps aarch64_translator_ops = {
+    .init_disas_context = aarch64_tr_init_disas_context,
+    .tb_start           = aarch64_tr_tb_start,
+    .insn_start         = aarch64_tr_insn_start,
+    .breakpoint_check   = aarch64_tr_breakpoint_check,
+    .translate_insn     = aarch64_tr_translate_insn,
+    .tb_stop            = aarch64_tr_tb_stop,
+    .disas_log          = aarch64_tr_disas_log,
+};
diff --git a/target/arm/translate.c b/target/arm/translate.c
index 507f51d001..ea27a7f70b 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -12133,6 +12133,9 @@ static void arm_tr_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
             gen_goto_tb(dc, 1, dc->pc);
         }
     }
+
+    /* Functions above can change dc->pc, so re-align db->pc_next */
+    dc->base.pc_next = dc->pc;
 }
 
 static void arm_tr_disas_log(const DisasContextBase *dcbase, CPUState *cpu)
@@ -12144,100 +12147,29 @@ static void arm_tr_disas_log(const DisasContextBase *dcbase, CPUState *cpu)
                      dc->thumb | (dc->sctlr_b << 1));
 }
 
+static const TranslatorOps arm_translator_ops = {
+    .init_disas_context = arm_tr_init_disas_context,
+    .tb_start           = arm_tr_tb_start,
+    .insn_start         = arm_tr_insn_start,
+    .breakpoint_check   = arm_tr_breakpoint_check,
+    .translate_insn     = arm_tr_translate_insn,
+    .tb_stop            = arm_tr_tb_stop,
+    .disas_log          = arm_tr_disas_log,
+};
+
 /* generate intermediate code for basic block 'tb'.  */
-void gen_intermediate_code(CPUState *cs, TranslationBlock *tb)
+void gen_intermediate_code(CPUState *cpu, TranslationBlock *tb)
 {
-    DisasContext dc1, *dc = &dc1;
-    int max_insns;
+    DisasContext dc;
+    const TranslatorOps *ops = &arm_translator_ops;
 
-    /* generate intermediate code */
-
-    /* The A64 decoder has its own top level loop, because it doesn't need
-     * the A32/T32 complexity to do with conditional execution/IT blocks/etc.
-     */
+#ifdef TARGET_AARCH64
     if (ARM_TBFLAG_AARCH64_STATE(tb->flags)) {
-        gen_intermediate_code_a64(&dc->base, cs, tb);
-        return;
-    }
-
-    dc->base.tb = tb;
-    dc->base.pc_first = dc->base.tb->pc;
-    dc->base.pc_next = dc->base.pc_first;
-    dc->base.is_jmp = DISAS_NEXT;
-    dc->base.num_insns = 0;
-    dc->base.singlestep_enabled = cs->singlestep_enabled;
-    arm_tr_init_disas_context(&dc->base, cs);
-
-
-    max_insns = tb->cflags & CF_COUNT_MASK;
-    if (max_insns == 0) {
-        max_insns = CF_COUNT_MASK;
-    }
-    if (max_insns > TCG_MAX_INSNS) {
-        max_insns = TCG_MAX_INSNS;
-    }
-
-    gen_tb_start(tb);
-
-    tcg_clear_temp_count();
-    arm_tr_tb_start(&dc->base, cs, &max_insns);
-
-    do {
-        dc->base.num_insns++;
-        arm_tr_insn_start(&dc->base, cs);
-
-        if (unlikely(!QTAILQ_EMPTY(&cs->breakpoints))) {
-            CPUBreakpoint *bp;
-            QTAILQ_FOREACH(bp, &cs->breakpoints, entry) {
-                if (bp->pc == dc->base.pc_next) {
-                    if (arm_tr_breakpoint_check(&dc->base, cs, bp)) {
-                        break;
-                    }
-                }
-            }
-
-            if (dc->base.is_jmp == DISAS_NORETURN) {
-                break;
-            }
-        }
-
-        if (dc->base.num_insns == max_insns && (tb->cflags & CF_LAST_IO)) {
-            gen_io_start();
-        }
-
-        dc->base.pc_next = arm_tr_translate_insn(&dc->base, cs);
-
-        if (tcg_check_temp_count()) {
-            fprintf(stderr, "TCG temporary leak before "TARGET_FMT_lx"\n",
-                    dc->pc);
-        }
-
-        if (!dc->base.is_jmp && (tcg_op_buf_full() || singlestep ||
-                            dc->base.num_insns >= max_insns)) {
-            dc->base.is_jmp = DISAS_TOO_MANY;
-        }
-    } while (!dc->base.is_jmp);
-
-    arm_tr_tb_stop(&dc->base, cs);
-
-    if (dc->base.tb->cflags & CF_LAST_IO) {
-        gen_io_end();
-    }
-
-    gen_tb_end(tb, dc->base.num_insns);
-
-#ifdef DEBUG_DISAS
-    if (qemu_loglevel_mask(CPU_LOG_TB_IN_ASM) &&
-        qemu_log_in_addr_range(dc->base.pc_first)) {
-        qemu_log_lock();
-        qemu_log("----------------\n");
-        arm_tr_disas_log(&dc->base, cs);
-        qemu_log("\n");
-        qemu_log_unlock();
+        ops = &aarch64_translator_ops;
     }
 #endif
-    tb->size = dc->pc - dc->base.pc_first;
-    tb->icount = dc->base.num_insns;
+
+    translator_loop(ops, &dc.base, cpu, tb);
 }
 
 static const char *cpu_mode_names[16] = {
diff --git a/target/arm/translate.h b/target/arm/translate.h
index 720cb102e3..0337cec52b 100644
--- a/target/arm/translate.h
+++ b/target/arm/translate.h
@@ -152,21 +152,15 @@ static void disas_set_insn_syndrome(DisasContext *s, uint32_t syn)
 
 #ifdef TARGET_AARCH64
 void a64_translate_init(void);
-void gen_intermediate_code_a64(DisasContextBase *db, CPUState *cpu,
-                               TranslationBlock *tb);
 void gen_a64_set_pc_im(uint64_t val);
 void aarch64_cpu_dump_state(CPUState *cs, FILE *f,
                             fprintf_function cpu_fprintf, int flags);
+extern const TranslatorOps aarch64_translator_ops;
 #else
 static inline void a64_translate_init(void)
 {
 }
 
-static inline void gen_intermediate_code_a64(DisasContextBase *db, CPUState *cpu,
-                                             TranslationBlock *tb)
-{
-}
-
 static inline void gen_a64_set_pc_im(uint64_t val)
 {
 }
