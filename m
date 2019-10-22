Received: by 2002:a5d:4890:0:0:0:0:0 with SMTP id g16csp144558wrq;
        Tue, 22 Oct 2019 09:36:37 -0700 (PDT)
X-Google-Smtp-Source: APXvYqz8e+3LjDTMfU0ZWrcAxqwVRFrbbBhYn20SWNDMRs0GeVYvVudSg9deVl6D8EgmA9Kj0fWA
X-Received: by 2002:a50:8264:: with SMTP id 91mr18415875edf.69.1571762196820;
        Tue, 22 Oct 2019 09:36:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571762196; cv=none;
        d=google.com; s=arc-20160816;
        b=l4ad+Mh9ysudFUneXXLEOb81duGy0xrl93LDlPaF2o7TMhdruIUpLPoa9crClZ5bPf
         Di10QtxykOJJXsd4+tv92yqFF+iHW3CcekIHwTb4DchQEQjiIXfKGoo502C1WIA7oplP
         KeMYGXX3HyWW7IRMXj0G73qo8W9i1MgEebhm45In53wmqFF398QxJIPHETfE2lyoMDQy
         2IyDGyeEZ6wr1h97w0BHFw2PvytujfXDcq2EKctsU4jq4m1TGRpC6AMjjYyGxlHeZjCs
         2zhgoy0HDUMAM6jcyp6k+WiMEv2MsC4nVjqA57PkAYP8LBtyDqTMoTKPQCcuvsSHX6Fh
         wa/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=uRcevYlv0dVgCjvswi8iWE9SF8YIZpxrJoGckyI6E5E=;
        b=iPCw0ECMFiwDUN16VW803n/SQslx3TAnv2bx52Hpf+quynEUscI9fCKkiea2zLEsZD
         Rsjpv0E943AadYSsCgWMc8WXNLUZvGd1z6vnFM8aJhJ6nrt4KnetlymnX+705EvNb0Bo
         h7kVs/2TL6HLVC2wtHUlkTONb2ms12u4oihTFZ2U9n4i7OstFVNUZT/duCRdaOuTnJlW
         dvUQSKMy+K6mfnS/Bolh42Nx78cWFTCdaYQiUOaMhuclUFF6eCm5FdtSYC1t7NDI/ek/
         cvEl5iSEK18Sot1o/7SWoqyj2pg/y9iruxNgommUW/1t5izuBSjMcbiJVq583BKSJfCJ
         EHYw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=JVs5j1Y0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t3si3700508ejr.121.2019.10.22.09.36.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 22 Oct 2019 09:36:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=JVs5j1Y0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:35870 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iMx99-0005lJ-1Q
	for alex.bennee@linaro.org; Tue, 22 Oct 2019 12:36:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38557)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <marcandre.lureau@redhat.com>) id 1iMwww-0007xd-W7
 for qemu-arm@nongnu.org; Tue, 22 Oct 2019 12:24:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <marcandre.lureau@redhat.com>) id 1iMwwv-0007kK-Nf
 for qemu-arm@nongnu.org; Tue, 22 Oct 2019 12:23:58 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:35390
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <marcandre.lureau@redhat.com>)
 id 1iMwwv-0007jZ-Jq
 for qemu-arm@nongnu.org; Tue, 22 Oct 2019 12:23:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1571761437;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uRcevYlv0dVgCjvswi8iWE9SF8YIZpxrJoGckyI6E5E=;
 b=JVs5j1Y0PbyJsXXmUgwacXeQY/B+aNE5TLCouLL9p+Eef81KKIkEj+n1Gd95M6ZBWUW/Eg
 FgMMjPtMxGPiNiNhC7eZYCvnhi3TnplcJE55Nm6mN1kNQjKqtrPa4rqo3xiBf2y5dMSwvK
 ZG+VATyLR2B0BFXvrQ40o1VAQOOLqis=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-332-HGb6Ti3CMWGWMfisNjE43w-1; Tue, 22 Oct 2019 12:23:53 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3FFA71800D6A;
 Tue, 22 Oct 2019 16:23:46 +0000 (UTC)
