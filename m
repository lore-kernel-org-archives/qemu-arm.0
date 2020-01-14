Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp5330398lff;
        Tue, 14 Jan 2020 02:36:01 -0800 (PST)
X-Google-Smtp-Source: APXvYqzY8I2+nyJQSlb5TZOfA4fcGCzH9dMk46jokM3cxT/J/cWOOSVnDuPJPyThqwdC1yV54uML
X-Received: by 2002:a17:906:6bd5:: with SMTP id t21mr22265001ejs.110.1578998161382;
        Tue, 14 Jan 2020 02:36:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578998161; cv=none;
        d=google.com; s=arc-20160816;
        b=mFgx20Gy9RJacTmsVq1xJYv4dUX8WLhu8NAIXiguDVlbc51YaSDHcpoCKk6UnwyBNs
         XEIUPjxO765GfLjL0nxjGGYE6wuPx+o8otW3B83Woe1+HM1Jyb9cIi2+ht4qMge2iZU8
         ZXCy/nhWW9nYQdnQe9oVlJW8+MDomX7eE81T/4/lYcsXs21BMewQA8kCMTK3JuJ4eKL9
         QkIO5xaEifRgvie5USold7U8sYQpd3tORwdnlrz3ddB1tkucjEKrY/eU/a7TYtNx6LAa
         LXLci3EPZC4/4zG0xMjRzn4rAHguz80/61/vZkDBRBShoKNTrE4X5RUG+vWk6i4I1bkp
         Rgug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=nuT9N8OkIVfT/xtg9rtevD7icNoa1P3msVM+85BSXVo=;
        b=0xfMzu5ZdsmYgDJzNPbOsfntViRtcMeJ5MXTIrgi1839szlGP1udahKXqeF/Ekf8pJ
         U8cm82ioZEStNFeUli7qHdSt2XIlN40f+FLNTFDy3XRH7HTAyaXQp7WX7dxq7c4QnogN
         ZYAVMftoClGICa5gUQVw2ZSdSqjl22EXACDbmk6I6W6N0r5fiO9GPy5+moVUbUbUfZWM
         7gSTIxPluQG4DvkE2PTFkPu0JHCW3bJGem1kto7lkJww2GV76TBKX+4ia+A+Fhdpc7Yl
         m6jaQMR7ZBYNJI4/7AEGcox3CTANCz8lwpLT6HThxE4BBtYVEioSgJQf5jkAQcU+EuVM
         AeHw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r5si9246628edq.383.2020.01.14.02.36.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 14 Jan 2020 02:36:01 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:36534 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1irJYF-0005Bl-OE
	for alex.bennee@linaro.org; Tue, 14 Jan 2020 05:35:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43117)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <clg@kaod.org>) id 1irJXS-0004qk-Ej
 for qemu-arm@nongnu.org; Tue, 14 Jan 2020 05:35:15 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <clg@kaod.org>) id 1irJXO-0003fr-Er
 for qemu-arm@nongnu.org; Tue, 14 Jan 2020 05:35:10 -0500
Received: from 1.mo69.mail-out.ovh.net ([178.33.251.173]:56844)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <clg@kaod.org>) id 1irJXO-0003fa-8Q
 for qemu-arm@nongnu.org; Tue, 14 Jan 2020 05:35:06 -0500
Received: from player798.ha.ovh.net (unknown [10.108.57.44])
 by mo69.mail-out.ovh.net (Postfix) with ESMTP id DF22279D99
 for <qemu-arm@nongnu.org>; Tue, 14 Jan 2020 11:35:03 +0100 (CET)
Received: from kaod.org (82-64-250-170.subs.proxad.net [82.64.250.170])
 (Authenticated sender: clg@kaod.org)
 by player798.ha.ovh.net (Postfix) with ESMTPSA id 9C2E3E4CFDED;
 Tue, 14 Jan 2020 10:34:52 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v3 2/5] hw/arm: ast2600: Wire up the eMMC controller
Date: Tue, 14 Jan 2020 11:34:30 +0100
Message-Id: <20200114103433.30534-3-clg@kaod.org>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200114103433.30534-1-clg@kaod.org>
References: <20200114103433.30534-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 11049300214691564305
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedrvdejvddgudeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvufffkffojghfgggtgfesthekredtredtjeenucfhrhhomhepveorughrihgtucfnvgcuifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucfkpheptddrtddrtddrtddpkedvrdeigedrvdehtddrudejtdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepphhlrgihvghrjeelkedrhhgrrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehqvghmuhdqrghrmhesnhhonhhgnhhurdhorhhgnecuvehluhhsthgvrhfuihiivgeptd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 178.33.251.173
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
X-TUID: CSfVpZEcmlR4

From: Andrew Jeffery <andrew@aj.id.au>

Initialise another SDHCI model instance for the AST2600's eMMC
controller and use the SDHCI's num_slots value introduced previously to
determine whether we should create an SD card instance for the new slot.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
[ clg : - removed ternary operator from sdhci_attach_drive()
        - renamed SDHCI objects with a '-controller' prefix ]
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 include/hw/arm/aspeed_soc.h |  2 ++
 hw/arm/aspeed.c             | 26 +++++++++++++++++---------
 hw/arm/aspeed_ast2600.c     | 29 ++++++++++++++++++++++++++---
 3 files changed, 45 insertions(+), 12 deletions(-)

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
index fb73c4043ea3..90cf1c755d3d 100644
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
@@ -196,16 +199,26 @@ static void aspeed_soc_ast2600_init(Object *obj)
     sysbus_init_child_obj(obj, "gpio_1_8v", OBJECT(&s->gpio_1_8v),
                           sizeof(s->gpio_1_8v), typename);
=20
-    sysbus_init_child_obj(obj, "sdc", OBJECT(&s->sdhci), sizeof(s->sdhci=
),
-                          TYPE_ASPEED_SDHCI);
+    sysbus_init_child_obj(obj, "sd-controller", OBJECT(&s->sdhci),
+                          sizeof(s->sdhci), TYPE_ASPEED_SDHCI);
=20
     object_property_set_int(OBJECT(&s->sdhci), 2, "num-slots", &error_ab=
ort);
=20
     /* Init sd card slot class here so that they're under the correct pa=
rent */
     for (i =3D 0; i < ASPEED_SDHCI_NUM_SLOTS; ++i) {
-        sysbus_init_child_obj(obj, "sdhci[*]", OBJECT(&s->sdhci.slots[i]=
),
+        sysbus_init_child_obj(obj, "sd-controller.sdhci[*]",
+                              OBJECT(&s->sdhci.slots[i]),
                               sizeof(s->sdhci.slots[i]), TYPE_SYSBUS_SDH=
CI);
     }
+
+    sysbus_init_child_obj(obj, "emmc-controller", OBJECT(&s->emmc),
+                          sizeof(s->emmc), TYPE_ASPEED_SDHCI);
+
+    object_property_set_int(OBJECT(&s->emmc), 1, "num-slots", &error_abo=
rt);
+
+    sysbus_init_child_obj(obj, "emmc-controller.sdhci",
+                          OBJECT(&s->emmc.slots[0]), sizeof(s->emmc.slot=
s[0]),
+                          TYPE_SYSBUS_SDHCI);
 }
=20
 /*
@@ -497,6 +510,16 @@ static void aspeed_soc_ast2600_realize(DeviceState *=
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

