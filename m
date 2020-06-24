Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp243825lfm;
        Wed, 24 Jun 2020 01:43:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz2XYCuD4qZh1qEvWskWIouxgiKkkMW5s7ZOlijchnYpWkaS1L1vP/Ue28HTF11lJyIsYjn
X-Received: by 2002:a25:9345:: with SMTP id g5mr41984708ybo.485.1592988232449;
        Wed, 24 Jun 2020 01:43:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592988232; cv=none;
        d=google.com; s=arc-20160816;
        b=v1BLSQpvO0azFJtvUFN9FqARA6qbg5NFCTVoD5gi11L5Id0Q8ptmrFDPilq/h6f2+m
         /Bqv7rw8j7pP+3f41p1qqAmk31lP4zu/spESlVypmZ2sp19wAUdKsbsjFe11V3A9Of3i
         1ZdZVKHwbB2pU6funHu7FBv0WTar33EluAa7cny0jM1rZeWL3MYIXuifbeHYx8VvS6+M
         DCrU48DbIY+VK7AB6tLuW68Eajhq2WlL+eG8Ng4rXvWtoLjkP/lGQvhoYvFkeGIPvJPx
         FWCQCHDYBlZcWafYWGawSCQ+D5sOyOXGY1co2Zn5mMrEOygc+nrWJaAVOnLjCflzNG/p
         9Shw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=n9LivGaeRzJLdwRKYcbd/3+fqEYyCcLCXcStNN17dX8=;
        b=Z9j17ImvtJmXaK8dBHWVxAUZB4LtgoD4eVhz/hDkf8O4LPYdd8jb+JfXvlkmt/aace
         Z3b0H2ZavBcBqrE9Qf0sYcM/t1U9wSZeAKmSpKiy/SLXXhFDDmiYtc6rJkY8gsPnvIVc
         lwkggkJpLQJ+/OtlO38YupUzQrWaYGk8az6Ijoo1TXhKTx7fFJ3fh1IEieSEwdy9XdaF
         4KGOUzjXxFxHhwvJTeznoRYNcQVI1Or4m/qtDPkFXUVPRs6g8IUKFDFux9ywkQEPBfqm
         MsS42h55auEeHXLap5IGVphCTEuFR4vqV0TYs7Rka5ulVS6R5O32ARQQ5UvYHAX5RpdU
         311w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=MHfz95Uj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q6si19966109ybk.287.2020.06.24.01.43.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 24 Jun 2020 01:43:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=MHfz95Uj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:33080 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jo10Z-0003bY-PU
	for alex.bennee@linaro.org; Wed, 24 Jun 2020 04:43:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48416)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jo0un-0000pk-GG
 for qemu-arm@nongnu.org; Wed, 24 Jun 2020 04:37:53 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:26540
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jo0uh-00026I-F0
 for qemu-arm@nongnu.org; Wed, 24 Jun 2020 04:37:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592987866;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=n9LivGaeRzJLdwRKYcbd/3+fqEYyCcLCXcStNN17dX8=;
 b=MHfz95UjLCYX4xS0BLGFzY3xsB2fv6NLT8WFwRYFE/uNOXPTYQWa15ziyUcyQr93/IsTIP
 AnQfSIP33JtmqezXr+UrSBpST+BIrLVniydjFU2iMB6KfY0rWSQczYH62mqXFnuvgorj98
 PEwyufrCW4M4R2SuK7TMrx/0dhHC2CY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-320-vhKog43aNJ6Hw3-SbTuKqQ-1; Wed, 24 Jun 2020 04:37:44 -0400
X-MC-Unique: vhKog43aNJ6Hw3-SbTuKqQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EEDE4800C60;
 Wed, 24 Jun 2020 08:37:42 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-121.ams2.redhat.com
 [10.36.112.121])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6D35A61981;
 Wed, 24 Jun 2020 08:37:42 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id B4D16113847E; Wed, 24 Jun 2020 10:37:37 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 16/25] hw/arm: Drop useless object_property_set_link()
 error handling
