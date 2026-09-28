Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7260CC9833E
	for <qemu-arm@archiver.kernel.org>; Mon, 28 Sep 2026 05:24:57 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xB3q2-0005e4-Rf; Mon, 28 Sep 2026 01:23:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xB3ok-00045w-Jq
 for qemu-arm@nongnu.org; Mon, 28 Sep 2026 01:22:24 -0400
Received: from mail-dl2-x0d.google.com ([2607:f8b0:4864:38::d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xB3oe-0007vc-Tt
 for qemu-arm@nongnu.org; Mon, 28 Sep 2026 01:22:21 -0400
Received: by mail-dl2-x0d.google.com with SMTP id
 a92af1059eb24-1473f265b82so309538c88.2
 for <qemu-arm@nongnu.org>; Sun, 27 Sep 2026 22:22:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790572935; x=1791177735; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=bMDxaGcKixUkP0LFDlmb0jsz4Zjglb9CdYFmLn1wMt4=;
 b=Cc3f3iOCME+yDjkDSVjRSxnNxqRWsPy1ycRuqqBqfUW2zIsGAo80OOfL+LXaoHvMuh
 RPOwaA5zcMJFOG37Nk9sqsQ2uzepvSU/q0j+IrKu64h32MwLdKkxPHUsZQHOJPCQU+rU
 WGNdPSL5WzzSu9sEPLokMU/T0v77kgnVAd91spP2gN65bms27XJbciK3Wamcy6zRxBtx
 mV4f6AOPbSR0WpxxAp0/Q7XdO7YH6JXISp0WB1bP+ZmWsymjoZ+YvgP/5GAsaQUwy+Ee
 F2vFZJvg9sBgWi2Jw6Kh/Bzr4F19s2yrPhcjofQ5Cu0oyVfp+CDTZ/ETp5oxCB1A0Myc
 tz4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790572935; x=1791177735;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=bMDxaGcKixUkP0LFDlmb0jsz4Zjglb9CdYFmLn1wMt4=;
 b=T5hgpNAuIzA2hGzn9YPCpjuMAs3b1xN2yshPLOdyBcRg3UHWcKIgTUBiNI/ESDfrLq
 JmkvNjeE7E1HZmaJxOCFfzjh2tmvePgjwHbY5G5Or2DRl9tjE/yiS1KJU+pwz/RAcHX4
 cOl3I/pmrRbQ08jdR6d/vE8JeiLuN0rR8Vmje54MCerH3q7N1hCKkfHK4FUKx5yDSJDu
 Zr7/yybnXErwIrvC/9+SndgXMpsyThtLZOoWkX/i3rm/QSq6+J1gulVt7PXWbywOZqhy
 FBzKA5zvBRYJXc3ivMITRxj0HAXOOqTX8UKReDBj7K5ESn6Gwpj3H+8uZcBAmyLb0qMK
 V2WA==
X-Forwarded-Encrypted: i=1;
 AKwUvBwxhLpUuwHEmEiziQ8Mfk7PixuO07cTXBjNeR80lHz797xFSNXok+DP2b0tQXBuV75V+asPlAMppg==@nongnu.org
X-Gm-Message-State: AFuF++maySmfyG5yyxaK4W9mpgEXNk0fZEqFcXlO5eW4446zpbKDINOB
 oGb//L6/UH6BmUgsno9e+zz1gCxq6uWrfYu9AxcsIyRvrOAZ0DLyE3sn
X-Gm-Gg: AYBFou0gSOBJ9QCCAol7ZIkC83Ffa0893yINvrdVqvNvCOii0Cf0+/pGgrzl0jNoDeA
 qQ56yXwCW1oex/nrXKMdMDVsJRohU7jUNr1+8oH/sNIlrm12fLZIBdWhjpBry2Ga9nKwbpXHF3Y
 +amB/kZfyGIFIpKyJ9IOkzwdbaGPSGR6zxitrBXmD29U91lcNGY571p2GYKjApEd3B9Z30fTPhY
 ctB6mOZFFJoJpZbGyNt4oAzwF/3yHnW4tTAAwRfZo4HFSwsezGMfZytiy3b7YlM9VfSgsL20ac4
 OSBjbgKl9PCmELY35hhZt3xDOV6/WYrpaVve1dbnfLF0KfhYhYhiqe0fFkvA1TLlQCvM5JMp/Pt
 +eTrx74ElRvybSdLCahSgrUpEJCsJ1h+XklzCLKvYjWjtAQKBjdHlHsfN4ePLvELNPMLXgVbQo6
 Gk9wQTDxir2LQCNl/96lPM3frUIVlQiKtSVtPHw5nXg96p+/VlE+1e7SLsSBFGPI6JBhkPjN424
 T2V86G1IveJ6CS3H0JiUbTuWJaVqCw=
X-Received: by 2002:a05:7022:1584:b0:145:152:b547 with SMTP id
 a92af1059eb24-146ce1aab23mr9290140c88.1.1790572933639; 
 Sun, 27 Sep 2026 22:22:13 -0700 (PDT)
Received: from WIN-BH9M8FJACR9 ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id
 a92af1059eb24-146bb6551d9sm14726248c88.9.2026.09.27.22.22.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Sep 2026 22:22:12 -0700 (PDT)
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
Subject: [PATCH v2 09/24] target/or1k: convert exception to raise_excp
Date: Mon, 28 Sep 2026 13:20:35 +0800
Message-ID: <20260928052051.251-10-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.52.0.windows.1
In-Reply-To: <20260928052051.251-1-luoyonggang@gmail.com>
References: <20260928052051.251-1-luoyonggang@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:38::d;
 envelope-from=luoyonggang@gmail.com; helo=mail-dl2-x0d.google.com
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

Translate through raise_excp. Drop the TCG exception helper and
exception.c. Keep C raise_exception as a static inline in
exception.h. Exit RANGE overflow through cpu_loop_exit_excp.

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
---
 target/or1k/exception.c        | 31 -------------------------------
 target/or1k/exception.h        |  7 ++++++-
 target/or1k/exception_helper.c | 13 +------------
 target/or1k/helper.h           |  1 -
 target/or1k/meson.build        |  1 -
 target/or1k/translate.c        |  2 +-
 6 files changed, 8 insertions(+), 47 deletions(-)
 delete mode 100644 target/or1k/exception.c

diff --git a/target/or1k/exception.c b/target/or1k/exception.c
deleted file mode 100644
index 0479a069592..00000000000
--- a/target/or1k/exception.c
+++ /dev/null
@@ -1,31 +0,0 @@
-/*
- * OpenRISC exception.
- *
- * Copyright (c) 2011-2012 Jia Liu <proljc@gmail.com>
- *
- * This library is free software; you can redistribute it and/or
- * modify it under the terms of the GNU Lesser General Public
- * License as published by the Free Software Foundation; either
- * version 2.1 of the License, or (at your option) any later version.
- *
- * This library is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
- * Lesser General Public License for more details.
- *
- * You should have received a copy of the GNU Lesser General Public
- * License along with this library; if not, see <http://www.gnu.org/licenses/>.
- */
-
-#include "qemu/osdep.h"
-#include "accel/tcg/cpu-loop.h"
-#include "cpu.h"
-#include "exception.h"
-
-G_NORETURN void raise_exception(OpenRISCCPU *cpu, uint32_t excp)
-{
-    CPUState *cs = CPU(cpu);
-
-    cs->exception_index = excp;
-    cpu_loop_exit(cs);
-}
diff --git a/target/or1k/exception.h b/target/or1k/exception.h
index f62fc314c1f..a49a6c90f0d 100644
--- a/target/or1k/exception.h
+++ b/target/or1k/exception.h
@@ -21,7 +21,12 @@
 #define TARGET_OPENRISC_EXCEPTION_H
 
 #include "cpu.h"
+#include "accel/tcg/cpu-loop.h"
 
-G_NORETURN void raise_exception(OpenRISCCPU *cpu, uint32_t excp);
+static inline G_NORETURN
+void raise_exception(OpenRISCCPU *cpu, uint32_t excp)
+{
+    cpu_loop_exit_excp(CPU(cpu), excp, 0);
+}
 
 #endif /* TARGET_OPENRISC_EXCEPTION_H */
diff --git a/target/or1k/exception_helper.c b/target/or1k/exception_helper.c
index 3bd82b29719..c9b80093b25 100644
--- a/target/or1k/exception_helper.c
+++ b/target/or1k/exception_helper.c
@@ -21,22 +21,11 @@
 #include "cpu.h"
 #include "accel/tcg/cpu-loop.h"
 #include "exec/helper-proto.h"
-#include "exception.h"
-
-void HELPER(exception)(CPUOpenRISCState *env, uint32_t excp)
-{
-    OpenRISCCPU *cpu = env_archcpu(env);
-
-    raise_exception(cpu, excp);
-}
 
 static G_NORETURN
 void do_range(CPUOpenRISCState *env, uintptr_t pc)
 {
-    CPUState *cs = env_cpu(env);
-
-    cs->exception_index = EXCP_RANGE;
-    cpu_loop_exit_restore(cs, pc);
+    cpu_loop_exit_excp(env_cpu(env), EXCP_RANGE, pc);
 }
 
 void HELPER(ove_cy)(CPUOpenRISCState *env)
diff --git a/target/or1k/helper.h b/target/or1k/helper.h
index e0a8d402271..d6e6bd4ffbc 100644
--- a/target/or1k/helper.h
+++ b/target/or1k/helper.h
@@ -18,7 +18,6 @@
  */
 
 /* exception */
-DEF_HELPER_FLAGS_2(exception, TCG_CALL_NO_WG, void, env, i32)
 DEF_HELPER_FLAGS_1(ove_cy, TCG_CALL_NO_WG, void, env)
 DEF_HELPER_FLAGS_1(ove_ov, TCG_CALL_NO_WG, void, env)
 DEF_HELPER_FLAGS_1(ove_cyov, TCG_CALL_NO_WG, void, env)
diff --git a/target/or1k/meson.build b/target/or1k/meson.build
index 7cea45287a2..dba5044b655 100644
--- a/target/or1k/meson.build
+++ b/target/or1k/meson.build
@@ -5,7 +5,6 @@ or1k_ss.add(gen)
 or1k_ss.add(files(
   'cpu.c',
   'disas.c',
-  'exception.c',
   'exception_helper.c',
   'fpu_helper.c',
   'interrupt_helper.c',
diff --git a/target/or1k/translate.c b/target/or1k/translate.c
index e00ef45b9b7..243a8eede23 100644
--- a/target/or1k/translate.c
+++ b/target/or1k/translate.c
@@ -140,7 +140,7 @@ void openrisc_translate_init(void)
 
 static void gen_exception(DisasContext *dc, unsigned int excp)
 {
-    gen_helper_exception(tcg_env, tcg_constant_i32(excp));
+    gen_helper_raise_excp(tcg_env, tcg_constant_i32(excp));
 }
 
 static void gen_illegal_exception(DisasContext *dc)
-- 
2.52.0.windows.1


