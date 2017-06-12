Received: by 10.25.0.23 with SMTP id 23csp895314lfa;
        Mon, 12 Jun 2017 07:54:25 -0700 (PDT)
X-Received: by 10.28.131.213 with SMTP id f204mr8206581wmd.26.1497279265183;
        Mon, 12 Jun 2017 07:54:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1497279265; cv=none;
        d=google.com; s=arc-20160816;
        b=sl3F0/4gPYOy7mz50cLSwCpUNjrDditOwWfz67jszXeJWxvK37wS/+F9khPfthiDSF
         ut7WlQrFhW2/9oLIzMTr6mFo1psBrh1Bq686viHRzFNJHDE1ZpUIYgIE2VA5WABB9nSY
         IYuXWsVavf6IMT/DEyqVdwSvCN+9hd8BeupC79Htr/0zAYiAdaP3X8LsWHdX48jC7aTV
         TU8Fgz5cD88L3hyI8xAxU4ozzdVn6CunJg9a7yHHHr2JpFifgE+QRxYO78GqxYYU6YXV
         3N4PLKRkoZNmk9ukMOce42rRl0wYks9Ivjk5SDPz9P5Noj+ijXb4Kahu4c/3y+3S1vAZ
         HJWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:user-agent:references
         :in-reply-to:message-id:date:subject:cc:to:from
         :arc-authentication-results;
        bh=OIAtk8x5KN38BYPe76enYedTbBVfsCtXrcozCyLb794=;
        b=TE3deRr2h3PE3XnqW16jdrLMr5Z9MUiURaBEBVegYs75zj6QoC6tfvrjpV34g3HnV2
         y4LB8YEk2qD5XoMeFBeYOacgGNHq69j8Ww/ZMDD+J7TijbTA2cAVGEZ9ZzqEza9e1ozK
         2R3oIzv5snIV2ocN9HFA2WhoXw0jxwzLbDF7HxAQlC6ts+HnpoWaIWMa+EqH6+V4zXLG
         5bkKDm6njF5k69WX0vJsCfvlpORL38bh0nQ08q8jQ0sbDz+XVrdjDmqN63W6IGtO4ApU
         l8AqNU6d+7Kjpc25rzfAdJwLxWCf+ySAwjLxm1O82E4vZFg61mnBTo/WpeUxnH4XTpXH
         nEtQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of vilanova@ac.upc.edu designates 147.83.33.10 as permitted sender) smtp.mailfrom=vilanova@ac.upc.edu
Return-Path: <vilanova@ac.upc.edu>
Received: from roura.ac.upc.es (roura.ac.upc.edu. [147.83.33.10])
        by mx.google.com with ESMTP id 65si9360031wrs.200.2017.06.12.07.54.25;
        Mon, 12 Jun 2017 07:54:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of vilanova@ac.upc.edu designates 147.83.33.10 as permitted sender) client-ip=147.83.33.10;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of vilanova@ac.upc.edu designates 147.83.33.10 as permitted sender) smtp.mailfrom=vilanova@ac.upc.edu
Received: from correu-2.ac.upc.es (correu-2.ac.upc.es [147.83.30.92])
	by roura.ac.upc.es (8.13.8/8.13.8) with ESMTP id v5CEsOSx025673;
	Mon, 12 Jun 2017 16:54:24 +0200
Received: from localhost (unknown [132.68.137.174])
	by correu-2.ac.upc.es (Postfix) with ESMTPSA id 5560A1339;
	Mon, 12 Jun 2017 16:54:18 +0200 (CEST)
From: =?utf-8?b?TGx1w61z?= Vilanova <vilanova@ac.upc.edu>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
        Richard Henderson <rth@twiddle.net>,
        Peter Crosthwaite <crosthwaite.peter@gmail.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Peter Maydell <peter.maydell@linaro.org>,
        "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
        Laurent Vivier <laurent@vivier.eu>, Alexander Graf <agraf@suse.de>,
        Guan Xuetao <gxt@mprc.pku.edu.cn>, qemu-arm@nongnu.org (open list:ARM)
Subject: [PATCH v6 4/6] target: [tcg] Redefine DISAS_* onto the generic translation framework (DJ_*)
Date: Mon, 12 Jun 2017 17:54:17 +0300
Message-Id: <149727925691.28532.17011173936628331941.stgit@frigg.lan>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <149727922719.28532.11985025310576184920.stgit@frigg.lan>
References: <149727922719.28532.11985025310576184920.stgit@frigg.lan>
User-Agent: StGit/0.17.1-dirty
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TUID: UO7kApciP+JG

Temporarily redefine DISAS_* values based on DJ_TARGET. They should
disappear as targets get ported to the generic framework.

Signed-off-by: Lluís Vilanova <vilanova@ac.upc.edu>
---
 include/exec/exec-all.h      |   11 +++++++----
 target/arm/translate.h       |   19 ++++++++++---------
 target/cris/translate.c      |    3 ++-
 target/m68k/translate.c      |    3 ++-
 target/s390x/translate.c     |    3 ++-
 target/unicore32/translate.c |    3 ++-
 6 files changed, 25 insertions(+), 17 deletions(-)

diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
index 1ec7637170..6ad31a8b6f 100644
--- a/include/exec/exec-all.h
+++ b/include/exec/exec-all.h
@@ -36,10 +36,13 @@ typedef ram_addr_t tb_page_addr_t;
 #endif
 
 /* is_jmp field values */
