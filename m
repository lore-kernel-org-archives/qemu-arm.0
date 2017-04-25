Received: by 10.25.0.144 with SMTP id 138csp1748148lfa;
        Tue, 25 Apr 2017 00:54:05 -0700 (PDT)
X-Received: by 10.55.125.132 with SMTP id y126mr27979716qkc.314.1493106845620;
        Tue, 25 Apr 2017 00:54:05 -0700 (PDT)
Return-Path: <cota@braap.org>
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com. [66.111.4.28])
        by mx.google.com with ESMTPS id s28si21180791qte.60.2017.04.25.00.54.05
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 25 Apr 2017 00:54:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of cota@braap.org designates 66.111.4.28 as permitted sender) client-ip=66.111.4.28;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@braap.org;
       dkim=pass header.i=@messagingengine.com;
       spf=pass (google.com: domain of cota@braap.org designates 66.111.4.28 as permitted sender) smtp.mailfrom=cota@braap.org
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id 8109421F1D;
	Tue, 25 Apr 2017 03:54:03 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
  by compute4.internal (MEProxy); Tue, 25 Apr 2017 03:54:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=braap.org; h=cc
	:date:from:in-reply-to:message-id:references:subject:to
	:x-me-sender:x-me-sender:x-sasl-enc:x-sasl-enc; s=mesmtp; bh=UOv
	20f+l1GAVhovfE4nm/88IpJJkIuWQxnw7tUCAEms=; b=v2M1NfeX/ashrxWTtaN
	I5D7nq/rCz6T3ENn8W80xZqvwrs4hlOXvMxTjltL3vLb/7gVwzYQlDI8M7ePBvhT
	YPBLGM70pqTgLwzF/s+jJWm83smZxPfj19XPSDpECG96v8wUPeR9aAtxwLhmxmb0
	hY1bJvBPvjRMsyF+5PVg8O1c=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:date:from:in-reply-to:message-id
	:references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
	:x-sasl-enc; s=fm1; bh=UOv20f+l1GAVhovfE4nm/88IpJJkIuWQxnw7tUCAE
	ms=; b=Afh44ijy/u5TMlhmNMCbf3GPKEIwXaxJXL/s+zYWLHHlBil3Cyi5cDt2Z
	CXm3VWrXVKK4CMXdR/HgIOFEqBF9L+5Odth7yW1VQc+lq7inyzho0tMEpbfJfIK9
	Qg6WSXDK48VPeoVunzov8HSkQdvqwONu5Ei4SQrYnGpqjr+TG9vbTq1E7vcOsBZI
	Fkwk9anQY316y0NM5sUUjeGR9eg4/sX7V2ucYNJx8AYDSuYwjspd86QaP7pRQeB+
	MdBCx2HG4TMRVvmG6mvco65Pahcp/qiz2FlR+EJ+LE0bTadW91Fcz4pbflt5JeIz
	c1+SYEnZOkgZVxlom1gMyEACBc8Zg==
X-ME-Sender: <xms:mwD_WNNlXhPEqLOWBpUNO3qbmvr0SBd7QqHfe4YBO0HMDjlNGO2L0g>
X-Sasl-enc: ePeeqD7T8sZF3WOmvFafcqyZu2z64H3tf2JaKdSpLtfA 1493106843
Received: from localhost (flamenco.cs.columbia.edu [128.59.20.216])
	by mail.messagingengine.com (Postfix) with ESMTPA id 386BE7E43A;
	Tue, 25 Apr 2017 03:54:03 -0400 (EDT)
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
Subject: [PATCH v2 01/13] exec-all: add tb_from_jmp_cache
Date: Tue, 25 Apr 2017 03:53:47 -0400
Message-Id: <1493106839-10438-2-git-send-email-cota@braap.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1493106839-10438-1-git-send-email-cota@braap.org>
References: <1493106839-10438-1-git-send-email-cota@braap.org>
X-TUID: xxtq01S/HJRG

This paves the way for upcoming changes.

Signed-off-by: Emilio G. Cota <cota@braap.org>
---
 cpu-exec.c              | 19 +++++++++++++++++++
 include/exec/exec-all.h |  2 +-
 2 files changed, 20 insertions(+), 1 deletion(-)

diff --git a/cpu-exec.c b/cpu-exec.c
index 63a56d0..b4adf16 100644
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
