Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DF9DCA5FC4
	for <qemu-arm@archiver.kernel.org>; Fri,  2 Oct 2026 17:58:17 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xChSw-0006Ym-S4; Fri, 02 Oct 2026 13:54:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xChQx-0004j1-Al
 for qemu-arm@nongnu.org; Fri, 02 Oct 2026 13:52:38 -0400
Received: from mail-dl2-x0e.google.com ([2607:f8b0:4864:38::e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xChQf-0007Vf-NU
 for qemu-arm@nongnu.org; Fri, 02 Oct 2026 13:52:34 -0400
Received: by mail-dl2-x0e.google.com with SMTP id
 a92af1059eb24-144f47a9b57so7684049c88.2
 for <qemu-arm@nongnu.org>; Fri, 02 Oct 2026 10:52:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790963535; x=1791568335; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=J4ON10Qox2S9bqxuHcRxJiCXGipKK4DEZaxEJyKX9vM=;
 b=W/cGtvfZWo5XyIlQB+v6C6yg+JY6gTYXR8nFJm2y6JTQMkjl4j7gn46g2k9SI1Y8Su
 JA/c2HUErYizSjNeBP84IEJGA5w+SNp7vEOxIL6FiG0ggc+t/tkQ85UUS+6PuOHa89t6
 AX+9IytSJgB+yRDxQDOLOyVKKzVSvAApfdQVx+pK3h2wq7USa9xnbMMho1HEGqpslzpM
 0cuMP3mCcsyH9dXJu/jN9As7A00Nn8+EcL/dfJ1No9PBq1qxt7Boy22Xlj17nXI9J64y
 7+QHOi3XjtyFmdqUVbXA7ilxkJsLgnmkgRFXXBQz0iFlIzpbsmumTdNuH5IeBHmGUszi
 00ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790963535; x=1791568335;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=J4ON10Qox2S9bqxuHcRxJiCXGipKK4DEZaxEJyKX9vM=;
 b=Vk22ND0yRQTFFP2KuD7FXb4oGhRBB/Ef5U1v10Aw8HKKMZkTSK8kHmdN8+sj7qW47X
 UTuQVvqTFrTy7oSxTAfbXqmHQdzzAS65ter/HTXgfYVTh5htGDxQAevitO4sIlnscZOF
 RSurGX8NOpZ2fobtYngEhM7p22L9a7WYbk3cMFtOUw6/K+FMZkuFZJ981mjoDGSvkzrW
 tcUmvCNwqqZ/+olxChMPtOSIUtVBL2MgRJCMdL3z1Z/CB/x8f4H2etKv632NhWI1OCL1
 wFZnJVYnfkBkNGihuGSG/bgocEPnEsBURXx+Iody8cLA3Mrx4xS7s6HzX9zama81pNg1
 XCbw==
X-Forwarded-Encrypted: i=1;
 AKwUvByVVUS4hWLpCyt9UVbLJ5zffsaB2tuQEBDJKmDPIn05oD3H9rMmElEvUGQ6drqbFH8o3tzaGki28w==@nongnu.org
X-Gm-Message-State: AFuF++mnbubbk01MEpZX5mcMDDtfTt/Yel6etmMVnORNzzmFDThiI5Og
 cAfK5mtamNL+MDEKfRkyJTOPBrBS6nkLAdt9IvGMjJ225YA2/1pufxRA
X-Gm-Gg: AYBFou3fmMLfJRsLpgXd6PxPXW8p3yemgk+Ca/C6wefo/twu5mjJgMtKRzUcLND7MPF
 Q/HitG2bPqMRp6O0oSq//cRd2uCj3jgz4tIPQGj3QQFUyv65wGMDm7rHzLGeEjtuoYdOjxfjapQ
 7cbTI5SHDVmuInOKsVp0aGuAXMsdPR0HhflYN67FZTrVfA55be7Otdj5ubToCY/BVxHD509Kb0w
 6kEbByQa5d0F/eKrIG5s5d1BjbfVlqiQIwErPKbeJy2rO3FLDlv1xVZMzpVP9+hKvdmsNccUm8H
 OnVVCtDTr9h/dhyJVCMVbWA1s4bokNufaxc31s8O+kxdTHC3FvOEtEyTCWcX3I9W+ZiBReLf0MA
 uwBI8L8PKhESBTp5Xhee+Ug2bXWjObWPvbKugxXpcbQGJn4VmAmRvXcI1bdFnwDgxfle2JczrAR
 HwdHyuTBvE6m1aSw/0P2V6IH1lqcHIt7l5DIzqPGYQrAeQ9fDrTx3Xd9jgm4Ef/HXd5EbnWhH2r
 +3u5vtlUL0AJsMpKk/9uWPn+nYCN2E=
X-Received: by 2002:a05:693c:8087:b0:351:dbc:b663 with SMTP id
 5a478bee46e88-3510dbcccfbmr1062876eec.31.1790963535278; 
 Fri, 02 Oct 2026 10:52:15 -0700 (PDT)
Received: from WIN-BH9M8FJACR9 ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id
 5a478bee46e88-34f14f9f2afsm18027361eec.18.2026.10.02.10.52.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Oct 2026 10:52:14 -0700 (PDT)
From: Yonggang Luo <luoyonggang@gmail.com>
To: qemu-devel@nongnu.org
Cc: Max Filippov <jcmvbkbc@gmail.com>, Stafford Horne <shorne@gmail.com>,
 Brian Cain <brian.cain@oss.qualcomm.com>,
 Eric Farman <farman@linux.ibm.com>, Song Gao <17746591750@163.com>,
 qemu-riscv@nongnu.org,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Aleksandar Rikalo <arikalo@gmail.com>, qemu-s390x@nongnu.org,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Philippe Mathieu-Daude <philmd@mailo.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Michael Rolnik <mrolnik@gmail.com>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Nicholas Piggin <npiggin@gmail.com>, Cornelia Huck <cohuck@redhat.com>,
 Helge Deller <deller@gmx.de>, Chinmay Rath <rathc@linux.ibm.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 qemu-ppc@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Chao Liu <chao.liu@processmission.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@kernel.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Weiwei Li <liwei1518@gmail.com>, Yoshinori Sato <yoshinori.sato@nifty.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>,
 Laurent Vivier <laurent@vivier.eu>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Glenn Miles <milesg@linux.ibm.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH v3 11/27] target/sh4: convert raises to raise_excp
Date: Sat,  3 Oct 2026 01:50:19 +0800
Message-ID: <20261002175037.1747-12-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.52.0.windows.1
In-Reply-To: <20261002175037.1747-1-luoyonggang@gmail.com>
References: <20261002175037.1747-1-luoyonggang@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:38::e;
 envelope-from=luoyonggang@gmail.com; helo=mail-dl2-x0e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Translate illegal and FPU-disable exceptions through raise_excp and
route the remaining C exception paths through cpu_raise_excp helpers.
Remove the redundant SH4 exception helpers.

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
---
 target/sh4/helper.h    |  4 ----
 target/sh4/op_helper.c | 36 +++---------------------------------
 target/sh4/translate.c | 12 ++++++++----
 3 files changed, 11 insertions(+), 41 deletions(-)

diff --git a/target/sh4/helper.h b/target/sh4/helper.h
index 29011d3dbbb..593b20c0af2 100644
--- a/target/sh4/helper.h
+++ b/target/sh4/helper.h
@@ -1,8 +1,4 @@
 DEF_HELPER_1(ldtlb, void, env)
-DEF_HELPER_1(raise_illegal_instruction, noreturn, env)
-DEF_HELPER_1(raise_slot_illegal_instruction, noreturn, env)
-DEF_HELPER_1(raise_fpu_disable, noreturn, env)
-DEF_HELPER_1(raise_slot_fpu_disable, noreturn, env)
 DEF_HELPER_1(sleep, noreturn, env)
 DEF_HELPER_2(trapa, noreturn, env, i32)
 DEF_HELPER_1(exclusive, noreturn, env)
diff --git a/target/sh4/op_helper.c b/target/sh4/op_helper.c
index 8beac9ca034..f38d247c1a2 100644
--- a/target/sh4/op_helper.c
+++ b/target/sh4/op_helper.c
@@ -55,49 +55,19 @@ void helper_ldtlb(CPUSH4State *env)
 #endif
 }
 
