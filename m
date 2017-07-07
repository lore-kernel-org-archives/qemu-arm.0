Received: by 10.25.44.15 with SMTP id s15csp68861lfs;
        Fri, 7 Jul 2017 05:54:29 -0700 (PDT)
X-Received: by 10.28.32.70 with SMTP id g67mr2229820wmg.101.1499432069824;
        Fri, 07 Jul 2017 05:54:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1499432069; cv=none;
        d=google.com; s=arc-20160816;
        b=VcVEBCTeZYxk18ug46XGQBIOFrvNh9cWkh4lXEVNWvrDzc/HeQK7MFgOjukNOgTKtY
         3VibNfbpFUDCGRGUGPd+8fwp5mFgY0ID4woc08mUwGaubaGGpIns3jaq0BF6GysIIZoz
         l07lmzWXnpGGb/M4XOCo95oC4voMwDTnQ+VsLnmqBIwRIdG1zoZLqzESDR57xC+h3PBQ
         tKHrpKLzGzxpMe1D5EwWg0tqlE4CCS8GS7LPZfOpa/moMjwWx0bFHplPE4cYjRX/rJav
         x2bfSvhWrpUFqUV1my93kv/2txDO19bCtdeJYxjNHn6cHQA5nUD3NsTAKYrEeyvp3hPU
         QgnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:user-agent:references
         :in-reply-to:message-id:date:subject:cc:to:from
         :arc-authentication-results;
        bh=1X/W3tVH1KTd2wm6A1YhifBfQtcsNraqxpbqpTL/Exc=;
        b=R/6qknwg/M0t6tzoU6U+yOgBchT2CbUc4jqFNy4Rz90q0xJC8zlvRHC2YmjVSR/zzK
         NxMHeHgayFvzBPBvziWmXn7FTZ5oqYG/7DiG7fWcxSIA/rOkud+PI2aTr2Q0Uchrb+q2
         Cg+jmFI2jHZmkUm03lWwEho6lmKDP8uQ5FUN+RWUr1uWHmaRWuWNOb9U7izIFZlIvbE5
         vHvoiXKlj6047kP3rHlOol8F1t9Wi+lIWQOG4rpxqPNEC+UpAlSNi3iNEl99vlIjMhnP
         ZKChtgF/5X216baNwChTtxb/qDF+ZF4ec+PNrCTgo5Wduf4DR6raryFqq3uIRCz2qoIt
         /qlA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of vilanova@ac.upc.edu designates 147.83.33.10 as permitted sender) smtp.mailfrom=vilanova@ac.upc.edu
Return-Path: <vilanova@ac.upc.edu>
Received: from roura.ac.upc.es (roura.ac.upc.edu. [147.83.33.10])
        by mx.google.com with ESMTP id a19si2858751wmd.95.2017.07.07.05.54.29;
        Fri, 07 Jul 2017 05:54:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of vilanova@ac.upc.edu designates 147.83.33.10 as permitted sender) client-ip=147.83.33.10;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of vilanova@ac.upc.edu designates 147.83.33.10 as permitted sender) smtp.mailfrom=vilanova@ac.upc.edu
Received: from correu-2.ac.upc.es (correu-2.ac.upc.es [147.83.30.92])
	by roura.ac.upc.es (8.13.8/8.13.8) with ESMTP id v67CsQ7m021989;
	Fri, 7 Jul 2017 14:54:26 +0200
Received: from localhost (63.red-83-51-187.dynamicip.rima-tde.net [83.51.187.63])
	by correu-2.ac.upc.es (Postfix) with ESMTPSA id C60D113C;
	Fri,  7 Jul 2017 14:54:20 +0200 (CEST)
From: =?utf-8?b?TGx1w61z?= Vilanova <vilanova@ac.upc.edu>
To: qemu-devel@nongnu.org
Cc: "Emilio G. Cota" <cota@braap.org>,
        =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
        Richard Henderson <rth@twiddle.net>,
        Peter Crosthwaite <crosthwaite.peter@gmail.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Peter Maydell <peter.maydell@linaro.org>,
        qemu-arm@nongnu.org (open list:ARM)
Subject: [PATCH v12 18/27] target/arm: [tcg,a64] Port to insn_start
Date: Fri,  7 Jul 2017 14:54:14 +0200
Message-Id: <149943205430.8972.17786409962934999706.stgit@frigg.lan>
X-Mailer: git-send-email 2.13.2
In-Reply-To: <149942760788.8972.474351671751194003.stgit@frigg.lan>
References: <149942760788.8972.474351671751194003.stgit@frigg.lan>
User-Agent: StGit/0.17.1-dirty
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TUID: Tf7VL8xwQqru

Incrementally paves the way towards using the generic instruction translation
loop.

Signed-off-by: Lluís Vilanova <vilanova@ac.upc.edu>
Reviewed-by: Richard Henderson <rth@twiddle.net>
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
