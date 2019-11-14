Received: by 2002:adf:fb8f:0:0:0:0:0 with SMTP id a15csp5241956wrr;
        Thu, 14 Nov 2019 01:46:48 -0800 (PST)
X-Google-Smtp-Source: APXvYqzITmaqhJgAM6MEiwGvcyPS/er0hv2r7/cL6gnM+9oSC+CLnQFGCobkhCCzawN2AKU9f84u
X-Received: by 2002:a05:620a:113b:: with SMTP id p27mr6666960qkk.333.1573724807903;
        Thu, 14 Nov 2019 01:46:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1573724807; cv=none;
        d=google.com; s=arc-20160816;
        b=GH2h6kv9iUt1gCjN/nT/GrvpqxPUFCWiLOAmzaDup/6IxIFsoDIbtBB8XS+EQqLcBW
         VzkVwLl0KEp8T6rHIkXEaQG8ldbSDh9O6CvkYFnJez+7FUabBl2lMT2ayzYEfrTgdfku
         nvcPtgkp92jxDYMvF4cP+/LsE0JZdYbxH/VYZCilfxkF3cfp+LrrDpWpMHMtN+1W412L
         5X1JOFS0jiU26gPPgVoDcVdzHn74P6nuQ64C42f+3GIgyBVM5aFMZgsUJUvo8TbAUBaq
         BnlndMLOHbOCdjgdghh1hO1AYKIhnqP1eqmWAr0mqFPNHZx7HWPob1hnvzP9caSo1Thz
         R2xA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=WVZ3/kTsbDtpQd1+jJtUSoUaCivSu8H+hk8gI7ya1L0=;
        b=qFoN6um4p04jlgsi7fvW0pMC9vVu9Xtg7V+y9qNVxN/Ke9sDG/G7szVnf0LVcQs9N6
         8gV2UkKH0kdXzaRCwkhtjIkluu1urHo0Bx4YhBsaDFqoFQPni6SUG28RsymH85ETBGFI
         l4D48MMtqr/ExejxSRnGun5wYkY5Dvo5axpPeJ3vZPINoNspZ9vGzSo4gz8VDPtMuhrS
         2P3CSTW+I+U0DZ9jxLrBpQVBxvCF3A0A3i2bez959fqgFwY/tOZcHpAL/fINsdSJfzgt
         8IhlDdPvpRoxFRcnoA9MD8GexF82LQ2n3sDriv95ZGwHiDgpODBs3UcmIPvNuRM3k+xY
         8y7g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t14si2924093qto.73.2019.11.14.01.46.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 14 Nov 2019 01:46:47 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:54890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iVBiA-0007pl-Mc
	for alex.bennee@linaro.org; Thu, 14 Nov 2019 04:46:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37339)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <clg@kaod.org>) id 1iVBhq-0007lS-M5
 for qemu-arm@nongnu.org; Thu, 14 Nov 2019 04:46:28 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <clg@kaod.org>) id 1iVBho-0004Tr-8N
 for qemu-arm@nongnu.org; Thu, 14 Nov 2019 04:46:26 -0500
Received: from 8.mo179.mail-out.ovh.net ([46.105.75.26]:50316)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <clg@kaod.org>) id 1iVBhm-0004R0-6V
 for qemu-arm@nongnu.org; Thu, 14 Nov 2019 04:46:22 -0500
Received: from player737.ha.ovh.net (unknown [10.109.146.168])
 by mo179.mail-out.ovh.net (Postfix) with ESMTP id 3376A1455A2
 for <qemu-arm@nongnu.org>; Thu, 14 Nov 2019 10:46:19 +0100 (CET)
Received: from kaod.org (lfbn-1-2229-223.w90-76.abo.wanadoo.fr [90.76.50.223])
 (Authenticated sender: clg@kaod.org)
 by player737.ha.ovh.net (Postfix) with ESMTPSA id 211D92A78516;
 Thu, 14 Nov 2019 09:46:12 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH 3/5] aspeed/smc: Add AST2600 timings registers
