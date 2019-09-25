Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp892772wrp;
        Wed, 25 Sep 2019 07:50:12 -0700 (PDT)
X-Google-Smtp-Source: APXvYqz64HjvD0hBIjNFODoyqvOTQHSe+YzlpC1Z4rwdxXMrZ9ntGVdzOKQhrraARLe7nctk1MfK
X-Received: by 2002:a0c:e403:: with SMTP id o3mr7932446qvl.102.1569423011936;
        Wed, 25 Sep 2019 07:50:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1569423011; cv=none;
        d=google.com; s=arc-20160816;
        b=i7euuDr9WkXM+lAWNg/z9PR88aPGbfZSDDRNbUfZtd02XSd+WKRffC1qXyo57FGtYy
         qKzZmBbR/T1Vci7HhG1sKcLHLl9heKCdfLkbDNhaWdIh05OLlfq7Lwrn6h+yCijIbU/V
         3ddR+eHRK5Jd7Deg5DnV+qTXMhBZeYDDg7LNMbaETpt+p7WVNgTaGnqrotwTJaAGz6gE
         C//MYIgzs4f+iWIkvndPXy/gC2KgHtbJDEzQBJv9rRGsw5qgfgDYbk8+va0cd3UAyhmd
         SIKgdCsoITYzWHu63FhFZolGH5lWz6G43zqmvyncPL6kz6pZ00Y/0MgEqjAjnVLqWK06
         6ASw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=u4X8CvYyyuAzWNkrfc9Pn6LFwcjz7veY1JOpwQY9I/U=;
        b=SQzaUGDWR3KneY3B/O6e76SRqMEVNKwtlzdycAPmeblW2cTQ/cFl1D4iTCrFFSh+UO
         pTH5CRzpm3E6pRo7B03D3ox4YiXNH11KvJTXlB5hks0chihfAjn8nxnmGa7nzCoOMkq8
         iPGZv/hRp/KLxPsAupyzhl3DpLmJdQQH9FeaigZITUdRwAlbCROLA6OUD4V1kevikYji
         N8NmuUHtELXCkDFLTqZm1hw+Qr7pNSNz00kSzh9PIEM7MieBaEu5NbYZVDWqzal6NaYd
         1bvftYvEoiEl3surBihwsFIU/VGUuxfBviBKzur/6+eSdMKNGVpGu8ybyodTund++SZ/
         0Mnw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o65si4099021qtd.63.2019.09.25.07.50.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 25 Sep 2019 07:50:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:53116 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iD8cM-0001Aa-9Y
	for alex.bennee@linaro.org; Wed, 25 Sep 2019 10:50:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52617)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <clg@kaod.org>) id 1iD8N7-0004A7-Dt
 for qemu-devel@nongnu.org; Wed, 25 Sep 2019 10:34:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <clg@kaod.org>) id 1iD8N6-0001EP-0g
 for qemu-devel@nongnu.org; Wed, 25 Sep 2019 10:34:25 -0400
Received: from 4.mo3.mail-out.ovh.net ([178.33.46.10]:43796)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <clg@kaod.org>) id 1iD8N5-0001Dm-RZ
 for qemu-devel@nongnu.org; Wed, 25 Sep 2019 10:34:23 -0400
Received: from player786.ha.ovh.net (unknown [10.108.35.90])
 by mo3.mail-out.ovh.net (Postfix) with ESMTP id 42BC1226A0C
 for <qemu-devel@nongnu.org>; Wed, 25 Sep 2019 16:34:19 +0200 (CEST)
Received: from kaod.org (lfbn-1-2229-223.w90-76.abo.wanadoo.fr [90.76.50.223])
 (Authenticated sender: clg@kaod.org)
 by player786.ha.ovh.net (Postfix) with ESMTPSA id 50F72A4D3F2D;
 Wed, 25 Sep 2019 14:34:13 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v2 11/23] hw: wdt_aspeed: Add AST2600 support
Date: Wed, 25 Sep 2019 16:32:36 +0200
Message-Id: <20190925143248.10000-12-clg@kaod.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190925143248.10000-1-clg@kaod.org>
References: <20190925143248.10000-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 8857173092676700945
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedrfedvgdejkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 178.33.46.10
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
Cc: Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: povj1ECQRYzF

From: Joel Stanley <joel@jms.id.au>

The AST2600 has four watchdogs, and they each have a 0x40 of registers.

When running as part of an ast2600 system we must check a different
offset for the system reset control register in the SCU.

Signed-off-by: Joel Stanley <joel@jms.id.au>
[clg: - reworked model integration into new object class ]
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 include/hw/arm/aspeed_soc.h      |  2 +-
 include/hw/watchdog/wdt_aspeed.h |  1 +
 hw/watchdog/wdt_aspeed.c         | 29 +++++++++++++++++++++++++++++
 3 files changed, 31 insertions(+), 1 deletion(-)

