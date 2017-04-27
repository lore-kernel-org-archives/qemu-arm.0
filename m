Received: by 10.25.0.144 with SMTP id 138csp572128lfa;
        Wed, 26 Apr 2017 20:29:29 -0700 (PDT)
X-Received: by 10.200.54.125 with SMTP id n58mr3113862qtb.145.1493263768982;
        Wed, 26 Apr 2017 20:29:28 -0700 (PDT)
Return-Path: <cota@braap.org>
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com. [66.111.4.28])
        by mx.google.com with ESMTPS id e34si1456732qtb.153.2017.04.26.20.29.28
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 26 Apr 2017 20:29:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of cota@braap.org designates 66.111.4.28 as permitted sender) client-ip=66.111.4.28;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@braap.org;
       dkim=pass header.i=@messagingengine.com;
       spf=pass (google.com: domain of cota@braap.org designates 66.111.4.28 as permitted sender) smtp.mailfrom=cota@braap.org
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id 58F07209CC;
	Wed, 26 Apr 2017 23:29:28 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
  by compute4.internal (MEProxy); Wed, 26 Apr 2017 23:29:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=braap.org; h=cc
	:date:from:in-reply-to:message-id:references:subject:to
	:x-me-sender:x-me-sender:x-sasl-enc:x-sasl-enc; s=mesmtp; bh=Ta4
	tw3WmYm+qHdrHWjt66JRltdhuo18lj+g0a3/yfk4=; b=wIPOqglfUB6qnL1hh97
	yWKkEcQ05lVu4TTiZFhx0aOqIIGnsnGBw09xrSN1QHa9MAN5J2Lfb1f+4bJZQZne
	jYn5xHuw5iy9qI53HvRuVTaDsNzyW7NsJ4l5hw92RzHAdbTbx6OEyDU4saQ/RgAt
	g9L+aSvtVE8z70Mzh7EkOLi0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:date:from:in-reply-to:message-id
	:references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
	:x-sasl-enc; s=fm1; bh=Ta4tw3WmYm+qHdrHWjt66JRltdhuo18lj+g0a3/yf
	k4=; b=eQle4HC/DPqLr37UDPeaznxsYbxJ6q8WCx7DI6Y2Mlod0w18ZDwCW3OcJ
	IQ04m2wjjSc/17667we2Y2eJO0XZxtc75IsoiH53fOLp1OkG5oGVHIdflSwWn2z1
	ucXsvN1/WGh9tUExzXFzVwcVJ8BdMvVt59Ow+iMO/REgHt6kZQE92/dQShyt7WLe
	1Nb/N8U/LCVOz2Et1rU+u7P0k0BFl+6GOMRNB6zljnliE8BX1MUMF5Ss/1VlGcL7
	8jrtxOX6TfTtJzWaY4W/i81gh7Fnok+0AANBHk2eRjsuKayX6MBrajxB4gA6DQ8Z
	qLYxU1TkytzyoD4/HtKhbjTJ9D/og==
X-ME-Sender: <xms:mGUBWcR3qRmkeSUCeIyeAw7njvVoVSXMURNtfAitg9lWUQySDrWLzQ>
X-Sasl-enc: UmuCv6wx/fVooVIYAlBWmrOmqCewZc5mbqcq/7BLhlkm 1493263768
Received: from localhost (flamenco.cs.columbia.edu [128.59.20.216])
	by mail.messagingengine.com (Postfix) with ESMTPA id 17B207E442;
	Wed, 26 Apr 2017 23:29:28 -0400 (EDT)
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
Subject: [PATCH v4 09/11] target/i386: optimize cross-page direct jumps in softmmu
Date: Wed, 26 Apr 2017 23:29:22 -0400
Message-Id: <1493263764-18657-10-git-send-email-cota@braap.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1493263764-18657-1-git-send-email-cota@braap.org>
References: <1493263764-18657-1-git-send-email-cota@braap.org>
X-TUID: RzJAJnswCP30

Instead of unconditionally exiting to the exec loop, use the
gen_jr helper to jump to the target if it is valid.

Perf impact: see next commit's log.

Reviewed-by: Richard Henderson <rth@twiddle.net>
Signed-off-by: Emilio G. Cota <cota@braap.org>
---
 target/i386/translate.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/i386/translate.c b/target/i386/translate.c
index f0e48dc..ea113fe 100644
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
