Received: by 10.25.0.144 with SMTP id 138csp572118lfa;
        Wed, 26 Apr 2017 20:29:28 -0700 (PDT)
X-Received: by 10.200.50.229 with SMTP id a34mr3010495qtb.56.1493263768118;
        Wed, 26 Apr 2017 20:29:28 -0700 (PDT)
Return-Path: <cota@braap.org>
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com. [66.111.4.28])
        by mx.google.com with ESMTPS id s5si1424554qkf.111.2017.04.26.20.29.27
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 26 Apr 2017 20:29:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of cota@braap.org designates 66.111.4.28 as permitted sender) client-ip=66.111.4.28;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@braap.org;
       dkim=pass header.i=@messagingengine.com;
       spf=pass (google.com: domain of cota@braap.org designates 66.111.4.28 as permitted sender) smtp.mailfrom=cota@braap.org
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id 6919D209C0;
	Wed, 26 Apr 2017 23:29:27 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
  by compute4.internal (MEProxy); Wed, 26 Apr 2017 23:29:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=braap.org; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-sender
	:x-me-sender:x-sasl-enc:x-sasl-enc; s=mesmtp; bh=KUeRIIvUx4M7lTD
	/rQOOuo4KYHGQcYsB1NyAMpPLpVk=; b=tQvAI7y1cTtmifkQ6+sYmNEqjVRz/K4
	r/PKsp3h1oHuscESXH0iSD93WA++7Ab4N7OflaysOYPr9uZtU67tOMrwvt2clZCc
	hh9NeX63eOXT57VIsccqrGmalCFmn1+rL12jFSoeJcCmrptWrEyMjrb21BhwIleT
	4JRawSrSVTSQ=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:date:from:in-reply-to:message-id:mime-version:references
	:subject:to:x-me-sender:x-me-sender:x-sasl-enc:x-sasl-enc; s=
	fm1; bh=KUeRIIvUx4M7lTD/rQOOuo4KYHGQcYsB1NyAMpPLpVk=; b=RiLadL1V
	OMwzZ2c1LsNTpvLitVSf10pgGzzvAkGjL/GI/IDIGEEURIhTLJgh341QK13G+jal
	9Z5xt1Q6Uf6Rml9FpZDxCzG0gKHfR5U0/XUyrJ0U6uuCrMP8bg0EshpCD/hqj2Xa
	pqU8dnOdA4bpfw+Z6DadpnnImGlqkVCh95kCrGmDFF7eIfvFi1hZoh5FJvTCHruZ
	honJRHP+mwoeMuU4D5vCCz0d/ltDJlptlbWpeCiPOcSxeh0JKb4KD/2ODtoEgjPj
	ELBk6PyKUnR4ABjw7Stox0yrRqBsqMjdvYiXrbmoBk6myVgrnd2KUWaHRb2TCR5Z
	ziBJASKPVU8u2A==
X-ME-Sender: <xms:l2UBWZCalJYMAMOzx5arTBKdC2304_VVJVWFWXPzPBlvu3SktYkLHA>
X-Sasl-enc: hcoZr/Kr34WYwAaKwzr5SUTmyb0a4EyUjYY9o1iz/VSx 1493263767
Received: from localhost (flamenco.cs.columbia.edu [128.59.20.216])
	by mail.messagingengine.com (Postfix) with ESMTPA id 241EF24765;
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
Subject: [PATCH v4 04/11] tcg: export tcg_gen_lookup_and_goto_ptr
Date: Wed, 26 Apr 2017 23:29:17 -0400
Message-Id: <1493263764-18657-5-git-send-email-cota@braap.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1493263764-18657-1-git-send-email-cota@braap.org>
References: <1493263764-18657-1-git-send-email-cota@braap.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 08MPUfXIfCgY

Instead of exporting goto_ptr directly to TCG frontends, export
tcg_gen_lookup_and_goto_ptr(), which calls goto_ptr with the pointer
returned by the lookup_tb_ptr() helper. This is the only use case
we have for goto_ptr and lookup_tb_ptr, so having this function is
very convenient. Furthermore, it trivially allows us to avoid calling
the lookup helper if goto_ptr is not implemented by the backend.

Suggested-by: Richard Henderson <rth@twiddle.net>
Reviewed-by: Richard Henderson <rth@twiddle.net>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Emilio G. Cota <cota@braap.org>
---
 tcg/README   |  8 ++++++++
 tcg/tcg-op.c | 13 +++++++++++++
 tcg/tcg-op.h | 11 +++++++++++
 3 files changed, 32 insertions(+)

diff --git a/tcg/README b/tcg/README
index a9858c2..bf49e82 100644
--- a/tcg/README
+++ b/tcg/README
@@ -477,6 +477,14 @@ current TB was linked to this TB. Otherwise execute the next
 instructions. Only indices 0 and 1 are valid and tcg_gen_goto_tb may be issued
 at most once with each slot index per TB.
 
+* lookup_and_goto_ptr tb_addr
+
+Look up a TB address ('tb_addr') and jump to it if valid. If not valid,
+jump to the TCG epilogue to go back to the exec loop.
+
+This operation is optional. If the TCG backend does not implement the
+goto_ptr opcode, emitting this op is equivalent to emitting exit_tb(0).
+
 * qemu_ld_i32/i64 t0, t1, flags, memidx
 * qemu_st_i32/i64 t0, t1, flags, memidx
 
diff --git a/tcg/tcg-op.c b/tcg/tcg-op.c
index 95a39b7..8ff1eaf 100644
--- a/tcg/tcg-op.c
+++ b/tcg/tcg-op.c
@@ -2587,6 +2587,19 @@ void tcg_gen_goto_tb(unsigned idx)
     tcg_gen_op1i(INDEX_op_goto_tb, idx);
 }
 
+void tcg_gen_lookup_and_goto_ptr(TCGv addr)
+{
+    if (TCG_TARGET_HAS_goto_ptr) {
+        TCGv_ptr ptr = tcg_temp_new_ptr();
+
+        gen_helper_lookup_tb_ptr(ptr, tcg_ctx.tcg_env, addr);
+        tcg_gen_op1i(INDEX_op_goto_ptr, GET_TCGV_PTR(ptr));
+        tcg_temp_free_ptr(ptr);
+    } else {
+        tcg_gen_exit_tb(0);
+    }
+}
+
 static inline TCGMemOp tcg_canonicalize_memop(TCGMemOp op, bool is64, bool st)
 {
     /* Trigger the asserts within as early as possible.  */
diff --git a/tcg/tcg-op.h b/tcg/tcg-op.h
index c68e300..5d3278f 100644
--- a/tcg/tcg-op.h
+++ b/tcg/tcg-op.h
@@ -796,6 +796,17 @@ static inline void tcg_gen_exit_tb(uintptr_t val)
  */
 void tcg_gen_goto_tb(unsigned idx);
 
+/**
+ * tcg_gen_lookup_and_goto_ptr() - look up a TB and jump to it if valid
+ * @addr: Guest address of the target TB
+ *
+ * If the TB is not valid, jump to the epilogue.
+ *
+ * This operation is optional. If the TCG backend does not implement goto_ptr,
+ * this op is equivalent to calling tcg_gen_exit_tb() with 0 as the argument.
+ */
+void tcg_gen_lookup_and_goto_ptr(TCGv addr);
+
 #if TARGET_LONG_BITS == 32
 #define tcg_temp_new() tcg_temp_new_i32()
 #define tcg_global_reg_new tcg_global_reg_new_i32
-- 
2.7.4
