Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2D7FCA5FDD
	for <qemu-arm@archiver.kernel.org>; Fri,  2 Oct 2026 18:00:40 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xChX6-0005La-QP; Fri, 02 Oct 2026 13:58:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xChRn-0005bE-JH
 for qemu-arm@nongnu.org; Fri, 02 Oct 2026 13:53:32 -0400
Received: from mail-dy1-x1336.google.com ([2607:f8b0:4864:20::1336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xChRl-0007la-OE
 for qemu-arm@nongnu.org; Fri, 02 Oct 2026 13:53:27 -0400
Received: by mail-dy1-x1336.google.com with SMTP id
 5a478bee46e88-34ca2d54925so150484eec.0
 for <qemu-arm@nongnu.org>; Fri, 02 Oct 2026 10:53:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790963603; x=1791568403; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=kqRcLzXufnn7eCg13Qui6eyAhOfVu52+aZltWVm5ghQ=;
 b=tGAjrD1H8YYbaVHq8pO31aWBtqiF/3gTm4JdgggeiiYIFRCibnT3+IGlfBpKeh1bws
 nsi1x6q98v4gCetx7D3bzFzJ1b6LaTnENHDbGcRe0AajXLe3tI1LnIQIRGWyimDdVi9d
 PIGp00Drn1aNHbU+ywnrP3D5mgwbLT0mK1041vThV6SKIjK8izquDfwGlgITvrK2zUyw
 IgOFhu8xhOe1GYKzKZ4wkv7sJ7v8HwMH+JXvNxrYvpINq47fcEIP6aryFTSNgAzbgzPC
 SWGDB2diSTvI8iljBZKlwYKsbSeyUZwdO7UkZ0Ea9gyeLZzRQrk4ci1/M5XwDJugmSJW
 IQrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790963603; x=1791568403;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=kqRcLzXufnn7eCg13Qui6eyAhOfVu52+aZltWVm5ghQ=;
 b=W9SBlGfi+ZrfOxRQujWN0ouvC7rRMFu7SBs5Nnta5gsMx4DK+FjKIH6iGIGq4j9+UG
 r3tJKPdLydd1doZWNVzqg7o93lkvTQYlZzSioaTfL8QcniuQAH+fuvAkGPQULUUEAxDo
 u7khpf0SnNZtmmEZO494DlCejjaatd9OxGoX00uKGDXXklwx86BCfYQFEjBtRLBGGTMz
 UZnnMEJ+Rr09IahUfF84Hu7xhHsoAJMNoexyAeCooTyZ+qhGTP4WPyoO4ptiKPux+wHh
 U1p2qiBBx84r6pWdGkj6OifyG3ZBIcMGDQYFYRIGyDi1vJNlNNh7sqGCnvyTJocwxoU2
 lKhQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBwDbkGNy5/8/C9xFLY+W7YW4cjk1bA3N75LYlCA9qNKLDtMwIuCVQa/kmZKIV/D3a0dDJ8CKXHlKg==@nongnu.org
X-Gm-Message-State: AFuF++nOX54SY2dwDsBksALJT6K8HvrrmnqBBTOjjfLz7vd3cqWxf2Yk
 4owMkLPMWVSr7OxfpPm1Ff5Fo1fIaoDJSCDgctRl6XVjCslXmS+EyUiF
X-Gm-Gg: AYBFou2uNbdAsUPRVug3F5tMcy7XgU2OpPUXO6ynOIh23tGEgX1ahjUeD4EmEzdlaIt
 QzQQchvwuGqSeg2PhT6MhKujhri54OZlXbt8INCgElIg6jk7mNXhUU7mn1Raa53JKNN2rrB3AxQ
 w9YsJVG0ZONaGxRV195hjdMdM4iXIW3d7N2XZGNbsn3pusX4fh8d+vytNnivrZ67v843hwli6gp
 vc5v1RWbXckksFiuN7Vuj7m93OVsd9wyMRA0gaAfcUE5fK1Db+XkJtSx+8JeTTE8QHXtsKvFGH7
 quBJLPeIORz7Fk3HbrxJDDkc7Llw4ZhLmf/CjNoSjIUIH29fgM/LbykkNkUH4MDa9KCgL5B6PqI
 ihuhZez5oRxUIkGUhjm8kTWKaKxk4Rkx7T8gmEy0v3NMMJ3NGACBmXYUE7zuhUD5auCsimn6SrP
 E2rzK/hs00719p+xIMoOkekw1ZhB84k2fJT7v2sQakWsbjgV9gHp4wcVisNiEKJMwNG+z2M1Hha
 cdbZ4UxgNBS67lNf2TWAYwThNlweCA=
X-Received: by 2002:a05:693c:41cb:20b0:34d:7ae5:8d78 with SMTP id
 5a478bee46e88-351114dfb47mr356720eec.31.1790963603249; 
 Fri, 02 Oct 2026 10:53:23 -0700 (PDT)
Received: from WIN-BH9M8FJACR9 ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id
 5a478bee46e88-34f14f9f2afsm18027361eec.18.2026.10.02.10.53.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Oct 2026 10:53:22 -0700 (PDT)
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
Subject: [PATCH v3 20/27] target/xtensa: convert exception to raise_excp
Date: Sat,  3 Oct 2026 01:50:28 +0800
Message-ID: <20261002175037.1747-21-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.52.0.windows.1
In-Reply-To: <20261002175037.1747-1-luoyonggang@gmail.com>
References: <20261002175037.1747-1-luoyonggang@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1336;
 envelope-from=luoyonggang@gmail.com; helo=mail-dy1-x1336.google.com
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

Replace the forwarding wrapper with direct cpu_raise_excp() calls in
Xtensa C helpers. Use gen_helper_raise_excp() for translated EXCP_YIELD,
while preserving exception_cause helpers for architectural state updates.

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
---
 target/xtensa/exc_helper.c | 14 +++-----------
 target/xtensa/helper.h     |  1 -
 target/xtensa/translate.c  |  2 +-
 target/xtensa/win_helper.c | 13 +++++++------
 4 files changed, 11 insertions(+), 19 deletions(-)

diff --git a/target/xtensa/exc_helper.c b/target/xtensa/exc_helper.c
index 793761a698f..d49cc5558ad 100644
--- a/target/xtensa/exc_helper.c
+++ b/target/xtensa/exc_helper.c
@@ -35,14 +35,6 @@
 #include "qemu/atomic.h"
 #include "qemu/plugin.h"
 
-void HELPER(exception)(CPUXtensaState *env, uint32_t excp)
-{
-    CPUState *cs = env_cpu(env);
-
-    cs->exception_index = excp;
-    cpu_loop_exit(cs);
-}
-
 void HELPER(exception_cause)(CPUXtensaState *env, uint32_t pc, uint32_t cause)
 {
     uint32_t vector;
@@ -63,7 +55,7 @@ void HELPER(exception_cause)(CPUXtensaState *env, uint32_t pc, uint32_t cause)
     env->sregs[EXCCAUSE] = cause;
     env->sregs[PS] |= PS_EXCM;
 
-    HELPER(exception)(env, vector);
+    cpu_raise_excp(env_cpu(env), vector);
 }
 
 void HELPER(exception_cause_vaddr)(CPUXtensaState *env,
@@ -90,7 +82,7 @@ void HELPER(debug_exception)(CPUXtensaState *env, uint32_t pc, uint32_t cause)
     env->sregs[EPS2 + level - 2] = env->sregs[PS];
     env->sregs[PS] = (env->sregs[PS] & ~PS_INTLEVEL) | PS_EXCM |
         (level << PS_INTLEVEL_SHIFT);
-    HELPER(exception)(env, EXC_DEBUG);
+    cpu_raise_excp(env_cpu(env), EXC_DEBUG);
 }
 
 #ifndef CONFIG_USER_ONLY
@@ -113,7 +105,7 @@ void HELPER(waiti)(CPUXtensaState *env, uint32_t pc, uint32_t intlevel)
     }
 
     cpu->halted = 1;
-    HELPER(exception)(env, EXCP_HLT);
+    cpu_raise_excp(env_cpu(env), EXCP_HLT);
 }
 
 void HELPER(check_interrupts)(CPUXtensaState *env)
