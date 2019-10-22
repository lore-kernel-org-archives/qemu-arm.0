Received: by 2002:a5d:4890:0:0:0:0:0 with SMTP id g16csp152276wrq;
        Tue, 22 Oct 2019 09:43:33 -0700 (PDT)
X-Google-Smtp-Source: APXvYqygXowRYYr//pgltx6eJNH0P6DOtzY2Bp0WQ4V4zYy9fz3/jN+TDZrdFwgohZRgIw8Jy+Fu
X-Received: by 2002:aa7:cf81:: with SMTP id z1mr31669210edx.207.1571762613732;
        Tue, 22 Oct 2019 09:43:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571762613; cv=none;
        d=google.com; s=arc-20160816;
        b=aN8g5jNJnchsZtfBXK0bVNdUdK3aFvtq/DDWT3P8sdgqksP+D+dkjOA85VTXijMMr4
         cix8acPFTHzmA9Qe8S75HaI6xwt7gKtEPtku+TTSP5t/2hlFuWiw1pTH3qZXqYnzOJgP
         N5MFw6uuJcbBITy1smeWqquG5CMioROt6Kt9aDA6MwjL2GA6HrNV7/SX42ZwaWYgWXKR
         PQlIvPP+iZu7dTAohRIV6Rd1upWnYTJX1TieiTIo8b30PscuLdOYxB1uzFvFuOuk+y2C
         k9mKGJ6S5sj4NBCMedm56oQaqZm4ZlQBKVBr2jSB2KfhwKTFEvXCyuDgIriiLwvSafAD
         U8aA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=QmFFdvh8lLCYoMRknFLWTBCMhIo3Fn3Z3qJbSbzkpNo=;
        b=L8avaVAAQSIS6yr/c81TRhRLtZtmPR+1E4U+R6zu55PrNaAST2Q5gKqXdMC6VmHZis
         tYmqrd0NmFE8F1fyMpT+2+5/IHdZY0E6hIqQ1jxAYhzIS3ZTbexyQ9JSka1cI+0tXUgI
         dhbycAFfDaFbbO3obpZwzyUwrjJkgyvXxSQGEdoaz+jtdiHohtrmf9XG/VCfQublEnUV
         /A1pbuIH9BZBrYYsITNo4Q8H9w7Px868Gf02yE1uIaUzLgbrZTufG+xG+Wt7sjlDRHOi
         snCffBftKoHK/KZ1t3hs/iEispuI9cjPs0nIoqF74AsQQjLmZmgM2XB8Fadd/4F9YrIZ
         R7hQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Znusb5sv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id sd23si3570247ejb.254.2019.10.22.09.43.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 22 Oct 2019 09:43:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Znusb5sv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:35982 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iMxFs-0006O9-AO
	for alex.bennee@linaro.org; Tue, 22 Oct 2019 12:43:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38533)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <marcandre.lureau@redhat.com>) id 1iMwww-0007wB-84
 for qemu-arm@nongnu.org; Tue, 22 Oct 2019 12:23:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <marcandre.lureau@redhat.com>) id 1iMwwu-0007iJ-OS
 for qemu-arm@nongnu.org; Tue, 22 Oct 2019 12:23:58 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:48572
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <marcandre.lureau@redhat.com>)
 id 1iMwwu-0007iC-KK
 for qemu-arm@nongnu.org; Tue, 22 Oct 2019 12:23:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1571761436;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QmFFdvh8lLCYoMRknFLWTBCMhIo3Fn3Z3qJbSbzkpNo=;
 b=Znusb5svX1D2c8r7fJ4IJMYr2FzsNZRVW4EojitCbSmQig1sMeSsFKgZKG0HJGYOulB/3j
 WTIbmWyLI3wW8Gwp8ftPtuuERz/NgTxbb4JeC8Jx/hCNpANGY6aevICFSlQP3OS1UO4++E
 TV3im3yz2rcbFv3YUTYIapGPJ2IDSWE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-8-M-B9MEiVPee8BPZPS6LQ7Q-1; Tue, 22 Oct 2019 12:23:54 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 123D81800D79;
 Tue, 22 Oct 2019 16:23:52 +0000 (UTC)
Received: from localhost (ovpn-112-21.ams2.redhat.com [10.36.112.21])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9760E5DC18;
 Tue, 22 Oct 2019 16:23:47 +0000 (UTC)
From: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 17/28] etraxfs: remove PROP_PTR usage
Date: Tue, 22 Oct 2019 18:21:26 +0200
Message-Id: <20191022162137.27161-18-marcandre.lureau@redhat.com>
In-Reply-To: <20191022162137.27161-1-marcandre.lureau@redhat.com>
References: <20191022162137.27161-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: M-B9MEiVPee8BPZPS6LQ7Q-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.120
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
Cc: Corey Minyard <cminyard@mvista.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 BALATON Zoltan <balaton@eik.bme.hu>,
 KONRAD Frederic <frederic.konrad@adacore.com>,
 Aleksandar Rikalo <arikalo@wavecomp.com>, Magnus Damm <magnus.damm@gmail.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Fabien Chouteau <chouteau@adacore.com>, qemu-arm@nongnu.org,
 Richard Henderson <rth@twiddle.net>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-ppc@nongnu.org, Aleksandar Markovic <amarkovic@wavecomp.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: WCHOE0/JXFl+

