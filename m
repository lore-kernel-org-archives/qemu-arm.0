Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp360795lfp;
        Fri, 7 Feb 2020 01:34:18 -0800 (PST)
X-Google-Smtp-Source: APXvYqzZ4oIbbpIqeu4dszqlsEz/CzORDjUtK+y8efHE7YPNpu0TfB/hGHXcL03WtOYp8Khrd4tq
X-Received: by 2002:aed:2284:: with SMTP id p4mr6438811qtc.329.1581068058561;
        Fri, 07 Feb 2020 01:34:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581068058; cv=none;
        d=google.com; s=arc-20160816;
        b=gArD4TWMoqmtFh1ro3EtaU0T1r5cf2LcjUa4i6QbQENShQNpaZd5ng/84Xnox2oc5S
         qP2s9qmBpWGkoYWVEfN3fwxahaxbDApGZNdE3JiDHPgg0tusrkW/oTs1UIJv514K8q9Q
         zTaKmsD4xIqQCQho5aYEut7E0q6+pH0zp7mj03q+4HAHFztYc5c8kCRUpxBw2+vuZ+Px
         PXm9WLb2RiuvYk1srDGMwbTHOyI9qMHKeNLyMVGJrYGjXf9EWmZnUxucY5m4h2Vgnj7H
         +MHAKu2xg3BlpnpTvySZ8aAlfa+JosSb3By8pozaS4LQemgeOZbFFCKHyhWBj/K03Qqe
         CVOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=K+FSfpCqYhX3vQLABhToXbkcS42+ejiK6nNxnywqqoM=;
        b=ljcLUshcMc5X9HRSlzWTGzT3H3t1NmTkOPRXabPZVFynVV8uCi3gQ7KDYUTWfKS6Lg
         LalTjAj/fKz4NBSvmkVSwoBJhaz9mVecySupxVZUpVjTH4UochjHjHF2McGmPuXNJlbM
         Mj3TePEk0NLPh2Qw1KG9d6A9x4WGvPhlL3jWSeLy3OsvMHGfawvV/qFbqA0daj+gOUye
         /b3gdE1XhmtF6lH0gLfCe0VQjb3sqlh10xhkEHzDrYIeYfdMOP843LOq/DfGel/df3IB
         ZaAUw8TpsQ0Q0zvcMdrsamz/SWLLeGrN4+FleZ0ZHNg/1PuH1oYTS7CJiWywkNqvNUoa
         OQbg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=dpLM8q2s;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i129si1091225qkc.67.2020.02.07.01.34.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 07 Feb 2020 01:34:18 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=dpLM8q2s;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:52804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j001h-0000lz-SU
	for alex.bennee@linaro.org; Fri, 07 Feb 2020 04:34:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36759)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eric.auger@redhat.com>) id 1j001A-0008Oe-Pw
 for qemu-arm@nongnu.org; Fri, 07 Feb 2020 04:33:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eric.auger@redhat.com>) id 1j0019-00050E-JP
 for qemu-arm@nongnu.org; Fri, 07 Feb 2020 04:33:44 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:38155
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eric.auger@redhat.com>)
 id 1j0019-000507-Fj
 for qemu-arm@nongnu.org; Fri, 07 Feb 2020 04:33:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581068023;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=K+FSfpCqYhX3vQLABhToXbkcS42+ejiK6nNxnywqqoM=;
 b=dpLM8q2s5Qt5Am9XwOVvKh9UlIQgtyiQdxPxjuUgavrGNri+FfhQOqrm1WzTkkuD/3OvfX
 h7DHY7CBdv/r4ioKM6yeJMG7bLYfYwJsEK6M2PYh4605JIByV1xTBoOhdpoh+z0+XP/sSh
 WXUdlm48NQ2xR1ykZKUbN6+zgErIxjE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-67-py5o6Y_FOI2BiIrsDdqplg-1; Fri, 07 Feb 2020 04:33:41 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 255258010F0;
 Fri,  7 Feb 2020 09:33:40 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-37.ams2.redhat.com [10.36.116.37])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4E28C790EB;
 Fri,  7 Feb 2020 09:33:27 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, peter.maydell@linaro.org, jean-philippe@linaro.org,
 dgilbert@redhat.com, quintela@redhat.com, mst@redhat.com, peterx@redhat.com
