Received: by 10.25.21.156 with SMTP id 28csp734015lfv;
        Fri, 15 Jul 2016 10:59:18 -0700 (PDT)
X-Received: by 10.25.126.6 with SMTP id z6mr9965388lfc.155.1468605548052;
        Fri, 15 Jul 2016 10:59:08 -0700 (PDT)
Return-Path: <sergey.fedorov@linaro.org>
Received: from mail-lf0-x236.google.com (mail-lf0-x236.google.com. [2a00:1450:4010:c07::236])
        by mx.google.com with ESMTPS id o38si7324973lfi.110.2016.07.15.10.59.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 15 Jul 2016 10:59:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of sergey.fedorov@linaro.org designates 2a00:1450:4010:c07::236 as permitted sender) client-ip=2a00:1450:4010:c07::236;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org;
       spf=pass (google.com: domain of sergey.fedorov@linaro.org designates 2a00:1450:4010:c07::236 as permitted sender) smtp.mailfrom=sergey.fedorov@linaro.org;
       dmarc=pass (p=NONE dis=NONE) header.from=linaro.org
Received: by mail-lf0-x236.google.com with SMTP id b199so93547712lfe.0
        for <alex.bennee@linaro.org>; Fri, 15 Jul 2016 10:59:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=A1XQoef4PMZaPrpgIQ2RI0eXJ2dqlZIRfK1vgUbEb0U=;
        b=Iy1WBJOzmIDjbPzs/a/4mOkDZiRQNQ5wvLIkBS5WRpJvrmqR6TySRRFUge2nqjVLr5
         VhGioP5fS4EpsKfFHQa3W8Hjd+at6hKyCf8j8FtfUA2YXtX91NSJRL0fFxuPJlhCNVxX
         Xa02J4rIj93v6Qigcl38CaXjL8gOdqTWV0B08=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=A1XQoef4PMZaPrpgIQ2RI0eXJ2dqlZIRfK1vgUbEb0U=;
        b=Q5ZuPmwaH3unowOQmzvhqN4C9nXrEfhq6kBLaL+R5uVta3gHXyNmyJLf5GqHQAGrlI
         C8eoRF1oV9cASHTIalRbsQyc74UUIZ2GmK5hKwrQS+4Fc6kGpWNErJDxfV6XBtPPiWvi
         zLicDy4IF0LQdQ3yWRk7X6sTlc5MVIme5WSZR9SiYkRB8wd2RyCQiYtfodz6ru8QdZLL
         w9HOxLWmZ9iCQ4642KnH4duRH0cT+K4JmgLvdxhBH+UxlCW10okoCTwN5XiHev0Rppl5
         1LAane76utcVaInK81FkUt0p2S/+ectQKJWPyjxmsZnYDvCgh/+ZXrP9NvxvObPZwo06
         z0gg==
X-Gm-Message-State: ALyK8tLeyqLAGSXTlZul56Omb7gEldUbP74JRo0fvdK85V32V1ug6N90gGGWnVHRBa0hJSo4Ejw=
X-Received: by 10.25.125.4 with SMTP id y4mr9708021lfc.75.1468605547668;
        Fri, 15 Jul 2016 10:59:07 -0700 (PDT)
Return-Path: <sergey.fedorov@linaro.org>
Received: from sergey-laptop.Dlink (broadband-46-188-120-37.2com.net. [46.188.120.37])
        by smtp.gmail.com with ESMTPSA id g193sm2113268lfb.14.2016.07.15.10.59.06
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Fri, 15 Jul 2016 10:59:06 -0700 (PDT)
From: Sergey Fedorov <sergey.fedorov@linaro.org>
To: qemu-devel@nongnu.org
Cc: patches@linaro.org,
	Sergey Fedorov <serge.fdrv@gmail.com>,
	mttcg@listserver.greensocs.com,
	fred.konrad@greensocs.com,
	a.rigo@virtualopensystems.com,
	cota@braap.org,
	bobby.prani@gmail.com,
	rth@twiddle.net,
	mark.burton@greensocs.com,
	pbonzini@redhat.com,
	jan.kiszka@siemens.com,
	peter.maydell@linaro.org,
	claudio.fontana@huawei.com,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Sergey Fedorov <sergey.fedorov@linaro.org>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Michael Walle <michael@walle.cc>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Leon Alrae <leon.alrae@imgtec.com>,
	Anthony Green <green@moxielogic.com>,
	Jia Liu <proljc@gmail.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Alexander Graf <agraf@suse.de>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Guan Xuetao <gxt@mprc.pku.edu.cn>,
	Max Filippov <jcmvbkbc@gmail.com>,
	qemu-arm@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH v4 06/12] tcg: Introduce tb_mark_invalid() and tb_is_invalid()