-static inline G_NORETURN
-void raise_exception(CPUSH4State *env, int index,
-                     uintptr_t retaddr)
-{
-    CPUState *cs = env_cpu(env);
-
-    cs->exception_index = index;
-    cpu_loop_exit_restore(cs, retaddr);
-}
-
-void helper_raise_illegal_instruction(CPUSH4State *env)
-{
-    raise_exception(env, SH4_EXCP_ILLEGAL_INSTRUCTION, 0);
-}
-
-void helper_raise_slot_illegal_instruction(CPUSH4State *env)
-{
-    raise_exception(env, SH4_EXCP_SLOT_ILLEGAL_INSTRUCTION, 0);
-}
-
-void helper_raise_fpu_disable(CPUSH4State *env)
-{
-    raise_exception(env, SH4_EXCP_FPU_DISABLE, 0);
-}
-
-void helper_raise_slot_fpu_disable(CPUSH4State *env)
-{
-    raise_exception(env, SH4_EXCP_SLOT_FPU_DISABLE, 0);
-}
-
 void helper_sleep(CPUSH4State *env)
 {
     CPUState *cs = env_cpu(env);
 
     cs->halted = 1;
     env->in_sleep = 1;
-    raise_exception(env, EXCP_HLT, 0);
+    cpu_raise_excp(cs, EXCP_HLT);
 }
 
 void helper_trapa(CPUSH4State *env, uint32_t tra)
 {
     env->tra = tra << 2;
-    raise_exception(env, SH4_EXCP_TRAPA, 0);
+    cpu_raise_excp(env_cpu(env), SH4_EXCP_TRAPA);
 }
 
 void helper_exclusive(CPUSH4State *env)
