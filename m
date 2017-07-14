Received: by 10.25.44.15 with SMTP id s15csp698593lfs;
        Fri, 14 Jul 2017 02:50:37 -0700 (PDT)
X-Received: by 10.223.147.98 with SMTP id 89mr4620804wro.103.1500025837426;
        Fri, 14 Jul 2017 02:50:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1500025837; cv=none;
        d=google.com; s=arc-20160816;
        b=a4xUqfiJFKOzMCiLc42eYSlIfzh3EngtrXbfEE7onFk6yc+rVl/5jp2smqrzLGMvh/
         tWj2/dR/IlHOz76/FoIplnIEhPFhRoL3HU4hdrir06iW36gIIH7QFECKE48Zh2VbRCJW
         8SSvY6yOpjMfBFjk29O6fKwkGIcdUvU/mKRi89dyjwkUpcbz86ZQxkXDKnyDFXGGkjAh
         txmbWUphZPev6yR3b9hoSUNL4TjT9ZGBF0wtCULabdVi9N8D58R/TnDZkVaI/Tpp1xb0
         Tejw9jtzc409XcTgs/Fx4AfNiVChX0OUa5rpsrR4yN85Z+8QvL3KWkQuHu1OOTdp5viQ
         Hi0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:user-agent:references
         :in-reply-to:message-id:date:subject:cc:to:from
         :arc-authentication-results;
        bh=1X/PlXeahDFTa2uiEVluHKvJOtIcFrHMoiRLhcs5Y6c=;
        b=NSd67sjNkOPy4DRfdF4cX6Nr9yQ667clIv/0B4Q5w2W3/5h+KKh3kOrkcZ5USzIE2h
         qgYjvmQ4udl/5e0gF1ruOvKxqX97vjKiI3vDUQsT6B1ZKnhJTtjNJYJ01ba8o7SAoBR6
         lhnC0wK16IJaT+akVEvM/yH9ZFhZih0lp3o4RF6feezsoIh3x9Ju+D8fZPtpQ0ofHxLh
         KMCfi081WjfNnxO+w9hpi26EmtCtBnxXlllnfoSgS7/Is+0K7rSaDKaf3wTs9mGto2s7
         RmH2XO4sRbpXMtKIvnNvPckh+GgvHiIQSZwkgv3rW1XMzxUb5UAPHWFCGUi3ENEOJfcZ
         0Omg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of vilanova@ac.upc.edu designates 147.83.33.10 as permitted sender) smtp.mailfrom=vilanova@ac.upc.edu
Return-Path: <vilanova@ac.upc.edu>
Received: from roura.ac.upc.es (roura.ac.upc.es. [147.83.33.10])
        by mx.google.com with ESMTP id w72si6120350wrc.393.2017.07.14.02.50.37;
        Fri, 14 Jul 2017 02:50:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of vilanova@ac.upc.edu designates 147.83.33.10 as permitted sender) client-ip=147.83.33.10;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of vilanova@ac.upc.edu designates 147.83.33.10 as permitted sender) smtp.mailfrom=vilanova@ac.upc.edu
Received: from correu-2.ac.upc.es (correu-2.ac.upc.es [147.83.30.92])
	by roura.ac.upc.es (8.13.8/8.13.8) with ESMTP id v6E9oYsX010315;
	Fri, 14 Jul 2017 11:50:34 +0200
Received: from localhost (unknown [31.210.188.120])
	by correu-2.ac.upc.es (Postfix) with ESMTPSA id 7ECC23A9;
	Fri, 14 Jul 2017 11:50:28 +0200 (CEST)
From: =?utf-8?b?TGx1w61z?= Vilanova <vilanova@ac.upc.edu>
To: qemu-devel@nongnu.org
Cc: "Emilio G. Cota" <cota@braap.org>,
        =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
        Richard Henderson <rth@twiddle.net>,
        Peter Crosthwaite <crosthwaite.peter@gmail.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Peter Maydell <peter.maydell@linaro.org>,
        qemu-arm@nongnu.org (open list:ARM)
Subject: [PATCH v13 24/26] target/arm: [tcg] Port to disas_log
Date: Fri, 14 Jul 2017 12:50:27 +0300
Message-Id: <150002582711.22386.191527630537864599.stgit@frigg.lan>
X-Mailer: git-send-email 2.13.2
In-Reply-To: <150002001195.22386.4679134058536830996.stgit@frigg.lan>
References: <150002001195.22386.4679134058536830996.stgit@frigg.lan>
User-Agent: StGit/0.17.1-dirty
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TUID: FbW2DLXkM4uj

Incrementally paves the way towards using the generic instruction translation
loop.

Signed-off-by: Lluís Vilanova <vilanova@ac.upc.edu>
Reviewed-by: Richard Henderson <rth@twiddle.net>
Reviewed-by: Alex Benneé <alex.benee@linaro.org>
---
 target/arm/translate.c |   13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index f221cbee5d..507f51d001 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -12135,6 +12135,15 @@ static void arm_tr_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
     }
 }
 
+static void arm_tr_disas_log(const DisasContextBase *dcbase, CPUState *cpu)
+{
+    DisasContext *dc = container_of(dcbase, DisasContext, base);
+
+    qemu_log("IN: %s\n", lookup_symbol(dc->base.pc_first));
+    log_target_disas(cpu, dc->base.pc_first, dc->pc - dc->base.pc_first,
+                     dc->thumb | (dc->sctlr_b << 1));
+}
+
 /* generate intermediate code for basic block 'tb'.  */
 void gen_intermediate_code(CPUState *cs, TranslationBlock *tb)
 {
@@ -12222,9 +12231,7 @@ void gen_intermediate_code(CPUState *cs, TranslationBlock *tb)
         qemu_log_in_addr_range(dc->base.pc_first)) {
         qemu_log_lock();
         qemu_log("----------------\n");
-        qemu_log("IN: %s\n", lookup_symbol(dc->base.pc_first));
-        log_target_disas(cs, dc->base.pc_first, dc->pc - dc->base.pc_first,
-                         dc->thumb | (dc->sctlr_b << 1));
+        arm_tr_disas_log(&dc->base, cs);
         qemu_log("\n");
         qemu_log_unlock();
     }
