Received: by 10.25.0.144 with SMTP id 138csp1748169lfa;
        Tue, 25 Apr 2017 00:54:09 -0700 (PDT)
X-Received: by 10.200.34.162 with SMTP id f31mr31430230qta.65.1493106849775;
        Tue, 25 Apr 2017 00:54:09 -0700 (PDT)
Return-Path: <cota@braap.org>
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com. [66.111.4.28])
        by mx.google.com with ESMTPS id v88si21186051qte.114.2017.04.25.00.54.09
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 25 Apr 2017 00:54:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of cota@braap.org designates 66.111.4.28 as permitted sender) client-ip=66.111.4.28;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@braap.org;
       dkim=pass header.i=@messagingengine.com;
       spf=pass (google.com: domain of cota@braap.org designates 66.111.4.28 as permitted sender) smtp.mailfrom=cota@braap.org
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id 8749921F3A;
	Tue, 25 Apr 2017 03:54:05 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
  by compute4.internal (MEProxy); Tue, 25 Apr 2017 03:54:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=braap.org; h=cc
	:date:from:in-reply-to:message-id:references:subject:to
	:x-me-sender:x-me-sender:x-sasl-enc:x-sasl-enc; s=mesmtp; bh=vCS
	VxhpgXscLs0zC043DB4MTBaK2RULIqjmCh6CYfAw=; b=jB8HlCw0p+Kqen/8QXR
	k0/cLyOCEx2oyjI085s5GOupwEGBNh0Hvgdyzraa9iQDyAzDOazsGbj1in1dxuix
	Y3FErvkR2D038+i+Ar3D3aZYmWN4NiXg6jRq0GRdBDhUrYeVQAvtl3fNJCG2xUFE
	I0439713K1dVVfKD4U75GFS4=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:date:from:in-reply-to:message-id
	:references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
	:x-sasl-enc; s=fm1; bh=vCSVxhpgXscLs0zC043DB4MTBaK2RULIqjmCh6CYf
	Aw=; b=N4gBKmiWA/2oJhT9nYLYaWDHFNnH7UPVBf4aaJtawoagAj2ImaJ7AoRyQ
	4NV2Q1KxzsrA2hLulpxEm7p6xfmwKGI9l6WoNZ1D2U+QsLT+QeFeb1joz39Q2+FM
	uxTLXFhrGz/12f62mu0I2/BUeWjxXt/V0FufycmPjPT4rKZA/zdq7uhcCzoqSDhD
	+ljuGdwR5jKj39dxO07mRK72ta8leysC7L9KW1Nk44FM8ShqTIWzciyJvWbpVByN
	v5nlRrqSDtj9oGK0RGR8vmltORQa0nMUhUE0C6maXoICtOcl/Q1KhBdsDPDXvcBN
	5MeaEYKdRyKYYtTkxvV9Mql1XWyeQ==
X-ME-Sender: <xms:nQD_WAv1iZIaxHzXlbFG3FCjLi3zF-a--cNVjk27aaguWImly1CM-g>
X-Sasl-enc: AXHflI/728IFJACD3t5rtHWprVzUq/D0sPaU5F1VjIJR 1493106845
Received: from localhost (flamenco.cs.columbia.edu [128.59.20.216])
	by mail.messagingengine.com (Postfix) with ESMTPA id 23C4024774;
	Tue, 25 Apr 2017 03:54:05 -0400 (EDT)
From: "Emilio G. Cota" <cota@braap.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	Richard Henderson <rth@twiddle.net>,
	Peter Maydell <peter.maydell@linaro.org>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Andrzej Zaborowski <balrogg@gmail.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Alexander Graf <agraf@suse.de>,
	Stefan Weil <sw@weilnetz.de>,
	qemu-arm@nongnu.org,
	alex.bennee@linaro.org,
	Pranith Kumar <bobby.prani+qemu@gmail.com>
Subject: [PATCH v2 10/13] target/i386: introduce gen_jr() helper to jump to register
Date: Tue, 25 Apr 2017 03:53:56 -0400
Message-Id: <1493106839-10438-11-git-send-email-cota@braap.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1493106839-10438-1-git-send-email-cota@braap.org>
References: <1493106839-10438-1-git-send-email-cota@braap.org>
X-TUID: e42STFQ6JNPc

