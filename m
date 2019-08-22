Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp1056947wrs;
        Thu, 22 Aug 2019 10:25:08 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwRsYIh0Cfdsb4MHjMSZu02X0Xr3w9joJY+HutAN3E0pFijqawVJjgohLrDdxeMiNRwV60u
X-Received: by 2002:a17:906:490d:: with SMTP id b13mr407703ejq.16.1566494708231;
        Thu, 22 Aug 2019 10:25:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566494708; cv=none;
        d=google.com; s=arc-20160816;
        b=ZXCrBUD1rC/HpcRyPYFhfxbR6BeCuWV+8eIju51rXWXXJ4ZiDgAUNaxwWkooKxg5ya
         t/xKnz8OLW5AkGd9mOeczvpQdISrSzO68T+rwAVnytbeLdK2792hjqljiJ0h1JFaArZz
         xowuBXq4v2EgBnLE9PeoItYX7VWIqm7tHKRVHLC3trK1nxUNmAV07ualgzwvZTskp6yp
         xQetcvXoVLmXUtmzhhP3+3Q7DYb3twNO7nZiRXr+3evJXlmOroCW42ZdmII7eteHuabm
         kkEatTEjGoO728CzVWXqhKkIJrJ5D+8HVFzg2NawR34MXqoHM5KfblC1X6BDxvAO0IQ1
         haPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=Uu7OzCHQpIacvMyLXUPZRrl2aGOsJQdoiWq/puAr918=;
        b=rWdO1zEca43I3+MI7yf7Xlio6smdc64gxD74tI5pGBfVSlBK8ECBfYtNsgIhBE2D4A
         qMr6QogC0FTCvlVCXMO7KKWPWXgV/xJj0OlbbD3D7eOeocYm70cMvzW2xKu4B5I5K3Yx
         iOAUvlWrnMuxJ6dsUUul2K3mrdl91cXngnY2U83bmzjXwWgey7nEsGgcnI3s7JGNwpfq
         ZK7DQQ9dXYoJzs/pFGWWr9EU9gzb3YeGfSU9Wz5RyZDfeVH2BNkutPmzQ+QWcCRKAhvw
         QlItwvoWYSMQY72TNNn++ZsYkdYqpV2wFFtkcplMIjCnTpI4EdJh7VNP6Zegg0ZaDN0H
         T2Lg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c31si218502edb.164.2019.08.22.10.25.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 22 Aug 2019 10:25:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:46668 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i0qpe-0006Yg-S8
	for alex.bennee@linaro.org; Thu, 22 Aug 2019 13:25:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35594)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eric.auger@redhat.com>) id 1i0qoq-0005rl-7l
 for qemu-arm@nongnu.org; Thu, 22 Aug 2019 13:24:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eric.auger@redhat.com>) id 1i0qoo-00036E-VQ
 for qemu-arm@nongnu.org; Thu, 22 Aug 2019 13:24:15 -0400
Received: from mx1.redhat.com ([209.132.183.28]:41780)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eric.auger@redhat.com>)
 id 1i0qoo-00035b-ML; Thu, 22 Aug 2019 13:24:14 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id EC5A21801587;
 Thu, 22 Aug 2019 17:24:13 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-105.ams2.redhat.com [10.36.116.105])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 02B8F60610;
 Thu, 22 Aug 2019 17:24:11 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, peter.maydell@linaro.org, peterx@redhat.com,
 pbonzini@redhat.com, alex.williamson@redhat.com
Date: Thu, 22 Aug 2019 19:23:48 +0200
Message-Id: <20190822172350.12008-4-eric.auger@redhat.com>
In-Reply-To: <20190822172350.12008-1-eric.auger@redhat.com>
References: <20190822172350.12008-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.63]); Thu, 22 Aug 2019 17:24:14 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v4 3/5] hw/vfio/common: Fail on VFIO/HW nested
 paging detection
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /62/Yl5jHZIB

As of today, VFIO only works along with vIOMMU supporting
caching mode. The SMMUv3 does not support this mode and
requires HW nested paging to work properly with VFIO.

So any attempt to run a VFIO device protected by such IOMMU
would prevent the assigned device from working and at the
moment the guest does not even boot as the default
memory_region_iommu_replay() implementation attempts to
translate the whole address space and completely stalls
the guest.

So let's fail on that case.

Signed-off-by: Eric Auger <eric.auger@redhat.com>

---

v3 -> v4:
- use IOMMU_ATTR_HW_NESTED_PAGING
- do not abort anymore but jump to fail
---
 hw/vfio/common.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index 3e03c495d8..2b66cf7553 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -606,9 +606,19 @@ static void vfio_listener_region_add(MemoryListener =
*listener,
     if (memory_region_is_iommu(section->mr)) {
         VFIOGuestIOMMU *giommu;
         IOMMUMemoryRegion *iommu_mr =3D IOMMU_MEMORY_REGION(section->mr)=
;
+        bool nested;
         int iommu_idx;
=20
         trace_vfio_listener_region_add_iommu(iova, end);
+
+        if (!memory_region_iommu_get_attr(iommu_mr,
+                                          IOMMU_ATTR_HW_NESTED_PAGING,
+                                          (void *)&nested) && nested) {
+            error_report("VFIO/vIOMMU integration based on HW nested pag=
ing "
+                         "is not yet supported");
+            ret =3D -EINVAL;
+            goto fail;
+        }
         /*
          * FIXME: For VFIO iommu types which have KVM acceleration to
          * avoid bouncing all map/unmaps through qemu this way, this
--=20
2.20.1

