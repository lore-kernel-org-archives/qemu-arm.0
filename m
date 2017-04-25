Received: by 10.25.0.144 with SMTP id 138csp1748168lfa;
        Tue, 25 Apr 2017 00:54:09 -0700 (PDT)
X-Received: by 10.55.116.1 with SMTP id p1mr27934046qkc.115.1493106849762;
        Tue, 25 Apr 2017 00:54:09 -0700 (PDT)
Return-Path: <cota@braap.org>
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com. [66.111.4.28])
        by mx.google.com with ESMTPS id s14si21182047qtb.69.2017.04.25.00.54.09
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 25 Apr 2017 00:54:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of cota@braap.org designates 66.111.4.28 as permitted sender) client-ip=66.111.4.28;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@braap.org;
       dkim=pass header.i=@messagingengine.com;
       spf=pass (google.com: domain of cota@braap.org designates 66.111.4.28 as permitted sender) smtp.mailfrom=cota@braap.org
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id 157AE21F2B;
	Tue, 25 Apr 2017 03:54:05 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
  by compute4.internal (MEProxy); Tue, 25 Apr 2017 03:54:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=braap.org; h=cc
	:date:from:in-reply-to:message-id:references:subject:to
	:x-me-sender:x-me-sender:x-sasl-enc:x-sasl-enc; s=mesmtp; bh=3V6
	sdiuHbsI0j+qVeXuAwj3yNFvN/rwxLtZesSYUSu8=; b=ssjnlyDReeV/vWeNTqf
	XcnZ4KvlK4I77qSzZs658rHveyAoEEF15zxj5bbaPwRPneHB8huLQ5imyxg+hu6y
	wEWXpstt+RTZV0sL4gJWzjiDxqxqZTReFZOutwwmKrfzrm1rDnsRXUwrqXrgeT0S
	mVaXky2KkQ+vpQ1mEuCvYo5M=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:date:from:in-reply-to:message-id
	:references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
	:x-sasl-enc; s=fm1; bh=3V6sdiuHbsI0j+qVeXuAwj3yNFvN/rwxLtZesSYUS
	u8=; b=RCFQC3G1O2/EAInrUKzqzHBDZ6UuT0+wr8s6r7pzB5ghnwkAfiQewcmXl
	Kixr9wga4TagMJz8SyqWh3CRwIRLKU5IluEVwZ3ItQO0XP4PI8HYvQOGLuqxtxm4
	HxwcGpQMM78emupy+WqJByA1xB20F5WRAm3JHZf2aaRhdV34vNi1859voRyb1JqV
	7f6X2DtckibhnIDbwk+4B8JZIRerhp/a8LsgmZ9cfcs3VAm47ng5n/lJFp5zz8Tj
	DwdfgcGCAWnDugdWAwFs71X+rfO49EQol9QQAhzwEQC0/kays3TOfgKqp9h+0hCK
	nglILnUcA8Ocr1NUrHR6/BaHxUSyA==
X-ME-Sender: <xms:nAD_WFu0MiLfit2Lbs8_14FS2XiKHi8xB6bdxLMP7IiJFizBJpVneg>
X-Sasl-enc: McD4fIoaKdjzkG9yxiRR3HgI4wlwRuVbhondrqX23xnS 1493106844
Received: from localhost (flamenco.cs.columbia.edu [128.59.20.216])
	by mail.messagingengine.com (Postfix) with ESMTPA id B5B45248EE;
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
Subject: [PATCH v2 08/13] target/arm: optimize cross-page block chaining in softmmu
Date: Tue, 25 Apr 2017 03:53:54 -0400
Message-Id: <1493106839-10438-9-git-send-email-cota@braap.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1493106839-10438-1-git-send-email-cota@braap.org>
References: <1493106839-10438-1-git-send-email-cota@braap.org>
X-TUID: V7FbsHsRwWOB

Instead of unconditionally exiting to the exec loop, use the
lookup_tb_ptr helper to jump to the target if it is valid.
As long as the hit rate in tb_jmp_cache remains high, this
will improve performance.

Perf impact: see the next commit's log.

Signed-off-by: Emilio G. Cota <cota@braap.org>
---
 target/arm/translate.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index e32e38c..574cf70 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -4085,8 +4085,12 @@ static inline void gen_goto_tb(DisasContext *s, int n, target_ulong dest)
         gen_set_pc_im(s, dest);
         tcg_gen_exit_tb((uintptr_t)s->tb + n);
     } else {
+        TCGv_ptr ptr = tcg_temp_new_ptr();
+
         gen_set_pc_im(s, dest);
-        tcg_gen_exit_tb(0);
+        gen_helper_lookup_tb_ptr(ptr, cpu_env, cpu_R[15]);
+        tcg_gen_goto_ptr(ptr);
+        tcg_temp_free_ptr(ptr);
     }
 }
 
-- 
2.7.4
