Received: by 2002:a19:6911:0:0:0:0:0 with SMTP id e17csp593918lfc;
        Tue, 19 Nov 2019 06:20:07 -0800 (PST)
X-Google-Smtp-Source: APXvYqyb1Bwe7PZyvMCyukLQKLwiTb5RrKUNkIY9t9Cz1bp8kxg5MwXXvIluL1I8n8ogRO1Qsrck
X-Received: by 2002:a2e:3e0f:: with SMTP id l15mr4176854lja.209.1574173207420;
        Tue, 19 Nov 2019 06:20:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1574173207; cv=none;
        d=google.com; s=arc-20160816;
        b=cGP+o+sFxS2ttUWdAiNHzrcbjii5OBSWonr5YrCrJyc/capeTWbeorhLRKM1JZQG3z
         PISAg6C4aIY9hi0qcbIKIrLoCoSDDRbTu/Yde1uOPKPsX32f3xpWcElDjRoNAU4vO1M6
         SRg/KOITfN56/h0BbAduGsq2H6m9o/8FgTfBvLxiIsd2cNWOcS5jA5WyaFtUWbciLBHs
         FgLW87S5EHvSF3Rlhh0dJCpYfo1lt/zLVgUCxVGGMBjS14I0djPHlIifKoEy7Xn2uFmN
         niN+66u2a0MpPvg50ocu6Tc4DTn115SJ854A+8rvGaJa40JzHMH9i3sFTGucLgkARG8F
         16DQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=YiKbZfloS3DDZrqSyXadAjeAvhSC/sBokbiyzSvkL0A=;
        b=hxNIAeRiE7mrM+TY9DF0Hqcc3T+Z9/6DBiihQk1XIkHW2/4eHYt+agfX/OM1HTo7Jg
         LUWEzNikZX3RN5QDoXkYJlHgTyFJ//uVNmj5XkGnQ/1+TPzfsaEjfwd5s2VrvxF9PJpx
         ImQPS2p2uwMh7uoYkLeko2vnvLec7fD/4XR2Q0cmF3meUiQs7x8RU+20xURUVdMsN1r/
         cB2jA7QRwka2t/TJjqt2A8gNK9IoV3yRffxpfwtBMABlu1YgYhOsYX9lUpIzw+srGlOM
         yA0e0r/1f9LOrlkI4PfKuiYY1+NAdjhkkaHjFr7bfMwNWYUGBi2C3NPjtc0FFdrzyz6i
         pwuQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e47si15804798eda.73.2019.11.19.06.20.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 19 Nov 2019 06:20:07 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:46008 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iX4MP-00055e-DH
	for alex.bennee@linaro.org; Tue, 19 Nov 2019 09:20:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42159)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <clg@kaod.org>) id 1iX4GY-0007KA-7n
 for qemu-arm@nongnu.org; Tue, 19 Nov 2019 09:14:03 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <clg@kaod.org>) id 1iX4GW-0005hF-S7
 for qemu-arm@nongnu.org; Tue, 19 Nov 2019 09:14:02 -0500
Received: from 13.mo7.mail-out.ovh.net ([87.98.150.175]:59898)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <clg@kaod.org>) id 1iX4GW-0005gb-LI
 for qemu-arm@nongnu.org; Tue, 19 Nov 2019 09:14:00 -0500
Received: from player795.ha.ovh.net (unknown [10.108.57.153])
 by mo7.mail-out.ovh.net (Postfix) with ESMTP id E6F3C13AC0E
 for <qemu-arm@nongnu.org>; Tue, 19 Nov 2019 15:13:58 +0100 (CET)
Received: from kaod.org (deibp9eh1--blueice1n4.emea.ibm.com [195.212.29.166])
 (Authenticated sender: clg@kaod.org)
 by player795.ha.ovh.net (Postfix) with ESMTPSA id 2BB40C18ADFF;
 Tue, 19 Nov 2019 14:13:52 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH 12/17] aspeed/smc: Add AST2600 timings registers
Date: Tue, 19 Nov 2019 15:12:06 +0100
Message-Id: <20191119141211.25716-13-clg@kaod.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191119141211.25716-1-clg@kaod.org>
References: <20191119141211.25716-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 17917008169540487953
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedrudegkedgiedvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdqfffguegfifdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvufffkffojghfgggtgfesthekredtredtjeenucfhrhhomhepveorughrihgtucfnvgcuifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucfkpheptddrtddrtddrtddpudelhedrvdduvddrvdelrdduieeinecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehplhgrhigvrhejleehrdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepqhgvmhhuqdgrrhhmsehnohhnghhnuhdrohhrghenucevlhhushhtvghrufhiiigvpeeg
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 87.98.150.175
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
X-TUID: UiOFtliDWR+5

Each CS has its own Read Timing Compensation Register on newer SoCs.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
Reviewed-by: Joel Stanley <joel@jms.id.au>
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