Date: Fri, 15 Jul 2016 20:58:46 +0300
Message-Id: <20160715175852.30749-7-sergey.fedorov@linaro.org>
X-Mailer: git-send-email 2.9.1
In-Reply-To: <20160715175852.30749-1-sergey.fedorov@linaro.org>
References: <20160715175852.30749-1-sergey.fedorov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: KN4Jqeo9NObJ

From: Sergey Fedorov <serge.fdrv@gmail.com>

These functions will be used to make translation block invalidation safe
with concurrent lockless lookup in the global hash table.

Most targets don't use 'cs_base'; so marking TB as invalid is as simple
as assigning -1 to 'cs_base'. SPARC target stores the next program
counter into 'cs_base', and -1 is a fine invalid value since PC must bet
a multiple of 4 in SPARC. The only odd target is i386, for which a
special flag is introduced in place of removed 'HF_SOFTMMU_MASK'.

Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Sergey Fedorov <serge.fdrv@gmail.com>
Signed-off-by: Sergey Fedorov <sergey.fedorov@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
---
 include/exec/exec-all.h  | 10 ++++++++++
 target-alpha/cpu.h       | 14 ++++++++++++++
 target-arm/cpu.h         | 14 ++++++++++++++
 target-cris/cpu.h        | 14 ++++++++++++++
 target-i386/cpu.h        | 17 +++++++++++++++++
 target-lm32/cpu.h        | 14 ++++++++++++++
 target-m68k/cpu.h        | 14 ++++++++++++++
 target-microblaze/cpu.h  | 14 ++++++++++++++
 target-mips/cpu.h        | 14 ++++++++++++++
 target-moxie/cpu.h       | 14 ++++++++++++++
 target-openrisc/cpu.h    | 14 ++++++++++++++
 target-ppc/cpu.h         | 14 ++++++++++++++
 target-s390x/cpu.h       | 14 ++++++++++++++
 target-sh4/cpu.h         | 14 ++++++++++++++
 target-sparc/cpu.h       | 14 ++++++++++++++
 target-sparc/translate.c |  1 +
 target-tilegx/cpu.h      | 14 ++++++++++++++
 target-tricore/cpu.h     | 14 ++++++++++++++
 target-unicore32/cpu.h   | 14 ++++++++++++++
 target-xtensa/cpu.h      | 14 ++++++++++++++
 20 files changed, 266 insertions(+)

diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
index acda7b613d53..a499c7c56eef 100644
--- a/include/exec/exec-all.h
+++ b/include/exec/exec-all.h
@@ -256,6 +256,16 @@ void tb_free(TranslationBlock *tb);
 void tb_flush(CPUState *cpu);
 void tb_phys_invalidate(TranslationBlock *tb, tb_page_addr_t page_addr);
 
+static inline void tb_mark_invalid(TranslationBlock *tb)
+{
+    cpu_get_invalid_tb_cpu_state(&tb->pc, &tb->cs_base, &tb->flags);
+}
+
+static inline bool tb_is_invalid(TranslationBlock *tb)
+{
+    return cpu_tb_cpu_state_is_invalidated(tb->pc, tb->cs_base, tb->flags);
+}
+
 #if defined(USE_DIRECT_JUMP)
 
 #if defined(CONFIG_TCG_INTERPRETER)
diff --git a/target-alpha/cpu.h b/target-alpha/cpu.h
index ac5e801fb43b..f4ecabeb5b68 100644
--- a/target-alpha/cpu.h
+++ b/target-alpha/cpu.h
@@ -524,4 +524,18 @@ static inline void cpu_get_tb_cpu_state(CPUAlphaState *env, target_ulong *pc,
     *pflags = flags;
 }
 
+static inline void cpu_get_invalid_tb_cpu_state(target_ulong *pc,
+                                                target_ulong *cs_base,
+                                                uint32_t *flags)
+{
+    *cs_base = -1;
+}
+
+static inline bool cpu_tb_cpu_state_is_invalidated(target_ulong pc,
+                                                   target_ulong cs_base,
+                                                   uint32_t flags)
+{
+    return cs_base == -1;
+}
+
 #endif /* ALPHA_CPU_H */
