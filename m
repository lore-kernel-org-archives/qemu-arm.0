Received: by 10.25.0.144 with SMTP id 138csp89159lfa;
        Tue, 11 Apr 2017 18:17:48 -0700 (PDT)
X-Received: by 10.237.62.46 with SMTP id l43mr22052380qtf.88.1491959868190;
        Tue, 11 Apr 2017 18:17:48 -0700 (PDT)
Return-Path: <cota@braap.org>
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com. [66.111.4.25])
        by mx.google.com with ESMTPS id t62si17944212qkc.177.2017.04.11.18.17.47
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 11 Apr 2017 18:17:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of cota@braap.org designates 66.111.4.25 as permitted sender) client-ip=66.111.4.25;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@braap.org;
       dkim=pass header.i=@messagingengine.com;
       spf=pass (google.com: domain of cota@braap.org designates 66.111.4.25 as permitted sender) smtp.mailfrom=cota@braap.org
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id 0CBA120B5F;
	Tue, 11 Apr 2017 21:17:47 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
  by compute4.internal (MEProxy); Tue, 11 Apr 2017 21:17:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=braap.org; h=cc
	:date:from:in-reply-to:message-id:references:subject:to
	:x-me-sender:x-me-sender:x-sasl-enc:x-sasl-enc; s=mesmtp; bh=FHV
	879t6kYzIF3kjiS1A3wMW1cEkA+YddMExwl10tQM=; b=ooir3iLI7mjSLpcu1bI
	MwQrRwrxJvY+kmh9937yxBit8y+0zpE9S5Ir6uBC4tUItkaqJMWtuDiXx3bX8Ozw
	XFKQIzf+DzR+NnJyYqb+JP3TxWRvZYc0rxvC4en1yDW2fGBWNh+hBcAka1k2dy34
	DlwvJEmeAmcDFEsp5M+km/Nw=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:date:from:in-reply-to:message-id
	:references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
	:x-sasl-enc; s=fm1; bh=FHV879t6kYzIF3kjiS1A3wMW1cEkA+YddMExwl10t
	QM=; b=lUaT10XWcZyBQyHEs02OCZuV6XDBTwTUB2KE/bHE9W4zAxAiv/xnhLHUD
	cOE0ROGkoVND3+LdEf5njd4toyFUZl4Ul6fbQ62OE3sVG40vyAYxo16QXjfsRcsU
	gRg/gHGetuib0nJC3jJkPkGE2xRD7R8w/3wzA7JFQu4rFmuJdA1OXGZvZ9bya2qS
	T84lZVgmFXrwsI0G5ShHr/xErCyublxxFWYwNfaIt37QNiezxQ23UPxogMqY6cm4
	0scdYwTQXiLkLyPr62Ft2QlKGQkGO1SQx91s5QlssdnsAO27Yd85MmpCfrvQz4uM
	hM/JQpl1u+WdJ2xBCHZLO0P+ngZrw==
X-ME-Sender: <xms:OoDtWFpvR75V7xRogqR3bVqhz7qsjjQj3UhInfXxGgzQYvQUSXnMdA>
X-Sasl-enc: lc4V+0S6agwHgrQWVWKtgQkKErDIxaFwR3n+DYN/qAw9 1491959866
Received: from localhost (flamenco.cs.columbia.edu [128.59.20.216])
	by mail.messagingengine.com (Postfix) with ESMTPA id BFDB1241ED;
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
Subject: [PATCH 02/10] exec-all: inline tb_from_jmp_cache
Date: Tue, 11 Apr 2017 21:17:22 -0400
Message-Id: <1491959850-30756-3-git-send-email-cota@braap.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1491959850-30756-1-git-send-email-cota@braap.org>
References: <1491959850-30756-1-git-send-email-cota@braap.org>
X-TUID: bhGn7WM8ScxL

The inline improves performance, as shown in subsequent commits' logs.

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
index ce9750a..748cb66 100644
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
