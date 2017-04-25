Received: by 10.25.0.144 with SMTP id 138csp1748201lfa;
        Tue, 25 Apr 2017 00:54:17 -0700 (PDT)
X-Received: by 10.200.55.193 with SMTP id e1mr29067111qtc.190.1493106857290;
        Tue, 25 Apr 2017 00:54:17 -0700 (PDT)
Return-Path: <cota@braap.org>
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com. [66.111.4.28])
        by mx.google.com with ESMTPS id x4si21175809qkc.104.2017.04.25.00.54.16
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 25 Apr 2017 00:54:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of cota@braap.org designates 66.111.4.28 as permitted sender) client-ip=66.111.4.28;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@braap.org;
       dkim=pass header.i=@messagingengine.com;
       spf=pass (google.com: domain of cota@braap.org designates 66.111.4.28 as permitted sender) smtp.mailfrom=cota@braap.org
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id 9F3CD21F3C;
	Tue, 25 Apr 2017 03:54:05 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
  by compute4.internal (MEProxy); Tue, 25 Apr 2017 03:54:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=braap.org; h=cc
	:date:from:in-reply-to:message-id:references:subject:to
	:x-me-sender:x-me-sender:x-sasl-enc:x-sasl-enc; s=mesmtp; bh=y0C
	jSxjfTR2FVTA8ONLuT936VOXcL5FIJexxz7x9tkc=; b=0Aw6JEHxxob1zmpwGoJ
	uqg5liHqb6SYhVtcxD8NFSukfeWwNIILcG5U9yNCvqwGGPJc3iAwIs7A8vzSjGYh
	QoIcyTvKrBtm236Sfm9NPQMCO6zJEFoIjKvsNPTXOYPiKFsL8NWsgXRfC3G3yEeT
	p+oR5+lzawmdhGlam5MzbWDg=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:date:from:in-reply-to:message-id
	:references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
	:x-sasl-enc; s=fm1; bh=y0CjSxjfTR2FVTA8ONLuT936VOXcL5FIJexxz7x9t
	kc=; b=K29daeJRLG4km+Z2RkBV12voEDDeRxQObNHjs3jp85+f0eD0vZFF5A8JN
	URdJQcPnkwqZrRwJ+n3dSHrvCX3UtRdnxqOMNCf624KHCTyMXs/W2WW3V1XUTWW+
	6p0/Kkve6r0Z3ppJTSsfR1FGr36CAzzi3riEpAnjraFOf0v4luGX/QaXcKYJwnhM
	3giMIAo4tL5pYPnQGdiydDlP5scXbBGjBOCSSIya6PXq/WPP7DngxPoXe4MZwfa5
	t4Ly27Bx6GqD+9RV7Mvrj70icRBwsT07BofL0tyP1NKeHAms6NjFHVowZlNp9gwJ
	X/OaSN5lPLy9YQW4dlcohqT19p5lg==
X-ME-Sender: <xms:nQD_WN1ugfTFfK7VgDTyHI-ajBNPICyU4e4JNIkocZ_h2Ma7nu3Xqw>
X-Sasl-enc: AXHZl4PkwMIBPRqR3tNrtHWprVzUq/D0sPaU5F1VjIJR 1493106845
Received: from localhost (flamenco.cs.columbia.edu [128.59.20.216])
	by mail.messagingengine.com (Postfix) with ESMTPA id 568117E96F;
	Tue, 25 Apr 2017 03:54:05 -0400 (EDT)
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
Subject: [PATCH v2 11/13] target/i386: optimize cross-page direct jumps in softmmu
Date: Tue, 25 Apr 2017 03:53:57 -0400
Message-Id: <1493106839-10438-12-git-send-email-cota@braap.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1493106839-10438-1-git-send-email-cota@braap.org>
References: <1493106839-10438-1-git-send-email-cota@braap.org>
X-TUID: X781G0sesiUH

Instead of unconditionally exiting to the exec loop, use the
gen_jr helper to jump to the target if it is valid.

As long as the hit rate in tb_jmp_cache remains high, this
change improves performance.

Perf impact: see the next commit's log.

Signed-off-by: Emilio G. Cota <cota@braap.org>
---
 target/i386/translate.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/i386/translate.c b/target/i386/translate.c
index 445082b..9982a2d 100644
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
