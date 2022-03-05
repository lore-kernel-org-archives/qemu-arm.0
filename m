Received: by 2002:a05:6512:204:0:0:0:0 with SMTP id a4csp133146lfo;
        Fri, 4 Mar 2022 16:07:32 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzQgjVCg84TOhN+yQ6uxSYA1plp4dj6d3IhlubHu4vf1HYrZPD1UpbVicw1oi/kfFd8HaAS
X-Received: by 2002:a05:6902:51:b0:61e:1a26:3243 with SMTP id m17-20020a056902005100b0061e1a263243mr868327ybh.57.1646438852761;
        Fri, 04 Mar 2022 16:07:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1646438852; cv=none;
        d=google.com; s=arc-20160816;
        b=sxWR2wq25kop0lvWYjBCP3tPaGLSkc9JcQqTXkk9AgHV+siSEA1mu02t+VI5Tq9REn
         QoYrm+eLv6HXwftLbhLpNiLxcyyDyv4QflS3B/bvcGH86B4OWoTeSiI7hU6PlH4Nfk/w
         VOoNCrcGKFuP3nIvvrgNdCL1/7/buMmDPY9aPcVIBI3aK2bPxRqg7pqQQyQmOGf4IPHs
         cIyi5YWNFUOOjRd9N4WdwfCG0HdFZ7wa14z6Zp7CsK0xW8+rE1PYTLPgZ1jdBhmFaiF8
         Fuj53siMCfufv8Ir+FxCMTJijg9EPpDIPK7+oAiz/cOMB7e29DmFPFXDaU81AucKUtj6
         0YYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature
         :dkim-signature;
        bh=sbTVhcnKluAr0UEDLlRBsMeSFfp4KXU+k3a1OsX5VHM=;
        b=Zh+30mq7a99L4eNauekTw7BfLe3p2YQgv0bwY1E18oCG1md4AlBWbE85mm57o3FOHW
         B0RWBaAljKv3UJuQWinFHc3qcjq3jJLF0nsntCnasblOTU7lfrkBxwtYRRYbJj8jV3KA
         VbQn6ArJG+HfmW75y3+ndQv9FXZq+UmA90OV3RL/IJNFpYpG+lIThBMLb+MZhEiXnhMD
         yqqEeQvjY5Z2u36ydWzAvm3b49Sh8kGsoE4ql/lYwy7Nmr3DJBWvpdkuag+ubRCLXPvD
         0pECni+7gc0zChfbDkP7v1fbBxf+bbxblDMpfpUuKx44e9cmY7VPTFl7uWlXiAnd8ROI
         YclA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@stwcx.xyz header.s=fm1 header.b=jPg+NQDR;
       dkim=fail header.i=@messagingengine.com header.s=fm2 header.b=HoFbm82a;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 71-20020a81104a000000b002dbc5a06ef7si5038226ywq.71.2022.03.04.16.07.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 04 Mar 2022 16:07:32 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@stwcx.xyz header.s=fm1 header.b=jPg+NQDR;
       dkim=fail header.i=@messagingengine.com header.s=fm2 header.b=HoFbm82a;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:40872 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nQHxM-0003WG-4c
	for alex.bennee@linaro.org; Fri, 04 Mar 2022 19:07:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52748)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <patrick@stwcx.xyz>)
 id 1nQHwu-0003VZ-St; Fri, 04 Mar 2022 19:07:06 -0500
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:35319)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <patrick@stwcx.xyz>)
 id 1nQHws-0004iR-KZ; Fri, 04 Mar 2022 19:07:04 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id A13B85C0206;
 Fri,  4 Mar 2022 19:07:00 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Fri, 04 Mar 2022 19:07:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :message-id:mime-version:reply-to:sender:subject:subject:to:to;
 s=fm1; bh=sbTVhcnKluAr0UEDLlRBsMeSFfp4KXU+k3a1OsX5VHM=; b=jPg+N
 QDRWI/UyxbQ3vNP7vVj7CluhF/KoP+77tWxQvv1cyih38d/9l5GG3lypmflZHXYd
 ajW9FQMZK0yt89UIxLohzUJd9z12wiKBA0Hevq2ul3sPKinBlK5GgV4JRc9JAVg5
 Zb03I+ks3kIodIf2ycrGJygrWwD71VzTUQakdAT4HnJesdDDyZr1ZyO+II3znGer
 yYw9FJoWrDP0Qzmuim0gWexJO0d47E8BqdiliQWAXtgWvR9zv7ZyogX3T0XtJZbB
 eVGOzlwMBSYoyA0aFLoC0e7/DK9xbGHSYyxYyAY/zH9fJJWY3kwoMIhr+EKKISYV
 6bmLvaCK0TJKfXkBg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :from:from:in-reply-to:message-id:mime-version:reply-to:sender
 :subject:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm2; bh=sbTVhcnKluAr0UEDLlRBsMeSFfp4K
 XU+k3a1OsX5VHM=; b=HoFbm82a8p5MNFaseAKZBPXAk1V2Fbq2+/ubGCnrkaBSe
 FoT2kwn7CBfsQ9gOLvxhcHGSt3iTpnkPkvLsPZ5qojtr1uhK7HDMVsecmRiU5TK2
 EsQLw5QLxkqSLYNafG8kWtNL3mL4ACFfhgxoZhwh2Nnd0TJo0Pq9dCfkALuklmL+
 ohqO2iG4O2HcIDt2md99MN3/l1a8Jok7Rl8NAdVvaRw82zd4K4DItT9dmuy/WEZ1
 3WBSA3hZNpx/8lhx5xoEW/vIog6wxiyJWszrM1a1n+QAAckTFNKUBxMqiftNAaDv
 IjIG6ppn8Cj3EAcYIp39X+NpfjBEkFicSfeA5LI1Q==
