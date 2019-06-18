Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp3978582wrg;
        Tue, 18 Jun 2019 10:28:03 -0700 (PDT)
X-Google-Smtp-Source: APXvYqywOn+fIdTiLnTsox9D24sLTCKBwwPW3xtzE3sbOxuH0BCh2QC2aCaFF9hqrwhx6vOUUxHU
X-Received: by 2002:a0c:f788:: with SMTP id s8mr5086630qvn.35.1560878883494;
        Tue, 18 Jun 2019 10:28:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560878883; cv=none;
        d=google.com; s=arc-20160816;
        b=S6bgbIFjB1KZ5HINjG6kPALP1og7E5N9GMhFejUv9fONsS6fAg5ISqqQ6oKgyWOGJ8
         8x1Mrp4ImoFoRaznQEuGLvIF+PWZK4lLAI5OGli72QqVKGl0On8eW64M2+QkC2wHWeHh
         ZpV1Lf4tBRYhabyk31yncUzIR2kQ1evW+OGO5yp/U9TDaRHteMWUec2Boum22J2ZrVZw
         DbEk6LsnaFN3ZdbDOPFNn4ObJl1oECWNDsovlmf6PUPg3fku29H2BEX+HMCtqriVez/y
         tKjufHNGJFYeQUTDC3uzuFqAaGYTowzcu2RFQgNsN56ezxKV1s1dY2RIJTg6sf7gtSRU
         R6AA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=w8tPb5u7rwsrSsE+tPBcLXRqsQOe/aOpkDBsMSMFXXY=;
        b=n+CCnuF8Y/AuWSPSF+UJDhFn+RWBKt7s2jqiEbWa9zPJPPLpQrULqetDqRNdXOriV0
         oBwTdYWW407yL3aRNPbliouIeocWxm28luAK8KBFll1fjF1HR5AsKF7kuJPGAAe6KxlH
         4/t703bav9md493dnUGBkwNKoIBiUUZddiTitr2zhQCEqPIJqE6H6M2eZgs+TB1oA3c0
         CA8xDjcC6X0K2jQJKYvtItjP1seQCIwSc2o1Ld3GdQwvvWKnAFJuQXCX5uEnvO04HNED
         3sIyGsnnK1XEnTFQGUgNEiB1xoYOAtis4a6w4nLlViN0heHb+hqYKJLkVr6HLurbN+FC
         oKYA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h47si759128qtc.37.2019.06.18.10.28.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 18 Jun 2019 10:28:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:60514 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hdHtr-0002gd-0v
	for alex.bennee@linaro.org; Tue, 18 Jun 2019 13:28:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60459)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <clg@kaod.org>) id 1hdHN4-0008Rk-Ml
 for qemu-arm@nongnu.org; Tue, 18 Jun 2019 12:54:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <clg@kaod.org>) id 1hdHN3-0004BU-K3
 for qemu-arm@nongnu.org; Tue, 18 Jun 2019 12:54:10 -0400
Received: from 8.mo178.mail-out.ovh.net ([46.105.74.227]:33051)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <clg@kaod.org>) id 1hdHN3-00049t-ES
 for qemu-arm@nongnu.org; Tue, 18 Jun 2019 12:54:09 -0400
Received: from player157.ha.ovh.net (unknown [10.109.143.18])
 by mo178.mail-out.ovh.net (Postfix) with ESMTP id 4751F6C18F
 for <qemu-arm@nongnu.org>; Tue, 18 Jun 2019 18:54:07 +0200 (CEST)
Received: from kaod.org (lfbn-1-10649-41.w90-89.abo.wanadoo.fr [90.89.235.41])
 (Authenticated sender: clg@kaod.org)
 by player157.ha.ovh.net (Postfix) with ESMTPSA id DE3B46EB51EE;
 Tue, 18 Jun 2019 16:53:59 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 18 Jun 2019 18:52:56 +0200
Message-Id: <20190618165311.27066-7-clg@kaod.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190618165311.27066-1-clg@kaod.org>
References: <20190618165311.27066-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 1670553987857419025
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduvddrtddtgdejjecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 46.105.74.227
Subject: [Qemu-arm] [PATCH v2 06/21] aspeed: add support for multiple NICs
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
X-TUID: 7YmeF5h+UvRS

