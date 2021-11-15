Received: by 2002:ac2:5544:0:0:0:0:0 with SMTP id l4csp5818706lfk;
        Mon, 15 Nov 2021 04:56:23 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyV9DH/ik+sx2OOoI3dFwK9c7bSM6ccO1rIJl5uAr2ecyRFtdPYRgnEds2Jk5vxNyd2pdKO
X-Received: by 2002:a05:6102:3588:: with SMTP id h8mr42001690vsu.7.1636980983182;
        Mon, 15 Nov 2021 04:56:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1636980983; cv=none;
        d=google.com; s=arc-20160816;
        b=rHMOJXGqMdY1UvT2gOC6xEwPd0c1ZqtZe1Qda1IgnzzMVVelzCH5VeVetAAzJt8jlT
         eY8hTh5hd8onODNqdYUnIXRTVI5hpZp8DgqGr9VW0jLiCV/cIDhniynLsSORsoqXhBuE
         l/O4x83a+M2OJoZMK/225MVe7XrPDJIqDBOpG17kT8wsl5eA8fxpCPJhS+VpQrF0mpp0
         TFLva1wpl4btfhS5lagLQyq3gExmWxRbUC0TyH5FvDOBglK3/TdxEpn4841iBvw/s1Z3
         7YLWlXi7KGMp0/BIodhIQDIi66mfA302y5fk+TwqxHmLEcXhVQdd6wscSTwrM+9/E5d8
         tCnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=TOsTWBWxnLz62C8yfjKGuCcZSpotvWzGI0o051hAbF4=;
        b=rbS6ZfeDBth5oyH3Ncpnc9yj4T7koXLcNHVClsDvchjnQC7nuA356gpdxABVeS5v0D
         HqcAoKO1L/QJYe1+ZLaOE8IJDHJmLww34kePsg/xzio0K1m5KgND60wA+pBZye0CCao/
         ZkGZfNlxW/XcxsYgD/R9WAFWv3MFJMe77lW+NMSUW8zLE1//IsGqxS87Zd4oRvD/AZir
         xWCEsbwcBde6YJG8i4IQ9bMwB/l5xVlT/R8bElUNGNB22FTDnH3hsYR8v0/65FzvVP0A
         H6eTF3kA5NyDa6QDiLBJghuTseUtRov3l5qAeyKz0Pb8T9i7wh4JPXkuNO5A489DFYhv
         3+Vg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=H9yc+69G;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v8si19371142vss.87.2021.11.15.04.56.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 15 Nov 2021 04:56:23 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=H9yc+69G;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:34558 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mmbX4-0002c4-HM
	for alex.bennee@linaro.org; Mon, 15 Nov 2021 07:56:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52672)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mmbWb-0001ac-3X
 for qemu-arm@nongnu.org; Mon, 15 Nov 2021 07:55:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45802)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mmbWV-0005Wf-Cu
 for qemu-arm@nongnu.org; Mon, 15 Nov 2021 07:55:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636980945;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TOsTWBWxnLz62C8yfjKGuCcZSpotvWzGI0o051hAbF4=;
 b=H9yc+69Gr1I6vfEqSF/inelsfovFBYyvqx6Y78U4+Jti1kRx3IDehVES2gsQTeqlyP1Ptc
 nx4fig7JTINZDZ+51kRqrbmBR+V440RaiBox2XNWHCIGRPQEX0ggeOS+o5Pfbc+XZKJkRX
 ca5FYT4Mk0J+cccMS4impZX0V5T8pKY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-592-oeYpk8jzNzyzKQtW0muRXw-1; Mon, 15 Nov 2021 07:55:42 -0500
X-MC-Unique: oeYpk8jzNzyzKQtW0muRXw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 86A271023F57;
 Mon, 15 Nov 2021 12:55:39 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-7.ams2.redhat.com [10.36.112.7])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 03F8F60C04;
 Mon, 15 Nov 2021 12:55:37 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 7681C11380AA; Mon, 15 Nov 2021 13:55:36 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH RFC 1/2] hw/sd/ssi-sd: Do not create SD card within
 controller's realize
