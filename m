Received: by 2002:a5d:4308:0:0:0:0:0 with SMTP id h8-v6csp2856295wrq;
        Mon, 9 Jul 2018 14:11:51 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpdds0KhxU6SjnBOjNSivpumoO4k2GTilWaysOSDX4tfzMu2EiD7EYU2oxyNQk48DAkJydVK
X-Received: by 2002:a37:8f41:: with SMTP id r62-v6mr2681487qkd.412.1531170711730;
        Mon, 09 Jul 2018 14:11:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1531170711; cv=none;
        d=google.com; s=arc-20160816;
        b=pOmG/S/v+sS0uzRRDy9VxYqMdO+0ANiEFEG48EvShNyCXUgWDyrMMTfsb14LsvlQ9B
         Yk0/tG0P7AdyCZL8c/9BFnzVCvxkdzsOkn15gjlKH16Z4AKpopgOH6rdv52YJOZdNq+B
         6kVK+EJnX9Fv1yIOmmUguxHY9rD60mK6kt7S13iBFjzR5frPgisopZMP7xNjbncbtQcI
         8DmYKGLhVsx59EmWrHNZi5SnXqdLdEMfJDAXmaYSxLSw1qDpcPwZJE04ItQnvdgzVd3t
         KG7+0bA04+tTu+Lc24FmZ5KRKCfFrP2qJxQ4p0R3+2PbLJl9UmE8FU9LTsSQP/kjLMYR
         1sGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :arc-authentication-results;
        bh=TvFvYvDtQWyeJsjR/n2IEvP19AItxjfK2j6bMefsVMU=;
        b=rsmwlgLF7ZYItRzMJwTEPRHvPUKURK8nuvCUd4xwJb4Z3s0YKnEDiXQIiDaEhcJWFQ
         6aqL5TTJix0qGGSZbZTBPxf/KYQzajxpgVzS0ckIa9B0/n353xvo54a220K+t92juU6R
         zLgQ5fX2DjIZOiZiQ5G0o31PfxsFaxJ8nXZk3J9vpz5qL0fb7t8dzsoHL1YujGGGhi0u
         Uy+LtFQJZCrEGRYailJ0q0yS8LDEBBauuO4+0Zm31Shqa4xtB556SalBcmaxbcio6/Hc
         IE65jgLawOilsXC3UuiXbdTfKWg3o4KJF8sPZn3SByh7roVA69oFV/mNr2iDseEPRw0U
         gsxw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q29-v6si4752548qta.379.2018.07.09.14.11.51
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 09 Jul 2018 14:11:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:44434 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fcdRn-0004kA-4E
	for alex.bennee@linaro.org; Mon, 09 Jul 2018 17:11:51 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57990)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1fcdJR-0005ki-35
	for qemu-arm@nongnu.org; Mon, 09 Jul 2018 17:03:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1fcdJL-0003iO-Ue
	for qemu-arm@nongnu.org; Mon, 09 Jul 2018 17:03:13 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:50582 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1fcdJL-0003iI-OZ; Mon, 09 Jul 2018 17:03:07 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id DE9D5401EF11;
	Mon,  9 Jul 2018 21:03:06 +0000 (UTC)
Received: from thh440s.redhat.com (ovpn-116-40.ams2.redhat.com [10.36.116.40])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 023E92156891;
	Mon,  9 Jul 2018 21:03:03 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Date: Mon,  9 Jul 2018 23:03:00 +0200
Message-Id: <1531170180-21199-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.5]);
	Mon, 09 Jul 2018 21:03:06 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.5]);
	Mon, 09 Jul 2018 21:03:06 +0000 (UTC) for IP:'10.11.54.6'
	DOMAIN:'int-mx06.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'thuth@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-arm] [PATCH] hw/arm/bcm283x: Fix crash with device_add
 bcm2837 on unsupported machines
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
	Markus Armbruster <armbru@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: mWwrsNh8XamQ

When trying to "device_add bcm2837" on a machine that is not suitable for
this device, you can quickly crash QEMU afterwards, e.g. with "info qtree":

echo "{'execute':'qmp_capabilities'} {'execute':'device_add', " \
 "'arguments':{'driver':'bcm2837'}} {'execute': 'human-monitor-command', " \
 "'arguments': {'command-line': 'info qtree'}}" | \
 aarch64-softmmu/qemu-system-aarch64 -M integratorcp,accel=qtest -S -qmp stdio

