Received: by 10.25.208.211 with SMTP id h202csp1120168lfg;
        Sun, 10 Apr 2016 14:46:38 -0700 (PDT)
X-Received: by 10.25.25.7 with SMTP id 7mr5664433lfz.166.1460324798767;
        Sun, 10 Apr 2016 14:46:38 -0700 (PDT)
Return-Path: <sergey.fedorov@linaro.org>
Received: from mail-lf0-x234.google.com (mail-lf0-x234.google.com. [2a00:1450:4010:c07::234])
        by mx.google.com with ESMTPS id wb2si12478617lbb.155.2016.04.10.14.46.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 10 Apr 2016 14:46:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of sergey.fedorov@linaro.org designates 2a00:1450:4010:c07::234 as permitted sender) client-ip=2a00:1450:4010:c07::234;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org;
       spf=pass (google.com: domain of sergey.fedorov@linaro.org designates 2a00:1450:4010:c07::234 as permitted sender) smtp.mailfrom=sergey.fedorov@linaro.org;
       dmarc=pass (p=NONE dis=NONE) header.from=linaro.org
Received: by mail-lf0-x234.google.com with SMTP id c126so133735119lfb.2
        for <alex.bennee@linaro.org>; Sun, 10 Apr 2016 14:46:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=QObymJz90uxvPrEasZYjCZPWyfApO3jDkgklXpGjPLQ=;
        b=KBZ78NE/wiOL5Cpi/Uuw8TubJCbZ/4nkRL9xzfogKXgkqruWk7vIL2ejzAFveTbX+3
         5phg5Y/eCz7qsrq98YpWIfgWclkd0uh5jvj3o/VjMqZRso2hnzxRFm5bIaVk082kU4/+
         frB4FjQlyrM1uHauSTC6KIbq5RCL4mls2k7bU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=QObymJz90uxvPrEasZYjCZPWyfApO3jDkgklXpGjPLQ=;
        b=E1d3eSDuVcWxLjpk2ytpMTGmN7B06ujwjh4tlTaqIlZuULvFOcWBUN2Vgc7mrryiqB
         KzCuNK1sof0Rt/quB+jp618ZczwlCvK0mjIFBPNmy3KmwnAJQndicqBdWyCYCSi+PJwU
         kp/i/WTQuAiM/V14nmKfoH76IO+6FqE4KkICjjdeWCTNrMPK448Hmx4HxLydsevI9B4W
         1MW4Un+K3ZIgwSAvF2A/xrz2Pm753OjaVMI21Sw/IviYmhd70sTB1Ae0dhYBA7HM8Y3/
         olyBM4yoiaeC7eFDOdONmnK0x2L2BJ5ofLevhnQJo8qwgVwC96KKDcGaAVex/Rly9eDM
         4SEw==
X-Gm-Message-State: AD7BkJIvFCBtCB1hwNg57ITvw56rKG5yvpMsg4O61u0pLNziKvHtcJgPF7iWcplCg3//++QfKWY=
X-Received: by 10.25.161.75 with SMTP id k72mr7488826lfe.86.1460324798541;
        Sun, 10 Apr 2016 14:46:38 -0700 (PDT)
Return-Path: <sergey.fedorov@linaro.org>
Received: from sergey-laptop.Dlink (broadband-46-188-121-115.2com.net. [46.188.121.115])
        by smtp.gmail.com with ESMTPSA id g199sm3945957lfe.30.2016.04.10.14.46.36
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Sun, 10 Apr 2016 14:46:37 -0700 (PDT)
From: Sergey Fedorov <sergey.fedorov@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Sergey Fedorov <serge.fdrv@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	Richard Henderson <rth@twiddle.net>,
	Riku Voipio <riku.voipio@iki.fi>,
	Blue Swirl <blauwirbel@gmail.com>,
	Sergey Fedorov <sergey.fedorov@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Michael Walle <michael@walle.cc>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Leon Alrae <leon.alrae@imgtec.com>,
	Anthony Green <green@moxielogic.com>,
	Jia Liu <proljc@gmail.com>,
	Alexander Graf <agraf@suse.de>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Guan Xuetao <gxt@mprc.pku.edu.cn>,
	Max Filippov <jcmvbkbc@gmail.com>,
	qemu-arm@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH v3 10/10] tcg: Moderate direct block chaining safety checks in user mode
Date: Mon, 11 Apr 2016 00:45:32 +0300
Message-Id: <1460324732-30330-11-git-send-email-sergey.fedorov@linaro.org>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <1460324732-30330-1-git-send-email-sergey.fedorov@linaro.org>
References: <1460324732-30330-1-git-send-email-sergey.fedorov@linaro.org>
X-TUID: SDg+vkuVZEcm

From: Sergey Fedorov <serge.fdrv@gmail.com>

In user mode, there's only a static address translation, TBs are always
invalidated properly and direct jumps are reset when mapping change.
Thus the destination address is always valid for direct jumps and
there's no need to restrict it to the pages the TB resides in.

