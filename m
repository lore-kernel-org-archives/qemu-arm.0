Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp3770476lfm;
        Tue, 30 Jun 2020 02:13:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyz8pvog3oW1izwrLJ5Puobcqb+grPrD49hGpGz6t5zsn/cF4XlosbrQ4AnGLEzXTKu2U8R
X-Received: by 2002:a25:aaec:: with SMTP id t99mr34325579ybi.337.1593508426962;
        Tue, 30 Jun 2020 02:13:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593508426; cv=none;
        d=google.com; s=arc-20160816;
        b=LsoAv/esro6N8wIDSblTq6xOVhCpM0t1tGB+oe7Qy7wXOXa0+LDAluYoXUq8FH2h4N
         2nebhBJpBiX1CdbCwDtYVlTUph4Dku3wgC6BAdArLtPfQMbXBEY+Y9ve+QGM190H57hT
         97NqzQ24AFOh5RG7wsN4AzjZG4p/2IcIqBOFqv1u+yDdlLNZMTmeqfk3UEOApdi5jbiS
         PnAZ1jy3P2JWzNlN3vnDwMh669wfD9SYhM8paEiiP2o4VssL1UFLuatzf5lIcnCOUuaQ
         GddcRmk02Iu6s27GfStBWw8mT4kqGwYHrD0+gHM+cfqWBRTwfYmdOAtfWsSKovIsXodI
         Fk3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=n9LivGaeRzJLdwRKYcbd/3+fqEYyCcLCXcStNN17dX8=;
        b=R2xuBNXkRmDHRSlbxbqIxPR84hup2xTAcsTimEb11vPWz3Yw+kAlTkJNPSiFKDsuET
         dM8ISRki5L4UaJC1OZIYHX2EoaTDcnTEu3bXQ2yRvanIL7QVNHeKY18TAFerw6zxd7f0
         bu2v86Ocq+8kp5vAGAee0vF+kR0Un3cCR7FsIwaiuvlzjXvSmej2cJh4R/aWP2mPX6e8
         aBJoRM9e6k6sUp7lnF1lHpNlg8hO1/iophLhaYXlYADGNzse8EKYEMT9f4vgXK6d9HAN
         TF+I4+E7jwH6+dE1bkvWaasenMvT1oqVB0C4e+i59m8HRhIUW7IrricCAWthPOL9f1y4
         wQqw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=JFxlz1O5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i70si2275514ybg.418.2020.06.30.02.13.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 30 Jun 2020 02:13:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=JFxlz1O5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:36624 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jqCKo-0005MV-A1
	for alex.bennee@linaro.org; Tue, 30 Jun 2020 05:13:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40236)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jqCBg-0002wm-9x
 for qemu-arm@nongnu.org; Tue, 30 Jun 2020 05:04:21 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:48713
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jqCBQ-0002y7-04
 for qemu-arm@nongnu.org; Tue, 30 Jun 2020 05:04:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593507843;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=n9LivGaeRzJLdwRKYcbd/3+fqEYyCcLCXcStNN17dX8=;
 b=JFxlz1O5JREtHKgKt+mkJBby0u5BuAwdYUsgD9aczk8gFtMK0vl/ryHCfQgznAxSSEOPfc
 LJdOLd3L5fcWNJBtIJ9Ngr00o63fToGv4kuoH++DrzWOM6cJTaObVqP7v6MwV+Ms2/eHUN
 l8fMfRdxIbNGWmcC3i9BpHthk52Wjgs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-389-e6HJGQu1MsiTwTQY9UVxHQ-1; Tue, 30 Jun 2020 05:03:59 -0400
X-MC-Unique: e6HJGQu1MsiTwTQY9UVxHQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2646E8015F6;
 Tue, 30 Jun 2020 09:03:57 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-121.ams2.redhat.com
 [10.36.112.121])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B67B610027A6;
 Tue, 30 Jun 2020 09:03:56 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 070D6113847C; Tue, 30 Jun 2020 11:03:52 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 16/26] hw/arm: Drop useless object_property_set_link()
 error handling
Date: Tue, 30 Jun 2020 11:03:41 +0200
Message-Id: <20200630090351.1247703-17-armbru@redhat.com>
In-Reply-To: <20200630090351.1247703-1-armbru@redhat.com>
References: <20200630090351.1247703-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/30 02:00:02
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
X-TUID: xLRr0MVOAnw1

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

