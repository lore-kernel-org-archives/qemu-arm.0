Received: by 10.223.159.74 with SMTP id f10csp5536652wrg;
        Wed, 13 Dec 2017 12:53:01 -0800 (PST)
X-Google-Smtp-Source: ACJfBotnTP7oL4W+G9qwtPz2VxgyVNkmJCjFQNe4ANYe3FK4Iz8z/fmTK39AoI60L9FiM733ybOl
X-Received: by 10.37.97.12 with SMTP id v12mr2852521ybb.463.1513198381638;
        Wed, 13 Dec 2017 12:53:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1513198381; cv=none;
        d=google.com; s=arc-20160816;
        b=mFpyHB7Eyk5RPFWLWON6vuWudfKVOkKp8wCgc657pRZdgDxeAOvF3XzI0R5qeSPlv2
         Cyh6lqH2q1Hs6wBe5IFx9VY3mzs7OXHD12nQePj4e0MVjXulZAT6gMzuhvrFddMa+fnW
         Bgzye5a/OzF4dxVxub+9k8Xfo0AjPCCkRLIcvW4iAeg0fD+T6EzYambRYjpnONMOz3LX
         c0RBG6Fj5XcSiM3Bbgle9kEAW22je9ES+t1+0bupGGT6HtxvH9G5SHgM5rI7nn4OdlRh
         zGZNda/B3gdEUAaOzl0jEQ7qOppBZzS1qcbhCigaeE1Cyml0W+Syyi8egJQ23ORVkkb+
         8Lhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=PFxtEHbPyEJgvEtVcfjCeaVfNqc3d6DLBS0VcPEmtJc=;
        b=BdP0Eer++CPq+Bu6uPEoM6plwxZM+U9CvKn4Z4CAB6jYMQVGwmeYPo4m296kCRWkd7
         tFHYNAwDy1i7bZV4oXbyDUwGWIpXo+xMhxotzomLd/gfPfjaQ9ouiwtOvhO+LDhYv0sl
         D4zwkjlzcjAk5/9gHezGJmPcdotj/rKveePgvlZf0pQasfqpoqiAoZgCzzwnF1PImzR2
         MN1OfvdYA+C4oLrBzemEsCWLYnOBYAis3MAQM3CugUygRUCbo+rvYTU6MBuZDTjXPjMC
         4xQ4zN7w9xmkyv2IW2S2MbrmVRi8UM0PjeqLlhaUHtE+V3tuAfkMNPY1ReV/YuY9GITN
         M3MA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=ZX5qDqWJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w15si496111ybk.209.2017.12.13.12.53.01
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 13 Dec 2017 12:53:01 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=ZX5qDqWJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:37597 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ePE1V-0002Fh-23
	for alex.bennee@linaro.org; Wed, 13 Dec 2017 15:53:01 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39542)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ePDuL-0004aJ-Um
	for qemu-arm@nongnu.org; Wed, 13 Dec 2017 15:45:41 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ePDuK-0007Oj-P1
	for qemu-arm@nongnu.org; Wed, 13 Dec 2017 15:45:37 -0500
Received: from mail-qt0-x243.google.com ([2607:f8b0:400d:c0d::243]:42755)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ePDuI-0007Jy-1M; Wed, 13 Dec 2017 15:45:34 -0500
Received: by mail-qt0-x243.google.com with SMTP id g9so5392767qth.9;
	Wed, 13 Dec 2017 12:45:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=PFxtEHbPyEJgvEtVcfjCeaVfNqc3d6DLBS0VcPEmtJc=;
	b=ZX5qDqWJE3WQCOVJ9weAEO6RU083xZeTf2x+iU/qUA3myIvhawXusdIScphEwn5vyu
	BVVTbhihWA5L68Y6eoZiQ9iCKtUINZuwW1lkSaccueTKPtUdc5+vgxJLNP1XOusUW8Zp
	xXYq8yxEnLADaj6fg57iNIIGeeNaHYvNQWtEPufG4wS9zyLV24Sagkc7j16uyBhz09kJ
	u/GCJaWtmAHx8ze8aBgT62tRCGQKTnPZq3vaHFgCva0GWsDBJi9SNg+XXb2gWGrt/fCD
	Dhdlrcra63unLbE5maU75hQCjaeEtNCNgvYYPD5jHcmQt1xQtw6Uz3V/mOHLPfEVQKTH
	3Vpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=PFxtEHbPyEJgvEtVcfjCeaVfNqc3d6DLBS0VcPEmtJc=;
	b=ZPv23Yj5Acp+PfgjCVHT6/UIiYqRu32+R1MN5nFuF7cKRJD2niTBHL+462q1FZphrt
	fj4+loUe9KGeLYnLAgQsFNjc3o4N073LvCOTxJQgdpl6GkElFCoNN7SfnApzjutChBo+
	/u7cccq8h64yPneMkygtxU8d8fOxJj6ZIADMB3ji5yVJuzTDbGDtdFgqzewgSCK3iqNq
	9O9m6bg8EB5Y9WVQKLnzA4D2GxPKr6///JHTzQNki6siq6ob1sS3mQnMOAlyXem9dKOB
	loJgpBCmAdzS+zp1UVnfglCLscSucxGhSwALhp/Vz+/eVR3mUmr0OW8ECn0KPCTG5YwN
	PGRQ==
