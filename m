Received: by 2002:ac9:4144:0:0:0:0:0 with SMTP id u4csp55575ocg;
        Thu, 6 Oct 2022 15:53:02 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7KllWH55N7o0viOKgpMOLHE/cwVaNLVl8MTAKl39F1QPKbD2dUvz1MQ6+XdZe/Dcr8VP6S
X-Received: by 2002:a05:620a:2416:b0:6ce:a1c1:70dc with SMTP id d22-20020a05620a241600b006cea1c170dcmr1992343qkn.270.1665096782776;
        Thu, 06 Oct 2022 15:53:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1665096782; cv=none;
        d=google.com; s=arc-20160816;
        b=zAaqc1zelA2SEChuwoUtY5BEUb/Xs+JKswAGEgX+lvN/niGc7kMmL5PiD/mFQfk+yM
         siX9ZAmyGQ7+I4WqLgdEZuwZ2hz55S27xIMLxkck4wjhQWd7aE0VZFDLSZATBtSlCJ9l
         OPahriaZKGcrtn+9J86OeYW6Biuh+WAIUzPFzXBW4yFMLboLROJqdAlzAvPaL1elPxqv
         3CnaHACfyTHHhPVHlN+mcr6/UacC+FbJ5/3qFk7uS4NzyUcoORN+/qc7TvXAyrCMBkIx
         De7vwV8j0x0J3rM1b9pT71pIpi77sUROPW16Qn8ITE9uSWBtriBBm2KuVCJFPf2Qcd0e
         rdlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:feedback-id
         :dkim-signature:dkim-signature;
        bh=ALJ0NB/PSdOEcTUCf6E43qunLS7MEHN+obug10YvKSo=;
        b=G/DNaKI3HXvY4sru78UZi1nj+T69zm3H3LOkilZsbAi8cLy8uBuVTFwLM49kjs/hM4
         Ld2r4WiJzYz2hC+8hB4dnchSe3EJ77x2bp5k5TpkMS/8D60go3VhK8DpQihi2NOoyLww
         EHgl0f4Sh960iHfXWSer4D7Wqo7ZzTeFRH0td+XbKEG/CAFP6G05kD0x0krUQs0fG9Ck
         oNSTzFD2atCr0XOVI4j1ERinwW8xMEuPEckLHDpG8oX5b0WQX33WxB5qnmWCUKbIewzs
         4sCc5UOCH13QxyCARH3EPNK1up0FqJvOuWZ4/Xjpy2mLgliDeUnv3dLiC34lPl7odf2s
         4pQw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@stwcx.xyz header.s=fm1 header.b=FXnhn6i9;
       dkim=fail header.i=@messagingengine.com header.s=fm2 header.b=i21TUM2w;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j2-20020ac84042000000b0035cfa87d460si490514qtl.675.2022.10.06.15.53.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 06 Oct 2022 15:53:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@stwcx.xyz header.s=fm1 header.b=FXnhn6i9;
       dkim=fail header.i=@messagingengine.com header.s=fm2 header.b=i21TUM2w;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:55662 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ogZji-0007kW-Av
	for alex.bennee@linaro.org; Thu, 06 Oct 2022 18:53:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49154)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <patrick@stwcx.xyz>)
 id 1ogZjO-0007kB-Ce; Thu, 06 Oct 2022 18:52:42 -0400
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:47673)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <patrick@stwcx.xyz>)
 id 1ogZjN-0001HV-0C; Thu, 06 Oct 2022 18:52:42 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 355DC5C00EF;
 Thu,  6 Oct 2022 18:52:39 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Thu, 06 Oct 2022 18:52:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :message-id:mime-version:reply-to:sender:subject:subject:to:to;
 s=fm1; t=1665096759; x=1665183159; bh=ALJ0NB/PSdOEcTUCf6E43qunL
 S7MEHN+obug10YvKSo=; b=FXnhn6i9dEg5vkugUduQqiVLXTbc4FRoLh5XFw9Z6
 9+WdBwZCecn0Rv/9eqPxyQTcogBUtVvXHwcdeFFdTL6lNh5aR97cVO0psp/cK/m9
 hPIpMCtZ0Gh+4FO9FlIU2+kuknssJMeo/scrtORVVhPcFSurp0z2d8IUXZvcKNcM
 mOcKokBFlcI19BDJ1kEIJ6oV7tnxh7RMEsSx+aJw2U9NHqzg+bZRdunrk3ew2fRP
 XlwPl6L2C3RjmRGbDUV1mWHhv+cu7Dp9GMpgwsIDnHO/CrRkyFqD+XWCkQa4juHL
 OvsLRawUvNo9Jua77cMbIG/hiVe8Sm/+9uFJMHxiC7DvA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:message-id
 :mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
 1665096759; x=1665183159; bh=ALJ0NB/PSdOEcTUCf6E43qunLS7MEHN+obu
 g10YvKSo=; b=i21TUM2woQSxeN0XZT09tvDEBq3T+h/ZZ7WGaKkPZIQDPnK4186
 GYxBKMfeWLl7a3i8QfF0z2cGtM9ftistfmlaCaWySXX4khnlb5lFZ6xqXHI1kjcY
 KVGbzmRS0FeiVABCyuX+iDMpKqqZtISVkpQYAhWw4uHgFjBbpT2N8CyMsTUAvNiH
 Ld/Rvy0HZNfJ9LgEjai2MoL7s/oYNhtqj+S1raEkyHDi10fsvK2v5arZLr0dhMnU
 xgSIA/ple7lks5K/Ye26vajrOqCg/27gDE9mq9wweH+ZJx9xUVYaPrU7TYZ2bQN3
 oknAOaZpvI874rTJdDsYhgFyGGcpyMv/2Yg==
