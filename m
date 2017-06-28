Received: by 10.25.227.6 with SMTP id a6csp2997202lfh;
        Wed, 28 Jun 2017 05:28:56 -0700 (PDT)
X-Received: by 10.46.83.23 with SMTP id h23mr3169457ljb.70.1498652936767;
        Wed, 28 Jun 2017 05:28:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1498652936; cv=none;
        d=google.com; s=arc-20160816;
        b=UWkK9FSwUJqRvLzJvAjlxnpGGecNNj07ctTHFjSGvyKhpw5D/qovvViDux6fDnhrl2
         DyWHDFxIbaeMd6CF4kjwIyhjThSS2Y9i0yMlIKhOM40pztKeLsjpfca4/X7Sxp+GcUaw
         wC+d5d2b6094ABgHEeVAbeYFbBEeyMW6pRUnOpT3gns4/XbupB0/qrmY05DeUxyCQ/to
         oDChuyFkcywczZ0iHOg2WySs5mw79ibKSCgfIYQSP+KYTCuBNA4jWA9tpyslu4fur7uT
         uqXNXZCkt0F+5d1CdsanAaIFrulDenSVxQgTASkHPMUF5NRCltPKtj0yaRnUOUFG3iEp
         Q29A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:user-agent:references
         :in-reply-to:message-id:date:subject:cc:to:from
         :arc-authentication-results;
        bh=kpZHkbgyE5Is5Zrror+sV5vbjABUWDGXPfwsYDOIZ7E=;
        b=sHXGA4AlPhmPo+WeghjFu7qdtSUwcotEiEsjT3IyUgVgqRvz4SlOOJ0vp77aGMk/vz
         VVLkRdRPmnIuKoeU8msUXOYHvpXozavDgfdwfu87NPp0wW9SgjJqNruiUU12blCSv0hT
         n4Y8hSa/OAf7T5+g7UcQ6dQtNC5qAlMTDgnRlzccPUoF1k4CVUaVgwuHPuffEHQEshYL
         bj6MvqZ7WtvWswQDBbmKtYRLBF5a9vgnQ3OxDI8NRN69gK3gsNu/rvlaj2oJeEP9JWyV
         iutphRvNc/sKn5Rv+mPa89bfyqmVaP+ExukSmQa4nOVdSz/y21kzSNSNeze418ayOFlx
         O/CQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of vilanova@ac.upc.edu designates 147.83.33.10 as permitted sender) smtp.mailfrom=vilanova@ac.upc.edu
Return-Path: <vilanova@ac.upc.edu>
Received: from roura.ac.upc.es (roura.ac.upc.edu. [147.83.33.10])
        by mx.google.com with ESMTP id v2si1004999ljb.131.2017.06.28.05.28.56;
        Wed, 28 Jun 2017 05:28:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of vilanova@ac.upc.edu designates 147.83.33.10 as permitted sender) client-ip=147.83.33.10;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of vilanova@ac.upc.edu designates 147.83.33.10 as permitted sender) smtp.mailfrom=vilanova@ac.upc.edu
Received: from correu-1.ac.upc.es (correu-1.ac.upc.es [147.83.30.91])
	by roura.ac.upc.es (8.13.8/8.13.8) with ESMTP id v5SCSr1W025690;
	Wed, 28 Jun 2017 14:28:53 +0200
Received: from localhost (unknown [132.68.50.243])
	by correu-1.ac.upc.es (Postfix) with ESMTPSA id BD849165;
	Wed, 28 Jun 2017 14:28:47 +0200 (CEST)
From: =?utf-8?b?TGx1w61z?= Vilanova <vilanova@ac.upc.edu>
To: qemu-devel@nongnu.org
Cc: "Emilio G. Cota" <cota@braap.org>,
        =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
        Richard Henderson <rth@twiddle.net>,
        Peter Crosthwaite <crosthwaite.peter@gmail.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Peter Maydell <peter.maydell@linaro.org>,
        "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
        Eduardo Habkost <ehabkost@redhat.com>,
        Michael Walle <michael@walle.cc>, Laurent Vivier <laurent@vivier.eu>,
        Chris Wulff <crwulff@gmail.com>, Marek Vasut <marex@denx.de>,
        Stafford Horne <shorne@gmail.com>, Alexander Graf <agraf@suse.de>,
        Guan Xuetao <gxt@mprc.pku.edu.cn>, Max Filippov <jcmvbkbc@gmail.com>,
        qemu-arm@nongnu.org (open list:ARM)
