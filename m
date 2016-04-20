Received: by 10.25.208.194 with SMTP id h185csp2539275lfg;
        Wed, 20 Apr 2016 14:16:01 -0700 (PDT)
X-Received: by 10.112.9.140 with SMTP id z12mr4548023lba.115.1461186942987;
        Wed, 20 Apr 2016 14:15:42 -0700 (PDT)
Return-Path: <sergey.fedorov@linaro.org>
Received: from mail-lf0-x22d.google.com (mail-lf0-x22d.google.com. [2a00:1450:4010:c07::22d])
        by mx.google.com with ESMTPS id k9si4618482lbc.70.2016.04.20.14.15.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 20 Apr 2016 14:15:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of sergey.fedorov@linaro.org designates 2a00:1450:4010:c07::22d as permitted sender) client-ip=2a00:1450:4010:c07::22d;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org;
       spf=pass (google.com: domain of sergey.fedorov@linaro.org designates 2a00:1450:4010:c07::22d as permitted sender) smtp.mailfrom=sergey.fedorov@linaro.org;
       dmarc=pass (p=NONE dis=NONE) header.from=linaro.org
Received: by mail-lf0-x22d.google.com with SMTP id g184so48853757lfb.3
        for <alex.bennee@linaro.org>; Wed, 20 Apr 2016 14:15:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=J6WtHFwWhM0xpe93dINqeKZf4DShChBgbXajIT+hHeg=;
        b=gbexNXie9PDymg4ti6tg5imTgzQGIV53LHjfNoBbghuIK462rQtWSpP9xkPYaKus+V
         MVb5Y9C19Co8xa+rYlrrNcqg9Y32SqYlT1KBpbQuEWYucRmTYNEmGdzD1C3sVG8R2qC3
         ukfzwFPw/vz+CDy3G6Qt9OpT5abX5w7/xQwWM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=J6WtHFwWhM0xpe93dINqeKZf4DShChBgbXajIT+hHeg=;
        b=SYY2i+3ow7kpBllkhN05tIRfXDrKubMXxUN2uYP9lOy0Fu5LfDa1wji6kVDSIQJxmV
         hbWra6AF7wdu8Ke+aBh6ZPMSJMNAZ0JMJVWly50COjQnAm9ttvxAmT51x858d/epQ6iq
         wCwii47+g01bs1unwpDNlxCRQ/Ba3+py1RQ5bsVELH18cLi4+QqZRZJO86+8wBz22FxI
         A1l9oR7zlS49PSaThBy4FtyM81mGBmjg62rJ5DTkNDsxtzPUgrftqc1kDCltFVtXeCkT
         9N9v8x6VjKLQN1gbRba0v0ct0ZEp3h1rLoaJPitrx2AYjmfN+DiCH5SEM6e6MsbQZ2Hi
         DloQ==
X-Gm-Message-State: AOPr4FVkTjwNDnc6RFlgZSF2YqwGY5rhnAyriD7ruK5dJnuq+ZcYlMEKUDcgU+KO8e9qCiQL1Gc=
X-Received: by 10.25.1.196 with SMTP id 187mr4659749lfb.143.1461186942777;
        Wed, 20 Apr 2016 14:15:42 -0700 (PDT)
Return-Path: <sergey.fedorov@linaro.org>
Received: from sergey-laptop.Dlink (broadband-46-188-121-115.2com.net. [46.188.121.115])
        by smtp.gmail.com with ESMTPSA id ub6sm1409964lbb.17.2016.04.20.14.15.41
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Wed, 20 Apr 2016 14:15:42 -0700 (PDT)
From: Sergey Fedorov <sergey.fedorov@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Sergey Fedorov <serge.fdrv@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	Richard Henderson <rth@twiddle.net>,
	Sergey Fedorov <sergey.fedorov@linaro.org>,
	Riku Voipio <riku.voipio@iki.fi>,
	Blue Swirl <blauwirbel@gmail.com>,
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
Subject: [PATCH v4 10/10] tcg: Allow goto_tb to any target PC in user mode
Date: Thu, 21 Apr 2016 00:15:21 +0300
Message-Id: <1461186921-14977-11-git-send-email-sergey.fedorov@linaro.org>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <1461186921-14977-1-git-send-email-sergey.fedorov@linaro.org>
References: <1461186921-14977-1-git-send-email-sergey.fedorov@linaro.org>
X-TUID: /2nd0NyI1iE1

