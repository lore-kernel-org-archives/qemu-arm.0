Received: by 10.25.0.144 with SMTP id 138csp133473lfa;
        Tue, 25 Apr 2017 23:23:31 -0700 (PDT)
X-Received: by 10.233.222.3 with SMTP id s3mr32671244qkf.17.1493187811040;
        Tue, 25 Apr 2017 23:23:31 -0700 (PDT)
Return-Path: <cota@braap.org>
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com. [66.111.4.28])
        by mx.google.com with ESMTPS id b30si24590974qte.154.2017.04.25.23.23.30
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 25 Apr 2017 23:23:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of cota@braap.org designates 66.111.4.28 as permitted sender) client-ip=66.111.4.28;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@braap.org;
       dkim=pass header.i=@messagingengine.com;
       spf=pass (google.com: domain of cota@braap.org designates 66.111.4.28 as permitted sender) smtp.mailfrom=cota@braap.org
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id 9905321CBE;
	Wed, 26 Apr 2017 02:23:30 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
  by compute4.internal (MEProxy); Wed, 26 Apr 2017 02:23:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=braap.org; h=cc
	:date:from:in-reply-to:message-id:references:subject:to
	:x-me-sender:x-me-sender:x-sasl-enc:x-sasl-enc; s=mesmtp; bh=znh
	YymT2jwNXO2D7r87K+U4zrPFbSFp/JZ1A9bvCotM=; b=c1tId1mGfxrAe5rO/KD
	3kFIRo/Qr5MXJzX72QNsqpJhunp2KwrfLYctY4Enp7XhN/XNK0g0SoOEPLxYftle
	GNX8ij33hnk6nnE1mSULEez0J4rqmbX7QW9p1vfPwiRkp+LwxCQVv1sFm0KSOdQe
	Jx9RynmSL5dwF9qYcVQhG1V0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:date:from:in-reply-to:message-id
	:references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
	:x-sasl-enc; s=fm1; bh=znhYymT2jwNXO2D7r87K+U4zrPFbSFp/JZ1A9bvCo
	tM=; b=q8dSz76fwBPYWFQGchP8aaZG1jjRzWOO2FkQIYC2dahx2B33yZ0MjToe5
	WM8SHVdXKCkPUQgsn7Ox36iIRmivvA/b/kBSK9FDnylaVamuzkJIUn7Asns8n5i7
	BJVAd6P6L2E1oUJYRMTeXeJe4ugixurO3d3JSofU+LNYw/ifoNvx83lhGF3d9tDh
	v+VD7snya9rOswXAKJwf/M1rCe/POxdYryL4+kCGLzIQ+iPoTcI3aLrckRvQWNr9
	2ufPDMe7/YNuikUvAu6qdGVflYaBYsrXqzODFIqvUdRMivyhMH1eAAnL1FmDqzFK
	sZSQk2NutaJrm3WM3MM5aXNS3qe6Q==
X-ME-Sender: <xms:4jwAWTU_mfHgKrYLSEqY0wPHxbDtfX3jyrvsO2SSFwKhp96w13EJzQ>
X-Sasl-enc: Se0gEdV2ewrGP02Vx4YcbnkOWoRYLQKgCXwdP7MdiM1v 1493187810
Received: from localhost (flamenco.cs.columbia.edu [128.59.20.216])
	by mail.messagingengine.com (Postfix) with ESMTPA id 5D2237E43A;
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
Subject: [PATCH v3 01/10] tcg-runtime: add lookup_tb_ptr helper
Date: Wed, 26 Apr 2017 02:23:14 -0400
Message-Id: <1493187803-4510-2-git-send-email-cota@braap.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1493187803-4510-1-git-send-email-cota@braap.org>
References: <1493187803-4510-1-git-send-email-cota@braap.org>
X-TUID: Vc3Dps0UR8zy

This paves the way for upcoming work.

Reviewed-by: Richard Henderson <rth@twiddle.net>
Signed-off-by: Emilio G. Cota <cota@braap.org>
---
 tcg-runtime.c     | 21 +++++++++++++++++++++
 tcg/tcg-runtime.h |  2 ++
 tcg/tcg.h         |  1 +
 3 files changed, 24 insertions(+)

diff --git a/tcg-runtime.c b/tcg-runtime.c
index 4c60c96..90d2d4b 100644
--- a/tcg-runtime.c
+++ b/tcg-runtime.c
@@ -27,6 +27,7 @@
 #include "exec/helper-proto.h"
 #include "exec/cpu_ldst.h"
 #include "exec/exec-all.h"
+#include "exec/tb-hash.h"
 
 /* 32-bit helpers */
 
@@ -141,6 +142,26 @@ uint64_t HELPER(ctpop_i64)(uint64_t arg)
     return ctpop64(arg);
 }
 
+void *HELPER(lookup_tb_ptr)(CPUArchState *env, target_ulong addr)
+{
+    CPUState *cpu = ENV_GET_CPU(env);
+    TranslationBlock *tb;
+    target_ulong cs_base, pc;
+    uint32_t flags;
+
+    if (unlikely(atomic_read(&cpu->exit_request))) {
+        goto out_epilogue;
+    }
+    cpu_get_tb_cpu_state(env, &pc, &cs_base, &flags);
+    tb = atomic_rcu_read(&cpu->tb_jmp_cache[tb_jmp_cache_hash_func(addr)]);
+    if (likely(tb && tb->pc == addr && tb->cs_base == cs_base &&
+               tb->flags == flags)) {
+        return tb->tc_ptr;
+    }
+ out_epilogue:
+    return tcg_ctx.code_gen_epilogue;
+}
+
 void HELPER(exit_atomic)(CPUArchState *env)
 {
     cpu_loop_exit_atomic(ENV_GET_CPU(env), GETPC());
diff --git a/tcg/tcg-runtime.h b/tcg/tcg-runtime.h
index 114ea6f..c41d38a 100644
--- a/tcg/tcg-runtime.h
+++ b/tcg/tcg-runtime.h
@@ -24,6 +24,8 @@ DEF_HELPER_FLAGS_1(clrsb_i64, TCG_CALL_NO_RWG_SE, i64, i64)
 DEF_HELPER_FLAGS_1(ctpop_i32, TCG_CALL_NO_RWG_SE, i32, i32)
 DEF_HELPER_FLAGS_1(ctpop_i64, TCG_CALL_NO_RWG_SE, i64, i64)
 
+DEF_HELPER_FLAGS_2(lookup_tb_ptr, TCG_CALL_NO_WG_SE, ptr, env, tl)
+
 DEF_HELPER_FLAGS_1(exit_atomic, TCG_CALL_NO_WG, noreturn, env)
 
 #ifdef CONFIG_SOFTMMU
diff --git a/tcg/tcg.h b/tcg/tcg.h
index 6c216bb..5ec48d1 100644
--- a/tcg/tcg.h
+++ b/tcg/tcg.h
@@ -699,6 +699,7 @@ struct TCGContext {
        extension that allows arithmetic on void*.  */
     int code_gen_max_blocks;
     void *code_gen_prologue;
+    void *code_gen_epilogue;
     void *code_gen_buffer;
     size_t code_gen_buffer_size;
     void *code_gen_ptr;
-- 
2.7.4
