Received: by 2002:ac2:596f:0:0:0:0:0 with SMTP id h15csp1215615lfp;
        Mon, 11 Jul 2022 19:33:50 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uvyX7ObnWPeaeK9QMtfPyBToqg1v+k+IkDJEbF+CvRQ32HBMKY1frK/qR3WsquqHvtsIWN
X-Received: by 2002:a05:622a:102:b0:31d:34f2:2170 with SMTP id u2-20020a05622a010200b0031d34f22170mr16267363qtw.373.1657593230787;
        Mon, 11 Jul 2022 19:33:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1657593230; cv=none;
        d=google.com; s=arc-20160816;
        b=gbaFFGwBn690YNurqsBOY/NZzvHAH34Tah/RAzzg1To7vo4xOg5+W5wKsCjWQZXkBu
         iOGSgBHV3X/o1xUnhNOiEI+w0SDecFDfS/QuAi78wgqw1OxHa0SSv7RC50zdyin+5HBs
         W34RuMjxqUI0vpvAtwhIuF/Ty1zpEgXV0JMjCQbEr96texxAoQg1a3/pWqRFNXSLffdL
         L86CkHuuDMHtRPq6Mc6LVqJgkEczXbqhYClgyd0JhmXnfjFVyM6tnRUG8aWhAkupz7m5
         u+J0KVbT2JkgN0W020gfuGlFytvJqAKCbvykfeJk/6TfdDisER2yRWpnVOWsmKsEK/Wj
         TeKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:feedback-id
         :dkim-signature:dkim-signature;
        bh=dC94u0acFC77t7Vh4yTVAzl3KW+gG7tWXOK31wAM6yo=;
        b=vKaRuci9iWcdRunhoq5V/W3BJmkl4M7IguyLl1zwsYvlzM1hg6w8pQADNKGH+FmlBU
         cja+ex4FQxBSdNULEE25UyoNnd19D4X3ZRa6afXzUFzeSxm00VUHd9x9VPOJ5vASRfCk
         raTQF4gFwpPGsaEIAt3/RmDv2tuNU7FHEZFLDUDaf+bAVr0ns7MpwamtR10cG4rwuA0n
         v+/K1b6iCY6tSh3AvLSX4vTFqVxv0xvhEzbyUVh6gXbULuiZ6YNuZahr0DGyEgIT/UZG
         0GHT2cd7efAGERwCsqP/c/EpGKocVcQF/2Xnt9xQqhDFleIpKv1h4lK9yrds7Aas4DmY
         M7NQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@pjd.dev header.s=fm1 header.b=HXf6+SlH;
       dkim=fail header.i=@messagingengine.com header.s=fm3 header.b=UCYakeLK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d7-20020ac84e27000000b00304b825a7c6si4759253qtw.66.2022.07.11.19.33.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 11 Jul 2022 19:33:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@pjd.dev header.s=fm1 header.b=HXf6+SlH;
       dkim=fail header.i=@messagingengine.com header.s=fm3 header.b=UCYakeLK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:44834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oB5ig-0000P8-AX
	for alex.bennee@linaro.org; Mon, 11 Jul 2022 22:33:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41030)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>)
 id 1oB5hM-0007kW-W7; Mon, 11 Jul 2022 22:32:29 -0400
Received: from new3-smtp.messagingengine.com ([66.111.4.229]:59781)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>)
 id 1oB5hL-0006XO-0d; Mon, 11 Jul 2022 22:32:28 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id F1A31580A06;
 Mon, 11 Jul 2022 22:32:24 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Mon, 11 Jul 2022 22:32:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pjd.dev; h=cc:cc
 :content-transfer-encoding:date:date:from:from:in-reply-to
 :message-id:mime-version:reply-to:sender:subject:subject:to:to;
 s=fm1; t=1657593144; x=1657596744; bh=dC94u0acFC77t7Vh4yTVAzl3K
 W+gG7tWXOK31wAM6yo=; b=HXf6+SlH5+eYm8lznjNYl5H+gWVB2UNvuQnZ+X8oC
 5drOOxlydVG5twFEYnbShudl+AQVVDQHx4zUalkwOM2sLY9gD1MK/x1V9WnoV60E
 MnWLdhm4mDGNWkNZicMNU4EwljZVmgQIJcYsULDEpjHHgMy/TWILc8WvCnx3ht4e
 7+kCGk9G5426Le+55KkjOoUPJTNPTMtH8qMAyv9kXYYG6rwesSMK4/T5EqgKAPJO
 8hBGe1G8MZNccc0Ml225XaTXNFzaPBnzHyl3uXIENyQhJIPR4ZPefOwvRX9L8ATB
 hN6fcGPo2KI3btUJWs6SC8c8FJrH/Z5OLUV7fgsYjfFQg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:message-id
 :mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
 1657593144; x=1657596744; bh=dC94u0acFC77t7Vh4yTVAzl3KW+gG7tWXOK
 31wAM6yo=; b=UCYakeLKYupgxahHLdTJCbQAdN9dn8q6VEBzb+P+GALENXCbBj+
 2gb2+9cDng+UHzgOeiiZ08+SpgK38D32jUYhPcoG7Ee2mEHIttUplrUObs287Kb5
 z6+dbIlCX2+MnZfTKpIdi6NRMSnsV/+JEkKWsqniKHvKDeXEs3VIBsT9i2sKCgA8
 R0AfaymlcbmLJRsvZON/NyhC3VONQwZL07x2gYFuKSOMnOhsIDtjX4tzAwk5zrfS
 9xi3GkXpsxU0UpLfgERV3ddb+9Xe5gzr0mKAqLZFaWYv1215LhB9fcn+vrKBLY5X
 7n8pqRgzH3rTpB47PKfalOmmik/RkNGIsEA==