X-ME-Sender: <xms:N1w_Y6U53yipKCCK7cdZnAKy2HHg54MhgCHIrAKxFeHEhto0kSZ1zg>
 <xme:N1w_Y2nl53ahaitVBE67au1LsuWTg_T9a-P3p598O7ZUPx76NnYU2H829mPVHwmA0
 KatUPS8QOCH1JHpunc>
X-ME-Received: <xmr:N1w_Y-ZbBXsizV4jFwdJJsAq80sm4YEnYj6z2is5GX1XrYQxeGya5dZY3zkYWJB6Tx1CpnFDe8yFaOo1x1nJSSOGAH9rTWMy>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeeiiedgudehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 hmihhsshhinhhgucfvqfcufhhivghlugculdeftddmnegfrhhlucfvnfffucdljedtmden
 ogetfedtuddqtdduucdludehmdenucfjughrpefhvfevufffkffoggfgsedtkeertdertd
 dtnecuhfhrohhmpefrrghtrhhitghkucghihhllhhirghmshcuoehprghtrhhitghksehs
 thiftgigrdighiiiqeenucggtffrrghtthgvrhhnpeevtdevgfdthfefveejudelheeghe
 fhhfdtteetheehudeiueefhfetkeejleefteenucevlhhushhtvghrufhiiigvpedtnecu
 rfgrrhgrmhepmhgrihhlfhhrohhmpehprghtrhhitghksehsthiftgigrdighiii
X-ME-Proxy: <xmx:N1w_YxUxxKJWsmdrXFIjvscBQU-IhR4Ylc_BMS8dMgoOvAmhn_le-A>
 <xmx:N1w_Y0mIQUOhTdV_Q-nqfDiSid5R4BctatKSN23xTBHmB8zU694tDA>
 <xmx:N1w_Y2c5i_XB57URXg1slySedz-ehA19sW2vidRArj_2c7Z6-djvjA>
 <xmx:N1w_Yzvmnd2fILIZb4NtiEu2Op65Dy-lPoQj9AiR0tdl01l73W2FAA>
Feedback-ID: i68a1478a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 6 Oct 2022 18:52:38 -0400 (EDT)
From: Patrick Williams <patrick@stwcx.xyz>
To: 
Cc: Patrick Williams <patrick@stwcx.xyz>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
 Joel Stanley <joel@jms.id.au>, qemu-arm@nongnu.org (open list:ASPEED BMCs),
 qemu-devel@nongnu.org (open list:All patches CC here)
Subject: [PATCH] hw/arm/aspeed: increase Bletchley memory size
Date: Thu,  6 Oct 2022 17:52:32 -0500
Message-Id: <20221006225232.3558794-1-patrick@stwcx.xyz>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.25; envelope-from=patrick@stwcx.xyz;
 helo=out1-smtp.messagingengine.com
X-Spam_score_int: -7
X-Spam_score: -0.8
X-Spam_bar: /
X-Spam_report: (-0.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FROM_SUSPICIOUS_NTLD=0.001, FROM_SUSPICIOUS_NTLD_FP=1.999,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_PDS_OTHER_BAD_TLD=0.01 autolearn=no autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: nl7tvxsCsAcv

For the PVT-class hardware we have increased the memory size of
this device to 2 GiB.  Adjust the device model accordingly.

Signed-off-by: Patrick Williams <patrick@stwcx.xyz>
---
 hw/arm/aspeed.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index 7d2162c6ed..ab5725fff1 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -1344,7 +1344,7 @@ static void aspeed_machine_bletchley_class_init(ObjectClass *oc, void *data)
     amc->num_cs    = 2;
     amc->macs_mask = ASPEED_MAC2_ON;
     amc->i2c_init  = bletchley_bmc_i2c_init;
-    mc->default_ram_size = 512 * MiB;
+    mc->default_ram_size = 2 * GiB;
     mc->default_cpus = mc->min_cpus = mc->max_cpus =
         aspeed_soc_num_cpus(amc->soc_name);
 }
-- 
2.35.1