etraxfs_dma_client are not Object, so can't be exposed to user with
QOM path. Let's remove property usage and move the constructor to the
.c unit, simplifying some code on the way.

Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
---
 hw/net/etraxfs_eth.c      | 44 +++++++++++++++++++++++++++++----------
 include/hw/cris/etraxfs.h | 20 +++---------------
 2 files changed, 36 insertions(+), 28 deletions(-)

diff --git a/hw/net/etraxfs_eth.c b/hw/net/etraxfs_eth.c
index 4cfbf1135a..f30d963487 100644
--- a/hw/net/etraxfs_eth.c
+++ b/hw/net/etraxfs_eth.c
@@ -338,14 +338,8 @@ typedef struct ETRAXFSEthState
     uint8_t macaddr[2][6];
     uint32_t regs[FS_ETH_MAX_REGS];
=20
-    union {
-        void *vdma_out;
-        struct etraxfs_dma_client *dma_out;
-    };
-    union {
-        void *vdma_in;
-        struct etraxfs_dma_client *dma_in;
-    };
+    struct etraxfs_dma_client *dma_out;
+    struct etraxfs_dma_client *dma_in;
=20
     /* MDIO bus.  */
     struct qemu_mdio mdio_bus;
@@ -635,8 +629,6 @@ static void etraxfs_eth_realize(DeviceState *dev, Error=
 **errp)
=20
 static Property etraxfs_eth_properties[] =3D {
     DEFINE_PROP_UINT32("phyaddr", ETRAXFSEthState, phyaddr, 1),
-    DEFINE_PROP_PTR("dma_out", ETRAXFSEthState, vdma_out),
-    DEFINE_PROP_PTR("dma_in", ETRAXFSEthState, vdma_in),
     DEFINE_NIC_PROPERTIES(ETRAXFSEthState, conf),
     DEFINE_PROP_END_OF_LIST(),
 };
@@ -648,10 +640,40 @@ static void etraxfs_eth_class_init(ObjectClass *klass=
, void *data)
     dc->realize =3D etraxfs_eth_realize;
     dc->reset =3D etraxfs_eth_reset;
     dc->props =3D etraxfs_eth_properties;
-    /* Reason: pointer properties "dma_out", "dma_in" */
+    /* Reason: dma_out, dma_in are not user settable */
     dc->user_creatable =3D false;
 }
=20
+
+/* Instantiate an ETRAXFS Ethernet MAC.  */
+DeviceState *
+etraxfs_eth_init(NICInfo *nd, hwaddr base, int phyaddr,
+                 struct etraxfs_dma_client *dma_out,
+                 struct etraxfs_dma_client *dma_in)
+{
+    DeviceState *dev;
+    qemu_check_nic_model(nd, "fseth");
+
+    dev =3D qdev_create(NULL, "etraxfs-eth");
+    qdev_set_nic_properties(dev, nd);
+    qdev_prop_set_uint32(dev, "phyaddr", phyaddr);
+
+    /*
+     * TODO: QOM design, define a QOM interface for "I am an etraxfs
+     * DMA client" (which replaces the current 'struct
+     * etraxfs_dma_client' ad-hoc interface), implement it on the
+     * ethernet device, and then have QOM link properties on the DMA
+     * controller device so that you can pass the interface
+     * implementations to it.
+     */
+    ETRAX_FS_ETH(dev)->dma_out =3D dma_out;
+    ETRAX_FS_ETH(dev)->dma_in =3D dma_in;
+    qdev_init_nofail(dev);
+    sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, base);
+
+    return dev;
+}
+
 static const TypeInfo etraxfs_eth_info =3D {
     .name          =3D TYPE_ETRAX_FS_ETH,
     .parent        =3D TYPE_SYS_BUS_DEVICE,
diff --git a/include/hw/cris/etraxfs.h b/include/hw/cris/etraxfs.h
index aa146a2cd8..403e7f95e6 100644
--- a/include/hw/cris/etraxfs.h
+++ b/include/hw/cris/etraxfs.h
@@ -30,23 +30,9 @@
 #include "hw/qdev-properties.h"
 #include "hw/sysbus.h"
=20
-/* Instantiate an ETRAXFS Ethernet MAC.  */
-static inline DeviceState *
-etraxfs_eth_init(NICInfo *nd, hwaddr base, int phyaddr,
-                 void *dma_out, void *dma_in)
-{
-    DeviceState *dev;
-    qemu_check_nic_model(nd, "fseth");
-
-    dev =3D qdev_create(NULL, "etraxfs-eth");
-    qdev_set_nic_properties(dev, nd);
-    qdev_prop_set_uint32(dev, "phyaddr", phyaddr);
-    qdev_prop_set_ptr(dev, "dma_out", dma_out);
-    qdev_prop_set_ptr(dev, "dma_in", dma_in);
-    qdev_init_nofail(dev);
-    sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, base);
-    return dev;
-}
+DeviceState *etraxfs_eth_init(NICInfo *nd, hwaddr base, int phyaddr,
+                              struct etraxfs_dma_client *dma_out,
+                              struct etraxfs_dma_client *dma_in);
=20
 static inline DeviceState *etraxfs_ser_create(hwaddr addr,
                                               qemu_irq irq,
--=20
2.23.0.606.g08da6496b6

