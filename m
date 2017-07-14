Received: by 10.25.44.15 with SMTP id s15csp702764lfs;
        Fri, 14 Jul 2017 02:54:40 -0700 (PDT)
X-Received: by 10.28.236.83 with SMTP id k80mr2164078wmh.52.1500026080650;
        Fri, 14 Jul 2017 02:54:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1500026080; cv=none;
        d=google.com; s=arc-20160816;
        b=SzneVHC0FoWKy6thd/0VNbPnAApmX9e/MHWhWTioQE6WtjF82kiSqSRV7Q+elNJ3ji
         QJgdF8NPIwSEtKrKL627bZQZIuOiOvfa7jonumNRuagu3vgOnoL4gviJp9kcP7VMcPXm
         v5WHlq+ooN6batMzjb8a03KybuVd4U8IawoQC6wNrf9iXiLR8j3ybhDZAGN+H848STq1
         KXvlN26Z26c6CfGYgXE2D05IDWPNrhqz6y0MowDcZStgicZb06k5/4rSCWQn/i+iJhSu
         ugBx5fK1f57INbeKXFtz8y7gwcFIDlJubnC9pfStVr3ZBGdxxcb6JnIhqKAY8e7Xft4n
         m7Zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:user-agent:references
         :in-reply-to:message-id:date:subject:cc:to:from
         :arc-authentication-results;
        bh=qfplmVtIR7qCHB8G6AqHdSZEDnVPOc6AKzVXZTvy4aQ=;
        b=HzWZxVoflVrYMd66o2Ji0rhxPD9tDpPbzrAGMDS2TtnTOd62thu4Ind8dBGg3qOqBN
         BICRSxEAZDuEZCFjLuEaxjjKi+3y/RixeryMzTBqU65bkYfm+THH3ug9EfUXBA8IX8KK
         56DHvH4ZgYBgktrTTR83zzf5YxNjIJW8D/DAvLRIr/J0VIjOwAX4kDMh4l/wktI7Y3QH
         lgTWq87KuFW2WCYI4GJQykEMZPW0xhmgCdrpm3cl3HWxthSNXLROXCkMGT2a/6q1n2Ok
         7v4q3nIzGojioBn2jLve9gvRWN2MdA+CI1L8QySV/VHqX+SJ4ASQDGPJNEjbTR47hjnT
         PDxg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of vilanova@ac.upc.edu designates 147.83.33.10 as permitted sender) smtp.mailfrom=vilanova@ac.upc.edu
Return-Path: <vilanova@ac.upc.edu>
Received: from roura.ac.upc.es (roura.ac.upc.es. [147.83.33.10])
        by mx.google.com with ESMTP id u51si6183809wrc.243.2017.07.14.02.54.40;
        Fri, 14 Jul 2017 02:54:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of vilanova@ac.upc.edu designates 147.83.33.10 as permitted sender) client-ip=147.83.33.10;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of vilanova@ac.upc.edu designates 147.83.33.10 as permitted sender) smtp.mailfrom=vilanova@ac.upc.edu
Received: from correu-2.ac.upc.es (correu-2.ac.upc.es [147.83.30.92])
	by roura.ac.upc.es (8.13.8/8.13.8) with ESMTP id v6E9scvZ010427;
	Fri, 14 Jul 2017 11:54:38 +0200
Received: from localhost (unknown [31.210.188.120])
	by correu-2.ac.upc.es (Postfix) with ESMTPSA id D83E91A7;
	Fri, 14 Jul 2017 11:54:31 +0200 (CEST)
From: =?utf-8?b?TGx1w61z?= Vilanova <vilanova@ac.upc.edu>
To: qemu-devel@nongnu.org
Cc: "Emilio G. Cota" <cota@braap.org>,
        =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
        Richard Henderson <rth@twiddle.net>,
        Peter Crosthwaite <crosthwaite.peter@gmail.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Peter Maydell <peter.maydell@linaro.org>,
        qemu-arm@nongnu.org (open list:ARM)
Subject: [PATCH v13 25/26] target/arm: [tcg,a64] Port to disas_log
Date: Fri, 14 Jul 2017 12:54:29 +0300
Message-Id: <150002606914.22386.15524101311003685068.stgit@frigg.lan>
X-Mailer: git-send-email 2.13.2
In-Reply-To: <150002001195.22386.4679134058536830996.stgit@frigg.lan>
References: <150002001195.22386.4679134058536830996.stgit@frigg.lan>
User-Agent: StGit/0.17.1-dirty
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TUID: tRlNM0cN8Ozs

Incrementally paves the way towards using the generic instruction translation
loop.

Signed-off-by: Lluís Vilanova <vilanova@ac.upc.edu>
Reviewed-by: Richard Henderson <rth@twiddle.net>
---
 target/arm/translate-a64.c |   14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index caeec69d93..5de7fbde29 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -11380,6 +11380,16 @@ static void aarch64_tr_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
     }
 }
 
+static void aarch64_tr_disas_log(const DisasContextBase *dcbase,
+                                      CPUState *cpu)
+{
+    DisasContext *dc = container_of(dcbase, DisasContext, base);
+
+    qemu_log("IN: %s\n", lookup_symbol(dc->base.pc_first));
+    log_target_disas(cpu, dc->base.pc_first, dc->pc - dc->base.pc_first,
+                     4 | (bswap_code(dc->sctlr_b) ? 2 : 0));
+}
+
 void gen_intermediate_code_a64(DisasContextBase *dcbase, CPUState *cs,
                                TranslationBlock *tb)
 {
@@ -11461,9 +11471,7 @@ void gen_intermediate_code_a64(DisasContextBase *dcbase, CPUState *cs,
         qemu_log_in_addr_range(dc->base.pc_first)) {
         qemu_log_lock();
         qemu_log("----------------\n");
-        qemu_log("IN: %s\n", lookup_symbol(dc->base.pc_first));
-        log_target_disas(cs, dc->base.pc_first, dc->pc - dc->base.pc_first,
-                         4 | (bswap_code(dc->sctlr_b) ? 2 : 0));
+        aarch64_tr_disas_log(&dc->base, cs);
         qemu_log("\n");
         qemu_log_unlock();
     }