From: Sergey Fedorov <serge.fdrv@gmail.com>

In user mode, there's only a static address translation, TBs are always
invalidated properly and direct jumps are reset when mapping change.
Thus the destination address is always valid for direct jumps and
there's no need to restrict it to the pages the TB resides in.

Signed-off-by: Sergey Fedorov <serge.fdrv@gmail.com>
Signed-off-by: Sergey Fedorov <sergey.fedorov@linaro.org>
Cc: Riku Voipio <riku.voipio@iki.fi>
Cc: Blue Swirl <blauwirbel@gmail.com>
---

Changes in v4:
 * Explanatory comments moved to tcg_gen_goto_tb()
   declaration comment
 * Cc'ed usermode maintainers in commit message excplicitly

 target-alpha/translate.c      |  4 ++++
 target-arm/translate-a64.c    |  2 ++
 target-arm/translate.c        | 18 ++++++++++++------
 target-cris/translate.c       | 18 ++++++++++++------
 target-i386/translate.c       | 23 ++++++++++++++---------
 target-lm32/translate.c       | 21 +++++++++++++++------
 target-m68k/translate.c       | 18 ++++++++++++------
 target-microblaze/translate.c | 15 +++++++++++----
 target-mips/translate.c       | 20 +++++++++++++++-----
 target-moxie/translate.c      | 21 +++++++++++++++------
 target-openrisc/translate.c   | 20 +++++++++++++++-----
 target-ppc/translate.c        | 20 +++++++++++++++-----
 target-s390x/translate.c      | 17 +++++++++++------
 target-sh4/translate.c        | 21 +++++++++++++++------
 target-sparc/translate.c      | 24 +++++++++++++++++-------
 target-tricore/translate.c    | 20 +++++++++++++++-----
 target-unicore32/translate.c  | 16 +++++++++++-----
 target-xtensa/translate.c     |  4 ++++
 tcg/tcg-op.h                  |  9 ++++++---
 19 files changed, 221 insertions(+), 90 deletions(-)

diff --git a/target-alpha/translate.c b/target-alpha/translate.c
index 5b86992dd367..d43b3f41bdd0 100644
--- a/target-alpha/translate.c
+++ b/target-alpha/translate.c
@@ -464,8 +464,12 @@ static bool use_goto_tb(DisasContext *ctx, uint64_t dest)
     if (in_superpage(ctx, dest)) {
         return true;
     }
+#ifndef CONFIG_USER_ONLY
     /* Check for the dest on the same page as the start of the TB.  */
     return ((ctx->tb->pc ^ dest) & TARGET_PAGE_MASK) == 0;
+#else
+    return true;
+#endif
 }
 
 static ExitStatus gen_bdirect(DisasContext *ctx, int ra, int32_t disp)
diff --git a/target-arm/translate-a64.c b/target-arm/translate-a64.c
index b13cff756ad1..476d677f22d7 100644
--- a/target-arm/translate-a64.c
+++ b/target-arm/translate-a64.c
@@ -274,10 +274,12 @@ static inline bool use_goto_tb(DisasContext *s, int n, uint64_t dest)
         return false;
     }
 
+#ifndef CONFIG_USER_ONLY
     /* Only link tbs from inside the same guest page */
     if ((s->tb->pc & TARGET_PAGE_MASK) != (dest & TARGET_PAGE_MASK)) {
         return false;
     }
+#endif
 
     return true;
 }
diff --git a/target-arm/translate.c b/target-arm/translate.c
index 34196a821772..a43b1f61cf77 100644
--- a/target-arm/translate.c
+++ b/target-arm/translate.c
@@ -4049,16 +4049,22 @@ static int disas_vfp_insn(DisasContext *s, uint32_t insn)
     return 0;
 }
 