@@ -255,7 +225,7 @@ static void update_fpscr(CPUSH4State *env, uintptr_t retaddr)
         cause = (env->fpscr & FPSCR_CAUSE_MASK) >> FPSCR_CAUSE_SHIFT;
         enable = (env->fpscr & FPSCR_ENABLE_MASK) >> FPSCR_ENABLE_SHIFT;
         if (cause & enable) {
-            raise_exception(env, SH4_EXCP_FPU, retaddr);
+            cpu_raise_excp_restore(env_cpu(env), SH4_EXCP_FPU, retaddr);
         }
     }
 }
diff --git a/target/sh4/translate.c b/target/sh4/translate.c
index 5729a757f19..590b62ba3c1 100644
--- a/target/sh4/translate.c
+++ b/target/sh4/translate.c
@@ -1756,10 +1756,13 @@ static void _decode_opc(DisasContext * ctx)
     if (ctx->envflags & TB_FLAG_DELAY_SLOT_MASK) {
  do_illegal_slot:
         gen_save_cpu_state(ctx, true);
-        gen_helper_raise_slot_illegal_instruction(tcg_env);
+        gen_helper_raise_excp(tcg_env,
+                              tcg_constant_i32(
+                                  SH4_EXCP_SLOT_ILLEGAL_INSTRUCTION));
     } else {
         gen_save_cpu_state(ctx, true);
-        gen_helper_raise_illegal_instruction(tcg_env);
+        gen_helper_raise_excp(tcg_env,
+                              tcg_constant_i32(SH4_EXCP_ILLEGAL_INSTRUCTION));
     }
     ctx->base.is_jmp = DISAS_NORETURN;
     return;
@@ -1767,9 +1770,10 @@ static void _decode_opc(DisasContext * ctx)
  do_fpu_disabled:
     gen_save_cpu_state(ctx, true);
     if (ctx->envflags & TB_FLAG_DELAY_SLOT_MASK) {
-        gen_helper_raise_slot_fpu_disable(tcg_env);
+        gen_helper_raise_excp(tcg_env,
+                              tcg_constant_i32(SH4_EXCP_SLOT_FPU_DISABLE));
     } else {
-        gen_helper_raise_fpu_disable(tcg_env);
+        gen_helper_raise_excp(tcg_env, tcg_constant_i32(SH4_EXCP_FPU_DISABLE));
     }
     ctx->base.is_jmp = DISAS_NORETURN;
 }
-- 
2.52.0.windows.1