Subject: [PATCH v11 03/29] target: [tcg] Use a generic enum for DISAS_ values
Date: Wed, 28 Jun 2017 15:28:46 +0300
Message-Id: <149865292643.17063.14495945233139782748.stgit@frigg.lan>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <149865219962.17063.10630533069463266646.stgit@frigg.lan>
References: <149865219962.17063.10630533069463266646.stgit@frigg.lan>
User-Agent: StGit/0.17.1-dirty
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TUID: gCnzuC/vucHR

Used later. An enum makes expected values explicit and bounds the value space of
switches.

Signed-off-by: Lluís Vilanova <vilanova@ac.upc.edu>
---
 include/exec/exec-all.h       |    6 ------
 include/exec/translator.h     |   38 ++++++++++++++++++++++++++++++++++++++
 target/arm/translate.h        |   26 ++++++++++++++++----------
 target/cris/translate.c       |    7 ++++++-
 target/i386/translate.c       |    4 ++++
 target/lm32/translate.c       |    6 ++++++
 target/m68k/translate.c       |    7 ++++++-
 target/microblaze/translate.c |    6 ++++++
 target/nios2/translate.c      |    6 ++++++
 target/openrisc/translate.c   |    6 ++++++
 target/s390x/translate.c      |    3 ++-
 target/unicore32/translate.c  |    7 ++++++-
 target/xtensa/translate.c     |    4 ++++
 13 files changed, 106 insertions(+), 20 deletions(-)
 create mode 100644 include/exec/translator.h

diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
index a7cd106587..7e58d64313 100644
--- a/include/exec/exec-all.h
+++ b/include/exec/exec-all.h
@@ -35,12 +35,6 @@ typedef abi_ulong tb_page_addr_t;
 typedef ram_addr_t tb_page_addr_t;
 #endif
 
-/* is_jmp field values */
-#define DISAS_NEXT    0 /* next instruction can be analyzed */
-#define DISAS_JUMP    1 /* only pc was modified dynamically */
-#define DISAS_UPDATE  2 /* cpu state was modified dynamically */
-#define DISAS_TB_JUMP 3 /* only pc was modified statically */
-
 #include "qemu/log.h"
 
 void gen_intermediate_code(CPUState *env, struct TranslationBlock *tb);
diff --git a/include/exec/translator.h b/include/exec/translator.h
new file mode 100644
index 0000000000..1ffab03a53
--- /dev/null
+++ b/include/exec/translator.h
@@ -0,0 +1,38 @@
+/*
+ * Generic intermediate code generation.
+ *
+ * Copyright (C) 2016-2017 Lluís Vilanova <vilanova@ac.upc.edu>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+
+#ifndef EXEC__TRANSLATOR_H
+#define EXEC__TRANSLATOR_H
+
+/**
+ * DisasJumpType:
+ * @DISAS_NEXT: Next instruction in program order.
+ * @DISAS_TOO_MANY: Too many instructions translated.
+ * @DISAS_TARGET: Start of target-specific conditions.
+ *
+ * What instruction to disassemble next.
+ */
+typedef enum DisasJumpType {
+    DISAS_NEXT,
+    DISAS_TOO_MANY,
+    DISAS_TARGET_0,
+    DISAS_TARGET_1,
+    DISAS_TARGET_2,
+    DISAS_TARGET_3,
+    DISAS_TARGET_4,
+    DISAS_TARGET_5,
+    DISAS_TARGET_6,
+    DISAS_TARGET_7,
+    DISAS_TARGET_8,
+    DISAS_TARGET_9,
+    DISAS_TARGET_10,
+    DISAS_TARGET_11,
+} DisasJumpType;
+
+#endif  /* EXEC__TRANSLATOR_H */
diff --git a/target/arm/translate.h b/target/arm/translate.h
index e5da614db5..aba3f44c9f 100644
--- a/target/arm/translate.h
+++ b/target/arm/translate.h
@@ -1,6 +1,9 @@
 #ifndef TARGET_ARM_TRANSLATE_H
 #define TARGET_ARM_TRANSLATE_H
 
