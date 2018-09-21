Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp3345298wrd;
        Fri, 21 Sep 2018 09:37:43 -0700 (PDT)
X-Google-Smtp-Source: ANB0VdZB5pace1BbIxJjM5ZR5xBNcbN5g3gLl3d5/KbisLlvr3ZYDhka2j+o9uFbKaZqj28nxSnM
X-Received: by 2002:ac8:2e2b:: with SMTP id r40-v6mr32292453qta.12.1537547863837;
        Fri, 21 Sep 2018 09:37:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1537547863; cv=none;
        d=google.com; s=arc-20160816;
        b=EsLJbQN942l5DzJlwPx0f8CjEcxf4s/kYRT4GUMEaHrQwRUjr6uN59rzk+qFt/hQPd
         z1ReuOQ9OSO9069DUhf+tT73OrKFReDJW0Mr71SYx5SUpYQyTKWMoZddtGqmQmrgfV7Z
         WJrxA+SJIlrEGNoFperNPVd34fv6RYROEBjdrPzz0jZNa2+DPA5I0KEMavgIYRX96R8g
         jCYqbXAwLXxijRoqoGKkoomNRuAU85Kv/fMtHeiagbAzGbFGb5yFIoBaAPISrEChcDxk
         06CxCaPRfbe4WQqBY5QTrQWvF6Q2rmPgqwciTK5vpipB69KTU8zLg5eLhmlYD0NidjrH
         driA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=DQ5e0e8TTEqhfbJfFKoLMf4TNJ4hLAFS1gf7HVIbTwE=;
        b=j+KyO9q1MDXEWvL9G9x4DA4u7bd3WFnACtsDp8nBEP3/2hroA43xM84ysMtggYJrL0
         qr6bId4tuftGvoWqajk32F6nmOOf7Z/LQSX1HI/1el1aoc/4Mnpm5sEQK+DvdOQVFH0t
         8XudkK1BPKC9T7fwJLxD/3LZR2Yx2m2+myvbr66fhiuF2+k6G0GhKMCvxn1JLhngiQ+/
         qZ7F2QhNnnN4ieUf7eT5gx5gRJQ6BUhC6Gs9DwvJ2sKIqS/ZMCYiF5pm/2pk6gmtYQB9
         ATT3YhIULv2+bK+l/EPPNMADmjwkSsGpGxXlELiJg05SUW0zgQaAhTq8A8zKsSWyNBIX
         rC2A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b191-v6si5780434qka.238.2018.09.21.09.37.43
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 21 Sep 2018 09:37:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:56484 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g3OR5-0002wM-8M
	for alex.bennee@linaro.org; Fri, 21 Sep 2018 12:37:43 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42536)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1g3OQm-0002Cm-Nj
	for qemu-arm@nongnu.org; Fri, 21 Sep 2018 12:37:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1g3OBQ-0004eT-Fb
	for qemu-arm@nongnu.org; Fri, 21 Sep 2018 12:21:35 -0400
Received: from 12.mo7.mail-out.ovh.net ([178.33.107.167]:32835)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1g3OBQ-0004eB-7o
	for qemu-arm@nongnu.org; Fri, 21 Sep 2018 12:21:32 -0400
Received: from player799.ha.ovh.net (unknown [10.109.160.251])
	by mo7.mail-out.ovh.net (Postfix) with ESMTP id 08DA6DDCAE
	for <qemu-arm@nongnu.org>; Fri, 21 Sep 2018 18:21:31 +0200 (CEST)
Received: from zorba.kaod.org.com (LFbn-1-10605-110.w90-89.abo.wanadoo.fr
	[90.89.196.110]) (Authenticated sender: clg@kaod.org)
	by player799.ha.ovh.net (Postfix) with ESMTPSA id AE1FD5200B6;
	Fri, 21 Sep 2018 18:21:21 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-devel@nongnu.org
Date: Fri, 21 Sep 2018 18:19:38 +0200
Message-Id: <20180921161939.822-11-clg@kaod.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180921161939.822-1-clg@kaod.org>
References: <20180921161939.822-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 1912340993998490432
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedtjedrledvgddutddvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 178.33.107.167
Subject: [Qemu-arm] [PATCH v2 10/11] aspeed/smc: inject errors in DMA
 checksum
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
	Alistair Francis <alistair@alistair23.me>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-arm@nongnu.org, Joel Stanley <joel@jms.id.au>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Bjqb4NWH+vaM

Emulate read errors in the DMA Checksum Register for high frequencies
and optimistic settings of the Read Timing Compensation Register. This
will help in tuning the SPI timing calibration algorithm.

The values below are those to expect from the first flash device of
the FMC controller of a palmetto-bmc machine.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 hw/ssi/aspeed_smc.c | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/hw/ssi/aspeed_smc.c b/hw/ssi/aspeed_smc.c
index db89c54dfc9f..01c3fd7b2666 100644
--- a/hw/ssi/aspeed_smc.c
+++ b/hw/ssi/aspeed_smc.c
@@ -751,6 +751,30 @@ static void aspeed_smc_dma_calibration(AspeedSMCStat=
e *s)
     s->regs[s->r_ctrl0 + cs] |=3D CE_CTRL_CLOCK_FREQ(hclk_div);
 }
=20
+static bool aspeed_smc_inject_read_failure(AspeedSMCState *s)
+{
+    uint8_t delay =3D
+        (s->regs[R_DMA_CTRL] >> DMA_CTRL_DELAY_SHIFT) & DMA_CTRL_DELAY_M=
ASK;
+    uint8_t hclk_mask =3D
+        (s->regs[R_DMA_CTRL] >> DMA_CTRL_FREQ_SHIFT) & DMA_CTRL_FREQ_MAS=
K;
+
+    /*
+     * Typical values of a palmetto-bmc machine.
+     */
+    switch (aspeed_smc_hclk_divisor(hclk_mask)) {
+    case 4 ... 16:
+        return false;
+    case 3: /* at least one HCLK cycle delay */
+        return (delay & 0x7) < 1;
+    case 2: /* at least two HCLK cycle delay */
+        return (delay & 0x7) < 2;
+    case 1: /* (> 100MHz) is above the max freq of the controller */
+        return true;
+    default:
+        g_assert_not_reached();
+    }
+}
+
 /*
  * Accumulate the result of the reads to provide a checksum that will
  * be used to validate the read timing settings.
@@ -788,6 +812,11 @@ static void aspeed_smc_dma_checksum(AspeedSMCState *=
s)
         s->regs[R_DMA_FLASH_ADDR] +=3D 4;
         s->regs[R_DMA_LEN] -=3D 4;
     }
+
+    if (aspeed_smc_inject_read_failure(s)) {
+        s->regs[R_DMA_CHECKSUM] =3D 0xbadc0de;
+    }
+
 }
=20
 static void aspeed_smc_dma_rw(AspeedSMCState *s)
--=20
2.17.1

