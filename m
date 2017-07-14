Received: by 10.25.44.15 with SMTP id s15csp661106lfs;
        Fri, 14 Jul 2017 02:10:15 -0700 (PDT)
X-Received: by 10.28.216.21 with SMTP id p21mr2113778wmg.29.1500023415076;
        Fri, 14 Jul 2017 02:10:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1500023415; cv=none;
        d=google.com; s=arc-20160816;
        b=U0jrzY2Ii2Toxvq/KowHdHRGLGTn2D0gwW/Q/Wt5NvWPLs593YaHH1i4gAXeJ7X83i
         P25cwMbAwNdZ/MAA9UwxYW9V3KXgRqA1GVtJQUvwWfU81UuSw2DUOdrySHphbazfZFDG
         sUv4P0WtkLerwWRIU4MrKFBBbph865ksNjiti1e+/BjcAYMSPCJjReGTGUS17i5oP4ap
         yby8u5+vnVDOZU+3OxbY/VG/RU5EFjtad/QWBoLwLzbCydjtGR3tzBMck29EYmYFLioh
         nUFMh7JSp2PsQ1dseJkbTNRDRck8ogzV2ausvx5lD8zSP8qA+BhgtjX8zHh1op+zmxpi
         j9lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:user-agent:references
         :in-reply-to:message-id:date:subject:cc:to:from
         :arc-authentication-results;
        bh=zzcs7aGKPRrlmN+0SR/1lceB8Knmq3Uw3Kb9TzV7Rf0=;
        b=hMSjfoICzQASPNXX9+/kaDnBnF6Ind9VCCYi4dprIJSoEg/ndIF0wrVQwO0shcXONq
         g/0DUDglw/GQ5228IInizW4+7uZbyc+IRABIvpZLTv6K7zS/QvDQgiGnC3lL8O/YUQvo
         J78Dg2S69plHwByKgzq/oifsttoz7P/sObwBWGtGwkRa+YqhB6DPkhze+YNy2XrFachK
         XV6JaDSkhJCGHNJSEXJp3Rb8ROPRExeLzl+NW2rywi3ka0kA6c6ZJHIJA9IVDnE2BKhR
         /2MXm37/bFbwobcL9xCu3fAiqDauhbqgQDiA2h0cUaluMD54fhlyaLkcxbMNtJ37KjFk
         QeZg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of vilanova@ac.upc.edu designates 147.83.33.10 as permitted sender) smtp.mailfrom=vilanova@ac.upc.edu
Return-Path: <vilanova@ac.upc.edu>
Received: from roura.ac.upc.es (roura.ac.upc.es. [147.83.33.10])
        by mx.google.com with ESMTP id c55si5167609wra.137.2017.07.14.02.10.14;
        Fri, 14 Jul 2017 02:10:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of vilanova@ac.upc.edu designates 147.83.33.10 as permitted sender) client-ip=147.83.33.10;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of vilanova@ac.upc.edu designates 147.83.33.10 as permitted sender) smtp.mailfrom=vilanova@ac.upc.edu
Received: from correu-1.ac.upc.es (correu-1.ac.upc.es [147.83.30.91])
	by roura.ac.upc.es (8.13.8/8.13.8) with ESMTP id v6E9ABh6009110;
	Fri, 14 Jul 2017 11:10:11 +0200
Received: from localhost (unknown [31.210.188.120])
	by correu-1.ac.upc.es (Postfix) with ESMTPSA id E04286FE;
	Fri, 14 Jul 2017 11:10:05 +0200 (CEST)
From: =?utf-8?b?TGx1w61z?= Vilanova <vilanova@ac.upc.edu>
To: qemu-devel@nongnu.org
Cc: "Emilio G. Cota" <cota@braap.org>,
        =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
        Richard Henderson <rth@twiddle.net>,
        Peter Crosthwaite <crosthwaite.peter@gmail.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Peter Maydell <peter.maydell@linaro.org>,
        qemu-arm@nongnu.org (open list:ARM)
Subject: [PATCH v13 14/26] target/arm: [tcg,a64] Port to init_disas_context
Date: Fri, 14 Jul 2017 12:10:04 +0300
Message-Id: <150002340430.22386.10889954302345646107.stgit@frigg.lan>
X-Mailer: git-send-email 2.13.2
In-Reply-To: <150002001195.22386.4679134058536830996.stgit@frigg.lan>
References: <150002001195.22386.4679134058536830996.stgit@frigg.lan>
User-Agent: StGit/0.17.1-dirty
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TUID: syc8KDm6P42z

Incrementally paves the way towards using the generic instruction translation
loop.

Signed-off-by: Lluís Vilanova <vilanova@ac.upc.edu>
Reviewed-by: Richard Henderson <rth@twiddle.net>
Reviewed-by: Alex Benneé <alex.benee@linaro.org>
---
 target/arm/translate-a64.c |   36 ++++++++++++++++++++++--------------
 1 file changed, 22 insertions(+), 14 deletions(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 4270ac3847..5c04ff3d8b 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -11190,21 +11190,12 @@ static void disas_a64_insn(CPUARMState *env, DisasContext *s)
     free_tmp_a64(s);
 }
 
-void gen_intermediate_code_a64(DisasContextBase *dcbase, CPUState *cs,
-                               TranslationBlock *tb)
+static void aarch64_tr_init_disas_context(DisasContextBase *dcbase,
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
+    aarch64_tr_init_disas_context(&dc->base, cs);
 
     next_page_start = (dc->base.pc_first & TARGET_PAGE_MASK) + TARGET_PAGE_SIZE;
     max_insns = dc->base.tb->cflags & CF_COUNT_MASK;