+#include "exec/translator.h"
+
+
 /* internal defines */
 typedef struct DisasContext {
     target_ulong pc;
@@ -119,30 +122,33 @@ static void disas_set_insn_syndrome(DisasContext *s, uint32_t syn)
     s->insn_start_idx = 0;
 }
 
-/* target-specific extra values for is_jmp */
+/* is_jmp field values */
+#define DISAS_JUMP    DISAS_TARGET_0 /* only pc was modified dynamically */
+#define DISAS_UPDATE  DISAS_TARGET_1 /* cpu state was modified dynamically */
+#define DISAS_TB_JUMP DISAS_TARGET_2 /* only pc was modified statically */
 /* These instructions trap after executing, so the A32/T32 decoder must
  * defer them until after the conditional execution state has been updated.
  * WFI also needs special handling when single-stepping.
  */
-#define DISAS_WFI 4
-#define DISAS_SWI 5
+#define DISAS_WFI DISAS_TARGET_3
+#define DISAS_SWI DISAS_TARGET_4
 /* For instructions which unconditionally cause an exception we can skip
  * emitting unreachable code at the end of the TB in the A64 decoder
  */
-#define DISAS_EXC 6
+#define DISAS_EXC DISAS_TARGET_5
 /* WFE */
-#define DISAS_WFE 7
-#define DISAS_HVC 8
-#define DISAS_SMC 9
-#define DISAS_YIELD 10
+#define DISAS_WFE DISAS_TARGET_6
+#define DISAS_HVC DISAS_TARGET_7
+#define DISAS_SMC DISAS_TARGET_8
+#define DISAS_YIELD DISAS_TARGET_9
 /* M profile branch which might be an exception return (and so needs
  * custom end-of-TB code)
  */
-#define DISAS_BX_EXCRET 11
+#define DISAS_BX_EXCRET DISAS_TARGET_10
 /* For instructions which want an immediate exit to the main loop,
  * as opposed to attempting to use lookup_and_goto_ptr.
  */
-#define DISAS_EXIT 12
+#define DISAS_EXIT DISAS_TARGET_11
 
 #ifdef TARGET_AARCH64
 void a64_translate_init(void);
diff --git a/target/cris/translate.c b/target/cris/translate.c
index 35931e7061..164eed2e9c 100644
--- a/target/cris/translate.c
+++ b/target/cris/translate.c
@@ -31,6 +31,7 @@
 #include "exec/helper-proto.h"
 #include "mmu.h"
 #include "exec/cpu_ldst.h"
+#include "exec/translator.h"
 #include "crisv32-decode.h"
 
 #include "exec/helper-gen.h"
@@ -50,7 +51,11 @@
 #define BUG() (gen_BUG(dc, __FILE__, __LINE__))
 #define BUG_ON(x) ({if (x) BUG();})
 
-#define DISAS_SWI 5
+/* is_jmp field values */
+#define DISAS_JUMP    DISAS_TARGET_0 /* only pc was modified dynamically */
+#define DISAS_UPDATE  DISAS_TARGET_1 /* cpu state was modified dynamically */
+#define DISAS_TB_JUMP DISAS_TARGET_2 /* only pc was modified statically */
+#define DISAS_SWI     DISAS_TARGET_3
 
 /* Used by the decoder.  */
 #define EXTRACT_FIELD(src, start, end) \
diff --git a/target/i386/translate.c b/target/i386/translate.c
index b94303ff10..5b02637400 100644
--- a/target/i386/translate.c
+++ b/target/i386/translate.c
@@ -24,6 +24,7 @@
 #include "exec/exec-all.h"
 #include "tcg-op.h"
 #include "exec/cpu_ldst.h"
+#include "exec/translator.h"
 
 #include "exec/helper-proto.h"
 #include "exec/helper-gen.h"