The Aspeed SoCs have two MACs. Extend the Aspeed model to support a
second NIC.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 include/hw/arm/aspeed_soc.h |  3 ++-
 hw/arm/aspeed_soc.c         | 33 +++++++++++++++++++--------------
 2 files changed, 21 insertions(+), 15 deletions(-)

diff --git a/include/hw/arm/aspeed_soc.h b/include/hw/arm/aspeed_soc.h
index b613b00600fc..75b557060b9b 100644
--- a/include/hw/arm/aspeed_soc.h
+++ b/include/hw/arm/aspeed_soc.h
@@ -25,6 +25,7 @@
 #define ASPEED_SPIS_NUM  2
 #define ASPEED_WDTS_NUM  3
 #define ASPEED_CPUS_NUM  2
+#define ASPEED_MACS_NUM  2
=20
 typedef struct AspeedSoCState {
     /*< private >*/
@@ -43,7 +44,7 @@ typedef struct AspeedSoCState {
     AspeedSMCState spi[ASPEED_SPIS_NUM];
     AspeedSDMCState sdmc;
     AspeedWDTState wdt[ASPEED_WDTS_NUM];
-    FTGMAC100State ftgmac100;
+    FTGMAC100State ftgmac100[ASPEED_MACS_NUM];
 } AspeedSoCState;
=20
 #define TYPE_ASPEED_SOC "aspeed-soc"
diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
index d38fb0aaa0f5..736e52366a66 100644
--- a/hw/arm/aspeed_soc.c
+++ b/hw/arm/aspeed_soc.c
@@ -234,8 +234,10 @@ static void aspeed_soc_init(Object *obj)
                                     sc->info->silicon_rev);
     }
=20
-    sysbus_init_child_obj(obj, "ftgmac100", OBJECT(&s->ftgmac100),
-                          sizeof(s->ftgmac100), TYPE_FTGMAC100);
+    for (i =3D 0; i < ASPEED_MACS_NUM; i++) {
+        sysbus_init_child_obj(obj, "ftgmac100[*]", OBJECT(&s->ftgmac100[=
i]),
+                              sizeof(s->ftgmac100[i]), TYPE_FTGMAC100);
+    }
 }
=20
 static void aspeed_soc_realize(DeviceState *dev, Error **errp)
@@ -382,19 +384,22 @@ static void aspeed_soc_realize(DeviceState *dev, Er=
ror **errp)
     }
=20
     /* Net */
-    qdev_set_nic_properties(DEVICE(&s->ftgmac100), &nd_table[0]);
-    object_property_set_bool(OBJECT(&s->ftgmac100), true, "aspeed", &err=
);
-    object_property_set_bool(OBJECT(&s->ftgmac100), true, "realized",
-                             &local_err);
-    error_propagate(&err, local_err);
-    if (err) {
-        error_propagate(errp, err);
-        return;
+    for (i =3D 0; i < nb_nics; i++) {
+        qdev_set_nic_properties(DEVICE(&s->ftgmac100[i]), &nd_table[i]);
+        object_property_set_bool(OBJECT(&s->ftgmac100[i]), true, "aspeed=
",
+                                 &err);
+        object_property_set_bool(OBJECT(&s->ftgmac100[i]), true, "realiz=
ed",
+                                 &local_err);
+        error_propagate(&err, local_err);
+        if (err) {
+            error_propagate(errp, err);
+           return;
+        }
+        sysbus_mmio_map(SYS_BUS_DEVICE(&s->ftgmac100[i]), 0,
+                        sc->info->memmap[ASPEED_ETH1 + i]);
+        sysbus_connect_irq(SYS_BUS_DEVICE(&s->ftgmac100[i]), 0,
+                           aspeed_soc_get_irq(s, ASPEED_ETH1 + i));
     }
-    sysbus_mmio_map(SYS_BUS_DEVICE(&s->ftgmac100), 0,
-                    sc->info->memmap[ASPEED_ETH1]);
-    sysbus_connect_irq(SYS_BUS_DEVICE(&s->ftgmac100), 0,
-                       aspeed_soc_get_irq(s, ASPEED_ETH1));
 }
 static Property aspeed_soc_properties[] =3D {
     DEFINE_PROP_UINT32("num-cpus", AspeedSoCState, num_cpus, 0),
--=20
2.21.0