-static inline void gen_goto_tb(DisasContext *s, int n, target_ulong dest)
+static inline bool use_goto_tb(DisasContext *s, target_ulong dest)
 {
-    TranslationBlock *tb;
+#ifndef CONFIG_USER_ONLY
+    return (s->tb->pc & TARGET_PAGE_MASK) == (dest & TARGET_PAGE_MASK) ||
+           ((s->pc - 1) & TARGET_PAGE_MASK) == (dest & TARGET_PAGE_MASK);
+#else
+    return true;
+#endif
+}
 
-    tb = s->tb;
-    if ((tb->pc & TARGET_PAGE_MASK) == (dest & TARGET_PAGE_MASK) ||
-        ((s->pc - 1) & TARGET_PAGE_MASK) == (dest & TARGET_PAGE_MASK)) {
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
index 9c8ff8f2308a..f28b1999a786 100644
--- a/target-cris/translate.c
+++ b/target-cris/translate.c
@@ -520,16 +520,22 @@ static void t_gen_cc_jmp(TCGv pc_true, TCGv pc_false)
     gen_set_label(l1);
 }
 
-static void gen_goto_tb(DisasContext *dc, int n, target_ulong dest)
+static inline bool use_goto_tb(DisasContext *dc, target_ulong dest)
 {
-    TranslationBlock *tb;
-    tb = dc->tb;
+#ifndef CONFIG_USER_ONLY
+    return (dc->tb->pc & TARGET_PAGE_MASK) == (dest & TARGET_PAGE_MASK) ||
+           (dc->ppc & TARGET_PAGE_MASK) == (dest & TARGET_PAGE_MASK);
+#else
+    return true;
+#endif
+}
 
-    if ((tb->pc & TARGET_PAGE_MASK) == (dest & TARGET_PAGE_MASK) ||
-        (dc->ppc & TARGET_PAGE_MASK) == (dest & TARGET_PAGE_MASK)) {
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
index cb725b41c37d..64d74bf24383 100644
--- a/target-i386/translate.c
+++ b/target-i386/translate.c
@@ -2085,20 +2085,25 @@ static inline int insn_const_size(TCGMemOp ot)
     }
 }
 
+static inline bool use_goto_tb(DisasContext *s, target_ulong pc)
+{
+#ifndef CONFIG_USER_ONLY
+    return (pc & TARGET_PAGE_MASK) == (s->tb->pc & TARGET_PAGE_MASK) ||
+           (pc & TARGET_PAGE_MASK) == (s->pc_start & TARGET_PAGE_MASK);
+#else
+    return true;
+#endif
+}
+
 static inline void gen_goto_tb(DisasContext *s, int tb_num, target_ulong eip)
 {
-    TranslationBlock *tb;
-    target_ulong pc;
-
-    pc = s->cs_base + eip;
-    tb = s->tb;
-    /* NOTE: we handle the case where the TB spans two pages here */
-    if ((pc & TARGET_PAGE_MASK) == (tb->pc & TARGET_PAGE_MASK) ||
-        (pc & TARGET_PAGE_MASK) == (s->pc_start & TARGET_PAGE_MASK))  {
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
index 256a51f8498f..dd972f5b8c59 100644
--- a/target-lm32/translate.c
+++ b/target-lm32/translate.c
@@ -133,16 +133,25 @@ static inline void t_gen_illegal_insn(DisasContext *dc)
     gen_helper_ill(cpu_env);
 }
 
-static void gen_goto_tb(DisasContext *dc, int n, target_ulong dest)
+static inline bool use_goto_tb(DisasContext *dc, target_ulong dest)
 {
-    TranslationBlock *tb;
+    if (unlikely(dc->singlestep_enabled)) {
+        return false;
+    }
+
+#ifndef CONFIG_USER_ONLY
+    return (dc->tb->pc & TARGET_PAGE_MASK) == (dest & TARGET_PAGE_MASK);
+#else
+    return true;
+#endif
+}
 
-    tb = dc->tb;
-    if ((tb->pc & TARGET_PAGE_MASK) == (dest & TARGET_PAGE_MASK) &&
-            likely(!dc->singlestep_enabled)) {
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
index e2ce6c615e07..e46356e44c78 100644
--- a/target-m68k/translate.c
+++ b/target-m68k/translate.c
@@ -852,19 +852,25 @@ static inline void gen_addr_fault(DisasContext *s)
         }                                                               \
     } while (0)
 
