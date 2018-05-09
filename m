Received: by 10.28.4.212 with SMTP id 203csp56391wme;
        Wed, 9 May 2018 11:02:58 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZo+JGfpOBxuXYx2tfzzkdk9izjI7AORih8KDgkNzTEezx13GthIRBVZ+/o+fNTc4PA8DjK1
X-Received: by 10.55.114.131 with SMTP id n125mr38884852qkc.78.1525888978318;
        Wed, 09 May 2018 11:02:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1525888978; cv=none;
        d=google.com; s=arc-20160816;
        b=eTguK+BZqJ5iqW2Dc+aVHsPJODjPeqjKe23gD8s6x5pul8Nz15l+ZrIRmb7oAE8Fir
         R4T40yxUBfd3lBFDHKTIwypwzHttd7eigl60HoQrmRcLbSZbyP5II2U2sKdvkooDVVFF
         R/DgiMOtj0cKkToxtFJ3xKD2E/YCkQacxrbu539AB/hrDyau1H8VSgkx/uoljR/jWQvn
         m9AbcCCAt7ufTLP7itS5xiBUBAbnlFiW3sQwzV1xzJlpXQmusxRJ7eHXh+nK3O0J5oYO
         jBa/p47yCPLTd/SAyXI9lmYn9R/Db3tohTRU2Z+DqRAzIYg7dRyWcF3yQMlrsVp6Hknx
         ImJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=+kVWY1RbZ3kDGU2UWrDNL3DOZDv8bI9hM/4pRKRqNqE=;
        b=i76Mn6cYxDN35Nb1ZI5y8jgTB5nIaXnqeug9tGHYclftafC1OpH6nCySPE2EEhx8Ws
         2Zb814oYp+YDK7mVp2xpAGtamKTgDfxQBGOLVnUU45tnuS6Re+E0QCkd7sqZugyDSlMv
         ZhyxfXXtUJ1398ikZS78wRGW0Fo0toPEeNPgZ+685hEYZsJxKQ3ttQ3fn9NGeYlCeb6f
         JAKiHP6z2AogQJJwRWjac8IK/B4cx/JDXAW7QSLHI/y61JboCaELFcmsu6cqJvxRodOv
         B7nSQW8WYZwnya97ekwQ+5E49UPIpTrPRMOct9C0ByWkEczRe+jHV7NrneOxyLvNI31q
         iV0A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=RoExCsVC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c80si13408457qkj.231.2018.05.09.11.02.58
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 09 May 2018 11:02:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=RoExCsVC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58148 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fGTQX-00051k-Ov
	for alex.bennee@linaro.org; Wed, 09 May 2018 14:02:57 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48572)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fGTJU-0005PC-6f
	for qemu-arm@nongnu.org; Wed, 09 May 2018 13:55:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fGTJP-0005yH-NN
	for qemu-arm@nongnu.org; Wed, 09 May 2018 13:55:40 -0400
Received: from mail-pl0-x242.google.com ([2607:f8b0:400e:c01::242]:46559)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1fGTJP-0005w9-6A
	for qemu-arm@nongnu.org; Wed, 09 May 2018 13:55:35 -0400
Received: by mail-pl0-x242.google.com with SMTP id 59-v6so4737709plc.13
	for <qemu-arm@nongnu.org>; Wed, 09 May 2018 10:55:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=+kVWY1RbZ3kDGU2UWrDNL3DOZDv8bI9hM/4pRKRqNqE=;
	b=RoExCsVCr8x1xOxAwcOAIFJU0z8eEgVlI+/hMTc8TmZ2YX6+ugM3Xq4QVM0pZmV45B
	kPIHyC9BjsoVBNHjSRu5wR6PWlcLG2Zb5J4zbD9tH97F3N6VzzIFRTQixmJECJEghTTC
	OkpDdkUVr34O5eVCPlIMLREvTr6JyeZhiCykE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=+kVWY1RbZ3kDGU2UWrDNL3DOZDv8bI9hM/4pRKRqNqE=;
	b=fiHaTI4UfhE1s9AIfAJD5oSXot8wb00DwkPduw/EqBoGe2slOpYTKIyuqYTzgzE1HV
	/iElMMSv+e3/L6vsMX7wQm9e+ix8sGWz+1ogmFFNkafnWMilPh06QhHE8UaH4E2rPQJR
	OgF80wiuz84Id74CvIgDvOjkGDY6wPNmEwsstEFl4/zt7XCUPWHXzJap8pNrjopOetUf
	5Nvw2GYyqF+vhd7P21xqsBnFmdbvgg8QwYw4t/wtzLEh7TsG8gZQ2QZP3PJgyYr3IJ1U
	I+aTZzHqch5xrk68nCVgLxQ8TAxpyMDyt8mwqSUVeZ54ZddCeVaiASPa/HEk0fS1ylff
	nB6g==
