Received: by 2002:a05:6512:b9e:0:0:0:0 with SMTP id b30csp2522911lfv;
        Mon, 1 Nov 2021 13:38:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw+hY1ieeqp6J6orWcusVwA9HigBk7rXUV7Za/3Asz/MvTCNrJ03lVZhY619G6sQDPr3Qvm
X-Received: by 2002:a05:6808:6c2:: with SMTP id m2mr1207364oih.8.1635799118132;
        Mon, 01 Nov 2021 13:38:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1635799118; cv=none;
        d=google.com; s=arc-20160816;
        b=iaeJFPvUeNo/2VGFw+DQPgWB9kcZElpHhLSqc0nr+ZOg6fqcztQxTowAh+6LUm+rBH
         YohqKvHsB4qUda7L+SU/n+vMf3edpXv6C3R1YbZ3HrdQajoEhzbhJuiiosnOoJnjjS2j
         3ttdt5BkAzPudOZEne88BjHD9lIQGvp2MJpddAwbSmkzRLlR2kE0Im6m5DfSdJ7xW3/o
         zH1CNOnpRvkWiHzGjER3x3UNG6Fv1phYjKiFuLNjVGVE64IYeunuXnk0zx9CPlYEXR4A
         hWEsUHay3rcMweoGgA4QiieSN+z4p512xTmBIqD4GVy9tkECCErwXtzLFFmWmu32CgtM
         NyPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from;
        bh=bg60rQOoKJwJXfRb99Rm6leB0FUc+kj7O2SjBHjOrMg=;
        b=iwfsEUPPq09q3RkaSN9Dvo69yI+n3ZZ0/D2GIMyPuuW3P8JfflHup0YfQJS9WFPlfK
         uD+vjdZQj4KsBIdctDLPbrxL3DDjM1gJF096cjPDUwr0d5H9Sl4VfqtJRgfZUqC3a+2w
         eUqIsn3XDf47DCCED4g1Vsox2e2kA5g74Le7DccJaNMhe/IEBj19SYk+jYBeyQtmrXLW
         C2AbaBvpN5LSSr2ehGk3/gyjPMe/Hgu/jvuU945wsGTOlHzkn1n2Rp0V1ak1YVRhIpoY
         BCAbELj2y96n/O71O46wSvSXCt9pRi+9AzLjFjyx275+nmAAZS6g+xdD/UpG2SNx48v+
         wMRA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k8si19811766oil.295.2021.11.01.13.38.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 01 Nov 2021 13:38:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:59302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mhe4i-0004AJ-5c
	for alex.bennee@linaro.org; Mon, 01 Nov 2021 16:38:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53008)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mhc6G-0000S8-6e
 for qemu-arm@nongnu.org; Mon, 01 Nov 2021 14:32:05 -0400
Received: from 7.mo552.mail-out.ovh.net ([188.165.59.253]:57551)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mhc6B-0003F1-Nc
 for qemu-arm@nongnu.org; Mon, 01 Nov 2021 14:32:03 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.4.36])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id C4C3F20B1C;
 Mon,  1 Nov 2021 18:31:47 +0000 (UTC)
Received: from kaod.org (37.59.142.101) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.15; Mon, 1 Nov
 2021 19:31:47 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-101G0046ec24ab5-77db-45a8-8f94-7e61cfe2ffba,
 19968099C3D5961E0A9C4B5796ED635FC82F5468) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH] MAINTAINERS: Change status to Odd Fixes
Date: Mon, 1 Nov 2021 19:31:46 +0100
Message-ID: <20211101183146.684471-1-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.101]
X-ClientProxiedBy: DAG4EX1.mxp5.local (172.16.2.31) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 529cebba-7ef7-4331-a0c5-6f9e888c38db
X-Ovh-Tracer-Id: 3644256524635179814
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvtddrvdehvddgudduvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvffufffkofggtgfgihesthekredtredtjeenucfhrhhomhepveorughrihgtucfnvgcuifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeefvdeutddvieekkeeuhfekudejjefggffghfetgfelgfevveefgefhvdegtdelveenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopegtlhhgsehkrghougdrohhrgh
Received-SPF: pass client-ip=188.165.59.253; envelope-from=clg@kaod.org;
 helo=7.mo552.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, qemu-arm@nongnu.org,
 Joel Stanley <joel@jms.id.au>, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: jXXnPHlYK4Ta

I haven't done any Aspeed development for a couple of years now and
maintaining the Aspeed QEMU machines has been a side project since.
I don't have time anymore.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 MAINTAINERS | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 05a3451f115b..193e5c908a29 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1036,12 +1036,11 @@ F: hw/arm/msf2-som.c
 F: docs/system/arm/emcraft-sf2.rst
 
 ASPEED BMCs
-M: Cédric Le Goater <clg@kaod.org>
 M: Peter Maydell <peter.maydell@linaro.org>
 R: Andrew Jeffery <andrew@aj.id.au>
 R: Joel Stanley <joel@jms.id.au>
 L: qemu-arm@nongnu.org
-S: Maintained
+S: Odd Fixes
 F: hw/*/*aspeed*
 F: hw/misc/pca9552.c
 F: include/hw/*/*aspeed*
-- 
2.31.1