+static inline bool use_goto_tb(DisasContext *s, uint32_t dest)
+{
+#ifndef CONFIG_USER_ONLY
+    return (s->tb->pc & TARGET_PAGE_MASK) == (dest & TARGET_PAGE_MASK) ||
+           (s->insn_pc & TARGET_PAGE_MASK) == (dest & TARGET_PAGE_MASK);
+#else
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
+    } else if (use_goto_tb(s, dest)) {
         tcg_gen_goto_tb(n);
         tcg_gen_movi_i32(QREG_PC, dest);
-        tcg_gen_exit_tb((uintptr_t)tb + n);
+        tcg_gen_exit_tb((uintptr_t)s->tb + n);
     } else {
         gen_jmp_im(s, dest);
         tcg_gen_exit_tb(0);
diff --git a/target-microblaze/translate.c b/target-microblaze/translate.c
index f944965a14e1..a7a8ac8f995f 100644
--- a/target-microblaze/translate.c
+++ b/target-microblaze/translate.c
@@ -124,14 +124,21 @@ static inline void t_gen_raise_exception(DisasContext *dc, uint32_t index)
     dc->is_jmp = DISAS_UPDATE;
 }
 
+static inline bool use_goto_tb(DisasContext *dc, target_ulong dest)
+{
+#ifndef CONFIG_USER_ONLY
+    return (dc->tb->pc & TARGET_PAGE_MASK) == (dest & TARGET_PAGE_MASK);
+#else
+    return true;
+#endif
+}
+
 static void gen_goto_tb(DisasContext *dc, int n, target_ulong dest)
 {
-    TranslationBlock *tb;
-    tb = dc->tb;
-    if ((tb->pc & TARGET_PAGE_MASK) == (dest & TARGET_PAGE_MASK)) {
+    if (use_goto_tb(dc, dest)) {
         tcg_gen_goto_tb(n);
         tcg_gen_movi_tl(cpu_SR[SR_PC], dest);
-        tcg_gen_exit_tb((uintptr_t)tb + n);
+        tcg_gen_exit_tb((uintptr_t)dc->tb + n);
     } else {
         tcg_gen_movi_tl(cpu_SR[SR_PC], dest);
         tcg_gen_exit_tb(0);
diff --git a/target-mips/translate.c b/target-mips/translate.c
index a3a05ec66dd2..ddfb9244d7e3 100644
--- a/target-mips/translate.c
+++ b/target-mips/translate.c
@@ -4191,15 +4191,25 @@ static void gen_trap (DisasContext *ctx, uint32_t opc,
     tcg_temp_free(t1);
 }
 
+static inline bool use_goto_tb(DisasContext *ctx, target_ulong dest)
+{
+    if (unlikely(ctx->singlestep_enabled)) {
+        return false;
+    }
+
+#ifndef CONFIG_USER_ONLY
+    return (ctx->tb->pc & TARGET_PAGE_MASK) == (dest & TARGET_PAGE_MASK);
+#else
+    return true;
+#endif
+}
+
 static inline void gen_goto_tb(DisasContext *ctx, int n, target_ulong dest)
 {
-    TranslationBlock *tb;
-    tb = ctx->tb;
-    if ((tb->pc & TARGET_PAGE_MASK) == (dest & TARGET_PAGE_MASK) &&
-        likely(!ctx->singlestep_enabled)) {
+    if (use_goto_tb(ctx, dest)) {
         tcg_gen_goto_tb(n);
         gen_save_pc(dest);
-        tcg_gen_exit_tb((uintptr_t)tb + n);
+        tcg_gen_exit_tb((uintptr_t)ctx->tb + n);
     } else {
         gen_save_pc(dest);
         if (ctx->singlestep_enabled) {
diff --git a/target-moxie/translate.c b/target-moxie/translate.c
index a437e2ab6026..58200c25d3f4 100644
--- a/target-moxie/translate.c
+++ b/target-moxie/translate.c
@@ -121,17 +121,26 @@ void moxie_translate_init(void)
     done_init = 1;
 }
 
+static inline bool use_goto_tb(DisasContext *ctx, target_ulong dest)
+{
+    if (unlikely(ctx->singlestep_enabled)) {
+        return false;
+    }
+
+#ifndef CONFIG_USER_ONLY
+    return (ctx->tb->pc & TARGET_PAGE_MASK) == (dest & TARGET_PAGE_MASK);
+#else
+    return true;
+#endif
+}
+
 static inline void gen_goto_tb(CPUMoxieState *env, DisasContext *ctx,
                                int n, target_ulong dest)
 {
-    TranslationBlock *tb;
-    tb = ctx->tb;
-
-    if ((tb->pc & TARGET_PAGE_MASK) == (dest & TARGET_PAGE_MASK) &&
-        !ctx->singlestep_enabled) {
+    if (use_goto_tb(ctx, dest)) {
         tcg_gen_goto_tb(n);
         tcg_gen_movi_i32(cpu_pc, dest);
-        tcg_gen_exit_tb((uintptr_t)tb + n);
+        tcg_gen_exit_tb((uintptr_t)ctx->tb + n);
     } else {
         tcg_gen_movi_i32(cpu_pc, dest);
         if (ctx->singlestep_enabled) {
diff --git a/target-openrisc/translate.c b/target-openrisc/translate.c
index 5d0ab442a872..d4f1f260e425 100644
--- a/target-openrisc/translate.c
+++ b/target-openrisc/translate.c
@@ -190,15 +190,25 @@ static void check_ov64s(DisasContext *dc)
 }
 #endif*/
 
+static inline bool use_goto_tb(DisasContext *dc, target_ulong dest)
+{
+    if (unlikely(dc->singlestep_enabled)) {
+        return false;
+    }
+
+#ifndef CONFIG_USER_ONLY
+    return (dc->tb->pc & TARGET_PAGE_MASK) == (dest & TARGET_PAGE_MASK);
+#else
+    return true;
+#endif
+}
+
 static void gen_goto_tb(DisasContext *dc, int n, target_ulong dest)
 {
-    TranslationBlock *tb;
-    tb = dc->tb;
-    if ((tb->pc & TARGET_PAGE_MASK) == (dest & TARGET_PAGE_MASK) &&
-                                       likely(!dc->singlestep_enabled)) {
+    if (use_goto_tb(dc, dest)) {
         tcg_gen_movi_tl(cpu_pc, dest);
         tcg_gen_goto_tb(n);
-        tcg_gen_exit_tb((uintptr_t)tb + n);
+        tcg_gen_exit_tb((uintptr_t)dc->tb + n);
     } else {
         tcg_gen_movi_tl(cpu_pc, dest);
         if (dc->singlestep_enabled) {
diff --git a/target-ppc/translate.c b/target-ppc/translate.c
index b3860ecdea9c..d485d7c7cb18 100644
--- a/target-ppc/translate.c
+++ b/target-ppc/translate.c
@@ -3822,19 +3822,29 @@ static inline void gen_update_cfar(DisasContext *ctx, target_ulong nip)
 #endif
 }
 
+static inline bool use_goto_tb(DisasContext *ctx, target_ulong dest)
+{
+    if (unlikely(ctx->singlestep_enabled)) {
+        return false;
+    }
+
+#ifndef CONFIG_USER_ONLY
+    return (ctx->tb->pc & TARGET_PAGE_MASK) == (dest & TARGET_PAGE_MASK);
+#else
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
index c5179fe05d7e..e99eb5cb0169 100644
--- a/target-s390x/translate.c
+++ b/target-s390x/translate.c
@@ -608,12 +608,17 @@ static void gen_op_calc_cc(DisasContext *s)
 
 static int use_goto_tb(DisasContext *s, uint64_t dest)
 {
-    /* NOTE: we handle the case where the TB spans two pages here */
-    return (((dest & TARGET_PAGE_MASK) == (s->tb->pc & TARGET_PAGE_MASK)
-             || (dest & TARGET_PAGE_MASK) == (s->pc & TARGET_PAGE_MASK))
-            && !s->singlestep_enabled
-            && !(s->tb->cflags & CF_LAST_IO)
-            && !(s->tb->flags & FLAG_MASK_PER));
+    if (unlikely(s->singlestep_enabled) ||
+        (s->tb->cflags & CF_LAST_IO) ||
+        (s->tb->flags & FLAG_MASK_PER)) {
+        return false;
+    }
+#ifndef CONFIG_USER_ONLY
+    return (dest & TARGET_PAGE_MASK) == (s->tb->pc & TARGET_PAGE_MASK) ||
+           (dest & TARGET_PAGE_MASK) == (s->pc & TARGET_PAGE_MASK);
+#else
+    return true;
+#endif
 }
 
 static void account_noninline_branch(DisasContext *s, int cc_op)
diff --git a/target-sh4/translate.c b/target-sh4/translate.c
index 7c189680a7a4..53f782c05467 100644
--- a/target-sh4/translate.c
+++ b/target-sh4/translate.c
@@ -205,17 +205,26 @@ static void gen_write_sr(TCGv src)
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
+
+#ifndef CONFIG_USER_ONLY
+    return (ctx->tb->pc & TARGET_PAGE_MASK) == (dest & TARGET_PAGE_MASK);
+#else
+    return true;
+#endif
+}
 
-    if ((tb->pc & TARGET_PAGE_MASK) == (dest & TARGET_PAGE_MASK) &&
-	!ctx->singlestep_enabled) {
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
index 7998ff57bf09..d154e3f7b633 100644
--- a/target-sparc/translate.c
+++ b/target-sparc/translate.c
@@ -303,20 +303,30 @@ static inline TCGv gen_dest_gpr(DisasContext *dc, int reg)
     }
 }
 
+static inline bool use_goto_tb(DisasContext *s, target_ulong pc,
+                               target_ulong npc)
+{
+    if (unlikely(s->singlestep)) {
+        return false;
+    }
+
+#ifndef CONFIG_USER_ONLY
+    return (pc & TARGET_PAGE_MASK) == (s->tb->pc & TARGET_PAGE_MASK) &&
+           (npc & TARGET_PAGE_MASK) == (s->tb->pc & TARGET_PAGE_MASK);
+#else
+    return true;
+#endif
+}
+
 static inline void gen_goto_tb(DisasContext *s, int tb_num,
                                target_ulong pc, target_ulong npc)
 {
-    TranslationBlock *tb;
-
-    tb = s->tb;
-    if ((pc & TARGET_PAGE_MASK) == (tb->pc & TARGET_PAGE_MASK) &&
-        (npc & TARGET_PAGE_MASK) == (tb->pc & TARGET_PAGE_MASK) &&
-        !s->singlestep)  {
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
index 912bf226bedc..0237e7bea835 100644
--- a/target-tricore/translate.c
+++ b/target-tricore/translate.c
@@ -3236,15 +3236,25 @@ static inline void gen_save_pc(target_ulong pc)
     tcg_gen_movi_tl(cpu_PC, pc);
 }
 
+static inline bool use_goto_tb(DisasContext *ctx, target_ulong dest)
+{
+    if (unlikely(ctx->singlestep_enabled)) {
+        return false;
+    }
+
+#ifndef CONFIG_USER_ONLY
+    return (ctx->tb->pc & TARGET_PAGE_MASK) == (dest & TARGET_PAGE_MASK);
+#else
+    return true;
+#endif
+}
+
 static inline void gen_goto_tb(DisasContext *ctx, int n, target_ulong dest)
 {
-    TranslationBlock *tb;
-    tb = ctx->tb;
-    if ((tb->pc & TARGET_PAGE_MASK) == (dest & TARGET_PAGE_MASK) &&
-        likely(!ctx->singlestep_enabled)) {
+    if (use_goto_tb(ctx, dest)) {
         tcg_gen_goto_tb(n);
         gen_save_pc(dest);
-        tcg_gen_exit_tb((uintptr_t)tb + n);
+        tcg_gen_exit_tb((uintptr_t)ctx->tb + n);
     } else {
         gen_save_pc(dest);
         if (ctx->singlestep_enabled) {
diff --git a/target-unicore32/translate.c b/target-unicore32/translate.c
index 39af3af05f15..307f7b205924 100644
--- a/target-unicore32/translate.c
+++ b/target-unicore32/translate.c
@@ -1089,15 +1089,21 @@ static void disas_ucf64_insn(CPUUniCore32State *env, DisasContext *s, uint32_t i
     }
 }
 
-static inline void gen_goto_tb(DisasContext *s, int n, uint32_t dest)
+static inline bool use_goto_tb(DisasContext *s, uint32_t dest)
 {
-    TranslationBlock *tb;
+#ifndef CONFIG_USER_ONLY
+    return (s->tb->pc & TARGET_PAGE_MASK) == (dest & TARGET_PAGE_MASK);
+#else
+    return true;
+#endif
+}
 
-    tb = s->tb;
-    if ((tb->pc & TARGET_PAGE_MASK) == (dest & TARGET_PAGE_MASK)) {
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
index 989448846902..9eac56e2a5bc 100644
--- a/target-xtensa/translate.c
+++ b/target-xtensa/translate.c
@@ -418,9 +418,11 @@ static void gen_jump(DisasContext *dc, TCGv dest)
 static void gen_jumpi(DisasContext *dc, uint32_t dest, int slot)
 {
     TCGv_i32 tmp = tcg_const_i32(dest);
+#ifndef CONFIG_USER_ONLY
     if (((dc->tb->pc ^ dest) & TARGET_PAGE_MASK) != 0) {
         slot = -1;
     }
+#endif
     gen_jump_slot(dc, tmp, slot);
     tcg_temp_free(tmp);
 }
@@ -446,9 +448,11 @@ static void gen_callw(DisasContext *dc, int callinc, TCGv_i32 dest)
 static void gen_callwi(DisasContext *dc, int callinc, uint32_t dest, int slot)
 {
     TCGv_i32 tmp = tcg_const_i32(dest);
+#ifndef CONFIG_USER_ONLY
     if (((dc->tb->pc ^ dest) & TARGET_PAGE_MASK) != 0) {
         slot = -1;
     }
+#endif
     gen_callw_slot(dc, callinc, tmp, slot);
     tcg_temp_free(tmp);
 }
diff --git a/tcg/tcg-op.h b/tcg/tcg-op.h
index ace39619ef89..f217e8074715 100644
--- a/tcg/tcg-op.h
+++ b/tcg/tcg-op.h
@@ -759,9 +759,12 @@ static inline void tcg_gen_exit_tb(uintptr_t val)
  *
  * See tcg/README for more info about this TCG operation.
  *
- * NOTE: Direct jumps with goto_tb are only safe within the pages this TB
- * resides in because we don't take care of direct jumps when address mapping
- * changes, e.g. in tlb_flush().
+ * NOTE: In softmmu emulation, direct jumps with goto_tb are only safe within
+ * the pages this TB resides in because we don't take care of direct jumps when
+ * address mapping changes, e.g. in tlb_flush(). In user mode, there's only a
+ * static address translation, so the destination address is always valid, TBs
+ * are always invalidated properly, and direct jumps are reset when mapping
+ * changes.
  */
 void tcg_gen_goto_tb(unsigned idx);
 
-- 
2.8.1
