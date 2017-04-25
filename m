Received: by 10.25.0.144 with SMTP id 138csp1748172lfa;
        Tue, 25 Apr 2017 00:54:09 -0700 (PDT)
X-Received: by 10.237.61.5 with SMTP id g5mr33231182qtf.179.1493106849779;
        Tue, 25 Apr 2017 00:54:09 -0700 (PDT)
Return-Path: <cota@braap.org>
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com. [66.111.4.28])
        by mx.google.com with ESMTPS id n187si21138897qkc.126.2017.04.25.00.54.09
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 25 Apr 2017 00:54:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of cota@braap.org designates 66.111.4.28 as permitted sender) client-ip=66.111.4.28;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@braap.org;
       dkim=pass header.i=@messagingengine.com;
       spf=pass (google.com: domain of cota@braap.org designates 66.111.4.28 as permitted sender) smtp.mailfrom=cota@braap.org
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id 1561821F27;
	Tue, 25 Apr 2017 03:54:04 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
  by compute4.internal (MEProxy); Tue, 25 Apr 2017 03:54:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=braap.org; h=cc
	:date:from:in-reply-to:message-id:references:subject:to
	:x-me-sender:x-me-sender:x-sasl-enc:x-sasl-enc; s=mesmtp; bh=Jix
	Jy7yYijVMjf62Jc70ezCslLHadK66n72hzWnGTts=; b=fWQsJTpqYth6QiLjTu4
	4jP2ljKdIRLQuoH+8vVTeV9uWSSp6e/GTAZf2Scy+RGhLy6rq/vkJJNiyzd1uWZ3
	hjRbJH2uMclqBWuMF4ivoAWeYv8Wxk8YOrjFsIhsY2PXOQ3gR84uoumDj3lc5ASi
	jESMIj/nXJdWHprb0N+Yqedw=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:date:from:in-reply-to:message-id
	:references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
	:x-sasl-enc; s=fm1; bh=JixJy7yYijVMjf62Jc70ezCslLHadK66n72hzWnGT
	ts=; b=JFNdzMdE14Lgl0jC7KAlU+X/mNmL4bDs3wzBILYPMFeuTchH6T9tjgcTh
	w0DEy2WEq5m4do8snNWKa1Vn0aKKaZORKeYmHQ4oNOmHAgotPXK7GnAZUwSWlRif
	bFX+rt/+aXsGZE+oZlRFC1N9MVHXS+mEoEvrjQK48yMMvbDO9lVmudVSYOmIqLui
	/kwSvUO/YQhpv5aTPAjwPxaoRJRQWJCy/HIEoDgkl4U7d2jQ3lc9UH69DgjRKcLJ
	RlDe/fafQwH5684TJzK6LOl9SRJPWBu/upx6ZcEXI1Qv5XtCYBA+Kh3F9CxO4Iub
	JYwHILI7/EUf/StlJjkfQVo3uQKIw==
X-ME-Sender: <xms:nAD_WKn-Q1TnZh-G7QypGiA8EiPv7gpsTHZfxkACVqDJHzztvenANA>
X-Sasl-enc: McD5e5gLPM3vm2Z62yNR3HgI4wlwRuVbhondrqX23xnS 1493106844
Received: from localhost (flamenco.cs.columbia.edu [128.59.20.216])
	by mail.messagingengine.com (Postfix) with ESMTPA id 3010F7E0EE;
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
Subject: [PATCH v2 05/13] tcg-runtime: add lookup_tb_ptr helper
Date: Tue, 25 Apr 2017 03:53:51 -0400
Message-Id: <1493106839-10438-6-git-send-email-cota@braap.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1493106839-10438-1-git-send-email-cota@braap.org>
References: <1493106839-10438-1-git-send-email-cota@braap.org>
X-TUID: EGEQrQYCZmdl

Signed-off-by: Emilio G. Cota <cota@braap.org>
---
 tcg-runtime.c     | 7 +++++++
 tcg/tcg-runtime.h | 2 ++
 tcg/tcg.h         | 1 +
 3 files changed, 10 insertions(+)

diff --git a/tcg-runtime.c b/tcg-runtime.c
index 4c60c96..f291184 100644
--- a/tcg-runtime.c
+++ b/tcg-runtime.c
@@ -141,6 +141,13 @@ uint64_t HELPER(ctpop_i64)(uint64_t arg)
     return ctpop64(arg);
 }
 
+void *HELPER(lookup_tb_ptr)(CPUArchState *env, target_ulong addr)
+{
+    TranslationBlock *tb = tb_from_jmp_cache(env, addr);
+
+    return tb ? tb->tc_ptr : tcg_ctx.code_gen_epilogue;
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
index b26f0ef..625e2aa 100644
--- a/tcg/tcg.h
+++ b/tcg/tcg.h
@@ -647,6 +647,7 @@ struct TCGContext {
         GHashTable *helpers;
 
         void *code_gen_prologue;
+        void *code_gen_epilogue;
         void *code_gen_buffer;
         size_t code_gen_buffer_size;
 
-- 
2.7.4
