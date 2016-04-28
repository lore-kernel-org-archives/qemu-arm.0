Received: by 10.25.208.137 with SMTP id h131csp508513lfg;
        Thu, 28 Apr 2016 14:34:28 -0700 (PDT)
X-Received: by 10.112.62.165 with SMTP id z5mr6076679lbr.89.1461879253053;
        Thu, 28 Apr 2016 14:34:13 -0700 (PDT)
Return-Path: <sergey.fedorov@linaro.org>
Received: from mail-lf0-x22c.google.com (mail-lf0-x22c.google.com. [2a00:1450:4010:c07::22c])
        by mx.google.com with ESMTPS id u2si6111368lbv.125.2016.04.28.14.34.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 28 Apr 2016 14:34:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of sergey.fedorov@linaro.org designates 2a00:1450:4010:c07::22c as permitted sender) client-ip=2a00:1450:4010:c07::22c;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org;
       spf=pass (google.com: domain of sergey.fedorov@linaro.org designates 2a00:1450:4010:c07::22c as permitted sender) smtp.mailfrom=sergey.fedorov@linaro.org;
       dmarc=pass (p=NONE dis=NONE) header.from=linaro.org
Received: by mail-lf0-x22c.google.com with SMTP id u64so98734150lff.3
        for <alex.bennee@linaro.org>; Thu, 28 Apr 2016 14:34:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jAVzd6knGHS8ni0KNTX7DqfMPj8ytt8fOnoi3hXdErA=;
        b=hxlo574kGyS9zexpwIrLOkv+Gd3UIkSOZUM/pZdqzpvzfzzcBaAi3r+Cwdr9EPlOCU
         Ck+e92ZVDQuOt63Bzaaq9NlI34l4Kdk6+MxFjRHsMw5RM+Iv4kfVcLwUAZ/oUANyO3iL
         VFLsuRAibCNfbdwqlza07u71dJUWTrNFcX3VI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jAVzd6knGHS8ni0KNTX7DqfMPj8ytt8fOnoi3hXdErA=;
        b=YOKud5Ml3zb+Mp6kJPQN8yUeF8c7E0n8zvwEEnJK9WCVMjR4Fc339L5CmtDY1lDeE/
         WUcKGU+HFnUQ9lAN0kS0iDk68g7eXUE2vKIvfdiw5Gdd32eQbm1UNuRb/7lX78M6pMAd
         NqLKhD9umP/VfFvRaPqoLn/F624BUFcHJefuIS4jF+7QK1uUKVaOtAaS2V7Zf/JMG/VX
         LtlzzEz2ZjrwwNwufv9nDsKDanAkoIaRS3WguuAXW0/2tbu/oJTj0iUPabu6BVzTjqTX
         ZuqP9T2tNTgNpOsXE/xraCZ+bhv+Q2fxDEz5cJ/a3M/BmGpTPYLZVRaItNYS+a/mgppx
         wApQ==
X-Gm-Message-State: AOPr4FVomIj5U9TtQtbD+blEq01L++5lhWs0Al+oIMs8X1F+mTLBTXsHV4XOlna0Nz2+udndXi8=
X-Received: by 10.112.50.107 with SMTP id b11mr7488678lbo.15.1461879252907;
        Thu, 28 Apr 2016 14:34:12 -0700 (PDT)
Return-Path: <sergey.fedorov@linaro.org>
Received: from sergey-laptop.Dlink (broadband-46-188-121-115.2com.net. [46.188.121.115])
        by smtp.gmail.com with ESMTPSA id m7sm1953148lbr.6.2016.04.28.14.34.11
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Thu, 28 Apr 2016 14:34:11 -0700 (PDT)
From: Sergey Fedorov <sergey.fedorov@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Sergey Fedorov <serge.fdrv@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	Richard Henderson <rth@twiddle.net>,
	Sergey Fedorov <sergey.fedorov@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Alexander Graf <agraf@suse.de>,
	qemu-arm@nongnu.org
