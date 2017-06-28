Received: by 10.25.227.6 with SMTP id a6csp3109026lfh;
        Wed, 28 Jun 2017 07:09:49 -0700 (PDT)
X-Received: by 10.25.169.207 with SMTP id s198mr3955252lfe.83.1498658989188;
        Wed, 28 Jun 2017 07:09:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1498658989; cv=none;
        d=google.com; s=arc-20160816;
        b=uV3Ue1BWF+V+xosrCdyzViQWkQcZP9D3MYFCCLsnj+7GomIY0LR+sxy1dwB6Ihdks9
         HYzt8hfiEbAtf3I0tARSKARFSWu6TBeGcHUZpoPhCPRg/8xqdG8cpAouDk6vFJuSn1TP
         M5x2ti/E4SPyVkeD4pNCF2XDEDqVDughzSloLMNCxzjPC9y2PiyWD0UvnkAwQXMIUms/
         6mlwu4Rqq6bZ+MSOX+KdT4oGyHbfI3FpFjuABYVO0EU8F/wqKBa8JyIaZ9Yd2KgDtXR5
         MjP9ChxpmhVVA7bm9lD67RbQrXTns72x/5Rtl9GxIrP8eLXJhH04yjMs8ZwW0t+S4kPj
         SzQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:user-agent:references
         :in-reply-to:message-id:date:subject:cc:to:from
         :arc-authentication-results;
        bh=2rpnoiBej3AE2KYmeNg3MvQxkalOu1YleZKiJmtq+ls=;
        b=tZ8p+L3fGhe7lPtUE/uJRdzqLh/dg60yeK96V964Bb+NSNCgvuTPvHopnPuAO9XmKV
         C005KzTKEcm9douhPXfNQN7ksKSznkaf8JOZ04qSVzQKZlOf+vjbjOHRQ9b0RRJRf2l7
         EhIU9JSatAC7qWOCmT8JN8Ifw2/B6dwz/mjJXF63cJw9zsGGntwJA00w43H6jn4+pIjg
         umuLiJhOEAuQiBJtp4dmaiMx1rKAn0PLkxmrFkkEtIhScEIUPm92tlkKP/35WkfC9inB
         vj5LSlHpN5Xv/mTiEFEaJ3ZBEBuzREacoPGJm5b6p5H4l86MMYexGvydoo52PWhhypuW
         4r/g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of vilanova@ac.upc.edu designates 147.83.33.10 as permitted sender) smtp.mailfrom=vilanova@ac.upc.edu
Return-Path: <vilanova@ac.upc.edu>
Received: from roura.ac.upc.es (roura.ac.upc.es. [147.83.33.10])
        by mx.google.com with ESMTP id d16si1127431lfg.222.2017.06.28.07.09.48;
        Wed, 28 Jun 2017 07:09:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of vilanova@ac.upc.edu designates 147.83.33.10 as permitted sender) client-ip=147.83.33.10;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of vilanova@ac.upc.edu designates 147.83.33.10 as permitted sender) smtp.mailfrom=vilanova@ac.upc.edu
Received: from correu-1.ac.upc.es (correu-1.ac.upc.es [147.83.30.91])
	by roura.ac.upc.es (8.13.8/8.13.8) with ESMTP id v5SE9k5k028755;
	Wed, 28 Jun 2017 16:09:46 +0200
Received: from localhost (unknown [132.68.50.243])
	by correu-1.ac.upc.es (Postfix) with ESMTPSA id B62CD1C4;
	Wed, 28 Jun 2017 16:09:40 +0200 (CEST)
From: =?utf-8?b?TGx1w61z?= Vilanova <vilanova@ac.upc.edu>
To: qemu-devel@nongnu.org
Cc: "Emilio G. Cota" <cota@braap.org>,
        =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
        Richard Henderson <rth@twiddle.net>,
        Peter Crosthwaite <crosthwaite.peter@gmail.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Peter Maydell <peter.maydell@linaro.org>,
        qemu-arm@nongnu.org (open list:ARM)
Subject: [PATCH v11 28/29] target/arm: [tcg,a64] Port to disas_log
Date: Wed, 28 Jun 2017 17:09:39 +0300
Message-Id: <149865897948.17063.7243731047242702451.stgit@frigg.lan>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <149865219962.17063.10630533069463266646.stgit@frigg.lan>
References: <149865219962.17063.10630533069463266646.stgit@frigg.lan>
User-Agent: StGit/0.17.1-dirty
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TUID: CFIka0xGRzqw

Incrementally paves the way towards using the generic instruction translation
loop.

Signed-off-by: Lluís Vilanova <vilanova@ac.upc.edu>
---
 target/arm/translate-a64.c |   14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index c57f475dc0..cc8bbb2b44 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -11379,6 +11379,16 @@ static void aarch64_trblock_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
     }
 }
 
+static void aarch64_trblock_disas_log(const DisasContextBase *dcbase,
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
+        aarch64_trblock_disas_log(&dc->base, cs);
         qemu_log("\n");
         qemu_log_unlock();
     }
