Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp1633105lfy;
        Thu, 6 Aug 2020 06:27:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyRupvlefA1K3F93/0zMVYU6H8I4JQXhX6k3eT7xeuDc7Lf7YvTB+4KF3CCJu+ubPAbu+uM
X-Received: by 2002:a25:257:: with SMTP id 84mr12074088ybc.259.1596720427576;
        Thu, 06 Aug 2020 06:27:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1596720427; cv=none;
        d=google.com; s=arc-20160816;
        b=MNH78vL+LqXZGtk5CqmvM22OrC6CuPSL2o4Q3pyxMyUrBiPNGA4qqIneB/6V5OLkYw
         cJ9897v2SvLmDWZeyjt2PhiiE7vMLYcd2m+Kp7tus1qSHHv2kU4YCtn01QStbPrStjqn
         M0fonDifLw9BPIvwaO0cFylodMRmUi2aJTYH7ShXJDT79270cyBW1Y37T0o8UEx+V7Wl
         fxTGTMqAxkbwjrc65WJU+w4Q7a186T1+3WKk4uCthd6iVmBpmUsS797Y4tH3CEx2lyD9
         yCepSJ75DHMRTxObYAGnh6GlquLR/eyaW7wq3a74j27J//gTbe+NVcJ0olPBthyL7feC
         xPNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=yREtvw8AYe8qFFGLCebUlQcnuEtypb1CzRlg4GxEFms=;
        b=rzlw3B/+S4W9JCmkD/+13Hf1nIsbGN43jc1EeWhzVeeccWVwVNayYo0aa0Fgdu6qME
         OwBwJCKY6pHYkhQQEn01oKguswSebQ4bISgE4EaSyE9CONOmxDlpU+IYETFFnaRDyFWK
         D/BAKQoEkWwLXDoEPdYn1tQdBPkppjyoRPjoaOOvthmN7yGRuBhgM1q5j4qRU2uAPZ6C
         +F2JTf0MWY4u+J+1JKFwg4HTiUZ9BQVw4FCUaBVn61JNcDL1aUCePoCBHnW0yVIF8FDT
         Ws4uMnt8+C3mqCTaif7iJq5fz8UN3UZI96eehM5iiWgmX05NKrPIJhjuhZYd+IB6bAjr
         5L3w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v6si4772359ybc.228.2020.08.06.06.27.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 06 Aug 2020 06:27:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:44912 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k3fvG-0003J3-DU
	for alex.bennee@linaro.org; Thu, 06 Aug 2020 09:27:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49040)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1k3fpl-0001cf-Mz; Thu, 06 Aug 2020 09:21:25 -0400
Received: from smtpout1.mo529.mail-out.ovh.net ([178.32.125.2]:40669)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1k3fpc-0000uu-Qm; Thu, 06 Aug 2020 09:21:25 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.16.9])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 99D2A4DAE2CF;
 Thu,  6 Aug 2020 15:21:14 +0200 (CEST)
Received: from kaod.org (37.59.142.103) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3; Thu, 6 Aug 2020
 15:21:14 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-103G0051bbf6167-98c6-44de-b3c4-1704d2129dee,
 96EDEDBD7B7627A0205C40E9E2B74F8D513A659B) smtp.auth=clg@kaod.org
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH for-5.2 13/19] ftgmac100: Check for invalid len and address
 before doing a DMA transfer
Date: Thu, 6 Aug 2020 15:21:00 +0200
Message-ID: <20200806132106.747414-14-clg@kaod.org>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20200806132106.747414-1-clg@kaod.org>
References: <20200806132106.747414-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.103]
X-ClientProxiedBy: DAG8EX2.mxp5.local (172.16.2.72) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 775351e5-b319-49bf-af01-7c26acffe14c
X-Ovh-Tracer-Id: 273030727588547433
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
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Frederic Konrad <konrad.frederic@yahoo.fr>,
 Andrew Jeffery <andrew@aj.id.au>, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: UVv8eCsvsZVw

According to the Aspeed specs, no interrupts are raised in that case
but a "Tx-packets lost" status seems like a good modeling choice for
all implementations. It is covered by the Linux kernel.

Cc: Frederic Konrad <konrad.frederic@yahoo.fr>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/net/ftgmac100.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/hw/net/ftgmac100.c b/hw/net/ftgmac100.c
index 014980d30aca..280aa3d3a1e2 100644
--- a/hw/net/ftgmac100.c
+++ b/hw/net/ftgmac100.c
@@ -507,6 +507,15 @@ static void ftgmac100_do_tx(FTGMAC100State *s, uint32_t tx_ring,
         }
 
         len = FTGMAC100_TXDES0_TXBUF_SIZE(bd.des0);
+        if (!len) {
+            /*
+             * 0 is an invalid size, however the HW does not raise any
+             * interrupt. Flag an error because the guest is buggy.
+             */
+            qemu_log_mask(LOG_GUEST_ERROR, "%s: invalid segment size\n",
+                          __func__);
+        }
+
         if (frame_size + len > sizeof(s->frame)) {
             qemu_log_mask(LOG_GUEST_ERROR, "%s: frame too big : %d bytes\n",
                           __func__, len);
-- 
2.25.4