X-Gm-Message-State: AKGB3mLf8rtJ5taugbpUEopQ482OY04ZqBPM4hr3T3mWaFAhBnniy8X4
	eIJO3Fmp1negdcBD+EDRfek=
X-Received: by 10.200.51.201 with SMTP id d9mr12859790qtb.319.1513197933558;
	Wed, 13 Dec 2017 12:45:33 -0800 (PST)
Received: from x1.local ([138.117.48.211]) by smtp.gmail.com with ESMTPSA id
	n64sm1507938qkd.97.2017.12.13.12.45.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 13 Dec 2017 12:45:32 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Alistair Francis <alistair.francis@xilinx.com>,
	"Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
	Prasad J Pandit <pjp@fedoraproject.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>,
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	Andrey Yurovsky <yurovsky@gmail.com>,
	Clement Deschamps <clement.deschamps@antfield.fr>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Igor Mammedov <imammedo@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>
Date: Wed, 13 Dec 2017 17:44:35 -0300
Message-Id: <20171213204436.5379-11-f4bug@amsat.org>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20171213204436.5379-1-f4bug@amsat.org>
References: <20171213204436.5379-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::243
Subject: [Qemu-arm] [PATCH 10/11] hw/sd/pxa2xx: implement the SD_BUS_MASTER
 interface
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, Sai Pavan Boddu <saipava@xilinx.com>,
	qemu-arm@nongnu.org, Andrzej Zaborowski <balrogg@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: gDf0IzGp42/I

This MMC Interface is a SD bus master.
Replace qbus_create_inplace() by sdbus_create_bus(),
remove the PXA2XX_MMCI_BUS type.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/sd/pxa2xx_mmci.c | 36 ++++++++++++------------------------
 1 file changed, 12 insertions(+), 24 deletions(-)

diff --git a/hw/sd/pxa2xx_mmci.c b/hw/sd/pxa2xx_mmci.c
index f34951e1d1..da5f302f3c 100644
--- a/hw/sd/pxa2xx_mmci.c
+++ b/hw/sd/pxa2xx_mmci.c
@@ -24,9 +24,6 @@
 #define TYPE_PXA2XX_MMCI "pxa2xx-mmci"
 #define PXA2XX_MMCI(obj) OBJECT_CHECK(PXA2xxMMCIState, (obj), TYPE_PXA2XX_MMCI)
 
