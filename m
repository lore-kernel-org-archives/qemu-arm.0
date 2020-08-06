Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp1627860lfy;
        Thu, 6 Aug 2020 06:21:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxEnqKQpHKw1xn/gSVVx5Ul7/Uc11BMgJI5NQf4x1jv5lvtC8yayYHFqy1Y/kCX29e4tVLV
X-Received: by 2002:a25:74c8:: with SMTP id p191mr13212881ybc.151.1596720102899;
        Thu, 06 Aug 2020 06:21:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1596720102; cv=none;
        d=google.com; s=arc-20160816;
        b=MIdMzgPj5AsyZTbjZ4bCRZw5jgLuUjTxs8UpYjML5xKh19jbSf9zZjz3XEtmQJ50Mk
         xjl04o/W3SMamnmZixrZl4Bygpvher8H8HUeO5ZO6IARnrq7xco1OuOVOaDdyEHXh93I
         xenpW3WdWCcoYVtY9g1/nNQgjiEtoeQI4S3IFrVlb/L4oAZI0UrkSfjuOQ3EZR9xOUrY
         VI60KwD2ZNqNWtbXC7p8HqpS2cGpBi3j6pH8ZsN9HAU6xhgSXPFRLcnHFWCYAUKh8BR6
         31bbVAs+6hj6H1d0lphlqg/sjt1JNdxi7UgbreUHixXtnJNtAoiZRUpwsCXyFzyg0Zkz
         W2Xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=KzRnwzOrm/21RTXQpX6Qe7DpwPbZeeFudhjUVgUkJII=;
        b=tXZqxGwX3UVhI6q7h1xLv5cvqF63jxvQiBAY3dnY1iYRuwlJhIYhbQ2YCk3AHyXBY3
         91xcRlwi7Kura1v0wWw4eVrTYq1PmAeSG1wa1rB84wlYGsu64in4rI7keNYKzrDf+mpL
         szgNbGKGeQL+bE0wEAFJOu29Jnzr9R9ZKgt551iidPAEwHErAzB8xIoqqmj4csGQWc65
         6i1B8eA8CiWfYpflrQLvYZhKnR6Pqj6rmMmqjlpPuoISZb6W5W4aNJcs1U9mtX/NWply
         axEHJDNtqwFCFyrhNvlsa1valbGmcFR1/d1hFq1+kAGEV6OT0WQrOAQkOqpkKo2S+3JF
         5OnQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j70si4654196ybg.320.2020.08.06.06.21.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 06 Aug 2020 06:21:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:49590 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k3fq2-0001ld-9p
	for alex.bennee@linaro.org; Thu, 06 Aug 2020 09:21:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48824)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1k3fpe-0001G5-5S; Thu, 06 Aug 2020 09:21:18 -0400
Received: from smtpout1.mo804.mail-out.ovh.net ([79.137.123.220]:36773)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1k3fpa-0000tq-Ex; Thu, 06 Aug 2020 09:21:17 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.1.125])
 by mo804.mail-out.ovh.net (Postfix) with ESMTPS id CD093545F894;
 Thu,  6 Aug 2020 15:21:10 +0200 (CEST)
Received: from kaod.org (37.59.142.103) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3; Thu, 6 Aug 2020
 15:21:10 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-103G00558d69c0a-200f-4083-ba01-4826897f2d94,
 96EDEDBD7B7627A0205C40E9E2B74F8D513A659B) smtp.auth=clg@kaod.org
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH for-5.2 04/19] aspeed/scu: Fix valid access size on AST2400
Date: Thu, 6 Aug 2020 15:20:51 +0200
Message-ID: <20200806132106.747414-5-clg@kaod.org>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20200806132106.747414-1-clg@kaod.org>
References: <20200806132106.747414-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.103]
X-ClientProxiedBy: DAG8EX2.mxp5.local (172.16.2.72) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 20dc5dc2-27c0-4bde-b8de-277945d56098
X-Ovh-Tracer-Id: 271904830723492713
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduiedrkedtgdeihecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvffufffkofgjfhggtgfgihesthekredtredtjeenucfhrhhomhepveorughrihgtucfnvgcuifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeehheefgeejiedtffefteejudevjeeufeeugfdtfeeuleeuteevleeihffhgfdtleenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtfeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtoheptghlgheskhgrohgurdhorhhg
Received-SPF: pass client-ip=79.137.123.220; envelope-from=clg@kaod.org;
 helo=smtpout1.mo804.mail-out.ovh.net
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/06 09:21:12
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
X-TUID: NEaCv602/Z4K

The read access size of the SCU registers can be 1/2/4 bytes and write
is 4 bytes. Set the min access size to 1 byte to cover both read and
write operations on the AST2400 but keep the min access size of the
other SoCs to 4 bytes as this is an unusual access size.

This fixes support for some old firmware doing 2 bytes reads on the
AST2400 SoC.

Reported-by: erik-smit <erik.lucas.smit@gmail.com>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/misc/aspeed_scu.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/hw/misc/aspeed_scu.c b/hw/misc/aspeed_scu.c
index ec4fef900e27..764222404bef 100644
--- a/hw/misc/aspeed_scu.c
+++ b/hw/misc/aspeed_scu.c
@@ -328,9 +328,10 @@ static const MemoryRegionOps aspeed_ast2400_scu_ops = {
     .read = aspeed_scu_read,
     .write = aspeed_ast2400_scu_write,
     .endianness = DEVICE_LITTLE_ENDIAN,
-    .valid.min_access_size = 4,
-    .valid.max_access_size = 4,
-    .valid.unaligned = false,
+    .valid = {
+        .min_access_size = 1,
+        .max_access_size = 4,
+    },
 };
 
 static const MemoryRegionOps aspeed_ast2500_scu_ops = {
-- 
2.25.4

