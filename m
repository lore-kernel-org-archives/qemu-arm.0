Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp991042wrv;
        Thu, 11 Jul 2019 10:45:07 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxINFcrlLzFqsmSxKy6sgB6jmzRXi8VuLjFqNd2jmTqZ0sNEZHbVilTlLu8L3LqrfTt2pW0
X-Received: by 2002:a50:d7d0:: with SMTP id m16mr4779892edj.162.1562867107622;
        Thu, 11 Jul 2019 10:45:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562867107; cv=none;
        d=google.com; s=arc-20160816;
        b=C9SFRWBpGtGr1c3XzHuGsVsIjf03X8fUmUyfSp1n0hsNiKEeng64i2GJsMMWJXVJuU
         yG+DnnY7y7FRkuKQovUe32lZaHwKjj1XKwh61w+B5ci3dsIbp4pR9DeZvT2zPJK+fORN
         NyIgBgM+liyJiSANzqMhnaUnLgYkm2sxC1QyaxLSzfeQqhN5Sw1wQmSkyzMltjgq4Epu
         n+gdByZywa+Zer+oTYCWcxwMWoznnh3bIVWhMwgGgkrHVN8vE6Ir2/GbjExlDEpO1sbL
         5MA3VhuBl/wjbgFhCA9t2jG7ahkDL4CHEWs2Lg4Y/+imkUKnvB3rFiKVNSrEwVvlSlaW
         BTjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=O56cKTYj/EGcQnTytAmBlJTHBimk4wt4AOwrPqHMa/o=;
        b=ZXJgdrNlTUhopM5F7E6FlsSDudntn+PwNVuHcJOhn1B6/9WbJZTVBcPbrTKvY4cMnY
         wahZrtweV937DZgbCEatQfbhopMSX/feHqUrscXW4Xh1leMGV2/IQ1pZRoZMrF3jrqtc
         0wMvfAxSCFO4bfiWI5NfNltMtnHvsnD+tOibcejkk1nnBfl4y+EPq/c71LGYPQKe9yDc
         0nNOb9YLxF4HrtMFK/HFgPCy5vFF2b0caQFyZEq6WYH05vgHNCgl+fD8HUq3exRl9JvC
         X0qumHQ8ceKYj7Y3rPns9M6+7FcuN3idPKXeqLGnY0SC0tHTCG553yMLXS6AOjFT4P0U
         qenQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a24si4135205edd.382.2019.07.11.10.45.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 11 Jul 2019 10:45:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:44332 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hld7s-0003eG-8v
	for alex.bennee@linaro.org; Thu, 11 Jul 2019 13:45:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39560)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <eric.auger@redhat.com>) id 1hld6T-0006CT-E8
 for qemu-devel@nongnu.org; Thu, 11 Jul 2019 13:43:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eric.auger@redhat.com>) id 1hld6H-0006x5-A5
 for qemu-devel@nongnu.org; Thu, 11 Jul 2019 13:43:31 -0400
Received: from mx1.redhat.com ([209.132.183.28]:11216)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eric.auger@redhat.com>)
 id 1hld6E-0006sa-4C; Thu, 11 Jul 2019 13:43:18 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 99C9E307D859;
 Thu, 11 Jul 2019 17:43:14 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-46.ams2.redhat.com [10.36.116.46])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 197DE60A97;
 Thu, 11 Jul 2019 17:42:56 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, peter.maydell@linaro.org
Date: Thu, 11 Jul 2019 19:39:33 +0200
Message-Id: <20190711173933.31203-30-eric.auger@redhat.com>
In-Reply-To: <20190711173933.31203-1-eric.auger@redhat.com>
References: <20190711173933.31203-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.48]); Thu, 11 Jul 2019 17:43:14 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [RFC v5 29/29] vfio: Remove VFIO/SMMUv3 assert
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: drjones@redhat.com, yi.l.liu@intel.com, mst@redhat.com,
 jean-philippe.brucker@arm.com, zhangfei.gao@foxmail.com, peterx@redhat.com,
 alex.williamson@redhat.com, vincent.stehle@arm.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 8SKfow7Rrj1K

Now all the bricks are there, let allow VFIO/SMMUv3 use case.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 hw/vfio/common.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index 8a2d201058..c849b084bf 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -834,17 +834,9 @@ static void vfio_listener_region_add(MemoryListener =
*listener,
         IOMMUNotify notify;
         VFIOGuestIOMMU *giommu;
         IOMMUMemoryRegion *iommu_mr =3D IOMMU_MEMORY_REGION(section->mr)=
;
-        bool nested;
         int iommu_idx, flags;
=20
         trace_vfio_listener_region_add_iommu(iova, end);
-
-        if (!memory_region_iommu_get_attr(iommu_mr, IOMMU_ATTR_VFIO_NEST=
ED,
-                                          (void *)&nested) && nested) {
-            error_report("VFIO/vIOMMU integration based on HW nested pag=
ing "
-                         "is not yet supported");
-            abort();
-        }
         /*
          * FIXME: For VFIO iommu types which have KVM acceleration to
          * avoid bouncing all map/unmaps through qemu this way, this
--=20
2.20.1

