Received: by 10.25.0.144 with SMTP id 138csp89155lfa;
        Tue, 11 Apr 2017 18:17:47 -0700 (PDT)
X-Received: by 10.200.47.16 with SMTP id j16mr3584868qta.222.1491959867330;
        Tue, 11 Apr 2017 18:17:47 -0700 (PDT)
Return-Path: <cota@braap.org>
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com. [66.111.4.25])
        by mx.google.com with ESMTPS id x123si13139429qkd.305.2017.04.11.18.17.47
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 11 Apr 2017 18:17:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of cota@braap.org designates 66.111.4.25 as permitted sender) client-ip=66.111.4.25;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@braap.org;
       dkim=pass header.i=@messagingengine.com;
       spf=pass (google.com: domain of cota@braap.org designates 66.111.4.25 as permitted sender) smtp.mailfrom=cota@braap.org
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id D58EE20B4E;
	Tue, 11 Apr 2017 21:17:46 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
  by compute4.internal (MEProxy); Tue, 11 Apr 2017 21:17:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=braap.org; h=cc
	:date:from:in-reply-to:message-id:references:subject:to
	:x-me-sender:x-me-sender:x-sasl-enc:x-sasl-enc; s=mesmtp; bh=a64
	BGNYCNc6kRlHQOx3HwajbGOXw8XrdNAZlj33XqTo=; b=B6YxeyOP/yBAnu4vpkk
	lJv7hTzXtWf6VQj1V/FPqNBwpt6muPlL/e2P7l/DCjHk7JSLzzDc0Bu1oRVTjkHk
	YEty0g5DQuWutr0edaFICRg1dRg2T72lNe2PFRO5QIQdhcVtY8EWdb+2y8pbiM9C
	fD9hJMZkAKDK9fR1JcEiaOg8=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:date:from:in-reply-to:message-id
	:references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
	:x-sasl-enc; s=fm1; bh=a64BGNYCNc6kRlHQOx3HwajbGOXw8XrdNAZlj33Xq
	To=; b=EGG352hfjtiYJEhPeAEXWbLk9AjQOCVSz+cnApqZ/7wmj/dAZFpovepjV
	lJThpF5P8dt13mfIZvriiz5X7pUWCJFeIAin3wTMd7rIsJDkbbmHLKT/orAR1lrY
	ppqeIjd3sJNNbm9eXSKI4aZJjpHlL4+BG4RGOUsVY3FZ7DtTxp6tEtDDB6FDUW7F
	Q7wpRW+QObLwdDiyoHjpnuBrltVjeg6PjBJZ6lYLYv+D2BAhKZV7doEnL11mSNdq
	yVJD6F4wzFdfwsU3sUyQH3Ace0IragoXghlteViYq63gH6FJ8IfBlCo8vxe9u/q9
	l1kkdc4ibNaVTL2CWfc6VPModmcaA==
X-ME-Sender: <xms:OoDtWJx3sG9Av3JtG1RIcbetZWnbDh-cJjmj_ElE90agegVvvSLilg>
X-Sasl-enc: lc4L516ucAULhbQJVnOtgQkKErDIxaFwR3n+DYN/qAw9 1491959866
Received: from localhost (flamenco.cs.columbia.edu [128.59.20.216])
	by mail.messagingengine.com (Postfix) with ESMTPA id 914837E43A;
	Tue, 11 Apr 2017 21:17:46 -0400 (EDT)
From: "Emilio G. Cota" <cota@braap.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	Richard Henderson <rth@twiddle.net>,
	Peter Maydell <peter.maydell@linaro.org>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Claudio Fontana <claudio.fontana@huawei.com>,
	Andrzej Zaborowski <balrogg@gmail.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Alexander Graf <agraf@suse.de>,
	Stefan Weil <sw@weilnetz.de>,
	qemu-arm@nongnu.org,
	alex.bennee@linaro.org,
	Pranith Kumar <bobby.prani+qemu@gmail.com>
Subject: [PATCH 01/10] exec-all: add tb_from_jmp_cache
Date: Tue, 11 Apr 2017 21:17:21 -0400
Message-Id: <1491959850-30756-2-git-send-email-cota@braap.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1491959850-30756-1-git-send-email-cota@braap.org>
References: <1491959850-30756-1-git-send-email-cota@braap.org>
X-TUID: dlhE5qy76g6k

This paves the way for upcoming changes.

Signed-off-by: Emilio G. Cota <cota@braap.org>
---
 cpu-exec.c              | 19 +++++++++++++++++++
 include/exec/exec-all.h |  2 +-
 2 files changed, 20 insertions(+), 1 deletion(-)

diff --git a/cpu-exec.c b/cpu-exec.c
index 748cb66..ce9750a 100644
--- a/cpu-exec.c
+++ b/cpu-exec.c
@@ -309,6 +309,25 @@ static bool tb_cmp(const void *p, const void *d)
     return false;
 }
 
+TranslationBlock *tb_from_jmp_cache(CPUArchState *env, target_ulong vaddr)
+{
+    CPUState *cpu = ENV_GET_CPU(env);
+    TranslationBlock *tb;
+    target_ulong cs_base, pc;
+    uint32_t flags;
+
+    if (unlikely(atomic_read(&cpu->exit_request))) {
+        return NULL;
+    }
+    cpu_get_tb_cpu_state(env, &pc, &cs_base, &flags);
+    tb = atomic_rcu_read(&cpu->tb_jmp_cache[tb_jmp_cache_hash_func(vaddr)]);
+    if (likely(tb && tb->pc == vaddr && tb->cs_base == cs_base &&
+               tb->flags == flags)) {
+        return tb;
+    }
+    return NULL;
+}
+
 static TranslationBlock *tb_htable_lookup(CPUState *cpu,
                                           target_ulong pc,
                                           target_ulong cs_base,
diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
index bcde1e6..18b80bc 100644
--- a/include/exec/exec-all.h
+++ b/include/exec/exec-all.h
@@ -56,7 +56,6 @@ TranslationBlock *tb_gen_code(CPUState *cpu,
                               target_ulong pc, target_ulong cs_base,
                               uint32_t flags,
                               int cflags);
-
 void QEMU_NORETURN cpu_loop_exit(CPUState *cpu);
 void QEMU_NORETURN cpu_loop_exit_restore(CPUState *cpu, uintptr_t pc);
 void QEMU_NORETURN cpu_loop_exit_atomic(CPUState *cpu, uintptr_t pc);
@@ -368,6 +367,7 @@ struct TranslationBlock {
 void tb_free(TranslationBlock *tb);
 void tb_flush(CPUState *cpu);
 void tb_phys_invalidate(TranslationBlock *tb, tb_page_addr_t page_addr);
+TranslationBlock *tb_from_jmp_cache(CPUArchState *env, target_ulong vaddr);
 
 #if defined(USE_DIRECT_JUMP)
 
-- 
2.7.4
