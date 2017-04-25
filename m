Received: by 10.25.0.144 with SMTP id 138csp1748151lfa;
        Tue, 25 Apr 2017 00:54:06 -0700 (PDT)
X-Received: by 10.55.45.134 with SMTP id t128mr26891054qkh.247.1493106845938;
        Tue, 25 Apr 2017 00:54:05 -0700 (PDT)
Return-Path: <cota@braap.org>
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com. [66.111.4.28])
        by mx.google.com with ESMTPS id s65si15494264qkl.337.2017.04.25.00.54.05
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 25 Apr 2017 00:54:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of cota@braap.org designates 66.111.4.28 as permitted sender) client-ip=66.111.4.28;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@braap.org;
       dkim=pass header.i=@messagingengine.com;
       spf=pass (google.com: domain of cota@braap.org designates 66.111.4.28 as permitted sender) smtp.mailfrom=cota@braap.org
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id E873821F1F;
	Tue, 25 Apr 2017 03:54:03 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
  by compute4.internal (MEProxy); Tue, 25 Apr 2017 03:54:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=braap.org; h=cc
	:date:from:in-reply-to:message-id:references:subject:to
	:x-me-sender:x-me-sender:x-sasl-enc:x-sasl-enc; s=mesmtp; bh=7Tv
	sDZZBFRCz/sC2wkCjfkLkAMw2jfzmseFj4+YhzrE=; b=kjieIErS6qZA1jKaRHk
	Q4rso3YrQpWvohMrVLRhEVyL4MyBvqj2gPDSUkSvqGcOw2EiJB3ncN0oVGayPDsM
	2HnSUSQdRiJyQqxKkDqyUcNWIZbv4mgV4seG/8HPHZlyb1fDmE7edS6ZL9Ac9/pK
	ZxaH8rm7xzcoM0yYVF/ICV2U=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:date:from:in-reply-to:message-id
	:references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
	:x-sasl-enc; s=fm1; bh=7TvsDZZBFRCz/sC2wkCjfkLkAMw2jfzmseFj4+Yhz
	rE=; b=giPtF4EkA/VvRYwDxlrGlcLeSxtqfSOcXhjrkpuTQEhOS4TGr86VzbBNh
	SMOfDBv3NFpM7QraTryLQIhEli3mgm1uhmKQ+0tCElzfNaZldqYy2q/VefCSveW8
	RLLVdH8XSR8LqktVO76eLl9PpHaQikIe2LyTcItTHG7TnqOGmaD3Zvgk4TNI/6Cw
	cm53vKs4Bo1TQ1//HU9fc3USZW9MCx8Obh5gk9OdX2JiyiWa/SeOWpGuTtuZBljo
	FtivdjoGyn05KTfuaUwDZuMbxbN/ESNtYLlIKV1+/D7BFWKi6hlzqHKiuHv+KTf5
	xxR4dWpdLhgUOewwzoBPN3G/snrbw==
X-ME-Sender: <xms:mwD_WJ2wdZ7jxKbzmH_93E8uuuQgqYs6YRJ2l8me0W-lZT9C02n9Xw>
X-Sasl-enc: ePeerizF/sFc03+8skmfcqyZu2z64H3tf2JaKdSpLtfA 1493106843
Received: from localhost (flamenco.cs.columbia.edu [128.59.20.216])
	by mail.messagingengine.com (Postfix) with ESMTPA id 7A76E24811;
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
Subject: [PATCH v2 02/13] exec-all: inline tb_from_jmp_cache
Date: Tue, 25 Apr 2017 03:53:48 -0400
Message-Id: <1493106839-10438-3-git-send-email-cota@braap.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1493106839-10438-1-git-send-email-cota@braap.org>
References: <1493106839-10438-1-git-send-email-cota@braap.org>
X-TUID: uZvM8foNYwYZ

The inline improves performance, as shown in upcoming commits' logs.

This commit is kept separate to ease review, since the inclusion
of tb-hash.h might be controversial. The problem here, which was
introduced before this commit, is that tb_hash_func() depends on
page_addr_t: this defeats the original purpose of tb-hash.h,
which was to be self-contained and CPU-agnostic.

Signed-off-by: Emilio G. Cota <cota@braap.org>
---
 cpu-exec.c              | 19 -------------------
 include/exec/exec-all.h | 24 +++++++++++++++++++++++-
 2 files changed, 23 insertions(+), 20 deletions(-)

diff --git a/cpu-exec.c b/cpu-exec.c
index b4adf16..63a56d0 100644
--- a/cpu-exec.c
+++ b/cpu-exec.c
@@ -309,25 +309,6 @@ static bool tb_cmp(const void *p, const void *d)
     return false;
 }
 
-TranslationBlock *tb_from_jmp_cache(CPUArchState *env, target_ulong vaddr)
-{
-    CPUState *cpu = ENV_GET_CPU(env);
-    TranslationBlock *tb;
-    target_ulong cs_base, pc;
-    uint32_t flags;
-
-    if (unlikely(atomic_read(&cpu->exit_request))) {
-        return NULL;
-    }
-    cpu_get_tb_cpu_state(env, &pc, &cs_base, &flags);
-    tb = atomic_rcu_read(&cpu->tb_jmp_cache[tb_jmp_cache_hash_func(vaddr)]);
-    if (likely(tb && tb->pc == vaddr && tb->cs_base == cs_base &&
-               tb->flags == flags)) {
-        return tb;
-    }
-    return NULL;
-}
-
 static TranslationBlock *tb_htable_lookup(CPUState *cpu,
                                           target_ulong pc,
                                           target_ulong cs_base,
diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
index 18b80bc..bd76987 100644
--- a/include/exec/exec-all.h
+++ b/include/exec/exec-all.h
@@ -367,7 +367,29 @@ struct TranslationBlock {
 void tb_free(TranslationBlock *tb);
 void tb_flush(CPUState *cpu);
 void tb_phys_invalidate(TranslationBlock *tb, tb_page_addr_t page_addr);
-TranslationBlock *tb_from_jmp_cache(CPUArchState *env, target_ulong vaddr);
+
+/* tb_hash_func() in tb-hash.h needs tb_page_addr_t, defined above */
+#include "tb-hash.h"
+
+static inline
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
 
 #if defined(USE_DIRECT_JUMP)
 
-- 
2.7.4
