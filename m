Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp318726lfy;
        Wed, 19 Aug 2020 03:19:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxIB50lm2EZnOJEe5B6JduTqYlUjsNnNOwdfQySbQsOh4QKLX1CVbNKH9iY0bco/IgmMaRV
X-Received: by 2002:a25:5755:: with SMTP id l82mr35471615ybb.175.1597832362171;
        Wed, 19 Aug 2020 03:19:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1597832362; cv=none;
        d=google.com; s=arc-20160816;
        b=ZasI6kx7VACG1pX2+VYWRUr0hgSq1WE1tMoYeA2CIv+YGe1j3sTXZBJvBz+eJf1paR
         ccjXBRYR1muWQVyPkl0kZbiZ9W8pbMnL8ty8kzW0RDWPunWi5LPDG05u8Q4SeJSwAlNA
         w0EgZekTVmH23RuZyXxBUFubp9B8oyCe/KKdIJdP2kCcKLCcx2NZ7os+6xG1PHwPm8pr
         EugqAgs1RYb4TwmlXBm9gDhE3sd2fp3MpnUoscQGPB2tlWrK5LyAEZLLc4fIVbUv8SF8
         av6fpaEFpZ4ILQQQBPHPkpweHhzQ9EJWYUTGJtUmot1ZDl7pNa+hTuwZKocr6QbN+U0H
         aSzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=BkEt+egMTXnrYPjw32AHxgJx8e6bIf6jte10+9Hr3wU=;
        b=n3ROEurxdyytGRBRGMtn1rJYnEy7aQHrC6AoL6RfOqJC1GfSzZF1ZXT52GemqhAYx0
         9KusJJTT5JenwcXHZuhgIE6UnYN1ktDcYTh/SHFOS5w620Hv5qlMER2eey30+eNAXFDF
         BtwAxW6P283ylpIeV/88pmSPS7Ar603Q9rjOoPZbR8aDjkBwriL/EqfzRZG/eh3pdqnQ
         R6icqeJj5cHyT/6MlB+10exX9zjSCJg3OW7yE5uoALa1JViyAMDQdTNOOTSkjuMgAMp9
         GiJmVu1hLbF4NFILPZVNd7FG3/CvR1a1Zfb3Di6spbSyoP8QZdOtuheklZ9J91eX6kA3
         12HQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g35si24838646ybe.88.2020.08.19.03.19.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 19 Aug 2020 03:19:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:41134 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k8LBh-0003lS-GQ
	for alex.bennee@linaro.org; Wed, 19 Aug 2020 06:19:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56408)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1k8L3H-0002JZ-92; Wed, 19 Aug 2020 06:10:39 -0400
Received: from smtpout1.mo804.mail-out.ovh.net ([79.137.123.220]:53111)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1k8L3E-0006Zo-N2; Wed, 19 Aug 2020 06:10:38 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.16.121])
 by mo804.mail-out.ovh.net (Postfix) with ESMTPS id 84BB0589285D;
 Wed, 19 Aug 2020 12:10:12 +0200 (CEST)
Received: from kaod.org (37.59.142.101) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3; Wed, 19 Aug
 2020 12:10:11 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-101G00456d9c561-622b-46da-81e9-43bed8152325,
 56ABA3BD09B5898CED80C8E013D4E39E9C6048D1) smtp.auth=clg@kaod.org
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v2 20/21] arm: aspeed: add strap define `25HZ` of AST2500
Date: Wed, 19 Aug 2020 12:09:55 +0200
Message-ID: <20200819100956.2216690-21-clg@kaod.org>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20200819100956.2216690-1-clg@kaod.org>
References: <20200819100956.2216690-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.101]
X-ClientProxiedBy: DAG1EX1.mxp5.local (172.16.2.1) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 8e200074-e821-413d-a77e-5150a6ad2962
X-Ovh-Tracer-Id: 18051553206960360297
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduiedruddtkedgvdduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvufffkffojghfgggtgfhisehtkeertdertdejnecuhfhrohhmpeevrogurhhitgcunfgvucfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepheehfeegjeeitdfffeetjeduveejueefuefgtdefueelueetveeliefhhffgtdelnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutddunecuvehluhhsthgvrhfuihiivgepheenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopegtlhhgsehkrghougdrohhrgh
Received-SPF: pass client-ip=79.137.123.220; envelope-from=clg@kaod.org;
 helo=smtpout1.mo804.mail-out.ovh.net
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/19 06:10:01
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Igor Kononenko <i.kononenko@yadro.com>, Andrew Jeffery <andrew@aj.id.au>,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: RmMFjN53WcrA

From: Igor Kononenko <i.kononenko@yadro.com>

Provide a definition for the "25Hz reference clock input mode" strap

Signed-off-by: Igor Kononenko <i.kononenko@yadro.com>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
Message-Id: <20200811203502.20382-1-i.kononenko@yadro.com>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 include/hw/misc/aspeed_scu.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/hw/misc/aspeed_scu.h b/include/hw/misc/aspeed_scu.h
index a6739bb846b6..9cd530afa23a 100644
--- a/include/hw/misc/aspeed_scu.h
+++ b/include/hw/misc/aspeed_scu.h
@@ -286,6 +286,7 @@ uint32_t aspeed_scu_get_apb_freq(AspeedSCUState *s);
 #define SCU_AST2500_HW_STRAP_ESPI_FLASH_ENABLE     (0x1 << 26)
 #define SCU_AST2500_HW_STRAP_ESPI_ENABLE           (0x1 << 25)
 #define SCU_AST2500_HW_STRAP_DDR4_ENABLE           (0x1 << 24)
+#define SCU_AST2500_HW_STRAP_25HZ_CLOCK_MODE       (0x1 << 23)
 
 #define SCU_AST2500_HW_STRAP_ACPI_ENABLE           (0x1 << 19)
 #define SCU_AST2500_HW_STRAP_USBCKI_FREQ           (0x1 << 18)
-- 
2.25.4

