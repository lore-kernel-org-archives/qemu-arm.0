Received: by 10.25.44.15 with SMTP id s15csp672499lfs;
        Fri, 14 Jul 2017 02:22:21 -0700 (PDT)
X-Received: by 10.223.141.131 with SMTP id o3mr3729094wrb.110.1500024141406;
        Fri, 14 Jul 2017 02:22:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1500024141; cv=none;
        d=google.com; s=arc-20160816;
        b=LaRImuDEEEmPhXUGVmU7oSqqVbqJYID3rN+UngSxlYa+1P4N5hIM/W9pX5SiAZLETo
         UyYwt7rkA4aLg3h0hofuModkwPgxBFdnLXsirE9PjdXFxaY6p3gNgyiy0u5QrFOXYhQH
         jEydyY5M2tVoJoewujIrUaP0CYSwPbqCUAd3wRbKs05qF0hUPg8esRRTh2vl8Vb3wchP
         +ioqM6g7pXEw27Wu350uQWulVNG/VOAjLOF2CV3RsB4+Ou5+je3lk5ETq3+6Uxu/0D62
         ukOlY4EKW5WS2Dv0P5nFMS8QHAIjSzhMAenAvWEqxIDtrFBpVJfn0UAgxrXdqc0KtST5
         pCTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:user-agent:references
         :in-reply-to:message-id:date:subject:cc:to:from
         :arc-authentication-results;
        bh=NfjsYtnxrh+9+nxkvrQVS6p2priDpZlCnHbI/Rwdw4Y=;
        b=XROAOsNmyQSQW6MkOPmwJLVVp3BkIx+3n804PUZGaCz2HogrXsEB3qbhOMn6Z4ODkk
         BQBFueE3BLuubXwzUFbd+sMXBXnxvM5atqwGl0hexVKTCQCqSnMBgHpLrvrgRgvoJuWh
         sOojRxaXyvl1K6k87gtaAGOag5AyuM3lWtuPA144oSoacf+b+xhgFxA3GPh92hV27t9F
         lgN41mVnLNEY3odvMVYIA6WLTvz1K5CVY7ekuT573xpovNfPzN8/tPVe74Uu4tJgQR3O
         f4KFPEE+mIbw5GmR6Dr6JSaxrOCIWebl0Qa6cwUbdNIXOsiL+Psp6WUFB/WE1Ett2Jaf
         SHUA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of vilanova@ac.upc.edu designates 147.83.33.10 as permitted sender) smtp.mailfrom=vilanova@ac.upc.edu
Return-Path: <vilanova@ac.upc.edu>
Received: from roura.ac.upc.es (roura.ac.upc.es. [147.83.33.10])
        by mx.google.com with ESMTP id h62si1836469wmd.58.2017.07.14.02.22.21;
        Fri, 14 Jul 2017 02:22:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of vilanova@ac.upc.edu designates 147.83.33.10 as permitted sender) client-ip=147.83.33.10;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of vilanova@ac.upc.edu designates 147.83.33.10 as permitted sender) smtp.mailfrom=vilanova@ac.upc.edu
Received: from correu-1.ac.upc.es (correu-1.ac.upc.es [147.83.30.91])
	by roura.ac.upc.es (8.13.8/8.13.8) with ESMTP id v6E9MIYa009497;
	Fri, 14 Jul 2017 11:22:18 +0200
Received: from localhost (unknown [31.210.188.120])
	by correu-1.ac.upc.es (Postfix) with ESMTPSA id 23C2C6FE;
	Fri, 14 Jul 2017 11:22:13 +0200 (CEST)
From: =?utf-8?b?TGx1w61z?= Vilanova <vilanova@ac.upc.edu>
To: qemu-devel@nongnu.org
Cc: "Emilio G. Cota" <cota@braap.org>,
        =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
        Richard Henderson <rth@twiddle.net>,
        Peter Crosthwaite <crosthwaite.peter@gmail.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Peter Maydell <peter.maydell@linaro.org>,
        qemu-arm@nongnu.org (open list:ARM)
Subject: [PATCH v13 17/26] target/arm: [tcg,a64] Port to insn_start
Date: Fri, 14 Jul 2017 12:22:12 +0300
Message-Id: <150002413187.22386.156315485813606121.stgit@frigg.lan>
X-Mailer: git-send-email 2.13.2
In-Reply-To: <150002001195.22386.4679134058536830996.stgit@frigg.lan>
References: <150002001195.22386.4679134058536830996.stgit@frigg.lan>
User-Agent: StGit/0.17.1-dirty
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TUID: zTbDkIi4x9A/

Incrementally paves the way towards using the generic instruction translation
loop.

Signed-off-by: Lluís Vilanova <vilanova@ac.upc.edu>
Reviewed-by: Richard Henderson <rth@twiddle.net>
Reviewed-by: Alex Benneé <alex.benee@linaro.org>
---
 target/arm/translate-a64.c |   11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 5c04ff3d8b..dc91661df0 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -11247,6 +11247,14 @@ static void aarch64_tr_init_disas_context(DisasContextBase *dcbase,
     init_tmp_a64_array(dc);
 }
 
+static void aarch64_tr_insn_start(DisasContextBase *dcbase, CPUState *cpu)
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
+        aarch64_tr_insn_start(&dc->base, cs);
 
         if (unlikely(!QTAILQ_EMPTY(&cs->breakpoints))) {
             CPUBreakpoint *bp;
