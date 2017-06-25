Received: by 10.25.15.197 with SMTP id 66csp919490lfp;
        Sun, 25 Jun 2017 03:24:45 -0700 (PDT)
X-Received: by 10.25.196.17 with SMTP id u17mr4543275lff.19.1498386285375;
        Sun, 25 Jun 2017 03:24:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1498386285; cv=none;
        d=google.com; s=arc-20160816;
        b=ne4mwqYIeLZAyDr3Q+nRFqNULP/gVOSDZDNTdIla8pwJcqc5IHjIZY1PUGilbYFGNg
         wAiDchnSIdN10pvH3NhR3tSW3h5ijftNNow+fD8IR+zaqu2zwey6MPVtTbHiHyQwRrXh
         0V/l5uG1f9nXP0jImAh50DyGAS7bWE8UwJPLrHAmxLJYcIW3mrqRnOqtyfaqMCjORToa
         67cSe/90gxCtUbMBj2iNh2qDcFl75Cdx80ixkMrVu0fZSH2NY7ZCL4pZqeZHhSftRtiN
         VueDsMvopmBP5ZtyogOo7Zak9rlZs/ftaglKjo8AZMbRp5tFZdIHBe7tgCIsrS+RJImY
         XEMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:user-agent:references
         :in-reply-to:message-id:date:subject:cc:to:from
         :arc-authentication-results;
        bh=nTtOtt3AARUeD+6+kxENhKb3xG55OUrIRxG5YaoOR90=;
        b=LJno09ULKVHa71Fs2NpG53f4wCG/gChy/gh2FZpSc2JvTspq33VV2jqK/KHLOpE3/y
         OgPL50qEvuMs0AiOGYKOqvUOfNkP1WdfNxwqgX0q8mTWqDAzun3CXbOPP4J7OjQ5DXVW
         uuNFpvFIZZ0j1Iax+hemNvJQ8ESwxWxCbC06XAf/nb+KZR7J02lJgfOUqaJBQZ15ebdF
         sp6aM0Se+mnt7TpefakDeA5OhAi5g9aJl+ppsyl+y0+Q/Bx14FLVgzC9rbhHSm8GMbD8
         aQAsoOkbIHgsElzmfCzif7NilrRD9pyZczJ+Ya2djaVtJrLgkI6Y6/AwZvhXwesOSKxH
         LLAw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of vilanova@ac.upc.edu designates 147.83.33.10 as permitted sender) smtp.mailfrom=vilanova@ac.upc.edu
Return-Path: <vilanova@ac.upc.edu>
Received: from roura.ac.upc.es (roura.ac.upc.edu. [147.83.33.10])
        by mx.google.com with ESMTP id j74si64447lfe.375.2017.06.25.03.24.44;
        Sun, 25 Jun 2017 03:24:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of vilanova@ac.upc.edu designates 147.83.33.10 as permitted sender) client-ip=147.83.33.10;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of vilanova@ac.upc.edu designates 147.83.33.10 as permitted sender) smtp.mailfrom=vilanova@ac.upc.edu
Received: from correu-1.ac.upc.es (correu-1.ac.upc.es [147.83.30.91])
	by roura.ac.upc.es (8.13.8/8.13.8) with ESMTP id v5PAOiiF020696;
	Sun, 25 Jun 2017 12:24:44 +0200
Received: from localhost (unknown [132.68.53.125])
	by correu-1.ac.upc.es (Postfix) with ESMTPSA id 1F7EA13E1;
	Sun, 25 Jun 2017 12:24:38 +0200 (CEST)
From: =?utf-8?b?TGx1w61z?= Vilanova <vilanova@ac.upc.edu>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
        Richard Henderson <rth@twiddle.net>,
        Peter Crosthwaite <crosthwaite.peter@gmail.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Peter Maydell <peter.maydell@linaro.org>,
        qemu-arm@nongnu.org (open list:ARM)
Subject: [PATCH v9 25/26] target: [tcg,arm] Port to disas_flags
Date: Sun, 25 Jun 2017 13:24:38 +0300
Message-Id: <149838627784.6497.8303638411162957700.stgit@frigg.lan>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <149838022308.6497.2104916050645246693.stgit@frigg.lan>
References: <149838022308.6497.2104916050645246693.stgit@frigg.lan>
User-Agent: StGit/0.17.1-dirty
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TUID: aAJ6CbMuQfHY

Incrementally paves the way towards using the generic instruction translation
loop.

Signed-off-by: Lluís Vilanova <vilanova@ac.upc.edu>
---
 target/arm/translate-a64.c |   10 +++++++++-
 target/arm/translate.c     |   10 +++++++++-
 2 files changed, 18 insertions(+), 2 deletions(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index b14e96cd58..97e8bda230 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -11389,6 +11389,13 @@ static void aarch64_trblock_tb_stop(DisasContextBase *db, CPUState *cpu)
     }
 }
 
+static int aarch64_trblock_disas_flags(const DisasContextBase *db)
+{
+    DisasContext *dc = container_of(db, DisasContext, base);
+
+    return 4 | (bswap_code(dc->sctlr_b) ? 2 : 0);
+}
+
 void gen_intermediate_code_a64(DisasContextBase *db, ARMCPU *cpu,
                                TranslationBlock *tb)
 {
@@ -11475,11 +11482,12 @@ done_generating:
 #ifdef DEBUG_DISAS
     if (qemu_loglevel_mask(CPU_LOG_TB_IN_ASM) &&
         qemu_log_in_addr_range(db->pc_first)) {
+        int disas_flags = aarch64_trblock_disas_flags(db);
         qemu_log_lock();
         qemu_log("----------------\n");
         qemu_log("IN: %s\n", lookup_symbol(db->pc_first));
         log_target_disas(cs, db->pc_first, dc->pc - db->pc_first,
-                         4 | (bswap_code(dc->sctlr_b) ? 2 : 0));
+                         disas_flags);
         qemu_log("\n");
         qemu_log_unlock();
     }
diff --git a/target/arm/translate.c b/target/arm/translate.c
index db31611258..d87328602a 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -12179,6 +12179,13 @@ static void arm_trblock_tb_stop(DisasContextBase *db, CPUState *cpu)
     }
 }
 
+static int arm_trblock_disas_flags(const DisasContextBase *db)
+{
+    DisasContext *dc = container_of(db, DisasContext, base);
+
+    return dc->thumb | (dc->sctlr_b << 1);
+}
+
 /* generate intermediate code for basic block 'tb'.  */
 void gen_intermediate_code(CPUState *cpu, TranslationBlock *tb)
 {
@@ -12274,11 +12281,12 @@ done_generating:
 #ifdef DEBUG_DISAS
     if (qemu_loglevel_mask(CPU_LOG_TB_IN_ASM) &&
         qemu_log_in_addr_range(db->pc_first)) {
+        int disas_flags = arm_trblock_disas_flags(db);
         qemu_log_lock();
         qemu_log("----------------\n");
         qemu_log("IN: %s\n", lookup_symbol(db->pc_first));
         log_target_disas(cpu, db->pc_first, dc->pc - db->pc_first,
-                         dc->thumb | (dc->sctlr_b << 1));
+                         disas_flags);
         qemu_log("\n");
         qemu_log_unlock();
     }
