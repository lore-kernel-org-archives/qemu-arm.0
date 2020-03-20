Received: by 2002:a19:5509:0:0:0:0:0 with SMTP id n9csp430873lfe;
        Thu, 19 Mar 2020 22:40:38 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vvy+bLQqAK3apqj5WEEBaQdVcKcxbZaLOQMCxXec7GxeWNI2WnEDs2AAD+lu5w4CB1N9Tmk
X-Received: by 2002:ac8:764f:: with SMTP id i15mr6537318qtr.255.1584682837969;
        Thu, 19 Mar 2020 22:40:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584682837; cv=none;
        d=google.com; s=arc-20160816;
        b=TnRIzpMvFBapOVZNFd8X/rhzsSxRnMeCzR9WIKdVWYiGzon7c9fDnJlmcgV4B7Vi4T
         oMKuZnJ0IYRI4q0gGlcjK3VeQLBG99lCl8S5jJeK8wLs/jjDwPfexHAASxA0IAhEFhtO
         HL5ntCmkH8z0/RYzkV6D41RuMkXSV1pa2nC4yLpmmq0Cqh4sA2bCQzzWcfXivh5uNjK7
         sCw5yc9+WIc04I2pQbA43iosbFcM4WAz2a5+GWNlOQLax5hVoasGAOtRP9uyccLRssIR
         Dn5H/NO+h2uwCA/+V2bivnVAM0NAmGpczhYqMQh9R2goV+iAixjHHDkZX9SW1mq1waEn
         xYJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from;
        bh=6neIOIhTZ2WSysMIQ8AvJlut+mtbw/LKDrRaP+teGko=;
        b=ACTrz0r3mKysBPoknpEhMzeAFjt/EjGs9tjsHbLkGbMa0qv5mAGLRw3cqmICGEW9By
         /1n4+LOy0EGiLv47UGFaux62S6Z7sxORulSq3GHU1jieJONuGFu0RL+IOaDPbKEQ7ahV
         KqYVGgQPWVHLgPybIA9RjaqKetVhIzEzlLAUx/sJgv8jswMzvrXM74vQ2VkvGtbjB93P
         UKd+h+h8hScKqDBcadsm8zleUDSD+CVUk5vzexXFRVAzzAFXfG0RctRhxrh3uGUWVrPS
         OlTV2LJGLIgtxt3cwRmci3cPq63DkMp4RoJeB81kssZU5/7X6DObc3JppysYgDYLyPIW
         09lA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id cj8si2553224qvb.31.2020.03.19.22.40.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Mar 2020 22:40:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:46246 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jFAOb-0007pl-Cb
	for alex.bennee@linaro.org; Fri, 20 Mar 2020 01:40:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40738)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <clg@kaod.org>) id 1jFANq-0007Pz-Ff
 for qemu-devel@nongnu.org; Fri, 20 Mar 2020 01:39:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <clg@kaod.org>) id 1jFANp-0004hr-42
 for qemu-devel@nongnu.org; Fri, 20 Mar 2020 01:39:50 -0400
Received: from 5.mo6.mail-out.ovh.net ([46.105.54.31]:42438)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <clg@kaod.org>) id 1jFANo-0004Nu-Ru
 for qemu-devel@nongnu.org; Fri, 20 Mar 2020 01:39:49 -0400
Received: from player746.ha.ovh.net (unknown [10.110.103.199])
 by mo6.mail-out.ovh.net (Postfix) with ESMTP id 0076920554E
 for <qemu-devel@nongnu.org>; Fri, 20 Mar 2020 06:39:39 +0100 (CET)
Received: from kaod.org (82-64-250-170.subs.proxad.net [82.64.250.170])
 (Authenticated sender: clg@kaod.org)
 by player746.ha.ovh.net (Postfix) with ESMTPSA id 8EFA910B04EC9;
 Fri, 20 Mar 2020 05:39:32 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH] aspeed/smc: Fix DMA support for AST2600
Date: Fri, 20 Mar 2020 06:39:23 +0100
Message-Id: <20200320053923.20565-1-clg@kaod.org>
X-Mailer: git-send-email 2.21.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 6276610506327231249
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedugedrudegtddgkeekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvufffkffogggtgfesthekredtredtjeenucfhrhhomhepveorughrihgtucfnvgcuifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucfkpheptddrtddrtddrtddpkedvrdeigedrvdehtddrudejtdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehplhgrhigvrhejgeeirdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrgh
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 46.105.54.31
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Alistair Francis <alistair@alistair23.me>,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: LyXphMEG0E3b

Recent firmwares uses SPI DMA transfers in U-Boot to load the
different images (kernel, initrd, dtb) in the SoC DRAM. The AST2600
FMC model is missing the masks to be applied on the DMA registers
which resulted in incorrect values. Fix that and wire the SPI
controllers which have DMA support on the AST2600.

Fixes: bcaa8ddd081c ("aspeed/smc: Add AST2600 support")
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 hw/arm/aspeed_ast2600.c |  6 ++++++
 hw/ssi/aspeed_smc.c     | 15 +++++++++++++--
 hw/ssi/trace-events     |  1 +
 3 files changed, 20 insertions(+), 2 deletions(-)

