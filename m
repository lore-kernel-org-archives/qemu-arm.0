Received: by 10.25.0.144 with SMTP id 138csp133520lfa;
        Tue, 25 Apr 2017 23:23:32 -0700 (PDT)
X-Received: by 10.55.102.198 with SMTP id a189mr17257564qkc.249.1493187812241;
        Tue, 25 Apr 2017 23:23:32 -0700 (PDT)
Return-Path: <cota@braap.org>
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com. [66.111.4.28])
        by mx.google.com with ESMTPS id u6si16772595qtd.35.2017.04.25.23.23.32
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 25 Apr 2017 23:23:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of cota@braap.org designates 66.111.4.28 as permitted sender) client-ip=66.111.4.28;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@braap.org;
       dkim=pass header.i=@messagingengine.com;
       spf=pass (google.com: domain of cota@braap.org designates 66.111.4.28 as permitted sender) smtp.mailfrom=cota@braap.org
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id D5FEA21CBF;
	Wed, 26 Apr 2017 02:23:31 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
  by compute4.internal (MEProxy); Wed, 26 Apr 2017 02:23:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=braap.org; h=cc
	:date:from:in-reply-to:message-id:references:subject:to
	:x-me-sender:x-me-sender:x-sasl-enc:x-sasl-enc; s=mesmtp; bh=R9X
	3lAuvB9xwUxAWmrMmjFimkUEqhTrqz984HNSgbVs=; b=SVgGzcb67bFLYl6qiTa
	sIkKRKWLIAfELv6FxTZ81ujC3vwDK76stk+betJmJdJ9WeXyQCcCxwyWqDKDNeFb
	S+tYUn2et9+ngcHuhMXOWeGabU0kS08qECwsTDe6LXy3sx3xztNY4F5F7dE8MWTt
	95ORu2QzEgdnYxULn2HE3p2Y=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:date:from:in-reply-to:message-id
	:references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
	:x-sasl-enc; s=fm1; bh=R9X3lAuvB9xwUxAWmrMmjFimkUEqhTrqz984HNSgb
	Vs=; b=AdKprwP6Kz3ssuzZdQ+Y983tB+4mmSfXDgOv4czpEW+5qFH0JGqeGDNwW
	YwAqT/naFqOHo2LqAFkSeMe+iglhkOr5RdJHEJprsl22RI7LDZVxgCgOM8GB1WaM
	o39LEmSv1GD2PEnrdz0zf33oznmB/mcf+9JF1UMnEK4USQo+SXcwR+XzG2BQ4New
	mjkStoMmdWLTNG27XiXOs2z8sLYJdUgilY1MHZDOYW4/jkZlETyjZff3O3VA/+OC
	JU2a+ks7QeLP8jfr7ttE66fp9WRbuuSMREYKUyrlOlIAU8sLF0S3zd2GEfU2Jyvh
	ZgcfQhOpJMbfxMoK+DgQwBsNYIXNA==
X-ME-Sender: <xms:4zwAWdu9yKEB1gQgp2M_lS1FcVDhmC-_K6MYWa2dk_hK_vDoaT9cJw>
X-Sasl-enc: TrZ+rd65+MWConwM0Gldw7aYyJCDSOdJuuB+x2HTqFCJ 1493187811
Received: from localhost (flamenco.cs.columbia.edu [128.59.20.216])
	by mail.messagingengine.com (Postfix) with ESMTPA id 903507E0A4;
	Wed, 26 Apr 2017 02:23:31 -0400 (EDT)
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
Subject: [PATCH v3 07/10] target/i386: introduce gen_jr helper to generate lookup_and_goto_ptr
Date: Wed, 26 Apr 2017 02:23:20 -0400
Message-Id: <1493187803-4510-8-git-send-email-cota@braap.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1493187803-4510-1-git-send-email-cota@braap.org>
References: <1493187803-4510-1-git-send-email-cota@braap.org>
X-TUID: pSlEgzSDFJHq

This helper will be used by subsequent changes.

Signed-off-by: Emilio G. Cota <cota@braap.org>
---
 target/i386/translate.c | 25 ++++++++++++++++++++-----
 1 file changed, 20 insertions(+), 5 deletions(-)

diff --git a/target/i386/translate.c b/target/i386/translate.c
index 1d1372f..59f6eaa 100644
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
 
@@ -2530,6 +2532,13 @@ static void gen_eob_worker(DisasContext *s, bool inhibit, bool recheck_tf)
         tcg_gen_exit_tb(0);
     } else if (s->tf) {
         gen_helper_single_step(cpu_env);
+    } else if (jr) {
+        TCGv vaddr = tcg_temp_new();
+
+        tcg_gen_ld_tl(vaddr, cpu_env, offsetof(CPUX86State, segs[R_CS].base));
+        tcg_gen_add_tl(vaddr, vaddr, jr);
+        tcg_gen_lookup_and_goto_ptr(vaddr);
+        tcg_temp_free(vaddr);
     } else {
         tcg_gen_exit_tb(0);
     }
@@ -2540,13 +2549,19 @@ static void gen_eob_worker(DisasContext *s, bool inhibit, bool recheck_tf)
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
@@ -7131,7 +7146,7 @@ static target_ulong disas_insn(CPUX86State *env, DisasContext *s,
         /* TF handling for the syscall insn is different. The TF bit is  checked
            after the syscall insn completes. This allows #DB to not be
            generated after one has entered CPL0 if TF is set in FMASK.  */
-        gen_eob_worker(s, false, true);
+        gen_eob_worker(s, false, true, NULL);
         break;
     case 0x107: /* sysret */
         if (!s->pe) {
@@ -7146,7 +7161,7 @@ static target_ulong disas_insn(CPUX86State *env, DisasContext *s,
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