Received: from localhost (ovpn-112-21.ams2.redhat.com [10.36.112.21])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 67B155D6A9;
 Tue, 22 Oct 2019 16:23:39 +0000 (UTC)
From: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 16/28] lance: replace PROP_PTR with PROP_LINK
Date: Tue, 22 Oct 2019 18:21:25 +0200
Message-Id: <20191022162137.27161-17-marcandre.lureau@redhat.com>
In-Reply-To: <20191022162137.27161-1-marcandre.lureau@redhat.com>
References: <20191022162137.27161-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: HGb6Ti3CMWGWMfisNjE43w-1
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
X-TUID: 6MuYCb9ucgGV

Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/dma/sparc32_dma.c | 2 +-
 hw/net/lance.c       | 5 ++---
 hw/net/pcnet-pci.c   | 2 +-
 hw/net/pcnet.h       | 2 +-
 4 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/hw/dma/sparc32_dma.c b/hw/dma/sparc32_dma.c
index 0e5bbcdc7f..3e4da0c47f 100644
--- a/hw/dma/sparc32_dma.c
+++ b/hw/dma/sparc32_dma.c
@@ -346,7 +346,7 @@ static void sparc32_ledma_device_realize(DeviceState *d=
ev, Error **errp)
     d =3D qdev_create(NULL, TYPE_LANCE);
     object_property_add_child(OBJECT(dev), "lance", OBJECT(d), errp);
     qdev_set_nic_properties(d, nd);
-    qdev_prop_set_ptr(d, "dma", dev);
+    object_property_set_link(OBJECT(d), OBJECT(dev), "dma", errp);
     qdev_init_nofail(d);
 }
=20
diff --git a/hw/net/lance.c b/hw/net/lance.c
index 6631e2a4e0..4d96299041 100644
--- a/hw/net/lance.c
+++ b/hw/net/lance.c
@@ -138,7 +138,8 @@ static void lance_instance_init(Object *obj)
 }
=20
 static Property lance_properties[] =3D {
-    DEFINE_PROP_PTR("dma", SysBusPCNetState, state.dma_opaque),
+    DEFINE_PROP_LINK("dma", SysBusPCNetState, state.dma_opaque,
+                     TYPE_DEVICE, DeviceState *),
     DEFINE_NIC_PROPERTIES(SysBusPCNetState, state.conf),
     DEFINE_PROP_END_OF_LIST(),
 };
@@ -153,8 +154,6 @@ static void lance_class_init(ObjectClass *klass, void *=
data)
     dc->reset =3D lance_reset;
     dc->vmsd =3D &vmstate_lance;
     dc->props =3D lance_properties;
-    /* Reason: pointer property "dma" */
-    dc->user_creatable =3D false;
 }
=20
 static const TypeInfo lance_info =3D {
diff --git a/hw/net/pcnet-pci.c b/hw/net/pcnet-pci.c
index 4723c30c79..d067d21e2c 100644
--- a/hw/net/pcnet-pci.c
+++ b/hw/net/pcnet-pci.c
@@ -231,7 +231,7 @@ static void pci_pcnet_realize(PCIDevice *pci_dev, Error=
 **errp)
     s->irq =3D pci_allocate_irq(pci_dev);
     s->phys_mem_read =3D pci_physical_memory_read;
     s->phys_mem_write =3D pci_physical_memory_write;
-    s->dma_opaque =3D pci_dev;
+    s->dma_opaque =3D DEVICE(pci_dev);
=20
     pcnet_common_init(DEVICE(pci_dev), s, &net_pci_pcnet_info);
 }
diff --git a/hw/net/pcnet.h b/hw/net/pcnet.h
index 28d19a5c6f..f49b213c57 100644
--- a/hw/net/pcnet.h
+++ b/hw/net/pcnet.h
@@ -50,7 +50,7 @@ struct PCNetState_st {
                          uint8_t *buf, int len, int do_bswap);
     void (*phys_mem_write)(void *dma_opaque, hwaddr addr,
                           uint8_t *buf, int len, int do_bswap);
-    void *dma_opaque;
+    DeviceState *dma_opaque;
     int tx_busy;
     int looptest;
 };
--=20
2.23.0.606.g08da6496b6

