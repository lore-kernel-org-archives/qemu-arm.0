Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp480803wrd;
        Fri, 31 Aug 2018 04:23:09 -0700 (PDT)
X-Google-Smtp-Source: ANB0VdanTSwSUwc1Us5V89p3m/eTRMuSTvct9DND4VdUjcUJcQez5huVTDDNOxRzdKuBCqkK2W6D
X-Received: by 2002:a37:1118:: with SMTP id b24-v6mr14850073qkh.253.1535714589156;
        Fri, 31 Aug 2018 04:23:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1535714589; cv=none;
        d=google.com; s=arc-20160816;
        b=vf2g9edp5pFpKElXQwtK8XLmy72bHUezExuJ/stn/SBoX9X1WqwJ6m3k/vZu4Ps+4s
         SEVJzgSvixRCxWX9W+wgkmVXDz3/i3jMgK3EiYODcdd+EdMYllkovA9T6uC/0GdKDg/f
         UdvykV+qrFGSDraaxmdOQR7nIUAHP+nt+KA/4QYzA4HefXj552eUlSN36CVMZ8NVjnqk
         WdX9xEHKELa4LMY5TaJXT3RI+4Ima373gzX7Ljfl1WYpNbJQwKOGcUJOb+XO4pV5339I
         eezOr1Yv25AdNCLcLxmkK7v3JIvPvmV12xJOT7SueVpkYASZ+EYCS/9bBUZlNsXW6lcT
         J2fA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=bFbBzPP1GRZTaxilWFgqaBZ7powZeUZI5pNFpkZVfXM=;
        b=kI6vbp8vok7FnJ+xoWstB/sLmQzxIicqjqCssx/0CZMsMXz6Atejn096UmZsKd+rU2
         Xb+zjjj+BHLrlCJxoPGc748GPbCnBaO9ot1Wpn0HiX268o+gFdPhr127rltwFPaH6A3K
         XEDOcFgTsC4un/6ktV9q5myuMDLDpuzmPgbeiB7JMemZPrCYA7gDEShR7qntXs05fMi0
         K200uPsW0t7aWQqxnP5ktGz83RtmNctYQkhYSVeSZpq8h78eChhUIelhTKR6RPUnzv71
         dUKV4I8WvBA4qmW9arW51mEAmfcNdaSAhakNpUtPL9uL+iOaHOo5jIzz3eyRa6SrYaDj
         JgbQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y27-v6si8880396qtc.394.2018.08.31.04.23.09
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 31 Aug 2018 04:23:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:53078 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fvhW8-0005Pb-I9
	for alex.bennee@linaro.org; Fri, 31 Aug 2018 07:23:08 -0400
Received: from eggs.gnu.org ([208.118.235.92]:37282)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1fvhVp-0004kf-T8
	for qemu-arm@nongnu.org; Fri, 31 Aug 2018 07:22:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1fvhPX-0004eH-9c
	for qemu-arm@nongnu.org; Fri, 31 Aug 2018 07:16:23 -0400
Received: from 7.mo5.mail-out.ovh.net ([178.32.124.100]:58831)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1fvhPX-0004dv-3I
	for qemu-arm@nongnu.org; Fri, 31 Aug 2018 07:16:19 -0400
Received: from player714.ha.ovh.net (unknown [10.109.146.50])
	by mo5.mail-out.ovh.net (Postfix) with ESMTP id D55AA1E3121
	for <qemu-arm@nongnu.org>; Fri, 31 Aug 2018 13:16:17 +0200 (CEST)
Received: from zorba.kaod.org.com (LFbn-1-10605-110.w90-89.abo.wanadoo.fr
	[90.89.196.110]) (Authenticated sender: clg@kaod.org)
	by player714.ha.ovh.net (Postfix) with ESMTPSA id 74C8D3C00C3;
	Fri, 31 Aug 2018 13:16:09 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-devel@nongnu.org
Date: Fri, 31 Aug 2018 13:15:55 +0200
Message-Id: <20180831111555.15008-2-clg@kaod.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180831111555.15008-1-clg@kaod.org>
References: <20180831103816.13479-1-clg@kaod.org>
	<20180831111555.15008-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 2558326067414338368
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedtjedrhedtgdeflecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 178.32.124.100
Subject: [Qemu-arm] [PATCH 11/11] aspeed/smc: Add dummy data register
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
	Alistair Francis <alistair@alistair23.me>, qemu-arm@nongnu.org,
	Joel Stanley <joel@jms.id.au>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: mzvOimJudDP6

The SMC controllers have a register containing the byte that will be
used as dummy output. It can be modified by software.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 hw/ssi/aspeed_smc.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/hw/ssi/aspeed_smc.c b/hw/ssi/aspeed_smc.c
index da2fedfcd3cd..f31bbc895caa 100644
--- a/hw/ssi/aspeed_smc.c
+++ b/hw/ssi/aspeed_smc.c
@@ -102,8 +102,8 @@
 /* Misc Control Register #1 */
 #define R_MISC_CTRL1      (0x50 / 4)
=20
-/* Misc Control Register #2 */
-#define R_MISC_CTRL2      (0x54 / 4)
+/* SPI dummy cycle data */
+#define R_DUMMY_DATA      (0x54 / 4)
=20
 /* DMA Control/Status Register */
 #define R_DMA_CTRL        (0x80 / 4)
@@ -548,7 +548,7 @@ static void aspeed_smc_flash_setup(AspeedSMCFlash *fl=
, uint32_t addr)
      */
     if (aspeed_smc_flash_mode(fl) =3D=3D CTRL_FREADMODE) {
         for (i =3D 0; i < aspeed_smc_flash_dummies(fl); i++) {
-            ssi_transfer(fl->controller->spi, 0xFF);
+            ssi_transfer(fl->controller->spi, s->regs[R_DUMMY_DATA] & 0x=
ff);
         }
     }
 }
@@ -680,6 +680,7 @@ static uint64_t aspeed_smc_read(void *opaque, hwaddr =
addr, unsigned int size)
         addr =3D=3D s->r_timings ||
         addr =3D=3D s->r_ce_ctrl ||
         addr =3D=3D R_INTR_CTRL ||
+        addr =3D=3D R_DUMMY_DATA ||
         (s->ctrl->has_dma && addr =3D=3D R_DMA_CTRL) ||
         (s->ctrl->has_dma && addr =3D=3D R_DMA_FLASH_ADDR) ||
         (s->ctrl->has_dma && addr =3D=3D R_DMA_DRAM_ADDR) ||
@@ -912,6 +913,8 @@ static void aspeed_smc_write(void *opaque, hwaddr add=
r, uint64_t data,
         }
     } else if (addr =3D=3D R_INTR_CTRL) {
         s->regs[addr] =3D value;
+    } else if (addr =3D=3D R_DUMMY_DATA) {
+        s->regs[addr] =3D value & 0xff ;
     } else if (s->ctrl->has_dma && addr =3D=3D R_DMA_CTRL) {
         aspeed_smc_dma_ctrl(s, value);
     } else if (s->ctrl->has_dma && addr =3D=3D R_DMA_DRAM_ADDR) {
--=20
2.17.1

