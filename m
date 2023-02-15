Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp410221ejb;
        Wed, 15 Feb 2023 03:29:29 -0800 (PST)
X-Google-Smtp-Source: AK7set+EXEv5Kxf8RrGzqEMSSSE5J94GfmUqCctxpgaDpGykW4FRGE7WDkzZbg8F+uEsVnnnl3F+
X-Received: by 2002:ac8:7d49:0:b0:3b8:6d92:bf62 with SMTP id h9-20020ac87d49000000b003b86d92bf62mr2347457qtb.46.1676460569780;
        Wed, 15 Feb 2023 03:29:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676460569; cv=none;
        d=google.com; s=arc-20160816;
        b=xM5GFM6WK0SoSjPQKmN4hH2wtJserbF74TKWIkSIiL8IQLkZhgi5ga32OEq7K+ETeT
         /sx+MvAlBphHIFmQL247u2kS7OMANYuf3kIAIAnfAjMJCgq0Q5SMPxIWvKnTkM+roqcV
         2LZGi5Ayl2pJq3crjU4CXnXQsKk0b12oHJ65t0OW9KpMqIO/GQyBR+zN5ms7Un5xf7u/
         Ph72faqqEJ2F2BRJCiDP+uXejzqZ1eN7w4qRxz5CVmyHS8lLwZcfz+B0H4mYNVcOskA9
         V6fTOH62SKbS8MX/Be3e3r13nrw5ORqNJSJc+gX3UeUpOPFcvlNpdJk+qpopsrB6sNfF
         5ZGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=TiVfdka5B9ldkUYdKu7ft+9sFiPb97YGArIko4Y3Hq4=;
        b=w2HB1B3c2h6FUYkx76ndD0TWpkbeGb7UhXlFo4Pk0rO4c0ak/yStORlyRhmnMl3REF
         Zh9AuiR97XaCRwFrM6eOBWKaMMnY1yqsz53F/BPshS0dMqBIzR9bhBJjJ9VTGmC05U6R
         F2Jw8PQt+L0DN8XTFT65Vgq0sFVO6DIH62Vvh8PuoO76c+FHyVtmigcxGI3/Yn7MUt8U
         VfLAxbJHCO5SQNSRMZEE6hl8d/cb5Zobn/VotRC1AYyRG40p+U1S05q3ZHS3MyvMNOKz
         XqLQW3+upG1a/ndFbaMVUVohT/aeJcdgmXS4iYZf38rwcXzVUqZkeLDNlM0GDuppF11G
         /vuw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="oHJ/b4az";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t21-20020a05620a451500b007200a46e5fcsi15415966qkp.136.2023.02.15.03.29.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 15 Feb 2023 03:29:29 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="oHJ/b4az";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pSFxQ-0001l4-1U; Wed, 15 Feb 2023 06:28:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pSFxM-0001VN-BL
 for qemu-arm@nongnu.org; Wed, 15 Feb 2023 06:28:12 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pSFxJ-0003br-QG
 for qemu-arm@nongnu.org; Wed, 15 Feb 2023 06:28:12 -0500
Received: by mail-wm1-x334.google.com with SMTP id
 j29-20020a05600c1c1d00b003dc52fed235so1294473wms.1
 for <qemu-arm@nongnu.org>; Wed, 15 Feb 2023 03:28:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TiVfdka5B9ldkUYdKu7ft+9sFiPb97YGArIko4Y3Hq4=;
 b=oHJ/b4azw0VpZ4BRn+jksah+b+jXfM3ELPBE3Qw6piA86YwYZZG1BpmG4jYv6wg7mb
 0zyaj79WCjamLAIU8h/lkhcZbWSWAvCXmJqf1gKPg5EfjKSyhhxkVBSse8CY29jarebT
 D4QgHTAQ58QyedOrN/ncd5uWj4XMmv3jsbxtxqUdDfM6BAGRYismbgP2PlyeZGrFm40V
 PizfnneOoZQDLybM80RsRAilsQnCFRHYRlJ7XGRm1oVe5J3XuePZ4Rqj1sHcVsUM5WZn
 ykKGisrEKMJd8R+t0MT+senZoetsMCFeTVxolg5EWy8+TZassSDZCGSBRF26PMzM6Su/
 JFcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TiVfdka5B9ldkUYdKu7ft+9sFiPb97YGArIko4Y3Hq4=;
 b=IO5+X/joS4f25VyZfs2hOunYBd8eSc2/eK5GqfL7mSS/EOG0km9sWg5np+3Yrxtz2l
 sP255ajdbt5AlNn6hkuJ5Rw1XIt9Dzcpsr0r7rsZNKAXGU+heJFFQno8/f7kcCBADchd
 Xssrtez6bX5IForHUfPRNJAP18Llk+pofBb1XrFx5jZdFTTAfJdX5v5p4EZxU6dF+i2Y
 oV9dPnq4/F3APME8SMyoRr06vX6L/mqjZ8HTA0hZ1NhTnpHh1vZeNPPOansUPecTnMfT
 iz2LCzzQVBPawe4sQFwzuWMf/R4muHtEOelyuPv8K7udeLiv/rxwVbJdPZ75x49LoF7I
 Ct3g==