-#define TYPE_PXA2XX_MMCI_BUS "pxa2xx-mmci-bus"
-#define PXA2XX_MMCI_BUS(obj) OBJECT_CHECK(SDBus, (obj), TYPE_PXA2XX_MMCI_BUS)
-
 struct PXA2xxMMCIState {
     SysBusDevice parent_obj;
 
@@ -38,7 +35,7 @@ struct PXA2xxMMCIState {
     qemu_irq readonly;
 
     BlockBackend *blk;
-    SDBus sdbus;
+    SDBus *sdbus;
 
     uint32_t status;
     uint32_t clkrt;
@@ -183,7 +180,7 @@ static void pxa2xx_mmci_fifo_update(PXA2xxMMCIState *s)
 
     if (s->cmdat & CMDAT_WR_RD) {
         while (s->bytesleft && s->tx_len) {
-            sdbus_write_data(&s->sdbus, s->tx_fifo[s->tx_start++]);
+            sdbus_write_data(s->sdbus, s->tx_fifo[s->tx_start++]);
             s->tx_start &= 0x1f;
             s->tx_len --;
             s->bytesleft --;
@@ -193,7 +190,7 @@ static void pxa2xx_mmci_fifo_update(PXA2xxMMCIState *s)
     } else
         while (s->bytesleft && s->rx_len < 32) {
             s->rx_fifo[(s->rx_start + (s->rx_len ++)) & 0x1f] =
-                sdbus_read_data(&s->sdbus);
+                sdbus_read_data(s->sdbus);
             s->bytesleft --;
             s->intreq |= INT_RXFIFO_REQ;
         }
@@ -227,7 +224,7 @@ static void pxa2xx_mmci_wakequeues(PXA2xxMMCIState *s)
     request.arg = s->arg;
     request.crc = 0;	/* FIXME */
 
-    rsplen = sdbus_do_command(&s->sdbus, &request, response);
+    rsplen = sdbus_do_command(s->sdbus, &request, response);
     s->intreq |= INT_END_CMD;
 
     memset(s->resp_fifo, 0, sizeof(s->resp_fifo));
@@ -509,8 +506,8 @@ void pxa2xx_mmci_handlers(PXA2xxMMCIState *s, qemu_irq readonly,
     s->readonly = readonly;
     s->inserted = coverswitch;
 
-    pxa2xx_mmci_set_inserted(dev, sdbus_get_inserted(&s->sdbus));
-    pxa2xx_mmci_set_readonly(dev, sdbus_get_readonly(&s->sdbus));
+    pxa2xx_mmci_set_inserted(dev, sdbus_get_inserted(s->sdbus));
+    pxa2xx_mmci_set_readonly(dev, sdbus_get_readonly(s->sdbus));
 }
 
 static void pxa2xx_mmci_reset(DeviceState *d)
@@ -555,21 +552,16 @@ static void pxa2xx_mmci_instance_init(Object *obj)
     qdev_init_gpio_out_named(dev, &s->rx_dma, "rx-dma", 1);
     qdev_init_gpio_out_named(dev, &s->tx_dma, "tx-dma", 1);
 
-    qbus_create_inplace(&s->sdbus, sizeof(s->sdbus),
-                        TYPE_PXA2XX_MMCI_BUS, DEVICE(obj), "sd-bus");
+    s->sdbus = sdbus_create_bus(dev, "sd-bus");
 }
 
 static void pxa2xx_mmci_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
+    SDBusClass *sbc = SDBUS_MASTER_CLASS(klass);
 
     dc->vmsd = &vmstate_pxa2xx_mmci;
     dc->reset = pxa2xx_mmci_reset;
-}
-
-static void pxa2xx_mmci_bus_class_init(ObjectClass *klass, void *data)
-{
-    SDBusClass *sbc = SD_BUS_CLASS(klass);
 
     sbc->set_inserted = pxa2xx_mmci_set_inserted;
     sbc->set_readonly = pxa2xx_mmci_set_readonly;
@@ -581,19 +573,15 @@ static const TypeInfo pxa2xx_mmci_info = {
     .instance_size = sizeof(PXA2xxMMCIState),
     .instance_init = pxa2xx_mmci_instance_init,
     .class_init = pxa2xx_mmci_class_init,
-};
-
-static const TypeInfo pxa2xx_mmci_bus_info = {
-    .name = TYPE_PXA2XX_MMCI_BUS,
-    .parent = TYPE_SD_BUS,
-    .instance_size = sizeof(SDBus),
-    .class_init = pxa2xx_mmci_bus_class_init,
+    .interfaces = (InterfaceInfo[]) {
+        { TYPE_SD_BUS_MASTER_INTERFACE },
+        { },
+    },
 };
 
 static void pxa2xx_mmci_register_types(void)
 {
     type_register_static(&pxa2xx_mmci_info);
-    type_register_static(&pxa2xx_mmci_bus_info);
 }
 
 type_init(pxa2xx_mmci_register_types)
-- 
2.15.1

