Received: by 2002:a19:5509:0:0:0:0:0 with SMTP id n9csp1125189lfe;
        Fri, 20 Mar 2020 10:00:00 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vvIkfFQmXToa5uvJbv9jchjIhvpwkKXxPUQPOb00QHEO7P4U8FI3HMVb/GGuxZJ7n/optlC
X-Received: by 2002:a37:4852:: with SMTP id v79mr8578651qka.459.1584723600434;
        Fri, 20 Mar 2020 10:00:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584723600; cv=none;
        d=google.com; s=arc-20160816;
        b=AaAr42/zad5H01vKP/aKMJanbTJ5Te5zAGp5DtwZYWQ8jifZUpyiFf8j8nuVw+aIyV
         o8moH2FQIJFNXvuR8xN+hrZF0fG46wtbbkAck5NHUqVMKUgoIY2aFgISJVOGt+TEZdmD
         82cZQyXpxRF01dX37zFkTF52znI2fKQnK/1Y7KPSOSF3KHXDkS3e/Tti4xQMlPisMmqI
         YAokBbufrHeW7L/TtCAugWELpMJAjWqx+RFMGTwMGJYwf1LeoSqXSX/M3mH7DuHfAQGx
         F7oW5UA4LRr7u5143SywPy3NMBSHc4sVibU0G2WBzp4Bx/6ZONI2+5fyER1mOf+TppWg
         6Ohg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=l4KnebwxS0P1vhnyYLdhvgOKHN1XgOehzns8rZS0vnk=;
        b=PCrFdeD2AlpaXMGD2g0QlQF/tDnXzuOehIWa4fosyIlGrKFmTFOkDlKuYLNPptb7+n
         UtBltfvoKh8oIfXkNzrL0L9GrccQVPHcc8roy7b7k8439PK0HsmyF8LCgTPIVmnmYNZ7
         VZ//itfqihD3ysE34DUo2jQSPyqn9d2ENrXkGXqXCYrbWrgs57eu5X80A1cQCxDTrpPZ
         lHjq1PjzJQ1Gp7z+/6NMhpdkXzhJqTfvlcnyB0x9Pa6SwuLkEod9UGvLy/R+TWnNU6Uh
         7eoz3XrreXd9duYBuI1L1vaE3jW7bnzERSLDz4bm26mU0yjk5FkAemIqCO7Qy4lKSEXu
         Tz8g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=OKVzTT8d;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i8si3592043qtq.231.2020.03.20.10.00.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 20 Mar 2020 10:00:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=OKVzTT8d;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:56200 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jFL03-0003Vg-MJ
	for alex.bennee@linaro.org; Fri, 20 Mar 2020 12:59:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54023)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eric.auger@redhat.com>) id 1jFKzs-0003OF-N4
 for qemu-arm@nongnu.org; Fri, 20 Mar 2020 12:59:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eric.auger@redhat.com>) id 1jFKzr-0004KO-Ip
 for qemu-arm@nongnu.org; Fri, 20 Mar 2020 12:59:48 -0400
Received: from us-smtp-delivery-74.mimecast.com ([216.205.24.74]:37016)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eric.auger@redhat.com>)
 id 1jFKzr-0004JW-BV
 for qemu-arm@nongnu.org; Fri, 20 Mar 2020 12:59:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584723587;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=l4KnebwxS0P1vhnyYLdhvgOKHN1XgOehzns8rZS0vnk=;
 b=OKVzTT8dXXMVYeUtMCrHGJvO4mzO/N9ipD6xDmiMeAMPFz8NEGoNOKqqY/6Xjvc+J4HsIx
 AnSbplAdOOQIkwRDMQcDTqL0uw5Pb3iKZFV/Wae5oJ+Q6YBV6i2cJP7dWcb/1MScdUGu4H
 erZYFFzcgSp2wGd3DDi/QwC1/vy5dfo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-449-cP3Ri5PnOVC4CQVlVuicqQ-1; Fri, 20 Mar 2020 12:59:43 -0400
X-MC-Unique: cP3Ri5PnOVC4CQVlVuicqQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 42952140D;
 Fri, 20 Mar 2020 16:59:41 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-113-142.ams2.redhat.com [10.36.113.142])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1190216D22;
 Fri, 20 Mar 2020 16:59:28 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, peter.maydell@linaro.org, mst@redhat.com,
 alex.williamson@redhat.com, jacob.jun.pan@linux.intel.com,
 yi.l.liu@intel.com
Subject: [RFC v6 03/24] memory: Add IOMMU_ATTR_VFIO_NESTED IOMMU memory region
 attribute
Date: Fri, 20 Mar 2020 17:58:19 +0100
Message-Id: <20200320165840.30057-4-eric.auger@redhat.com>
In-Reply-To: <20200320165840.30057-1-eric.auger@redhat.com>
References: <20200320165840.30057-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 216.205.24.74
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
Cc: jean-philippe@linaro.org, tnowicki@marvell.com, maz@kernel.org,
 zhangfei.gao@foxmail.com, peterx@redhat.com,
 shameerali.kolothum.thodi@huawei.com, zhangfei.gao@linaro.org,
 bbhushan2@marvell.com, will@kernel.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: p+o5JUHDKpm4

We introduce a new IOMMU Memory Region attribute,
IOMMU_ATTR_VFIO_NESTED that tells whether the virtual IOMMU
requires HW nested paging for VFIO integration.

Current Intel virtual IOMMU device supports "Caching
Mode" and does not require 2 stages at physical level to be
integrated with VFIO. However SMMUv3 does not implement such
"caching mode" and requires to use HW nested paging.

As such SMMUv3 is the first IOMMU device to advertise this
attribute.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 hw/arm/smmuv3.c       | 12 ++++++++++++
 include/exec/memory.h |  3 ++-
 2 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
index 57a79df55b..e33eabd028 100644
--- a/hw/arm/smmuv3.c
+++ b/hw/arm/smmuv3.c
@@ -1508,6 +1508,17 @@ static int smmuv3_notify_flag_changed(IOMMUMemoryReg=
ion *iommu,
     return 0;
 }
=20
+static int smmuv3_get_attr(IOMMUMemoryRegion *iommu,
+                           enum IOMMUMemoryRegionAttr attr,
+                           void *data)
+{
+    if (attr =3D=3D IOMMU_ATTR_VFIO_NESTED) {
+        *(bool *) data =3D true;
+        return 0;
+    }
+    return -EINVAL;
+}
+
 static void smmuv3_iommu_memory_region_class_init(ObjectClass *klass,
                                                   void *data)
 {
@@ -1515,6 +1526,7 @@ static void smmuv3_iommu_memory_region_class_init(Obj=
ectClass *klass,
=20
     imrc->translate =3D smmuv3_translate;
     imrc->notify_flag_changed =3D smmuv3_notify_flag_changed;
+    imrc->get_attr =3D smmuv3_get_attr;
 }
=20
 static const TypeInfo smmuv3_type_info =3D {
diff --git a/include/exec/memory.h b/include/exec/memory.h
index 1614d9a02c..b9d2f0a437 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -213,7 +213,8 @@ typedef struct MemoryRegionClass {
=20
=20
 enum IOMMUMemoryRegionAttr {
-    IOMMU_ATTR_SPAPR_TCE_FD
+    IOMMU_ATTR_SPAPR_TCE_FD,
+    IOMMU_ATTR_VFIO_NESTED,
 };
=20
 /**
--=20
2.20.1

