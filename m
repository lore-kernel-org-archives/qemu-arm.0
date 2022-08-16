Received: by 2002:a17:906:3b11:0:0:0:0 with SMTP id g17csp2009153ejf;
        Tue, 16 Aug 2022 13:34:53 -0700 (PDT)
X-Received: by 2002:a05:6808:120c:b0:325:731e:923 with SMTP id a12-20020a056808120c00b00325731e0923mr136722oil.155.1660682093263;
        Tue, 16 Aug 2022 13:34:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1660682093; cv=none;
        d=google.com; s=arc-20160816;
        b=FRP8SKi6iB/cmBhh7FyZxrT7UE4ngi2K6G1MGvr5VnD4EE5hw38+KvUlQr/xRm3xlw
         jAftqFME+37KqJlHwtKF6ai89l36Ob5Dx+YymUq6tuGU2HD10nstGmeATh6YohIU6L3Q
         YZEJ08sR5TRBLM8HOZwT+4XYLgo/ts9VfhP9y3Etbvp9mC8/HlXypL2tBZLuXkZYqz8O
         tXLW7PzF5c7vRmBfvZgxqoxLFHySDw6/1u+EcuAuwMv4Vw4m1020h3gn8A/m4Xs+/xUA
         P6d2jZTdTLMrDfyXE19lRWF0Q+01chWANohlBWY6D6NJlm7KDaMOEF5w2a77SktzOLIb
         3PCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=AjCZW8xJUb6I9643NCyfNU4X/BcXHb1WVao5dY2EkTM=;
        b=eOVZpQR/zq/DazQLGBZy4mQNKyw3JBKYUzspUphbPU97N/oQzPO9HCeva+wdZ2mzb1
         GWka/3o/TgmFeCTJcdX45R2tO6tZbifspcUooIWrR1p9PGPLePQDYm78tWNKuu1kzBe+
         9qaslDTb4HGqCu62eRNoznGo6gGJoGS8mLT0uw3IlPCeNXLsjqSliRgatPyLc3nMpazU
         idJ4Gg67lkBOZO5VHErrPiJmFfmfpDmZjuQV+WpGaMt2RfyYmbD2+VAcsO3xPcN07shr
         8SA549L/xZTjkLZ+SWSevVi/nBvK/VqbjG94GNjVWk9XSqCxQ1C7F2qrOXSB63o6LLOZ
         Bo5Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jbDHQaNK;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id i3-20020a9d53c3000000b006369688f838sor1686013oth.136.2022.08.16.13.34.52
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 16 Aug 2022 13:34:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jbDHQaNK;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=AjCZW8xJUb6I9643NCyfNU4X/BcXHb1WVao5dY2EkTM=;
        b=jbDHQaNKm7aiuBVpeSiYybl7SWyqypq1yrBakIUdvrrn2QQ9srqzEv+fnCP0J0FIT2
         ydc++NFJJTsj4QOtd9YCM6vonZS5/ElEJ2xN8LLJxC/R6RlNEo4epWiLmOo5cjk8/HEo
         D9HtfUX6mSE3opKTbBWHeW+uk7NkWTserwA98ePhd+4zUz6GUQF9OhTJOnuXDOajglSN
         l+d50rvcoNk9A3unDcbTVA+qpXuY4/fK+ScBQRpBNkoo6tjR1p1smK8j8V5MJSk5bgeV
         aEjSthDyeYIT4J4o1kHwbWlb3kEJ8g4i7AZVRFR5rXHlEARC0zMiku0m3hzW0u7hUjMw
         ir5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=AjCZW8xJUb6I9643NCyfNU4X/BcXHb1WVao5dY2EkTM=;
        b=Ysf5kLJCHqf7RyQYE/DwQhQAaH3jMmvk+it3dvmgAYpVPMbgdJ9vXY755Y1r8Ws+T3
         a8wUAYfyFel+j2qt4FHVzAXvIH+5W2IesIOsz56Ve9PpuwEyikgYYqCDBDUUx+I6OIdY
         acsQ1Iof2AsZ3nOx8p6NM9ggGwpy4NfeMFpXgsgKeaa0WnV2lgcU222MTj+Ud48v0CI4
         YqffBHi5WouOCYLJTWgOSfK1UYN0sluqpbrp8jFoJmFS50oHM8GabnHXAabBMsUXhn9u
         9jdg6nWYO5NZdpvw+u4BOy5wwO5ewkqtebTBUUeXdnfFgkdvhFRr2vGjKy2c+Y8eei4P
         tJYw==