Date: Mon, 15 Nov 2021 13:55:35 +0100
Message-Id: <20211115125536.3341681-2-armbru@redhat.com>
In-Reply-To: <20211115125536.3341681-1-armbru@redhat.com>
References: <20211115125536.3341681-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, bin.meng@windriver.com,
 mark.cave-ayland@ilande.co.uk, sundeep.lkml@gmail.com, qemu-block@nongnu.org,
 andrew.smirnov@gmail.com, hskinnemoen@google.com, joel@jms.id.au,
 atar4qemu@gmail.com, alistair@alistair23.me, b.galvani@gmail.com,
 nieklinnenbank@gmail.com, qemu-arm@nongnu.org, clg@kaod.org, kwolf@redhat.com,
 qemu-riscv@nongnu.org, andrew@aj.id.au, f4bug@amsat.org,
 Andrew.Baumann@microsoft.com, jcd@tribudubois.net, kfting@nuvoton.com,
 hreitz@redhat.com, palmer@dabbelt.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: BnE76YQHcBCW

ssi_sd_realize() creates an "sd-card" device.  This is inappropriate,
and marked FIXME.

Move it to the boards that create these devices.  Prior art: commit
eb4f566bbb for device "generic-sdhci", and commit 26c607b86b for
device "pl181".

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 hw/arm/stellaris.c  | 15 ++++++++++++++-
 hw/riscv/sifive_u.c | 15 +++++++++++++--
 hw/sd/ssi-sd.c      | 29 -----------------------------
 3 files changed, 27 insertions(+), 32 deletions(-)

diff --git a/hw/arm/stellaris.c b/hw/arm/stellaris.c
index 78827ace6b..b6c8a5d609 100644
--- a/hw/arm/stellaris.c
+++ b/hw/arm/stellaris.c
@@ -10,6 +10,7 @@
 #include "qemu/osdep.h"
 #include "qapi/error.h"
 #include "hw/sysbus.h"
+#include "hw/sd/sd.h"
 #include "hw/ssi/ssi.h"
 #include "hw/arm/boot.h"
 #include "qemu/timer.h"
@@ -1157,6 +1158,9 @@ static void stellaris_init(MachineState *ms, stellaris_board_info *board)
             void *bus;
             DeviceState *sddev;
             DeviceState *ssddev;
+            DriveInfo *dinfo;
+            DeviceState *carddev;
+            BlockBackend *blk;
 
             /*
              * Some boards have both an OLED controller and SD card connected to
@@ -1221,8 +1225,17 @@ static void stellaris_init(MachineState *ms, stellaris_board_info *board)
              *  - Make the ssd0323 OLED controller chipselect active-low
              */
             bus = qdev_get_child_bus(dev, "ssi");
-
             sddev = ssi_create_peripheral(bus, "ssi-sd");
