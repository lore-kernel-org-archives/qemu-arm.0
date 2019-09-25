Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp883629wrp;
        Wed, 25 Sep 2019 07:42:05 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzoLfR7R5/1hXxDPWoxQmB+MBk+ExvtO5c1/nyCaw/pK43BLM3s+Auo2Yd/CcdOhJdqS1Q8
X-Received: by 2002:a37:a00d:: with SMTP id j13mr4023671qke.2.1569422524932;
        Wed, 25 Sep 2019 07:42:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1569422524; cv=none;
        d=google.com; s=arc-20160816;
        b=Qm5d+CyMQ7AKyRQbo6NLVzmj1E5hofW7UCx8o+oXyAoTwO43Mn3MrFHuMwcedfB98K
         CnnwHgPAlVeVFIsF8WuJ4BLHvhWnWRC6UTmlMhmKA0//C98h5bsYs/MMNiigUS+IqobN
         k+mC/dpCQE7dF3wzHOoeztx81IiLM7SnxKme/IIvqljlrAQVGamQEp2DIn4M3uPhaOUB
         lYfkPB01Ofo7wiMVjnQZAdqrUczhHtoWVEulGL3tZBjFi0dgffvEAQqu4eC7nTh/FdxG
         LlDt/4tRRVtjWpinPDcVkz3+d7z+DJ/UPCFRs+OlZPrGMtIiknwkANPsAHnPlMiWDuy6
         1LFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=C6QMlG7PKZ/tqPzr1RAmX7oc2+sMwySO2vGRo/D0FI0=;
        b=ncUzwLnoJke/P2C9YjL+aISeNHBUJufZLg2GGr8XERTmE19WkWYiK/d8O+0f5FO4E0
         7UfCITIGgeigX+QzptJSsqR0FTGhNobZQiNW+T/99OBt1blrEUvV/aG/XeY21XmphU3I
         dh+sb395XD656xz/n5LkRFN/iuKE1ZAycggvY/P0DZbHS+eNv43ae/ECz1VmeOdOHbJ5
         pd60yjD3o/rYJPQyXWvR11oZ7Vh+FWSBU4BV5rKieU0ytu4N7ZDVw+Eq0SswQoEFcLPg
         4QtG0PNqld/+amPqVO2r7uc2wbHuilKSMVrPw3WiuP5s+orGsds1FRCK4D6Ie10j+3wT
         DO/Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y38si4127083qvh.22.2019.09.25.07.42.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 25 Sep 2019 07:42:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:53046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iD8UV-0002Zn-PG
	for alex.bennee@linaro.org; Wed, 25 Sep 2019 10:42:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52236)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <clg@kaod.org>) id 1iD8M2-0003E6-Ar
 for qemu-devel@nongnu.org; Wed, 25 Sep 2019 10:33:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <clg@kaod.org>) id 1iD8M0-0000HO-DX
 for qemu-devel@nongnu.org; Wed, 25 Sep 2019 10:33:18 -0400
Received: from 3.mo69.mail-out.ovh.net ([188.165.52.203]:56290)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <clg@kaod.org>) id 1iD8Ly-0000Ef-Nt
 for qemu-devel@nongnu.org; Wed, 25 Sep 2019 10:33:15 -0400
Received: from player786.ha.ovh.net (unknown [10.109.160.253])
 by mo69.mail-out.ovh.net (Postfix) with ESMTP id 749E06ACE4
 for <qemu-devel@nongnu.org>; Wed, 25 Sep 2019 16:33:12 +0200 (CEST)
Received: from kaod.org (lfbn-1-2229-223.w90-76.abo.wanadoo.fr [90.76.50.223])
 (Authenticated sender: clg@kaod.org)
 by player786.ha.ovh.net (Postfix) with ESMTPSA id 37008A4D3B0F;
 Wed, 25 Sep 2019 14:33:04 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v2 01/23] aspeed/wdt: Check correct register for clock source
Date: Wed, 25 Sep 2019 16:32:26 +0200
Message-Id: <20190925143248.10000-2-clg@kaod.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190925143248.10000-1-clg@kaod.org>
References: <20190925143248.10000-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 8838314271755242257
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedrfedvgdejkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 188.165.52.203
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Amithash Prasad <amithash@fb.com>,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: C+nA+JJXNBoi

From: Amithash Prasad <amithash@fb.com>

When WDT_RESTART is written, the data is not the contents
of the WDT_CTRL register. Hence ensure we are looking at
WDT_CTRL to check if bit WDT_CTRL_1MHZ_CLK is set or not.

Signed-off-by: Amithash Prasad <amithash@fb.com>
[clg: improved Suject prefix ]
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
Reviewed-by: Joel Stanley <joel@jms.id.au>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 hw/watchdog/wdt_aspeed.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/watchdog/wdt_aspeed.c b/hw/watchdog/wdt_aspeed.c
index 9b932134172c..f710036535da 100644
--- a/hw/watchdog/wdt_aspeed.c
+++ b/hw/watchdog/wdt_aspeed.c
@@ -140,7 +140,7 @@ static void aspeed_wdt_write(void *opaque, hwaddr off=
set, uint64_t data,
     case WDT_RESTART:
         if ((data & 0xFFFF) =3D=3D WDT_RESTART_MAGIC) {
             s->regs[WDT_STATUS] =3D s->regs[WDT_RELOAD_VALUE];
-            aspeed_wdt_reload(s, !(data & WDT_CTRL_1MHZ_CLK));
+            aspeed_wdt_reload(s, !(s->regs[WDT_CTRL] & WDT_CTRL_1MHZ_CLK=
));
         }
         break;
     case WDT_CTRL:
--=20
2.21.0