Subject: [PATCH v14 08/11] virtio-iommu-pci: Introduce the x-dt-binding option
Date: Fri,  7 Feb 2020 10:32:00 +0100
Message-Id: <20200207093203.3788-9-eric.auger@redhat.com>
In-Reply-To: <20200207093203.3788-1-eric.auger@redhat.com>
References: <20200207093203.3788-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: py5o6Y_FOI2BiIrsDdqplg-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
Cc: kevin.tian@intel.com, bharatb.linux@gmail.com, tnowicki@marvell.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: u0yMINfis4yR

At the moment, the kernel only supports device tree
integration of the virtio-iommu. DT bindings between the
PCI root complex and the IOMMU must be created by the machine
in conformance to:

Documentation/devicetree/bindings/virtio/iommu.txt.

To make sure the end-user is aware of this, force him to use the
temporary device option "x-dt-binding" and also double check the
machine has a hotplug handler for the virtio-iommu-pci device.
This hotplug handler is in charge of creating those DT bindings.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Suggested-by: Michael S. Tsirkin <mst@redhat.com>

---

May be squashed with previous patch
---
 hw/virtio/virtio-iommu-pci.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/hw/virtio/virtio-iommu-pci.c b/hw/virtio/virtio-iommu-pci.c
index d539fcce75..3d06e14000 100644
--- a/hw/virtio/virtio-iommu-pci.c
+++ b/hw/virtio/virtio-iommu-pci.c
@@ -14,6 +14,7 @@
 #include "virtio-pci.h"
 #include "hw/virtio/virtio-iommu.h"
 #include "hw/qdev-properties.h"
+#include "qapi/error.h"
=20
 typedef struct VirtIOIOMMUPCI VirtIOIOMMUPCI;
=20
@@ -27,10 +28,12 @@ typedef struct VirtIOIOMMUPCI VirtIOIOMMUPCI;
 struct VirtIOIOMMUPCI {
     VirtIOPCIProxy parent_obj;
     VirtIOIOMMU vdev;
+    bool dt_binding;
 };
=20
 static Property virtio_iommu_pci_properties[] =3D {
     DEFINE_PROP_UINT32("class", VirtIOPCIProxy, class_code, 0),
+    DEFINE_PROP_BOOL("x-dt-binding", VirtIOIOMMUPCI, dt_binding, false),
     DEFINE_PROP_END_OF_LIST(),
 };
=20
@@ -39,6 +42,21 @@ static void virtio_iommu_pci_realize(VirtIOPCIProxy *vpc=
i_dev, Error **errp)
     VirtIOIOMMUPCI *dev =3D VIRTIO_IOMMU_PCI(vpci_dev);
     DeviceState *vdev =3D DEVICE(&dev->vdev);
=20
+    if (!dev->dt_binding) {
+        error_setg(errp,
+                   "Instantiation currently only is possible if the machin=
e "
+                   "creates device tree iommu-map bindings, ie. ACPI is no=
t "
+                   "yet supported");
+        error_append_hint(errp, "use -virtio-iommu-pci,x-dt-binding\n");
+        return;
+    }
+
+    if (!qdev_get_machine_hotplug_handler(DEVICE(vpci_dev))) {
+        error_setg(errp,
+                   "The machine does not implement a virtio-iommu-pci hotp=
lug "
+                   " handler that creates the device tree iommu-map bindin=
gs");
+       return;
+    }
     qdev_set_parent_bus(vdev, BUS(&vpci_dev->bus));
     object_property_set_link(OBJECT(dev),
                              OBJECT(pci_get_bus(&vpci_dev->pci_dev)),
--=20
2.20.1

