Received: by 2002:a17:505:8ed0:b0:1be9:327d:8ee3 with SMTP id kh16csp24479njc;
        Wed, 18 Jun 2025 20:59:11 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWbzMZ3DocWjNep1ecc01gUuigdYfDTj16MB7wbeuHnrA8oKxOsgoykbVhOFwS8bSbtmIKy8QD0VaNKWA==@linaro.org
X-Google-Smtp-Source: AGHT+IEXE834Hx2V+iC6ARuQ/KpjqRS/kcLCvtuBdmYV9gSKvfUA4UFamRZUqU5hYAwiZtNySwn1
X-Received: by 2002:ad4:5c6b:0:b0:6f8:aebb:71c1 with SMTP id 6a1803df08f44-6fb47725e08mr294670746d6.4.1750305551010;
        Wed, 18 Jun 2025 20:59:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750305551; cv=none;
        d=google.com; s=arc-20240605;
        b=iBDz1Hk0rdK78AVnXmLUIMQ0Gsq6gfejrX3VxKEkyO2Q6C+mCMH931WGMyfHefa4WB
         xHtOTRVEldJxXNqXRcsapWyDQL/Go7rncL0K/8t7wmYkc7QUQNjwA+/HOxvyCdjWR87C
         zdV86z8TUERlZc2D7HQbOwBp4UgsaEcMuVqopNNaXs+rj7XCZmCXHWZEIPILlPgOClwR
         LeYO8/WTXxrW7c0QC+KscVkbkBMidoLAFuUZ9dPvivCrrZseyC72xg2ID7iq/hoTIpZd
         lIjn2esbeuB091dGNhjmeqvL7ERtLB3jj79Fg0mX6Hgpm4fF6caYGTSygYnmq2v4qwbz
         1IbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:feedback-id
         :dkim-signature:dkim-signature;
        bh=uELtW7gaBzLgYxN3mCnUyaNa+RDpvLSxxNt7YAUFU6g=;
        fh=d8Sj57FkTYBQkLKcBHS3PsjoABd0vAfHvR/kKegtS2Q=;
        b=Xnr/aoypvpONc/H+cUwGIuzFgmz/2py4QlIgK8pKeCqe6oaJTll15EIqTybfF5Uv49
         sDZq9uqzKwkzfXf6YjAw4E3jRHfOBaLZMNWTXB5NKtFya2szbqJ4nZ+L6aOyAfhRbEbM
         NC8L+9oT0fPm6KKTe+83pmY4y9N4C9koVR0phOKc0F4U2pqFEvlXog5C8HJAGPpPgcc9
         Y6JYGH4J17sJOPKb6NNNaohgLGTvpP6bqyz0BYw9gWmCiEUSJA/QdkHNZdT6qnYRS5Ca
         9tBCbgsuRnEdhbV0LV0Eo5ZBidcnpTkpb9l2DVTP3NTiprVHlj8kr+KkzTTmOCp7E29g
         cjZA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@stwcx.xyz header.s=fm3 header.b=nxrgJaGj;
       dkim=pass header.i=@messagingengine.com header.s=fm1 header.b=aS6OT7r2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6fd015e5971si6517246d6.254.2025.06.18.20.59.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 18 Jun 2025 20:59:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@stwcx.xyz header.s=fm3 header.b=nxrgJaGj;
       dkim=pass header.i=@messagingengine.com header.s=fm1 header.b=aS6OT7r2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uS6Qa-0006Ot-Pv; Wed, 18 Jun 2025 23:59:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <patrick@stwcx.xyz>)
 id 1uS6QY-0006Oc-Kz; Wed, 18 Jun 2025 23:59:03 -0400
Received: from fhigh-b6-smtp.messagingengine.com ([202.12.124.157])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <patrick@stwcx.xyz>)
 id 1uS6QW-0001LL-Ev; Wed, 18 Jun 2025 23:59:02 -0400
Received: from phl-compute-09.internal (phl-compute-09.phl.internal
 [10.202.2.49])
 by mailfhigh.stl.internal (Postfix) with ESMTP id 8554C2540185;
 Wed, 18 Jun 2025 23:58:58 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-09.internal (MEProxy); Wed, 18 Jun 2025 23:58:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:message-id:mime-version:reply-to:subject:subject:to
 :to; s=fm3; t=1750305538; x=1750391938; bh=uELtW7gaBzLgYxN3mCnUy
 aNa+RDpvLSxxNt7YAUFU6g=; b=nxrgJaGjcoUhCnU1WKcx+loUjL0JbY2sb0r0G
 DZGLfkJk/4mHG6Ue0S8JFjaBfTh0Vy+twQd0JkzX7lCh8OjAIL0auB0HIOrjK+QM
 b79GTYZjNu76Vuvq6r0Rm+3G2San8h+T0p70HEgfPSD5Pjrl4oRXqFzJb5cXawRy
 kQ6OFjIgdFzW2I3jDBI/A0utVemZeB4YPr5cnre9FCDIgFntUbGH3qmC/7m0SGiL
 QRbsZpzw56/GyHbnx6xfNIB6f6xw8KOV28JPrNk7XHfhSWaSojjglXDlnFHqlC6E
 el3W4k7YQibUQI6OWN6aPywBKB05QFUaFUcWCpcYJrmkuNEXg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:message-id:mime-version:reply-to:subject:subject:to
 :to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
 1750305538; x=1750391938; bh=uELtW7gaBzLgYxN3mCnUyaNa+RDpvLSxxNt
 7YAUFU6g=; b=aS6OT7r2RtQxQrz7FG9oUV9m0B2BPFAZBsjpX4b6Fkr8U5ArS6x
 lF8b/zoRQVPxye4dIACRegJwB/OCg4u+/k7oYwcVahW4iMeoFiCLkxMFPUecFsW+
 /5anKCFC8VpQrRj4rwvCkJbOcDiNyui1goPaQObLd7CdZqnb/bzr1STEpkQEw9HO
 /c9cX3RW+f7iWF+73ZLzxVb6Uz2ROj+8EscYh0/In4+USsydytVL5sAOLokxn9zd
 0/hGCEGtsFs65ZqANiHM8pgd6qnoPTA/dTu6FRfmshfLtyHA5WOOoGeGZPI+7fIT
 E+ToDb5LV9eqPBRC7PCA9g3nNEW7UsZWgOg==