diff --git a/target-arm/cpu.h b/target-arm/cpu.h
index 76d824d315f7..068f58d6a278 100644
--- a/target-arm/cpu.h
+++ b/target-arm/cpu.h
@@ -2371,6 +2371,20 @@ static inline void cpu_get_tb_cpu_state(CPUARMState *env, target_ulong *pc,
     *cs_base = 0;
 }
 
+static inline void cpu_get_invalid_tb_cpu_state(target_ulong *pc,
+                                                target_ulong *cs_base,
+                                                uint32_t *flags)
+{
+    *cs_base = -1;
+}
+
+static inline bool cpu_tb_cpu_state_is_invalidated(target_ulong pc,
+                                                   target_ulong cs_base,
+                                                   uint32_t flags)
+{
+    return cs_base == -1;
+}
+
 enum {
     QEMU_PSCI_CONDUIT_DISABLED = 0,
     QEMU_PSCI_CONDUIT_SMC = 1,
diff --git a/target-cris/cpu.h b/target-cris/cpu.h
index 7d7fe6eb1cf4..a20154e06b31 100644
--- a/target-cris/cpu.h
+++ b/target-cris/cpu.h
@@ -296,6 +296,20 @@ static inline void cpu_get_tb_cpu_state(CPUCRISState *env, target_ulong *pc,
 				     | X_FLAG | PFIX_FLAG));
 }
 
+static inline void cpu_get_invalid_tb_cpu_state(target_ulong *pc,
+                                                target_ulong *cs_base,
+                                                uint32_t *flags)
+{
+    *cs_base = -1;
+}
+
+static inline bool cpu_tb_cpu_state_is_invalidated(target_ulong pc,
+                                                   target_ulong cs_base,
+                                                   uint32_t flags)
+{
+    return cs_base == -1;
+}
+
 #define cpu_list cris_cpu_list
 void cris_cpu_list(FILE *f, fprintf_function cpu_fprintf);
 
diff --git a/target-i386/cpu.h b/target-i386/cpu.h
index 5b14a72baa6f..1e430ae07915 100644
--- a/target-i386/cpu.h
+++ b/target-i386/cpu.h
@@ -130,6 +130,8 @@
    positions to ease oring with eflags. */
 /* current cpl */
 #define HF_CPL_SHIFT         0
+/* used to mark invalidated translation blocks */
+#define HF_INVALID_SHIFT     2
 /* true if hardware interrupts must be disabled for next instruction */
 #define HF_INHIBIT_IRQ_SHIFT 3
 /* 16 or 32 segments */
@@ -159,6 +161,7 @@
 #define HF_MPX_IU_SHIFT     26 /* BND registers in-use */
 
 #define HF_CPL_MASK          (3 << HF_CPL_SHIFT)
+#define HF_INVALID_MASK      (1 << HF_INVALID_SHIFT)
 #define HF_INHIBIT_IRQ_MASK  (1 << HF_INHIBIT_IRQ_SHIFT)
 #define HF_CS32_MASK         (1 << HF_CS32_SHIFT)
 #define HF_SS32_MASK         (1 << HF_SS32_SHIFT)
@@ -1490,6 +1493,20 @@ static inline void cpu_get_tb_cpu_state(CPUX86State *env, target_ulong *pc,
         (env->eflags & (IOPL_MASK | TF_MASK | RF_MASK | VM_MASK | AC_MASK));
 }
 
+static inline void cpu_get_invalid_tb_cpu_state(target_ulong *pc,
+                                                target_ulong *cs_base,
+                                                uint32_t *flags)
+{
+    *flags = HF_INVALID_MASK;
+}
+
+static inline bool cpu_tb_cpu_state_is_invalidated(target_ulong pc,
+                                                   target_ulong cs_base,
+                                                   uint32_t flags)
+{
+    return flags == HF_INVALID_MASK;
+}
+
 void do_cpu_init(X86CPU *cpu);
 void do_cpu_sipi(X86CPU *cpu);
 
diff --git a/target-lm32/cpu.h b/target-lm32/cpu.h
index d8a3515244ea..a94c6bd36bd3 100644
--- a/target-lm32/cpu.h
+++ b/target-lm32/cpu.h
@@ -271,4 +271,18 @@ static inline void cpu_get_tb_cpu_state(CPULM32State *env, target_ulong *pc,
     *flags = 0;
 }
 