Signed-off-by: Sergey Fedorov <serge.fdrv@gmail.com>
Signed-off-by: Sergey Fedorov <sergey.fedorov@linaro.org>
---
 target-alpha/translate.c      | 10 +++++++++-
 target-arm/translate-a64.c    |  8 +++++++-
 target-arm/translate.c        | 26 ++++++++++++++++++--------
 target-cris/translate.c       | 26 ++++++++++++++++++--------
 target-i386/translate.c       | 30 ++++++++++++++++++++----------
 target-lm32/translate.c       | 27 ++++++++++++++++++++-------
 target-m68k/translate.c       | 30 ++++++++++++++++++++----------
 target-microblaze/translate.c | 23 +++++++++++++++++------
 target-mips/translate.c       | 28 +++++++++++++++++++++-------
 target-moxie/translate.c      | 29 +++++++++++++++++++++--------
 target-openrisc/translate.c   | 28 +++++++++++++++++++++-------
 target-ppc/translate.c        | 32 +++++++++++++++++++++++---------
 target-s390x/translate.c      | 20 +++++++++++++++-----
 target-sh4/translate.c        | 27 ++++++++++++++++++++-------
 target-sparc/translate.c      | 32 +++++++++++++++++++++++---------
 target-tricore/translate.c    | 28 +++++++++++++++++++++-------
 target-unicore32/translate.c  | 24 +++++++++++++++++-------
 target-xtensa/translate.c     | 16 ++++++++++++++--
 18 files changed, 325 insertions(+), 119 deletions(-)

diff --git a/target-alpha/translate.c b/target-alpha/translate.c
index 5fa66309ce2e..684559e694bd 100644
--- a/target-alpha/translate.c
+++ b/target-alpha/translate.c
@@ -464,11 +464,19 @@ static bool use_goto_tb(DisasContext *ctx, uint64_t dest)
     if (in_superpage(ctx, dest)) {
         return true;
     }
+#ifndef CONFIG_USER_ONLY
     /* Direct jumps with goto_tb are only safe within the page this TB resides
      * in because we don't take care of direct jumps when address mapping
-     * changes.
+     * changes in system mode.
      */
     return ((ctx->tb->pc ^ dest) & TARGET_PAGE_MASK) == 0;
+#else
+    /* In user mode, there's only a static address translation, so the
+     * destination address is always valid. TBs are always invalidated properly
+     * and direct jumps are reset when mapping attributes change.
+     */
+    return true;
+#endif
 }
 
 static ExitStatus gen_bdirect(DisasContext *ctx, int ra, int32_t disp)
diff --git a/target-arm/translate-a64.c b/target-arm/translate-a64.c
index bf8471c7fa99..c2fccfe5a038 100644
--- a/target-arm/translate-a64.c
+++ b/target-arm/translate-a64.c
@@ -274,14 +274,20 @@ static inline bool use_goto_tb(DisasContext *s, int n, uint64_t dest)
         return false;
     }
 
+#ifndef CONFIG_USER_ONLY
     /* Direct jumps with goto_tb are only safe within the page this TB resides
      * in because we don't take care of direct jumps when address mapping
-     * changes.
+     * changes in system mode.
      */
     if ((s->tb->pc & TARGET_PAGE_MASK) != (dest & TARGET_PAGE_MASK)) {
         return false;
     }
+#endif
 
+    /* In user mode, there's only a static address translation, so the
+     * destination address is always valid. TBs are always invalidated properly
+     * and direct jumps are reset when mapping attributes change.
+     */
     return true;
 }
 
diff --git a/target-arm/translate.c b/target-arm/translate.c
index aeb3e84e8d40..ae6fd7f1c313 100644
--- a/target-arm/translate.c
+++ b/target-arm/translate.c
@@ -4049,20 +4049,30 @@ static int disas_vfp_insn(DisasContext *s, uint32_t insn)
     return 0;
 }
 
