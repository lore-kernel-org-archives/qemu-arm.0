Received: by 10.25.227.6 with SMTP id a6csp3103242lfh;
        Wed, 28 Jun 2017 07:05:46 -0700 (PDT)
X-Received: by 10.46.9.209 with SMTP id 200mr3276039ljj.30.1498658746928;
        Wed, 28 Jun 2017 07:05:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1498658746; cv=none;
        d=google.com; s=arc-20160816;
        b=A9BAAmwQHtfiETZOLZPR79HzswoC9X841z649pSuJFRTWw009odVyLkpjwY39j+LzY
         1rph/Xkb+Y3zJONJdF5JWzPN7EGjHEX300NEVXReKO1cxcJ7qGoCyNqz637wkQTWRPXo
         B6z2YsP7MMx3Y2Q4+fnjYWerLdeM477oW9A8/K0w2GkBfVTfRZbYMcJ9u12+91pFy8k8
         FuC2nS2E/E1XzWCQv5Jehd6SGlLr6S2hXdqa4xj13/ldgJHZ14JwvneGbV0wesQTsOhn
         j+cTxYMXeSGMJKquzJKK0F73UdMfHfHJDazREhzQnAlFigFdVfoyiY/iGBLAy1p1vlnT
         60RA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:user-agent:references
         :in-reply-to:message-id:date:subject:cc:to:from
         :arc-authentication-results;
        bh=yv9KrJxHsCgpEbdViBoI8svSD6o+IwF9sROqMreDVQI=;
        b=H21Iu/1Dk2Yj8wOOnWp6zNA4YiRaYWaafXiRJ9HHy4WzJ/cfM2kXOLjAT6QIegLfPX
         xp4XtEjrNPAMe7YK5uLAYxgHd2likK31uW7nH8a76s1s28c8m5LP7QTYQeL+rHXgclf/
         c4xv8zMvBw+jpep6LGXQTaZg3dX9OiLQzW15iky4g6wB6TC6ZxaPKU0lSAD/xTntUfmT
         fRwbfi4Xn6+LKqM4jCfzaSArElitOL08RmtUjBGldPwU91hqyezbX1dqTT+arBgcL+ho
         b6od15kPr3oCNV0aZgTYv3t23ux1yBiuJCBlV8Kf8482RAfs4aeYPKDXwWNIUj7bmQwl
         v4Sw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of vilanova@ac.upc.edu designates 147.83.33.10 as permitted sender) smtp.mailfrom=vilanova@ac.upc.edu
Return-Path: <vilanova@ac.upc.edu>
Received: from roura.ac.upc.es (roura.ac.upc.es. [147.83.33.10])
        by mx.google.com with ESMTP id c9si1066509ljb.88.2017.06.28.07.05.46;
        Wed, 28 Jun 2017 07:05:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of vilanova@ac.upc.edu designates 147.83.33.10 as permitted sender) client-ip=147.83.33.10;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of vilanova@ac.upc.edu designates 147.83.33.10 as permitted sender) smtp.mailfrom=vilanova@ac.upc.edu
Received: from correu-1.ac.upc.es (correu-1.ac.upc.es [147.83.30.91])
	by roura.ac.upc.es (8.13.8/8.13.8) with ESMTP id v5SE5iBO028609;
	Wed, 28 Jun 2017 16:05:44 +0200
Received: from localhost (unknown [132.68.50.243])
	by correu-1.ac.upc.es (Postfix) with ESMTPSA id D541C17D;
	Wed, 28 Jun 2017 16:05:38 +0200 (CEST)
From: =?utf-8?b?TGx1w61z?= Vilanova <vilanova@ac.upc.edu>
To: qemu-devel@nongnu.org
Cc: "Emilio G. Cota" <cota@braap.org>,
        =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
        Richard Henderson <rth@twiddle.net>,
        Peter Crosthwaite <crosthwaite.peter@gmail.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Peter Maydell <peter.maydell@linaro.org>,
        qemu-arm@nongnu.org (open list:ARM)
Subject: [PATCH v11 27/29] target/arm: [tcg] Port to disas_log
Date: Wed, 28 Jun 2017 17:05:37 +0300
Message-Id: <149865873757.17063.9995919085229011280.stgit@frigg.lan>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <149865219962.17063.10630533069463266646.stgit@frigg.lan>
References: <149865219962.17063.10630533069463266646.stgit@frigg.lan>
User-Agent: StGit/0.17.1-dirty
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TUID: 3NfD0mhms47j

Incrementally paves the way towards using the generic instruction translation
loop.

Signed-off-by: Lluís Vilanova <vilanova@ac.upc.edu>
---
 target/arm/translate.c |   13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index ef0b870a2f..30dacee139 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -12138,6 +12138,15 @@ static void arm_trblock_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
     }
 }
 
+static void arm_trblock_disas_log(const DisasContextBase *dcbase, CPUState *cpu)
+{
+    DisasContext *dc = container_of(dcbase, DisasContext, base);
+
+    qemu_log("IN: %s\n", lookup_symbol(dc->base.pc_first));
+    log_target_disas(cpu, dc->base.pc_first, dc->pc - dc->base.pc_first,
+                     dc->thumb | (dc->sctlr_b << 1));
+}
+
 /* generate intermediate code for basic block 'tb'.  */
 void gen_intermediate_code(CPUState *cpu, TranslationBlock *tb)
 {
@@ -12241,9 +12250,7 @@ done_generating:
         qemu_log_in_addr_range(dc->base.pc_first)) {
         qemu_log_lock();
         qemu_log("----------------\n");
-        qemu_log("IN: %s\n", lookup_symbol(dc->base.pc_first));
-        log_target_disas(cpu, dc->base.pc_first, dc->pc - dc->base.pc_first,
-                         dc->thumb | (dc->sctlr_b << 1));
+        arm_trblock_disas_log(&dc->base, cpu);
         qemu_log("\n");
         qemu_log_unlock();
     }
