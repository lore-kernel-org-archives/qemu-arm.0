Received: by 10.25.44.15 with SMTP id s15csp107497lfs;
        Fri, 7 Jul 2017 06:27:23 -0700 (PDT)
X-Received: by 10.223.150.74 with SMTP id c10mr823110wra.124.1499434043223;
        Fri, 07 Jul 2017 06:27:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1499434043; cv=none;
        d=google.com; s=arc-20160816;
        b=nzuhO/nKkC/yMlSgRKtsHkFaR3HHJGy6Tclpn8fyRDC4Yw3xnqKfLU12epXluUyaWt
         f1UPjT5FpokvLyt2Y46HcvjjQkviv1dDFTheURa/c/+3u7jMUBCyKrJ7KImJtm6t5WUW
         DKqCpyLjFFU85EIL9RSD2FlLU8WjwL/DioXYsH28LGqcm52i6r5qZM2hdtRbSQWXh/1w
         uceQ42wSFYPggVtkcdLhUdKtB+EbltGHdPPXASrcPqDvzqFr+NqKtZAPp/3OJSH+U/GA
         PYno4eSxnJmxjznNvxNDIrB8V4R+MAFvNuk9i8x88FrnVPnusCaMVCIZv+bMjieXzOoW
         kaKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:user-agent:references
         :in-reply-to:message-id:date:subject:cc:to:from
         :arc-authentication-results;
        bh=lECBMuSlVjzuDdTq22QrN4Xgo5bnnhNgT363W+XOz3A=;
        b=lJ176WYRNMjdaIoudoYv3QycELNE/Oe1IIqsJ1q/zNmje7UqvCIqQshSatAfZWPeBU
         d2Q7kGhqD+sR+PH8x6m2Nb1xFvmCtSubS/aNqjx/a6Z/KQkw2FYwnToWCpdmDwiSmWob
         /0QHjbqzvhnHoeDB5ZeS80b6Lc9oet2Khh81BQQeiMHSCEMcAeVNzdjhoMbHpLuEVq8k
         9qwv3u8gCvUAgKCLWAxFsmyVD0p7ECYzi/zxdDh0ER9h0TVtpfNrS9Hd41d/IQDbQafQ
         fu23HDzHfELFkJYZwqRvuP+ipcQCQFsmA69Zb4Pn20Pil2KK1Rd4LYSr9amRGF7UnT3w
         8s6A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of vilanova@ac.upc.edu designates 147.83.33.10 as permitted sender) smtp.mailfrom=vilanova@ac.upc.edu
Return-Path: <vilanova@ac.upc.edu>
Received: from roura.ac.upc.es (roura.ac.upc.edu. [147.83.33.10])
        by mx.google.com with ESMTP id b66si2980800wmg.165.2017.07.07.06.27.23;
        Fri, 07 Jul 2017 06:27:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of vilanova@ac.upc.edu designates 147.83.33.10 as permitted sender) client-ip=147.83.33.10;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of vilanova@ac.upc.edu designates 147.83.33.10 as permitted sender) smtp.mailfrom=vilanova@ac.upc.edu
Received: from correu-1.ac.upc.es (correu-1.ac.upc.es [147.83.30.91])
	by roura.ac.upc.es (8.13.8/8.13.8) with ESMTP id v67DRKVn022880;
	Fri, 7 Jul 2017 15:27:20 +0200
Received: from localhost (63.red-83-51-187.dynamicip.rima-tde.net [83.51.187.63])
	by correu-1.ac.upc.es (Postfix) with ESMTPSA id D6EBF456;
	Fri,  7 Jul 2017 15:27:14 +0200 (CEST)
From: =?utf-8?b?TGx1w61z?= Vilanova <vilanova@ac.upc.edu>
To: qemu-devel@nongnu.org
Cc: "Emilio G. Cota" <cota@braap.org>,
        =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
        Richard Henderson <rth@twiddle.net>,
        Peter Crosthwaite <crosthwaite.peter@gmail.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Peter Maydell <peter.maydell@linaro.org>,
        qemu-arm@nongnu.org (open list:ARM)
Subject: [PATCH v12 26/27] target/arm: [tcg,a64] Port to disas_log
Date: Fri,  7 Jul 2017 15:27:08 +0200
Message-Id: <149943402876.8972.12271214453548015446.stgit@frigg.lan>
X-Mailer: git-send-email 2.13.2
In-Reply-To: <149942760788.8972.474351671751194003.stgit@frigg.lan>
References: <149942760788.8972.474351671751194003.stgit@frigg.lan>
User-Agent: StGit/0.17.1-dirty
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TUID: xnATNqBdF27J

Incrementally paves the way towards using the generic instruction translation
loop.

Signed-off-by: Lluís Vilanova <vilanova@ac.upc.edu>
Reviewed-by: Richard Henderson <rth@twiddle.net>
---
 target/arm/translate-a64.c |   14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index cead9d382c..ea60d43a95 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -11379,6 +11379,16 @@ static void aarch64_tr_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
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
@@ -11475,9 +11485,7 @@ done_generating:
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
