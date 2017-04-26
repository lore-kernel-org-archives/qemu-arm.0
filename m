Received: by 10.25.0.144 with SMTP id 138csp133492lfa;
        Tue, 25 Apr 2017 23:23:32 -0700 (PDT)
X-Received: by 10.55.175.67 with SMTP id y64mr10975256qke.194.1493187811926;
        Tue, 25 Apr 2017 23:23:31 -0700 (PDT)
Return-Path: <cota@braap.org>
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com. [66.111.4.28])
        by mx.google.com with ESMTPS id v41si24586684qtc.250.2017.04.25.23.23.31
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 25 Apr 2017 23:23:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of cota@braap.org designates 66.111.4.28 as permitted sender) client-ip=66.111.4.28;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@braap.org;
       dkim=pass header.i=@messagingengine.com;
       spf=pass (google.com: domain of cota@braap.org designates 66.111.4.28 as permitted sender) smtp.mailfrom=cota@braap.org
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id 75D3B21CD1;
	Wed, 26 Apr 2017 02:23:31 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
  by compute4.internal (MEProxy); Wed, 26 Apr 2017 02:23:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=braap.org; h=cc
	:date:from:in-reply-to:message-id:references:subject:to
	:x-me-sender:x-me-sender:x-sasl-enc:x-sasl-enc; s=mesmtp; bh=I30
	QR1pXFPanFJV5oHtvxtoNKLtMGRWno9wckulFwbE=; b=HZ7poXczArSfMyT2n14
	EOo5AtsukAg4pWJwYM8W2L9e0M4rlp+XGrKiS9DQIwSfKT3TB+IFxS8OTZl9ZznX
	X6RhvuaCno4mvcS0AcS4VojBLHoX1x0DjwIJpPfpIeo1ymtM/BPa5KrUp7D3XQ1A
	S391mAZBZSgtAcks4QCk5Gok=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:date:from:in-reply-to:message-id
	:references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
	:x-sasl-enc; s=fm1; bh=I30QR1pXFPanFJV5oHtvxtoNKLtMGRWno9wckulFw
	bE=; b=dzgNBBS6331hrUscDfgO54X/o5bMwoMXjAdTGR/vPvztA+yL1soKT1mz7
	Apf+8b1Ljrw8EG1S2vwwNJ48ze8W5P4hH0epqNKwYZsqBOfkYV71LCzwMTwR6yRP
	K14prKd026RKND1tyIEZDmGh38RIdSj+wzEU3mX4rKWqdiHEC9Cq8x0vv0S4aPcS
	F3vLzled2CbD9ZSgyIBfm+2yiX056+QH5nmu2t0gryffNWfj0jYASW8abjV254tX
	46Q/M3/zCvhITdEdeQeu+iOJ/kyJ06BXy6LfiZxT0O1ZMuTIzzRWWwpudxMYW1Mm
	cYOjHHFkmLHJCfYGK1Aj9k6P6K2xw==
X-ME-Sender: <xms:4zwAWdHB_K8qhbCIj1Aogs2FmDdBMooRFO6_QRcHptKiasLETYCDnQ>
X-Sasl-enc: TrZ+tcSl4MWDuGwI3H1dw7aYyJCDSOdJuuB+x2HTqFCJ 1493187811
Received: from localhost (flamenco.cs.columbia.edu [128.59.20.216])
	by mail.messagingengine.com (Postfix) with ESMTPA id 358BB7E320;
	Wed, 26 Apr 2017 02:23:31 -0400 (EDT)
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
Subject: [PATCH v3 05/10] target/arm: optimize cross-page direct jumps in softmmu
Date: Wed, 26 Apr 2017 02:23:18 -0400
Message-Id: <1493187803-4510-6-git-send-email-cota@braap.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1493187803-4510-1-git-send-email-cota@braap.org>
References: <1493187803-4510-1-git-send-email-cota@braap.org>
X-TUID: YA+el8CTeUO9

Instead of unconditionally exiting to the exec loop, use the
lookup_and_goto_ptr helper to jump to the target if it is valid.

Perf impact: see next commit's log.

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