This helper will be used by subsequent commits.

Signed-off-by: Emilio G. Cota <cota@braap.org>
---
 target/i386/translate.c | 28 +++++++++++++++++++++++-----
 1 file changed, 23 insertions(+), 5 deletions(-)

diff --git a/target/i386/translate.c b/target/i386/translate.c
index 1d1372f..445082b 100644
--- a/target/i386/translate.c
+++ b/target/i386/translate.c
@@ -141,6 +141,7 @@ typedef struct DisasContext {
 } DisasContext;
 
 static void gen_eob(DisasContext *s);
+static void gen_jr(DisasContext *s, TCGv dest);
 static void gen_jmp(DisasContext *s, target_ulong eip);
 static void gen_jmp_tb(DisasContext *s, target_ulong eip, int tb_num);
 static void gen_op(DisasContext *s1, int op, TCGMemOp ot, int d);
@@ -2509,7 +2510,8 @@ static void gen_bnd_jmp(DisasContext *s)
    If INHIBIT, set HF_INHIBIT_IRQ_MASK if it isn't already set.
    If RECHECK_TF, emit a rechecking helper for #DB, ignoring the state of
    S->TF.  This is used by the syscall/sysret insns.  */
-static void gen_eob_worker(DisasContext *s, bool inhibit, bool recheck_tf)
+static void
+gen_eob_worker(DisasContext *s, bool inhibit, bool recheck_tf, TCGv jr)
 {
     gen_update_cc_op(s);
 
@@ -2530,6 +2532,16 @@ static void gen_eob_worker(DisasContext *s, bool inhibit, bool recheck_tf)
         tcg_gen_exit_tb(0);
     } else if (s->tf) {
         gen_helper_single_step(cpu_env);
+    } else if (jr) {
+        TCGv vaddr = tcg_temp_new();
+        TCGv_ptr ptr = tcg_temp_new_ptr();
+
+        tcg_gen_ld_tl(vaddr, cpu_env, offsetof(CPUX86State, segs[R_CS].base));
+        tcg_gen_add_tl(vaddr, vaddr, jr);
+        gen_helper_lookup_tb_ptr(ptr, cpu_env, vaddr);
+        tcg_temp_free(vaddr);
+        tcg_gen_goto_ptr(ptr);
+        tcg_temp_free_ptr(ptr);
     } else {
         tcg_gen_exit_tb(0);
     }
@@ -2540,13 +2552,19 @@ static void gen_eob_worker(DisasContext *s, bool inhibit, bool recheck_tf)
    If INHIBIT, set HF_INHIBIT_IRQ_MASK if it isn't already set.  */
 static void gen_eob_inhibit_irq(DisasContext *s, bool inhibit)
 {
-    gen_eob_worker(s, inhibit, false);
+    gen_eob_worker(s, inhibit, false, NULL);
 }
 
 /* End of block, resetting the inhibit irq flag.  */
 static void gen_eob(DisasContext *s)
 {
-    gen_eob_worker(s, false, false);
+    gen_eob_worker(s, false, false, NULL);
+}
+
+/* Jump to register */
+static void gen_jr(DisasContext *s, TCGv dest)
+{
+    gen_eob_worker(s, false, false, dest);
 }
 
 /* generate a jump to eip. No segment change must happen before as a
@@ -7131,7 +7149,7 @@ static target_ulong disas_insn(CPUX86State *env, DisasContext *s,
         /* TF handling for the syscall insn is different. The TF bit is  checked
            after the syscall insn completes. This allows #DB to not be
            generated after one has entered CPL0 if TF is set in FMASK.  */
-        gen_eob_worker(s, false, true);
+        gen_eob_worker(s, false, true, NULL);
         break;
     case 0x107: /* sysret */
         if (!s->pe) {
@@ -7146,7 +7164,7 @@ static target_ulong disas_insn(CPUX86State *env, DisasContext *s,
                checked after the sysret insn completes. This allows #DB to be
                generated "as if" the syscall insn in userspace has just
                completed.  */
-            gen_eob_worker(s, false, true);
+            gen_eob_worker(s, false, true, NULL);
         }
         break;
 #endif
-- 
2.7.4
