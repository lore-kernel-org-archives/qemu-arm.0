Received: by 10.25.0.144 with SMTP id 138csp89163lfa;
        Tue, 11 Apr 2017 18:17:48 -0700 (PDT)
X-Received: by 10.200.48.240 with SMTP id w45mr14193004qta.23.1491959868339;
        Tue, 11 Apr 2017 18:17:48 -0700 (PDT)
Return-Path: <cota@braap.org>
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com. [66.111.4.25])
        by mx.google.com with ESMTPS id 1si17964350qtm.85.2017.04.11.18.17.48
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 11 Apr 2017 18:17:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of cota@braap.org designates 66.111.4.25 as permitted sender) client-ip=66.111.4.25;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@braap.org;
       dkim=pass header.i=@messagingengine.com;
       spf=pass (google.com: domain of cota@braap.org designates 66.111.4.25 as permitted sender) smtp.mailfrom=cota@braap.org
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id CFD0620B95;
	Tue, 11 Apr 2017 21:17:47 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
  by compute4.internal (MEProxy); Tue, 11 Apr 2017 21:17:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=braap.org; h=cc
	:date:from:in-reply-to:message-id:references:subject:to
	:x-me-sender:x-me-sender:x-sasl-enc:x-sasl-enc; s=mesmtp; bh=Zcj
	yjsaGqmYZPFITU1ASGJzz7Ubs2TwYNDmlng9VS1E=; b=pl0dq8N5eOO28rexDuu
	nIeawe7EX4DXPCnsb/Ohlz9TAvLpTJTYQGtnbrG3n+8vF2xiX21RhvyULiKT6Pfu
	SF7EuEXJJRoen/HeRKLbsk7QKCI4KN+rztwjEOqUzx8+PTXNnZZ8++vB5zmAqIOZ
	eQ0xsiF7u2ph8q80V2hU8gIY=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:date:from:in-reply-to:message-id
	:references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
	:x-sasl-enc; s=fm1; bh=ZcjyjsaGqmYZPFITU1ASGJzz7Ubs2TwYNDmlng9VS
	1E=; b=RSW1UiuQPbqPyDGfK5Gl3q1uDOWyjw7CHSRvSCQpcrm3HvpS4cgfJdbGG
	nnB8mNvMvlv29SZcfKS1fLhrGfolLcXMXopkDXmaelux/BtgxF7TjnfXepEQKI2R
	QYnIVNYvjPRE5I4rilgEIYoq2pkdIn84wh1N0TqW0PXd6IoIpeynyEUc7fH1NlSg
	KoakZwv1D2jLPb+QoR46oKHLL2IL9JkUZYt45KRrFJ5GIU2l9e4vZRZCjDYG4dEx
	3ohYeKwtWGIrHIV4PYhRsFLirM2XJ4bdTwwds5rhCySO/3tEVWFOoLKK/LHT2sfI
	06sDCZ5OC3QbMPhfkgm/OIUTcWL3Q==
X-ME-Sender: <xms:O4DtWDqOOTHvzdrt-emwSID4rnpmZ2Oh_Hyw9tKJ-b6E6RZPEV2RbA>
X-Sasl-enc: ERqma7IXp1LszafXKhydLnGpPiI9+MZL93SFqLcWFQJf 1491959867
Received: from localhost (flamenco.cs.columbia.edu [128.59.20.216])
	by mail.messagingengine.com (Postfix) with ESMTPA id 8D903241ED;
	Tue, 11 Apr 2017 21:17:47 -0400 (EDT)
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
Subject: [PATCH 06/10] tcg: add brcondi_ptr
Date: Tue, 11 Apr 2017 21:17:26 -0400
Message-Id: <1491959850-30756-7-git-send-email-cota@braap.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1491959850-30756-1-git-send-email-cota@braap.org>
References: <1491959850-30756-1-git-send-email-cota@braap.org>
X-TUID: fsPq9B+DXbgG

This will be used by TCG targets to implement a fast path
for indirect branches.

Signed-off-by: Emilio G. Cota <cota@braap.org>
---
 tcg/tcg-op.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tcg/tcg-op.h b/tcg/tcg-op.h
index 1924633..abf784b 100644
--- a/tcg/tcg-op.h
+++ b/tcg/tcg-op.h
@@ -1118,6 +1118,8 @@ void tcg_gen_atomic_xor_fetch_i64(TCGv_i64, TCGv, TCGv_i64, TCGArg, TCGMemOp);
     tcg_gen_addi_i32(TCGV_PTR_TO_NAT(R), TCGV_PTR_TO_NAT(A), (B))
 # define tcg_gen_ext_i32_ptr(R, A) \
     tcg_gen_mov_i32(TCGV_PTR_TO_NAT(R), (A))
+# define tcg_gen_brcondi_ptr(C, A, I, L) \
+    tcg_gen_brcondi_i32(C, TCGV_PTR_TO_NAT(A), (uintptr_t)I, L)
 #else
 # define tcg_gen_ld_ptr(R, A, O) \
     tcg_gen_ld_i64(TCGV_PTR_TO_NAT(R), (A), (O))
@@ -1129,4 +1131,6 @@ void tcg_gen_atomic_xor_fetch_i64(TCGv_i64, TCGv, TCGv_i64, TCGArg, TCGMemOp);
     tcg_gen_addi_i64(TCGV_PTR_TO_NAT(R), TCGV_PTR_TO_NAT(A), (B))
 # define tcg_gen_ext_i32_ptr(R, A) \
     tcg_gen_ext_i32_i64(TCGV_PTR_TO_NAT(R), (A))
+# define tcg_gen_brcondi_ptr(C, A, I, L) \
+    tcg_gen_brcondi_i64(C, TCGV_PTR_TO_NAT(A), (uintptr_t)I, L)
 #endif /* UINTPTR_MAX == UINT32_MAX */
-- 
2.7.4
