Received: by 2002:a17:906:43c7:b0:78d:9f02:16a1 with SMTP id j7csp3374692ejn;
        Wed, 12 Oct 2022 09:51:31 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5wB/oYaYB4oWvbk4FrVSbo0XzbGi0s4ue2J50oqzzW9AQZHXJFBgYjwHxsj116ZT97Om5N
X-Received: by 2002:a05:620a:28cc:b0:6ee:78fe:c519 with SMTP id l12-20020a05620a28cc00b006ee78fec519mr7145960qkp.345.1665593491071;
        Wed, 12 Oct 2022 09:51:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1665593491; cv=none;
        d=google.com; s=arc-20160816;
        b=UH16NdmP+k/D8FW5T5MwrUuQrip/SnvGSxFIkpwJDI9WWfRO8e24oo/Bo0UN5Dn6TQ
         +fxuxZaut7ELcjyemP8ublebYDW+jybi9BFfNS7KmmRWTwvX4pyDhIvVNjR33GievRUf
         NFn0z7OqPbT6qZ26zTv6RYMu/7zEUQmT+oO8KK4Y9tl/jnpBSqPL/FbL/bR7ZZ/vavlK
         Jg0yTCcYUR0EAoyjhojAVkQ5iOd/c6ouC5gQ5LixrVraPytVKkwaf/fZY4jqyUi5ciST
         lrVTiH5FT6dQW7Q7pP9P9liiP3xPHf4WzXTQHHvJ3VbMhIorNxGhamIsfj9f7/o/DzTt
         buwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=1CrT6XlBsVhRYGW+bi7HygppH/qW1D1IAayxzH2Ba+I=;
        b=mnpoW80WZ131dvuFADzUBQKpVukXoHWUWmrjn1uPVYt6fsX5LBb1WA074WuImrNE8j
         +y/rMJhVaY8lzXjqN/uRVTeT5/oqAsr+XW4REI+Hf9OqH/lAw3UGeAKNBTW6o4FfCcOT
         d8AhjAVHs/v0ExpnXXK6kWPeQLw7A201BCMuvtphkj1q7OJdybxL/XFZKIP77D2P1BzS
         vu6XE3K6kuJam5LNHt1eUMFvXfK2wLgg8HbsqypMijqBEAC2dqApdXxGhVmjd/+uNVmN
         n472cTYnqQsH50h8DAPtUglrZ3jeMKGTmfb7Vj7D+WbFpOgWryQ3q/3BcoGNj6UoHlrI
         Y9BA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=XtPcemid;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g5-20020a05620a40c500b006ee245aa4edsi4089268qko.538.2022.10.12.09.51.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 12 Oct 2022 09:51:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=XtPcemid;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:34164 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oiex8-0000wM-JQ
	for alex.bennee@linaro.org; Wed, 12 Oct 2022 12:51:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46110)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1oiehB-0004Iu-C4
 for qemu-devel@nongnu.org; Wed, 12 Oct 2022 12:35:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47367)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1oieh8-0001j6-47
 for qemu-devel@nongnu.org; Wed, 12 Oct 2022 12:34:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665592497;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=1CrT6XlBsVhRYGW+bi7HygppH/qW1D1IAayxzH2Ba+I=;
 b=XtPcemidrC6zAnvLh6+pqwEmOno+vXi0D/e3Uooe4zxUcqEel0MfHisnR7y1zB5kCdygHd
 bOuZBq/3n22dJtF3rMg6X/6dWkCaBukSRHkoUYQAPc6qNlDYY3cOBjqhATuPBlzEC2wH85
 biv4iIIr3HY2tOI9e+SwI2Oq6mFdc4Y=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-528-ltT9UBwUM2ufTx0XBnuzQw-1; Wed, 12 Oct 2022 12:34:53 -0400
X-MC-Unique: ltT9UBwUM2ufTx0XBnuzQw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 17A4A833AEE;
 Wed, 12 Oct 2022 16:34:53 +0000 (UTC)
Received: from virt-mtcollins-01.lab.eng.rdu2.redhat.com
 (virt-mtcollins-01.lab.eng.rdu2.redhat.com [10.8.1.196])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EC88A4EA4D;
 Wed, 12 Oct 2022 16:34:52 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, mst@redhat.com,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org, jean-philippe@linaro.org
Subject: [PATCH] hw/virtio/virtio-iommu-pci: Enforce the device is plugged on
 the root bus
Date: Wed, 12 Oct 2022 12:34:48 -0400
Message-Id: <20221012163448.121368-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: jx84+YJi9vEr

In theory the virtio-iommu-pci could be plugged anywhere in the PCIe
topology and as long as the dt/acpi info are properly built this should
work. However at the moment we fail to do that because the
virtio-iommu-pci BDF is not computed at plug time and in that case
vms->virtio_iommu_bdf gets an incorrect value.

For instance if the virtio-iommu-pci is plugged onto a pcie root port
and the virtio-iommu protects a virtio-block-pci device the guest does
not boot.

So let's do not pretend we do support this case and fail the initialize()
if we detect the virtio-iommu-pci is plugged anywhere else than on the
root bus. Anyway this ability is not needed.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 hw/virtio/virtio-iommu-pci.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/hw/virtio/virtio-iommu-pci.c b/hw/virtio/virtio-iommu-pci.c
index 79ea8334f0..7ef2f9dcdb 100644
--- a/hw/virtio/virtio-iommu-pci.c
+++ b/hw/virtio/virtio-iommu-pci.c
@@ -17,6 +17,7 @@
 #include "hw/qdev-properties-system.h"
 #include "qapi/error.h"
 #include "hw/boards.h"
+#include "hw/pci/pci_bus.h"
 #include "qom/object.h"
 
 typedef struct VirtIOIOMMUPCI VirtIOIOMMUPCI;
@@ -44,6 +45,7 @@ static Property virtio_iommu_pci_properties[] = {
 static void virtio_iommu_pci_realize(VirtIOPCIProxy *vpci_dev, Error **errp)
 {
     VirtIOIOMMUPCI *dev = VIRTIO_IOMMU_PCI(vpci_dev);
+    PCIBus *pbus = pci_get_bus(&vpci_dev->pci_dev);
     DeviceState *vdev = DEVICE(&dev->vdev);
     VirtIOIOMMU *s = VIRTIO_IOMMU(vdev);
 
@@ -57,11 +59,17 @@ static void virtio_iommu_pci_realize(VirtIOPCIProxy *vpci_dev, Error **errp)
             s->reserved_regions[i].type != VIRTIO_IOMMU_RESV_MEM_T_MSI) {
             error_setg(errp, "reserved region %d has an invalid type", i);
             error_append_hint(errp, "Valid values are 0 and 1\n");
+            return;
         }
     }
+    if (!pci_bus_is_root(pbus)) {
+        error_setg(errp, "virtio-iommu-pci must be plugged on the root bus");
+        return;
+    }
+
     object_property_set_link(OBJECT(dev), "primary-bus",
-                             OBJECT(pci_get_bus(&vpci_dev->pci_dev)),
-                             &error_abort);
+                             OBJECT(pbus), &error_abort);
+
     virtio_pci_force_virtio_1(vpci_dev);
     qdev_realize(vdev, BUS(&vpci_dev->bus), errp);
 }
-- 
2.31.1

