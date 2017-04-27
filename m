Received: by 10.25.0.144 with SMTP id 138csp572124lfa;
        Wed, 26 Apr 2017 20:29:28 -0700 (PDT)
X-Received: by 10.55.126.130 with SMTP id z124mr2753912qkc.311.1493263768412;
        Wed, 26 Apr 2017 20:29:28 -0700 (PDT)
Return-Path: <cota@braap.org>
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com. [66.111.4.28])
        by mx.google.com with ESMTPS id z92si1519573qtd.197.2017.04.26.20.29.28
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 26 Apr 2017 20:29:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of cota@braap.org designates 66.111.4.28 as permitted sender) client-ip=66.111.4.28;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@braap.org;
       dkim=pass header.i=@messagingengine.com;
       spf=pass (google.com: domain of cota@braap.org designates 66.111.4.28 as permitted sender) smtp.mailfrom=cota@braap.org
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id BEBFA209C5;
	Wed, 26 Apr 2017 23:29:27 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
  by compute4.internal (MEProxy); Wed, 26 Apr 2017 23:29:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=braap.org; h=cc
	:date:from:in-reply-to:message-id:references:subject:to
	:x-me-sender:x-me-sender:x-sasl-enc:x-sasl-enc; s=mesmtp; bh=bKf
	KCRDHbK2tndXvtx/Z37DY0jqzp1GeJcUMTXEwdic=; b=KzcZZY9f9Jp/Bb1ukyM
	L1F/LwR4GEPuoZQECSa9GKLOg0qVAeaXTdSFMSv56kwHNnwOlFCHfqypfPOvvSbt
	0AOyZAsnNfS9qSqJHt+RCt3UYzchFDiKV3RfDIaJFugfZ/6aUY+cSPP2H48Sgzal
	fw8f9L07NlZR0gOebPJj9aPk=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:date:from:in-reply-to:message-id
	:references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
	:x-sasl-enc; s=fm1; bh=bKfKCRDHbK2tndXvtx/Z37DY0jqzp1GeJcUMTXEwd
	ic=; b=BelzoM1WWKDFZ1cwj798nUbKu5Tri54DG/WBW9YHhJlLmviQDU8Wf5EJi
	EocFb3JK2dnVGEptyxzKYcm3Vj5v/w7E+EMQjVcmZIfFRx8o5tsfLu+pTfuuHPDr
	igkYX0tOANYqd++Pt7ypbI80zdU83T7BzJI4erKn0dd8BJ2hITVyZ4iIZXLlqwmz
	GgN4xxGKcn5KZM2mI+hNC6EPqtTSta1cstlcJDwBjNJCXKsr4v6xh9cECyqvvVqQ
	P9ytSl/JEROwQA+8Y4P33fmCsFsF5HJ4c73j3QyDOrO9k5CkMJyRwCNkDcImspS/
	+AIsn32ARn2U+8z1zN+oDQ4tmIodQ==
X-ME-Sender: <xms:l2UBWUAGiJNZLIdDHdlJDtxFPOEBCEqeN5v66j95_i9yi1Q-W_tL1Q>
X-Sasl-enc: hcoarO2v1ouWzBmbyDj5SUTmyb0a4EyUjYY9o1iz/VSx 1493263767
Received: from localhost (flamenco.cs.columbia.edu [128.59.20.216])
	by mail.messagingengine.com (Postfix) with ESMTPA id 80A012471A;
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
Subject: [PATCH v4 06/11] target/arm: optimize cross-page direct jumps in softmmu
Date: Wed, 26 Apr 2017 23:29:19 -0400
Message-Id: <1493263764-18657-7-git-send-email-cota@braap.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1493263764-18657-1-git-send-email-cota@braap.org>
References: <1493263764-18657-1-git-send-email-cota@braap.org>
X-TUID: RO0VtGlDVtLH

Instead of unconditionally exiting to the exec loop, use the
lookup_and_goto_ptr helper to jump to the target if it is valid.

Perf impact: see next commit's log.

Reviewed-by: Richard Henderson <rth@twiddle.net>
Signed-off-by: Emilio G. Cota <cota@braap.org>
---
 target/arm/translate.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index e32e38c..02cad96 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -4085,8 +4085,12 @@ static inline void gen_goto_tb(DisasContext *s, int n, target_ulong dest)
         gen_set_pc_im(s, dest);
         tcg_gen_exit_tb((uintptr_t)s->tb + n);
     } else {
+        TCGv addr = tcg_temp_new();
+
         gen_set_pc_im(s, dest);
-        tcg_gen_exit_tb(0);
+        tcg_gen_extu_i32_tl(addr, cpu_R[15]);
+        tcg_gen_lookup_and_goto_ptr(addr);
+        tcg_temp_free(addr);
     }
 }
 
-- 
2.7.4
