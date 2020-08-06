Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp1629315lfy;
        Thu, 6 Aug 2020 06:23:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwCmwUQxA1VXC/oauBRNz3m/3/pG57Mzj/apT1laXAsXL0XqMHzS+EBSevmfJvYJc0h3VqV
X-Received: by 2002:a5b:44b:: with SMTP id s11mr12338758ybp.342.1596720190277;
        Thu, 06 Aug 2020 06:23:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1596720190; cv=none;
        d=google.com; s=arc-20160816;
        b=TULAgfhiIP1qax39M0Tm7fIR+rREPB5h7yUxiAMAd6e+3WiI+GU/iywbDHI9suiXdY
         IXmpEio3Yt5hvEWrODNh55PXWBUnPqbfVOR14LuUswuZ09uu7nyfUJ1dTrpJbSp5AwcB
         RRp4+HtzTEWYoxFGcoVW6IoRzVia44MadYQXFGrUJ4RdZDblTq82VVzibRzVP4clfP2L
         eb87QJc2HwyEtKBGZEKk6UiE1nD4CZn/mrIDv7lqihnFvSzokvSmc5VIqqDSClgVotRS
         QfNClt9ZPvR9Xx8iVxMZcMR5Z/nE7R3zhgyMcIQftcVVa8lrYCZxW7GVAIaPQ7c7DR2+
         e/1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=mVx781DjLJ4jZWiL63+R/29rOiqsSNwdjwVTRn/mQmw=;
        b=oB6elCH2k3BMdtgl1yJ6v51QNoGNByUahseS2VoPRjUs82pY0p8OOzb8Dq8MdINAW5
         fIsBDMFRhjrdEwiEPs2J42QS2IJpt9/ovehHzKAL8iBDCHweyW3SVpw43CPaGIvO9YoF
         W7xTUcuJ57I42eYfsZVB5YMrr6ITF/6yYHiXnoaiw7PSUOOaWsK5OGYlF9TZ073s6u4P
         iBL7FtwqAVCIVDqy2BHwL541UZISVwi4vZ0VUIxEeZ2w7tUS/WhPr9IWktdgRhbp55wz
         enGazeeV9UeYU2Rle1QnHysC9AZDRnJfMKWKOZAWG5ff7E7SvCY0H7lWtADAQXVw0tf2
         DWWA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t61si4999986ybi.286.2020.08.06.06.23.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 06 Aug 2020 06:23:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:57066 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k3frR-0004xf-HD
	for alex.bennee@linaro.org; Thu, 06 Aug 2020 09:23:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48772)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1k3fpc-0001EQ-9b; Thu, 06 Aug 2020 09:21:16 -0400
Received: from smtpout1.mo529.mail-out.ovh.net ([178.32.125.2]:41575)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1k3fpY-0000tW-L4; Thu, 06 Aug 2020 09:21:16 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.20.52])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id DCA094DAE2B2;
 Thu,  6 Aug 2020 15:21:09 +0200 (CEST)
Received: from kaod.org (37.59.142.103) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3; Thu, 6 Aug 2020
 15:21:08 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-103G005a4ade73f-82dd-4ad1-9322-703efb26bdf8,
 96EDEDBD7B7627A0205C40E9E2B74F8D513A659B) smtp.auth=clg@kaod.org
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH for-5.2 01/19] m25p80: Return the JEDEC ID twice for
 mx25l25635e
Date: Thu, 6 Aug 2020 15:20:48 +0200
Message-ID: <20200806132106.747414-2-clg@kaod.org>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20200806132106.747414-1-clg@kaod.org>
References: <20200806132106.747414-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.103]
X-ClientProxiedBy: DAG8EX2.mxp5.local (172.16.2.72) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 8c7136b9-3ad0-40cd-a52e-a8cbaa954d71
X-Ovh-Tracer-Id: 271623354419874665
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduiedrkedtgdeihecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvffufffkofgjfhggtgfgihesthekredtredtjeenucfhrhhomhepveorughrihgtucfnvgcuifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeehheefgeejiedtffefteejudevjeeufeeugfdtfeeuleeuteevleeihffhgfdtleenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtfeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtoheptghlgheskhgrohgurdhorhhg
Received-SPF: pass client-ip=178.32.125.2; envelope-from=clg@kaod.org;
 helo=smtpout1.mo529.mail-out.ovh.net
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/06 09:21:10
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
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-devel@nongnu.org,
 erik-smit <erik.lucas.smit@gmail.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: AL8NspgKX10B

The mx25l25635e returns the JEDEC ID twice when issuing a RDID command :

  [    2.512027] aspeed-smc 1e630000.spi: reading JEDEC ID C2:20:19:C2:20:19

This can break some firmware testing for this condition on the
supermicrox11-bmc machine.

Reported-by: erik-smit <erik.lucas.smit@gmail.com>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/block/m25p80.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/block/m25p80.c b/hw/block/m25p80.c
index 82270884416e..605ff55c6756 100644
--- a/hw/block/m25p80.c
+++ b/hw/block/m25p80.c
@@ -217,7 +217,7 @@ static const FlashPartInfo known_devices[] = {
     { INFO("mx25l6405d",  0xc22017,      0,  64 << 10, 128, 0) },
     { INFO("mx25l12805d", 0xc22018,      0,  64 << 10, 256, 0) },
     { INFO("mx25l12855e", 0xc22618,      0,  64 << 10, 256, 0) },
-    { INFO("mx25l25635e", 0xc22019,      0,  64 << 10, 512, 0) },
+    { INFO6("mx25l25635e", 0xc22019,     0xc22019,  64 << 10, 512, 0) },
     { INFO("mx25l25655e", 0xc22619,      0,  64 << 10, 512, 0) },
     { INFO("mx66u51235f", 0xc2253a,      0,  64 << 10, 1024, ER_4K | ER_32K) },
     { INFO("mx66u1g45g",  0xc2253b,      0,  64 << 10, 2048, ER_4K | ER_32K) },
-- 
2.25.4

