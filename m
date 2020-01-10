Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp498857lff;
        Fri, 10 Jan 2020 02:26:54 -0800 (PST)
X-Google-Smtp-Source: APXvYqw+Q2IEEqhn4jfRwi1gOYuH8kF2yJNrQbYrMsIHezMML2OVY+iwg12vZcWXIrmXwMlP49EY
X-Received: by 2002:ad4:55a7:: with SMTP id f7mr2013084qvx.36.1578652014501;
        Fri, 10 Jan 2020 02:26:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578652014; cv=none;
        d=google.com; s=arc-20160816;
        b=NdQ0MbWaaW4aUqTnJOqquRONfqrURT1k50h4QxWtiLVJpdNcnR3P3CBlfxpZ4cK0Kw
         rPGyN2OVYWgaJqL28EW4OMxgMZZJV42cAsTJTHU+c1mfcY7uCl3aJ2wNyusNy+85JluX
         hRYazitKaAENOXG4V3hZ3RTrSXkCtzY8mXVv+h0RfnrIXDbuHYgOj6F/kPJlRV9zmXYx
         jqbKRIm+I4Q7uur+mE8IeO3TQQGnnTNd36vxgP1nuIouiXPbpCY90GlTj23ixYdMuHIj
         qiWDw7ltb9xiCIpxjMAIl0yrRHK7fZj3o+PVKyDEbQt30ZWWRVzXwOqoKGZu8U5Ssdy+
         Uu4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=4UI3yiHtveEBXoOweYYcF2N/fv1YcFtjHYRLQdcCHr0=;
        b=aO4MfNREhWb0zsMFsUaWp6Jq5YlRFNZAzAoBtFAkMRLN23T60UC4dzCs/tpkz5yaWC
         Wtl3RpNDNZHIFAUSCYfcwCquWwi9P3X49r8T1cwfWd5oERPLNhSY4ehLs/NegRmNQzX9
         THczeTk7nck3+RxLVy0bY+6jOuWu17pDKDI3Bq1oR+oDM93YMseaQO5P3mHyX+VwPIxK
         mubDQ4/iAV8lUAeC3KU7U9MXu8F+1SMpvnYStcNiDzMme6ytJHlYRFuluctrvqUqkZNb
         OFswdhc35dhfvuj5Ypxt/f83z+wWZxFhDfhZFByvYy62dCTKKQaHzDQdqOSf9Zb6HTDY
         BUtg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id by16si932525qvb.159.2020.01.10.02.26.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 10 Jan 2020 02:26:54 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:43616 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iprVF-0004dc-3O
	for alex.bennee@linaro.org; Fri, 10 Jan 2020 05:26:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33624)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <clg@kaod.org>) id 1iprUC-0002vz-2Y
 for qemu-arm@nongnu.org; Fri, 10 Jan 2020 05:25:49 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <clg@kaod.org>) id 1iprUA-00067n-Mv
 for qemu-arm@nongnu.org; Fri, 10 Jan 2020 05:25:48 -0500
Received: from 15.mo3.mail-out.ovh.net ([87.98.150.177]:45741)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <clg@kaod.org>) id 1iprUA-0005yR-GV
 for qemu-arm@nongnu.org; Fri, 10 Jan 2020 05:25:46 -0500
Received: from player786.ha.ovh.net (unknown [10.108.35.210])
 by mo3.mail-out.ovh.net (Postfix) with ESMTP id CDE2123CD50
 for <qemu-arm@nongnu.org>; Fri, 10 Jan 2020 11:25:43 +0100 (CET)
Received: from kaod.org (82-64-250-170.subs.proxad.net [82.64.250.170])
 (Authenticated sender: clg@kaod.org)
 by player786.ha.ovh.net (Postfix) with ESMTPSA id C7AA1E3A0622;
 Fri, 10 Jan 2020 10:25:35 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v2 2/5] hw/arm: ast2600: Wire up the eMMC controller