-#define DISAS_NEXT    0 /* next instruction can be analyzed */
-#define DISAS_JUMP    1 /* only pc was modified dynamically */
-#define DISAS_UPDATE  2 /* cpu state was modified dynamically */
-#define DISAS_TB_JUMP 3 /* only pc was modified statically */
+/* TODO: delete after all targets are transitioned to generic translation */
+#include "exec/translate-all_template.h"
+#define DISAS_NEXT    DJ_NEXT           /* next instruction can be analyzed */
+#define DISAS_JUMP    (DJ_TARGET + 0)   /* only pc was modified dynamically */
+#define DISAS_UPDATE  (DJ_TARGET + 1)   /* cpu state was modified dynamically */
+#define DISAS_TB_JUMP (DJ_TARGET + 2)   /* only pc was modified statically */
+#define DISAS_TARGET  (DJ_TARGET + 3)   /* base for target-specific values */
 
 #include "qemu/log.h"
 
diff --git a/target/arm/translate.h b/target/arm/translate.h
index 15d383d9af..e42fdbe61c 100644
--- a/target/arm/translate.h
+++ b/target/arm/translate.h
@@ -120,29 +120,30 @@ static void disas_set_insn_syndrome(DisasContext *s, uint32_t syn)
 }
 
 /* target-specific extra values for is_jmp */
+/* TODO: rename as DJ_* when transitioning this target to generic translation */
 /* These instructions trap after executing, so the A32/T32 decoder must
  * defer them until after the conditional execution state has been updated.
  * WFI also needs special handling when single-stepping.
  */
-#define DISAS_WFI 4
-#define DISAS_SWI 5
+#define DISAS_WFI (DISAS_TARGET + 0)
+#define DISAS_SWI (DISAS_TARGET + 1)
 /* For instructions which unconditionally cause an exception we can skip
  * emitting unreachable code at the end of the TB in the A64 decoder
  */
-#define DISAS_EXC 6
+#define DISAS_EXC (DISAS_TARGET + 2)
 /* WFE */
-#define DISAS_WFE 7
-#define DISAS_HVC 8
-#define DISAS_SMC 9
-#define DISAS_YIELD 10
+#define DISAS_WFE (DISAS_TARGET + 3)
+#define DISAS_HVC (DISAS_TARGET + 4)
+#define DISAS_SMC (DISAS_TARGET + 5)
+#define DISAS_YIELD (DISAS_TARGET + 6)
 /* M profile branch which might be an exception return (and so needs
  * custom end-of-TB code)
  */
-#define DISAS_BX_EXCRET 11
+#define DISAS_BX_EXCRET (DISAS_TARGET + 7)
 /* For instructions which want an immediate exit to the main loop,
  * as opposed to attempting to use lookup_and_goto_ptr.
  */
-#define DISAS_EXIT 12
+#define DISAS_EXIT (DISAS_TARGET + 8)
 
 #ifdef TARGET_AARCH64
 void a64_translate_init(void);
diff --git a/target/cris/translate.c b/target/cris/translate.c
index 35931e7061..85916196fc 100644
--- a/target/cris/translate.c
+++ b/target/cris/translate.c
@@ -50,7 +50,8 @@
 #define BUG() (gen_BUG(dc, __FILE__, __LINE__))
 #define BUG_ON(x) ({if (x) BUG();})
 
-#define DISAS_SWI 5
+/* TODO: rename as DJ_* when transitioning this target to generic translation */
+#define DISAS_SWI (DISAS_TARGET + 0)
 
 /* Used by the decoder.  */
 #define EXTRACT_FIELD(src, start, end) \
diff --git a/target/m68k/translate.c b/target/m68k/translate.c
index 0a3372818c..3a0cb6227f 100644
--- a/target/m68k/translate.c
+++ b/target/m68k/translate.c
@@ -190,7 +190,8 @@ static void do_writebacks(DisasContext *s)
     }
 }
 
-#define DISAS_JUMP_NEXT 4
+/* TODO: rename as DJ_* when transitioning this target to generic translation */
+#define DISAS_JUMP_NEXT (DISAS_TARGET + 0)
 
 #if defined(CONFIG_USER_ONLY)
 #define IS_USER(s) 1
diff --git a/target/s390x/translate.c b/target/s390x/translate.c
index 2a17b3d7aa..98365bd29c 100644
--- a/target/s390x/translate.c
+++ b/target/s390x/translate.c
@@ -76,7 +76,8 @@ typedef struct {
     } u;
 } DisasCompare;
 
-#define DISAS_EXCP 4
+/* TODO: rename as DJ_* when transitioning this target to generic translation */
+#define DISAS_EXCP (DISAS_TARGET + 0)
 
 #ifdef DEBUG_INLINE_BRANCHES
 static uint64_t inline_branch_hit[CC_OP_MAX];
diff --git a/target/unicore32/translate.c b/target/unicore32/translate.c
index 494ed58c10..374b6bb079 100644
--- a/target/unicore32/translate.c
+++ b/target/unicore32/translate.c
@@ -45,9 +45,10 @@ typedef struct DisasContext {
 #define IS_USER(s)      1
 #endif
 
+/* TODO: rename as DJ_* when transitioning this target to generic translation */
 /* These instructions trap after executing, so defer them until after the
    conditional executions state has been updated.  */
-#define DISAS_SYSCALL 5
+#define DISAS_SYSCALL (DISAS_TARGET + 0)
 
 static TCGv_env cpu_env;
 static TCGv_i32 cpu_R[32];