X-ME-Sender: <xms:AYtTaLjyfcr-rL1dp0X4b9roHZ2IgceK1DET5Pf08hzTxqiypVUImw>
 <xme:AYtTaIDER_lQlPLemeNW45gH7ZlA08rvmSvikm72Q-jG5rjMnlP9_5EduVa08Lm9w
 lKKeMYZCI-YHJO5das>
X-ME-Received: <xmr:AYtTaLECeru7xPnMKe8HFarrcL0M_hrrfw8Xh9wnj1QTbLBE8wcNd3WOOD4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgdeghedtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
 rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
 htshculddquddttddmnegfrhhlucfvnfffucdljedtmdenucfjughrpefhvfevufffkffo
 ggfgsedtkeertdertddtnecuhfhrohhmpefrrghtrhhitghkucghihhllhhirghmshcuoe
 hprghtrhhitghksehsthiftgigrdighiiiqeenucggtffrrghtthgvrhhnpeevtdevgfdt
 hfefveejudelheeghefhhfdtteetheehudeiueefhfetkeejleefteenucevlhhushhtvg
 hrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehprghtrhhitghksehsthif
 tgigrdighiiipdhnsggprhgtphhtthhopedutddpmhhouggvpehsmhhtphhouhhtpdhrtg
 hpthhtoheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepphgvthgvrhdrmhgrhigu
 vghllheslhhinhgrrhhordhorhhgpdhrtghpthhtohepshhtvghvvghnpghlvggvsegrsh
 hpvggvughtvggthhdrtghomhdprhgtphhtthhopehlvggvthhrohihsehgmhgrihhlrdgt
 ohhmpdhrtghpthhtohepjhgrmhhinhgplhhinhesrghsphgvvgguthgvtghhrdgtohhmpd
 hrtghpthhtoheprghnughrvgifsegtohguvggtohhnshhtrhhutghtrdgtohhmrdgruhdp
 rhgtphhtthhopehjohgvlhesjhhmshdrihgurdgruhdprhgtphhtthhopehprghtrhhitg
 hksehsthiftgigrdighiiipdhrtghpthhtohepqhgvmhhuqdgrrhhmsehnohhnghhnuhdr
 ohhrgh
X-ME-Proxy: <xmx:AYtTaISXba-70bos3tdbUQldWhy4P12aUKotJJb7yYunGXXoBQ7l9g>
 <xmx:AYtTaIzfvYkZ0wgj69d-RLNKU9vBV0aoRBcSE8shKwq-Yh4ZUlapFg>
 <xmx:AYtTaO6SpjptC9cU18Yfg3yO5gAqJVCONIlbs6nv4kQlcl8Zw41fXA>
 <xmx:AYtTaNz08-rUIwKmY3JpjOnzxhXmDgbz6Au1kZsu-KzAm0xrUUhm0g>
 <xmx:AotTaN1rmNDk-hG2Tzalhi17KWhJyF1zohQqdSegWW77MqrLmyLkuwDz>
Feedback-ID: i68a1478a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 18 Jun 2025 23:58:57 -0400 (EDT)
From: Patrick Williams <patrick@stwcx.xyz>
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>,
 Jamin Lin <jamin_lin@aspeedtech.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>
Cc: Patrick Williams <patrick@stwcx.xyz>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Subject: [PATCH] hw/arm/aspeed: bletchley: update hw strap values
Date: Wed, 18 Jun 2025 23:58:50 -0400
Message-ID: <20250619035850.2682690-1-patrick@stwcx.xyz>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=202.12.124.157; envelope-from=patrick@stwcx.xyz;
 helo=fhigh-b6-smtp.messagingengine.com
X-Spam_score_int: 17
X-Spam_score: 1.7
X-Spam_bar: +
X-Spam_report: (1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FROM_SUSPICIOUS_NTLD=0.498,
 FROM_SUSPICIOUS_NTLD_FP=1.997, PDS_OTHER_BAD_TLD=1.997, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: fyJ3lPzq4cCi

Update the Bletchley hardware strap register values
per actual hardware:
```
root@bmc:~# devmem 0x1e6e2500
0x00002000
root@bmc:~# devmem 0x1e6e2510
0x00000801
```

Signed-off-by: Patrick Williams <patrick@stwcx.xyz>
---
 hw/arm/aspeed.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index b0965ef8a0..94897505f8 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -198,9 +198,8 @@ struct AspeedMachineState {
 #define FUJI_BMC_HW_STRAP2    0x00000000
 
 /* Bletchley hardware value */
-/* TODO: Leave same as EVB for now. */
-#define BLETCHLEY_BMC_HW_STRAP1 AST2600_EVB_HW_STRAP1
-#define BLETCHLEY_BMC_HW_STRAP2 AST2600_EVB_HW_STRAP2
+#define BLETCHLEY_BMC_HW_STRAP1 0x00002000
+#define BLETCHLEY_BMC_HW_STRAP2 0x00000801
 
 /* Qualcomm DC-SCM hardware value */
 #define QCOM_DC_SCM_V1_BMC_HW_STRAP1  0x00000000
-- 
2.49.0

