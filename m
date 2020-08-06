Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp1629866lfy;
        Thu, 6 Aug 2020 06:23:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwKh/3SQdzhQtnqiWxYblj9vJAr7o6EUJO1Fv4RkVJoOTVhscwNCnmMXEdZsOFntF5hRGde
X-Received: by 2002:a25:e692:: with SMTP id d140mr12477337ybh.159.1596720232803;
        Thu, 06 Aug 2020 06:23:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1596720232; cv=none;
        d=google.com; s=arc-20160816;
        b=Rh8D3f3BseGpQ3QzoS8NqQS7Xu1eCNVLzyEoC6/X8wb4QMPNMNYrVX6JUZKAP4M/KK
         x6mke+38aMYojhMAxPGZh/sGT1xFo6PQYlAEDvhqz6m4qNMtvs3fx5e3m2QRAiPOGwsW
         3EOdmitqafNXfvGjcoh+qo0M9zbilc+MUTOJckAfuc+uEJdT45Vq3Dsxm3RY/btl+Bqf
         fXOrw3msdFkKzYI46brEF4Wb/uKM37C/+21GQnXlVsDwEA6TAn1RKOPp5QJEPBCIQONQ
         PjtikezGXJkJt8N/epBXtsQtXTDedU3lsY++14rW71OihIagq4khje/fjPpE+vtACsdX
         gwbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=yhaJkyyOYV0lStjBtefpG9v1+1cVWwL5dDxP4ri5gCM=;
        b=EpH4KJ3aa2z1YC70nI94VqNrSnLVnw8KIh5olbIyvir2p4TEAqUE9ENAloxeNXjKPa
         51LbgsqTa+wyHRBu6aChOq2nCCC+XrZva5LA8iOBcsvX8DlDpLV15RY31rOtk2HgIPmH
         tzXG6HfQV7HO/rTKWpWJtBpLCtPaJuLeBn5nC5SLuUT3ARz9Fq8GksQDOG1neS9y94/9
         bge+GsRI4LW+69WJStOPvIGTmTuc1f5286O+FQRb5q03a8lMTGjqUKNnSQz9CzAbLKnF
         C5hsDqQTmG8tdqSgi8P+CA7vvSuogm+kOfuix7yfWhhw/roV12HJDmj5ctBcZGZAMvyt
         yswg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 128si4400382ybc.213.2020.08.06.06.23.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 06 Aug 2020 06:23:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:32838 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k3fs7-0006ZL-NC
	for alex.bennee@linaro.org; Thu, 06 Aug 2020 09:23:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48996)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1k3fpj-0001WP-Rh; Thu, 06 Aug 2020 09:21:23 -0400
Received: from smtpout1.mo804.mail-out.ovh.net ([79.137.123.220]:34959)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1k3fpf-0000vf-81; Thu, 06 Aug 2020 09:21:23 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.1.125])
 by mo804.mail-out.ovh.net (Postfix) with ESMTPS id 28BB9545F8A6;
 Thu,  6 Aug 2020 15:21:13 +0200 (CEST)
Received: from kaod.org (37.59.142.103) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3; Thu, 6 Aug 2020
 15:21:12 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-103G00527712dc6-83c6-4c61-9838-a29276fd3aac,
 96EDEDBD7B7627A0205C40E9E2B74F8D513A659B) smtp.auth=clg@kaod.org
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH for-5.2 09/19] ftgmac100: Fix registers that can be read
Date: Thu, 6 Aug 2020 15:20:56 +0200
Message-ID: <20200806132106.747414-10-clg@kaod.org>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20200806132106.747414-1-clg@kaod.org>
References: <20200806132106.747414-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.103]
X-ClientProxiedBy: DAG8EX2.mxp5.local (172.16.2.72) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: f1198358-bbbb-461c-abfb-48ba911dbb1b
X-Ovh-Tracer-Id: 272467780893641577
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
X-TUID: lGTFszg4ygor

Receive Ring Base Address Register (RXR_BADR) and the Normal Priority
Transmit Receive Ring Base Address Register (NPTXR_BADR) can als be
read.

Cc: Frederic Konrad <konrad.frederic@yahoo.fr>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/net/ftgmac100.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/hw/net/ftgmac100.c b/hw/net/ftgmac100.c
index 5f4b26fc5f3c..0348fcf45676 100644
--- a/hw/net/ftgmac100.c
+++ b/hw/net/ftgmac100.c
@@ -669,6 +669,10 @@ static uint64_t ftgmac100_read(void *opaque, hwaddr addr, unsigned size)
         return s->math[0];
     case FTGMAC100_MATH1:
         return s->math[1];
+    case FTGMAC100_RXR_BADR:
+        return s->rx_ring;
+    case FTGMAC100_NPTXR_BADR:
+        return s->tx_ring;
     case FTGMAC100_ITC:
         return s->itc;
     case FTGMAC100_DBLAC:
-- 
2.25.4

