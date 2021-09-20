Received: by 2002:ac2:5978:0:0:0:0:0 with SMTP id h24csp1857177lfp;
        Mon, 20 Sep 2021 01:11:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwanIswSCLgxt7P5pSAGpgjquM91oxGabamrbEkeP9nEwoYadngeUY2XUKOO1DET0ZkytP1
X-Received: by 2002:a05:6602:2e0c:: with SMTP id o12mr17852260iow.59.1632125486909;
        Mon, 20 Sep 2021 01:11:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1632125486; cv=none;
        d=google.com; s=arc-20160816;
        b=puRY0mlyuWUJnSYGDC0prFHCM9iNFJ2SXt0v7tYOKRSc/j0YQnUUNeZgYxCyE/swIp
         lRUHiO7t1TUWw9QMPbR8F6yBAEcO9f7gPa7fYVEPrfnEbltvpgARCp5LxSNvOyfWPKM8
         ijSgMPV2M1nwUIdHaj1VhxyiDoeL4ksYrsa/A5ZVY/QKTDSf/kCPuaIUuGhcswuD0paj
         1KKeBZiAt/oSyRFhc8IwDeU40loRHTXoSRl3O8/TUDBZC+aRVweB0em+FeKPQgl9e/ce
         zcMqw2gSgv/QTQuWIgF9x0ccXdbzESa9xfzcFoKUVQW7j6DlT/DLi/bBrlXW8SaU8bKk
         1CzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=fv72HIG+GfrqNEdBRfRFaNHSTIzUGgYTewyRzcEe69k=;
        b=Lazr1exsCM8Fmb67oon1X/7bbZfn4Gx69TAsMAXfkbn8Q7b2GmrBUTMdR0tKdEvFpo
         q8Uh1wPiQQemyW2w2VOfk2cLiy6tQSra+xF5KZqsXFNLv+rMn8eNPB6FMFOweIusqjRP
         clVsXNpLiDZ9bpt6U6P/EM5Yn1ppnNJDOFIhUqSPg7ZLwLNFdaunlrtwMhj/eGsH6IU6
         DploIrhqsuwsV60T4y946Bvidxrhlwfl2D5LmoLhtEhL4NylrsJzK1o1roHco+BhhLiJ
         IiLPtkqKeUvjtUoRAF47DD1iHM2kmGYzsXXF6JaP8GbOOnoY5zJcaE050hN4Q9a0SGEv
         9PHQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o16si10893704ilh.153.2021.09.20.01.11.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 Sep 2021 01:11:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:44982 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mSEOc-0006bl-8F
	for alex.bennee@linaro.org; Mon, 20 Sep 2021 04:11:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mSEMx-0004PT-Dc
 for qemu-arm@nongnu.org; Mon, 20 Sep 2021 04:09:46 -0400
Received: from 2.mo548.mail-out.ovh.net ([178.33.255.19]:53623)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mSEMq-0003fI-FR
 for qemu-arm@nongnu.org; Mon, 20 Sep 2021 04:09:42 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.4.36])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 650A620704;
 Mon, 20 Sep 2021 08:09:31 +0000 (UTC)
Received: from kaod.org (37.59.142.103) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Mon, 20 Sep
 2021 10:09:30 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-103G0051edcb571-79dd-42ff-83be-68ba9cb0eaa3,
 C584E5EC745A9DFF7B561FC81DF43D5934FDEC9F) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 02/14] hw: arm: aspeed: Enable mac0/1 instead of mac1/2 for
 g220a
Date: Mon, 20 Sep 2021 10:09:16 +0200
Message-ID: <20210920080928.1055567-3-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210920080928.1055567-1-clg@kaod.org>
References: <20210920080928.1055567-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.103]
X-ClientProxiedBy: DAG4EX2.mxp5.local (172.16.2.32) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: c17be32e-f32e-498a-941b-b0493be6d366
X-Ovh-Tracer-Id: 4736379434870082409
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvtddrudeivdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvffufffkofgjfhggtgfgihesthekredtredtjeenucfhrhhomhepveorughrihgtucfnvgcuifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeehheefgeejiedtffefteejudevjeeufeeugfdtfeeuleeuteevleeihffhgfdtleenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtfeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtoheptghlgheskhgrohgurdhorhhg
Received-SPF: pass client-ip=178.33.255.19; envelope-from=clg@kaod.org;
 helo=2.mo548.mail-out.ovh.net
X-Spam_score_int: 0
X-Spam_score: -0.0
X-Spam_bar: /
X-Spam_report: (-0.0 / 5.0 requ) RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 qemu-arm@nongnu.org, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Guenter Roeck <linux@roeck-us.net>, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: jy3vI8fH/jpR

From: Guenter Roeck <linux@roeck-us.net>

According to its dts file in the Linux kernel, we need mac0 and mac1 enabled
instead of mac1 and mac2. Also, g220a is based on aspeed-g5 (ast2500) which
doesn't even have the third interface.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
Message-Id: <20210810035742.550391-1-linux@roeck-us.net>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/arm/aspeed.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index ecf0c9cfacb8..20e3a7716006 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -997,7 +997,7 @@ static void aspeed_machine_g220a_class_init(ObjectClass *oc, void *data)
     amc->fmc_model = "n25q512a";
     amc->spi_model = "mx25l25635e";
     amc->num_cs    = 2;
-    amc->macs_mask  = ASPEED_MAC1_ON | ASPEED_MAC2_ON;
+    amc->macs_mask  = ASPEED_MAC0_ON | ASPEED_MAC1_ON;
     amc->i2c_init  = g220a_bmc_i2c_init;
     mc->default_ram_size = 1024 * MiB;
     mc->default_cpus = mc->min_cpus = mc->max_cpus =
-- 
2.31.1