diff --git a/target/xtensa/helper.h b/target/xtensa/helper.h
index ae938ceedb8..4640d0da59a 100644
--- a/target/xtensa/helper.h
+++ b/target/xtensa/helper.h
@@ -1,4 +1,3 @@
-DEF_HELPER_2(exception, noreturn, env, i32)
 DEF_HELPER_3(exception_cause, noreturn, env, i32, i32)
 DEF_HELPER_4(exception_cause_vaddr, noreturn, env, i32, i32, i32)
 DEF_HELPER_3(debug_exception, noreturn, env, i32, i32)
diff --git a/target/xtensa/translate.c b/target/xtensa/translate.c
index db48f0c562a..05c73bef99d 100644
--- a/target/xtensa/translate.c
+++ b/target/xtensa/translate.c
@@ -307,7 +307,7 @@ static void gen_yield(DisasContext *dc)
 {
     tcg_gen_st_i32(tcg_constant_i32(0), tcg_env,
                    offsetof(CPUXtensaState, yield_needed));
-    gen_helper_exception(tcg_env, tcg_constant_i32(EXCP_YIELD));
+    gen_helper_raise_excp(tcg_env, tcg_constant_i32(EXCP_YIELD));
 }
 
 static void gen_exception_cause(DisasContext *dc, uint32_t cause)
