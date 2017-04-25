Received: by 10.25.0.144 with SMTP id 138csp1748150lfa;
        Tue, 25 Apr 2017 00:54:06 -0700 (PDT)
X-Received: by 10.55.64.83 with SMTP id n80mr30230328qka.268.1493106845904;
        Tue, 25 Apr 2017 00:54:05 -0700 (PDT)
Return-Path: <cota@braap.org>
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com. [66.111.4.28])
        by mx.google.com with ESMTPS id j1si21176885qkd.79.2017.04.25.00.54.05
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 25 Apr 2017 00:54:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of cota@braap.org designates 66.111.4.28 as permitted sender) client-ip=66.111.4.28;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@braap.org;
       dkim=pass header.i=@messagingengine.com;
       spf=pass (google.com: domain of cota@braap.org designates 66.111.4.28 as permitted sender) smtp.mailfrom=cota@braap.org
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id F0E2121F25;
	Tue, 25 Apr 2017 03:54:03 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
  by compute4.internal (MEProxy); Tue, 25 Apr 2017 03:54:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=braap.org; h=cc
	:date:from:in-reply-to:message-id:references:subject:to
	:x-me-sender:x-me-sender:x-sasl-enc:x-sasl-enc; s=mesmtp; bh=api
	3sjPXzyP7+xh0OFgAe0egor5sVk45hJf7nyGr+ps=; b=aIL2rF1NBFWim09DZYb
	dBa6W0+xBhPn4Ws2YXfEcGprFPIlrTv84zMtr9Q8HzFxhMfdAiaKEjCewGrFxh4X
	0k234iCd5DYvx/xLdnfa+g7awJvbN2F4Ty9q5e8rhh4aaxiy1dEj1woqvuDt5o/C
	kVJiqaZ9re/WBo0GE12NYiSM=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:date:from:in-reply-to:message-id
	:references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
	:x-sasl-enc; s=fm1; bh=api3sjPXzyP7+xh0OFgAe0egor5sVk45hJf7nyGr+
	ps=; b=kFj2A0hoeOMVbPFOIKEPPFSA2x175pL5QWfN3BfkxGYU6quQEfBiVdmyD
	leYyxquxAOH8YbgS69Fc62Iw40OzW6TMkrmw+b8UeTgzCyJoNPkUzWkkWKMFDKLp
	3NWx4HQ3JRyTAY4+A5YdamrQ7N8q4ZDM2RhmQ6M+y/cg60oDodWsLDwAzHOlYm8E
	I/6wFCNr7cJhn3o66A2phJAycFRdV9EEcd13vXe3V3IveoRPMdE+joy8L+boCQI1
	0Jw08eL5rOGBxcSaQgEa1RgbDHxVWKqJ2Otdyn+wXn+97MTGGDE5LbnTogsEmE9z
	+8p23VCukUF3jPpQ39qk2iFxLy6EQ==
X-ME-Sender: <xms:mwD_WOlOg0bW4dLlbpEErVRETVGbVWBNVedN743tk-17gHOAk3YDZg>
X-Sasl-enc: ePeDty/F/chD3XayqVefcqyZu2z64H3tf2JaKdSpLtfA 1493106843
Received: from localhost (flamenco.cs.columbia.edu [128.59.20.216])
	by mail.messagingengine.com (Postfix) with ESMTPA id B00027E7A2;
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
Subject: [PATCH v2 03/13] tcg: enforce 64-byte alignment of TCGContext
Date: Tue, 25 Apr 2017 03:53:49 -0400
Message-Id: <1493106839-10438-4-git-send-email-cota@braap.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1493106839-10438-1-git-send-email-cota@braap.org>
References: <1493106839-10438-1-git-send-email-cota@braap.org>
X-TUID: Buzl4EoBE5jX

This will allow us to prevent cache line false sharing in TCGContext.

Before:
$ objdump -t  build/x86_64-linux-user/qemu-x86_64 | grep tcg_ctx
00000000003ea820 g     O .bss   00000000000152d8              tcg_ctx

After:
$ objdump -t  build/x86_64-linux-user/qemu-x86_64 | grep tcg_ctx
00000000003ea880 g     O .bss   0000000000015300              tcg_ctx

Signed-off-by: Emilio G. Cota <cota@braap.org>
---
 tcg/tcg.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tcg/tcg.h b/tcg/tcg.h
index 6c216bb..5fdbfe3 100644
--- a/tcg/tcg.h
+++ b/tcg/tcg.h
@@ -727,7 +727,7 @@ struct TCGContext {
 
     uint16_t gen_insn_end_off[TCG_MAX_INSNS];
     target_ulong gen_insn_data[TCG_MAX_INSNS][TARGET_INSN_START_WORDS];
-};
+} QEMU_ALIGNED(64);
 
 extern TCGContext tcg_ctx;
 extern bool parallel_cpus;
-- 
2.7.4
