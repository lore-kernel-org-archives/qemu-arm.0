Received: by 10.25.44.15 with SMTP id s15csp56523lfs;
        Fri, 7 Jul 2017 05:42:07 -0700 (PDT)
X-Received: by 10.223.172.183 with SMTP id o52mr751976wrc.1.1499431327904;
        Fri, 07 Jul 2017 05:42:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1499431327; cv=none;
        d=google.com; s=arc-20160816;
        b=Y5AohdQJBQaXcPyK65KAOLOatngFLWLCm6aelROWnlGTbxdkHRoxoZlgJxt6+/jMUN
         LRgK8uMHoG2+dflknVOfJ2TSyY5QpjiytVdUOYA4ivmZkZxjUIATsowNBKgxZx/RDn+s
         +jfmxEWFZ4fJLyenNdCUHVDk3HSyCoKSpFSIfNB4dQr0itkKbxGqf0XV3dObYkWk7LUB
         Wjv5ZeiZJ6R2B8UPLpAWeXfKM/0Xx2uod72LOlxefkaqUqgTBCUaS5UHwpYM6nxIe6XE
         ZyNMEtwXgBXJNXDMSb4ikztEhbMdoZhlmzlDfDxP3TOznWEVMJ2Tv5OXDSTw747M3nOn
         eVwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:user-agent:references
         :in-reply-to:message-id:date:subject:cc:to:from
         :arc-authentication-results;
        bh=BktBewVHD0Q1bdj6pW3GJpb/MK9WoDGKHXzS8e//wYI=;
        b=EasVx3VebOtJrA2ADHeiII9UXRByHl/fF8Ik4hEbYZqObpZYdmBd44k5AVb2lBd8p4
         Pyd04vOnuB3FgMYa+SiRCaiKqVoyvlBxven53M1eSFmWkXYyQ6CLJjwzblOm5cDNfwHn
         KfKO+EPcY6TH8hUahsu7z/s7nVG4bl08plN35M+LgRDJDQLb6uJsRaeguDFNjHDCtGAT
         o4PTMTp2uCzJvid0HLzrtdtvHHCfTkidNHv9YfBr5t7JD66BjUo9btA+dKZe91SzUent
         1O6CV5XyqWK3MxM/OEIuG28SCHGh5QzX3Wds7NzookZ/Cdehqnep13pbj92bSBIsOUBS
         QJpw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of vilanova@ac.upc.edu designates 147.83.33.10 as permitted sender) smtp.mailfrom=vilanova@ac.upc.edu
Return-Path: <vilanova@ac.upc.edu>
Received: from roura.ac.upc.es (roura.ac.upc.edu. [147.83.33.10])
        by mx.google.com with ESMTP id e21si2938775wmc.198.2017.07.07.05.42.07;
        Fri, 07 Jul 2017 05:42:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of vilanova@ac.upc.edu designates 147.83.33.10 as permitted sender) client-ip=147.83.33.10;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of vilanova@ac.upc.edu designates 147.83.33.10 as permitted sender) smtp.mailfrom=vilanova@ac.upc.edu
Received: from correu-2.ac.upc.es (correu-2.ac.upc.es [147.83.30.92])
	by roura.ac.upc.es (8.13.8/8.13.8) with ESMTP id v67Cg4if021662;
	Fri, 7 Jul 2017 14:42:04 +0200
Received: from localhost (63.red-83-51-187.dynamicip.rima-tde.net [83.51.187.63])
	by correu-2.ac.upc.es (Postfix) with ESMTPSA id 55AC86FD;
	Fri,  7 Jul 2017 14:41:59 +0200 (CEST)
From: =?utf-8?b?TGx1w61z?= Vilanova <vilanova@ac.upc.edu>
To: qemu-devel@nongnu.org
Cc: "Emilio G. Cota" <cota@braap.org>,
        =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
        Richard Henderson <rth@twiddle.net>,
        Peter Crosthwaite <crosthwaite.peter@gmail.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Peter Maydell <peter.maydell@linaro.org>,
        qemu-arm@nongnu.org (open list:ARM)
Subject: [PATCH v12 15/27] target/arm: [tcg,a64] Port to init_disas_context
Date: Fri,  7 Jul 2017 14:41:53 +0200
Message-Id: <149943131289.8972.14899352517803578316.stgit@frigg.lan>
X-Mailer: git-send-email 2.13.2
In-Reply-To: <149942760788.8972.474351671751194003.stgit@frigg.lan>
References: <149942760788.8972.474351671751194003.stgit@frigg.lan>
User-Agent: StGit/0.17.1-dirty
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TUID: Nt3D4z2PCYIi

Incrementally paves the way towards using the generic instruction translation
loop.

Signed-off-by: Lluís Vilanova <vilanova@ac.upc.edu>
Reviewed-by: Richard Henderson <rth@twiddle.net>
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
