Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp4331722wrg;
        Sat, 25 May 2019 08:36:17 -0700 (PDT)
X-Google-Smtp-Source: APXvYqw2dX87oQhpPNt/1oXTibFJXzS3aAaNWsbKXqZMM43J8z7foEVmSpyVyDHvoRYRuNHTP5d1
X-Received: by 2002:a1f:3c94:: with SMTP id j142mr8678912vka.2.1558798577207;
        Sat, 25 May 2019 08:36:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1558798577; cv=none;
        d=google.com; s=arc-20160816;
        b=lEV3oiUnrLXEhm8WK+Saz7aaykxQBLRMrqe/8l962M5bkKpRbrLse3anr2tFS8yxce
         rJzm7gwI6Vd0Ubg9DzTQuyld6Dhy5V4/rsx2RwC8EgrKioYdG5RWPw71xU0121wvmEAy
         bz8dc6l7eg+Ya+uuDh7+dEvD7yR5Kn9AIvzBEtxEbGwWChAR4ja3MpcdD2sUHGR0EL/V
         tyqTaI8V8XB+0dFSY0bJ5AMS/XYAz5Y6pe91vTg8pPGXD7nuQg7VXdRdn7Sy2CBglHJ8
         hjFR06+deCz3vvJPaHanbzq7puexBT9FVAFhfOUKeGlq/iy/CACDiAmnsfKOGf+tlxYy
         h8uA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=nWbQvojPRDHSp+gCRdjtEbOla9dZYfFPUNQ2kEKt6xQ=;
        b=p0PReXlXAgsNrnav+bZl0JDNi79RWq1zHE8QPnElGW9Gg9WO8YbS4aaUMk6FyP6gzJ
         w92zi+NNdBuNviJZyd22a/xP0mHImlAltMbrs9Y//XQXgc96ECzMmHAYr/Ti/H8C96JO
         t9rIKmYQHMvWo5LHhvqym+IXsObMX+LZLeE1G6NfQeYepnf8/mch18/sqd+gY9Md/CbH
         2EmZLVSZFCIigMsX73APKVR97m9aKe0aGy/dB81/zqcE1wqa+iPw/6FZo+vM9wHa/zz5
         qr21BzliUXNp8fT4mJcQBopmly2W2gFRvLhnCv528BIrRuUwZH8AqFKOUmuZglFgkU88
         Te7Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j65si2460991uaj.137.2019.05.25.08.36.17
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 25 May 2019 08:36:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:43514 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hUYiW-0003J0-GT
	for alex.bennee@linaro.org; Sat, 25 May 2019 11:36:16 -0400
Received: from eggs.gnu.org ([209.51.188.92]:35978)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1hUYdv-0007m2-TO
	for qemu-arm@nongnu.org; Sat, 25 May 2019 11:31:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1hUYNn-00037K-QX
	for qemu-arm@nongnu.org; Sat, 25 May 2019 11:14:53 -0400
Received: from 7.mo69.mail-out.ovh.net ([46.105.50.32]:45198)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1hUYNm-0002x1-3q
	for qemu-arm@nongnu.org; Sat, 25 May 2019 11:14:50 -0400
Received: from player698.ha.ovh.net (unknown [10.109.159.224])
	by mo69.mail-out.ovh.net (Postfix) with ESMTP id 359575A112
	for <qemu-arm@nongnu.org>; Sat, 25 May 2019 17:14:36 +0200 (CEST)
Received: from kaod.org (lfbn-1-10649-41.w90-89.abo.wanadoo.fr [90.89.235.41])
	(Authenticated sender: clg@kaod.org)
	by player698.ha.ovh.net (Postfix) with ESMTPSA id BCCF2625A885;
	Sat, 25 May 2019 15:14:29 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 25 May 2019 17:12:37 +0200
Message-Id: <20190525151241.5017-16-clg@kaod.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190525151241.5017-1-clg@kaod.org>
References: <20190525151241.5017-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 6619165553576872721
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduuddruddukedgkeejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 46.105.50.32
Subject: [Qemu-arm] [PATCH 15/19] aspeed: add a RAM memory region container
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
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	qemu-arm@nongnu.org, qemu-devel@nongnu.org, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: IvOFG+6ehrel

The RAM memory region is defined after the SoC is realized when the
SDMC controller has cheched that the defined RAM size for the machine
is correct. This is problematic for controller models requiring a link
on the RAM region, for DMA support in the SMC controller for instance.

Introduce a container memory region for the RAM that we can link into
the controllers early, before the SoC is realized. It will be
populated with the RAM region after the checks have be done.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 hw/arm/aspeed.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index 228fdbcf65e2..ed5c8dd5133a 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -33,6 +33,7 @@ static struct arm_boot_info aspeed_board_binfo =3D {
=20
 struct AspeedBoardState {
     AspeedSoCState soc;
+    MemoryRegion ram_container;
     MemoryRegion ram;
     MemoryRegion max_ram;
 };
@@ -159,6 +160,10 @@ static void aspeed_board_init(MachineState *machine,
     ram_addr_t max_ram_size;
=20
     bmc =3D g_new0(AspeedBoardState, 1);
+
+    memory_region_init(&bmc->ram_container, NULL, "aspeed-ram-container"=
,
+                       UINT32_MAX);
+
     object_initialize_child(OBJECT(machine), "soc", &bmc->soc,
                             (sizeof(bmc->soc)), cfg->soc_name, &error_ab=
ort,
                             NULL);
@@ -191,16 +196,16 @@ static void aspeed_board_init(MachineState *machine=
,
                                         &error_abort);
=20
     memory_region_allocate_system_memory(&bmc->ram, NULL, "ram", ram_siz=
e);
+    memory_region_add_subregion(&bmc->ram_container, 0, &bmc->ram);
     memory_region_add_subregion(get_system_memory(),
-                                sc->info->memmap[ASPEED_SDRAM], &bmc->ra=
m);
+                                sc->info->memmap[ASPEED_SDRAM],
+                                &bmc->ram_container);
=20
     max_ram_size =3D object_property_get_uint(OBJECT(&bmc->soc), "max-ra=
m-size",
                                             &error_abort);
     memory_region_init_io(&bmc->max_ram, NULL, &max_ram_ops, NULL,
                           "max_ram", max_ram_size  - ram_size);
-    memory_region_add_subregion(get_system_memory(),
-                                sc->info->memmap[ASPEED_SDRAM] + ram_siz=
e,
-                                &bmc->max_ram);
+    memory_region_add_subregion(&bmc->ram_container, ram_size, &bmc->max=
_ram);
=20
     aspeed_board_init_flashes(&bmc->soc.fmc, cfg->fmc_model, &error_abor=
t);
     aspeed_board_init_flashes(&bmc->soc.spi[0], cfg->spi_model, &error_a=
bort);
--=20
2.20.1

