Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp1639289lfy;
        Thu, 6 Aug 2020 06:33:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyruMDOD4czByK/N48h7LRvCAT0cFfKQ8w5BN2zK4ljN88tNfI4sMBElffZh78mijUTWq1f
X-Received: by 2002:a25:e83:: with SMTP id 125mr14005228ybo.376.1596720835448;
        Thu, 06 Aug 2020 06:33:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1596720835; cv=none;
        d=google.com; s=arc-20160816;
        b=jmMy062eM+5qm5xKpsT9i0Ld3HIJxwFL5i+dCGBX/N64R1LHZyIrMDGpb7z0ZmlKu5
         cIfTlF9AtiT0Wak6IUjM3vnTogDGzh8XNFWtJtiY5GqCUyvJpdjDSmeerltt3T2xsyty
         ol3H6liHhNyrK2d3J4TwG3uWAbCxu7rJZA3vxE9b1mnirtyUjKW78oD6YYYdITVD1uG/
         WEROVKD3MfGiE3/n4QnJ0sF0fS2fiD+rNNkwz46V56NcSMm3kISwtrFUE0qPnlA9WJlz
         fRpiWg6iY/T/DAVZaCQQvqSTcti/Zo+QMC1eBxDnCEjCcrH045drg70AsMVIwjSJL1Ck
         im8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=zDlpFlylnWidJcRXIcZJdb17AjwGuXwSbJwDWCOInBc=;
        b=SHk++rX9ahp+bI7tdCSP0/7RkHGCn/uwm5lc7Q5Z/r++WJCe43K6s2C93IpTX2EFhy
         PbWLVPBw5rSX9inF4OCOLu6HA0ndUtWmpUaZ/RFhUQ5gtQK4hUtAp6E6SqfehpKTw6YE
         cY2VaMfh5RqO/Usr6+ReGExjP1PNncToA1+R1kTO9jWyaj8kElxPxAIL3U1JR978xmCA
         S2hJh+wDhoiaHrq90F3VHko+vngzFuZAbWrBc/1ryIIQDWNyAE7RZpbcc8HWWU3EqWFD
         jrlQbITiY+uzgOL+b7y2k1gSY0gMPxsNTISdfzzn1RTpR7ixkb50h5bvNgwt3kTI2Or1
         OeLg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k20si4973841ybf.78.2020.08.06.06.33.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 06 Aug 2020 06:33:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:48044 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k3g1q-0007pD-SI
	for alex.bennee@linaro.org; Thu, 06 Aug 2020 09:33:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49062)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1k3fpm-0001fP-PR; Thu, 06 Aug 2020 09:21:27 -0400
Received: from smtpout1.mo804.mail-out.ovh.net ([79.137.123.220]:58469)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1k3fpg-0000wX-UU; Thu, 06 Aug 2020 09:21:26 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.16.9])
 by mo804.mail-out.ovh.net (Postfix) with ESMTPS id 9B8F7545F8B4;
 Thu,  6 Aug 2020 15:21:15 +0200 (CEST)
Received: from kaod.org (37.59.142.103) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3; Thu, 6 Aug 2020
 15:21:15 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-103G00503397b68-57b0-4252-8284-b3f72d3db1f4,
 96EDEDBD7B7627A0205C40E9E2B74F8D513A659B) smtp.auth=clg@kaod.org
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH for-5.2 15/19] ftgmac100: Improve software reset
Date: Thu, 6 Aug 2020 15:21:02 +0200
Message-ID: <20200806132106.747414-16-clg@kaod.org>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20200806132106.747414-1-clg@kaod.org>
References: <20200806132106.747414-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.103]
X-ClientProxiedBy: DAG8EX2.mxp5.local (172.16.2.72) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: ad1596c2-9823-4f34-bcb6-a6c4e5879378
X-Ovh-Tracer-Id: 273312202425142121
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
X-TUID: 4A9LGYEHu3hH

The software reset of the MAC needs a finer granularity. Not all
registers are reseted and some setting in MACCR are kept.

Cc: Frederic Konrad <konrad.frederic@yahoo.fr>
Fixes: bd44300d1afc ("net: add FTGMAC100 support")
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/net/ftgmac100.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/net/ftgmac100.c b/hw/net/ftgmac100.c
index 987b843fabc4..0740049c5268 100644
--- a/hw/net/ftgmac100.c
+++ b/hw/net/ftgmac100.c
@@ -655,11 +655,10 @@ static void ftgmac100_reset(DeviceState *d)
     s->itc = 0;
     s->aptcr = 1;
     s->dblac = 0x00022f00;
-    s->revr = 0;
     s->fear1 = 0;
     s->tpafcr = 0xf1;
 
-    s->maccr = 0;
+    s->maccr &= FTGMAC100_MACCR_GIGA_MODE | FTGMAC100_MACCR_FAST_MODE;
     s->phycr = 0;
     s->phydata = 0;
     s->fcr = 0x400;
@@ -812,6 +811,7 @@ static void ftgmac100_write(void *opaque, hwaddr addr,
     case FTGMAC100_MACCR: /* MAC Device control */
         s->maccr = value;
         if (value & FTGMAC100_MACCR_SW_RST) {
+            /* TODO: rework software reset to have a finer granularity */
             ftgmac100_reset(DEVICE(s));
         }
 
-- 
2.25.4

