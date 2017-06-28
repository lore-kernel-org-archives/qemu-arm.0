Received: by 10.25.227.6 with SMTP id a6csp3053715lfh;
        Wed, 28 Jun 2017 06:21:25 -0700 (PDT)
X-Received: by 10.84.217.152 with SMTP id p24mr12134871pli.276.1498656084998;
        Wed, 28 Jun 2017 06:21:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1498656084; cv=none;
        d=google.com; s=arc-20160816;
        b=HpQZEiSQzI2/LJOErvGSoUCo5t6tHkfsJID1N2LV1LujBDUTVxVpG4Cq2gfCBfrmsx
         ZKujfb/DYuEwRjEkN4jirrAksl5/X4SiyBSXBIwKDvrErjBXkfT/ltAbcI6zAs6n1133
         3JrYUhJQqSaHOOR0Senu/hH3PZpyTlDOoXULOyXtSPssroThFFyxY7Qsh5j/nwQrdcWe
         2XX+HEfAEXNrVm3+q6vg+IEvjH4RWunijbbJFftCBtPAfCy2a4OJ+0Hs3n5fZ91x5tcp
         mzSN0CJjXoPuKYzKhSmc73og6fuZ3eB5XFYBaC/SMziwGCgQNQXtHBAYDu0kd8TXKklu
         jxJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:user-agent:references
         :in-reply-to:message-id:date:subject:cc:to:from
         :arc-authentication-results;
        bh=MaNe93kdcGKdVBDja+XzT0othLd7B/0YuNCi4H6d5v0=;
        b=Hf+B7N8lt92kANDD9PioI6//HIDCRYn04xumUf551asSMmwXmBzueMSRUISctLwR1O
         0ef6AzsPbVyMKhFzbsdYdlE5gZ8+LYB3sLe15a2mWZ4L1OWJaj8DtxA+QBm9MKMDDuE5
         wDRlPrI8391L+xcwGF46q65A3ypSeCkUjY9B1OKQKEMzw1A8Q7Bt6ZtNe/E2quZ1tljS
         XAtdtpp/SReOm6YYqcZr1Gek1odpUA/blfjfNuS18FQVwRvf4GmQJC/1pB/L/4dJDB6J
         lTKKuiOKrnN/THl02AUbPDclb9hEGnKSfMJvGbkCFwDqoM4Yp5Rj2aABgagCjAmQirnR
         P37w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of vilanova@ac.upc.edu designates 147.83.33.10 as permitted sender) smtp.mailfrom=vilanova@ac.upc.edu
Return-Path: <vilanova@ac.upc.edu>
Received: from roura.ac.upc.es (roura.ac.upc.edu. [147.83.33.10])
        by mx.google.com with ESMTP id 63si1711741plf.50.2017.06.28.06.21.23;
        Wed, 28 Jun 2017 06:21:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of vilanova@ac.upc.edu designates 147.83.33.10 as permitted sender) client-ip=147.83.33.10;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of vilanova@ac.upc.edu designates 147.83.33.10 as permitted sender) smtp.mailfrom=vilanova@ac.upc.edu
Received: from correu-2.ac.upc.es (correu-2.ac.upc.es [147.83.30.92])
	by roura.ac.upc.es (8.13.8/8.13.8) with ESMTP id v5SDLJmS027342;
	Wed, 28 Jun 2017 15:21:19 +0200
Received: from localhost (unknown [132.68.50.243])
	by correu-2.ac.upc.es (Postfix) with ESMTPSA id C3B511E0;
	Wed, 28 Jun 2017 15:21:13 +0200 (CEST)
From: =?utf-8?b?TGx1w61z?= Vilanova <vilanova@ac.upc.edu>
To: qemu-devel@nongnu.org
Cc: "Emilio G. Cota" <cota@braap.org>,
        =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
        Richard Henderson <rth@twiddle.net>,
        Peter Crosthwaite <crosthwaite.peter@gmail.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Peter Maydell <peter.maydell@linaro.org>,
        qemu-arm@nongnu.org (open list:ARM)