X-ME-Sender: <xms:pKkiYiwv9pzr0zKpJVs8BW8lZc_EThtFcqEeA6l9a_T9flNd6xAJlg>
 <xme:pKkiYuS5ue-ge8TnU31zz2CAFo_3daUHk3QyAQc_rjtA0FDjs-wkxMb64pUxlLIdV
 n8YyhjopluZ-gb80KI>
X-ME-Received: <xmr:pKkiYkVWp_zSlPqrTUlGNY9OA36Qc_kErYcUYI86NCccXKPhecZUkU48lL2IDDR6THYYsfdFNzyo9AZyKrAKyK5AEAXxvF_rXJV2-g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddruddtledgudehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 hmihhsshhinhhgucfvqfcufhhivghlugculdeftddmnegfrhhlucfvnfffucdljedtmden
 ogetfedtuddqtdduucdludehmdenucfjughrpefhvffufffkofgggfestdekredtredttd
 enucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkhesshht
 figtgidrgiihiieqnecuggftrfgrthhtvghrnheptdeludegheejteelheduudegkeehle
 etfeekiedtfefgleeifeelhefgveejhfffnecuvehluhhsthgvrhfuihiivgeptdenucfr
 rghrrghmpehmrghilhhfrhhomhepphgrthhrihgtkhesshhtfigtgidrgiihii
X-ME-Proxy: <xmx:pKkiYoglQY3QJpvA6rm4Aa1oq8-3sYw5Am5NSBZ71fFeoJPSWR9ozw>
 <xmx:pKkiYkDvGHJzEVvtS04hMPMwft2zt2u3J55MJ3Wvoj3AeXVUJ-xk3g>
 <xmx:pKkiYpL6d4veB4O1qZgECrPrxdMr7KE5PVStOOrWIGzkpfAmsiZHGw>
 <xmx:pKkiYj4gTucjjbDrJH8hDRQrrnpMsS0VjyiHFZZ8vJAHxltZtgzFAA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 4 Mar 2022 19:06:59 -0500 (EST)
From: Patrick Williams <patrick@stwcx.xyz>
To: 
Subject: [PATCH 1/2] hw/arm/aspeed: allow missing spi_model
Date: Fri,  4 Mar 2022 18:06:55 -0600
Message-Id: <20220305000656.1944589-1-patrick@stwcx.xyz>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.27; envelope-from=patrick@stwcx.xyz;
 helo=out3-smtp.messagingengine.com
X-Spam_score_int: 17
X-Spam_score: 1.7
X-Spam_bar: +
X-Spam_report: (1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FROM_SUSPICIOUS_NTLD=0.499,
 FROM_SUSPICIOUS_NTLD_FP=1.997, PDS_OTHER_BAD_TLD=1.997, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>,
 Patrick Williams <patrick@stwcx.xyz>,
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>, Joel Stanley <joel@jms.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: LoXoBQKmWNZ7

Generally all BMCs will use the fmc_model to hold their own flash
and most will have a spi_model to hold the managed system's flash,
but not all systems do.  Add a simple NULL check to allow a system
to set the spi_model as NULL to indicate it should not be instantiated.

Signed-off-by: Patrick Williams <patrick@stwcx.xyz>
---
 hw/arm/aspeed.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index 11558b327b..617a1ecbdc 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -276,7 +276,11 @@ static void aspeed_board_init_flashes(AspeedSMCState *s,
                                       const char *flashtype,
                                       int unit0)
 {
-    int i ;
+    int i;
+
+    if (!flashtype) {
+        return;
+    }
 
     for (i = 0; i < s->num_cs; ++i) {
         DriveInfo *dinfo = drive_get(IF_MTD, 0, unit0 + i);
-- 
2.34.1

