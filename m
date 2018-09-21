Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp3346500wrd;
        Fri, 21 Sep 2018 09:38:50 -0700 (PDT)
X-Google-Smtp-Source: ANB0VdZe6iGceBxJtKuJvEUSiw+3M/2O7/0dBF2+6ihjLeWSnxqGBZQT/hFiNF6sleH0zom8ghXF
X-Received: by 2002:aed:2647:: with SMTP id z65-v6mr32983129qtc.58.1537547930673;
        Fri, 21 Sep 2018 09:38:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1537547930; cv=none;
        d=google.com; s=arc-20160816;
        b=Z0X7aNCM5cBnWsYCpZ8RWD/XibdKXz9wGU/Iyv5HuZe8NHCYQExYyEskJZQIrzguCl
         i7OQKmnwviNlSu3BoCf+vH6i5dhwsORswHqTcCN2dNIz846yHUp/7zv8bpbAOUzkMI3y
         yIyu12zXn4yksVsLwNuEN9t0mfZBk3j/XBearmkCTfTElV74MFEw0BLJjCjlBFBrheq+
         y9gYtyXyd4ZC5VsQoBNpQdGZr7OuGSXYqjWdKDft8RRu0RdtPGUdIv5mkrEsCgcRcl/D
         Hq9fm21qLfOA+yE66GjVUZ2H0MBYMEWXZdfSA0SsgDHefWBhaH7QWQup3O9Y5Q175ol1
         M5mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=+OTI2MpB56WMsiW4/p3nXUAPyABR62GTP6CpowGYnOw=;
        b=gIB4c+L97lXteIBRAGoBM9843SEZaKunDh/iY6J/SIHnYON64QWa69cjB6OMD8gm4W
         ldFxJ39saWFPQGHhbeR7+tgvkawyqkYGcWEt32IIWqpp3o47bmPVg7BBizXIrc2K45Da
         HkhV0hHb69cLYNMgbCKKThNHrqh22OqcigmiY4DCAdwXciWqaMucAYlkFDX96d/kSAzQ
         uYo2NP3/2a65eaZ3NDd3PNO96Lpfyqx5dfI78R1qXQSjEVlQZzDkGmwwOOlAUASfLYLi
         66WXTqFkVo72gi220c9ftjp14Th/s4r7LoeqzUjo5nqb+rv/F1k87Qe09ciBcjnT/uMp
         etbw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 19-v6si1079231qky.1.2018.09.21.09.38.50
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 21 Sep 2018 09:38:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:56490 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g3OSA-0004HF-5b
	for alex.bennee@linaro.org; Fri, 21 Sep 2018 12:38:50 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42350)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1g3OQm-0001yx-Gd
	for qemu-arm@nongnu.org; Fri, 21 Sep 2018 12:37:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1g3OBZ-0004hP-Ue
	for qemu-arm@nongnu.org; Fri, 21 Sep 2018 12:21:45 -0400
Received: from 3.mo177.mail-out.ovh.net ([46.105.36.172]:34059)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1g3OBZ-0004h4-OP
	for qemu-arm@nongnu.org; Fri, 21 Sep 2018 12:21:41 -0400
Received: from player799.ha.ovh.net (unknown [10.109.143.216])
	by mo177.mail-out.ovh.net (Postfix) with ESMTP id 9E9ECC12E6
	for <qemu-arm@nongnu.org>; Fri, 21 Sep 2018 18:21:40 +0200 (CEST)
Received: from zorba.kaod.org.com (LFbn-1-10605-110.w90-89.abo.wanadoo.fr
	[90.89.196.110]) (Authenticated sender: clg@kaod.org)
	by player799.ha.ovh.net (Postfix) with ESMTPSA id 0DC3F520093;
	Fri, 21 Sep 2018 18:21:31 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-devel@nongnu.org
Date: Fri, 21 Sep 2018 18:19:39 +0200
Message-Id: <20180921161939.822-12-clg@kaod.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180921161939.822-1-clg@kaod.org>
References: <20180921161939.822-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 1915155742927981376
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedtjedrledvgddutddvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 46.105.36.172
Subject: [Qemu-arm] [PATCH v2 11/11] aspeed/smc: Add dummy data register
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
X-TUID: zWQNRiSIUKsF

The SMC controllers have a register containing the byte that will be
used as dummy output. It can be modified by software.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
---
 hw/ssi/aspeed_smc.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/hw/ssi/aspeed_smc.c b/hw/ssi/aspeed_smc.c
index 01c3fd7b2666..55ceffe100d3 100644
--- a/hw/ssi/aspeed_smc.c
+++ b/hw/ssi/aspeed_smc.c
@@ -104,8 +104,8 @@
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
@@ -550,7 +550,7 @@ static void aspeed_smc_flash_setup(AspeedSMCFlash *fl=
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
@@ -682,6 +682,7 @@ static uint64_t aspeed_smc_read(void *opaque, hwaddr =
addr, unsigned int size)
         addr =3D=3D s->r_timings ||
         addr =3D=3D s->r_ce_ctrl ||
         addr =3D=3D R_INTR_CTRL ||
+        addr =3D=3D R_DUMMY_DATA ||
         (s->ctrl->has_dma && addr =3D=3D R_DMA_CTRL) ||
         (s->ctrl->has_dma && addr =3D=3D R_DMA_FLASH_ADDR) ||
         (s->ctrl->has_dma && addr =3D=3D R_DMA_DRAM_ADDR) ||
@@ -957,6 +958,8 @@ static void aspeed_smc_write(void *opaque, hwaddr add=
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

