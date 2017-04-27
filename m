Received: by 10.25.0.144 with SMTP id 138csp572127lfa;
        Wed, 26 Apr 2017 20:29:28 -0700 (PDT)
X-Received: by 10.200.41.35 with SMTP id y32mr2958690qty.37.1493263768791;
        Wed, 26 Apr 2017 20:29:28 -0700 (PDT)
Return-Path: <cota@braap.org>
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com. [66.111.4.28])
        by mx.google.com with ESMTPS id h5si1527090qth.125.2017.04.26.20.29.28
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 26 Apr 2017 20:29:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of cota@braap.org designates 66.111.4.28 as permitted sender) client-ip=66.111.4.28;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@braap.org;
       dkim=pass header.i=@messagingengine.com;
       spf=pass (google.com: domain of cota@braap.org designates 66.111.4.28 as permitted sender) smtp.mailfrom=cota@braap.org
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id 2A36C209C6;
	Wed, 26 Apr 2017 23:29:28 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
  by compute4.internal (MEProxy); Wed, 26 Apr 2017 23:29:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=braap.org; h=cc
	:date:from:in-reply-to:message-id:references:subject:to
	:x-me-sender:x-me-sender:x-sasl-enc:x-sasl-enc; s=mesmtp; bh=LfZ
	MDdl1ThkY/pzWQ2wbdfnjFqT6ZH5gfdZiXmk8OF4=; b=UvAsEOqnD0OopOmYhny
	THFvBB/8Tc1qfs2/nuAxW/ULC9iHh+HkeVeTZx9/6SGNGc9obVq8fTnQxWW9XW1t
	7ZoDidJjMV2Q5ABoTW9CWAwexQt0F8Ivzx1s1dhR6kO5gABDCVH+8ADg9ekwrQy1
	J0CaJfKjb67sAfoFF2y7Auuk=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:date:from:in-reply-to:message-id
	:references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
	:x-sasl-enc; s=fm1; bh=LfZMDdl1ThkY/pzWQ2wbdfnjFqT6ZH5gfdZiXmk8O
	F4=; b=FuY2nCIkgzV5AW1ZgEQyDAhA45wJNrXy9sQO/EcZQIaW5I0xELEQjQnHU
	n06xTctqpOT5pKwEhr7mQZVVkq8ZcfWcrE142LOiF69yzHnjL0g7EooLsXrLrz81
	lZCQp1gKhvNPjKb7Ujc0UBdRWnU0KcwAbUt2e+vKHOMkF0XSdpYCD7LV1sBlLR+Z
	HttljUCVnnrVq/24VOCo7YB29n35/qRYkA1H62TkXxJJr/A3JG1RwcEz+Wmvb7y6
	AaELqY9tU6/JVBYxK1xaM0ANFEee+s6bMdQsFU+GyyonBExMrp22HSi8EHYGQTnc
	uEvKuUVbkTKLOZMj4U09tV1pPcqaQ==
X-ME-Sender: <xms:mGUBWfJc00V9XplDIA4yyJuKzMpRsY0Zr4PoFWdL9XNyHb91PLiquQ>
X-Sasl-enc: hcoVvO6zzpCa3wWJzTb5SUTmyb0a4EyUjYY9o1iz/VSx 1493263767
Received: from localhost (flamenco.cs.columbia.edu [128.59.20.216])
	by mail.messagingengine.com (Postfix) with ESMTPA id D99C32471A;
	Wed, 26 Apr 2017 23:29:27 -0400 (EDT)
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
Subject: [PATCH v4 08/11] target/i386: introduce gen_jr helper to generate lookup_and_goto_ptr
Date: Wed, 26 Apr 2017 23:29:21 -0400
Message-Id: <1493263764-18657-9-git-send-email-cota@braap.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1493263764-18657-1-git-send-email-cota@braap.org>
References: <1493263764-18657-1-git-send-email-cota@braap.org>
X-TUID: 37FwpgX5iEZO

This helper will be used by subsequent changes.

Signed-off-by: Emilio G. Cota <cota@braap.org>
---
 target/i386/translate.c | 25 ++++++++++++++++++++++++-
 1 file changed, 24 insertions(+), 1 deletion(-)

diff --git a/target/i386/translate.c b/target/i386/translate.c
index 1d1372f..f0e48dc 100644
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
+do_gen_eob_worker(DisasContext *s, bool inhibit, bool recheck_tf, TCGv jr)
 {
     gen_update_cc_op(s);
 
@@ -2530,12 +2532,27 @@ static void gen_eob_worker(DisasContext *s, bool inhibit, bool recheck_tf)
         tcg_gen_exit_tb(0);
     } else if (s->tf) {
         gen_helper_single_step(cpu_env);
+    } else if (!TCGV_IS_UNUSED(jr)) {
+        TCGv vaddr = tcg_temp_new();
+
+        tcg_gen_add_tl(vaddr, jr, cpu_seg_base[R_CS]);
+        tcg_gen_lookup_and_goto_ptr(vaddr);
+        tcg_temp_free(vaddr);
     } else {
         tcg_gen_exit_tb(0);
     }
     s->is_jmp = DISAS_TB_JUMP;
 }
 
+static inline void
+gen_eob_worker(DisasContext *s, bool inhibit, bool recheck_tf)
+{
+    TCGv unused;
+
+    TCGV_UNUSED(unused);
+    do_gen_eob_worker(s, inhibit, recheck_tf, unused);
+}
+
 /* End of block.
    If INHIBIT, set HF_INHIBIT_IRQ_MASK if it isn't already set.  */
 static void gen_eob_inhibit_irq(DisasContext *s, bool inhibit)
@@ -2549,6 +2566,12 @@ static void gen_eob(DisasContext *s)
     gen_eob_worker(s, false, false);
 }
 
+/* Jump to register */
+static void gen_jr(DisasContext *s, TCGv dest)
+{
+    do_gen_eob_worker(s, false, false, dest);
+}
+
 /* generate a jump to eip. No segment change must happen before as a
    direct call to the next block may occur */
 static void gen_jmp_tb(DisasContext *s, target_ulong eip, int tb_num)
-- 
2.7.4
