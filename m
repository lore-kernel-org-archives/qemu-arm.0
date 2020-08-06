Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp1633696lfy;
        Thu, 6 Aug 2020 06:27:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyC2w7I/Tv+EoYV3wo+lshPj1r6UevjvWIrZfQYKmM87g/et0Xemwnuzhoczz7Gyi4uQdUJ
X-Received: by 2002:a25:1085:: with SMTP id 127mr12094767ybq.254.1596720468704;
        Thu, 06 Aug 2020 06:27:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1596720468; cv=none;
        d=google.com; s=arc-20160816;
        b=UHxouCQlTBzMIwsUxwPcLaQe9QEUof05kapdv0aFp5JyabLsWcQHp2hn0SJQeUFjYP
         FRd7g/wQWpYJdRxtDEu3Hc9PXjYNMUFf935lqrgqd3X+9dsQRNAmp5A+7Bwbnd8PE3vs
         la+86dHCu1l66vmFWtJ4OdhSXEcl1o7GcoOqZxJFbXCMMoB64L4C5DNzvqFdknMYC7Et
         PU4IpnBH2gyxe6BONu02ji2zhnzcDWUeMe4rOleZxEG4pp3wLw7TII1GH6n4xbDA04V1
         aNAU7tmSKyk9Tis1oziEb27LsCSlFOWnpS2mXIj4fZvZI/Wi8hiP7pM+EMJO8eI/uGYD
         80kQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=t28fQj21ADXiYrbGAHWbPGf43wT7dImfrRUCi+a2mvI=;
        b=Wn6qVvlCRokjzQvUadeXSdDnlrPm+cgR86QgWy6yxkBDiRwZD7naRqME3eYOBHiRCF
         VIN0kgbzGw2Vber4evT0tYs04ca9lpoFV35DxM98tUL1iotd5Aj2pOatkZir2SdI7R+m
         k0IwHFRzCmp0Fi0aT4BGJGK7Q0lmsfdEHmzaf0LsGvjJW+KfnoYFx/o6MwBHalr+7f2D
         4l6kiaVkBnPHcqkuRQkjZviFMW7BQYqBrj8vcyvfyC99v65V37sgqHQkeqxMEpIQVXbx
         Dg8haG6MCj3jYQ8G5OxC8K9fwB2yBRBqI46JKCMkuipY02vrkDQldHrtxUH0A9ESlAuu
         D7Mg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s15si3831940ybk.368.2020.08.06.06.27.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 06 Aug 2020 06:27:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:49424 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k3fvw-0005Bq-1k
	for alex.bennee@linaro.org; Thu, 06 Aug 2020 09:27:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49052)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1k3fpm-0001eW-Ed; Thu, 06 Aug 2020 09:21:26 -0400
Received: from smtpout1.mo804.mail-out.ovh.net ([79.137.123.220]:45239)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1k3fpf-0000vo-DY; Thu, 06 Aug 2020 09:21:26 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.4.92])
 by mo804.mail-out.ovh.net (Postfix) with ESMTPS id C1D99545F8AB;
 Thu,  6 Aug 2020 15:21:13 +0200 (CEST)
Received: from kaod.org (37.59.142.103) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3; Thu, 6 Aug 2020
 15:21:13 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-103G00589dd4e81-46fc-44e3-b101-77e46bf245b0,
 96EDEDBD7B7627A0205C40E9E2B74F8D513A659B) smtp.auth=clg@kaod.org
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH for-5.2 11/19] ftgmac100: Fix interrupt status "Packet moved
 to RX FIFO"
Date: Thu, 6 Aug 2020 15:20:58 +0200
Message-ID: <20200806132106.747414-12-clg@kaod.org>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20200806132106.747414-1-clg@kaod.org>
References: <20200806132106.747414-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.103]
X-ClientProxiedBy: DAG8EX2.mxp5.local (172.16.2.72) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: a5507c4f-1dba-4a79-9897-d3f8414acefd
X-Ovh-Tracer-Id: 272749255574850409
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
Cc: Frederic Konrad <konrad.frederic@yahoo.fr>,
 Andrew Jeffery <andrew@aj.id.au>, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 9BueGpekWkVx

As we don't model the RX or TX FIFO, raise the "Packet moved to RX
FIFO" interrupt status bit as soon as we are handling a RX packet.

Cc: Frederic Konrad <konrad.frederic@yahoo.fr>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/net/ftgmac100.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/hw/net/ftgmac100.c b/hw/net/ftgmac100.c
index aa3c05ef9882..5c0fe2d8cb75 100644
--- a/hw/net/ftgmac100.c
+++ b/hw/net/ftgmac100.c
@@ -950,6 +950,7 @@ static ssize_t ftgmac100_receive(NetClientState *nc, const uint8_t *buf,
         break;
     }
 
+    s->isr |= FTGMAC100_INT_RPKT_FIFO;
     addr = s->rx_descriptor;
     while (size > 0) {
         if (!ftgmac100_can_receive(nc)) {
@@ -1001,8 +1002,6 @@ static ssize_t ftgmac100_receive(NetClientState *nc, const uint8_t *buf,
             /* Last buffer in frame.  */
             bd.des0 |= flags | FTGMAC100_RXDES0_LRS;
             s->isr |= FTGMAC100_INT_RPKT_BUF;
-        } else {
-            s->isr |= FTGMAC100_INT_RPKT_FIFO;
         }
         ftgmac100_write_bd(&bd, addr);
         if (bd.des0 & s->rxdes0_edorr) {
-- 
2.25.4