Date: Fri, 10 Jan 2020 11:25:15 +0100
Message-Id: <20200110102518.4233-3-clg@kaod.org>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200110102518.4233-1-clg@kaod.org>
References: <20200110102518.4233-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 5847642645207681809
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedrvdeifedgudehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvufffkffojghfgggtgfesthekredtredtjeenucfhrhhomhepveorughrihgtucfnvgcuifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucfkpheptddrtddrtddrtddpkedvrdeigedrvdehtddrudejtdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepphhlrgihvghrjeekiedrhhgrrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehqvghmuhdqrghrmhesnhhonhhgnhhurdhorhhgnecuvehluhhsthgvrhfuihiivgeptd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 87.98.150.177
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
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: htwcjXXbYgxJ

From: Andrew Jeffery <andrew@aj.id.au>

Initialise another SDHCI model instance for the AST2600's eMMC
controller and use the SDHCI's num_slots value introduced previously to
determine whether we should create an SD card instance for the new slot.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
[ clg : - removed ternary operator from sdhci_attach_drive()
        - changed object name to "emmc" ]
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 include/hw/arm/aspeed_soc.h |  2 ++
 hw/arm/aspeed.c             | 26 +++++++++++++++++---------
 hw/arm/aspeed_ast2600.c     | 21 +++++++++++++++++++++
 3 files changed, 40 insertions(+), 9 deletions(-)

diff --git a/include/hw/arm/aspeed_soc.h b/include/hw/arm/aspeed_soc.h
index e84380984f7b..90ac7f7ffa3b 100644
--- a/include/hw/arm/aspeed_soc.h
+++ b/include/hw/arm/aspeed_soc.h
@@ -57,6 +57,7 @@ typedef struct AspeedSoCState {
     AspeedGPIOState gpio;
     AspeedGPIOState gpio_1_8v;
     AspeedSDHCIState sdhci;
+    AspeedSDHCIState emmc;
 } AspeedSoCState;
=20
 #define TYPE_ASPEED_SOC "aspeed-soc"
@@ -126,6 +127,7 @@ enum {
     ASPEED_MII4,
     ASPEED_SDRAM,
     ASPEED_XDMA,
+    ASPEED_EMMC,
 };
=20
 #endif /* ASPEED_SOC_H */
diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index 4174e313cae5..8702256af1b2 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -171,6 +171,19 @@ static void aspeed_board_init_flashes(AspeedSMCState=
 *s, const char *flashtype,
     }
 }
=20
+static void sdhci_attach_drive(SDHCIState *sdhci, DriveInfo *dinfo)
+{
+        DeviceState *card;
+
+        card =3D qdev_create(qdev_get_child_bus(DEVICE(sdhci), "sd-bus")=
,
+                           TYPE_SD_CARD);
+        if (dinfo) {
+            qdev_prop_set_drive(card, "drive", blk_by_legacy_dinfo(dinfo=
),
+                                &error_fatal);
+        }
+        object_property_set_bool(OBJECT(card), true, "realized", &error_=
fatal);
+}
+
 static void aspeed_machine_init(MachineState *machine)
 {
     AspeedBoardState *bmc;
@@ -264,16 +277,11 @@ static void aspeed_machine_init(MachineState *machi=
ne)
     }
=20
     for (i =3D 0; i < bmc->soc.sdhci.num_slots; i++) {
-        SDHCIState *sdhci =3D &bmc->soc.sdhci.slots[i];
-        DriveInfo *dinfo =3D drive_get_next(IF_SD);
-        BlockBackend *blk;
-        DeviceState *card;
+        sdhci_attach_drive(&bmc->soc.sdhci.slots[i], drive_get_next(IF_S=
D));
+    }
=20
-        blk =3D dinfo ? blk_by_legacy_dinfo(dinfo) : NULL;
-        card =3D qdev_create(qdev_get_child_bus(DEVICE(sdhci), "sd-bus")=
,
-                           TYPE_SD_CARD);
-        qdev_prop_set_drive(card, "drive", blk, &error_fatal);
-        object_property_set_bool(OBJECT(card), true, "realized", &error_=
fatal);
+    if (bmc->soc.emmc.num_slots) {
+        sdhci_attach_drive(&bmc->soc.emmc.slots[0], drive_get_next(IF_SD=
));
     }
