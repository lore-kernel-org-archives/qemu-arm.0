Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44479CA5FA1
	for <qemu-arm@archiver.kernel.org>; Mon, 28 Sep 2026 05:29:18 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xB3tu-0002hz-89; Mon, 28 Sep 2026 01:27:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xB3qJ-00073j-2X
 for qemu-arm@nongnu.org; Mon, 28 Sep 2026 01:23:59 -0400
Received: from mail-dy1-x1331.google.com ([2607:f8b0:4864:20::1331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xB3qF-0008B7-NU
 for qemu-arm@nongnu.org; Mon, 28 Sep 2026 01:23:58 -0400
Received: by mail-dy1-x1331.google.com with SMTP id
 5a478bee46e88-3425f2b24a4so1078428eec.0
 for <qemu-arm@nongnu.org>; Sun, 27 Sep 2026 22:23:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790573034; x=1791177834; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=VkcIaWxBcQKymbi824ssKTFPRZk7v2JgsUS3RTcybjU=;
 b=hr/ZccUkV3Sk6pGPRXY9F8SlbSPNCr7p3sUQGo1lZ8QqDXDGjgHzvSegOfuScSwDWz
 b9PA+/SDrdh+vzn6+LShTlAtBIlfb1dU2Kapkkw/WSQZsuQe5yUcX6UnnyNrl8evqy/t
 Sfd9TMTfEDmfbrzCl087q9nv2OXHQFOAxqFt/zkUCdw86ICE2r/yaXeu9PzG9IdmOHbf
 mallYYWT5UnseV6Rzhh6rVjOEphQvEBKQhjWw5H0JpTjZHe1aRzli5MMmjueiobL1r/e
 b8BJGDpg3Ozr4zmXq4GCMYMYfUDd+DkArdknrniKuFb9Wojwz0D1nKjd5qEJWQvTy2Ta
 84+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790573034; x=1791177834;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=VkcIaWxBcQKymbi824ssKTFPRZk7v2JgsUS3RTcybjU=;
 b=RxTLp/5d7ZidlaQnskhD/YT9MR9EI7jX2kLOSoHBzMOLfJdSkQEt/OgVkypIMyLTmB
 Lyu2ztcFob1mNwxhv6ZoqEYIOY7nCLNfjwVjX/+JOyP6aailCa0ohVQHe3nSsyD2dczG
 wBQjQu/rTBPumsWTaNjoi8J6AXOQ9c6szi+B0C0sh7cBvYohSfVI57f5YBpb3KXvqK2B
 ND1hg02VC5VoSF+zlgrosddxxUBAr9NznNH1dxVCyjf9SEiPX+CWDeeugfAwUlGF7GtE
 F0MukiWLzCfkk48hHm6dTUQV3eyHVUqdwyWn1dxDlPBG1LfmxEoal02uB2yhsHZjVFsZ
 VJQw==
X-Forwarded-Encrypted: i=1;
 AKwUvBz40ayspFL+g5L956iAcXcgMU/Fa2bLhmU1rDKdmqX8DDqWNVosxTo0my1kXHCRZ96bXMZkahAyGQ==@nongnu.org
X-Gm-Message-State: AFuF++l4R7YSrf7qWWNJaSg3PKNYiLXA/WSCD5XIr6jDt/XTwU/RHOfu
 q1ChP+6hEm01ew/ALXWsp1lzBCbIzAzohjOaHThKQEohpLyo/nMLnTlJ
X-Gm-Gg: AYBFou3t3c9nhch69ZHq+gjHBijD0VR7D3c9hQ/bfOKUWe9Cqz6fX3ePSzpNR2CK31y
 eJXJOS2AzaXQF6SR5FczaeEQz+rUgzPpFpqunAtVk+4VVQtN/uB/JmGdD6qJo1/1W80LLB750u3
 7kVDovvnfoO59q3wXL5Lxq5mRdTsh7c8auE3xSyctg+RetzPIZT5hHcLERSJrXhJEIWgcgJyBAU
 tNuNrWOhVi56yJ2iUUJqqwVlCJDCgFJ+hIXvZS6JWGuriUm2AWNWP8YJLdyaVY3zoIGTPhF3gvP
 WmJWuG2JpBWkpPCc5na3/bxPHtx851V860NWph4rl6MiRjrZJa5KSveZOGVv7llgVp4uYjwqsVI
 6vBjbCHFtnry5L2fc/nOonZl9AyRFEGKIZAkYXbP5vGcHpYpH7rURJ9yNgChmn9psIsq/zCM/2b
 OkVXQ6wUaACLaZXBcJzfbVPKOqQ4wYLT7VFAuH7IEA9k98i/oudB/j/7eFrZBp/kzlVcXx5Iw5J
 T2CudLCTKqP356iAbPmEAnnpznD5O/sZOl+Ek98ow==
X-Received: by 2002:a05:7022:fa9:b0:13c:e1e2:fc86 with SMTP id
 a92af1059eb24-146ce49209fmr12203557c88.4.1790573033781; 
 Sun, 27 Sep 2026 22:23:53 -0700 (PDT)
Received: from WIN-BH9M8FJACR9 ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id
 a92af1059eb24-146bb6551d9sm14726248c88.9.2026.09.27.22.23.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Sep 2026 22:23:53 -0700 (PDT)
From: Yonggang Luo <luoyonggang@gmail.com>
To: qemu-devel@nongnu.org
Cc: Helge Deller <deller@gmx.de>, Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Weiwei Li <liwei1518@gmail.com>, Brian Cain <brian.cain@oss.qualcomm.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Chao Liu <chao.liu@processmission.com>,
 Aleksandar Rikalo <arikalo@gmail.com>,
 Philippe Mathieu-Daude <philmd@mailo.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Stafford Horne <shorne@gmail.com>, Chinmay Rath <rathc@linux.ibm.com>,
 Nicholas Piggin <npiggin@gmail.com>,
 Yoshinori Sato <yoshinori.sato@nifty.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Laurent Vivier <laurent@vivier.eu>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Eric Farman <farman@linux.ibm.com>, qemu-riscv@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@kernel.org>, Glenn Miles <milesg@linux.ibm.com>,
 Cornelia Huck <cohuck@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Song Gao <17746591750@163.com>, qemu-ppc@nongnu.org, qemu-arm@nongnu.org,
 Michael Rolnik <mrolnik@gmail.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-s390x@nongnu.org
Subject: [PATCH v2 22/24] target/mips: convert raise_exception to raise_excp
Date: Mon, 28 Sep 2026 13:20:48 +0800
Message-ID: <20260928052051.251-23-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.52.0.windows.1
In-Reply-To: <20260928052051.251-1-luoyonggang@gmail.com>
References: <20260928052051.251-1-luoyonggang@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1331;
 envelope-from=luoyonggang@gmail.com; helo=mail-dy1-x1331.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Store error_code, then call raise_excp for the err path and
raise_excp_restore for the 2-arg path. Drop TCG raise_exception,
raise_exception_err, and the unused debug DEF. Keep C
do_raise_exception_err via cpu_loop_exit_excp.

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
---
 target/mips/helper.h         |  4 ----
 target/mips/tcg/exception.c  | 20 +-------------------
 target/mips/tcg/fpu_helper.c |  6 +++---
 target/mips/tcg/translate.c  |  9 ++++++---
 4 files changed, 10 insertions(+), 29 deletions(-)

diff --git a/target/mips/helper.h b/target/mips/helper.h
index 779b87101db..83a6dd0b3c4 100644
--- a/target/mips/helper.h
+++ b/target/mips/helper.h
@@ -1,7 +1,3 @@
-DEF_HELPER_3(raise_exception_err, noreturn, env, i32, int)
-DEF_HELPER_2(raise_exception, noreturn, env, i32)
-DEF_HELPER_1(raise_exception_debug, noreturn, env)
-
 #ifdef TARGET_MIPS64
 DEF_HELPER_4(sdl, void, env, tl, tl, int)
 DEF_HELPER_4(sdr, void, env, tl, tl, int)
diff --git a/target/mips/tcg/exception.c b/target/mips/tcg/exception.c
index 630b8b809fa..851b74e4fde 100644
--- a/target/mips/tcg/exception.c
+++ b/target/mips/tcg/exception.c
@@ -44,22 +44,6 @@ target_ulong exception_resume_pc(CPUMIPSState *env)
     return bad_pc;
 }
 
-void helper_raise_exception_err(CPUMIPSState *env, uint32_t exception,
-                                int error_code)
-{
-    do_raise_exception_err(env, exception, error_code, 0);
-}
-
-void helper_raise_exception(CPUMIPSState *env, uint32_t exception)
-{
-    do_raise_exception(env, exception, GETPC());
-}
-
-void helper_raise_exception_debug(CPUMIPSState *env)
-{
-    do_raise_exception(env, EXCP_DEBUG, 0);
-}
-
 static void raise_exception(CPUMIPSState *env, uint32_t exception)
 {
     do_raise_exception(env, exception, 0);
@@ -145,8 +129,6 @@ void do_raise_exception_err(CPUMIPSState *env, uint32_t exception,
     qemu_log_mask(CPU_LOG_INT, "%s: %d (%s) %d\n",
                   __func__, exception, mips_exception_name(exception),
                   error_code);
-    cs->exception_index = exception;
     env->error_code = error_code;
-
-    cpu_loop_exit_restore(cs, pc);
+    cpu_loop_exit_excp(cs, exception, pc);
 }
diff --git a/target/mips/tcg/fpu_helper.c b/target/mips/tcg/fpu_helper.c
index 36af9808025..ce68cda1e43 100644
--- a/target/mips/tcg/fpu_helper.c
+++ b/target/mips/tcg/fpu_helper.c
@@ -61,7 +61,7 @@ target_ulong helper_cfc1(CPUMIPSState *env, uint32_t reg)
             if (env->CP0_Config5 & (1 << CP0C5_UFE)) {
                 arg1 = (env->CP0_Config5 >> CP0C5_FRE) & 1;
             } else {
-                helper_raise_exception(env, EXCP_RI);
+                do_raise_exception(env, EXCP_RI, GETPC());
             }
         }
         break;
@@ -120,7 +120,7 @@ void helper_ctc1(CPUMIPSState *env, target_ulong arg1, uint32_t fs, uint32_t rt)
             env->CP0_Config5 &= ~(1 << CP0C5_FRE);
             compute_hflags(env);
         } else {
-            helper_raise_exception(env, EXCP_RI);
+            do_raise_exception(env, EXCP_RI, GETPC());
         }
         break;
     case 6:
