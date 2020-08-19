Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp313664lfy;
        Wed, 19 Aug 2020 03:11:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxAA7TQqzmYeSY+4zDmNXwnFmSsFdm5VSZOVpflpU/3dNrbLRq3mmYWydFvha5eIGFzhqF4
X-Received: by 2002:a25:950:: with SMTP id u16mr33634443ybm.86.1597831882788;
        Wed, 19 Aug 2020 03:11:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1597831882; cv=none;
        d=google.com; s=arc-20160816;
        b=s8AvpC/YKYDIJBJ/VPBaFIMuUVBGf+rMVOAU6ewkOpVmoU83DMbbK3+CJ4/a+FpHOn
         XdtJ9orjxuk4W2pfybjrm4Jwjxp0ji6qwXpz4weXYZ1wuxVuim3yabRC5KPigdDwogp+
         15161zpVyoiL2fw+zjETv4dNLI10yxC5iUl9AtxX/aHQCuAA2rdD4vZDv2z0nyhifADA
         QHHM+WT6WpaiIUJBEmUebk/ozP3g+qkpjD/dIf++1trgL1Ie78Axh3wdizsH7kmSRTOK
         C2E1t7csB4m7dwP5We3LqSFPHnEQ6T21KHQvVJCIR9ouyVJOoC70x7aZIygLP+pfXP/2
         lVaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=uUshmBQtFhhRerWCvFOLfLdZnBtcnpKc5r4AMHja7oA=;
        b=bot6JBBBZF46UbTFdK4DGQPmC3BxW45+nDZj00AW0zSvb5yp8Edd3rDhY9BhSZfcdy
         XQF6wNx9bf8coU9T3CcZ4HRJsVVbWQy8J69xwRdfns0EBX9xEgg6sJl4mvKIPNxRPEhO
         ZVydJi3D2cXv8EVvl8X9Zjp643rMBDjhJ+FvUjRPYCCBa3dgVbnDWuZ7KapupfAl6SG9
         SlgJ+ryrYGgf3tUP8tvhubO/iwOJnL+ktngTCf1iy4maS325bPG86xMbTn2gw61ckrhb
         nl0U6BZ6YC7gTDqK4baHsuSRMN5BGRTHfmKg2k3YAfXR3pdK/67U9MQhGAowwq5t+v6H
         mcug==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x135si24762508ybg.443.2020.08.19.03.11.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 19 Aug 2020 03:11:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:54704 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k8L3x-0003BW-SW
	for alex.bennee@linaro.org; Wed, 19 Aug 2020 06:11:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56034)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1k8L2q-000184-Nr; Wed, 19 Aug 2020 06:10:12 -0400
Received: from smtpout1.mo529.mail-out.ovh.net ([178.32.125.2]:36791)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1k8L2n-0006XK-T9; Wed, 19 Aug 2020 06:10:12 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.138.132])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 6603151E25CB;
 Wed, 19 Aug 2020 12:10:08 +0200 (CEST)
Received: from kaod.org (37.59.142.101) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3; Wed, 19 Aug
 2020 12:10:07 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-101G004db25bba5-f84c-4ef8-9e7e-893cc3fe1695,
 56ABA3BD09B5898CED80C8E013D4E39E9C6048D1) smtp.auth=clg@kaod.org
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v2 13/21] ftgmac100: Check for invalid len and address before
 doing a DMA transfer
Date: Wed, 19 Aug 2020 12:09:48 +0200
Message-ID: <20200819100956.2216690-14-clg@kaod.org>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20200819100956.2216690-1-clg@kaod.org>
References: <20200819100956.2216690-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.101]
X-ClientProxiedBy: DAG1EX1.mxp5.local (172.16.2.1) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 665f476e-9059-4934-9b81-37117833da58
X-Ovh-Tracer-Id: 18050427309869927273
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduiedruddtkedgvdduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvufffkffojghfgggtgfhisehtkeertdertdejnecuhfhrohhmpeevrogurhhitgcunfgvucfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepheehfeegjeeitdfffeetjeduveejueefuefgtdefueelueetveeliefhhffgtdelnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutddunecuvehluhhsthgvrhfuihiivgepgeenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopegtlhhgsehkrghougdrohhrgh
Received-SPF: pass client-ip=178.32.125.2; envelope-from=clg@kaod.org;
 helo=smtpout1.mo529.mail-out.ovh.net
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/19 06:10:05
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
X-TUID: ESfeG25UFEPN

According to the Aspeed specs, no interrupts are raised in that case
but a "Tx-packets lost" status seems like a good modeling choice for
all implementations. It is covered by the Linux kernel.

Cc: Frederic Konrad <konrad.frederic@yahoo.fr>
Reviewed-by: Joel Stanley <joel@jms.id.au>
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

