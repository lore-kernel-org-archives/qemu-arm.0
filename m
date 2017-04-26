Received: by 10.25.0.144 with SMTP id 138csp133478lfa;
        Tue, 25 Apr 2017 23:23:31 -0700 (PDT)
X-Received: by 10.55.15.96 with SMTP id z93mr25034046qkg.288.1493187811667;
        Tue, 25 Apr 2017 23:23:31 -0700 (PDT)
Return-Path: <cota@braap.org>
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com. [66.111.4.28])
        by mx.google.com with ESMTPS id q68si24562704qka.332.2017.04.25.23.23.31
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 25 Apr 2017 23:23:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of cota@braap.org designates 66.111.4.28 as permitted sender) client-ip=66.111.4.28;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@braap.org;
       dkim=pass header.i=@messagingengine.com;
       spf=pass (google.com: domain of cota@braap.org designates 66.111.4.28 as permitted sender) smtp.mailfrom=cota@braap.org
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id 4BC5121CBB;
	Wed, 26 Apr 2017 02:23:31 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
  by compute4.internal (MEProxy); Wed, 26 Apr 2017 02:23:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=braap.org; h=cc
	:date:from:in-reply-to:message-id:references:subject:to
	:x-me-sender:x-me-sender:x-sasl-enc:x-sasl-enc; s=mesmtp; bh=EWZ
	rYG7mC7qPXiCvjz63O26RuSAtS9/om+ve/xeprWo=; b=F+R60YvZrRufxglFZwZ
	aGzL/eKWgNuaXC4XV3oT4KGlsYUfw7KFBFWM8GsQ/IKUQW1Hh+N3Q0WsCSeJCTvZ
	VurBYw2kANfol0O2yjEIBiSvckJquFYfN23xhBL2SkiJTWZObvm341byLi/7qUoY
	ff2fdT4PAZ5b0Q8xF3X1BAY4=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:date:from:in-reply-to:message-id
	:references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
	:x-sasl-enc; s=fm1; bh=EWZrYG7mC7qPXiCvjz63O26RuSAtS9/om+ve/xepr
	Wo=; b=Q3Ef+vkXYoM+g1HsouepMrAMzMm9uRGDp3mlgVSF1Z939QjTYUGs+Ao+6
	QXduD6F5VSWhD4RLzL2JaH0xgfxDAAmPdSqEzRorWP+M0OfpMKtDHYblgKK9eSRt
	FFRL8osQfQ19HUZJDQ1zYC3Cpy0wPBGvqBxswzxqMirm9MgIav1OSancLhlnhNJJ
	4B9jXN7B+hxsRNVKoP/L3vzeiXXHk+n9C1DwQdzJgTAN1Htha+iN9uh8ntcRYp9T
	rOJyf4O1dupSVv6FYcUhZVW9UQokqDlc5mZ+TYekOY1r08EmLBHhyf3rrxcVPl9w
	wp8WYcQaAh34Ib+jRw2YYNIks4Nmg==
X-ME-Sender: <xms:4zwAWYgh8Z-gGi2RnwVkTMAvmq0f7zvf4YOxBirJXSx-QWkxP4j_dQ>
X-Sasl-enc: TrZ+qsa97cSYr3ANx29dw7aYyJCDSOdJuuB+x2HTqFCJ 1493187811
Received: from localhost (flamenco.cs.columbia.edu [128.59.20.216])
	by mail.messagingengine.com (Postfix) with ESMTPA id 12AEE2469B;
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
Subject: [PATCH v3 04/10] tcg/i386: implement goto_ptr op
Date: Wed, 26 Apr 2017 02:23:17 -0400
Message-Id: <1493187803-4510-5-git-send-email-cota@braap.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1493187803-4510-1-git-send-email-cota@braap.org>
References: <1493187803-4510-1-git-send-email-cota@braap.org>
X-TUID: UO08Q2ofwoRL

Signed-off-by: Emilio G. Cota <cota@braap.org>
---
 tcg/i386/tcg-target.h     |  2 +-
 tcg/i386/tcg-target.inc.c | 15 +++++++++++++++
 2 files changed, 16 insertions(+), 1 deletion(-)

diff --git a/tcg/i386/tcg-target.h b/tcg/i386/tcg-target.h
index 59d9835..73a15f7 100644
--- a/tcg/i386/tcg-target.h
+++ b/tcg/i386/tcg-target.h
@@ -107,7 +107,7 @@ extern bool have_popcnt;
 #define TCG_TARGET_HAS_muls2_i32        1
 #define TCG_TARGET_HAS_muluh_i32        0
 #define TCG_TARGET_HAS_mulsh_i32        0
-#define TCG_TARGET_HAS_goto_ptr         0
+#define TCG_TARGET_HAS_goto_ptr         1
 
 #if TCG_TARGET_REG_BITS == 64
 #define TCG_TARGET_HAS_extrl_i64_i32    0
diff --git a/tcg/i386/tcg-target.inc.c b/tcg/i386/tcg-target.inc.c
index 5918008..d0bf53a 100644
--- a/tcg/i386/tcg-target.inc.c
+++ b/tcg/i386/tcg-target.inc.c
@@ -1906,6 +1906,10 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
         }
         s->tb_jmp_reset_offset[a0] = tcg_current_code_size(s);
         break;
+    case INDEX_op_goto_ptr:
+        /* jmp to the given host address (could be epilogue) */
+        tcg_out_modrm(s, OPC_GRP5, EXT5_JMPN_Ev, a0);
+        break;
     case INDEX_op_br:
         tcg_out_jxx(s, JCC_JMP, arg_label(a0), 0);
         break;
@@ -2277,6 +2281,7 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
 
 static const TCGTargetOpDef *tcg_target_op_def(TCGOpcode op)
 {
+    static const TCGTargetOpDef r = { .args_ct_str = { "r" } };
     static const TCGTargetOpDef ri_r = { .args_ct_str = { "ri", "r" } };
     static const TCGTargetOpDef re_r = { .args_ct_str = { "re", "r" } };
     static const TCGTargetOpDef qi_r = { .args_ct_str = { "qi", "r" } };
@@ -2299,6 +2304,9 @@ static const TCGTargetOpDef *tcg_target_op_def(TCGOpcode op)
         = { .args_ct_str = { "L", "L", "L", "L" } };
 
     switch (op) {
+    case INDEX_op_goto_ptr:
+        return &r;
+
     case INDEX_op_ld8u_i32:
     case INDEX_op_ld8u_i64:
     case INDEX_op_ld8s_i32:
@@ -2567,6 +2575,13 @@ static void tcg_target_qemu_prologue(TCGContext *s)
     tcg_out_modrm(s, OPC_GRP5, EXT5_JMPN_Ev, tcg_target_call_iarg_regs[1]);
 #endif
 
+    /*
+     * Return path for goto_ptr. Set return value to 0, a-la exit_tb,
+     * and fall through to the rest of the epilogue.
+     */
+    s->code_gen_epilogue = s->code_ptr;
+    tcg_out_movi(s, TCG_TYPE_REG, TCG_REG_EAX, 0);
+
     /* TB epilogue */
     tb_ret_addr = s->code_ptr;
 
-- 
2.7.4