@@ -132,7 +132,7 @@ void helper_ctc1(CPUMIPSState *env, target_ulong arg1, uint32_t fs, uint32_t rt)
             env->CP0_Config5 |= (1 << CP0C5_FRE);
             compute_hflags(env);
         } else {
-            helper_raise_exception(env, EXCP_RI);
+            do_raise_exception(env, EXCP_RI, GETPC());
         }
         break;
     case 25:
diff --git a/target/mips/tcg/translate.c b/target/mips/tcg/translate.c
index e3467d15251..b1b09816504 100644
--- a/target/mips/tcg/translate.c
+++ b/target/mips/tcg/translate.c
@@ -1316,14 +1316,17 @@ static inline void restore_cpu_state(CPUMIPSState *env, DisasContext *ctx)
 void generate_exception_err(DisasContext *ctx, int excp, int err)
 {
     save_cpu_state(ctx, 1);
-    gen_helper_raise_exception_err(tcg_env, tcg_constant_i32(excp),
-                                   tcg_constant_i32(err));
+    tcg_gen_st_i32(tcg_constant_i32(err), tcg_env,
+                   offsetof(CPUMIPSState, error_code));
+    gen_helper_raise_excp(tcg_env, tcg_constant_i32(excp));
     ctx->base.is_jmp = DISAS_NORETURN;
 }
 
 void generate_exception(DisasContext *ctx, int excp)
 {
-    gen_helper_raise_exception(tcg_env, tcg_constant_i32(excp));
+    tcg_gen_st_i32(tcg_constant_i32(0), tcg_env,
+                   offsetof(CPUMIPSState, error_code));
+    gen_helper_raise_excp_restore(tcg_env, tcg_constant_i32(excp));
 }
 
 void generate_exception_end(DisasContext *ctx, int excp)
-- 
2.52.0.windows.1


