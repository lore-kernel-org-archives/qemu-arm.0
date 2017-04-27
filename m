Received: by 10.25.0.144 with SMTP id 138csp572114lfa;
        Wed, 26 Apr 2017 20:29:27 -0700 (PDT)
X-Received: by 10.200.45.122 with SMTP id o55mr3000906qta.203.1493263767654;
        Wed, 26 Apr 2017 20:29:27 -0700 (PDT)
Return-Path: <cota@braap.org>
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com. [66.111.4.28])
        by mx.google.com with ESMTPS id z66si1530377qkb.47.2017.04.26.20.29.27
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 26 Apr 2017 20:29:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of cota@braap.org designates 66.111.4.28 as permitted sender) client-ip=66.111.4.28;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@braap.org;
       dkim=pass header.i=@messagingengine.com;
       spf=pass (google.com: domain of cota@braap.org designates 66.111.4.28 as permitted sender) smtp.mailfrom=cota@braap.org
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id 05AF9209BB;
	Wed, 26 Apr 2017 23:29:27 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
  by compute4.internal (MEProxy); Wed, 26 Apr 2017 23:29:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=braap.org; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-sender
	:x-me-sender:x-sasl-enc:x-sasl-enc; s=mesmtp; bh=un0wB+6T/PyIrof
	M/b1FaXHI8mMnu4bb1phNbAIG6vA=; b=sdqKlh/egEis7wJh0D8MdEUvxmWJkOL
	HG8MZrW9vG0fLzMGYgTqfmWYG7ijUpJngaZVXcZKDD3MeCv3EG7ijR+FpfZLBVlN
	/4EuhDsrWPQtWpYZ7JfRwUq8D2BW+sVLtKZseCDqg9vI/SjUdQhydWlMTThisHPY
	UgZDfY5twW9k=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:date:from:in-reply-to:message-id:mime-version:references
	:subject:to:x-me-sender:x-me-sender:x-sasl-enc:x-sasl-enc; s=
	fm1; bh=un0wB+6T/PyIrofM/b1FaXHI8mMnu4bb1phNbAIG6vA=; b=CRrL53j9
	LW8P/ARNZ8OYn1fX3SHpJydRgFQbyGuh8f2N2UdarqhH10HVTf5uMl2gM5QAX9d8
	75Yl0rrLxC+8rSG7eCTMVOug3hxdCydh5gfYipzVILbw9bXwPIgtI0ZodzKYzgXX
	uslAH3urz79OX+uMOK3XbI0lHkn4fC4NZ8yijX5GLnPqxb8C1bj8bIvYqBO8O9fG
	HnjKSt7uRlWxRiiGzprIT1eh4c5/Tqull4BmJb62bsPgnhvLxjei2w4klbYEaPBu
	/9SHJXC/DDyIUEtgiFO58u9K5e7g0Snk0J4PMHvQsYkEdpnYF65qXWGyunXg6VdH
	6rdKtgUpS60z+g==
X-ME-Sender: <xms:lmUBWRS0MBoi5lE3Q95pF5sOfz70eGSLbvq3wRN9g172Jtm6Buf-Sg>
X-Sasl-enc: L71Pbt+8jzjfT+6G2CeuHFYhaxC+XclUw08PHU7M6/o+ 1493263766
Received: from localhost (flamenco.cs.columbia.edu [128.59.20.216])
	by mail.messagingengine.com (Postfix) with ESMTPA id B678E24765;
	Wed, 26 Apr 2017 23:29:26 -0400 (EDT)
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
Subject: [PATCH v4 02/11] tcg-runtime: add lookup_tb_ptr helper
Date: Wed, 26 Apr 2017 23:29:15 -0400
Message-Id: <1493263764-18657-3-git-send-email-cota@braap.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1493263764-18657-1-git-send-email-cota@braap.org>
References: <1493263764-18657-1-git-send-email-cota@braap.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: TcwA+1MvqJYM

This paves the way for upcoming work.

Reviewed-by: Richard Henderson <rth@twiddle.net>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Emilio G. Cota <cota@braap.org>
---
 tcg-runtime.c     | 24 ++++++++++++++++++++++++
 tcg/tcg-runtime.h |  2 ++
 tcg/tcg.h         |  1 +
 3 files changed, 27 insertions(+)

diff --git a/tcg-runtime.c b/tcg-runtime.c
index 4c60c96..8a24bdd 100644
--- a/tcg-runtime.c
+++ b/tcg-runtime.c
@@ -27,6 +27,7 @@
 #include "exec/helper-proto.h"
 #include "exec/cpu_ldst.h"
 #include "exec/exec-all.h"
+#include "exec/tb-hash.h"
 
 /* 32-bit helpers */
 
@@ -141,6 +142,29 @@ uint64_t HELPER(ctpop_i64)(uint64_t arg)
     return ctpop64(arg);
 }
 
+void *HELPER(lookup_tb_ptr)(CPUArchState *env, target_ulong addr)
+{
+    CPUState *cpu = ENV_GET_CPU(env);
+    TranslationBlock *tb;
+    target_ulong cs_base, pc;
+    uint32_t flags;
+
+    tb = atomic_rcu_read(&cpu->tb_jmp_cache[tb_jmp_cache_hash_func(addr)]);
+    if (likely(tb)) {
+        cpu_get_tb_cpu_state(env, &pc, &cs_base, &flags);
+        if (likely(tb->pc == addr && tb->cs_base == cs_base &&
+                   tb->flags == flags)) {
+            return tb->tc_ptr;
+        }
+        tb = tb_htable_lookup(cpu, pc, cs_base, flags);
+        if (likely(tb)) {
+            atomic_set(&cpu->tb_jmp_cache[tb_jmp_cache_hash_func(addr)], tb);
+            return tb->tc_ptr;
+        }
+    }
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