@@ -71,6 +72,9 @@
 
 //#define MACRO_TEST   1
 
+/* is_jmp field values */
+#define DISAS_TB_JUMP DISAS_TARGET_0 /* only pc was modified statically */
+
 /* global register indexes */
 static TCGv_env cpu_env;
 static TCGv cpu_A0;
diff --git a/target/lm32/translate.c b/target/lm32/translate.c
index 0ac34fc620..c33884e18e 100644
--- a/target/lm32/translate.c
+++ b/target/lm32/translate.c
@@ -22,6 +22,7 @@
 #include "disas/disas.h"
 #include "exec/helper-proto.h"
 #include "exec/exec-all.h"
+#include "exec/translator.h"
 #include "tcg-op.h"
 
 #include "exec/cpu_ldst.h"
@@ -47,6 +48,11 @@
 
 #define MEM_INDEX 0
 
+/* is_jmp field values */
+#define DISAS_JUMP    DISAS_TARGET_0 /* only pc was modified dynamically */
+#define DISAS_UPDATE  DISAS_TARGET_1 /* cpu state was modified dynamically */
+#define DISAS_TB_JUMP DISAS_TARGET_2 /* only pc was modified statically */
+
 static TCGv_env cpu_env;
 static TCGv cpu_R[32];
 static TCGv cpu_pc;
diff --git a/target/m68k/translate.c b/target/m68k/translate.c
index 01ef3923c9..26afa3cf8c 100644
--- a/target/m68k/translate.c
+++ b/target/m68k/translate.c
@@ -25,6 +25,7 @@
 #include "tcg-op.h"
 #include "qemu/log.h"
 #include "exec/cpu_ldst.h"
+#include "exec/translator.h"
 
 #include "exec/helper-proto.h"
 #include "exec/helper-gen.h"
@@ -173,7 +174,11 @@ static void do_writebacks(DisasContext *s)
     }
 }
 
-#define DISAS_JUMP_NEXT 4
+/* is_jmp field values */
+#define DISAS_JUMP      DISAS_TARGET_0 /* only pc was modified dynamically */
+#define DISAS_UPDATE    DISAS_TARGET_1 /* cpu state was modified dynamically */
+#define DISAS_TB_JUMP   DISAS_TARGET_2 /* only pc was modified statically */
+#define DISAS_JUMP_NEXT DISAS_TARGET_3
 
 #if defined(CONFIG_USER_ONLY)
 #define IS_USER(s) 1
diff --git a/target/microblaze/translate.c b/target/microblaze/translate.c
index d5f499658d..f6cbf29299 100644
--- a/target/microblaze/translate.c
+++ b/target/microblaze/translate.c
@@ -27,6 +27,7 @@
 #include "microblaze-decode.h"
 #include "exec/cpu_ldst.h"
 #include "exec/helper-gen.h"
+#include "exec/translator.h"
 
 #include "trace-tcg.h"
 #include "exec/log.h"
@@ -46,6 +47,11 @@
 #define EXTRACT_FIELD(src, start, end) \
             (((src) >> start) & ((1 << (end - start + 1)) - 1))
 
+/* is_jmp field values */
+#define DISAS_JUMP    DISAS_TARGET_0 /* only pc was modified dynamically */
+#define DISAS_UPDATE  DISAS_TARGET_1 /* cpu state was modified dynamically */
+#define DISAS_TB_JUMP DISAS_TARGET_2 /* only pc was modified statically */
+
 static TCGv env_debug;
 static TCGv_env cpu_env;
 static TCGv cpu_R[32];
diff --git a/target/nios2/translate.c b/target/nios2/translate.c
index 8b97d6585f..6b0961837d 100644
--- a/target/nios2/translate.c
+++ b/target/nios2/translate.c
@@ -29,6 +29,12 @@
 #include "exec/helper-gen.h"
 #include "exec/log.h"
 #include "exec/cpu_ldst.h"