X-ME-Sender: <xms:ON3MYkc6eIiE8qo4b1OrLhvi16rTJHjH9SgkxYBCLzfglpqwXPlE7g>
 <xme:ON3MYmO29rJ_-AV0yJsIde2dSPcP8eAtll1dt45sHU6tUtL8QqMYQQc2z-0Yp29Na
 lwYaEebTceTFVmlVfE>
X-ME-Received: <xmr:ON3MYljyjM-pxMatecqDgz_YRQFKSskojzeQCPu2ta7Q4WGXMrKNEoKa7WBySA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudejgedgiedvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenuchmihhsshhinhhgucfvqfcufhhivghlugculdeftd
 dmnegoteeftdduqddtudculdduhedmnecujfgurhephffvvefufffkofgggfestdekredt
 redttdenucfhrhhomheprfgvthgvrhcuffgvlhgvvhhorhihrghsuceophgvthgvrhesph
 hjugdruggvvheqnecuggftrfgrthhtvghrnhepvdejgefhkeejjeeitddutddvueegheeh
 feelteffueegjedutdetgfdvgeevieegnecuvehluhhsthgvrhfuihiivgeptdenucfrrg
 hrrghmpehmrghilhhfrhhomhepphgvthgvrhesphhjugdruggvvh
X-ME-Proxy: <xmx:ON3MYp-rwf7kzJCthxW_420QgniSq6sBAXtaDV_X1tQ4NltN8ohzbA>
 <xmx:ON3MYguxfs2V34TQqLrfhY8-GGCeBZWC0__pgTj6jgDKKhhaGFV5-Q>
 <xmx:ON3MYgHgC5NnOd1U3DC8diLPMo8yCoGXU-YY8T2yrC1IXM1yGucrzg>
 <xmx:ON3MYuAgPdR161wBoPwY0JMNrBX3fNopgJEzdkwvaZh0oQ-2DgqFAQ>
Feedback-ID: i9e814621:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 11 Jul 2022 22:32:24 -0400 (EDT)
From: Peter Delevoryas <peter@pjd.dev>
To: 
Cc: peter@pjd.dev, clg@kaod.org, peter.maydell@linaro.org, andrew@aj.id.au,
 joel@jms.id.au, thuth@redhat.com, lvivier@redhat.com, pbonzini@redhat.com,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH v3 0/3] hw/gpio/aspeed: Don't let guests modify input pins
Date: Mon, 11 Jul 2022 19:32:16 -0700
Message-Id: <20220712023219.41065-1-peter@pjd.dev>
X-Mailer: git-send-email 2.37.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.229; envelope-from=peter@pjd.dev;
 helo=new3-smtp.messagingengine.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FROM_FMBLA_NEWDOM14=0.998, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: ULSDIVh4kS6P

v3:
- Replaced fix in v2 with change suggested by arj
- Removed all changes to the body of the aspeed_gpio_update loop
- Removed guest error messages from v2

Peter Delevoryas (3):
  qtest/aspeed_gpio: Add input pin modification test
  hw/gpio/aspeed: Don't let guests modify input pins
  aspeed: Add fby35-bmc slot GPIO's

 hw/arm/aspeed.c                | 14 +++++++++++++-
 hw/gpio/aspeed_gpio.c          | 15 ++++++++-------
 tests/qtest/aspeed_gpio-test.c | 27 +++++++++++++++++++++++++++
 3 files changed, 48 insertions(+), 8 deletions(-)

-- 
2.37.0