+static inline void cpu_get_invalid_tb_cpu_state(target_ulong *pc,
+                                                target_ulong *cs_base,
+                                                uint32_t *flags)
+{
+    *cs_base = -1;
+}
+
+static inline bool cpu_tb_cpu_state_is_invalidated(target_ulong pc,
+                                                   target_ulong cs_base,
+                                                   uint32_t flags)
+{
+    return cs_base == -1;
+}
+
 #endif
diff --git a/target-m68k/cpu.h b/target-m68k/cpu.h
index b2faa6b60567..549b0eb23a87 100644
--- a/target-m68k/cpu.h
+++ b/target-m68k/cpu.h
@@ -270,4 +270,18 @@ static inline void cpu_get_tb_cpu_state(CPUM68KState *env, target_ulong *pc,
             | ((env->macsr >> 4) & 0xf);        /* Bits 0-3 */
 }
 
+static inline void cpu_get_invalid_tb_cpu_state(target_ulong *pc,
+                                                target_ulong *cs_base,
+                                                uint32_t *flags)
+{
+    *cs_base = -1;
+}
+
+static inline bool cpu_tb_cpu_state_is_invalidated(target_ulong pc,
+                                                   target_ulong cs_base,
+                                                   uint32_t flags)
+{
+    return cs_base == -1;
+}
+
 #endif
diff --git a/target-microblaze/cpu.h b/target-microblaze/cpu.h
index beb75ffd26d5..2228e74b2f14 100644
--- a/target-microblaze/cpu.h
+++ b/target-microblaze/cpu.h
@@ -372,6 +372,20 @@ static inline void cpu_get_tb_cpu_state(CPUMBState *env, target_ulong *pc,
                  (env->sregs[SR_MSR] & (MSR_UM | MSR_VM | MSR_EE));
 }
 
+static inline void cpu_get_invalid_tb_cpu_state(target_ulong *pc,
+                                                target_ulong *cs_base,
+                                                uint32_t *flags)
+{
+    *cs_base = -1;
+}
+
+static inline bool cpu_tb_cpu_state_is_invalidated(target_ulong pc,
+                                                   target_ulong cs_base,
+                                                   uint32_t flags)
+{
+    return cs_base == -1;
+}
+
 #if !defined(CONFIG_USER_ONLY)
 void mb_cpu_unassigned_access(CPUState *cpu, hwaddr addr,
                               bool is_write, bool is_exec, int is_asi,
diff --git a/target-mips/cpu.h b/target-mips/cpu.h
index 5182dc74ffa3..e47e2e320f51 100644
--- a/target-mips/cpu.h
+++ b/target-mips/cpu.h
@@ -901,6 +901,20 @@ static inline void cpu_get_tb_cpu_state(CPUMIPSState *env, target_ulong *pc,
                             MIPS_HFLAG_HWRENA_ULR);
 }
 
