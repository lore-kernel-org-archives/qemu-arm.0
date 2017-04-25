Received: by 10.25.0.144 with SMTP id 138csp1748152lfa;
        Tue, 25 Apr 2017 00:54:06 -0700 (PDT)
X-Received: by 10.55.58.199 with SMTP id h190mr9828248qka.262.1493106845983;
        Tue, 25 Apr 2017 00:54:05 -0700 (PDT)
Return-Path: <cota@braap.org>
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com. [66.111.4.28])
        by mx.google.com with ESMTPS id r137si2761980qke.194.2017.04.25.00.54.05
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 25 Apr 2017 00:54:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of cota@braap.org designates 66.111.4.28 as permitted sender) client-ip=66.111.4.28;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@braap.org;
       dkim=pass header.i=@messagingengine.com;
       spf=pass (google.com: domain of cota@braap.org designates 66.111.4.28 as permitted sender) smtp.mailfrom=cota@braap.org
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id 1575E21F2A;
	Tue, 25 Apr 2017 03:54:04 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
  by compute4.internal (MEProxy); Tue, 25 Apr 2017 03:54:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=braap.org; h=cc
	:date:from:in-reply-to:message-id:references:subject:to
	:x-me-sender:x-me-sender:x-sasl-enc:x-sasl-enc; s=mesmtp; bh=/Ge
	s7kaRl2H45QkqlVXDFxmcCa9/8GTJAgj2GV6eheU=; b=IOh8Fkc/8WNsTqsWOI/
	rrZl7fzwQ4pnYqV8INbQBsln/TqUJgYdAJwIMFC1Q86JzQFefvN7N8fpC47octjA
	72VN4mqsq9X/B0vGfcIbV2X80KqZ3Wj451DfysTW2mZOONp12rHsEK+oLeM/RgCs
	gNRXDYYM/Sv5mOcYAzGfDLgY=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:date:from:in-reply-to:message-id
	:references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
	:x-sasl-enc; s=fm1; bh=/Ges7kaRl2H45QkqlVXDFxmcCa9/8GTJAgj2GV6eh
	eU=; b=p0UcyGJK1YIrbFVDU6W0ve+KRlZ0KNhYZkKCh3ycDtF7oYh64fnUEzsws
	mbCT2U7ZUIapkJUw25LChEqUrLDzbiBpORT95tHBfn452GL+5fbFS00Ky2+pGPjN
	DNKE+bQ4b0jTC/ug7gaNSCjCMCMaqSeYYxFZFUQGkgGXV+I17YdDEdG8ZEdmiDoZ
	Cb5L9EVLTLGCYSbYBkTuawha1l3VOsLut12J8XV7LEBg4lt/I2/A8OStmZzLDTNn
	9HtunkyfUxk6twXRIm8jGuPXB6IDUcWeIkOta5rIKArPQlVG9ZGRotnwnUMfR+Kv
	hyr3zzLpUtZojYVC3wsZxqdqpO2Jg==
X-ME-Sender: <xms:nAD_WAS21DGRxleswZ8uHro_bSijlyCBWwZ4LLVfDbjgiwuc0VIPXQ>
X-Sasl-enc: McDlbYoRN8fnhXF92z9R3HgI4wlwRuVbhondrqX23xnS 1493106844
Received: from localhost (flamenco.cs.columbia.edu [128.59.20.216])
	by mail.messagingengine.com (Postfix) with ESMTPA id 88FC57E43A;
	Tue, 25 Apr 2017 03:54:04 -0400 (EDT)
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
Subject: [PATCH v2 07/13] tcg/i386: implement goto_ptr op
Date: Tue, 25 Apr 2017 03:53:53 -0400
Message-Id: <1493106839-10438-8-git-send-email-cota@braap.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1493106839-10438-1-git-send-email-cota@braap.org>
References: <1493106839-10438-1-git-send-email-cota@braap.org>
X-TUID: Ce3s5kW5bx9M

Signed-off-by: Emilio G. Cota <cota@braap.org>
---
 tcg/i386/tcg-target.h     |  2 +-
 tcg/i386/tcg-target.inc.c | 13 +++++++++++++
 2 files changed, 14 insertions(+), 1 deletion(-)

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
index 5918008..f6fb03e 100644
--- a/tcg/i386/tcg-target.inc.c
+++ b/tcg/i386/tcg-target.inc.c
@@ -1906,6 +1906,14 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
         }
         s->tb_jmp_reset_offset[a0] = tcg_current_code_size(s);
         break;
+    case INDEX_op_goto_ptr:
+        /* save target address into new register */
+        tcg_out_mov(s, TCG_TYPE_PTR, TCG_REG_EDX, a0);
+        /* set return value to 0 */
+        tgen_arithr(s, ARITH_XOR, TCG_REG_EAX, TCG_REG_EAX);
+        /* jmp to the target address (could be epilogue) */
+        tcg_out_modrm(s, OPC_GRP5, EXT5_JMPN_Ev, TCG_REG_EDX);
+        break;
     case INDEX_op_br:
         tcg_out_jxx(s, JCC_JMP, arg_label(a0), 0);
         break;
@@ -2277,6 +2285,7 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
 
 static const TCGTargetOpDef *tcg_target_op_def(TCGOpcode op)
 {
+    static const TCGTargetOpDef ri = { .args_ct_str = { "ri" } };
     static const TCGTargetOpDef ri_r = { .args_ct_str = { "ri", "r" } };
     static const TCGTargetOpDef re_r = { .args_ct_str = { "re", "r" } };
     static const TCGTargetOpDef qi_r = { .args_ct_str = { "qi", "r" } };
@@ -2324,6 +2333,9 @@ static const TCGTargetOpDef *tcg_target_op_def(TCGOpcode op)
     case INDEX_op_st_i64:
         return &re_r;
 
+    case INDEX_op_goto_ptr:
+        return &ri;
+
     case INDEX_op_add_i32:
     case INDEX_op_add_i64:
         return &r_r_re;
@@ -2569,6 +2581,7 @@ static void tcg_target_qemu_prologue(TCGContext *s)
 
     /* TB epilogue */
     tb_ret_addr = s->code_ptr;
+    s->code_gen_epilogue = s->code_ptr;
 
     tcg_out_addi(s, TCG_REG_CALL_STACK, stack_addend);
 
-- 
2.7.4
