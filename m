Received: by 10.25.150.194 with SMTP id y185csp2422339lfd;
        Tue, 29 Nov 2016 08:05:49 -0800 (PST)
X-Received: by 10.55.70.67 with SMTP id t64mr27758450qka.78.1480435549260;
        Tue, 29 Nov 2016 08:05:49 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m35si27824415qtc.260.2016.11.29.08.05.48
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 29 Nov 2016 08:05:49 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:37807 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cBkuh-0006dO-Ut
	for alex.bennee@linaro.org; Tue, 29 Nov 2016 11:05:47 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39881)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1cBkcy-00085m-VY
	for qemu-arm@nongnu.org; Tue, 29 Nov 2016 10:47:33 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1cBkcv-0005b9-2X
	for qemu-arm@nongnu.org; Tue, 29 Nov 2016 10:47:29 -0500
Received: from 12.mo1.mail-out.ovh.net ([87.98.162.229]:41438)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1cBkcu-0005ap-P9
	for qemu-arm@nongnu.org; Tue, 29 Nov 2016 10:47:24 -0500
Received: from player795.ha.ovh.net (b9.ovh.net [213.186.33.59])
	by mo1.mail-out.ovh.net (Postfix) with ESMTP id 183EC1F94F
	for <qemu-arm@nongnu.org>; Tue, 29 Nov 2016 16:47:23 +0100 (CET)
Received: from hermes.lab.toulouse-stg.fr.ibm.com
	(deibp9eh1--blueice2n7.emea.ibm.com [195.212.29.169])
	(Authenticated sender: clg@kaod.org)
	by player795.ha.ovh.net (Postfix) with ESMTPSA id 7B7791200B4;
	Tue, 29 Nov 2016 16:47:15 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 29 Nov 2016 16:43:57 +0100
Message-Id: <1480434248-27138-20-git-send-email-clg@kaod.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1480434248-27138-1-git-send-email-clg@kaod.org>
References: <1480434248-27138-1-git-send-email-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 11748202578890361617
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeelfedrfeejgddvtdelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 87.98.162.229
Subject: [Qemu-arm] [PATCH for-2.9 19/30] aspeed/smc: unfold the
 AspeedSMCController array
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
Cc: Andrew Jeffery <andrew@aj.id.au>,
	Marcin Krzeminski <marcin.krzeminski@nokia.com>,
	qemu-devel@nongnu.org, qemu-arm@nongnu.org,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: sjCSAf13aj0t

This is getting difficult to read. Also add a 'has_dma' field for each
controller type.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
Reviewed-by: Joel Stanley <joel@jms.id.au>
Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
---
 hw/ssi/aspeed_smc.c         | 91 ++++++++++++++++++++++++++++++++++++---=
------
 include/hw/ssi/aspeed_smc.h |  1 +
 2 files changed, 74 insertions(+), 18 deletions(-)

diff --git a/hw/ssi/aspeed_smc.c b/hw/ssi/aspeed_smc.c
index eec087199a22..8e7e3bd9e335 100644
--- a/hw/ssi/aspeed_smc.c
+++ b/hw/ssi/aspeed_smc.c
@@ -184,24 +184,79 @@ static const AspeedSegments aspeed_segments_ast2500=
_spi2[] =3D {
 };