diff --git a/include/hw/arm/aspeed_soc.h b/include/hw/arm/aspeed_soc.h
index ba5bbb53e1a1..b427f2668a8a 100644
--- a/include/hw/arm/aspeed_soc.h
+++ b/include/hw/arm/aspeed_soc.h
@@ -27,7 +27,7 @@
 #include "hw/sd/aspeed_sdhci.h"
=20
 #define ASPEED_SPIS_NUM  2
-#define ASPEED_WDTS_NUM  3
+#define ASPEED_WDTS_NUM  4
 #define ASPEED_CPUS_NUM  2
 #define ASPEED_MACS_NUM  2
=20
diff --git a/include/hw/watchdog/wdt_aspeed.h b/include/hw/watchdog/wdt_a=
speed.h
index 796342764e2e..dfedd7662dd1 100644
--- a/include/hw/watchdog/wdt_aspeed.h
+++ b/include/hw/watchdog/wdt_aspeed.h
@@ -18,6 +18,7 @@
     OBJECT_CHECK(AspeedWDTState, (obj), TYPE_ASPEED_WDT)
 #define TYPE_ASPEED_2400_WDT TYPE_ASPEED_WDT "-ast2400"
 #define TYPE_ASPEED_2500_WDT TYPE_ASPEED_WDT "-ast2500"
+#define TYPE_ASPEED_2600_WDT TYPE_ASPEED_WDT "-ast2600"
=20
 #define ASPEED_WDT_REGS_MAX        (0x20 / 4)
=20
diff --git a/hw/watchdog/wdt_aspeed.c b/hw/watchdog/wdt_aspeed.c
index fc0e6c486a70..145be6f99ce2 100644
--- a/hw/watchdog/wdt_aspeed.c
+++ b/hw/watchdog/wdt_aspeed.c
@@ -40,12 +40,14 @@
 #define     WDT_DRIVE_TYPE_MASK         (0xFF << 24)
 #define     WDT_PUSH_PULL_MAGIC         (0xA8 << 24)
 #define     WDT_OPEN_DRAIN_MAGIC        (0x8A << 24)
+#define WDT_RESET_MASK1                 (0x1c / 4)
=20
 #define WDT_TIMEOUT_STATUS              (0x10 / 4)
 #define WDT_TIMEOUT_CLEAR               (0x14 / 4)
=20
 #define WDT_RESTART_MAGIC               0x4755
=20
+#define AST2600_SCU_RESET_CONTROL1      (0x40 / 4)
 #define SCU_RESET_CONTROL1              (0x04 / 4)
 #define    SCU_RESET_SDRAM              BIT(0)
=20
@@ -74,6 +76,8 @@ static uint64_t aspeed_wdt_read(void *opaque, hwaddr of=
fset, unsigned size)
         return s->regs[WDT_CTRL];
     case WDT_RESET_WIDTH:
         return s->regs[WDT_RESET_WIDTH];
+    case WDT_RESET_MASK1:
+        return s->regs[WDT_RESET_MASK1];
     case WDT_TIMEOUT_STATUS:
     case WDT_TIMEOUT_CLEAR:
         qemu_log_mask(LOG_UNIMP,
@@ -146,6 +150,11 @@ static void aspeed_wdt_write(void *opaque, hwaddr of=
fset, uint64_t data,
         s->regs[WDT_RESET_WIDTH] |=3D data & awc->ext_pulse_width_mask;
         break;
=20
+    case WDT_RESET_MASK1:
+        /* TODO: implement */
+        s->regs[WDT_RESET_MASK1] =3D data;
+        break;
+
     case WDT_TIMEOUT_STATUS:
     case WDT_TIMEOUT_CLEAR:
         qemu_log_mask(LOG_UNIMP,
@@ -316,12 +325,32 @@ static const TypeInfo aspeed_2500_wdt_info =3D {
     .class_init =3D aspeed_2500_wdt_class_init,
 };
=20
+static void aspeed_2600_wdt_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc =3D DEVICE_CLASS(klass);
+    AspeedWDTClass *awc =3D ASPEED_WDT_CLASS(klass);
+
+    dc->desc =3D "ASPEED 2600 Watchdog Controller";
+    awc->offset =3D 0x40;
+    awc->ext_pulse_width_mask =3D 0xfffff; /* TODO */
+    awc->reset_ctrl_reg =3D AST2600_SCU_RESET_CONTROL1;
+    awc->reset_pulse =3D aspeed_2500_wdt_reset_pulse;
+}
+
+static const TypeInfo aspeed_2600_wdt_info =3D {
+    .name =3D TYPE_ASPEED_2600_WDT,
+    .parent =3D TYPE_ASPEED_WDT,
+    .instance_size =3D sizeof(AspeedWDTState),
+    .class_init =3D aspeed_2600_wdt_class_init,
+};
+
 static void wdt_aspeed_register_types(void)
 {
     watchdog_add_model(&model);
     type_register_static(&aspeed_wdt_info);
     type_register_static(&aspeed_2400_wdt_info);
     type_register_static(&aspeed_2500_wdt_info);
+    type_register_static(&aspeed_2600_wdt_info);
 }
=20
 type_init(wdt_aspeed_register_types)
--=20
2.21.0