+static inline void cpu_get_invalid_tb_cpu_state(target_ulong *pc,
+                                                target_ulong *cs_base,
+                                                uint32_t *flags)
+{
+    *cs_base = -1;
+}
+
+static inline bool cpu_tb_cpu_state_is_invalidated(target_ulong pc,
+                                                   target_ulong cs_base,
+                                                   uint32_t flags)
+{
+    return cs_base == -1;
+}
+
 static inline int mips_vpe_active(CPUMIPSState *env)
 {
     int active = 1;
diff --git a/target-moxie/cpu.h b/target-moxie/cpu.h
index 3e880facf482..fba7276d72f8 100644
--- a/target-moxie/cpu.h
+++ b/target-moxie/cpu.h
@@ -137,6 +137,20 @@ static inline void cpu_get_tb_cpu_state(CPUMoxieState *env, target_ulong *pc,
     *flags = 0;
 }
 
+static inline void cpu_get_invalid_tb_cpu_state(target_ulong *pc,
+                                                target_ulong *cs_base,
+                                                uint32_t *flags)
+{
+    *cs_base = -1;
+}
+
+static inline bool cpu_tb_cpu_state_is_invalidated(target_ulong pc,
+                                                   target_ulong cs_base,
+                                                   uint32_t flags)
+{
+    return cs_base == -1;
+}
+
 int moxie_cpu_handle_mmu_fault(CPUState *cpu, vaddr address,
                                int rw, int mmu_idx);
 
diff --git a/target-openrisc/cpu.h b/target-openrisc/cpu.h
index aaf153579a9a..b6069a32e2b9 100644
--- a/target-openrisc/cpu.h
+++ b/target-openrisc/cpu.h
@@ -398,6 +398,20 @@ static inline void cpu_get_tb_cpu_state(CPUOpenRISCState *env,
     *flags = (env->flags & D_FLAG);
 }
 
+static inline void cpu_get_invalid_tb_cpu_state(target_ulong *pc,
+                                                target_ulong *cs_base,
+                                                uint32_t *flags)
+{
+    *cs_base = -1;
+}
+
+static inline bool cpu_tb_cpu_state_is_invalidated(target_ulong pc,
+                                                   target_ulong cs_base,
+                                                   uint32_t flags)
+{
+    return cs_base == -1;
+}
+
 static inline int cpu_mmu_index(CPUOpenRISCState *env, bool ifetch)
 {
     if (!(env->sr & SR_IME)) {
diff --git a/target-ppc/cpu.h b/target-ppc/cpu.h
index 5fce1ffa251a..f94483691133 100644
--- a/target-ppc/cpu.h
+++ b/target-ppc/cpu.h
@@ -2295,6 +2295,20 @@ static inline void cpu_get_tb_cpu_state(CPUPPCState *env, target_ulong *pc,
     *flags = env->hflags;
 }
 
+static inline void cpu_get_invalid_tb_cpu_state(target_ulong *pc,
+                                                target_ulong *cs_base,
+                                                uint32_t *flags)
+{
+    *cs_base = -1;
+}
+
+static inline bool cpu_tb_cpu_state_is_invalidated(target_ulong pc,
+                                                   target_ulong cs_base,
+                                                   uint32_t flags)
+{
+    return cs_base == -1;
+}
+
 #if !defined(CONFIG_USER_ONLY)
 static inline int booke206_tlbm_id(CPUPPCState *env, ppcmas_tlb_t *tlbm)
 {
diff --git a/target-s390x/cpu.h b/target-s390x/cpu.h
index c216bdacef4f..113490ec8eb4 100644
--- a/target-s390x/cpu.h
+++ b/target-s390x/cpu.h
@@ -394,6 +394,20 @@ static inline void cpu_get_tb_cpu_state(CPUS390XState* env, target_ulong *pc,
              ((env->psw.mask & PSW_MASK_32) ? FLAG_MASK_32 : 0);
 }
 
+static inline void cpu_get_invalid_tb_cpu_state(target_ulong *pc,
+                                                target_ulong *cs_base,
+                                                uint32_t *flags)
+{
+    *cs_base = -1;
+}
+
+static inline bool cpu_tb_cpu_state_is_invalidated(target_ulong pc,
+                                                   target_ulong cs_base,
+                                                   uint32_t flags)
+{
+    return cs_base == -1;
+}
+
 /* While the PoO talks about ILC (a number between 1-3) what is actually
    stored in LowCore is shifted left one bit (an even between 2-6).  As
    this is the actual length of the insn and therefore more useful, that
diff --git a/target-sh4/cpu.h b/target-sh4/cpu.h
index 478ab558681b..6128d3890bda 100644
--- a/target-sh4/cpu.h
+++ b/target-sh4/cpu.h
@@ -388,4 +388,18 @@ static inline void cpu_get_tb_cpu_state(CPUSH4State *env, target_ulong *pc,
             | (env->movcal_backup ? TB_FLAG_PENDING_MOVCA : 0); /* Bit 4 */
 }
 
+static inline void cpu_get_invalid_tb_cpu_state(target_ulong *pc,
+                                                target_ulong *cs_base,
+                                                uint32_t *flags)
+{
+    *cs_base = -1;
+}
+
+static inline bool cpu_tb_cpu_state_is_invalidated(target_ulong pc,
+                                                   target_ulong cs_base,
+                                                   uint32_t flags)
+{
+    return cs_base == -1;
+}
+
 #endif /* SH4_CPU_H */
diff --git a/target-sparc/cpu.h b/target-sparc/cpu.h
index a3d64a4e5299..e327a35f78c1 100644
--- a/target-sparc/cpu.h
+++ b/target-sparc/cpu.h
@@ -749,6 +749,20 @@ static inline void cpu_get_tb_cpu_state(CPUSPARCState *env, target_ulong *pc,
     *pflags = flags;
 }
 
+static inline void cpu_get_invalid_tb_cpu_state(target_ulong *pc,
+                                                target_ulong *cs_base,
+                                                uint32_t *flags)
+{
+    *cs_base = -1; /* npc must be a multible of 4 */
+}
+
+static inline bool cpu_tb_cpu_state_is_invalidated(target_ulong pc,
+                                                   target_ulong cs_base,
+                                                   uint32_t flags)
+{
+    return cs_base == -1;
+}
+
 static inline bool tb_fpu_enabled(int tb_flags)
 {
 #if defined(CONFIG_USER_ONLY)
diff --git a/target-sparc/translate.c b/target-sparc/translate.c
index e7691e44587d..81442ef813ae 100644
--- a/target-sparc/translate.c
+++ b/target-sparc/translate.c
@@ -39,6 +39,7 @@
 #define DYNAMIC_PC  1 /* dynamic pc value */
 #define JUMP_PC     2 /* dynamic pc value which takes only two values
                          according to jump_pc[T2] */
+/* NOTE: -1 is reserved for cpu_get_invalid_tb_cpu_state() */
 
 /* global register indexes */
 static TCGv_env cpu_env;
diff --git a/target-tilegx/cpu.h b/target-tilegx/cpu.h
index 17354272337d..863c06171841 100644
--- a/target-tilegx/cpu.h
+++ b/target-tilegx/cpu.h
@@ -175,4 +175,18 @@ static inline void cpu_get_tb_cpu_state(CPUTLGState *env, target_ulong *pc,
     *flags = 0;
 }
 
+static inline void cpu_get_invalid_tb_cpu_state(target_ulong *pc,
+                                                target_ulong *cs_base,
+                                                uint32_t *flags)
+{
+    *cs_base = -1;
+}
+
+static inline bool cpu_tb_cpu_state_is_invalidated(target_ulong pc,
+                                                   target_ulong cs_base,
+                                                   uint32_t flags)
+{
+    return cs_base == -1;
+}
+
 #endif
diff --git a/target-tricore/cpu.h b/target-tricore/cpu.h
index a3493a123c35..980b821b6b9f 100644
--- a/target-tricore/cpu.h
+++ b/target-tricore/cpu.h
@@ -411,6 +411,20 @@ static inline void cpu_get_tb_cpu_state(CPUTriCoreState *env, target_ulong *pc,
     *flags = 0;
 }
 
+static inline void cpu_get_invalid_tb_cpu_state(target_ulong *pc,
+                                                target_ulong *cs_base,
+                                                uint32_t *flags)
+{
+    *cs_base = -1;
+}
+
+static inline bool cpu_tb_cpu_state_is_invalidated(target_ulong pc,
+                                                   target_ulong cs_base,
+                                                   uint32_t flags)
+{
+    return cs_base == -1;
+}
+
 TriCoreCPU *cpu_tricore_init(const char *cpu_model);
 
 #define cpu_init(cpu_model) CPU(cpu_tricore_init(cpu_model))
diff --git a/target-unicore32/cpu.h b/target-unicore32/cpu.h
index 7b5b405e79cd..01bf1e8288ed 100644
--- a/target-unicore32/cpu.h
+++ b/target-unicore32/cpu.h
@@ -180,6 +180,20 @@ static inline void cpu_get_tb_cpu_state(CPUUniCore32State *env, target_ulong *pc
     }
 }
 
+static inline void cpu_get_invalid_tb_cpu_state(target_ulong *pc,
+                                                target_ulong *cs_base,
+                                                uint32_t *flags)
+{
+    *cs_base = -1;
+}
+
+static inline bool cpu_tb_cpu_state_is_invalidated(target_ulong pc,
+                                                   target_ulong cs_base,
+                                                   uint32_t flags)
+{
+    return cs_base == -1;
+}
+
 int uc32_cpu_handle_mmu_fault(CPUState *cpu, vaddr address, int rw,
                               int mmu_idx);
 void uc32_translate_init(void);
diff --git a/target-xtensa/cpu.h b/target-xtensa/cpu.h
index 7fe82a37af42..239588740f3c 100644
--- a/target-xtensa/cpu.h
+++ b/target-xtensa/cpu.h
@@ -582,6 +582,20 @@ static inline void cpu_get_tb_cpu_state(CPUXtensaState *env, target_ulong *pc,
     }
 }
 
+static inline void cpu_get_invalid_tb_cpu_state(target_ulong *pc,
+                                                target_ulong *cs_base,
+                                                uint32_t *flags)
+{
+    *cs_base = -1;
+}
+
+static inline bool cpu_tb_cpu_state_is_invalidated(target_ulong pc,
+                                                   target_ulong cs_base,
+                                                   uint32_t flags)
+{
+    return cs_base == -1;
+}
+
 #include "exec/cpu-all.h"
 
 #endif
-- 
2.9.1
