Received: by 10.25.21.156 with SMTP id 28csp556430lfv;
        Tue, 12 Jul 2016 13:14:43 -0700 (PDT)
X-Received: by 10.25.83.80 with SMTP id h77mr2437296lfb.83.1468354464908;
        Tue, 12 Jul 2016 13:14:24 -0700 (PDT)
Return-Path: <sergey.fedorov@linaro.org>
Received: from mail-lf0-x233.google.com (mail-lf0-x233.google.com. [2a00:1450:4010:c07::233])
        by mx.google.com with ESMTPS id 87si3620322lfp.38.2016.07.12.13.14.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 12 Jul 2016 13:14:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of sergey.fedorov@linaro.org designates 2a00:1450:4010:c07::233 as permitted sender) client-ip=2a00:1450:4010:c07::233;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org;
       spf=pass (google.com: domain of sergey.fedorov@linaro.org designates 2a00:1450:4010:c07::233 as permitted sender) smtp.mailfrom=sergey.fedorov@linaro.org;
       dmarc=pass (p=NONE dis=NONE) header.from=linaro.org
Received: by mail-lf0-x233.google.com with SMTP id h129so22906939lfh.1
        for <alex.bennee@linaro.org>; Tue, 12 Jul 2016 13:14:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=oY7zxAOwFnqVHmq96BJRkZ4ZDaud607qNKkKchUPx8k=;
        b=LD7Azl9A+kE3uCx1sgdRUWQED3A/bCZVwUxh7Rs/k4W/xJNch0JYyTcCY/p88Mqatz
         rJigmMAJPFMzeznZ2dORv+QJw8CKSv6CXSZIaGCSyS7r6bvxvpKUxuyZYSkew4Qdu/VY
         VyK8K8gc9YO4+WVyK1fjq9OsKHEAN3EletEWQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=oY7zxAOwFnqVHmq96BJRkZ4ZDaud607qNKkKchUPx8k=;
        b=euXuNhCqegCkGMqiNae4cS7sCr7a0AlwNF1c5benGg5K2wUiI11+NDDAQrPwXUPO+T
         7dZhTI7WzkJH2yZvQThkZQ1WlfNC7J8NNf+u7Pr0pP4l5Z818PTOzfi8Nvf8796ZzzeE
         rOcPf/thSDwW5j8mXuQT8cmAerEbEmpyuqH+F5jXm+kqXy86E2+Re+Ho8miQ8Ubuug2T
         KlkFqGO6m4h/zzY0Ts1Xb9y97BCscWT/g7Kfr+yCncKaR4qwf6hMYvfKiIiXfC/dtNnY
         j0tSm2pSKnd7Ppe5cR2pGcT31FclOnO8QSALvpnBTkb2wESdck++YtBLUmR9H/NA5LTj
         POvA==
X-Gm-Message-State: ALyK8tIm4IrNPubW4t8Q2c7NCLsLDWicx7506KN3KxvHdxuHXbHOOViTt3yjg1V/skSTCw/Crk4=
X-Received: by 10.25.2.195 with SMTP id 186mr2461510lfc.36.1468354464539;
        Tue, 12 Jul 2016 13:14:24 -0700 (PDT)
Return-Path: <sergey.fedorov@linaro.org>
Received: from sergey-laptop.Dlink (broadband-46-188-120-37.2com.net. [46.188.120.37])
        by smtp.gmail.com with ESMTPSA id g40sm2474029ljg.22.2016.07.12.13.14.23
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Tue, 12 Jul 2016 13:14:23 -0700 (PDT)
From: Sergey Fedorov <sergey.fedorov@linaro.org>
To: qemu-devel@nongnu.org,
	mttcg@listserver.greensocs.com,
	fred.konrad@greensocs.com,
	a.rigo@virtualopensystems.com,
	serge.fdrv@gmail.com,
	cota@braap.org,
	bobby.prani@gmail.com,
	rth@twiddle.net
Cc: patches@linaro.org,
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
Subject: [PATCH v3 06/11] tcg: Introduce tb_mark_invalid() and tb_is_invalid()
Date: Tue, 12 Jul 2016 23:13:41 +0300
Message-Id: <1468354426-837-7-git-send-email-sergey.fedorov@linaro.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1468354426-837-1-git-send-email-sergey.fedorov@linaro.org>
References: <1468354426-837-1-git-send-email-sergey.fedorov@linaro.org>
X-TUID: oTpOmXptBTA7

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
index db79ab65cebe..61cc3a1fb8f7 100644
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
index 791da3b4ad67..1ce4526d7a72 100644
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
 #endif /* !defined (__CPU_ALPHA_H__) */