-static inline void gen_goto_tb(DisasContext *s, int n, target_ulong dest)
+static inline bool use_goto_tb(DisasContext *s, target_ulong dest)
 {
-    TranslationBlock *tb;
-
-    tb = s->tb;
+#ifndef CONFIG_USER_ONLY
     /* Direct jumps with goto_tb are only safe within the pages this TB resides
      * in because we don't take care of direct jumps when address mapping
-     * changes.
+     * changes in system mode.
      */
-    if ((tb->pc & TARGET_PAGE_MASK) == (dest & TARGET_PAGE_MASK) ||
-        ((s->pc - 1) & TARGET_PAGE_MASK) == (dest & TARGET_PAGE_MASK)) {
+    return (s->tb->pc & TARGET_PAGE_MASK) == (dest & TARGET_PAGE_MASK) ||
+           ((s->pc - 1) & TARGET_PAGE_MASK) == (dest & TARGET_PAGE_MASK);
+#else
+    /* In user mode, there's only a static address translation, so the
+     * destination address is always valid. TBs are always invalidated properly
+     * and direct jumps are reset when mapping attributes change.
+     */
+    return true;
+#endif
+}
+
+static inline void gen_goto_tb(DisasContext *s, int n, target_ulong dest)
+{
+    if (use_goto_tb(s, dest)) {
         tcg_gen_goto_tb(n);
         gen_set_pc_im(s, dest);
-        tcg_gen_exit_tb((uintptr_t)tb + n);
+        tcg_gen_exit_tb((uintptr_t)s->tb + n);
     } else {
         gen_set_pc_im(s, dest);
         tcg_gen_exit_tb(0);
diff --git a/target-cris/translate.c b/target-cris/translate.c
index 7acac076167e..cfd3933486d7 100644
--- a/target-cris/translate.c
+++ b/target-cris/translate.c
@@ -520,20 +520,30 @@ static void t_gen_cc_jmp(TCGv pc_true, TCGv pc_false)
     gen_set_label(l1);
 }
 
-static void gen_goto_tb(DisasContext *dc, int n, target_ulong dest)
+static inline bool use_goto_tb(DisasContext *dc, target_ulong dest)
 {
-    TranslationBlock *tb;
-    tb = dc->tb;
-
+#ifndef CONFIG_USER_ONLY
     /* Direct jumps with goto_tb are only safe within the pages this TB resides
      * in because we don't take care of direct jumps when address mapping
-     * changes.
+     * changes in system mode.
      */
-    if ((tb->pc & TARGET_PAGE_MASK) == (dest & TARGET_PAGE_MASK) ||
-        (dc->ppc & TARGET_PAGE_MASK) == (dest & TARGET_PAGE_MASK)) {
+    return (dc->tb->pc & TARGET_PAGE_MASK) == (dest & TARGET_PAGE_MASK) ||
+           (dc->ppc & TARGET_PAGE_MASK) == (dest & TARGET_PAGE_MASK);
+#else
+    /* In user mode, there's only a static address translation, so the
+     * destination address is always valid. TBs are always invalidated properly
+     * and direct jumps are reset when mapping attributes change.
+     */
+    return true;
+#endif
+}
+
+static void gen_goto_tb(DisasContext *dc, int n, target_ulong dest)
+{
+    if (use_goto_tb(dc, dest)) {
         tcg_gen_goto_tb(n);
         tcg_gen_movi_tl(env_pc, dest);
-                tcg_gen_exit_tb((uintptr_t)tb + n);
+                tcg_gen_exit_tb((uintptr_t)dc->tb + n);
     } else {
         tcg_gen_movi_tl(env_pc, dest);
         tcg_gen_exit_tb(0);
diff --git a/target-i386/translate.c b/target-i386/translate.c
index d0f440fc7697..3b7c2202a377 100644
--- a/target-i386/translate.c
+++ b/target-i386/translate.c
@@ -2085,23 +2085,33 @@ static inline int insn_const_size(TCGMemOp ot)
     }
 }
 
-static inline void gen_goto_tb(DisasContext *s, int tb_num, target_ulong eip)
+static inline bool use_goto_tb(DisasContext *s, target_ulong pc)
 {
-    TranslationBlock *tb;
-    target_ulong pc;
-
-    pc = s->cs_base + eip;
-    tb = s->tb;
+#ifndef CONFIG_USER_ONLY
     /* Direct jumps with goto_tb are only safe within the pages this TB resides
      * in because we don't take care of direct jumps when address mapping
-     * changes.
+     * changes in system mode.
+     */
+    return (pc & TARGET_PAGE_MASK) == (s->tb->pc & TARGET_PAGE_MASK) ||
+           (pc & TARGET_PAGE_MASK) == (s->pc_start & TARGET_PAGE_MASK);
+#else
+    /* In user mode, there's only a static address translation, so the
+     * destination address is always valid. TBs are always invalidated properly
+     * and direct jumps are reset when mapping attributes change.
      */
-    if ((pc & TARGET_PAGE_MASK) == (tb->pc & TARGET_PAGE_MASK) ||
-        (pc & TARGET_PAGE_MASK) == (s->pc_start & TARGET_PAGE_MASK))  {
+    return true;
+#endif
+}
+
+static inline void gen_goto_tb(DisasContext *s, int tb_num, target_ulong eip)
+{
+    target_ulong pc = s->cs_base + eip;
+
+    if (use_goto_tb(s, pc))  {
         /* jump to same page: we can use a direct jump */
         tcg_gen_goto_tb(tb_num);
         gen_jmp_im(eip);
-        tcg_gen_exit_tb((uintptr_t)tb + tb_num);
+        tcg_gen_exit_tb((uintptr_t)s->tb + tb_num);
     } else {
         /* jump to another page: currently not optimized */
         gen_jmp_im(eip);
diff --git a/target-lm32/translate.c b/target-lm32/translate.c
index 18d648ffc729..9b516da47faa 100644
--- a/target-lm32/translate.c
+++ b/target-lm32/translate.c
@@ -133,20 +133,33 @@ static inline void t_gen_illegal_insn(DisasContext *dc)
     gen_helper_ill(cpu_env);
 }
 
-static void gen_goto_tb(DisasContext *dc, int n, target_ulong dest)
+static inline bool use_goto_tb(DisasContext *dc, target_ulong dest)
 {
-    TranslationBlock *tb;
+    if (unlikely(dc->singlestep_enabled)) {
+        return false;
+    }
 
-    tb = dc->tb;
+#ifndef CONFIG_USER_ONLY
     /* Direct jumps with goto_tb are only safe within the page this TB resides
      * in because we don't take care of direct jumps when address mapping
-     * changes.
+     * changes in system mode.
      */
-    if ((tb->pc & TARGET_PAGE_MASK) == (dest & TARGET_PAGE_MASK) &&
-            likely(!dc->singlestep_enabled)) {
+    return (dc->tb->pc & TARGET_PAGE_MASK) == (dest & TARGET_PAGE_MASK);
+#else
+    /* In user mode, there's only a static address translation, so the
+     * destination address is always valid. TBs are always invalidated properly
+     * and direct jumps are reset when mapping attributes change.
+     */
+    return true;
+#endif
+}
+
+static void gen_goto_tb(DisasContext *dc, int n, target_ulong dest)
+{
+    if (use_goto_tb(dc, dest)) {
         tcg_gen_goto_tb(n);
         tcg_gen_movi_tl(cpu_pc, dest);
-        tcg_gen_exit_tb((uintptr_t)tb + n);
+        tcg_gen_exit_tb((uintptr_t)dc->tb + n);
     } else {
         tcg_gen_movi_tl(cpu_pc, dest);
         if (dc->singlestep_enabled) {
diff --git a/target-m68k/translate.c b/target-m68k/translate.c
index 282da60cbcca..454953608f93 100644
--- a/target-m68k/translate.c
+++ b/target-m68k/translate.c
@@ -852,23 +852,33 @@ static inline void gen_addr_fault(DisasContext *s)
         }                                                               \
     } while (0)
 
+static inline bool use_goto_tb(DisasContext *s, uint32_t dest)
+{
+#ifndef CONFIG_USER_ONLY
+    /* Direct jumps with goto_tb are only safe within the page this TB resides
+     * in because we don't take care of direct jumps when address mapping
+     * changes in system mode.
+     */
+    return (s->tb->pc & TARGET_PAGE_MASK) == (dest & TARGET_PAGE_MASK) ||
+           (s->insn_pc & TARGET_PAGE_MASK) == (dest & TARGET_PAGE_MASK);
+#else
+    /* In user mode, there's only a static address translation, so the
+     * destination address is always valid. TBs are always invalidated properly
+     * and direct jumps are reset when mapping attributes change.
+     */
+    return true;
+#endif
+}
+
 /* Generate a jump to an immediate address.  */
 static void gen_jmp_tb(DisasContext *s, int n, uint32_t dest)
 {
-    TranslationBlock *tb;
-
-    tb = s->tb;
     if (unlikely(s->singlestep_enabled)) {
         gen_exception(s, dest, EXCP_DEBUG);
-    } else if ((tb->pc & TARGET_PAGE_MASK) == (dest & TARGET_PAGE_MASK) ||
-               (s->insn_pc & TARGET_PAGE_MASK) == (dest & TARGET_PAGE_MASK)) {
-        /* Direct jumps with goto_tb are only safe within the page this TB
-         * resides in because we don't take care of direct jumps when address
-         * mapping changes.
-         */
+    } else if (use_goto_tb(s, dest)) {
         tcg_gen_goto_tb(n);
         tcg_gen_movi_i32(QREG_PC, dest);
-        tcg_gen_exit_tb((uintptr_t)tb + n);
+        tcg_gen_exit_tb((uintptr_t)s->tb + n);
     } else {
         gen_jmp_im(s, dest);
         tcg_gen_exit_tb(0);
diff --git a/target-microblaze/translate.c b/target-microblaze/translate.c
index 6028750ba7de..1fe0ba77ef06 100644
--- a/target-microblaze/translate.c
+++ b/target-microblaze/translate.c
@@ -124,18 +124,29 @@ static inline void t_gen_raise_exception(DisasContext *dc, uint32_t index)
     dc->is_jmp = DISAS_UPDATE;
 }
 
-static void gen_goto_tb(DisasContext *dc, int n, target_ulong dest)
+static inline bool use_goto_tb(DisasContext *dc, target_ulong dest)
 {
-    TranslationBlock *tb;
-    tb = dc->tb;
+#ifndef CONFIG_USER_ONLY
     /* Direct jumps with goto_tb are only safe within the page this TB resides
      * in because we don't take care of direct jumps when address mapping
-     * changes.
+     * changes in system mode.
+     */
+    return (dc->tb->pc & TARGET_PAGE_MASK) == (dest & TARGET_PAGE_MASK);
+#else
+    /* In user mode, there's only a static address translation, so the
+     * destination address is always valid. TBs are always invalidated properly
+     * and direct jumps are reset when mapping attributes change.
      */
-    if ((tb->pc & TARGET_PAGE_MASK) == (dest & TARGET_PAGE_MASK)) {
+    return true;
+#endif
+}
+
+static void gen_goto_tb(DisasContext *dc, int n, target_ulong dest)
+{
+    if (use_goto_tb(dc, dest)) {
         tcg_gen_goto_tb(n);
         tcg_gen_movi_tl(cpu_SR[SR_PC], dest);
-        tcg_gen_exit_tb((uintptr_t)tb + n);
+        tcg_gen_exit_tb((uintptr_t)dc->tb + n);
     } else {
         tcg_gen_movi_tl(cpu_SR[SR_PC], dest);
         tcg_gen_exit_tb(0);
diff --git a/target-mips/translate.c b/target-mips/translate.c
index 37b834d2df59..700496e1d265 100644
--- a/target-mips/translate.c
+++ b/target-mips/translate.c
@@ -4191,19 +4191,33 @@ static void gen_trap (DisasContext *ctx, uint32_t opc,
     tcg_temp_free(t1);
 }
 
-static inline void gen_goto_tb(DisasContext *ctx, int n, target_ulong dest)
+static inline bool use_goto_tb(DisasContext *ctx, target_ulong dest)
 {
-    TranslationBlock *tb;
-    tb = ctx->tb;
+    if (unlikely(ctx->singlestep_enabled)) {
+        return false;
+    }
+
+#ifndef CONFIG_USER_ONLY
     /* Direct jumps with goto_tb are only safe within the page this TB resides
      * in because we don't take care of direct jumps when address mapping
-     * changes.
+     * changes in system mode.
+     */
+    return (ctx->tb->pc & TARGET_PAGE_MASK) == (dest & TARGET_PAGE_MASK);
+#else
+    /* In user mode, there's only a static address translation, so the
+     * destination address is always valid. TBs are always invalidated properly
+     * and direct jumps are reset when mapping attributes change.
      */
-    if ((tb->pc & TARGET_PAGE_MASK) == (dest & TARGET_PAGE_MASK) &&
-        likely(!ctx->singlestep_enabled)) {
+    return true;
+#endif
+}
+
+static inline void gen_goto_tb(DisasContext *ctx, int n, target_ulong dest)
+{
+    if (use_goto_tb(ctx, dest)) {
         tcg_gen_goto_tb(n);
         gen_save_pc(dest);
-        tcg_gen_exit_tb((uintptr_t)tb + n);
+        tcg_gen_exit_tb((uintptr_t)ctx->tb + n);
     } else {
         gen_save_pc(dest);
         if (ctx->singlestep_enabled) {
diff --git a/target-moxie/translate.c b/target-moxie/translate.c
index fb99038399fa..d911e200d9f6 100644
--- a/target-moxie/translate.c
+++ b/target-moxie/translate.c
@@ -121,21 +121,34 @@ void moxie_translate_init(void)
     done_init = 1;
 }
 
-static inline void gen_goto_tb(CPUMoxieState *env, DisasContext *ctx,
-                               int n, target_ulong dest)
+static inline bool use_goto_tb(DisasContext *ctx, target_ulong dest)
 {
-    TranslationBlock *tb;
-    tb = ctx->tb;
+    if (unlikely(ctx->singlestep_enabled)) {
+        return false;
+    }
 
+#ifndef CONFIG_USER_ONLY
     /* Direct jumps with goto_tb are only safe within the page this TB resides
      * in because we don't take care of direct jumps when address mapping
-     * changes.
+     * changes in system mode.
      */
-    if ((tb->pc & TARGET_PAGE_MASK) == (dest & TARGET_PAGE_MASK) &&
-        !ctx->singlestep_enabled) {
+    return (ctx->tb->pc & TARGET_PAGE_MASK) == (dest & TARGET_PAGE_MASK);
+#else
+    /* In user mode, there's only a static address translation, so the
+     * destination address is always valid. TBs are always invalidated properly
+     * and direct jumps are reset when mapping attributes change.
+     */
+    return true;
+#endif
+}
+
+static inline void gen_goto_tb(CPUMoxieState *env, DisasContext *ctx,
+                               int n, target_ulong dest)
+{
+    if (use_goto_tb(ctx, dest)) {
         tcg_gen_goto_tb(n);
         tcg_gen_movi_i32(cpu_pc, dest);
-        tcg_gen_exit_tb((uintptr_t)tb + n);
+        tcg_gen_exit_tb((uintptr_t)ctx->tb + n);
     } else {
         tcg_gen_movi_i32(cpu_pc, dest);
         if (ctx->singlestep_enabled) {
diff --git a/target-openrisc/translate.c b/target-openrisc/translate.c
index da60fae26a75..be9deaa7a574 100644
--- a/target-openrisc/translate.c
+++ b/target-openrisc/translate.c
@@ -190,19 +190,33 @@ static void check_ov64s(DisasContext *dc)
 }
 #endif*/
 
-static void gen_goto_tb(DisasContext *dc, int n, target_ulong dest)
+static inline bool use_goto_tb(DisasContext *dc, target_ulong dest)
 {
-    TranslationBlock *tb;
-    tb = dc->tb;
+    if (unlikely(dc->singlestep_enabled)) {
+        return false;
+    }
+
+#ifndef CONFIG_USER_ONLY
     /* Direct jumps with goto_tb are only safe within the page this TB resides
      * in because we don't take care of direct jumps when address mapping
-     * changes.
+     * changes in system mode.
+     */
+    return (dc->tb->pc & TARGET_PAGE_MASK) == (dest & TARGET_PAGE_MASK);
+#else
+    /* In user mode, there's only a static address translation, so the
+     * destination address is always valid. TBs are always invalidated properly
+     * and direct jumps are reset when mapping attributes change.
      */
-    if ((tb->pc & TARGET_PAGE_MASK) == (dest & TARGET_PAGE_MASK) &&
-                                       likely(!dc->singlestep_enabled)) {
+    return true;
+#endif
+}
+
+static void gen_goto_tb(DisasContext *dc, int n, target_ulong dest)
+{
+    if (use_goto_tb(dc, dest)) {
         tcg_gen_movi_tl(cpu_pc, dest);
         tcg_gen_goto_tb(n);
-        tcg_gen_exit_tb((uintptr_t)tb + n);
+        tcg_gen_exit_tb((uintptr_t)dc->tb + n);
     } else {
         tcg_gen_movi_tl(cpu_pc, dest);
         if (dc->singlestep_enabled) {
diff --git a/target-ppc/translate.c b/target-ppc/translate.c
index 92ded8ec433b..21518decf9ed 100644
--- a/target-ppc/translate.c
+++ b/target-ppc/translate.c
@@ -3824,23 +3824,37 @@ static inline void gen_update_cfar(DisasContext *ctx, target_ulong nip)
 #endif
 }
 
+static inline bool use_goto_tb(DisasContext *ctx, target_ulong dest)
+{
+    if (unlikely(ctx->singlestep_enabled)) {
+        return false;
+    }
+
+#ifndef CONFIG_USER_ONLY
+    /* Direct jumps with goto_tb are only safe within the page this TB resides
+     * in because we don't take care of direct jumps when address mapping
+     * changes in system mode.
+     */
+    return (ctx->tb->pc & TARGET_PAGE_MASK) == (dest & TARGET_PAGE_MASK);
+#else
+    /* In user mode, there's only a static address translation, so the
+     * destination address is always valid. TBs are always invalidated properly
+     * and direct jumps are reset when mapping attributes change.
+     */
+    return true;
+#endif
+}
+
 /***                                Branch                                 ***/
 static inline void gen_goto_tb(DisasContext *ctx, int n, target_ulong dest)
 {
-    TranslationBlock *tb;
-    tb = ctx->tb;
     if (NARROW_MODE(ctx)) {
         dest = (uint32_t) dest;
     }
-    /* Direct jumps with goto_tb are only safe within the page this TB resides
-     * in because we don't take care of direct jumps when address mapping
-     * changes.
-     */
-    if ((tb->pc & TARGET_PAGE_MASK) == (dest & TARGET_PAGE_MASK) &&
-        likely(!ctx->singlestep_enabled)) {
+    if (use_goto_tb(ctx, dest)) {
         tcg_gen_goto_tb(n);
         tcg_gen_movi_tl(cpu_nip, dest & ~3);
-        tcg_gen_exit_tb((uintptr_t)tb + n);
+        tcg_gen_exit_tb((uintptr_t)ctx->tb + n);
     } else {
         tcg_gen_movi_tl(cpu_nip, dest & ~3);
         if (unlikely(ctx->singlestep_enabled)) {
diff --git a/target-s390x/translate.c b/target-s390x/translate.c
index 9f6ae60622b2..dab1b74b2667 100644
--- a/target-s390x/translate.c
+++ b/target-s390x/translate.c
@@ -608,15 +608,25 @@ static void gen_op_calc_cc(DisasContext *s)
 
 static int use_goto_tb(DisasContext *s, uint64_t dest)
 {
+    if (unlikely(s->singlestep_enabled) ||
+        (s->tb->cflags & CF_LAST_IO) ||
+        (s->tb->flags & FLAG_MASK_PER)) {
+        return false;
+    }
+#ifndef CONFIG_USER_ONLY
     /* Direct jumps with goto_tb are only safe within the pages this TB resides
      * in because we don't take care of direct jumps when address mapping
      * changes.
      */
-    return (((dest & TARGET_PAGE_MASK) == (s->tb->pc & TARGET_PAGE_MASK) ||
-             (dest & TARGET_PAGE_MASK) == (s->pc & TARGET_PAGE_MASK))
-            && !s->singlestep_enabled
-            && !(s->tb->cflags & CF_LAST_IO)
-            && !(s->tb->flags & FLAG_MASK_PER));
+    return (dest & TARGET_PAGE_MASK) == (s->tb->pc & TARGET_PAGE_MASK) ||
+           (dest & TARGET_PAGE_MASK) == (s->pc & TARGET_PAGE_MASK);
+#else
+    /* In user mode, there's only a static address translation, so the
+     * destination address is always valid. TBs are always invalidated properly
+     * and direct jumps are reset when mapping attributes change.
+     */
+    return true;
+#endif
 }
 
 static void account_noninline_branch(DisasContext *s, int cc_op)
diff --git a/target-sh4/translate.c b/target-sh4/translate.c
index 660692d06090..355c1c943918 100644
--- a/target-sh4/translate.c
+++ b/target-sh4/translate.c
@@ -205,21 +205,34 @@ static void gen_write_sr(TCGv src)
     tcg_gen_andi_i32(cpu_sr_t, cpu_sr_t, 1);
 }
 
-static void gen_goto_tb(DisasContext * ctx, int n, target_ulong dest)
+static inline bool use_goto_tb(DisasContext *ctx, target_ulong dest)
 {
-    TranslationBlock *tb;
-    tb = ctx->tb;
+    if (unlikely(ctx->singlestep_enabled)) {
+        return false;
+    }
 
+#ifndef CONFIG_USER_ONLY
     /* Direct jumps with goto_tb are only safe within the pages this TB resides
      * in because we don't take care of direct jumps when address mapping
-     * changes.
+     * changes in system mode.
+     */
+    return (ctx->tb->pc & TARGET_PAGE_MASK) == (dest & TARGET_PAGE_MASK);
+#else
+    /* In user mode, there's only a static address translation, so the
+     * destination address is always valid. TBs are always invalidated properly
+     * and direct jumps are reset when mapping attributes change.
      */
-    if ((tb->pc & TARGET_PAGE_MASK) == (dest & TARGET_PAGE_MASK) &&
-	!ctx->singlestep_enabled) {
+    return true;
+#endif
+}
+
+static void gen_goto_tb(DisasContext *ctx, int n, target_ulong dest)
+{
+    if (use_goto_tb(ctx, dest)) {
 	/* Use a direct jump if in same page and singlestep not enabled */
         tcg_gen_goto_tb(n);
         tcg_gen_movi_i32(cpu_pc, dest);
-        tcg_gen_exit_tb((uintptr_t)tb + n);
+        tcg_gen_exit_tb((uintptr_t)ctx->tb + n);
     } else {
         tcg_gen_movi_i32(cpu_pc, dest);
         if (ctx->singlestep_enabled)
diff --git a/target-sparc/translate.c b/target-sparc/translate.c
index d09a500e8bd4..8f59a101c4e5 100644
--- a/target-sparc/translate.c
+++ b/target-sparc/translate.c
@@ -303,24 +303,38 @@ static inline TCGv gen_dest_gpr(DisasContext *dc, int reg)
     }
 }
 
-static inline void gen_goto_tb(DisasContext *s, int tb_num,
-                               target_ulong pc, target_ulong npc)
+static inline bool use_goto_tb(DisasContext *s, target_ulong pc,
+                               target_ulong npc)
 {
-    TranslationBlock *tb;
+    if (unlikely(s->singlestep)) {
+        return false;
+    }
 
-    tb = s->tb;
+#ifndef CONFIG_USER_ONLY
     /* Direct jumps with goto_tb are only safe within the pages this TB resides
      * in because we don't take care of direct jumps when address mapping
-     * changes.
+     * changes in system mode.
+     */
+    return (pc & TARGET_PAGE_MASK) == (s->tb->pc & TARGET_PAGE_MASK) &&
+           (npc & TARGET_PAGE_MASK) == (s->tb->pc & TARGET_PAGE_MASK);
+#else
+    /* In user mode, there's only a static address translation, so the
+     * destination address is always valid. TBs are always invalidated properly
+     * and direct jumps are reset when mapping attributes change.
      */
-    if ((pc & TARGET_PAGE_MASK) == (tb->pc & TARGET_PAGE_MASK) &&
-        (npc & TARGET_PAGE_MASK) == (tb->pc & TARGET_PAGE_MASK) &&
-        !s->singlestep)  {
+    return true;
+#endif
+}
+
+static inline void gen_goto_tb(DisasContext *s, int tb_num,
+                               target_ulong pc, target_ulong npc)
+{
+    if (use_goto_tb(s, pc, npc))  {
         /* jump to same page: we can use a direct jump */
         tcg_gen_goto_tb(tb_num);
         tcg_gen_movi_tl(cpu_pc, pc);
         tcg_gen_movi_tl(cpu_npc, npc);
-        tcg_gen_exit_tb((uintptr_t)tb + tb_num);
+        tcg_gen_exit_tb((uintptr_t)s->tb + tb_num);
     } else {
         /* jump to another page: currently not optimized */
         tcg_gen_movi_tl(cpu_pc, pc);
diff --git a/target-tricore/translate.c b/target-tricore/translate.c
index b67154a3f410..a648b5e67eae 100644
--- a/target-tricore/translate.c
+++ b/target-tricore/translate.c
@@ -3236,19 +3236,33 @@ static inline void gen_save_pc(target_ulong pc)
     tcg_gen_movi_tl(cpu_PC, pc);
 }
 
-static inline void gen_goto_tb(DisasContext *ctx, int n, target_ulong dest)
+static inline bool use_goto_tb(DisasContext *ctx, target_ulong dest)
 {
-    TranslationBlock *tb;
-    tb = ctx->tb;
+    if (unlikely(ctx->singlestep_enabled)) {
+        return false;
+    }
+
+#ifndef CONFIG_USER_ONLY
     /* Direct jumps with goto_tb are only safe within the pages this TB resides
      * in because we don't take care of direct jumps when address mapping
-     * changes.
+     * changes in system mode.
      */
-    if ((tb->pc & TARGET_PAGE_MASK) == (dest & TARGET_PAGE_MASK) &&
-        likely(!ctx->singlestep_enabled)) {
+    return (ctx->tb->pc & TARGET_PAGE_MASK) == (dest & TARGET_PAGE_MASK);
+#else
+    /* In user mode, there's only a static address translation, so the
+     * destination address is always valid. TBs are always invalidated properly
+     * and direct jumps are reset when mapping attributes change.
+     */
+    return true;
+#endif
+}
+
+static inline void gen_goto_tb(DisasContext *ctx, int n, target_ulong dest)
+{
+    if (use_goto_tb(ctx, dest)) {
         tcg_gen_goto_tb(n);
         gen_save_pc(dest);
-        tcg_gen_exit_tb((uintptr_t)tb + n);
+        tcg_gen_exit_tb((uintptr_t)ctx->tb + n);
     } else {
         gen_save_pc(dest);
         if (ctx->singlestep_enabled) {
diff --git a/target-unicore32/translate.c b/target-unicore32/translate.c
index 04dcbb0bb466..af30f2563490 100644
--- a/target-unicore32/translate.c
+++ b/target-unicore32/translate.c
@@ -1089,19 +1089,29 @@ static void disas_ucf64_insn(CPUUniCore32State *env, DisasContext *s, uint32_t i
     }
 }
 
-static inline void gen_goto_tb(DisasContext *s, int n, uint32_t dest)
+static inline bool use_goto_tb(DisasContext *s, uint32_t dest)
 {
-    TranslationBlock *tb;
-
-    tb = s->tb;
+#ifndef CONFIG_USER_ONLY
     /* Direct jumps with goto_tb are only safe within the page this TB resides
      * in because we don't take care of direct jumps when address mapping
-     * changes.
+     * changes in system mode.
+     */
+    return (s->tb->pc & TARGET_PAGE_MASK) == (dest & TARGET_PAGE_MASK);
+#else
+    /* In user mode, there's only a static address translation, so the
+     * destination address is always valid. TBs are always invalidated properly
+     * and direct jumps are reset when mapping attributes change.
      */
-    if ((tb->pc & TARGET_PAGE_MASK) == (dest & TARGET_PAGE_MASK)) {
+    return true;
+#endif
+}
+
+static inline void gen_goto_tb(DisasContext *s, int n, uint32_t dest)
+{
+    if (use_goto_tb(s, dest)) {
         tcg_gen_goto_tb(n);
         gen_set_pc_im(dest);
-        tcg_gen_exit_tb((uintptr_t)tb + n);
+        tcg_gen_exit_tb((uintptr_t)s->tb + n);
     } else {
         gen_set_pc_im(dest);
         tcg_gen_exit_tb(0);
diff --git a/target-xtensa/translate.c b/target-xtensa/translate.c
index 7eeb279e5030..6886c389c919 100644
--- a/target-xtensa/translate.c
+++ b/target-xtensa/translate.c
@@ -418,13 +418,19 @@ static void gen_jump(DisasContext *dc, TCGv dest)
 static void gen_jumpi(DisasContext *dc, uint32_t dest, int slot)
 {
     TCGv_i32 tmp = tcg_const_i32(dest);
+#ifndef CONFIG_USER_ONLY
     /* Direct jumps with goto_tb are only safe within the pages this TB resides
      * in because we don't take care of direct jumps when address mapping
-     * changes.
+     * changes in system mode.
      */
     if (((dc->tb->pc ^ dest) & TARGET_PAGE_MASK) != 0) {
         slot = -1;
     }
+#endif
+    /* In user mode, there's only a static address translation, so the
+     * destination address is always valid. TBs are always invalidated properly
+     * and direct jumps are reset when mapping attributes change.
+     */
     gen_jump_slot(dc, tmp, slot);
     tcg_temp_free(tmp);
 }
@@ -450,13 +456,19 @@ static void gen_callw(DisasContext *dc, int callinc, TCGv_i32 dest)
 static void gen_callwi(DisasContext *dc, int callinc, uint32_t dest, int slot)
 {
     TCGv_i32 tmp = tcg_const_i32(dest);
+#ifndef CONFIG_USER_ONLY
     /* Direct jumps with goto_tb are only safe within the pages this TB resides
      * in because we don't take care of direct jumps when address mapping
-     * changes.
+     * changes in system mode.
      */
     if (((dc->tb->pc ^ dest) & TARGET_PAGE_MASK) != 0) {
         slot = -1;
     }
+#endif
+    /* In user mode, there's only a static address translation, so the
+     * destination address is always valid. TBs are always invalidated properly
+     * and direct jumps are reset when mapping attributes change.
+     */
     gen_callw_slot(dc, callinc, tmp, slot);
     tcg_temp_free(tmp);
 }
-- 
2.8.1