Date: Wed, 24 Jun 2020 10:37:28 +0200
Message-Id: <20200624083737.3086768-17-armbru@redhat.com>
In-Reply-To: <20200624083737.3086768-1-armbru@redhat.com>
References: <20200624083737.3086768-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=armbru@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/24 03:27:53
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +pMU9a/NOGeh

object_property_set_link() fails when the property doesn't exist, is
not settable, or its .check() method fails.  These are all programming
errors here, so passing it &error_abort is appropriate.

Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: "Cédric Le Goater" <clg@kaod.org>
Cc: Andrew Jeffery <andrew@aj.id.au>
Cc: Joel Stanley <joel@jms.id.au>
Cc: qemu-arm@nongnu.org
Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
---
 hw/arm/armsse.c         | 53 ++++++++++-------------------------------
 hw/arm/armv7m.c         |  7 ++----
 hw/arm/aspeed_ast2600.c | 20 ++++------------
 hw/arm/aspeed_soc.c     | 14 ++++-------
 hw/arm/nrf51_soc.c      |  6 +----
 5 files changed, 24 insertions(+), 76 deletions(-)

diff --git a/hw/arm/armsse.c b/hw/arm/armsse.c
index e8f8f60abc..c73cc6badf 100644
--- a/hw/arm/armsse.c
+++ b/hw/arm/armsse.c
@@ -564,16 +564,8 @@ static void armsse_realize(DeviceState *dev, Error **errp)
                                                 &s->container, -1);
         }
         object_property_set_link(cpuobj, OBJECT(&s->cpu_container[i]),
-                                 "memory", &err);
-        if (err) {
-            error_propagate(errp, err);
-            return;
-        }
-        object_property_set_link(cpuobj, OBJECT(s), "idau", &err);
-        if (err) {
-            error_propagate(errp, err);
-            return;
-        }
+                                 "memory", &error_abort);
+        object_property_set_link(cpuobj, OBJECT(s), "idau", &error_abort);
         sysbus_realize(SYS_BUS_DEVICE(cpuobj), &err);
         if (err) {
             error_propagate(errp, err);
@@ -700,11 +692,7 @@ static void armsse_realize(DeviceState *dev, Error **errp)
             return;
         }
         object_property_set_link(OBJECT(&s->mpc[i]), OBJECT(&s->sram[i]),
-                                 "downstream", &err);
-        if (err) {
-            error_propagate(errp, err);
-            return;
-        }
+                                 "downstream", &error_abort);
         sysbus_realize(SYS_BUS_DEVICE(&s->mpc[i]), &err);
         if (err) {
             error_propagate(errp, err);
@@ -755,11 +743,8 @@ static void armsse_realize(DeviceState *dev, Error **errp)
     sysbus_connect_irq(SYS_BUS_DEVICE(&s->timer0), 0,
                        armsse_get_common_irq_in(s, 3));
     mr = sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->timer0), 0);
-    object_property_set_link(OBJECT(&s->apb_ppc0), OBJECT(mr), "port[0]", &err);
-    if (err) {
-        error_propagate(errp, err);
-        return;
-    }
+    object_property_set_link(OBJECT(&s->apb_ppc0), OBJECT(mr), "port[0]",
+                             &error_abort);
 
     qdev_prop_set_uint32(DEVICE(&s->timer1), "pclk-frq", s->mainclk_frq);
     sysbus_realize(SYS_BUS_DEVICE(&s->timer1), &err);
@@ -770,12 +755,8 @@ static void armsse_realize(DeviceState *dev, Error **errp)
     sysbus_connect_irq(SYS_BUS_DEVICE(&s->timer1), 0,
                        armsse_get_common_irq_in(s, 4));
     mr = sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->timer1), 0);