diff --git a/target/xtensa/win_helper.c b/target/xtensa/win_helper.c
index 4b25f8f4de7..b86a05d6203 100644
--- a/target/xtensa/win_helper.c
+++ b/target/xtensa/win_helper.c
@@ -27,6 +27,7 @@
 
 #include "qemu/osdep.h"
 #include "qemu/log.h"
+#include "accel/tcg/cpu-loop.h"
 #include "cpu.h"
 #include "exec/helper-proto.h"
 #include "qemu/host-utils.h"
@@ -125,13 +126,13 @@ void HELPER(window_check)(CPUXtensaState *env, uint32_t pc, uint32_t w)
 
     switch (ctz32(windowstart >> n)) {
     case 0:
-        HELPER(exception)(env, EXC_WINDOW_OVERFLOW4);
+        cpu_raise_excp(env_cpu(env), EXC_WINDOW_OVERFLOW4);
         break;
     case 1:
-        HELPER(exception)(env, EXC_WINDOW_OVERFLOW8);
+        cpu_raise_excp(env_cpu(env), EXC_WINDOW_OVERFLOW8);
         break;
     default:
-        HELPER(exception)(env, EXC_WINDOW_OVERFLOW12);
+        cpu_raise_excp(env_cpu(env), EXC_WINDOW_OVERFLOW12);
         break;
     }
 }
@@ -174,11 +175,11 @@ void HELPER(test_underflow_retw)(CPUXtensaState *env, uint32_t pc)
         env->sregs[EPC1] = env->pc = pc;
 
         if (n == 1) {
-            HELPER(exception)(env, EXC_WINDOW_UNDERFLOW4);
+            cpu_raise_excp(env_cpu(env), EXC_WINDOW_UNDERFLOW4);
         } else if (n == 2) {
-            HELPER(exception)(env, EXC_WINDOW_UNDERFLOW8);
+            cpu_raise_excp(env_cpu(env), EXC_WINDOW_UNDERFLOW8);
         } else if (n == 3) {
-            HELPER(exception)(env, EXC_WINDOW_UNDERFLOW12);
+            cpu_raise_excp(env_cpu(env), EXC_WINDOW_UNDERFLOW12);
         }
     }
 }
-- 
2.52.0.windows.1


