Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp316211lfy;
        Wed, 19 Aug 2020 03:15:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyUoeaI0wpMdnobMbzU/MkE0x0YWc6rpvxHWvk0nnMWjiIGkncdFYKHSpXPJmeJzVEeHKSi
X-Received: by 2002:a5b:60e:: with SMTP id d14mr31116181ybq.210.1597832128730;
        Wed, 19 Aug 2020 03:15:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1597832128; cv=none;
        d=google.com; s=arc-20160816;
        b=Zlr+umoeqCULypCiwcufp+UabLlas0xmMH0OZ0izDzcS6Xn3K2VQnlUxU4ZiF3RYCt
         B9Vlt2vUC+SKiHqkCUzCrXrXKOP4rzAJRJbj419qpDz4WE3E/iCmPpQdPWMypUIp9bC/
         BMpxZrQ5mxiv3uwuorz/j5g5/Ang7R1orjZxyc4TpY37yA/wtUV5C1aMZ+W9E8I5Zex8
         RB3t/b5yBHehW98n4mWmc7kE+500POicJphMxc7A9P04Sd/xNOcYv/L3IUPyMfJ5C/hk
         tL5RNf14s0jnDgtohG+eSdzN/Um+Z38rLW+u/eTM5lIe6HveCMyq0p5FAt7o65pUvHve
         IyLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=cLidXG4AX0Yz/ZNZEpXRPy5xCsOEy4dXJUuzSkxWxLc=;
        b=yAShbReKI3OO0iPQHuPK0kvAQxmb+TBWiDxc4WeAs/fvdudo/mV9tRN2vVzaxdT4Ex
         rFk0LGQw5TGa8tdTcnWhwZDHGdq0IZBNpPlchJlCdL1ad+s/VwV3pVwW4q3IsgwmLg6P
         B4Xjnt5f2S/dbMZdRAcyQy8ESpAKudB3JgZpTTWIX/3pgLmsrpmYoy0FbELhnHB+utr1
         cxmYBxreyttQt7qNB+UjaOXUjNB/rOvX3INvHZw9qeV9YNzgwAXddYVC6TY43mbqh/3w
         7tVwbcTt+Cs2Fbnqao76jsm1VqAE3JkgO7sz89LzeK3SPnw40aRhXpJMxR6tpb7GH6nN
         REJA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o85si23781174yba.140.2020.08.19.03.15.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 19 Aug 2020 03:15:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:50486 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k8L7w-0004TT-0e
	for alex.bennee@linaro.org; Wed, 19 Aug 2020 06:15:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56240)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1k8L2x-0001QM-Et; Wed, 19 Aug 2020 06:10:19 -0400
Received: from smtpout1.mo529.mail-out.ovh.net ([178.32.125.2]:39909)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1k8L2t-0006Wl-N0; Wed, 19 Aug 2020 06:10:19 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.4.188])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 501B351E25C5;
 Wed, 19 Aug 2020 12:10:06 +0200 (CEST)
Received: from kaod.org (37.59.142.101) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3; Wed, 19 Aug
 2020 12:10:05 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-101G0047e21fdb5-55bf-4ba1-9288-1191cd30d10f,
 56ABA3BD09B5898CED80C8E013D4E39E9C6048D1) smtp.auth=clg@kaod.org
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v2 10/21] ftgmac100: Fix interrupt status "Packet transmitted
 on ethernet"
Date: Wed, 19 Aug 2020 12:09:45 +0200
Message-ID: <20200819100956.2216690-11-clg@kaod.org>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20200819100956.2216690-1-clg@kaod.org>
References: <20200819100956.2216690-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.101]
X-ClientProxiedBy: DAG1EX1.mxp5.local (172.16.2.1) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 9fc5048e-3ece-4647-a7f0-16f5242f4a47
X-Ovh-Tracer-Id: 18049864358838111081
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduiedruddtkedgvdduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvufffkffojghfgggtgfhisehtkeertdertdejnecuhfhrohhmpeevrogurhhitgcunfgvucfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepheehfeegjeeitdfffeetjeduveejueefuefgtdefueelueetveeliefhhffgtdelnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutddunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopegtlhhgsehkrghougdrohhrgh
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
X-TUID: s6m0x+Xl2mMa

The second field of the TX descriptor has a set of flags to choose
when the transmit interrupt is raised : after the packet has been sent
on the ethernet or after it has been moved into the TX FIFO. But we
don't model that today.

Simply raise the "Packet transmitted on ethernet" interrupt status bit
as soon as the packet is sent by QEMU.

Cc: Frederic Konrad <konrad.frederic@yahoo.fr>
Reviewed-by: Joel Stanley <joel@jms.id.au>
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

