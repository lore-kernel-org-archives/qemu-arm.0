Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp1628059lfy;
        Thu, 6 Aug 2020 06:21:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzZHDC9fV4+tu5RHko/di1Bh2ZyhlVTpRPQxRNcr+gZCvHENM5ArwXGx8NOSar5J7MWXVFZ
X-Received: by 2002:a25:e00e:: with SMTP id x14mr2684797ybg.263.1596720116389;
        Thu, 06 Aug 2020 06:21:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1596720116; cv=none;
        d=google.com; s=arc-20160816;
        b=r75wQW4vNl0tuWZqJXhPIRkzU9ftf5B212hdS+hXMlaeT20STvzwRDD9p+DEhkZLAW
         h62cApCTZ7dJNDoUxJYo7L9f22KAp/3AW4fYyj21nn4MNPNazBl/fzOSJQZa4qnb6iCp
         bLbaXu15PQbz5VUJ5Z9WkGHpaXHEsY2vj4qS3Ro/Zbi4ToeRGVFzATHOsi1wv4OQsuvL
         2daAY7I/bMI7HTuVgltt4ffbXSPqe0qj+1N4X1QGtUGu+tffHyVBtUi/n38MhuZyKutI
         +aubsH6wBwKtpC5dJ9KgIrCPuvAdWOFrQpMn5gjyrfq9EAzxESelaOAnEemkhaJyVNqk
         CbpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=hsFztKWPBRM9HvQYJLnezl42DRzn8TXMFxUUgjWmIVw=;
        b=SkBgf4p0Jgh217bPL3E/V0Oiasi2MTG7qXy3jUl35z+saetyR3ChuHQpWlwcp+jNhl
         PXVv9oYAA5k6U6Jp5u8RbyyjZCXFr5/qEO8/YzZGYpN+w9N5xQdl+Vh49hH8Q7EdbMhe
         22NcxEaVaRk+ISQ6/ZH2lR7sDUwAQxYKE6IdfPI7y+LJgvtCl8L59JLqB0EdmiL3yFya
         ShsVlRlZvq0S0W/qxRd7Qv5q7TXa12sXsrT/9lNzdJZWOuKAKzMvVJDpd9niK+EGcTLw
         LBUwg134wFBm7ASALCzzxLo3MSNAxUgaz5ZlX/YEe7aS8QxY4UhAQikQY+kKf7J5SSIN
         QiWQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x184si4477357ybx.325.2020.08.06.06.21.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 06 Aug 2020 06:21:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:50624 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k3fqF-0002GI-OF
	for alex.bennee@linaro.org; Thu, 06 Aug 2020 09:21:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1k3fph-0001NZ-6B; Thu, 06 Aug 2020 09:21:21 -0400
Received: from smtpout1.mo529.mail-out.ovh.net ([178.32.125.2]:45105)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1k3fpb-0000uW-IO; Thu, 06 Aug 2020 09:21:20 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.138.188])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 2A7474DAE2CD;
 Thu,  6 Aug 2020 15:21:14 +0200 (CEST)
Received: from kaod.org (37.59.142.103) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3; Thu, 6 Aug 2020
 15:21:13 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-103G005a8fe8c84-17dc-4536-a444-bd0939aa8866,
 96EDEDBD7B7627A0205C40E9E2B74F8D513A659B) smtp.auth=clg@kaod.org
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH for-5.2 12/19] ftgmac100: Change interrupt status when a DMA
 error occurs
Date: Thu, 6 Aug 2020 15:20:59 +0200
Message-ID: <20200806132106.747414-13-clg@kaod.org>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20200806132106.747414-1-clg@kaod.org>
References: <20200806132106.747414-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.103]
X-ClientProxiedBy: DAG8EX2.mxp5.local (172.16.2.72) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 54f8521c-5179-4ee0-9a2e-ae567f60280b
X-Ovh-Tracer-Id: 273030730017311593
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduiedrkedtgdeihecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvffufffkofgjfhggtgfgihesthekredtredtjeenucfhrhhomhepveorughrihgtucfnvgcuifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeehheefgeejiedtffefteejudevjeeufeeugfdtfeeuleeuteevleeihffhgfdtleenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtfeenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtoheptghlgheskhgrohgurdhorhhg
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
Cc: Frederic Konrad <konrad.frederic@yahoo.fr>,
 Andrew Jeffery <andrew@aj.id.au>, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ftEbFtvvuo77

The model uses today the "No transmit buffer unavailable" interrupt
status which it is not appropriate. According to the Aspeed specs, no
interrupts are raised in that case. An "AHB error" status seems like a
better modeling choice for all implementations since it is covered by
the Linux kernel.

Cc: Frederic Konrad <konrad.frederic@yahoo.fr>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/net/ftgmac100.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/net/ftgmac100.c b/hw/net/ftgmac100.c
index 5c0fe2d8cb75..014980d30aca 100644
--- a/hw/net/ftgmac100.c
+++ b/hw/net/ftgmac100.c
@@ -517,7 +517,7 @@ static void ftgmac100_do_tx(FTGMAC100State *s, uint32_t tx_ring,
         if (dma_memory_read(&address_space_memory, bd.des3, ptr, len)) {
             qemu_log_mask(LOG_GUEST_ERROR, "%s: failed to read packet @ 0x%x\n",
                           __func__, bd.des3);
-            s->isr |= FTGMAC100_INT_NO_NPTXBUF;
+            s->isr |= FTGMAC100_INT_AHB_ERR;
             break;
         }
 
-- 
2.25.4