X-Gm-Message-State: ACgBeo3j35GnnpeTsa9b5kuMdQe+saY5v/Nek04EBEbMnsR81jtSCfVt
	UjagAzfXj16BOYK6KECN2QqmpY06
X-Google-Smtp-Source: AA6agR7E7XFbbk7nIu7SpbNSWPZXXYg2YZl3XI4aXPHVd9gdLMfutzuVpp7H5wE/8NxJKQ+RYorxjg==
X-Received: by 2002:a9d:65c2:0:b0:638:d9ec:4a9b with SMTP id z2-20020a9d65c2000000b00638d9ec4a9bmr902623oth.83.1660682092639;
        Tue, 16 Aug 2022 13:34:52 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from stoup.. ([2605:ef80:80f6:61fa:9bc2:5095:d612:5e22])
        by smtp.gmail.com with ESMTPSA id y23-20020a056870b01700b0010ef8ccde67sm2285220oae.13.2022.08.16.13.34.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Aug 2022 13:34:52 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	alex.bennee@linaro.org,
	iii@linux.ibm.com
Subject: [PATCH v2 22/33] accel/tcg: Introduce tb_pc and tb_pc_log
Date: Tue, 16 Aug 2022 15:33:49 -0500
Message-Id: <20220816203400.161187-23-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220816203400.161187-1-richard.henderson@linaro.org>
References: <20220816203400.161187-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: wf22+9hju5/T

The availability of tb->pc will shortly be conditional.
Introduce accessor functions to minimize ifdefs.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/exec-all.h                 | 12 ++++++++++
 accel/tcg/cpu-exec.c                    | 20 ++++++++---------
 accel/tcg/translate-all.c               | 29 +++++++++++++------------
 target/arm/cpu.c                        |  4 ++--
 target/avr/cpu.c                        |  2 +-
 target/hexagon/cpu.c                    |  2 +-
 target/hppa/cpu.c                       |  4 ++--
 target/i386/tcg/tcg-cpu.c               |  2 +-
 target/loongarch/cpu.c                  |  2 +-
 target/microblaze/cpu.c                 |  2 +-
 target/mips/tcg/exception.c             |  2 +-
 target/mips/tcg/sysemu/special_helper.c |  2 +-
 target/openrisc/cpu.c                   |  2 +-
 target/riscv/cpu.c                      |  4 ++--
 target/rx/cpu.c                         |  2 +-
 target/sh4/cpu.c                        |  4 ++--
 target/sparc/cpu.c                      |  2 +-
 target/tricore/cpu.c                    |  2 +-
 tcg/tcg.c                               |  6 ++---
 19 files changed, 59 insertions(+), 46 deletions(-)

diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
index 4ad166966b..cec3ef1666 100644
--- a/include/exec/exec-all.h
+++ b/include/exec/exec-all.h
@@ -533,6 +533,18 @@ struct TranslationBlock {
     uintptr_t jmp_dest[2];
 };
 