X-Gm-Message-State: AO0yUKU+wRuU6tZVJb71t1mlbP0qRts09+7EB7PGwQbtwbCwesxhPzu0
 kdBNH6lpPOBMDTbUYt4tMpDdvw==
X-Received: by 2002:a05:600c:4b1c:b0:3e2:6ec:61ea with SMTP id
 i28-20020a05600c4b1c00b003e206ec61eamr395wmp.28.1676460488013; 
 Wed, 15 Feb 2023 03:28:08 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 p17-20020a05600c205100b003dc51c48f0bsm1800181wmg.19.2023.02.15.03.28.07
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 15 Feb 2023 03:28:07 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Eduardo Habkost <eduardo@habkost.net>,
 John Snow <jsnow@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Radoslaw Biernacki <rad@semihalf.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Leif Lindholm <quic_llindhol@quicinc.com>, qemu-arm@nongnu.org
Subject: [PATCH 11/20] hw/ide: Rename ide_create_drive() ->
 ide_bus_create_drive()
Date: Wed, 15 Feb 2023 12:27:03 +0100
Message-Id: <20230215112712.23110-12-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230215112712.23110-1-philmd@linaro.org>
References: <20230215112712.23110-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: RK/3Zu4KHftB

ide_create_drive() operates on a IDEBus; rename it as
ide_bus_create_drive() to emphasize its first argument
is a IDEBus.

Mechanical change using:

  $ sed -i -e 's/ide_create_drive/ide_bus_create_drive/g' \
        $(git grep -wl ide_create_drive)

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/arm/sbsa-ref.c         | 2 +-
 hw/ide/ahci.c             | 2 +-
 hw/ide/isa.c              | 4 ++--
 hw/ide/macio.c            | 2 +-
 hw/ide/microdrive.c       | 2 +-
 hw/ide/mmio.c             | 4 ++--
 hw/ide/pci.c              | 2 +-
 hw/ide/qdev.c             | 2 +-
 include/hw/ide/internal.h | 2 +-
 9 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/hw/arm/sbsa-ref.c b/hw/arm/sbsa-ref.c
index f778cb6d09..0b93558dde 100644
--- a/hw/arm/sbsa-ref.c
+++ b/hw/arm/sbsa-ref.c
@@ -554,7 +554,7 @@ static void create_ahci(const SBSAMachineState *sms)
         if (hd[i] == NULL) {
             continue;
         }
-        ide_create_drive(&ahci->dev[i].port, 0, hd[i]);
+        ide_bus_create_drive(&ahci->dev[i].port, 0, hd[i]);
     }
 }
 
diff --git a/hw/ide/ahci.c b/hw/ide/ahci.c
index 3e21f607fe..90fea5d059 100644
--- a/hw/ide/ahci.c
+++ b/hw/ide/ahci.c
@@ -1842,7 +1842,7 @@ void ahci_ide_create_devs(PCIDevice *dev, DriveInfo **hd)
         if (hd[i] == NULL) {
             continue;
         }
-        ide_create_drive(&ahci->dev[i].port, 0, hd[i]);
+        ide_bus_create_drive(&ahci->dev[i].port, 0, hd[i]);
     }
 
 }
diff --git a/hw/ide/isa.c b/hw/ide/isa.c
index ad47e0899e..74f7b43137 100644
--- a/hw/ide/isa.c
+++ b/hw/ide/isa.c
@@ -93,10 +93,10 @@ ISADevice *isa_ide_init(ISABus *bus, int iobase, int iobase2, int irqnum,
 
     s = ISA_IDE(dev);
     if (hd0) {
-        ide_create_drive(&s->bus, 0, hd0);
+        ide_bus_create_drive(&s->bus, 0, hd0);
     }
     if (hd1) {
-        ide_create_drive(&s->bus, 1, hd1);
+        ide_bus_create_drive(&s->bus, 1, hd1);
     }
     return isadev;
 }