{"QMP": {"version": {"qemu": {"micro": 50, "minor": 12, "major": 2},
 "package": "build-all"}, "capabilities": []}}
{"return": {}}
{"error": {"class": "GenericError", "desc": "Device 'bcm2837' can not be
 hotplugged on this machine"}}
Segmentation fault (core dumped)

The problem is that qdev_set_parent_bus() from instance_init adds a link
to the child devices which is not valid anymore after the device init
failed. Thus the qdev_set_parent_bus() must rather be done in the realize
function instead.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 hw/arm/bcm2835_peripherals.c | 25 ++++++++++++++-----------
 1 file changed, 14 insertions(+), 11 deletions(-)

diff --git a/hw/arm/bcm2835_peripherals.c b/hw/arm/bcm2835_peripherals.c
index 6be7660..4724a29 100644
--- a/hw/arm/bcm2835_peripherals.c
+++ b/hw/arm/bcm2835_peripherals.c
@@ -43,22 +43,18 @@ static void bcm2835_peripherals_init(Object *obj)
     /* Interrupt Controller */
     object_initialize(&s->ic, sizeof(s->ic), TYPE_BCM2835_IC);
     object_property_add_child(obj, "ic", OBJECT(&s->ic), NULL);
-    qdev_set_parent_bus(DEVICE(&s->ic), sysbus_get_default());
 
     /* UART0 */
     s->uart0 = SYS_BUS_DEVICE(object_new("pl011"));
     object_property_add_child(obj, "uart0", OBJECT(s->uart0), NULL);
-    qdev_set_parent_bus(DEVICE(s->uart0), sysbus_get_default());
 
     /* AUX / UART1 */
     object_initialize(&s->aux, sizeof(s->aux), TYPE_BCM2835_AUX);
     object_property_add_child(obj, "aux", OBJECT(&s->aux), NULL);
-    qdev_set_parent_bus(DEVICE(&s->aux), sysbus_get_default());
 
     /* Mailboxes */
     object_initialize(&s->mboxes, sizeof(s->mboxes), TYPE_BCM2835_MBOX);
     object_property_add_child(obj, "mbox", OBJECT(&s->mboxes), NULL);
-    qdev_set_parent_bus(DEVICE(&s->mboxes), sysbus_get_default());
 
     object_property_add_const_link(OBJECT(&s->mboxes), "mbox-mr",
                                    OBJECT(&s->mbox_mr), &error_abort);
@@ -68,7 +64,6 @@ static void bcm2835_peripherals_init(Object *obj)
     object_property_add_child(obj, "fb", OBJECT(&s->fb), NULL);
     object_property_add_alias(obj, "vcram-size", OBJECT(&s->fb), "vcram-size",
                               &error_abort);
-    qdev_set_parent_bus(DEVICE(&s->fb), sysbus_get_default());
 
     object_property_add_const_link(OBJECT(&s->fb), "dma-mr",
                                    OBJECT(&s->gpu_bus_mr), &error_abort);
@@ -78,7 +73,6 @@ static void bcm2835_peripherals_init(Object *obj)
     object_property_add_child(obj, "property", OBJECT(&s->property), NULL);
     object_property_add_alias(obj, "board-rev", OBJECT(&s->property),
                               "board-rev", &error_abort);
-    qdev_set_parent_bus(DEVICE(&s->property), sysbus_get_default());
 
     object_property_add_const_link(OBJECT(&s->property), "fb",
                                    OBJECT(&s->fb), &error_abort);
@@ -88,22 +82,18 @@ static void bcm2835_peripherals_init(Object *obj)
     /* Random Number Generator */
     object_initialize(&s->rng, sizeof(s->rng), TYPE_BCM2835_RNG);
     object_property_add_child(obj, "rng", OBJECT(&s->rng), NULL);
-    qdev_set_parent_bus(DEVICE(&s->rng), sysbus_get_default());
 
     /* Extended Mass Media Controller */
     object_initialize(&s->sdhci, sizeof(s->sdhci), TYPE_SYSBUS_SDHCI);
     object_property_add_child(obj, "sdhci", OBJECT(&s->sdhci), NULL);
-    qdev_set_parent_bus(DEVICE(&s->sdhci), sysbus_get_default());
 
     /* SDHOST */
     object_initialize(&s->sdhost, sizeof(s->sdhost), TYPE_BCM2835_SDHOST);
     object_property_add_child(obj, "sdhost", OBJECT(&s->sdhost), NULL);
-    qdev_set_parent_bus(DEVICE(&s->sdhost), sysbus_get_default());
 
     /* DMA Channels */
     object_initialize(&s->dma, sizeof(s->dma), TYPE_BCM2835_DMA);
     object_property_add_child(obj, "dma", OBJECT(&s->dma), NULL);
-    qdev_set_parent_bus(DEVICE(&s->dma), sysbus_get_default());
 
     object_property_add_const_link(OBJECT(&s->dma), "dma-mr",
                                    OBJECT(&s->gpu_bus_mr), &error_abort);
@@ -111,7 +101,6 @@ static void bcm2835_peripherals_init(Object *obj)
     /* GPIO */
     object_initialize(&s->gpio, sizeof(s->gpio), TYPE_BCM2835_GPIO);
     object_property_add_child(obj, "gpio", OBJECT(&s->gpio), NULL);
-    qdev_set_parent_bus(DEVICE(&s->gpio), sysbus_get_default());
 
     object_property_add_const_link(OBJECT(&s->gpio), "sdbus-sdhci",
                                    OBJECT(&s->sdhci.sdbus), &error_abort);
@@ -126,8 +115,22 @@ static void bcm2835_peripherals_realize(DeviceState *dev, Error **errp)
     MemoryRegion *ram;
     Error *err = NULL;
     uint64_t ram_size, vcram_size;
+    BusState *sysbus;
     int n;
 
+    sysbus = sysbus_get_default();
+    qdev_set_parent_bus(DEVICE(&s->ic), sysbus);
+    qdev_set_parent_bus(DEVICE(s->uart0), sysbus);
+    qdev_set_parent_bus(DEVICE(&s->aux), sysbus);
+    qdev_set_parent_bus(DEVICE(&s->mboxes), sysbus);
+    qdev_set_parent_bus(DEVICE(&s->fb), sysbus);
+    qdev_set_parent_bus(DEVICE(&s->property), sysbus);
+    qdev_set_parent_bus(DEVICE(&s->rng), sysbus);
+    qdev_set_parent_bus(DEVICE(&s->sdhci), sysbus);
+    qdev_set_parent_bus(DEVICE(&s->sdhost), sysbus);
+    qdev_set_parent_bus(DEVICE(&s->dma), sysbus);
+    qdev_set_parent_bus(DEVICE(&s->gpio), sysbus);
+
     obj = object_property_get_link(OBJECT(dev), "ram", &err);
     if (obj == NULL) {
         error_setg(errp, "%s: required ram link not found: %s",
-- 
1.8.3.1