Subject: [PATCH v11 16/29] target/arm: [tcg,a64] Port to init_disas_context
Date: Wed, 28 Jun 2017 16:21:12 +0300
Message-Id: <149865607253.17063.18194249796068858104.stgit@frigg.lan>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <149865219962.17063.10630533069463266646.stgit@frigg.lan>
References: <149865219962.17063.10630533069463266646.stgit@frigg.lan>
User-Agent: StGit/0.17.1-dirty
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TUID: j/0ehogG5asO

Incrementally paves the way towards using the generic instruction translation
loop.

Signed-off-by: Lluís Vilanova <vilanova@ac.upc.edu>
---
 target/arm/translate-a64.c |   36 ++++++++++++++++++++++--------------
 1 file changed, 22 insertions(+), 14 deletions(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 4270ac3847..88624a726d 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -11190,21 +11190,12 @@ static void disas_a64_insn(CPUARMState *env, DisasContext *s)
     free_tmp_a64(s);
 }
 
-void gen_intermediate_code_a64(DisasContextBase *dcbase, CPUState *cs,
-                               TranslationBlock *tb)
+static void aarch64_trblock_init_disas_context(DisasContextBase *dcbase,
+                                               CPUState *cpu)
 {
-    CPUARMState *env = cs->env_ptr;
-    ARMCPU *cpu = arm_env_get_cpu(env);
     DisasContext *dc = container_of(dcbase, DisasContext, base);
-    target_ulong next_page_start;
-    int max_insns;
-
-    dc->base.tb = tb;
-    dc->base.pc_first = dc->base.tb->pc;
-    dc->base.pc_next = dc->base.pc_first;
-    dc->base.is_jmp = DISAS_NEXT;
-    dc->base.num_insns = 0;
-    dc->base.singlestep_enabled = cs->singlestep_enabled;
+    CPUARMState *env = cpu->env_ptr;
+    ARMCPU *arm_cpu = arm_env_get_cpu(env);
 
     dc->pc = dc->base.pc_first;
     dc->condjmp = 0;
@@ -11230,7 +11221,7 @@ void gen_intermediate_code_a64(DisasContextBase *dcbase, CPUState *cs,
     dc->fp_excp_el = ARM_TBFLAG_FPEXC_EL(dc->base.tb->flags);
     dc->vec_len = 0;
     dc->vec_stride = 0;
-    dc->cp_regs = cpu->cp_regs;
+    dc->cp_regs = arm_cpu->cp_regs;
     dc->features = env->features;
 
     /* Single step state. The code-generation logic here is:
@@ -11254,6 +11245,23 @@ void gen_intermediate_code_a64(DisasContextBase *dcbase, CPUState *cs,
     dc->ss_same_el = (arm_debug_target_el(env) == dc->current_el);
 
     init_tmp_a64_array(dc);
+}
+
+void gen_intermediate_code_a64(DisasContextBase *dcbase, CPUState *cs,
+                               TranslationBlock *tb)
+{
+    CPUARMState *env = cs->env_ptr;
+    DisasContext *dc = container_of(dcbase, DisasContext, base);
+    target_ulong next_page_start;
+    int max_insns;
+
+    dc->base.tb = tb;
+    dc->base.pc_first = dc->base.tb->pc;
+    dc->base.pc_next = dc->base.pc_first;
+    dc->base.is_jmp = DISAS_NEXT;
+    dc->base.num_insns = 0;
+    dc->base.singlestep_enabled = cs->singlestep_enabled;
+    aarch64_trblock_init_disas_context(&dc->base, cs);
 
     next_page_start = (dc->base.pc_first & TARGET_PAGE_MASK) + TARGET_PAGE_SIZE;
     max_insns = dc->base.tb->cflags & CF_COUNT_MASK;