X-Gm-Message-State: ALQs6tD4dUCJ7mks1H0YXezpRjxJadHDjlTzSjOceL8Gy/USQbCYTRmw
	ccbcphKn/+JP5/ngye/kWgCC7Q==
X-Received: by 2002:a17:902:7795:: with SMTP id
	o21-v6mr25952862pll.36.1525888533781; 
	Wed, 09 May 2018 10:55:33 -0700 (PDT)
Received: from cloudburst.twiddle.net (97-113-2-170.tukw.qwest.net.
	[97.113.2.170]) by smtp.gmail.com with ESMTPSA id
	l90sm60332813pfb.149.2018.05.09.10.55.32
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 09 May 2018 10:55:32 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Wed,  9 May 2018 10:54:49 -0700
Message-Id: <20180509175458.15642-20-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180509175458.15642-1-richard.henderson@linaro.org>
References: <20180509175458.15642-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c01::242
Subject: [Qemu-arm] [PULL 19/28] target/mips: use *ctx for DisasContext
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, Sagar Karandikar <sagark@eecs.berkeley.edu>,
	David Hildenbrand <david@redhat.com>, Palmer Dabbelt <palmer@sifive.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Max Filippov <jcmvbkbc@gmail.com>, Michael Clark <mjc@sifive.com>,
	Guan Xuetao <gxt@mprc.pku.edu.cn>, Yongbok Kim <yongbok.kim@mips.com>,
	Alexander Graf <agraf@suse.de>, "Emilio G. Cota" <cota@braap.org>,
	Richard Henderson <rth@twiddle.net>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Eduardo Habkost <ehabkost@redhat.com>, qemu-s390x@nongnu.org,
	qemu-arm@nongnu.org, Stafford Horne <shorne@gmail.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Cornelia Huck <cohuck@redhat.com>,
	Michael Walle <michael@walle.cc>, qemu-ppc@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: sNrlbbC61YNk

From: "Emilio G. Cota" <cota@braap.org>

No changes to the logic here; this is just to make the diff
that follows easier to read.

While at it, remove the unnecessary 'struct' in
'struct TranslationBlock'.

Note that checkpatch complains with a false positive:
  ERROR: space prohibited after that '&' (ctx:WxW)
  #75: FILE: target/mips/translate.c:20220:
  +    ctx->kscrexist = (env->CP0_Config4 >> CP0C4_KScrExist) & 0xff;
                                                              ^
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Cc: Aurelien Jarno <aurelien@aurel32.net>
Cc: Yongbok Kim <yongbok.kim@mips.com>
Signed-off-by: Emilio G. Cota <cota@braap.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/mips/translate.c | 161 ++++++++++++++++++++--------------------
 1 file changed, 81 insertions(+), 80 deletions(-)

diff --git a/target/mips/translate.c b/target/mips/translate.c
index 31c7425cfe..7a931ea3e7 100644
--- a/target/mips/translate.c
+++ b/target/mips/translate.c
@@ -20194,55 +20194,56 @@ static void decode_opc(CPUMIPSState *env, DisasContext *ctx)
     }
 }
 