=20
 static const AspeedSMCController controllers[] =3D {
-    { "aspeed.smc.smc", R_CONF, R_CE_CTRL, R_CTRL0, R_TIMINGS,
-      CONF_ENABLE_W0, 5, aspeed_segments_legacy,
-      ASPEED_SOC_SMC_FLASH_BASE, 0x6000000 },
-    { "aspeed.smc.fmc", R_CONF, R_CE_CTRL, R_CTRL0, R_TIMINGS,
-      CONF_ENABLE_W0, 5, aspeed_segments_fmc,
-      ASPEED_SOC_FMC_FLASH_BASE, 0x10000000 },
-    { "aspeed.smc.spi", R_SPI_CONF, 0xff, R_SPI_CTRL0, R_SPI_TIMINGS,
-      SPI_CONF_ENABLE_W0, 1, aspeed_segments_spi,
-      ASPEED_SOC_SPI_FLASH_BASE, 0x10000000 },
-    { "aspeed.smc.ast2500-fmc", R_CONF, R_CE_CTRL, R_CTRL0, R_TIMINGS,
-      CONF_ENABLE_W0, 3, aspeed_segments_ast2500_fmc,
-      ASPEED_SOC_FMC_FLASH_BASE, 0x10000000 },
-    { "aspeed.smc.ast2500-spi1", R_CONF, R_CE_CTRL, R_CTRL0, R_TIMINGS,
-      CONF_ENABLE_W0, 2, aspeed_segments_ast2500_spi1,
-      ASPEED_SOC_SPI_FLASH_BASE, 0x8000000 },
-    { "aspeed.smc.ast2500-spi2", R_CONF, R_CE_CTRL, R_CTRL0, R_TIMINGS,
-      CONF_ENABLE_W0, 2, aspeed_segments_ast2500_spi2,
-      ASPEED_SOC_SPI2_FLASH_BASE, 0x8000000 },
+    {
+        .name              =3D "aspeed.smc.smc",
+        .r_conf            =3D R_CONF,
+        .r_ce_ctrl         =3D R_CE_CTRL,
+        .r_ctrl0           =3D R_CTRL0,
+        .r_timings         =3D R_TIMINGS,
+        .conf_enable_w0    =3D CONF_ENABLE_W0,
+        .max_slaves        =3D 5,
+        .segments          =3D aspeed_segments_legacy,
+        .flash_window_base =3D ASPEED_SOC_SMC_FLASH_BASE,
+        .flash_window_size =3D 0x6000000,
+        .has_dma           =3D false,
+    }, {
+        .name              =3D "aspeed.smc.fmc",
+        .r_conf            =3D R_CONF,
+        .r_ce_ctrl         =3D R_CE_CTRL,
+        .r_ctrl0           =3D R_CTRL0,
+        .r_timings         =3D R_TIMINGS,
+        .conf_enable_w0    =3D CONF_ENABLE_W0,
+        .max_slaves        =3D 5,
+        .segments          =3D aspeed_segments_fmc,
+        .flash_window_base =3D ASPEED_SOC_FMC_FLASH_BASE,
+        .flash_window_size =3D 0x10000000,
+        .has_dma           =3D true,
+    }, {
+        .name              =3D "aspeed.smc.spi",
+        .r_conf            =3D R_SPI_CONF,
+        .r_ce_ctrl         =3D 0xff,
+        .r_ctrl0           =3D R_SPI_CTRL0,
+        .r_timings         =3D R_SPI_TIMINGS,
+        .conf_enable_w0    =3D SPI_CONF_ENABLE_W0,
+        .max_slaves        =3D 1,
+        .segments          =3D aspeed_segments_spi,
+        .flash_window_base =3D ASPEED_SOC_SPI_FLASH_BASE,
+        .flash_window_size =3D 0x10000000,
+        .has_dma           =3D false,
+    }, {
+        .name              =3D "aspeed.smc.ast2500-fmc",
+        .r_conf            =3D R_CONF,
+        .r_ce_ctrl         =3D R_CE_CTRL,
+        .r_ctrl0           =3D R_CTRL0,
+        .r_timings         =3D R_TIMINGS,
+        .conf_enable_w0    =3D CONF_ENABLE_W0,
+        .max_slaves        =3D 3,
+        .segments          =3D aspeed_segments_ast2500_fmc,
+        .flash_window_base =3D ASPEED_SOC_FMC_FLASH_BASE,
+        .flash_window_size =3D 0x10000000,
+        .has_dma           =3D true,
+    }, {
+        .name              =3D "aspeed.smc.ast2500-spi1",
+        .r_conf            =3D R_CONF,
+        .r_ce_ctrl         =3D R_CE_CTRL,
+        .r_ctrl0           =3D R_CTRL0,
+        .r_timings         =3D R_TIMINGS,
+        .conf_enable_w0    =3D CONF_ENABLE_W0,
+        .max_slaves        =3D 2,
+        .segments          =3D aspeed_segments_ast2500_spi1,
+        .flash_window_base =3D ASPEED_SOC_SPI_FLASH_BASE,
+        .flash_window_size =3D 0x8000000,
+        .has_dma           =3D false,
+    }, {
+        .name              =3D "aspeed.smc.ast2500-spi2",
+        .r_conf            =3D R_CONF,
+        .r_ce_ctrl         =3D R_CE_CTRL,
+        .r_ctrl0           =3D R_CTRL0,
+        .r_timings         =3D R_TIMINGS,
+        .conf_enable_w0    =3D CONF_ENABLE_W0,
+        .max_slaves        =3D 2,
+        .segments          =3D aspeed_segments_ast2500_spi2,
+        .flash_window_base =3D ASPEED_SOC_SPI2_FLASH_BASE,
+        .flash_window_size =3D 0x8000000,
+        .has_dma           =3D false,
+    },
 };
=20
 /*
diff --git a/include/hw/ssi/aspeed_smc.h b/include/hw/ssi/aspeed_smc.h
index c64954f6103f..39ee601940e8 100644
--- a/include/hw/ssi/aspeed_smc.h
+++ b/include/hw/ssi/aspeed_smc.h
@@ -44,6 +44,7 @@ typedef struct AspeedSMCController {
     const AspeedSegments *segments;
     hwaddr flash_window_base;
     uint32_t flash_window_size;
+    bool has_dma;
 } AspeedSMCController;
=20
 typedef struct AspeedSMCFlash {
--=20
2.7.4