+/* Hide the read to avoid ifdefs for TARGET_TB_PCREL. */
+static inline target_ulong tb_pc(const TranslationBlock *tb)
+{
+    return tb->pc;
+}
+
+/* Similarly, but for logs. */
+static inline target_ulong tb_pc_log(const TranslationBlock *tb)
+{
+    return tb->pc;
+}
+
 /* Hide the qatomic_read to make code a little easier on the eyes */
 static inline uint32_t tb_cflags(const TranslationBlock *tb)
 {
diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
index 3f8e4bbbc8..f146960b7b 100644
--- a/accel/tcg/cpu-exec.c
+++ b/accel/tcg/cpu-exec.c
@@ -185,7 +185,7 @@ static bool tb_lookup_cmp(const void *p, const void *d)
     const TranslationBlock *tb = p;
     const struct tb_desc *desc = d;
 
-    if (tb->pc == desc->pc &&
+    if (tb_pc(tb) == desc->pc &&
         tb->page_addr[0] == desc->page_addr0 &&
         tb->cs_base == desc->cs_base &&
         tb->flags == desc->flags &&
@@ -413,7 +413,7 @@ cpu_tb_exec(CPUState *cpu, TranslationBlock *itb, int *tb_exit)
     TranslationBlock *last_tb;
     const void *tb_ptr = itb->tc.ptr;
 
-    log_cpu_exec(itb->pc, cpu, itb);
+    log_cpu_exec(tb_pc_log(itb), cpu, itb);
 
     qemu_thread_jit_execute();
     ret = tcg_qemu_tb_exec(env, tb_ptr);
@@ -437,16 +437,16 @@ cpu_tb_exec(CPUState *cpu, TranslationBlock *itb, int *tb_exit)
          * of the start of the TB.
          */
         CPUClass *cc = CPU_GET_CLASS(cpu);
-        qemu_log_mask_and_addr(CPU_LOG_EXEC, last_tb->pc,
+        qemu_log_mask_and_addr(CPU_LOG_EXEC, tb_pc_log(last_tb),
                                "Stopped execution of TB chain before %p ["
                                TARGET_FMT_lx "] %s\n",
-                               last_tb->tc.ptr, last_tb->pc,
-                               lookup_symbol(last_tb->pc));
+                               last_tb->tc.ptr, tb_pc_log(last_tb),
+                               lookup_symbol(tb_pc_log(last_tb)));
         if (cc->tcg_ops->synchronize_from_tb) {
             cc->tcg_ops->synchronize_from_tb(cpu, last_tb);
         } else {
             assert(cc->set_pc);
-            cc->set_pc(cpu, last_tb->pc);
+            cc->set_pc(cpu, tb_pc(last_tb));
         }
     }
 
@@ -588,11 +588,11 @@ static inline void tb_add_jump(TranslationBlock *tb, int n,
 
     qemu_spin_unlock(&tb_next->jmp_lock);
 
-    qemu_log_mask_and_addr(CPU_LOG_EXEC, tb->pc,
+    qemu_log_mask_and_addr(CPU_LOG_EXEC, tb_pc_log(tb),
                            "Linking TBs %p [" TARGET_FMT_lx
                            "] index %d -> %p [" TARGET_FMT_lx "]\n",
-                           tb->tc.ptr, tb->pc, n,
-                           tb_next->tc.ptr, tb_next->pc);
+                           tb->tc.ptr, tb_pc_log(tb), n,
+                           tb_next->tc.ptr, tb_pc_log(tb_next));
     return;
 
  out_unlock_next:
@@ -842,7 +842,7 @@ static inline void cpu_loop_exec_tb(CPUState *cpu, TranslationBlock *tb,
 {
     int32_t insns_left;
 
-    trace_exec_tb(tb, tb->pc);
+    trace_exec_tb(tb, tb_pc_log(tb));
     tb = cpu_tb_exec(cpu, tb, tb_exit);
     if (*tb_exit != TB_EXIT_REQUESTED) {
         *last_tb = tb;
diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
index c2745f14a6..1248ee3433 100644
--- a/accel/tcg/translate-all.c
+++ b/accel/tcg/translate-all.c
@@ -298,7 +298,7 @@ static int encode_search(TranslationBlock *tb, uint8_t *block)
 
         for (j = 0; j < TARGET_INSN_START_WORDS; ++j) {
             if (i == 0) {
-                prev = (j == 0 ? tb->pc : 0);
+                prev = (j == 0 ? tb_pc(tb) : 0);
             } else {
                 prev = tcg_ctx->gen_insn_data[i - 1][j];
             }
@@ -326,7 +326,7 @@ static int encode_search(TranslationBlock *tb, uint8_t *block)
 static int cpu_restore_state_from_tb(CPUState *cpu, TranslationBlock *tb,
                                      uintptr_t searched_pc, bool reset_icount)
 {
-    target_ulong data[TARGET_INSN_START_WORDS] = { tb->pc };
+    target_ulong data[TARGET_INSN_START_WORDS] = { tb_pc(tb) };
     uintptr_t host_pc = (uintptr_t)tb->tc.ptr;
     CPUArchState *env = cpu->env_ptr;
     const uint8_t *p = tb->tc.ptr + tb->tc.size;
@@ -884,7 +884,7 @@ static bool tb_cmp(const void *ap, const void *bp)
     const TranslationBlock *a = ap;
     const TranslationBlock *b = bp;
 
-    return a->pc == b->pc &&
+    return tb_pc(a) == tb_pc(b) &&
         a->cs_base == b->cs_base &&
         a->flags == b->flags &&
         (tb_cflags(a) & ~CF_INVALID) == (tb_cflags(b) & ~CF_INVALID) &&
@@ -1012,9 +1012,10 @@ static void do_tb_invalidate_check(void *p, uint32_t hash, void *userp)
     TranslationBlock *tb = p;
     target_ulong addr = *(target_ulong *)userp;
 
-    if (!(addr + TARGET_PAGE_SIZE <= tb->pc || addr >= tb->pc + tb->size)) {
+    if (!(addr + TARGET_PAGE_SIZE <= tb_pc(tb) ||
+          addr >= tb_pc(tb) + tb->size)) {
         printf("ERROR invalidate: address=" TARGET_FMT_lx
-               " PC=%08lx size=%04x\n", addr, (long)tb->pc, tb->size);
+               " PC=%08lx size=%04x\n", addr, (long)tb_pc(tb), tb->size);
     }
 }
 
@@ -1033,11 +1034,11 @@ static void do_tb_page_check(void *p, uint32_t hash, void *userp)
     TranslationBlock *tb = p;
     int flags1, flags2;
 
-    flags1 = page_get_flags(tb->pc);
-    flags2 = page_get_flags(tb->pc + tb->size - 1);
+    flags1 = page_get_flags(tb_pc(tb));
+    flags2 = page_get_flags(tb_pc(tb) + tb->size - 1);
     if ((flags1 & PAGE_WRITE) || (flags2 & PAGE_WRITE)) {
         printf("ERROR page flags: PC=%08lx size=%04x f1=%x f2=%x\n",
-               (long)tb->pc, tb->size, flags1, flags2);
+               (long)tb_pc(tb), tb->size, flags1, flags2);
     }
 }
 
@@ -1168,7 +1169,7 @@ static void do_tb_phys_invalidate(TranslationBlock *tb, bool rm_from_page_list)
 
     /* remove the TB from the hash list */
     phys_pc = tb->page_addr[0];
-    h = tb_hash_func(phys_pc, tb->pc, tb->flags, orig_cflags,
+    h = tb_hash_func(phys_pc, tb_pc(tb), tb->flags, orig_cflags,
                      tb->trace_vcpu_dstate);
     if (!qht_remove(&tb_ctx.htable, tb, h)) {
         return;
@@ -1299,7 +1300,7 @@ tb_link_page(TranslationBlock *tb, tb_page_addr_t phys_pc,
     }
 
     /* add in the hash table */
-    h = tb_hash_func(phys_pc, tb->pc, tb->flags, tb->cflags,
+    h = tb_hash_func(phys_pc, tb_pc(tb), tb->flags, tb->cflags,
                      tb->trace_vcpu_dstate);
     qht_insert(&tb_ctx.htable, tb, h, &existing_tb);
 
@@ -1399,7 +1400,7 @@ TranslationBlock *tb_gen_code(CPUState *cpu,
     tcg_ctx->cpu = NULL;
     max_insns = tb->icount;
 
-    trace_translate_block(tb, tb->pc, tb->tc.ptr);
+    trace_translate_block(tb, tb_pc_log(tb), tb->tc.ptr);
 
     /* generate machine code */
     tb->jmp_reset_offset[0] = TB_JMP_RESET_OFFSET_INVALID;
@@ -1476,7 +1477,7 @@ TranslationBlock *tb_gen_code(CPUState *cpu,
 
 #ifdef DEBUG_DISAS
     if (qemu_loglevel_mask(CPU_LOG_TB_OUT_ASM) &&
-        qemu_log_in_addr_range(tb->pc)) {
+        qemu_log_in_addr_range(tb_pc_log(tb))) {
         FILE *logfile = qemu_log_trylock();
         if (logfile) {
             int code_size, data_size;
@@ -1916,9 +1917,9 @@ void cpu_io_recompile(CPUState *cpu, uintptr_t retaddr)
      */
     cpu->cflags_next_tb = curr_cflags(cpu) | CF_MEMI_ONLY | CF_LAST_IO | n;
 
-    qemu_log_mask_and_addr(CPU_LOG_EXEC, tb->pc,
+    qemu_log_mask_and_addr(CPU_LOG_EXEC, tb_pc_log(tb),
                            "cpu_io_recompile: rewound execution of TB to "
-                           TARGET_FMT_lx "\n", tb->pc);
+                           TARGET_FMT_lx "\n", tb_pc_log(tb));
 
     cpu_loop_exit_noexc(cpu);
 }
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 7ec3281da9..047bf3f4ab 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -72,9 +72,9 @@ void arm_cpu_synchronize_from_tb(CPUState *cs,
      * never possible for an AArch64 TB to chain to an AArch32 TB.
      */
     if (is_a64(env)) {
-        env->pc = tb->pc;
+        env->pc = tb_pc(tb);
     } else {
-        env->regs[15] = tb->pc;
+        env->regs[15] = tb_pc(tb);
     }
 }
 #endif /* CONFIG_TCG */
diff --git a/target/avr/cpu.c b/target/avr/cpu.c
index 05b992ff73..6ebef62b4c 100644
--- a/target/avr/cpu.c
+++ b/target/avr/cpu.c
@@ -47,7 +47,7 @@ static void avr_cpu_synchronize_from_tb(CPUState *cs,
     AVRCPU *cpu = AVR_CPU(cs);
     CPUAVRState *env = &cpu->env;
 
-    env->pc_w = tb->pc / 2; /* internally PC points to words */
+    env->pc_w = tb_pc(tb) / 2; /* internally PC points to words */
 }
 
 static void avr_cpu_reset(DeviceState *ds)
diff --git a/target/hexagon/cpu.c b/target/hexagon/cpu.c
index fa9bd702d6..6289a6e64a 100644
--- a/target/hexagon/cpu.c
+++ b/target/hexagon/cpu.c
@@ -256,7 +256,7 @@ static void hexagon_cpu_synchronize_from_tb(CPUState *cs,
 {
     HexagonCPU *cpu = HEXAGON_CPU(cs);
     CPUHexagonState *env = &cpu->env;
-    env->gpr[HEX_REG_PC] = tb->pc;
+    env->gpr[HEX_REG_PC] = tb_pc(tb);
 }
 
 static bool hexagon_cpu_has_work(CPUState *cs)
diff --git a/target/hppa/cpu.c b/target/hppa/cpu.c
index a6f52caf14..fc9d43f620 100644
--- a/target/hppa/cpu.c
+++ b/target/hppa/cpu.c
@@ -42,7 +42,7 @@ static void hppa_cpu_synchronize_from_tb(CPUState *cs,
     HPPACPU *cpu = HPPA_CPU(cs);
 
 #ifdef CONFIG_USER_ONLY
-    cpu->env.iaoq_f = tb->pc;
+    cpu->env.iaoq_f = tb_pc(tb);
     cpu->env.iaoq_b = tb->cs_base;
 #else
     /* Recover the IAOQ values from the GVA + PRIV.  */
@@ -52,7 +52,7 @@ static void hppa_cpu_synchronize_from_tb(CPUState *cs,
     int32_t diff = cs_base;
 
     cpu->env.iasq_f = iasq_f;
-    cpu->env.iaoq_f = (tb->pc & ~iasq_f) + priv;
+    cpu->env.iaoq_f = (tb_pc(tb) & ~iasq_f) + priv;
     if (diff) {
         cpu->env.iaoq_b = cpu->env.iaoq_f + diff;
     }
diff --git a/target/i386/tcg/tcg-cpu.c b/target/i386/tcg/tcg-cpu.c
index 6fdfdf9598..76989a5a9d 100644
--- a/target/i386/tcg/tcg-cpu.c
+++ b/target/i386/tcg/tcg-cpu.c
@@ -51,7 +51,7 @@ static void x86_cpu_synchronize_from_tb(CPUState *cs,
 {
     X86CPU *cpu = X86_CPU(cs);
 
-    cpu->env.eip = tb->pc - tb->cs_base;
+    cpu->env.eip = tb_pc(tb) - tb->cs_base;
 }
 
 #ifndef CONFIG_USER_ONLY
diff --git a/target/loongarch/cpu.c b/target/loongarch/cpu.c
index 941e2772bc..262ddfb51c 100644
--- a/target/loongarch/cpu.c
+++ b/target/loongarch/cpu.c
@@ -309,7 +309,7 @@ static void loongarch_cpu_synchronize_from_tb(CPUState *cs,
     LoongArchCPU *cpu = LOONGARCH_CPU(cs);
     CPULoongArchState *env = &cpu->env;
 
-    env->pc = tb->pc;
+    env->pc = tb_pc(tb);
 }
 #endif /* CONFIG_TCG */
 
diff --git a/target/microblaze/cpu.c b/target/microblaze/cpu.c
index aed200dcff..5a642db285 100644
--- a/target/microblaze/cpu.c
+++ b/target/microblaze/cpu.c
@@ -89,7 +89,7 @@ static void mb_cpu_synchronize_from_tb(CPUState *cs,
 {
     MicroBlazeCPU *cpu = MICROBLAZE_CPU(cs);
 
-    cpu->env.pc = tb->pc;
+    cpu->env.pc = tb_pc(tb);
     cpu->env.iflags = tb->flags & IFLAGS_TB_MASK;
 }
 
diff --git a/target/mips/tcg/exception.c b/target/mips/tcg/exception.c
index 2bd77a61de..96e61170e6 100644
--- a/target/mips/tcg/exception.c
+++ b/target/mips/tcg/exception.c
@@ -82,7 +82,7 @@ void mips_cpu_synchronize_from_tb(CPUState *cs, const TranslationBlock *tb)
     MIPSCPU *cpu = MIPS_CPU(cs);
     CPUMIPSState *env = &cpu->env;
 
-    env->active_tc.PC = tb->pc;
+    env->active_tc.PC = tb_pc(tb);
     env->hflags &= ~MIPS_HFLAG_BMASK;
     env->hflags |= tb->flags & MIPS_HFLAG_BMASK;
 }
diff --git a/target/mips/tcg/sysemu/special_helper.c b/target/mips/tcg/sysemu/special_helper.c
index f4f8fe8afc..3c5f35c759 100644
--- a/target/mips/tcg/sysemu/special_helper.c
+++ b/target/mips/tcg/sysemu/special_helper.c
@@ -94,7 +94,7 @@ bool mips_io_recompile_replay_branch(CPUState *cs, const TranslationBlock *tb)
     CPUMIPSState *env = &cpu->env;
 
     if ((env->hflags & MIPS_HFLAG_BMASK) != 0
-        && env->active_tc.PC != tb->pc) {
+        && env->active_tc.PC != tb_pc(tb)) {
         env->active_tc.PC -= (env->hflags & MIPS_HFLAG_B16 ? 2 : 4);
         env->hflags &= ~MIPS_HFLAG_BMASK;
         return true;
diff --git a/target/openrisc/cpu.c b/target/openrisc/cpu.c
index 41d1b2a24a..10ea952ff2 100644
--- a/target/openrisc/cpu.c
+++ b/target/openrisc/cpu.c
@@ -36,7 +36,7 @@ static void openrisc_cpu_synchronize_from_tb(CPUState *cs,
 {
     OpenRISCCPU *cpu = OPENRISC_CPU(cs);
 
-    cpu->env.pc = tb->pc;
+    cpu->env.pc = tb_pc(tb);
 }
 
 
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index ac6f82ebd0..8cb9428a80 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -397,9 +397,9 @@ static void riscv_cpu_synchronize_from_tb(CPUState *cs,
     RISCVMXL xl = FIELD_EX32(tb->flags, TB_FLAGS, XL);
 
     if (xl == MXL_RV32) {
-        env->pc = (int32_t)tb->pc;
+        env->pc = (int32_t)tb_pc(tb);
     } else {
-        env->pc = tb->pc;
+        env->pc = tb_pc(tb);
     }
 }
 
diff --git a/target/rx/cpu.c b/target/rx/cpu.c
index fb30080ac4..f1e0008e04 100644
--- a/target/rx/cpu.c
+++ b/target/rx/cpu.c
@@ -37,7 +37,7 @@ static void rx_cpu_synchronize_from_tb(CPUState *cs,
 {
     RXCPU *cpu = RX_CPU(cs);
 
-    cpu->env.pc = tb->pc;
+    cpu->env.pc = tb_pc(tb);
 }
 
 static bool rx_cpu_has_work(CPUState *cs)
diff --git a/target/sh4/cpu.c b/target/sh4/cpu.c
index 06b2691dc4..6948c8fa33 100644
--- a/target/sh4/cpu.c
+++ b/target/sh4/cpu.c
@@ -39,7 +39,7 @@ static void superh_cpu_synchronize_from_tb(CPUState *cs,
 {
     SuperHCPU *cpu = SUPERH_CPU(cs);
 
-    cpu->env.pc = tb->pc;
+    cpu->env.pc = tb_pc(tb);
     cpu->env.flags = tb->flags & TB_FLAG_ENVFLAGS_MASK;
 }
 
@@ -51,7 +51,7 @@ static bool superh_io_recompile_replay_branch(CPUState *cs,
     CPUSH4State *env = &cpu->env;
 
     if ((env->flags & ((DELAY_SLOT | DELAY_SLOT_CONDITIONAL))) != 0
-        && env->pc != tb->pc) {
+        && env->pc != tb_pc(tb)) {
         env->pc -= 2;
         env->flags &= ~(DELAY_SLOT | DELAY_SLOT_CONDITIONAL);
         return true;
diff --git a/target/sparc/cpu.c b/target/sparc/cpu.c
index 55268ed2a1..0471c2fe5a 100644
--- a/target/sparc/cpu.c
+++ b/target/sparc/cpu.c
@@ -698,7 +698,7 @@ static void sparc_cpu_synchronize_from_tb(CPUState *cs,
 {
     SPARCCPU *cpu = SPARC_CPU(cs);
 
-    cpu->env.pc = tb->pc;
+    cpu->env.pc = tb_pc(tb);
     cpu->env.npc = tb->cs_base;
 }
 
diff --git a/target/tricore/cpu.c b/target/tricore/cpu.c
index b95682b7f0..35f3347add 100644
--- a/target/tricore/cpu.c
+++ b/target/tricore/cpu.c
@@ -47,7 +47,7 @@ static void tricore_cpu_synchronize_from_tb(CPUState *cs,
     TriCoreCPU *cpu = TRICORE_CPU(cs);
     CPUTriCoreState *env = &cpu->env;
 
-    env->PC = tb->pc;
+    env->PC = tb_pc(tb);
 }
 
 static void tricore_cpu_reset(DeviceState *dev)
diff --git a/tcg/tcg.c b/tcg/tcg.c
index 0f9cfe96f2..11bdb96dd1 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -4218,7 +4218,7 @@ int tcg_gen_code(TCGContext *s, TranslationBlock *tb)
 
 #ifdef DEBUG_DISAS
     if (unlikely(qemu_loglevel_mask(CPU_LOG_TB_OP)
-                 && qemu_log_in_addr_range(tb->pc))) {
+                 && qemu_log_in_addr_range(tb_pc_log(tb)))) {
         FILE *logfile = qemu_log_trylock();
         if (logfile) {
             fprintf(logfile, "OP:\n");
@@ -4265,7 +4265,7 @@ int tcg_gen_code(TCGContext *s, TranslationBlock *tb)
     if (s->nb_indirects > 0) {
 #ifdef DEBUG_DISAS
         if (unlikely(qemu_loglevel_mask(CPU_LOG_TB_OP_IND)
-                     && qemu_log_in_addr_range(tb->pc))) {
+                     && qemu_log_in_addr_range(tb_pc_log(tb)))) {
             FILE *logfile = qemu_log_trylock();
             if (logfile) {
                 fprintf(logfile, "OP before indirect lowering:\n");
@@ -4288,7 +4288,7 @@ int tcg_gen_code(TCGContext *s, TranslationBlock *tb)
 
 #ifdef DEBUG_DISAS
     if (unlikely(qemu_loglevel_mask(CPU_LOG_TB_OP_OPT)
-                 && qemu_log_in_addr_range(tb->pc))) {
+                 && qemu_log_in_addr_range(tb_pc_log(tb)))) {
         FILE *logfile = qemu_log_trylock();
         if (logfile) {
             fprintf(logfile, "OP after optimization and liveness analysis:\n");
-- 
2.34.1
