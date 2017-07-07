Received: by 10.25.44.15 with SMTP id s15csp103072lfs;
        Fri, 7 Jul 2017 06:23:16 -0700 (PDT)
X-Received: by 10.28.93.1 with SMTP id r1mr2292733wmb.26.1499433796539;
        Fri, 07 Jul 2017 06:23:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1499433796; cv=none;
        d=google.com; s=arc-20160816;
        b=C5iszsNOR5zLh7eqrS3Pg/nZTXb01Tw0PKe4iN1r9yumwdmX7S6RVjBLL9GTi8B5u6
         OGg8qJTw1/9ddjkA9v33slJAUzqmtVb5mIHXgcwtj9oR/vJIfRjKOYPNRy0q9n74VjK0
         IZeLCNBEkPmtyNg1CFqrCHduekLr7b6zad3/2KbzusewV2x368GRHwdU4oDHzEdgcxsn
         3sOgq/C8Io2NrcxqFt6be+o3A8et+eHl2OWaEbvL+huHZOnLqxnf65DNdPLs2a0TjyyF
         PLxyji18KI9RFW7fCE6cNUT4g+gcFZRnvVturY502S+nFDBP8qlqi2Leu1aC3kmUuZ/A
         g8Tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:user-agent:references
         :in-reply-to:message-id:date:subject:cc:to:from
         :arc-authentication-results;
        bh=C6E4FwyDi71wjeGFzg3BuAn7MvKXTsio/vlJ+8vugpY=;
        b=S4P1+2pBYvPl/lCnk8nasQ3qoeTIaE+JMxTtMeqlzAI/Zj5B9vxCSJAI5/ROxC3JvQ
         mPGBFQo9SzN79AyzhVw85eYhMy8gCEnTTtIMxiJIRDvIuQwpfq402u4hY9TSO/qmJaj4
         WAlQgyeWBWJXXPG5HCxyf/uG9ZTDTo7LSdMIKIF/j58KLDEIh9Z3VCNKTxthZm/mGcp2
         mavm0Hu+Y/+OZOPXC5lmAwfOUqfh4cKK9ui9Q92G+8r7kC4SrlIb5sGIBPz4PRzJOqea
         b2POZ6aRagHJJ4FmLkTuJtB54XDkp8D8RGr3OvuHfbmEgN6hHfs+bWnUe1xTCRudNLzd
         hhwQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of vilanova@ac.upc.edu designates 147.83.33.10 as permitted sender) smtp.mailfrom=vilanova@ac.upc.edu
Return-Path: <vilanova@ac.upc.edu>
Received: from roura.ac.upc.es (roura.ac.upc.edu. [147.83.33.10])
        by mx.google.com with ESMTP id t140si3009970wme.143.2017.07.07.06.23.16;
        Fri, 07 Jul 2017 06:23:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of vilanova@ac.upc.edu designates 147.83.33.10 as permitted sender) client-ip=147.83.33.10;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of vilanova@ac.upc.edu designates 147.83.33.10 as permitted sender) smtp.mailfrom=vilanova@ac.upc.edu
Received: from correu-2.ac.upc.es (correu-2.ac.upc.es [147.83.30.92])
	by roura.ac.upc.es (8.13.8/8.13.8) with ESMTP id v67DND8S022779;
	Fri, 7 Jul 2017 15:23:13 +0200
Received: from localhost (63.red-83-51-187.dynamicip.rima-tde.net [83.51.187.63])
	by correu-2.ac.upc.es (Postfix) with ESMTPSA id 4BAFD269;
	Fri,  7 Jul 2017 15:23:08 +0200 (CEST)
From: =?utf-8?b?TGx1w61z?= Vilanova <vilanova@ac.upc.edu>
To: qemu-devel@nongnu.org
Cc: "Emilio G. Cota" <cota@braap.org>,
        =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
        Richard Henderson <rth@twiddle.net>,
        Peter Crosthwaite <crosthwaite.peter@gmail.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Peter Maydell <peter.maydell@linaro.org>,
        qemu-arm@nongnu.org (open list:ARM)
Subject: [PATCH v12 25/27] target/arm: [tcg] Port to disas_log
Date: Fri,  7 Jul 2017 15:23:02 +0200
Message-Id: <149943378206.8972.1141843062606418973.stgit@frigg.lan>
X-Mailer: git-send-email 2.13.2
In-Reply-To: <149942760788.8972.474351671751194003.stgit@frigg.lan>
References: <149942760788.8972.474351671751194003.stgit@frigg.lan>
User-Agent: StGit/0.17.1-dirty
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TUID: XK1SuRdVYtVd

Incrementally paves the way towards using the generic instruction translation
loop.

Signed-off-by: Lluís Vilanova <vilanova@ac.upc.edu>
Reviewed-by: Richard Henderson <rth@twiddle.net>
---
 target/arm/translate.c |   13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 00cac01d66..5db381491f 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -12133,6 +12133,15 @@ static void arm_tr_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
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
@@ -12236,9 +12245,7 @@ done_generating:
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