Date: Thu, 14 Nov 2019 10:45:42 +0100
Message-Id: <20191114094544.30114-4-clg@kaod.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191114094544.30114-1-clg@kaod.org>
References: <20191114094544.30114-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 2479794547653380881
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedrudeffedgtdelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdqfffguegfifdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvufffkffojghfgggtgfesthekredtredtjeenucfhrhhomhepveorughrihgtucfnvgcuifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucfkpheptddrtddrtddrtddpledtrdejiedrhedtrddvvdefnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehplhgrhigvrhejfeejrdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepqhgvmhhuqdgrrhhmsehnohhnghhnuhdrohhrghenucevlhhushhtvghrufhiiigvpedv
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 46.105.75.26
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
Cc: Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, qemu-arm@nongnu.org,
 Joel Stanley <joel@jms.id.au>, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Uff9BW5vJT+F

Each CS has its own Read Timing Compensation Register on newer SoCs.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 include/hw/ssi/aspeed_smc.h |  1 +
 hw/ssi/aspeed_smc.c         | 17 ++++++++++++++---
 2 files changed, 15 insertions(+), 3 deletions(-)

diff --git a/include/hw/ssi/aspeed_smc.h b/include/hw/ssi/aspeed_smc.h
index 684d16e33613..6fbbb238f158 100644
--- a/include/hw/ssi/aspeed_smc.h
+++ b/include/hw/ssi/aspeed_smc.h
@@ -40,6 +40,7 @@ typedef struct AspeedSMCController {
     uint8_t r_ce_ctrl;
     uint8_t r_ctrl0;
     uint8_t r_timings;
+    uint8_t nregs_timings;
     uint8_t conf_enable_w0;
     uint8_t max_slaves;
     const AspeedSegments *segments;
diff --git a/hw/ssi/aspeed_smc.c b/hw/ssi/aspeed_smc.c
index 86cadbe4cc00..7755eca34976 100644
--- a/hw/ssi/aspeed_smc.c
+++ b/hw/ssi/aspeed_smc.c
@@ -137,7 +137,7 @@
 /* Checksum Calculation Result */
 #define R_DMA_CHECKSUM    (0x90 / 4)
=20
-/* Misc Control Register #2 */
+/* Read Timing Compensation Register */
 #define R_TIMINGS         (0x94 / 4)
=20
 /* SPI controller registers and bits (AST2400) */
@@ -256,6 +256,7 @@ static const AspeedSMCController controllers[] =3D {
         .r_ce_ctrl         =3D R_CE_CTRL,
         .r_ctrl0           =3D R_CTRL0,
         .r_timings         =3D R_TIMINGS,
+        .nregs_timings     =3D 1,
         .conf_enable_w0    =3D CONF_ENABLE_W0,
         .max_slaves        =3D 5,
         .segments          =3D aspeed_segments_legacy,
@@ -271,6 +272,7 @@ static const AspeedSMCController controllers[] =3D {
         .r_ce_ctrl         =3D R_CE_CTRL,
         .r_ctrl0           =3D R_CTRL0,
         .r_timings         =3D R_TIMINGS,
+        .nregs_timings     =3D 1,
         .conf_enable_w0    =3D CONF_ENABLE_W0,
         .max_slaves        =3D 5,
         .segments          =3D aspeed_segments_fmc,
@@ -288,6 +290,7 @@ static const AspeedSMCController controllers[] =3D {
         .r_ce_ctrl         =3D 0xff,
         .r_ctrl0           =3D R_SPI_CTRL0,
         .r_timings         =3D R_SPI_TIMINGS,
+        .nregs_timings     =3D 1,
         .conf_enable_w0    =3D SPI_CONF_ENABLE_W0,
         .max_slaves        =3D 1,
         .segments          =3D aspeed_segments_spi,
@@ -303,6 +306,7 @@ static const AspeedSMCController controllers[] =3D {
         .r_ce_ctrl         =3D R_CE_CTRL,
         .r_ctrl0           =3D R_CTRL0,
         .r_timings         =3D R_TIMINGS,
+        .nregs_timings     =3D 1,
         .conf_enable_w0    =3D CONF_ENABLE_W0,
         .max_slaves        =3D 3,
         .segments          =3D aspeed_segments_ast2500_fmc,
@@ -320,6 +324,7 @@ static const AspeedSMCController controllers[] =3D {
         .r_ce_ctrl         =3D R_CE_CTRL,
         .r_ctrl0           =3D R_CTRL0,
         .r_timings         =3D R_TIMINGS,
+        .nregs_timings     =3D 1,
         .conf_enable_w0    =3D CONF_ENABLE_W0,
         .max_slaves        =3D 2,
         .segments          =3D aspeed_segments_ast2500_spi1,
@@ -335,6 +340,7 @@ static const AspeedSMCController controllers[] =3D {
         .r_ce_ctrl         =3D R_CE_CTRL,
         .r_ctrl0           =3D R_CTRL0,
         .r_timings         =3D R_TIMINGS,
+        .nregs_timings     =3D 1,
         .conf_enable_w0    =3D CONF_ENABLE_W0,
         .max_slaves        =3D 2,
         .segments          =3D aspeed_segments_ast2500_spi2,
@@ -350,6 +356,7 @@ static const AspeedSMCController controllers[] =3D {
         .r_ce_ctrl         =3D R_CE_CTRL,
         .r_ctrl0           =3D R_CTRL0,
         .r_timings         =3D R_TIMINGS,
+        .nregs_timings     =3D 1,
         .conf_enable_w0    =3D CONF_ENABLE_W0,
         .max_slaves        =3D 3,
         .segments          =3D aspeed_segments_ast2600_fmc,
@@ -365,6 +372,7 @@ static const AspeedSMCController controllers[] =3D {
         .r_ce_ctrl         =3D R_CE_CTRL,
         .r_ctrl0           =3D R_CTRL0,
         .r_timings         =3D R_TIMINGS,
+        .nregs_timings     =3D 2,
         .conf_enable_w0    =3D CONF_ENABLE_W0,
         .max_slaves        =3D 2,
         .segments          =3D aspeed_segments_ast2600_spi1,
@@ -380,6 +388,7 @@ static const AspeedSMCController controllers[] =3D {
         .r_ce_ctrl         =3D R_CE_CTRL,
         .r_ctrl0           =3D R_CTRL0,
         .r_timings         =3D R_TIMINGS,
+        .nregs_timings     =3D 3,
         .conf_enable_w0    =3D CONF_ENABLE_W0,
         .max_slaves        =3D 3,
         .segments          =3D aspeed_segments_ast2600_spi2,
@@ -951,7 +960,8 @@ static uint64_t aspeed_smc_read(void *opaque, hwaddr =
addr, unsigned int size)
     addr >>=3D 2;
=20
     if (addr =3D=3D s->r_conf ||
-        addr =3D=3D s->r_timings ||
+        (addr >=3D s->r_timings &&
+         addr < s->r_timings + s->ctrl->nregs_timings) ||
         addr =3D=3D s->r_ce_ctrl ||
         addr =3D=3D R_INTR_CTRL ||
         addr =3D=3D R_DUMMY_DATA ||
@@ -1216,7 +1226,8 @@ static void aspeed_smc_write(void *opaque, hwaddr a=
ddr, uint64_t data,
     addr >>=3D 2;
=20
     if (addr =3D=3D s->r_conf ||
-        addr =3D=3D s->r_timings ||
+        (addr >=3D s->r_timings &&
+         addr < s->r_timings + s->ctrl->nregs_timings) ||
         addr =3D=3D s->r_ce_ctrl) {
         s->regs[addr] =3D value;
     } else if (addr >=3D s->r_ctrl0 && addr < s->r_ctrl0 + s->num_cs) {
--=20
2.21.0

