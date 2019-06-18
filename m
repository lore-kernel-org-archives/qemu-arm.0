Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp3975674wrg;
        Tue, 18 Jun 2019 10:24:56 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxN6PqRNDRW1pvfRqGIWbF7LWEEOwdKPCSZfi+D/peBk9qf/jqpgghTWSieXuDVNtCH61h5
X-Received: by 2002:aed:24f4:: with SMTP id u49mr97640764qtc.8.1560878696533;
        Tue, 18 Jun 2019 10:24:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560878696; cv=none;
        d=google.com; s=arc-20160816;
        b=G++btl0aAbgwMulYuovqZC1Q4XgV/FIY3iT1XGguSgJwIH9BJvKobdmpQSpF6N8a4V
         JcfXbZcaOzyF9xzS8t/6/Tt5JXA6ROzgzRqlZnUncq3NCTKIDdAkcqPwHIb7RDDQ4Qvr
         UIT3PkBzIwXTnyEa1ko6i6R0Afu3YPr/651M5Ei5gb07+6oWbWTLBOmMsT/R4C4+Qwz6
         738hYNAtDQQomHxGJzY7yo8D1Jnsbx0AChmtSwQG4Vpn7sEP3scBtYm4gZl+PlrUYveC
         xQRCt/0v6JxiyfayiR29tdZ84wHL37GJYvjRX8T+i1VDcNaXCY3c0E89A6rDaGndSUl2
         iLtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=7K+DnLcqWnTdxsS8jWUlD8T8AN8f7jtvO+G0GFrbtQc=;
        b=f/UhF9qyBDbXWDvpEKRTSxesnmRKrGOokqr9tFTN2o3rfBiqzt14Of4ShLtm/+UBl4
         VHYZpn+L0B7Nz7WTwKwCh5kn5m5ehbjy/OKwPNMUJUtoH6xbRqjjvrHWLaJroAPHalZ9
         +lqXi7fdg+7vvfGlVQ3KG1TucjZKMatuJ1edyBf6/U9ZXnk4m92zAnZTAQ63VgJGWi5z
         GOKAka58uUaCz3iz3PBYnDILVb2DD+z1HLukjcB+X2knrWNICOi1Yk4hOTITbkTRkPrb
         UgkqrJSn4WY3t1OEELLqkqQas/LfkRDXPkJ5OayYDNJfA0Z/0xK3Xjs9ZWQmsZknld6h
         fdpw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u184si7064501qka.86.2019.06.18.10.24.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 18 Jun 2019 10:24:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:60480 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hdHqq-0007vN-4Q
	for alex.bennee@linaro.org; Tue, 18 Jun 2019 13:24:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60881)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <clg@kaod.org>) id 1hdHNo-0000yN-NP
 for qemu-arm@nongnu.org; Tue, 18 Jun 2019 12:54:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <clg@kaod.org>) id 1hdHNn-00059l-KW
 for qemu-arm@nongnu.org; Tue, 18 Jun 2019 12:54:56 -0400
Received: from 5.mo177.mail-out.ovh.net ([46.105.39.154]:54280)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <clg@kaod.org>) id 1hdHNn-00057l-AH
 for qemu-arm@nongnu.org; Tue, 18 Jun 2019 12:54:55 -0400
Received: from player157.ha.ovh.net (unknown [10.109.146.32])
 by mo177.mail-out.ovh.net (Postfix) with ESMTP id D86BBFF5FA
 for <qemu-arm@nongnu.org>; Tue, 18 Jun 2019 18:54:53 +0200 (CEST)
Received: from kaod.org (lfbn-1-10649-41.w90-89.abo.wanadoo.fr [90.89.235.41])
 (Authenticated sender: clg@kaod.org)
 by player157.ha.ovh.net (Postfix) with ESMTPSA id 554A66EB53EB;
 Tue, 18 Jun 2019 16:54:47 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 18 Jun 2019 18:53:03 +0200
Message-Id: <20190618165311.27066-14-clg@kaod.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190618165311.27066-1-clg@kaod.org>
References: <20190618165311.27066-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 1683501838070614801
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduvddrtddtgdejjecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 46.105.39.154
Subject: [Qemu-arm] [PATCH v2 13/21] aspeed: add a RAM memory region
 container
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
 qemu-devel@nongnu.org, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: STHpusp2fh0j

The RAM memory region is defined after the SoC is realized when the
SDMC controller has checked that the defined RAM size for the machine
is correct. This is problematic for controller models requiring a link
on the RAM region, for DMA support in the SMC controller for instance.

Introduce a container memory region for the RAM that we can link into
the controllers early, before the SoC is realized. It will be
populated with the RAM region after the checks have be done.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
Reviewed-by: Joel Stanley <joel@jms.id.au>
---
 hw/arm/aspeed.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index 5d73267da16f..7f01df1b61d8 100644
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
@@ -193,16 +198,16 @@ static void aspeed_board_init(MachineState *machine=
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
2.21.0

