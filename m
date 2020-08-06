Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp1631369lfy;
        Thu, 6 Aug 2020 06:25:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzl9F+iWgxfWjZZPIsh7N0Ea7FJp6OWXsVHWYaHxcR+g6Lk6aMMwpIwe4vuNowtUlG9ydZu
X-Received: by 2002:a25:9249:: with SMTP id e9mr13781191ybo.105.1596720323326;
        Thu, 06 Aug 2020 06:25:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1596720323; cv=none;
        d=google.com; s=arc-20160816;
        b=OH10oUOaU3ujmPK3wvbYuEggFm+CdMc9J3e6/KG9KPYerall8BBWLY/FXA0x6R0g+s
         qLQZ3C10lcoiWStJqXTsNPcZW3WssMksFYscLZSVzfCohKGnuHVy/5RH16Yyv+OnsTdU
         YrwEhSHLynByUT3/CeBYEDKcPSfu2WeQ1Eizn4EQG4UZ8rYlhc3VJWtcxEX5zIVRky1c
         F8AEDkQogRZUirE81zTDkGoTuh9CLCMycTE4kZ4M6pjjt20seHnX5T1iGEYnCpHSQfsj
         hfVdkhmLNDpTpC0mug8CE7LxqbdwOwyOtXLLtcVrczAd1iXqVYw68EttYpaMi1J9u3BZ
         kShA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=FaGa1AtlKaxjGpilMzn0MA+rnt7/i6NPynuz4p96JNg=;
        b=oaOpjXiVUGoG/77Grpv6rkxjg1zep+ZJWMQS4toJDJe3XHSy77fYIcfutngDYcz8wk
         b+b55cVFom/XC72xdjAUepbCp0ZZIGMcL4kez7SjtIkHKfUSEdvvoTcn7aWtn9WMkOT6
         VXxbNR+7pJA+1WjCyxr3qcelRkLtCNJbkp/oo4o2aaA2bLaXwxOMQvdZtbmfDGmat2z2
         YGrlyI0gFr2/38vRD2ZSg6QPPQEmkVjQezaoZvwghblAzfX2VEuQJxSgL813/3Rfq1oy
         ufyR4XHGvevtKM9YY60zJPpHsvPscVInje7dQ/3s+ah19cFo0YBQ4YUDayXr7IM3c4eS
         2b+w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f64si5003376ybf.272.2020.08.06.06.25.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 06 Aug 2020 06:25:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:38892 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k3fta-0000lY-LT
	for alex.bennee@linaro.org; Thu, 06 Aug 2020 09:25:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48970)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1k3fpi-0001Sz-RP; Thu, 06 Aug 2020 09:21:22 -0400
Received: from smtpout1.mo804.mail-out.ovh.net ([79.137.123.220]:34793)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1k3fpf-0000vc-82; Thu, 06 Aug 2020 09:21:22 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.1.125])
 by mo804.mail-out.ovh.net (Postfix) with ESMTPS id 5CEF3545F8A7;
 Thu,  6 Aug 2020 15:21:13 +0200 (CEST)
Received: from kaod.org (37.59.142.103) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3; Thu, 6 Aug 2020
 15:21:12 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-103G00540107a35-d1b1-4246-bc5e-8ea7b807d7f7,
 96EDEDBD7B7627A0205C40E9E2B74F8D513A659B) smtp.auth=clg@kaod.org
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH for-5.2 10/19] ftgmac100: Fix interrupt status "Packet
 transmitted on ethernet"
Date: Thu, 6 Aug 2020 15:20:57 +0200
Message-ID: <20200806132106.747414-11-clg@kaod.org>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20200806132106.747414-1-clg@kaod.org>
References: <20200806132106.747414-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.103]
X-ClientProxiedBy: DAG8EX2.mxp5.local (172.16.2.72) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: d102f4ee-63c3-452c-8218-545d1a87ad79
X-Ovh-Tracer-Id: 272749254968380265
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
X-TUID: loN5L0eFhyue

The second field of the TX descriptor has a set of flags to choose
when the transmit interrupt is raised : after the packet has been sent
on the ethernet or after it has been moved into the TX FIFO. But we
don't model that today.

Simply raise the "Packet transmitted on ethernet" the interrupt status
bit as soon as the packet is sent by QEMU.

Cc: Frederic Konrad <konrad.frederic@yahoo.fr>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/net/ftgmac100.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/hw/net/ftgmac100.c b/hw/net/ftgmac100.c
index 0348fcf45676..aa3c05ef9882 100644
--- a/hw/net/ftgmac100.c
+++ b/hw/net/ftgmac100.c
@@ -547,9 +547,7 @@ static void ftgmac100_do_tx(FTGMAC100State *s, uint32_t tx_ring,
             qemu_send_packet(qemu_get_queue(s->nic), s->frame, frame_size);
             ptr = s->frame;
             frame_size = 0;
-            if (flags & FTGMAC100_TXDES1_TXIC) {
-                s->isr |= FTGMAC100_INT_XPKT_ETH;
-            }
+            s->isr |= FTGMAC100_INT_XPKT_ETH;
         }
 
         if (flags & FTGMAC100_TXDES1_TX2FIC) {
-- 
2.25.4