+#include "exec/translator.h"
+
+/* is_jmp field values */
+#define DISAS_JUMP    DISAS_TARGET_0 /* only pc was modified dynamically */
+#define DISAS_UPDATE  DISAS_TARGET_1 /* cpu state was modified dynamically */
+#define DISAS_TB_JUMP DISAS_TARGET_2 /* only pc was modified statically */
 
 #define INSTRUCTION_FLG(func, flags) { (func), (flags) }
 #define INSTRUCTION(func)                  \
diff --git a/target/openrisc/translate.c b/target/openrisc/translate.c
index 4a28c96e53..b3ca1bd586 100644
--- a/target/openrisc/translate.c
+++ b/target/openrisc/translate.c
@@ -27,6 +27,7 @@
 #include "qemu/log.h"
 #include "qemu/bitops.h"
 #include "exec/cpu_ldst.h"
+#include "exec/translator.h"
 
 #include "exec/helper-proto.h"
 #include "exec/helper-gen.h"
@@ -37,6 +38,11 @@
 #define LOG_DIS(str, ...) \
     qemu_log_mask(CPU_LOG_TB_IN_ASM, "%08x: " str, dc->pc, ## __VA_ARGS__)
 
+/* is_jmp field values */
+#define DISAS_JUMP    DISAS_TARGET_0 /* only pc was modified dynamically */
+#define DISAS_UPDATE  DISAS_TARGET_1 /* cpu state was modified dynamically */
+#define DISAS_TB_JUMP DISAS_TARGET_2 /* only pc was modified statically */
+
 typedef struct DisasContext {
     TranslationBlock *tb;
     target_ulong pc;
diff --git a/target/s390x/translate.c b/target/s390x/translate.c
index 19ea08bb9d..ccddbc907b 100644
--- a/target/s390x/translate.c
+++ b/target/s390x/translate.c
@@ -76,7 +76,8 @@ typedef struct {
     } u;
 } DisasCompare;
 
-#define DISAS_EXCP 4
+/* is_jmp field values */
+#define DISAS_EXCP DISAS_TARGET_0
 
 #ifdef DEBUG_INLINE_BRANCHES
 static uint64_t inline_branch_hit[CC_OP_MAX];
diff --git a/target/unicore32/translate.c b/target/unicore32/translate.c
index 494ed58c10..194aaf64ca 100644
--- a/target/unicore32/translate.c
+++ b/target/unicore32/translate.c
@@ -16,6 +16,7 @@
 #include "tcg-op.h"
 #include "qemu/log.h"
 #include "exec/cpu_ldst.h"
+#include "exec/translator.h"
 
 #include "exec/helper-proto.h"
 #include "exec/helper-gen.h"
@@ -45,9 +46,13 @@ typedef struct DisasContext {
 #define IS_USER(s)      1
 #endif
 
+/* is_jmp field values */
+#define DISAS_JUMP    DISAS_TARGET_0 /* only pc was modified dynamically */
+#define DISAS_UPDATE  DISAS_TARGET_1 /* cpu state was modified dynamically */
+#define DISAS_TB_JUMP DISAS_TARGET_2 /* only pc was modified statically */
 /* These instructions trap after executing, so defer them until after the
    conditional executions state has been updated.  */
-#define DISAS_SYSCALL 5
+#define DISAS_SYSCALL DISAS_TARGET_3
 
 static TCGv_env cpu_env;
 static TCGv_i32 cpu_R[32];
diff --git a/target/xtensa/translate.c b/target/xtensa/translate.c
index 63e4f25c08..1f4b214c6a 100644
--- a/target/xtensa/translate.c
+++ b/target/xtensa/translate.c
@@ -38,6 +38,7 @@
 #include "sysemu/sysemu.h"
 #include "exec/cpu_ldst.h"
 #include "exec/semihost.h"
+#include "exec/translator.h"
 
 #include "exec/helper-proto.h"
 #include "exec/helper-gen.h"
@@ -46,6 +47,9 @@
 #include "exec/log.h"
 
 
+/* is_jmp field values */
+#define DISAS_UPDATE  DISAS_TARGET_0 /* cpu state was modified dynamically */
+
 typedef struct DisasContext {
     const XtensaConfig *config;
     TranslationBlock *tb;
