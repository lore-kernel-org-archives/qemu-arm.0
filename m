Received: by 10.25.227.6 with SMTP id a6csp3071336lfh;
        Wed, 28 Jun 2017 06:37:40 -0700 (PDT)
X-Received: by 10.25.198.71 with SMTP id w68mr3601887lff.4.1498657060021;
        Wed, 28 Jun 2017 06:37:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1498657060; cv=none;
        d=google.com; s=arc-20160816;
        b=u+ACmB56a3X7CiapadMBxFPwf8byh6vnaI03mgoXlHonk+r6CUGS8H77HdgT+VamRx
         bz8yurdnDNwa4Q2FkawEMP5gvW6idaKGtaXJVYa0ILMCNW/mT3NMsypBwF4cuSLUM+Lp
         05iG+gSqRzGDHw9cU6kzD5bwU3crNvDifoZqGOXKFK9m3DjIxKXWY+hn6Yu+uHNWG5pq
         cOxSi8Qyyw+nUI9Ij9D8Ja0SD1npUzi9wrZwetfT3aVyMJ77TqcoyPITGmrRsKNDDOqA
         hzFMuwuNZuA88f4ey2tmLkzYg+Z+CCX0gWrHrKwhdY4wGD8VTfpRTV8eNF8K5yLvh5VP
         GVCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:user-agent:references
         :in-reply-to:message-id:date:subject:cc:to:from
         :arc-authentication-results;
        bh=/NKvqANq3MUD7Zcsk23A9KfVlI6KBItvfni4ZcyGIQE=;
        b=re/rEnWaeye7L5rRM5DuWqnGyMmmgUifFiSvYJ9/UNiNWOgdvkjTyH/02dXpWruo4H
         CPrtGw9SWyTa+lnPG9+8zVuZH3e/3GGZqTCX0epSbr90q5PXPm/3by9hBMu78XomRpob
         PXhcsF2X69iF+hWLO0maGaLEraz0ItlSNc1XHutM8rHXWTWHAs2C4q5ts+kuiHAQVOz/
         Try7Q1uTrBtHCqEVNhylfuAfg57tZ5bWV/SYumrbGLQESwKuoQyIUNomAWs0wLT9Cdn+
         Y8waMagU27Zg+9CG4y/dCfAUktorkMJCZj1JmHwbn81dspawu6wleP3k7O9XPhXCL1QG
         uyJg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of vilanova@ac.upc.edu designates 147.83.33.10 as permitted sender) smtp.mailfrom=vilanova@ac.upc.edu
Return-Path: <vilanova@ac.upc.edu>
Received: from roura.ac.upc.es (roura.ac.upc.es. [147.83.33.10])
        by mx.google.com with ESMTP id u10si1096143lff.453.2017.06.28.06.37.39;
        Wed, 28 Jun 2017 06:37:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of vilanova@ac.upc.edu designates 147.83.33.10 as permitted sender) client-ip=147.83.33.10;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of vilanova@ac.upc.edu designates 147.83.33.10 as permitted sender) smtp.mailfrom=vilanova@ac.upc.edu
Received: from correu-2.ac.upc.es (correu-2.ac.upc.es [147.83.30.92])
	by roura.ac.upc.es (8.13.8/8.13.8) with ESMTP id v5SDbVuA027772;
	Wed, 28 Jun 2017 15:37:36 +0200
Received: from localhost (unknown [132.68.50.243])
	by correu-2.ac.upc.es (Postfix) with ESMTPSA id 201791E0;
	Wed, 28 Jun 2017 15:37:25 +0200 (CEST)
From: =?utf-8?b?TGx1w61z?= Vilanova <vilanova@ac.upc.edu>
To: qemu-devel@nongnu.org
Cc: "Emilio G. Cota" <cota@braap.org>,
        =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
        Richard Henderson <rth@twiddle.net>,
        Peter Crosthwaite <crosthwaite.peter@gmail.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Peter Maydell <peter.maydell@linaro.org>,
        qemu-arm@nongnu.org (open list:ARM)
Subject: [PATCH v11 20/29] target/arm: [tcg,a64] Port to insn_start
Date: Wed, 28 Jun 2017 16:37:23 +0300
Message-Id: <149865704378.17063.12646195470292499503.stgit@frigg.lan>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <149865219962.17063.10630533069463266646.stgit@frigg.lan>
References: <149865219962.17063.10630533069463266646.stgit@frigg.lan>
User-Agent: StGit/0.17.1-dirty
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TUID: eqbUXwLR/9V+

Incrementally paves the way towards using the generic instruction translation
loop.

Signed-off-by: Lluís Vilanova <vilanova@ac.upc.edu>
---
 target/arm/translate-a64.c |   11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 88624a726d..5784620642 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -11247,6 +11247,14 @@ static void aarch64_trblock_init_disas_context(DisasContextBase *dcbase,
     init_tmp_a64_array(dc);
 }
 
+static void aarch64_trblock_insn_start(DisasContextBase *dcbase, CPUState *cpu)
+{
+    DisasContext *dc = container_of(dcbase, DisasContext, base);
+
+    dc->insn_start_idx = tcg_op_buf_count();
+    tcg_gen_insn_start(dc->pc, 0, 0);
+}
+
 void gen_intermediate_code_a64(DisasContextBase *dcbase, CPUState *cs,
                                TranslationBlock *tb)
 {
@@ -11278,8 +11286,7 @@ void gen_intermediate_code_a64(DisasContextBase *dcbase, CPUState *cs,
 
     do {
         dc->base.num_insns++;
-        dc->insn_start_idx = tcg_op_buf_count();
-        tcg_gen_insn_start(dc->pc, 0, 0);
+        aarch64_trblock_insn_start(&dc->base, cs);
 
         if (unlikely(!QTAILQ_EMPTY(&cs->breakpoints))) {
             CPUBreakpoint *bp;
