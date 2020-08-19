Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp316426lfy;
        Wed, 19 Aug 2020 03:15:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyDFL1tRXygfeQ0AfBMwNwoJObRlaB0O1+cyElITLBDxOM57anPdo6zA3PWluIwfntYpQOG
X-Received: by 2002:a25:b790:: with SMTP id n16mr33275632ybh.48.1597832146657;
        Wed, 19 Aug 2020 03:15:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1597832146; cv=none;
        d=google.com; s=arc-20160816;
        b=WgSvzToAEXJewgJd+b6qbiGRQ2LVZzat3iCtaqnGDj2EXAFixm9Cde/736B4crXjSF
         HJv0dxgm1bPOghO2up4AFSviPoiuXql0Ms0dHPURVRk1E+YMJQhBi6yxtYsKnavmOCoi
         KZks/26QZ/fqT6sb+b0QCgxb9vUnPcfvaAzUT3AI5BzP7zQuQQ69xU7iTv/6Q4nFytJt
         8jGWIOfwI/Et5bhtoWJaibTx7Gn/bPlIVrMHry0Zhz5U9WbW9fiEsLTrh07tJgFuA+Z9
         WGGNTSdGeOcH1f/zPi6IPkBloslwQI3fNI2TfdaWYACWA4nfoFE1VwknC2ZrQ4Up3Mtq
         S0JA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=sz4+oLnfVkCT4MDMEo0nHCozpn8kJIW3Sv7b4XpIYe0=;
        b=ra6SBkwab8ZpNeI4LLjj6dUuIX3O7bD1Zb50LNXOhnLT1493P54gxL6/lTBKbLRMLh
         vHiAl2LjY/8E5ZQncvxqXibAu432dZn/ZFp5ERz+O47rDypLkUsn5cw2w3HW2bs4pz/v
         JX5K0C0qucZXBq5rKnG6C4somrWTyoATLelVCPrUH1o2LIwDSQEM7ZAbVP+JHGJauMxg
         8fkInSZnbOAMHVi+XAmXGwlLlZQwuGqQv6ojy43UjtZcLrq98/HDFybsTujpxOiJ2R+h
         CgIgc7J5+8iGboi2Ec4qeAJIRwYmcV9JMomQLsirNrEk3P0VtaMnuFc5rKQLmvoGBj5Q
         g2HQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s12si22462098ybk.472.2020.08.19.03.15.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 19 Aug 2020 03:15:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:51620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k8L8E-0004yD-0V
	for alex.bennee@linaro.org; Wed, 19 Aug 2020 06:15:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56268)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1k8L2y-0001S7-3d; Wed, 19 Aug 2020 06:10:20 -0400
Received: from smtpout1.mo804.mail-out.ovh.net ([79.137.123.220]:36739)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1k8L2t-0006Ys-Oa; Wed, 19 Aug 2020 06:10:19 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.143.236])
 by mo804.mail-out.ovh.net (Postfix) with ESMTPS id C8101589284D;
 Wed, 19 Aug 2020 12:10:07 +0200 (CEST)
Received: from kaod.org (37.59.142.101) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3; Wed, 19 Aug
 2020 12:10:06 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-101G00411e35553-d220-4a69-8271-b244b9c357e3,
 56ABA3BD09B5898CED80C8E013D4E39E9C6048D1) smtp.auth=clg@kaod.org
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v2 12/21] ftgmac100: Change interrupt status when a DMA error
 occurs
Date: Wed, 19 Aug 2020 12:09:47 +0200
Message-ID: <20200819100956.2216690-13-clg@kaod.org>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20200819100956.2216690-1-clg@kaod.org>
References: <20200819100956.2216690-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.101]
X-ClientProxiedBy: DAG1EX1.mxp5.local (172.16.2.1) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 290e18f3-aeac-4223-9d89-dec7e5ef4af1
X-Ovh-Tracer-Id: 18050145835629972329
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduiedruddtkedgvdduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvufffkffojghfgggtgfhisehtkeertdertdejnecuhfhrohhmpeevrogurhhitgcunfgvucfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepheehfeegjeeitdfffeetjeduveejueefuefgtdefueelueetveeliefhhffgtdelnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutddunecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopegtlhhgsehkrghougdrohhrgh
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
Cc: Frederic Konrad <konrad.frederic@yahoo.fr>,
 Andrew Jeffery <andrew@aj.id.au>, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: nO8Tx7nQMka1

The model uses today the "Normal priority transmit buffer unavailable"
interrupt status which it is not appropriate. According to the Aspeed
specs, no interrupts are raised in that case. An "AHB error" status
seems like a better modeling choice for all implementations since it
is covered by the Linux kernel.

Cc: Frederic Konrad <konrad.frederic@yahoo.fr>
Reviewed-by: Joel Stanley <joel@jms.id.au>
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