diff --git a/target-arm/cpu.h b/target-arm/cpu.h
index e2fac46909c6..2855bdae7800 100644
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
index e6046d20ca10..fae3219304df 100644
--- a/target-cris/cpu.h
+++ b/target-cris/cpu.h
@@ -295,6 +295,20 @@ static inline void cpu_get_tb_cpu_state(CPUCRISState *env, target_ulong *pc,
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
index a7c752afdad8..c9125b725ca4 100644
--- a/target-i386/cpu.h
+++ b/target-i386/cpu.h
@@ -129,6 +129,8 @@
    positions to ease oring with eflags. */
 /* current cpl */
 #define HF_CPL_SHIFT         0
+/* used to mark invalidated translation blocks */
+#define HF_INVALID_SHIFT     2
 /* true if hardware interrupts must be disabled for next instruction */
 #define HF_INHIBIT_IRQ_SHIFT 3
 /* 16 or 32 segments */
@@ -158,6 +160,7 @@
 #define HF_MPX_IU_SHIFT     26 /* BND registers in-use */
 
 #define HF_CPL_MASK          (3 << HF_CPL_SHIFT)
+#define HF_INVALID_MASK      (1 << HF_INVALID_SHIFT)
 #define HF_INHIBIT_IRQ_MASK  (1 << HF_INHIBIT_IRQ_SHIFT)
 #define HF_CS32_MASK         (1 << HF_CS32_SHIFT)
 #define HF_SS32_MASK         (1 << HF_SS32_SHIFT)
@@ -1489,6 +1492,20 @@ static inline void cpu_get_tb_cpu_state(CPUX86State *env, target_ulong *pc,
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
index 4efe98d828f8..5f78c3c619e5 100644
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
index 908776999797..c44f4339e40a 100644
--- a/target-m68k/cpu.h
+++ b/target-m68k/cpu.h
@@ -269,4 +269,18 @@ static inline void cpu_get_tb_cpu_state(CPUM68KState *env, target_ulong *pc,
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
index 16815dfc6abc..22362efce586 100644
--- a/target-microblaze/cpu.h
+++ b/target-microblaze/cpu.h
@@ -371,6 +371,20 @@ static inline void cpu_get_tb_cpu_state(CPUMBState *env, target_ulong *pc,
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
index 9c4fc816bf9b..a887154274b3 100644
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
index 63d5cafc5528..f0f95a2701e1 100644
--- a/target-moxie/cpu.h
+++ b/target-moxie/cpu.h
@@ -136,6 +136,20 @@ static inline void cpu_get_tb_cpu_state(CPUMoxieState *env, target_ulong *pc,
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
index 9451a7cca691..a5650cbed4b7 100644
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
index 2666a3f80d00..092c7954d19a 100644
--- a/target-ppc/cpu.h
+++ b/target-ppc/cpu.h
@@ -2294,6 +2294,20 @@ static inline void cpu_get_tb_cpu_state(CPUPPCState *env, target_ulong *pc,
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
index 8bcb0f75f399..574cdb51c967 100644
--- a/target-s390x/cpu.h
+++ b/target-s390x/cpu.h
@@ -393,6 +393,20 @@ static inline void cpu_get_tb_cpu_state(CPUS390XState* env, target_ulong *pc,
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
index 3f9dae2d1f0d..bcddbf31c853 100644
--- a/target-sh4/cpu.h
+++ b/target-sh4/cpu.h
@@ -387,4 +387,18 @@ static inline void cpu_get_tb_cpu_state(CPUSH4State *env, target_ulong *pc,
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
 #endif				/* _CPU_SH4_H */
diff --git a/target-sparc/cpu.h b/target-sparc/cpu.h
index 604de84624ca..09df29b7b439 100644
--- a/target-sparc/cpu.h
+++ b/target-sparc/cpu.h
@@ -749,6 +749,20 @@ static inline void cpu_get_tb_cpu_state(CPUSPARCState *env, target_ulong *pc,
 #endif
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
index 0f4faf70624f..cc160bc67be0 100644
--- a/target-sparc/translate.c
+++ b/target-sparc/translate.c
@@ -38,6 +38,7 @@
 #define DYNAMIC_PC  1 /* dynamic pc value */
 #define JUMP_PC     2 /* dynamic pc value which takes only two values
                          according to jump_pc[T2] */
+/* NOTE: -1 is reserved for cpu_get_invalid_tb_cpu_state() */
 
 /* global register indexes */
 static TCGv_env cpu_env;
diff --git a/target-tilegx/cpu.h b/target-tilegx/cpu.h
index d74032925b12..79f84a422de1 100644
--- a/target-tilegx/cpu.h
+++ b/target-tilegx/cpu.h
@@ -174,4 +174,18 @@ static inline void cpu_get_tb_cpu_state(CPUTLGState *env, target_ulong *pc,
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
index a298d63eea24..8f3ca20241b7 100644
--- a/target-tricore/cpu.h
+++ b/target-tricore/cpu.h
@@ -410,6 +410,20 @@ static inline void cpu_get_tb_cpu_state(CPUTriCoreState *env, target_ulong *pc,
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
index 83f758496a6c..6bcda6aa3e38 100644
--- a/target-unicore32/cpu.h
+++ b/target-unicore32/cpu.h
@@ -179,6 +179,20 @@ static inline void cpu_get_tb_cpu_state(CPUUniCore32State *env, target_ulong *pc
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
index ce9fb5b0033a..bd0a3b1deddf 100644
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
1.9.1
