Received: by 10.25.0.144 with SMTP id 138csp133477lfa;
        Tue, 25 Apr 2017 23:23:31 -0700 (PDT)
X-Received: by 10.55.158.143 with SMTP id h137mr14753433qke.173.1493187811616;
        Tue, 25 Apr 2017 23:23:31 -0700 (PDT)
Return-Path: <cota@braap.org>
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com. [66.111.4.28])
        by mx.google.com with ESMTPS id t33si24576043qtd.220.2017.04.25.23.23.31
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 25 Apr 2017 23:23:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of cota@braap.org designates 66.111.4.28 as permitted sender) client-ip=66.111.4.28;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@braap.org;
       dkim=pass header.i=@messagingengine.com;
       spf=pass (google.com: domain of cota@braap.org designates 66.111.4.28 as permitted sender) smtp.mailfrom=cota@braap.org
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id 2D79821C9F;
	Wed, 26 Apr 2017 02:23:31 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
  by compute4.internal (MEProxy); Wed, 26 Apr 2017 02:23:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=braap.org; h=cc
	:date:from:in-reply-to:message-id:references:subject:to
	:x-me-sender:x-me-sender:x-sasl-enc:x-sasl-enc; s=mesmtp; bh=cqt
	4P12yd8eMB0Cc/rCpxhrES6uXYFxJNF0pVOpZJPM=; b=pHisjKcvWn+t3OYLGmj
	c6HuyTC/nPIP59cQpLU/04MInudjWksAtccZNbk8hMm7H7Q3vIDz6nOxUHnGZHCr
	nV+c34/Gh/UIj1nBMUfqL8Rz6BWCi0cZ5C8qaWR26nitBjYnhiPd2rq4S0HWwkOO
	64P7qjzWJmPFrSzpg59cUhdE=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:date:from:in-reply-to:message-id
	:references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
	:x-sasl-enc; s=fm1; bh=cqt4P12yd8eMB0Cc/rCpxhrES6uXYFxJNF0pVOpZJ
	PM=; b=qFzFupocXj3GqAs2E1Wgm6EntaAJ3GzqCDaURgjiP29gYf37Uoos/n96/
	+IQcstgt4mVxuMhjJ8xIL0z9QiTYf0x20++0UgvZpTMjQewoGbsb2l6DlCDJIYNJ
	Xmph1NyVX/jVYMEn1qe/gop5o1eVP82la0pFmaMs6Puq+UzrhOI4h8bN7fjGDJv5
	Rl4BSRkkwQeuf2W82uLQiJQj0R3U+kmmajR82AMNjj3htuSJBRCzEZh8FN2jp1ZL
	d1c4gOn/5wi7tyTehYbd2EZ8SW9Dd97Gpvpvk20NiFvWxkfiXeIkefakfHYkayXk
	P7s4Uabzio08g8RQxMfk4aCByNomw==
X-ME-Sender: <xms:4zwAWT-Ouhad1opfLCpGlioMUz91KdYHQOBMktyKZFXZZ1tzRc6c-A>
X-Sasl-enc: Se0nGs1zfgbQMVqH2YMcbnkOWoRYLQKgCXwdP7MdiM1v 1493187810
Received: from localhost (flamenco.cs.columbia.edu [128.59.20.216])
	by mail.messagingengine.com (Postfix) with ESMTPA id BD2A67E0A4;
	Wed, 26 Apr 2017 02:23:30 -0400 (EDT)
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
Subject: [PATCH v3 03/10] tcg: export tcg_gen_lookup_and_goto_ptr
Date: Wed, 26 Apr 2017 02:23:16 -0400
Message-Id: <1493187803-4510-4-git-send-email-cota@braap.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1493187803-4510-1-git-send-email-cota@braap.org>
References: <1493187803-4510-1-git-send-email-cota@braap.org>
X-TUID: qYGbu+GBfe82

Instead of exporting goto_ptr directly to TCG frontends, export
tcg_gen_lookup_and_goto_ptr(), which calls goto_ptr with the pointer
returned by the lookup_tb_ptr() helper. This is the only use case
we have for goto_ptr and lookup_tb_ptr, so having this function is
very convenient. Furthermore, it trivially allows us to avoid calling
the lookup helper if goto_ptr is not implemented by the backend.

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
