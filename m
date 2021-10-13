Received: by 2002:ac2:5f6a:0:0:0:0:0 with SMTP id c10csp3051583lfc;
        Wed, 13 Oct 2021 08:29:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwNQf0O0dd24ctllFqXq50kFFHPIaucH9Mmj9kgdxUNxsIWrsdEThtboQT5YogcMjF7KdAw
X-Received: by 2002:a05:6214:1763:: with SMTP id et3mr23199651qvb.37.1634138944508;
        Wed, 13 Oct 2021 08:29:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1634138944; cv=none;
        d=google.com; s=arc-20160816;
        b=VaModEWovFKtqDIqxBaWksit3LKVb//ZJ5k7TdWAR7uy1bj7T5rehB1M8hsELxppGY
         i/czHp+VFVXyEYiTT5Y0lzbs0mH9YZAn+Jx7YJ8PX9416w7VsxoQm51Op6gVIz4gtoTJ
         cJWL08nEZUyXnGoiMRhy212JslRQN8PA3K0hqeOBjqAqaawgK9flJ85Mp4XtRCWeWgRp
         eGkoKKEKvBQ7WfHvuZ1KEXdBPF0/WejCcun78s7cTr1Vr7b9VCaWXUyiLsQXN7JK28GV
         mNy+AA1t7L3wcqCqoLsRBQBmjRZg2yBxoFmjfD4453TEMVYbHR27j/p6OL8803ajC3lV
         Wubg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=FJj4hZqs7ZNoMqLNjCSOLcXzKLpyBHofExq68SiNQmU=;
        b=jsN4EtsYkM20NBUTzSh25QVYjO1CdOxrua2kEySuP6rZoggYKW0veuM+oL6b26axL9
         3oR8GMx3NQGFuWdD+A7hR07Tw4pr9hhsh0WfELsMaE88cult9AlHrlltY3NQmXz/mzsp
         ym9J8DGfK6zzU6aQP7tABuwTWUCdEI9QkbHqX8pKZmvS0iUwzAwx3mMYXc+zYhVd5DA7
         4+ZB4Fg5Nc9OiTNlIZ9DyGC66IQ5NqBFnXy0C7yIaot6d6NK8qsnkOpCCc30O6pNXNXQ
         /O6YAwLqbHE5CTMTM6nrn/vtGrQZ1EISzZlwZCSkVLrY+f1DehVRoaUM6Sjj7w5aRWag
         5M7w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=XtiUZ8BF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a25si9205430qtg.216.2021.10.13.08.29.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 13 Oct 2021 08:29:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=XtiUZ8BF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:55904 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1magBi-0000Du-G0
	for alex.bennee@linaro.org; Wed, 13 Oct 2021 11:29:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59168)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1magBX-0000AY-M5
 for qemu-arm@nongnu.org; Wed, 13 Oct 2021 11:28:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53470)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1magBT-0001jg-KH
 for qemu-arm@nongnu.org; Wed, 13 Oct 2021 11:28:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634138926;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FJj4hZqs7ZNoMqLNjCSOLcXzKLpyBHofExq68SiNQmU=;
 b=XtiUZ8BFg6qXh8FvLI4gies4RSGvIWBZI2y6Cn2fQBnukxVMyQ/1r9DbSF8A5VBs+6ucFn
 RPKz0uw9bT5FE/MtcR35/Gm9vifAfWdp0hdHJro+zAXsgz/leohyKFbt2132DXw9NlA4Fp
 uOYaYCL/ZxbGDlcgPMoToHks1FVpCXk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-146-JHTaq9HHPGq_qpuZ94izLg-1; Wed, 13 Oct 2021 11:28:43 -0400
X-MC-Unique: JHTaq9HHPGq_qpuZ94izLg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 72DC78015C7;
 Wed, 13 Oct 2021 15:28:42 +0000 (UTC)
Received: from virtlab-arm04.virt.lab.eng.bos.redhat.com
 (virtlab-arm04.virt.lab.eng.bos.redhat.com [10.19.152.244])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BB311694B7;
 Wed, 13 Oct 2021 15:28:41 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, mst@redhat.com, cohuck@redhat.com,
 peter.maydell@linaro.org
Subject: [PATCH v2 2/2] virtio-iommu: Drop base_name and change generic_name
Date: Wed, 13 Oct 2021 11:28:27 -0400
Message-Id: <20211013152827.764566-3-eric.auger@redhat.com>
In-Reply-To: <20211013152827.764566-1-eric.auger@redhat.com>
References: <20211013152827.764566-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: jean-philippe@linaro.org, abologna@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ChJ/ib5McEQF

Drop base_name and turn generic_name into
"virtio-iommu-pci". This is more in line with
more in line with other modern-only devices

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Suggested-by: Cornelia Huck <cohuck@redhat.com>
---
 hw/virtio/virtio-iommu-pci.c     | 3 +--
 include/hw/virtio/virtio-iommu.h | 2 +-
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/hw/virtio/virtio-iommu-pci.c b/hw/virtio/virtio-iommu-pci.c
index 86fa4e6c28..a160ae6b41 100644
--- a/hw/virtio/virtio-iommu-pci.c
+++ b/hw/virtio/virtio-iommu-pci.c
@@ -98,8 +98,7 @@ static void virtio_iommu_pci_instance_init(Object *obj)
 }
 
 static const VirtioPCIDeviceTypeInfo virtio_iommu_pci_info = {
-    .base_name             = TYPE_VIRTIO_IOMMU_PCI,
-    .generic_name          = "virtio-iommu-pci",
+    .generic_name          = TYPE_VIRTIO_IOMMU_PCI,
     .instance_size = sizeof(VirtIOIOMMUPCI),
     .instance_init = virtio_iommu_pci_instance_init,
     .class_init    = virtio_iommu_pci_class_init,
diff --git a/include/hw/virtio/virtio-iommu.h b/include/hw/virtio/virtio-iommu.h
index 273e35c04b..e2339e5b72 100644
--- a/include/hw/virtio/virtio-iommu.h
+++ b/include/hw/virtio/virtio-iommu.h
@@ -26,7 +26,7 @@
 #include "qom/object.h"
 
 #define TYPE_VIRTIO_IOMMU "virtio-iommu-device"
-#define TYPE_VIRTIO_IOMMU_PCI "virtio-iommu-device-base"
+#define TYPE_VIRTIO_IOMMU_PCI "virtio-iommu-pci"
 OBJECT_DECLARE_SIMPLE_TYPE(VirtIOIOMMU, VIRTIO_IOMMU)
 
 #define TYPE_VIRTIO_IOMMU_MEMORY_REGION "virtio-iommu-memory-region"
-- 
2.27.0