Subject: [PATCH v5 09/10] tcg: Clean up direct block chaining safety checks
Date: Fri, 29 Apr 2016 00:33:54 +0300
Message-Id: <1461879235-7694-10-git-send-email-sergey.fedorov@linaro.org>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <1461879235-7694-1-git-send-email-sergey.fedorov@linaro.org>
References: <1461879235-7694-1-git-send-email-sergey.fedorov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: LnPVN3pj2Lwz

From: Sergey Fedorov <serge.fdrv@gmail.com>

We don't take care of direct jumps when address mapping changes. Thus we
must be sure to generate direct jumps so that they always keep valid
even if address mapping changes. Luckily, we can only allow to execute a
TB if it was generated from the pages which match with current mapping.

Document tcg_gen_goto_tb() declaration and note the reason for
destination PC limitations.

Some targets with variable length instructions allow TB to straddle a
page boundary. However, we make sure that both of TB pages match the
current address mapping when looking up TBs. So it is safe to do direct
jumps into the both pages. Correct the checks for some of those targets.

Given that, we can safely patch a TB which spans two pages. Remove the
unnecessary check in cpu_exec() and allow such TBs to be patched.

Signed-off-by: Sergey Fedorov <serge.fdrv@gmail.com>
Signed-off-by: Sergey Fedorov <sergey.fedorov@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
---

Changes in v4:
 * Documented tcg_gen_goto_tb() declaration
 * Destination PC check explanatory comments moved to tcg_gen_goto_tb()
   declaration comment
 * Updated commit message

 cpu-exec.c               |  7 ++-----
 target-arm/translate.c   |  3 ++-
 target-cris/translate.c  |  4 +++-
 target-i386/translate.c  |  2 +-
 target-m68k/translate.c  |  2 +-
 target-s390x/translate.c |  2 +-
 tcg/tcg-op.h             | 10 ++++++++++
 7 files changed, 20 insertions(+), 10 deletions(-)

diff --git a/cpu-exec.c b/cpu-exec.c
index debc65ca691a..f984dc71cbf1 100644
--- a/cpu-exec.c
+++ b/cpu-exec.c
@@ -508,11 +508,8 @@ int cpu_exec(CPUState *cpu)
                     next_tb = 0;
                     tcg_ctx.tb_ctx.tb_invalidated_flag = 0;
                 }
