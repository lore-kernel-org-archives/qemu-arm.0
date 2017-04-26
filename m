Received: by 10.25.0.144 with SMTP id 138csp133525lfa;
        Tue, 25 Apr 2017 23:23:32 -0700 (PDT)
X-Received: by 10.55.132.65 with SMTP id g62mr35855536qkd.152.1493187812565;
        Tue, 25 Apr 2017 23:23:32 -0700 (PDT)
Return-Path: <cota@braap.org>
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com. [66.111.4.28])
        by mx.google.com with ESMTPS id a36si24626796qtb.14.2017.04.25.23.23.32
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 25 Apr 2017 23:23:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of cota@braap.org designates 66.111.4.28 as permitted sender) client-ip=66.111.4.28;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@braap.org;
       dkim=pass header.i=@messagingengine.com;
       spf=pass (google.com: domain of cota@braap.org designates 66.111.4.28 as permitted sender) smtp.mailfrom=cota@braap.org
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id 075AF21CD6;
	Wed, 26 Apr 2017 02:23:32 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
  by compute4.internal (MEProxy); Wed, 26 Apr 2017 02:23:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=braap.org; h=cc
	:date:from:in-reply-to:message-id:references:subject:to
	:x-me-sender:x-me-sender:x-sasl-enc:x-sasl-enc; s=mesmtp; bh=2dp
	ptLB1W1NDv1yVu4MCEKiQCYy2LkFN80wG8qbd2A0=; b=tJubQ8+MqlFaWfTQET5
	0oExMfqUSVkczew+jbrvPgAD5meWXVetYafJuzz6iHf3Orj4/nt34t+L/GaDu8PJ
	tQrI2HQ9kJwqJK4f0BT2gVSBIKbIUuIsGY5MD6qH5JykCTUvOHCdGNJXAmnjcEDg
	Tou6xKPcW5otX/OR+LfLl/XQ=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:date:from:in-reply-to:message-id
	:references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
	:x-sasl-enc; s=fm1; bh=2dpptLB1W1NDv1yVu4MCEKiQCYy2LkFN80wG8qbd2
	A0=; b=q5KATvrZvXdjkDEejkjJM3EAowGLirN3EAAV5tvQKgf4dl8I3cpnq8fWv
	jeF2UvOiQbWXOZZf2qLCrcpsjpVR7N9nUanRPXQaMmI4noORAgGorn524mqdVqKS
	pX7qLm1xAH5RDTTpRrur90RK1unUGfmFrBkv5cgYd6O6tbMKD5piTpO6e5OjknEW
	tdRqq8SlerfHhnIRprgNZj0c7+RD7/L/OofI9A8tXB828rrGGPAX7G6fHi8zYDCw
	D+CnIeB6BjAEOMtNkE2o5Ff9WqfLgtvNH+trk+1qj+X4m0Jm1+egX69tZjfZKK/g
	NrJbq1Q0VxL3jzKBAffyksITeuMUQ==
X-ME-Sender: <xms:4zwAWeCprw4KRfZ4NtG9K-2liHr6IOGWjbDfVEreNcys7BtHLIauZw>
X-Sasl-enc: TrZ0t8ar9MuGpGkP3Wddw7aYyJCDSOdJuuB+x2HTqFCJ 1493187811
Received: from localhost (flamenco.cs.columbia.edu [128.59.20.216])
	by mail.messagingengine.com (Postfix) with ESMTPA id BBE672469B;
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
Subject: [PATCH v3 08/10] target/i386: optimize cross-page direct jumps in softmmu
Date: Wed, 26 Apr 2017 02:23:21 -0400
Message-Id: <1493187803-4510-9-git-send-email-cota@braap.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1493187803-4510-1-git-send-email-cota@braap.org>
References: <1493187803-4510-1-git-send-email-cota@braap.org>
X-TUID: 8h3EXh8//ng9

Instead of unconditionally exiting to the exec loop, use the
gen_jr helper to jump to the target if it is valid.

Perf impact: see next commit's log.

Signed-off-by: Emilio G. Cota <cota@braap.org>
---
 target/i386/translate.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/i386/translate.c b/target/i386/translate.c
index 59f6eaa..a065271 100644
--- a/target/i386/translate.c
+++ b/target/i386/translate.c
@@ -2154,9 +2154,9 @@ static inline void gen_goto_tb(DisasContext *s, int tb_num, target_ulong eip)
         gen_jmp_im(eip);
         tcg_gen_exit_tb((uintptr_t)s->tb + tb_num);
     } else {
-        /* jump to another page: currently not optimized */
+        /* jump to another page */
         gen_jmp_im(eip);
-        gen_eob(s);
+        gen_jr(s, cpu_tmp0);
     }
 }
 
-- 
2.7.4