diff --git a/hw/ide/macio.c b/hw/ide/macio.c
index 24fb7a3f9d..7efbbc720a 100644
--- a/hw/ide/macio.c
+++ b/hw/ide/macio.c
@@ -501,7 +501,7 @@ void macio_ide_init_drives(MACIOIDEState *s, DriveInfo **hd_table)
 
     for (i = 0; i < 2; i++) {
         if (hd_table[i]) {
-            ide_create_drive(&s->bus, i, hd_table[i]);
+            ide_bus_create_drive(&s->bus, i, hd_table[i]);
         }
     }
 }
diff --git a/hw/ide/microdrive.c b/hw/ide/microdrive.c
index b9822b939b..08504b499f 100644
--- a/hw/ide/microdrive.c
+++ b/hw/ide/microdrive.c
@@ -566,7 +566,7 @@ PCMCIACardState *dscm1xxxx_init(DriveInfo *dinfo)
     qdev_realize(DEVICE(md), NULL, &error_fatal);
 
     if (dinfo != NULL) {
-        ide_create_drive(&md->bus, 0, dinfo);
+        ide_bus_create_drive(&md->bus, 0, dinfo);
     }
     md->bus.ifs[0].drive_kind = IDE_CFATA;
     md->bus.ifs[0].mdata_size = METADATA_SIZE;
diff --git a/hw/ide/mmio.c b/hw/ide/mmio.c
index 5153d19ac6..1f1527122e 100644
--- a/hw/ide/mmio.c
+++ b/hw/ide/mmio.c
@@ -174,10 +174,10 @@ void mmio_ide_init_drives(DeviceState *dev, DriveInfo *hd0, DriveInfo *hd1)
     MMIOIDEState *s = MMIO_IDE(dev);
 
     if (hd0 != NULL) {
-        ide_create_drive(&s->bus, 0, hd0);
+        ide_bus_create_drive(&s->bus, 0, hd0);
     }
     if (hd1 != NULL) {
-        ide_create_drive(&s->bus, 1, hd1);
+        ide_bus_create_drive(&s->bus, 1, hd1);
     }
 }
 
diff --git a/hw/ide/pci.c b/hw/ide/pci.c
index ae638dee0d..4223f5e64d 100644
--- a/hw/ide/pci.c
+++ b/hw/ide/pci.c
@@ -489,7 +489,7 @@ void pci_ide_create_devs(PCIDevice *dev)
     ide_drive_get(hd_table, ARRAY_SIZE(hd_table));
     for (i = 0; i < 4; i++) {
         if (hd_table[i]) {
-            ide_create_drive(d->bus + bus[i], unit[i], hd_table[i]);
+            ide_bus_create_drive(d->bus + bus[i], unit[i], hd_table[i]);
         }
     }
 }
diff --git a/hw/ide/qdev.c b/hw/ide/qdev.c
index 6f6c7462f3..1b3b4da01d 100644
--- a/hw/ide/qdev.c
+++ b/hw/ide/qdev.c
@@ -124,7 +124,7 @@ static void ide_qdev_realize(DeviceState *qdev, Error **errp)
     dc->realize(dev, errp);
 }
 
-IDEDevice *ide_create_drive(IDEBus *bus, int unit, DriveInfo *drive)
+IDEDevice *ide_bus_create_drive(IDEBus *bus, int unit, DriveInfo *drive)
 {
     DeviceState *dev;
 
diff --git a/include/hw/ide/internal.h b/include/hw/ide/internal.h
index 7b4b71d0b0..ccfe064643 100644
--- a/include/hw/ide/internal.h
+++ b/include/hw/ide/internal.h
@@ -645,7 +645,7 @@ void ide_atapi_cmd_reply_end(IDEState *s);
 /* hw/ide/qdev.c */
 void ide_bus_init(IDEBus *idebus, size_t idebus_size, DeviceState *dev,
                   int bus_id, int max_units);
-IDEDevice *ide_create_drive(IDEBus *bus, int unit, DriveInfo *drive);
+IDEDevice *ide_bus_create_drive(IDEBus *bus, int unit, DriveInfo *drive);
 
 int ide_handle_rw_error(IDEState *s, int error, int op);
 
-- 
2.38.1