-                /* see if we can patch the calling TB. When the TB
-                   spans two pages, we cannot safely do a direct
-                   jump. */
-                if (next_tb != 0 && tb->page_addr[1] == -1
-                    && !qemu_loglevel_mask(CPU_LOG_TB_NOCHAIN)) {
+                /* See if we can patch the calling TB. */
+                if (next_tb != 0 && !qemu_loglevel_mask(CPU_LOG_TB_NOCHAIN)) {
                     tb_add_jump((TranslationBlock *)(next_tb & ~TB_EXIT_MASK),
                                 next_tb & TB_EXIT_MASK, tb);
                 }
diff --git a/target-arm/translate.c b/target-arm/translate.c
index 940ec8d981d1..34196a821772 100644
--- a/target-arm/translate.c
+++ b/target-arm/translate.c
@@ -4054,7 +4054,8 @@ static inline void gen_goto_tb(DisasContext *s, int n, target_ulong dest)
     TranslationBlock *tb;
 
     tb = s->tb;
-    if ((tb->pc & TARGET_PAGE_MASK) == (dest & TARGET_PAGE_MASK)) {
+    if ((tb->pc & TARGET_PAGE_MASK) == (dest & TARGET_PAGE_MASK) ||
+        ((s->pc - 1) & TARGET_PAGE_MASK) == (dest & TARGET_PAGE_MASK)) {
         tcg_gen_goto_tb(n);
         gen_set_pc_im(s, dest);
         tcg_gen_exit_tb((uintptr_t)tb + n);
diff --git a/target-cris/translate.c b/target-cris/translate.c
index a73176c118b0..9c8ff8f2308a 100644
--- a/target-cris/translate.c
+++ b/target-cris/translate.c
@@ -524,7 +524,9 @@ static void gen_goto_tb(DisasContext *dc, int n, target_ulong dest)
 {
     TranslationBlock *tb;
     tb = dc->tb;
-    if ((tb->pc & TARGET_PAGE_MASK) == (dest & TARGET_PAGE_MASK)) {
+
+    if ((tb->pc & TARGET_PAGE_MASK) == (dest & TARGET_PAGE_MASK) ||
+        (dc->ppc & TARGET_PAGE_MASK) == (dest & TARGET_PAGE_MASK)) {
         tcg_gen_goto_tb(n);
         tcg_gen_movi_tl(env_pc, dest);
                 tcg_gen_exit_tb((uintptr_t)tb + n);
diff --git a/target-i386/translate.c b/target-i386/translate.c
index 3a32f65f8de8..058d85a1abf7 100644
--- a/target-i386/translate.c
+++ b/target-i386/translate.c
@@ -2094,7 +2094,7 @@ static inline void gen_goto_tb(DisasContext *s, int tb_num, target_ulong eip)
     tb = s->tb;
     /* NOTE: we handle the case where the TB spans two pages here */
     if ((pc & TARGET_PAGE_MASK) == (tb->pc & TARGET_PAGE_MASK) ||
-        (pc & TARGET_PAGE_MASK) == ((s->pc - 1) & TARGET_PAGE_MASK))  {
+        (pc & TARGET_PAGE_MASK) == (s->pc_start & TARGET_PAGE_MASK))  {
         /* jump to same page: we can use a direct jump */
         tcg_gen_goto_tb(tb_num);
         gen_jmp_im(eip);
diff --git a/target-m68k/translate.c b/target-m68k/translate.c
index 7560c3a80841..e2ce6c615e07 100644
--- a/target-m68k/translate.c
+++ b/target-m68k/translate.c
@@ -861,7 +861,7 @@ static void gen_jmp_tb(DisasContext *s, int n, uint32_t dest)
     if (unlikely(s->singlestep_enabled)) {
         gen_exception(s, dest, EXCP_DEBUG);
     } else if ((tb->pc & TARGET_PAGE_MASK) == (dest & TARGET_PAGE_MASK) ||
-               (s->pc & TARGET_PAGE_MASK) == (dest & TARGET_PAGE_MASK)) {
+               (s->insn_pc & TARGET_PAGE_MASK) == (dest & TARGET_PAGE_MASK)) {
         tcg_gen_goto_tb(n);
         tcg_gen_movi_i32(QREG_PC, dest);
         tcg_gen_exit_tb((uintptr_t)tb + n);
diff --git a/target-s390x/translate.c b/target-s390x/translate.c
index c871ef2bb302..c5179fe05d7e 100644
--- a/target-s390x/translate.c
+++ b/target-s390x/translate.c
@@ -610,7 +610,7 @@ static int use_goto_tb(DisasContext *s, uint64_t dest)
 {
     /* NOTE: we handle the case where the TB spans two pages here */
     return (((dest & TARGET_PAGE_MASK) == (s->tb->pc & TARGET_PAGE_MASK)
-             || (dest & TARGET_PAGE_MASK) == ((s->pc - 1) & TARGET_PAGE_MASK))
+             || (dest & TARGET_PAGE_MASK) == (s->pc & TARGET_PAGE_MASK))
             && !s->singlestep_enabled
             && !(s->tb->cflags & CF_LAST_IO)
             && !(s->tb->flags & FLAG_MASK_PER));
diff --git a/tcg/tcg-op.h b/tcg/tcg-op.h
index c446d3dc7293..ace39619ef89 100644
--- a/tcg/tcg-op.h
+++ b/tcg/tcg-op.h
@@ -753,6 +753,16 @@ static inline void tcg_gen_exit_tb(uintptr_t val)
     tcg_gen_op1i(INDEX_op_exit_tb, val);
 }
 
+/**
+ * tcg_gen_goto_tb() - output goto_tb TCG operation
+ * @idx: Direct jump slot index (0 or 1)
+ *
+ * See tcg/README for more info about this TCG operation.
+ *
+ * NOTE: Direct jumps with goto_tb are only safe within the pages this TB
+ * resides in because we don't take care of direct jumps when address mapping
+ * changes, e.g. in tlb_flush().
+ */
 void tcg_gen_goto_tb(unsigned idx);
 
 #if TARGET_LONG_BITS == 32
-- 
2.8.1
