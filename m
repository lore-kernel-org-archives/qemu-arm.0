Received: by 10.25.0.144 with SMTP id 138csp572113lfa;
        Wed, 26 Apr 2017 20:29:27 -0700 (PDT)
X-Received: by 10.55.187.132 with SMTP id l126mr2801584qkf.236.1493263767450;
        Wed, 26 Apr 2017 20:29:27 -0700 (PDT)
Return-Path: <cota@braap.org>
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com. [66.111.4.28])
        by mx.google.com with ESMTPS id u23si1532452qtc.142.2017.04.26.20.29.27
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 26 Apr 2017 20:29:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of cota@braap.org designates 66.111.4.28 as permitted sender) client-ip=66.111.4.28;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@braap.org;
       dkim=pass header.i=@messagingengine.com;
       spf=pass (google.com: domain of cota@braap.org designates 66.111.4.28 as permitted sender) smtp.mailfrom=cota@braap.org
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id C6427209B7;
	Wed, 26 Apr 2017 23:29:26 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
  by compute4.internal (MEProxy); Wed, 26 Apr 2017 23:29:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=braap.org; h=cc
	:date:from:in-reply-to:message-id:references:subject:to
	:x-me-sender:x-me-sender:x-sasl-enc:x-sasl-enc; s=mesmtp; bh=LTg
	I8+SQUQtgdJbjg+armFqNHmkMOGbYMur40xS1XZs=; b=m9vk/645WHxkgK3y6S4
	+YDdrmj8yZwXl3Ol6L5yUiTy9n8v5W3wp+kG5rLTY2LpxzjQewtvGGwLYVvHd0Zs
	2Mw0zpQ/hO9wYi3M8sVJKsjtBYh2RNs8cYkclXO0Vbq88nqTtloMTlVKpG/3ChUd
	zzW14mx6CcfntEYJxDroGYfE=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:date:from:in-reply-to:message-id
	:references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
	:x-sasl-enc; s=fm1; bh=LTgI8+SQUQtgdJbjg+armFqNHmkMOGbYMur40xS1X
	Zs=; b=QHRufICwRQPV2mFDDxAzVQcXcwv0gBdUHe4HdTArGLh/J56GHQOtNO3/u
	5t0mhssRs/m1Lxfvbl0hULrJAo/XibwPNlXDMWPnzvNdhu75NOZ6k+NKILf6YwuP
	bF3zPKxoHJmaNWTMArcY4oxrWmqTz0xXcpseBao550YoFsx6I46l9ph0M6A7sGPO
	X1vhKhWBCWflsTqs4CBdlPY6mfNlPLfqXoCJL4pXpRbXL5N7DQpJeTw27JLEGB2p
	dnDejAUQmNhJTYpoDrf9L4Zar1+VkP1Hp6Hc+hG1OgsKbt+bJ6iKA2FU98bq/Hbz
	DfZJLKak6LnA2R0gaqddzsXRLqH/g==
X-ME-Sender: <xms:lmUBWe9qIKBy2LPJ_8yZhL4FkQI2hjnmSVJ_fLfiJVBnolBWk9Q26Q>
X-Sasl-enc: L71SY92giyTeW/WH0SGuHFYhaxC+XclUw08PHU7M6/o+ 1493263766
Received: from localhost (flamenco.cs.columbia.edu [128.59.20.216])
	by mail.messagingengine.com (Postfix) with ESMTPA id 825587E442;
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
Subject: [PATCH v4 01/11] exec-all: export tb_htable_lookup
Date: Wed, 26 Apr 2017 23:29:14 -0400
Message-Id: <1493263764-18657-2-git-send-email-cota@braap.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1493263764-18657-1-git-send-email-cota@braap.org>
References: <1493263764-18657-1-git-send-email-cota@braap.org>
X-TUID: VW3veXYsudsU

Signed-off-by: Emilio G. Cota <cota@braap.org>
---
 cpu-exec.c              | 6 ++----
 include/exec/exec-all.h | 2 ++
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/cpu-exec.c b/cpu-exec.c
index 63a56d0..5b181c1 100644
--- a/cpu-exec.c
+++ b/cpu-exec.c
@@ -309,10 +309,8 @@ static bool tb_cmp(const void *p, const void *d)
     return false;
 }
 
-static TranslationBlock *tb_htable_lookup(CPUState *cpu,
-                                          target_ulong pc,
-                                          target_ulong cs_base,
-                                          uint32_t flags)
+TranslationBlock *tb_htable_lookup(CPUState *cpu, target_ulong pc,
+                                   target_ulong cs_base, uint32_t flags)
 {
     tb_page_addr_t phys_pc;
     struct tb_desc desc;
diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
index bcde1e6..87ae10b 100644
--- a/include/exec/exec-all.h
+++ b/include/exec/exec-all.h
@@ -368,6 +368,8 @@ struct TranslationBlock {
 void tb_free(TranslationBlock *tb);
 void tb_flush(CPUState *cpu);
 void tb_phys_invalidate(TranslationBlock *tb, tb_page_addr_t page_addr);
+TranslationBlock *tb_htable_lookup(CPUState *cpu, target_ulong pc,
+                                   target_ulong cs_base, uint32_t flags);
 
 #if defined(USE_DIRECT_JUMP)
 
-- 
2.7.4
