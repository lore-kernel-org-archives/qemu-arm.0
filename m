Received: by 10.25.15.197 with SMTP id 66csp900429lfp;
        Sun, 25 Jun 2017 02:04:03 -0700 (PDT)
X-Received: by 10.25.160.8 with SMTP id j8mr6161450lfe.168.1498381443320;
        Sun, 25 Jun 2017 02:04:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1498381443; cv=none;
        d=google.com; s=arc-20160816;
        b=LArVgfNw/gJkQJHFlZQ7+ghaE2eM2xK8ja4NuIAp0ckJfTyNB1inUFMjRbnRXgKi9A
         66XjDbE12f+aIj5FsZIxN21/MVxIIeDn8Zw19Z6h6a91dvd4pdGY5drRFZatsGGIuOda
         pAvnT8yaH2kr5FSjJlZOjPUzsV05aLYd/QmL7F7jQjaHExCmpNorM34OSbcEPKY4Fo4P
         PqtIQVqT9MkoYeu1cLakL5iBS58gyAGPDx2LKlsKJktX09tOS0rVjop4VA+tYPKaZUE3
         oDJ5SEbLwKHNRXjEhURkK+sXE6GWNeX+u++p4jfOfRY68PdIGjhVuD46E3VjbzW3Ic19
         /64g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:user-agent:references
         :in-reply-to:message-id:date:subject:cc:to:from
         :arc-authentication-results;
        bh=ngeM9nJ8gVtB8fKI63r+ydycxo17YKxr3Y2hdVFWK2w=;
        b=im8qLT5g837xLKAL3puwyPF1gZ68Bcj2kfIcDedEZRcAjWlzj//9wtddm6BHDT6Shn
         /sfdR37awVdA9Y6b0qCj3EaWL7VUgpEaLsfT6BwWxVoYJH8CTWLzAGvCSv5tgcsqgSvn
         LKK51nWJKkAt6hPjvO1PhksUbxv0WB5EcI/5jPXlmHe3ADZduzdbZ5wy5t7Z66i8Xjva
         K9SbDvegtdKt7/komcynGIMddmk62gFt5RtIWUxboC3eRp0qa8ciFAsi1ixoo6awMH1K
         qg6mDg1MjBsMLZqYJqQ1Mw88ovXnwOm7YzCbhQavQNryx8Tip4YbmqrdZflzowzxEDr/
         DwxQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of vilanova@ac.upc.edu designates 147.83.33.10 as permitted sender) smtp.mailfrom=vilanova@ac.upc.edu
Return-Path: <vilanova@ac.upc.edu>
Received: from roura.ac.upc.es (roura.ac.upc.edu. [147.83.33.10])
        by mx.google.com with ESMTP id k63si5036186lfi.179.2017.06.25.02.04.03;
        Sun, 25 Jun 2017 02:04:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of vilanova@ac.upc.edu designates 147.83.33.10 as permitted sender) client-ip=147.83.33.10;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of vilanova@ac.upc.edu designates 147.83.33.10 as permitted sender) smtp.mailfrom=vilanova@ac.upc.edu
Received: from correu-1.ac.upc.es (correu-1.ac.upc.es [147.83.30.91])
	by roura.ac.upc.es (8.13.8/8.13.8) with ESMTP id v5P942o0019266;
	Sun, 25 Jun 2017 11:04:02 +0200
Received: from localhost (unknown [132.68.53.125])
	by correu-1.ac.upc.es (Postfix) with ESMTPSA id 2825B783;
	Sun, 25 Jun 2017 11:03:57 +0200 (CEST)
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
Subject: [PATCH v9 05/26] target: [tcg] Redefine DISAS_* onto the generic translation framework (DJ_*)
Date: Sun, 25 Jun 2017 12:03:56 +0300
Message-Id: <149838143590.6497.11184953059640962891.stgit@frigg.lan>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <149838022308.6497.2104916050645246693.stgit@frigg.lan>
References: <149838022308.6497.2104916050645246693.stgit@frigg.lan>
User-Agent: StGit/0.17.1-dirty
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TUID: G1vTRceWyQcW

Temporarily redefine DISAS_* values based on DJ_TARGET. They should
disappear as targets get ported to the generic framework.

Signed-off-by: Lluís Vilanova <vilanova@ac.upc.edu>
Acked-by: David Gibson <david@gibson.dropbear.id.au> (ppc)
Acked-by: Eduardo Habkost <ehabkost@redhat.com>
Reviewed-by: Eduardo Habkost <ehabkost@redhat.com> (i386)
Acked-by: Laurent Vivier <laurent@vivier.eu> (m68k)
Reviewed-by: Alex Benée <alex.benee@linaro.org> (arm)
---
 include/exec/exec-all.h      |   11 +++++++----
 target/arm/translate.h       |   19 ++++++++++---------
 target/cris/translate.c      |    3 ++-
 target/m68k/translate.c      |    3 ++-
 target/s390x/translate.c     |    3 ++-
 target/unicore32/translate.c |    3 ++-
 6 files changed, 25 insertions(+), 17 deletions(-)

diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
index 1ec7637170..5d693cefd1 100644
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
+#include "exec/translate-block.h"
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
index 90424abe00..fca831cd6f 100644
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
index 5fac91aec5..e75e893056 100644
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
index 14abb6e6b9..49eddb061b 100644
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
index a7878ffd81..8bc6db61bb 100644
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
