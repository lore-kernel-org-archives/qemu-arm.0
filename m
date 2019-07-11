Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp986424wrv;
        Thu, 11 Jul 2019 10:40:05 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzyy9nEdZGrlfXCNJJJCChJ4507Ow7jNcCQM2C50xyl/9VhmX3hpyqg8m2bbR+FugUQjlPJ
X-Received: by 2002:a17:906:2555:: with SMTP id j21mr4369922ejb.231.1562866805786;
        Thu, 11 Jul 2019 10:40:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562866805; cv=none;
        d=google.com; s=arc-20160816;
        b=AGdpWLeyXIpSQoDEcPC026gkQGAozwzF2Touic1PWWdVnfQGnqH87Pa5vSjFSDh5rZ
         Q32q0kTQzrQQY77nZkSIBod0lG+yZjM2QVKavJVTqw/3+csqV7EXccBJTpXJxy5isCA2
         N/68kQBdsQB7X1sVtKNg5lbPa8O+8g3L31F6yGDDek7zMJSio2wPIePznxHCp6HDt2Oo
         s2Z19zXh7Fs84z3AkaVrsjTZykuKRvxKR3jD6IX43JohLtGmurk5wk6EcgXKbd5XBdt4
         mnlXHO9PJcq9USIXV8rEnNQ8JBUGXD9cFX/Ob+Jm7u3zVRc0N04fiQe07FQwJU+qmASh
         y4ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=d55vLVoHhDsHINsYSLNRyKE2VPFAuBtSUumm+wzt9r0=;
        b=vGqmIUH9oLU/tsswbmb9TWr0HfHEWbUmP4wAJ3nMcH9+HiuZ9FBvBx4VgStkn+N7Yp
         AJZll7L5XgXA/lzWSAcCcca8BukRUKOxwLVS3wjsVrJkytoOYhA6ZDZaJo6bPqDppC5p
         7UTdLDP39lcJk/oJEUKYe5bbsvQRtHjnU8TU+GQWKqq9wkA/ABbKvF80TJX8s+oUaQnY
         1bhhuC7npM+q2F58x1s2McL2HD7uhOqihQHjuaTaUlMfNFv+Ia4hNFD1iTTSilRhMfKA
         HB0PNH+bKQgecu2cR0YcJRzbY5804729xXfDRgo60hr9B22dyc7lp7yNG5zs0iVlIDJD
         82Rg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e27si4018701edd.353.2019.07.11.10.40.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 11 Jul 2019 10:40:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:44110 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hld36-0007k2-0Q
	for alex.bennee@linaro.org; Thu, 11 Jul 2019 13:40:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37785)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <eric.auger@redhat.com>) id 1hld2z-0007TZ-6P
 for qemu-arm@nongnu.org; Thu, 11 Jul 2019 13:39:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eric.auger@redhat.com>) id 1hld2y-0003j9-2A
 for qemu-arm@nongnu.org; Thu, 11 Jul 2019 13:39:57 -0400
Received: from mx1.redhat.com ([209.132.183.28]:52732)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eric.auger@redhat.com>)
 id 1hld2x-0003iT-Sq; Thu, 11 Jul 2019 13:39:55 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 237A2308FFB1;
 Thu, 11 Jul 2019 17:39:55 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-46.ams2.redhat.com [10.36.116.46])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 31E5360600;
 Thu, 11 Jul 2019 17:39:52 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, peter.maydell@linaro.org
Date: Thu, 11 Jul 2019 19:39:06 +0200
Message-Id: <20190711173933.31203-3-eric.auger@redhat.com>
In-Reply-To: <20190711173933.31203-1-eric.auger@redhat.com>
References: <20190711173933.31203-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.49]); Thu, 11 Jul 2019 17:39:55 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [RFC v5 02/29] memory: Add IOMMU_ATTR_VFIO_NESTED IOMMU
 memory region attribute
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
Cc: drjones@redhat.com, yi.l.liu@intel.com, mst@redhat.com,
 jean-philippe.brucker@arm.com, zhangfei.gao@foxmail.com, peterx@redhat.com,
 alex.williamson@redhat.com, vincent.stehle@arm.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: EmDlb3kWKKXU

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
index e96d5beb9a..384c02cb91 100644
--- a/hw/arm/smmuv3.c
+++ b/hw/arm/smmuv3.c
@@ -1490,6 +1490,17 @@ static void smmuv3_notify_flag_changed(IOMMUMemory=
Region *iommu,
     }
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
@@ -1497,6 +1508,7 @@ static void smmuv3_iommu_memory_region_class_init(O=
bjectClass *klass,
=20
     imrc->translate =3D smmuv3_translate;
     imrc->notify_flag_changed =3D smmuv3_notify_flag_changed;
+    imrc->get_attr =3D smmuv3_get_attr;
 }
=20
 static const TypeInfo smmuv3_type_info =3D {
diff --git a/include/exec/memory.h b/include/exec/memory.h
index a078cd033f..e477a630a8 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -204,7 +204,8 @@ struct MemoryRegionOps {
 };
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