=20
     arm_load_kernel(ARM_CPU(first_cpu), machine, &aspeed_board_binfo);
diff --git a/hw/arm/aspeed_ast2600.c b/hw/arm/aspeed_ast2600.c
index fb73c4043ea3..6ad17723c88a 100644
--- a/hw/arm/aspeed_ast2600.c
+++ b/hw/arm/aspeed_ast2600.c
@@ -46,6 +46,7 @@ static const hwaddr aspeed_soc_ast2600_memmap[] =3D {
     [ASPEED_ADC]       =3D 0x1E6E9000,
     [ASPEED_VIDEO]     =3D 0x1E700000,
     [ASPEED_SDHCI]     =3D 0x1E740000,
+    [ASPEED_EMMC]      =3D 0x1E750000,
     [ASPEED_GPIO]      =3D 0x1E780000,
     [ASPEED_GPIO_1_8V] =3D 0x1E780800,
     [ASPEED_RTC]       =3D 0x1E781000,
@@ -64,6 +65,7 @@ static const hwaddr aspeed_soc_ast2600_memmap[] =3D {
=20
 #define ASPEED_SOC_AST2600_MAX_IRQ 128
=20
+/* Shared Peripheral Interrupt values below are offset by -32 from datas=
heet */
 static const int aspeed_soc_ast2600_irqmap[] =3D {
     [ASPEED_UART1]     =3D 47,
     [ASPEED_UART2]     =3D 48,
@@ -77,6 +79,7 @@ static const int aspeed_soc_ast2600_irqmap[] =3D {
     [ASPEED_ADC]       =3D 78,
     [ASPEED_XDMA]      =3D 6,
     [ASPEED_SDHCI]     =3D 43,
+    [ASPEED_EMMC]      =3D 15,
     [ASPEED_GPIO]      =3D 40,
     [ASPEED_GPIO_1_8V] =3D 11,
     [ASPEED_RTC]       =3D 13,
@@ -206,6 +209,14 @@ static void aspeed_soc_ast2600_init(Object *obj)
         sysbus_init_child_obj(obj, "sdhci[*]", OBJECT(&s->sdhci.slots[i]=
),
                               sizeof(s->sdhci.slots[i]), TYPE_SYSBUS_SDH=
CI);
     }
+
+    sysbus_init_child_obj(obj, "emmc", OBJECT(&s->emmc), sizeof(s->emmc)=
,
+                          TYPE_ASPEED_SDHCI);
+
+    object_property_set_int(OBJECT(&s->emmc), 1, "num-slots", &error_abo=
rt);
+
+    sysbus_init_child_obj(obj, "emmc", OBJECT(&s->emmc.slots[0]),
+            sizeof(s->emmc.slots[0]), TYPE_SYSBUS_SDHCI);
 }
=20
 /*
@@ -497,6 +508,16 @@ static void aspeed_soc_ast2600_realize(DeviceState *=
dev, Error **errp)
                     sc->memmap[ASPEED_SDHCI]);
     sysbus_connect_irq(SYS_BUS_DEVICE(&s->sdhci), 0,
                        aspeed_soc_get_irq(s, ASPEED_SDHCI));
+
+    /* eMMC */
+    object_property_set_bool(OBJECT(&s->emmc), true, "realized", &err);
+    if (err) {
+        error_propagate(errp, err);
+        return;
+    }
+    sysbus_mmio_map(SYS_BUS_DEVICE(&s->emmc), 0, sc->memmap[ASPEED_EMMC]=
);
+    sysbus_connect_irq(SYS_BUS_DEVICE(&s->emmc), 0,
+                       aspeed_soc_get_irq(s, ASPEED_EMMC));
 }
=20
 static void aspeed_soc_ast2600_class_init(ObjectClass *oc, void *data)
--=20
2.21.1