-    object_property_set_link(OBJECT(&s->apb_ppc0), OBJECT(mr), "port[1]", &err);
-    if (err) {
-        error_propagate(errp, err);
-        return;
-    }
-
+    object_property_set_link(OBJECT(&s->apb_ppc0), OBJECT(mr), "port[1]",
+                             &error_abort);
 
     qdev_prop_set_uint32(DEVICE(&s->dualtimer), "pclk-frq", s->mainclk_frq);
     sysbus_realize(SYS_BUS_DEVICE(&s->dualtimer), &err);
@@ -786,11 +767,8 @@ static void armsse_realize(DeviceState *dev, Error **errp)
     sysbus_connect_irq(SYS_BUS_DEVICE(&s->dualtimer), 0,
                        armsse_get_common_irq_in(s, 5));
     mr = sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->dualtimer), 0);
-    object_property_set_link(OBJECT(&s->apb_ppc0), OBJECT(mr), "port[2]", &err);
-    if (err) {
-        error_propagate(errp, err);
-        return;
-    }
+    object_property_set_link(OBJECT(&s->apb_ppc0), OBJECT(mr), "port[2]",
+                             &error_abort);
 
     if (info->has_mhus) {
         /*
@@ -815,12 +793,8 @@ static void armsse_realize(DeviceState *dev, Error **errp)
             port = g_strdup_printf("port[%d]", i + 3);
             mr = sysbus_mmio_get_region(mhu_sbd, 0);
             object_property_set_link(OBJECT(&s->apb_ppc0), OBJECT(mr),
-                                     port, &err);
+                                     port, &error_abort);
             g_free(port);
-            if (err) {
-                error_propagate(errp, err);
-                return;
-            }
 
             /*
              * Each MHU has an irq line for each CPU:
@@ -967,11 +941,8 @@ static void armsse_realize(DeviceState *dev, Error **errp)
     sysbus_connect_irq(SYS_BUS_DEVICE(&s->s32ktimer), 0,
                        armsse_get_common_irq_in(s, 2));
     mr = sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->s32ktimer), 0);
-    object_property_set_link(OBJECT(&s->apb_ppc1), OBJECT(mr), "port[0]", &err);
-    if (err) {
-        error_propagate(errp, err);
-        return;
-    }
+    object_property_set_link(OBJECT(&s->apb_ppc1), OBJECT(mr), "port[0]",
+                             &error_abort);
 
     sysbus_realize(SYS_BUS_DEVICE(&s->apb_ppc1), &err);
     if (err) {
diff --git a/hw/arm/armv7m.c b/hw/arm/armv7m.c
index ce83586e03..3308211e9c 100644
--- a/hw/arm/armv7m.c
+++ b/hw/arm/armv7m.c
@@ -170,11 +170,8 @@ static void armv7m_realize(DeviceState *dev, Error **errp)
     object_property_set_link(OBJECT(s->cpu), OBJECT(&s->container), "memory",
                              &error_abort);
     if (object_property_find(OBJECT(s->cpu), "idau", NULL)) {
-        object_property_set_link(OBJECT(s->cpu), s->idau, "idau", &err);
-        if (err != NULL) {
-            error_propagate(errp, err);
-            return;
-        }
+        object_property_set_link(OBJECT(s->cpu), s->idau, "idau",
+                                 &error_abort);
     }
     if (object_property_find(OBJECT(s->cpu), "init-svtor", NULL)) {
         object_property_set_uint(OBJECT(s->cpu), s->init_svtor,
diff --git a/hw/arm/aspeed_ast2600.c b/hw/arm/aspeed_ast2600.c
index 08b3592e36..4efac02e2b 100644
--- a/hw/arm/aspeed_ast2600.c
+++ b/hw/arm/aspeed_ast2600.c
@@ -341,11 +341,8 @@ static void aspeed_soc_ast2600_realize(DeviceState *dev, Error **errp)
     }
 
     /* I2C */
-    object_property_set_link(OBJECT(&s->i2c), OBJECT(s->dram_mr), "dram", &err);
-    if (err) {
-        error_propagate(errp, err);
-        return;
-    }
+    object_property_set_link(OBJECT(&s->i2c), OBJECT(s->dram_mr), "dram",
+                             &error_abort);
     sysbus_realize(SYS_BUS_DEVICE(&s->i2c), &err);
     if (err) {
         error_propagate(errp, err);
@@ -363,11 +360,8 @@ static void aspeed_soc_ast2600_realize(DeviceState *dev, Error **errp)
     }
 
     /* FMC, The number of CS is set at the board level */
-    object_property_set_link(OBJECT(&s->fmc), OBJECT(s->dram_mr), "dram", &err);
-    if (err) {
-        error_propagate(errp, err);
-        return;
-    }
+    object_property_set_link(OBJECT(&s->fmc), OBJECT(s->dram_mr), "dram",
+                             &error_abort);
     object_property_set_int(OBJECT(&s->fmc), sc->memmap[ASPEED_SDRAM],
                             "sdram-base", &err);
     if (err) {
@@ -388,11 +382,7 @@ static void aspeed_soc_ast2600_realize(DeviceState *dev, Error **errp)
     /* SPI */
     for (i = 0; i < sc->spis_num; i++) {
         object_property_set_link(OBJECT(&s->spi[i]), OBJECT(s->dram_mr),
-                                 "dram", &err);
-        if (err) {
-            error_propagate(errp, err);
-            return;
-        }
+                                 "dram", &error_abort);
         object_property_set_int(OBJECT(&s->spi[i]), 1, "num-cs", &err);
         sysbus_realize(SYS_BUS_DEVICE(&s->spi[i]), &err);
         if (err) {
diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
index ec21de50ce..03b91bade6 100644
--- a/hw/arm/aspeed_soc.c
+++ b/hw/arm/aspeed_soc.c
@@ -300,11 +300,8 @@ static void aspeed_soc_realize(DeviceState *dev, Error **errp)
     }
 
     /* I2C */
-    object_property_set_link(OBJECT(&s->i2c), OBJECT(s->dram_mr), "dram", &err);
-    if (err) {
-        error_propagate(errp, err);
-        return;
-    }
+    object_property_set_link(OBJECT(&s->i2c), OBJECT(s->dram_mr), "dram",
+                             &error_abort);
     sysbus_realize(SYS_BUS_DEVICE(&s->i2c), &err);
     if (err) {
         error_propagate(errp, err);
@@ -315,11 +312,8 @@ static void aspeed_soc_realize(DeviceState *dev, Error **errp)
                        aspeed_soc_get_irq(s, ASPEED_I2C));
 
     /* FMC, The number of CS is set at the board level */
-    object_property_set_link(OBJECT(&s->fmc), OBJECT(s->dram_mr), "dram", &err);
-    if (err) {
-        error_propagate(errp, err);
-        return;
-    }
+    object_property_set_link(OBJECT(&s->fmc), OBJECT(s->dram_mr), "dram",
+                             &error_abort);
     object_property_set_int(OBJECT(&s->fmc), sc->memmap[ASPEED_SDRAM],
                             "sdram-base", &err);
     if (err) {
diff --git a/hw/arm/nrf51_soc.c b/hw/arm/nrf51_soc.c
index 5a8961ddbb..20dd8b5897 100644
--- a/hw/arm/nrf51_soc.c
+++ b/hw/arm/nrf51_soc.c
@@ -66,11 +66,7 @@ static void nrf51_soc_realize(DeviceState *dev_soc, Error **errp)
     }
 
     object_property_set_link(OBJECT(&s->cpu), OBJECT(&s->container), "memory",
-            &err);
-    if (err) {
-        error_propagate(errp, err);
-        return;
-    }
+                             &error_abort);
     sysbus_realize(SYS_BUS_DEVICE(&s->cpu), &err);
     if (err) {
         error_propagate(errp, err);
-- 
2.26.2