+
+            dinfo = drive_get(IF_SD, 0, 0);
+            blk = dinfo ? blk_by_legacy_dinfo(dinfo) : NULL;
+            carddev = qdev_new(TYPE_SD_CARD);
+            qdev_prop_set_drive_err(carddev, "drive", blk, &error_fatal);
+            qdev_prop_set_bit(carddev, "spi", true);
+            qdev_realize_and_unref(carddev,
+                                   qdev_get_child_bus(sddev, "sd-bus"),
+                                   &error_fatal);
+
             ssddev = ssi_create_peripheral(bus, "ssd0323");
             gpio_out[GPIO_D][0] = qemu_irq_split(
                     qdev_get_gpio_in_named(sddev, SSI_GPIO_CS, 0),
diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
index 589ae72a59..aa74e67889 100644
--- a/hw/riscv/sifive_u.c
+++ b/hw/riscv/sifive_u.c
@@ -46,6 +46,7 @@
 #include "hw/char/serial.h"
 #include "hw/cpu/cluster.h"
 #include "hw/misc/unimp.h"
+#include "hw/sd/sd.h"
 #include "hw/ssi/ssi.h"
 #include "target/riscv/cpu.h"
 #include "hw/riscv/riscv_hart.h"
@@ -536,7 +537,8 @@ static void sifive_u_machine_init(MachineState *machine)
     uint32_t fdt_load_addr;
     uint64_t kernel_entry;
     DriveInfo *dinfo;
-    DeviceState *flash_dev, *sd_dev;
+    BlockBackend *blk;
+    DeviceState *flash_dev, *sd_dev, *card_dev;
     qemu_irq flash_cs, sd_cs;
 
     /* Initialize SoC */
@@ -670,7 +672,7 @@ static void sifive_u_machine_init(MachineState *machine)
 
     /* Connect an SPI flash to SPI0 */
     flash_dev = qdev_new("is25wp256");
-    dinfo = drive_get_next(IF_MTD);
+    dinfo = drive_get(IF_MTD, 0, 0);
     if (dinfo) {
         qdev_prop_set_drive_err(flash_dev, "drive",
                                 blk_by_legacy_dinfo(dinfo),
@@ -686,6 +688,15 @@ static void sifive_u_machine_init(MachineState *machine)
 
     sd_cs = qdev_get_gpio_in_named(sd_dev, SSI_GPIO_CS, 0);
     sysbus_connect_irq(SYS_BUS_DEVICE(&s->soc.spi2), 1, sd_cs);
+
+    dinfo = drive_get(IF_SD, 0, 0);
+    blk = dinfo ? blk_by_legacy_dinfo(dinfo) : NULL;
+    card_dev = qdev_new(TYPE_SD_CARD);
+    qdev_prop_set_drive_err(card_dev, "drive", blk, &error_fatal);
+    qdev_prop_set_bit(card_dev, "spi", true);
+    qdev_realize_and_unref(card_dev,
+                           qdev_get_child_bus(sd_dev, "sd-bus"),
+                           &error_fatal);
 }
 
 static bool sifive_u_machine_get_start_in_flash(Object *obj, Error **errp)
diff --git a/hw/sd/ssi-sd.c b/hw/sd/ssi-sd.c
index e60854eeef..558506f6a0 100644
--- a/hw/sd/ssi-sd.c
+++ b/hw/sd/ssi-sd.c
@@ -368,36 +368,9 @@ static const VMStateDescription vmstate_ssi_sd = {
 
 static void ssi_sd_realize(SSIPeripheral *d, Error **errp)
 {
-    ERRP_GUARD();
     ssi_sd_state *s = SSI_SD(d);
-    DeviceState *carddev;
-    DriveInfo *dinfo;
 
     qbus_init(&s->sdbus, sizeof(s->sdbus), TYPE_SD_BUS, DEVICE(d), "sd-bus");
-
-    /* Create and plug in the sd card */
-    /* FIXME use a qdev drive property instead of drive_get_next() */
-    dinfo = drive_get_next(IF_SD);
-    carddev = qdev_new(TYPE_SD_CARD);
-    if (dinfo) {
-        if (!qdev_prop_set_drive_err(carddev, "drive",
-                                     blk_by_legacy_dinfo(dinfo), errp)) {
-            goto fail;
-        }
-    }
-
-    if (!object_property_set_bool(OBJECT(carddev), "spi", true, errp)) {
-        goto fail;
-    }
-
-    if (!qdev_realize_and_unref(carddev, BUS(&s->sdbus), errp)) {
-        goto fail;
-    }
-
-    return;
-
-fail:
-    error_prepend(errp, "failed to init SD card: ");
 }
 
 static void ssi_sd_reset(DeviceState *dev)
@@ -426,8 +399,6 @@ static void ssi_sd_class_init(ObjectClass *klass, void *data)
     k->cs_polarity = SSI_CS_LOW;
     dc->vmsd = &vmstate_ssi_sd;
     dc->reset = ssi_sd_reset;
-    /* Reason: init() method uses drive_get_next() */
-    dc->user_creatable = false;
 }
 
 static const TypeInfo ssi_sd_info = {
-- 
2.31.1