-void gen_intermediate_code(CPUState *cs, struct TranslationBlock *tb)
+void gen_intermediate_code(CPUState *cs, TranslationBlock *tb)
 {
     CPUMIPSState *env = cs->env_ptr;
-    DisasContext ctx;
+    DisasContext ctx1;
+    DisasContext *ctx = &ctx1;
     target_ulong page_start;
     int max_insns;
     int insn_bytes;
     int is_slot;
 
-    ctx.base.tb = tb;
-    ctx.base.pc_first = tb->pc;
-    ctx.base.pc_next = tb->pc;
-    ctx.base.is_jmp = DISAS_NEXT;
-    ctx.base.singlestep_enabled = cs->singlestep_enabled;
-    ctx.base.num_insns = 0;
+    ctx->base.tb = tb;
+    ctx->base.pc_first = tb->pc;
+    ctx->base.pc_next = tb->pc;
+    ctx->base.is_jmp = DISAS_NEXT;
+    ctx->base.singlestep_enabled = cs->singlestep_enabled;
+    ctx->base.num_insns = 0;
 
-    page_start = ctx.base.pc_first & TARGET_PAGE_MASK;
-    ctx.saved_pc = -1;
-    ctx.insn_flags = env->insn_flags;
-    ctx.CP0_Config1 = env->CP0_Config1;
-    ctx.btarget = 0;
-    ctx.kscrexist = (env->CP0_Config4 >> CP0C4_KScrExist) & 0xff;
-    ctx.rxi = (env->CP0_Config3 >> CP0C3_RXI) & 1;
-    ctx.ie = (env->CP0_Config4 >> CP0C4_IE) & 3;
-    ctx.bi = (env->CP0_Config3 >> CP0C3_BI) & 1;
-    ctx.bp = (env->CP0_Config3 >> CP0C3_BP) & 1;
-    ctx.PAMask = env->PAMask;
-    ctx.mvh = (env->CP0_Config5 >> CP0C5_MVH) & 1;
-    ctx.eva = (env->CP0_Config5 >> CP0C5_EVA) & 1;
-    ctx.sc = (env->CP0_Config3 >> CP0C3_SC) & 1;
-    ctx.CP0_LLAddr_shift = env->CP0_LLAddr_shift;
-    ctx.cmgcr = (env->CP0_Config3 >> CP0C3_CMGCR) & 1;
+    page_start = ctx->base.pc_first & TARGET_PAGE_MASK;
+    ctx->saved_pc = -1;
+    ctx->insn_flags = env->insn_flags;
+    ctx->CP0_Config1 = env->CP0_Config1;
+    ctx->btarget = 0;
+    ctx->kscrexist = (env->CP0_Config4 >> CP0C4_KScrExist) & 0xff;
+    ctx->rxi = (env->CP0_Config3 >> CP0C3_RXI) & 1;
+    ctx->ie = (env->CP0_Config4 >> CP0C4_IE) & 3;
+    ctx->bi = (env->CP0_Config3 >> CP0C3_BI) & 1;
+    ctx->bp = (env->CP0_Config3 >> CP0C3_BP) & 1;
+    ctx->PAMask = env->PAMask;
+    ctx->mvh = (env->CP0_Config5 >> CP0C5_MVH) & 1;
+    ctx->eva = (env->CP0_Config5 >> CP0C5_EVA) & 1;
+    ctx->sc = (env->CP0_Config3 >> CP0C3_SC) & 1;
+    ctx->CP0_LLAddr_shift = env->CP0_LLAddr_shift;
+    ctx->cmgcr = (env->CP0_Config3 >> CP0C3_CMGCR) & 1;
     /* Restore delay slot state from the tb context.  */
-    ctx.hflags = (uint32_t)ctx.base.tb->flags; /* FIXME: maybe use 64 bits? */
-    ctx.ulri = (env->CP0_Config3 >> CP0C3_ULRI) & 1;
-    ctx.ps = ((env->active_fpu.fcr0 >> FCR0_PS) & 1) ||
+    ctx->hflags = (uint32_t)ctx->base.tb->flags; /* FIXME: maybe use 64 bits? */
+    ctx->ulri = (env->CP0_Config3 >> CP0C3_ULRI) & 1;
+    ctx->ps = ((env->active_fpu.fcr0 >> FCR0_PS) & 1) ||
              (env->insn_flags & (INSN_LOONGSON2E | INSN_LOONGSON2F));
-    ctx.vp = (env->CP0_Config5 >> CP0C5_VP) & 1;
-    ctx.mrp = (env->CP0_Config5 >> CP0C5_MRP) & 1;
-    ctx.nan2008 = (env->active_fpu.fcr31 >> FCR31_NAN2008) & 1;
-    ctx.abs2008 = (env->active_fpu.fcr31 >> FCR31_ABS2008) & 1;
-    restore_cpu_state(env, &ctx);
+    ctx->vp = (env->CP0_Config5 >> CP0C5_VP) & 1;
+    ctx->mrp = (env->CP0_Config5 >> CP0C5_MRP) & 1;
+    ctx->nan2008 = (env->active_fpu.fcr31 >> FCR31_NAN2008) & 1;
+    ctx->abs2008 = (env->active_fpu.fcr31 >> FCR31_ABS2008) & 1;
+    restore_cpu_state(env, ctx);
 #ifdef CONFIG_USER_ONLY
-        ctx.mem_idx = MIPS_HFLAG_UM;
+        ctx->mem_idx = MIPS_HFLAG_UM;
 #else
-        ctx.mem_idx = hflags_mmu_index(ctx.hflags);
+        ctx->mem_idx = hflags_mmu_index(ctx->hflags);
 #endif
-    ctx.default_tcg_memop_mask = (ctx.insn_flags & ISA_MIPS32R6) ?
-                                 MO_UNALN : MO_ALIGN;
+    ctx->default_tcg_memop_mask = (ctx->insn_flags & ISA_MIPS32R6) ?
+                                  MO_UNALN : MO_ALIGN;
     max_insns = tb_cflags(tb) & CF_COUNT_MASK;
     if (max_insns == 0) {
         max_insns = CF_COUNT_MASK;
@@ -20251,74 +20252,74 @@ void gen_intermediate_code(CPUState *cs, struct TranslationBlock *tb)
         max_insns = TCG_MAX_INSNS;
     }
 
-    LOG_DISAS("\ntb %p idx %d hflags %04x\n", tb, ctx.mem_idx, ctx.hflags);
+    LOG_DISAS("\ntb %p idx %d hflags %04x\n", tb, ctx->mem_idx, ctx->hflags);
     gen_tb_start(tb);
-    while (ctx.base.is_jmp == DISAS_NEXT) {
-        tcg_gen_insn_start(ctx.base.pc_next, ctx.hflags & MIPS_HFLAG_BMASK,
-                           ctx.btarget);
-        ctx.base.num_insns++;
+    while (ctx->base.is_jmp == DISAS_NEXT) {
+        tcg_gen_insn_start(ctx->base.pc_next, ctx->hflags & MIPS_HFLAG_BMASK,
+                           ctx->btarget);
+        ctx->base.num_insns++;
 
-        if (unlikely(cpu_breakpoint_test(cs, ctx.base.pc_next, BP_ANY))) {
-            save_cpu_state(&ctx, 1);
-            ctx.base.is_jmp = DISAS_NORETURN;
+        if (unlikely(cpu_breakpoint_test(cs, ctx->base.pc_next, BP_ANY))) {
+            save_cpu_state(ctx, 1);
+            ctx->base.is_jmp = DISAS_NORETURN;
             gen_helper_raise_exception_debug(cpu_env);
             /* The address covered by the breakpoint must be included in
                [tb->pc, tb->pc + tb->size) in order to for it to be
                properly cleared -- thus we increment the PC here so that
                the logic setting tb->size below does the right thing.  */
-            ctx.base.pc_next += 4;
+            ctx->base.pc_next += 4;
             goto done_generating;
         }
 
-        if (ctx.base.num_insns == max_insns && (tb_cflags(tb) & CF_LAST_IO)) {
+        if (ctx->base.num_insns == max_insns && (tb_cflags(tb) & CF_LAST_IO)) {
             gen_io_start();
         }
 
-        is_slot = ctx.hflags & MIPS_HFLAG_BMASK;
-        if (!(ctx.hflags & MIPS_HFLAG_M16)) {
-            ctx.opcode = cpu_ldl_code(env, ctx.base.pc_next);
+        is_slot = ctx->hflags & MIPS_HFLAG_BMASK;
+        if (!(ctx->hflags & MIPS_HFLAG_M16)) {
+            ctx->opcode = cpu_ldl_code(env, ctx->base.pc_next);
             insn_bytes = 4;
-            decode_opc(env, &ctx);
-        } else if (ctx.insn_flags & ASE_MICROMIPS) {
-            ctx.opcode = cpu_lduw_code(env, ctx.base.pc_next);
-            insn_bytes = decode_micromips_opc(env, &ctx);
-        } else if (ctx.insn_flags & ASE_MIPS16) {
-            ctx.opcode = cpu_lduw_code(env, ctx.base.pc_next);
-            insn_bytes = decode_mips16_opc(env, &ctx);
+            decode_opc(env, ctx);
+        } else if (ctx->insn_flags & ASE_MICROMIPS) {
+            ctx->opcode = cpu_lduw_code(env, ctx->base.pc_next);
+            insn_bytes = decode_micromips_opc(env, ctx);
+        } else if (ctx->insn_flags & ASE_MIPS16) {
+            ctx->opcode = cpu_lduw_code(env, ctx->base.pc_next);
+            insn_bytes = decode_mips16_opc(env, ctx);
         } else {
-            generate_exception_end(&ctx, EXCP_RI);
+            generate_exception_end(ctx, EXCP_RI);
             break;
         }
 
-        if (ctx.hflags & MIPS_HFLAG_BMASK) {
-            if (!(ctx.hflags & (MIPS_HFLAG_BDS16 | MIPS_HFLAG_BDS32 |
+        if (ctx->hflags & MIPS_HFLAG_BMASK) {
+            if (!(ctx->hflags & (MIPS_HFLAG_BDS16 | MIPS_HFLAG_BDS32 |
                                 MIPS_HFLAG_FBNSLOT))) {
                 /* force to generate branch as there is neither delay nor
                    forbidden slot */
                 is_slot = 1;
             }
-            if ((ctx.hflags & MIPS_HFLAG_M16) &&
-                (ctx.hflags & MIPS_HFLAG_FBNSLOT)) {
+            if ((ctx->hflags & MIPS_HFLAG_M16) &&
+                (ctx->hflags & MIPS_HFLAG_FBNSLOT)) {
                 /* Force to generate branch as microMIPS R6 doesn't restrict
                    branches in the forbidden slot. */
                 is_slot = 1;
             }
         }
         if (is_slot) {
-            gen_branch(&ctx, insn_bytes);
+            gen_branch(ctx, insn_bytes);
         }
-        ctx.base.pc_next += insn_bytes;
+        ctx->base.pc_next += insn_bytes;
 
         /* Execute a branch and its delay slot as a single instruction.
            This is what GDB expects and is consistent with what the
            hardware does (e.g. if a delay slot instruction faults, the
            reported PC is the PC of the branch).  */
-        if (ctx.base.singlestep_enabled &&
-            (ctx.hflags & MIPS_HFLAG_BMASK) == 0) {
+        if (ctx->base.singlestep_enabled &&
+            (ctx->hflags & MIPS_HFLAG_BMASK) == 0) {
             break;
         }
 
-        if (ctx.base.pc_next - page_start >= TARGET_PAGE_SIZE) {
+        if (ctx->base.pc_next - page_start >= TARGET_PAGE_SIZE) {
             break;
         }
 
@@ -20326,7 +20327,7 @@ void gen_intermediate_code(CPUState *cs, struct TranslationBlock *tb)
             break;
         }
 
-        if (ctx.base.num_insns >= max_insns) {
+        if (ctx->base.num_insns >= max_insns) {
             break;
         }
 
@@ -20336,18 +20337,18 @@ void gen_intermediate_code(CPUState *cs, struct TranslationBlock *tb)
     if (tb_cflags(tb) & CF_LAST_IO) {
         gen_io_end();
     }
-    if (ctx.base.singlestep_enabled && ctx.base.is_jmp != DISAS_NORETURN) {
-        save_cpu_state(&ctx, ctx.base.is_jmp != DISAS_EXIT);
+    if (ctx->base.singlestep_enabled && ctx->base.is_jmp != DISAS_NORETURN) {
+        save_cpu_state(ctx, ctx->base.is_jmp != DISAS_EXIT);
         gen_helper_raise_exception_debug(cpu_env);
     } else {
-        switch (ctx.base.is_jmp) {
+        switch (ctx->base.is_jmp) {
         case DISAS_STOP:
-            gen_save_pc(ctx.base.pc_next);
+            gen_save_pc(ctx->base.pc_next);
             tcg_gen_lookup_and_goto_ptr();
             break;
         case DISAS_NEXT:
-            save_cpu_state(&ctx, 0);
-            gen_goto_tb(&ctx, 0, ctx.base.pc_next);
+            save_cpu_state(ctx, 0);
+            gen_goto_tb(ctx, 0, ctx->base.pc_next);
             break;
         case DISAS_EXIT:
             tcg_gen_exit_tb(0);
@@ -20358,19 +20359,19 @@ void gen_intermediate_code(CPUState *cs, struct TranslationBlock *tb)
         }
     }
 done_generating:
-    gen_tb_end(tb, ctx.base.num_insns);
+    gen_tb_end(tb, ctx->base.num_insns);
 
-    tb->size = ctx.base.pc_next - ctx.base.pc_first;
-    tb->icount = ctx.base.num_insns;
+    tb->size = ctx->base.pc_next - ctx->base.pc_first;
+    tb->icount = ctx->base.num_insns;
 
 #ifdef DEBUG_DISAS
     LOG_DISAS("\n");
     if (qemu_loglevel_mask(CPU_LOG_TB_IN_ASM)
-        && qemu_log_in_addr_range(ctx.base.pc_first)) {
+        && qemu_log_in_addr_range(ctx->base.pc_first)) {
         qemu_log_lock();
-        qemu_log("IN: %s\n", lookup_symbol(ctx.base.pc_first));
-        log_target_disas(cs, ctx.base.pc_first,
-                         ctx.base.pc_next - ctx.base.pc_first);
+        qemu_log("IN: %s\n", lookup_symbol(ctx->base.pc_first));
+        log_target_disas(cs, ctx->base.pc_first,
+                         ctx->base.pc_next - ctx->base.pc_first);
         qemu_log("\n");
         qemu_log_unlock();
     }
-- 
2.17.0