diff --git a/hw/arm/aspeed_ast2600.c b/hw/arm/aspeed_ast2600.c
index 446b44d31cf1..1a869e09b96a 100644
--- a/hw/arm/aspeed_ast2600.c
+++ b/hw/arm/aspeed_ast2600.c
@@ -411,6 +411,12 @@ static void aspeed_soc_ast2600_realize(DeviceState *=
dev, Error **errp)
=20
     /* SPI */
     for (i =3D 0; i < sc->spis_num; i++) {
+        object_property_set_link(OBJECT(&s->spi[i]), OBJECT(s->dram_mr),
+                                 "dram", &err);
+        if (err) {
+            error_propagate(errp, err);
+            return;
+        }
         object_property_set_int(OBJECT(&s->spi[i]), 1, "num-cs", &err);
         object_property_set_bool(OBJECT(&s->spi[i]), true, "realized",
                                  &local_err);
diff --git a/hw/ssi/aspeed_smc.c b/hw/ssi/aspeed_smc.c
index 9d5c696d5a17..2edccef2d54d 100644
--- a/hw/ssi/aspeed_smc.c
+++ b/hw/ssi/aspeed_smc.c
@@ -364,6 +364,8 @@ static const AspeedSMCController controllers[] =3D {
         .flash_window_base =3D ASPEED26_SOC_FMC_FLASH_BASE,
         .flash_window_size =3D 0x10000000,
         .has_dma           =3D true,
+        .dma_flash_mask    =3D 0x0FFFFFFC,
+        .dma_dram_mask     =3D 0x3FFFFFFC,
         .nregs             =3D ASPEED_SMC_R_MAX,
         .segment_to_reg    =3D aspeed_2600_smc_segment_to_reg,
         .reg_to_segment    =3D aspeed_2600_smc_reg_to_segment,
@@ -379,7 +381,9 @@ static const AspeedSMCController controllers[] =3D {
         .segments          =3D aspeed_segments_ast2600_spi1,
         .flash_window_base =3D ASPEED26_SOC_SPI_FLASH_BASE,
         .flash_window_size =3D 0x10000000,
-        .has_dma           =3D false,
+        .has_dma           =3D true,
+        .dma_flash_mask    =3D 0x0FFFFFFC,
+        .dma_dram_mask     =3D 0x3FFFFFFC,
         .nregs             =3D ASPEED_SMC_R_MAX,
         .segment_to_reg    =3D aspeed_2600_smc_segment_to_reg,
         .reg_to_segment    =3D aspeed_2600_smc_reg_to_segment,
@@ -395,7 +399,9 @@ static const AspeedSMCController controllers[] =3D {
         .segments          =3D aspeed_segments_ast2600_spi2,
         .flash_window_base =3D ASPEED26_SOC_SPI2_FLASH_BASE,
         .flash_window_size =3D 0x10000000,
-        .has_dma           =3D false,
+        .has_dma           =3D true,
+        .dma_flash_mask    =3D 0x0FFFFFFC,
+        .dma_dram_mask     =3D 0x3FFFFFFC,
         .nregs             =3D ASPEED_SMC_R_MAX,
         .segment_to_reg    =3D aspeed_2600_smc_segment_to_reg,
         .reg_to_segment    =3D aspeed_2600_smc_reg_to_segment,
@@ -1135,6 +1141,11 @@ static void aspeed_smc_dma_rw(AspeedSMCState *s)
     MemTxResult result;
     uint32_t data;
=20
+    trace_aspeed_smc_dma_rw(s->regs[R_DMA_CTRL] & DMA_CTRL_WRITE ?
+                            "write" : "read",
+                            s->regs[R_DMA_FLASH_ADDR],
+                            s->regs[R_DMA_DRAM_ADDR],
+                            s->regs[R_DMA_LEN]);
     while (s->regs[R_DMA_LEN]) {
         if (s->regs[R_DMA_CTRL] & DMA_CTRL_WRITE) {
             data =3D address_space_ldl_le(&s->dram_as, s->regs[R_DMA_DRA=
M_ADDR],
diff --git a/hw/ssi/trace-events b/hw/ssi/trace-events
index 0a70629801a9..0ea498de910b 100644
--- a/hw/ssi/trace-events
+++ b/hw/ssi/trace-events
@@ -6,5 +6,6 @@ aspeed_smc_do_snoop(int cs, int index, int dummies, int d=
ata) "CS%d index:0x%x d
 aspeed_smc_flash_write(int cs, uint64_t addr,  uint32_t size, uint64_t d=
ata, int mode) "CS%d @0x%" PRIx64 " size %u: 0x%" PRIx64" mode:%d"
 aspeed_smc_read(uint64_t addr,  uint32_t size, uint64_t data) "@0x%" PRI=
x64 " size %u: 0x%" PRIx64
 aspeed_smc_dma_checksum(uint32_t addr, uint32_t data) "0x%08x: 0x%08x"
+aspeed_smc_dma_rw(const char *dir, uint32_t flash_addr, uint32_t dram_ad=
dr, uint32_t size) "%s flash:@0x%08x dram:@0x%08x size:0x%08x"
 aspeed_smc_write(uint64_t addr,  uint32_t size, uint64_t data) "@0x%" PR=
Ix64 " size %u: 0x%" PRIx64
 aspeed_smc_flash_select(int cs, const char *prefix) "CS%d %sselect"
--=20
2.21.1

