Received: by 10.25.227.6 with SMTP id a6csp3057763lfh;
        Wed, 28 Jun 2017 06:25:29 -0700 (PDT)
X-Received: by 10.98.23.3 with SMTP id 3mr10861175pfx.55.1498656329074;
        Wed, 28 Jun 2017 06:25:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1498656329; cv=none;
        d=google.com; s=arc-20160816;
        b=XH7AU0H63mSbqpzUitbFBLbu5qPoQLVC769BUa0+R7xU/BnUzDm7Q4356s3XJL1vjP
         zPb8FvjkbndzAEbBn+9caLZVsjHKK7Vh8iPyj8P/W2ZucLKojcMu5knq150FTlvKrO8p
         MZXQeW3GW5tgWcHQ5dOdjb05n/5hafZziRy6mpWJkm7hUiINE+JJyPU8U9Hyllmyfoz3
         sPyL/JjqdorQHfph+blMq7ZYkMRD6k8LqNnNP1Vml+S2VNxg4D9uwFo3jdBXgmC0lMpv
         LKoP8B8Mw0MIJF/GIJ1S8NTIQolLcFsI80xKHXDFuYDT+xW9ip5PUY0++QemTl/nBstN
         94nA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:user-agent:references
         :in-reply-to:message-id:date:subject:cc:to:from
         :arc-authentication-results;
        bh=Jso59IOns5ZHa6q8rmlYlzbQSuppSwmIsCX5gmggNNM=;
        b=Quv/JNkS2I/DOM4248FfX/jeAaxCxAddPikiTb1feEqUvSrItDuuqI4J8hO2PRZBIZ
         NqV1CfFeBGyUzNgF22mcmowMwbptLCa0F1rYj+Q/smEaDYkIvhsN5PIkC6z8Zopz1RrX
         sMJSk2BJwp4OOW76vCIAhrM5N24QSzvndSMI0LjORTmIuVGqnCnMvBkckul7BehyKxBv
         X2C6c9d0m93KfUnyJg8rnZeuapCzPajypE4A0aZI1Cfk005qtp4q9BVqmULZdWZwjBLo
         gwalIZmOH1YlwPz0NPTdCYjEddF06UjtGU+gEaCu4cayH7IPZU7SuxXQusV876+H/jFM
         AM4A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of vilanova@ac.upc.edu designates 147.83.33.10 as permitted sender) smtp.mailfrom=vilanova@ac.upc.edu
Return-Path: <vilanova@ac.upc.edu>
Received: from roura.ac.upc.es (roura.ac.upc.edu. [147.83.33.10])
        by mx.google.com with ESMTP id w64si1584530pgd.208.2017.06.28.06.25.27;
        Wed, 28 Jun 2017 06:25:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of vilanova@ac.upc.edu designates 147.83.33.10 as permitted sender) client-ip=147.83.33.10;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of vilanova@ac.upc.edu designates 147.83.33.10 as permitted sender) smtp.mailfrom=vilanova@ac.upc.edu
Received: from correu-2.ac.upc.es (correu-2.ac.upc.es [147.83.30.92])
	by roura.ac.upc.es (8.13.8/8.13.8) with ESMTP id v5SDPL7r027456;
	Wed, 28 Jun 2017 15:25:21 +0200
Received: from localhost (unknown [132.68.50.243])
	by correu-2.ac.upc.es (Postfix) with ESMTPSA id CBA081E3;
	Wed, 28 Jun 2017 15:25:15 +0200 (CEST)
From: =?utf-8?b?TGx1w61z?= Vilanova <vilanova@ac.upc.edu>
To: qemu-devel@nongnu.org
Cc: "Emilio G. Cota" <cota@braap.org>,
        =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
        Richard Henderson <rth@twiddle.net>,
        Peter Crosthwaite <crosthwaite.peter@gmail.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Peter Maydell <peter.maydell@linaro.org>,
        qemu-arm@nongnu.org (open list:ARM)
Subject: [PATCH v11 17/29] target/arm: [tcg] Port to init_globals
Date: Wed, 28 Jun 2017 16:25:14 +0300
Message-Id: <149865631443.17063.7093785957776924619.stgit@frigg.lan>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <149865219962.17063.10630533069463266646.stgit@frigg.lan>
References: <149865219962.17063.10630533069463266646.stgit@frigg.lan>
User-Agent: StGit/0.17.1-dirty
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TUID: WQ421eBd53rd

Incrementally paves the way towards using the generic instruction translation
loop.

Signed-off-by: Lluís Vilanova <vilanova@ac.upc.edu>
---
 target/arm/translate.c |   21 +++++++++++++--------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 23a07fc2c6..fc28cd45f7 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -11843,6 +11843,18 @@ static void arm_trblock_init_disas_context(DisasContextBase *dcbase,
     dc->ss_same_el = false; /* Can't be true since EL_d must be AArch64 */
 }
 
+static void arm_trblock_init_globals(DisasContextBase *dcbase, CPUState *cpu)
+{
+    cpu_F0s = tcg_temp_new_i32();
+    cpu_F1s = tcg_temp_new_i32();
+    cpu_F0d = tcg_temp_new_i64();
+    cpu_F1d = tcg_temp_new_i64();
+    cpu_V0 = cpu_F0d;
+    cpu_V1 = cpu_F1d;
+    /* FIXME: cpu_M0 can probably be the same as cpu_V0.  */
+    cpu_M0 = tcg_temp_new_i64();
+}
+
 /* generate intermediate code for basic block 'tb'.  */
 void gen_intermediate_code(CPUState *cpu, TranslationBlock *tb)
 {
@@ -11871,14 +11883,7 @@ void gen_intermediate_code(CPUState *cpu, TranslationBlock *tb)
     arm_trblock_init_disas_context(&dc->base, cpu);
 
 
-    cpu_F0s = tcg_temp_new_i32();
-    cpu_F1s = tcg_temp_new_i32();
-    cpu_F0d = tcg_temp_new_i64();
-    cpu_F1d = tcg_temp_new_i64();
-    cpu_V0 = cpu_F0d;
-    cpu_V1 = cpu_F1d;
-    /* FIXME: cpu_M0 can probably be the same as cpu_V0.  */
-    cpu_M0 = tcg_temp_new_i64();
+    arm_trblock_init_globals(&dc->base, cpu);
     next_page_start = (dc->base.pc_first & TARGET_PAGE_MASK) + TARGET_PAGE_SIZE;
     max_insns = tb->cflags & CF_COUNT_MASK;
     if (max_insns == 0) {
