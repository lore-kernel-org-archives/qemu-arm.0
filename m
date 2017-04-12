Received: by 10.25.0.144 with SMTP id 138csp89164lfa;
        Tue, 11 Apr 2017 18:17:48 -0700 (PDT)
X-Received: by 10.55.12.213 with SMTP id 204mr39936771qkm.233.1491959868451;
        Tue, 11 Apr 2017 18:17:48 -0700 (PDT)
Return-Path: <cota@braap.org>
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com. [66.111.4.25])
        by mx.google.com with ESMTPS id f73si2986404qkh.211.2017.04.11.18.17.48
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 11 Apr 2017 18:17:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of cota@braap.org designates 66.111.4.25 as permitted sender) client-ip=66.111.4.25;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@braap.org;
       dkim=pass header.i=@messagingengine.com;
       spf=pass (google.com: domain of cota@braap.org designates 66.111.4.25 as permitted sender) smtp.mailfrom=cota@braap.org
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id 09F2320BB5;
	Tue, 11 Apr 2017 21:17:48 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
  by compute4.internal (MEProxy); Tue, 11 Apr 2017 21:17:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=braap.org; h=cc
	:date:from:in-reply-to:message-id:references:subject:to
	:x-me-sender:x-me-sender:x-sasl-enc:x-sasl-enc; s=mesmtp; bh=po/
	WoS885TO1nQ8TTU01/OZ/65vsDKgGby8PgM3fTBo=; b=NpfsuWyGCyIjfut8GDp
	KUPRwqDLnSJtcNqrdms/a8Ez4jTCk4H76VmRX9nrtAsViOd62HdZ7ef6tkY0g2q+
	B/H0vTu+PkCy0+D/1aD4vu4hMC297e9QZ2cgTb+/MO5RspECFdze7fkg9uKvFmF1
	NhN+YM6WPxACtHfE6Fhwblgc=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:date:from:in-reply-to:message-id
	:references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
	:x-sasl-enc; s=fm1; bh=po/WoS885TO1nQ8TTU01/OZ/65vsDKgGby8PgM3fT
	Bo=; b=Gxs3+cbY71Ptt0uT2/DbG58j+YO8ByvojGw5rh7LqoKDklgUEPG0Xv1n9
	l7cIAoJQpP0cQvNC4IF3RfAu8D+SUr5OHBcJsXG4Hi4dDyg4hHjtnElmvSMYt42b
	3isDjFw9+Vb0s5V7w20rP9bB9PjR1zt3MqoqAPUVFyCwLt1BeNjumP0nSk4rNZ0x
	tGbrxcKb9/J6+PA3cuUlhDz/w6a1BYKgU9UA0Rbx3/sbRaw+Jr2JKCS+3qQq4xVC
	T3uygzfelILMUNUXS6HnR4hRkElbuCVWoAOKaelqR9mrsqG2qTsIehAS14yRo0NS
	Z8iYKwKTnf1YFtdSQ2fJn1uuUpmxQ==
X-ME-Sender: <xms:O4DtWDS3gVJ24Rd7E-VMMunCzlpOZ74yVcGZiLaft1YN_N8g15YBug>
X-Sasl-enc: ERq6cLwZokTpwLjSIxSdLnGpPiI9+MZL93SFqLcWFQJf 1491959867
Received: from localhost (flamenco.cs.columbia.edu [128.59.20.216])
	by mail.messagingengine.com (Postfix) with ESMTPA id C1AF37E442;
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
Subject: [PATCH 07/10] tcg: add tcg_temp_local_new_ptr
Date: Tue, 11 Apr 2017 21:17:27 -0400
Message-Id: <1491959850-30756-8-git-send-email-cota@braap.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1491959850-30756-1-git-send-email-cota@braap.org>
References: <1491959850-30756-1-git-send-email-cota@braap.org>
X-TUID: S/HxcoHHFZV0

This will be used by TCG targets to implement a fast path
for indirect branches.

Signed-off-by: Emilio G. Cota <cota@braap.org>
---
 tcg/tcg.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tcg/tcg.h b/tcg/tcg.h
index 6c216bb..37a7c8e 100644
--- a/tcg/tcg.h
+++ b/tcg/tcg.h
@@ -912,6 +912,7 @@ do {\
 #define tcg_global_mem_new_ptr(R, O, N) \
     TCGV_NAT_TO_PTR(tcg_global_mem_new_i32((R), (O), (N)))
 #define tcg_temp_new_ptr() TCGV_NAT_TO_PTR(tcg_temp_new_i32())
+#define tcg_temp_local_new_ptr() TCGV_NAT_TO_PTR(tcg_temp_local_new_i32())
 #define tcg_temp_free_ptr(T) tcg_temp_free_i32(TCGV_PTR_TO_NAT(T))
 #else
 #define TCGV_NAT_TO_PTR(n) MAKE_TCGV_PTR(GET_TCGV_I64(n))
@@ -923,6 +924,7 @@ do {\
 #define tcg_global_mem_new_ptr(R, O, N) \
     TCGV_NAT_TO_PTR(tcg_global_mem_new_i64((R), (O), (N)))
 #define tcg_temp_new_ptr() TCGV_NAT_TO_PTR(tcg_temp_new_i64())
+#define tcg_temp_local_new_ptr() TCGV_NAT_TO_PTR(tcg_temp_local_new_i64())
 #define tcg_temp_free_ptr(T) tcg_temp_free_i64(TCGV_PTR_TO_NAT(T))
 #endif
 
-- 
2.7.4
