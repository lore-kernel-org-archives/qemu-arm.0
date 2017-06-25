Received: by 10.25.15.197 with SMTP id 66csp913115lfp;
        Sun, 25 Jun 2017 03:00:33 -0700 (PDT)
X-Received: by 10.25.79.25 with SMTP id d25mr5191011lfb.133.1498384833332;
        Sun, 25 Jun 2017 03:00:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1498384833; cv=none;
        d=google.com; s=arc-20160816;
        b=hUYvCPwz9MjTq1zggnX3P3VQoAydLwBCc8nBC7eofy/zm0oc8DJOFZdcgRpVKW4XJB
         Iu47iV7/04cenxpr747Awv5cdkSalHO4F9hrfOwVSBxvF3MAvIYubwcMUqt28wu4b7mo
         5LChR01EMaZWAvFTtfczZb/ovMq1lfg2+Fe9MRH7uDSuJW0inXOryw1FcVuNiInJmzUe
         bpG2uXlovfsz9LFDHDt4GaNvwAbn79CNNy35DdtgqKiarRuTCpHbCM3Bw4JAkZOy3SMH
         6x6/kwNmOd3UxxJ7uxrPwzxIufbXo+zDtZgUHNH4UGOBDD+cnhvIvh8P6l3CGrJpWnLF
         +oAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:user-agent:references
         :in-reply-to:message-id:date:subject:cc:to:from
         :arc-authentication-results;
        bh=qNVJGwR8pqoZzJQgrrqTiEtOQX+fdgeEZzdAJb/MgYM=;
        b=WD0zd1DogNjmzzWc1is12cPrVjVFRiNbIcZc5ga2hCdoBz2JDc0+seT9s1B9+LUG89
         DJKTDK1FXqrPBP4U1DUBcYKUZmuyhsincXMHnktK8HElJRjH4aaal2OgFKcogxKpQt5t
         xNW+el+ibd46pZ824323+frmCYroUNI6LrosfOY1Fu/p5UkpWlVu4V3iCi/NjqkhQJkj
         urQ6zBv1Dvg7snbWR0rIc5l1r3r9tEOw0KLtD7AU2ACSECmWVA70y3uZEs9ARDwkGzU9
         XaOzIN5Wk9DSOjfDhO7deCg2PatYjfWcn272uD0iMPFn0qrndDw+U7h2m5qvmF1j0OT1
         Pwjg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of vilanova@ac.upc.edu designates 147.83.33.10 as permitted sender) smtp.mailfrom=vilanova@ac.upc.edu
Return-Path: <vilanova@ac.upc.edu>
Received: from roura.ac.upc.es (roura.ac.upc.edu. [147.83.33.10])
        by mx.google.com with ESMTP id v75si1945071lfa.90.2017.06.25.03.00.33;
        Sun, 25 Jun 2017 03:00:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of vilanova@ac.upc.edu designates 147.83.33.10 as permitted sender) client-ip=147.83.33.10;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of vilanova@ac.upc.edu designates 147.83.33.10 as permitted sender) smtp.mailfrom=vilanova@ac.upc.edu
Received: from correu-2.ac.upc.es (correu-2.ac.upc.es [147.83.30.92])
	by roura.ac.upc.es (8.13.8/8.13.8) with ESMTP id v5PA0WTt020288;
	Sun, 25 Jun 2017 12:00:32 +0200
Received: from localhost (unknown [132.68.53.125])
	by correu-2.ac.upc.es (Postfix) with ESMTPSA id 12E13944;
	Sun, 25 Jun 2017 12:00:26 +0200 (CEST)
From: =?utf-8?b?TGx1w61z?= Vilanova <vilanova@ac.upc.edu>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
        Richard Henderson <rth@twiddle.net>,
        Peter Crosthwaite <crosthwaite.peter@gmail.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Peter Maydell <peter.maydell@linaro.org>,
        qemu-arm@nongnu.org (open list:ARM)
Subject: [PATCH v9 19/26] target: [tcg,arm] Port to init_globals
Date: Sun, 25 Jun 2017 13:00:24 +0300
Message-Id: <149838482405.6497.13492154521657281100.stgit@frigg.lan>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <149838022308.6497.2104916050645246693.stgit@frigg.lan>
References: <149838022308.6497.2104916050645246693.stgit@frigg.lan>
User-Agent: StGit/0.17.1-dirty
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TUID: vapyuGPsAyUr

Incrementally paves the way towards using the generic instruction translation
loop.

Signed-off-by: Lluís Vilanova <vilanova@ac.upc.edu>
---
 target/arm/translate.c |   21 +++++++++++++--------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index c469bc70ac..cc11dacd56 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -11879,6 +11879,18 @@ static void arm_trblock_init_disas_context(DisasContextBase *db, CPUState *cpu)
     dc->ss_same_el = false; /* Can't be true since EL_d must be AArch64 */
 }
 
+static void arm_trblock_init_globals(DisasContextBase *db, CPUState *cpu)
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
@@ -11909,14 +11921,7 @@ void gen_intermediate_code(CPUState *cpu, TranslationBlock *tb)
     arm_trblock_init_disas_context(db, cpu);
 
 
-    cpu_F0s = tcg_temp_new_i32();
-    cpu_F1s = tcg_temp_new_i32();
-    cpu_F0d = tcg_temp_new_i64();
-    cpu_F1d = tcg_temp_new_i64();
-    cpu_V0 = cpu_F0d;
-    cpu_V1 = cpu_F1d;
-    /* FIXME: cpu_M0 can probably be the same as cpu_V0.  */
-    cpu_M0 = tcg_temp_new_i64();
+    arm_trblock_init_globals(db, cpu);
     next_page_start = (db->pc_first & TARGET_PAGE_MASK) + TARGET_PAGE_SIZE;
     max_insns = tb->cflags & CF_COUNT_MASK;
     if (max_insns == 0) {
