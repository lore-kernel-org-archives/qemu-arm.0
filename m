Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp982599wrv;
        Thu, 11 Jul 2019 10:35:54 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxJyMoEtPkNAv2sa5OwqRATvGXdGpd4/jPW6g78f34RAZhTKL5qYOLWKtuB/FztbdrCDMdr
X-Received: by 2002:a50:eb4d:: with SMTP id z13mr4795571edp.271.1562866554230;
        Thu, 11 Jul 2019 10:35:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562866554; cv=none;
        d=google.com; s=arc-20160816;
        b=yWerr/BWb/4pqqsgAiN3ZedFRPLpwGTc0iMErSL5Mx4yomgVOtxkJadR5zwBheBitI
         ksXa02Eb+qtB6jkLzpLDAjDTql0X42X9a75OEjhW20SkH+ILKvWtp3qnf4e525u1nDLs
         V0pgzsedfiQ7o5tSy6bh+n5gO2xxSWnoVSNdDMhpeZRDwAPKb/p8QsTX7wqy9Tkwyxm5
         zzTYKp8uz74w6FqZuy3Qyh/0DzNZIB596xh4fGbBGDqIck/INa/bBgBBSgbOJ+eB9mHv
         +aUcRKcxC7wdrAxtnmSBD62Kz3uS9PFpgZMS7zFFvqK8X8IGOBHc1RspW58ut8lMWNtL
         KoSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=O56cKTYj/EGcQnTytAmBlJTHBimk4wt4AOwrPqHMa/o=;
        b=dfPneLixuw8bT2mKTeKxZaxnGHm9tYnEb/cj5QqLNO/CxjKKqzUTmL5i+DZ9JYRmdt
         wcjz67BRtlPaWdl421BACH/Xpyw0KXkSP2z/jpqkYkXjU7qQW/XO9XobeRI/BxBuVf1h
         PyyNAHXIW0yP9ioAMyIPn44AdKw0v1HcEi7Frir2o2OK/I3RxiyZKLkFOpscoBOsAF1F
         V9nVLJEVdaqZZEo7o/tsuTSVWqjHQFP7SG6p9u9z3oDNggjZ7TRIP6In9NoKs2eYbpcn
         ff8uwhdPKSiL+lptpZHciOLXRCMWpsOVbShzsPtGuysCaQDaHa2MkeVLwQVprhSkA7wA
         LBRw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z5si3192339ejb.106.2019.07.11.10.35.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 11 Jul 2019 10:35:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:44056 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hlcz2-0002qA-RV
	for alex.bennee@linaro.org; Thu, 11 Jul 2019 13:35:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35275)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <eric.auger@redhat.com>) id 1hlcw5-0008Ib-PW
 for qemu-arm@nongnu.org; Thu, 11 Jul 2019 13:32:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eric.auger@redhat.com>) id 1hlcw3-00053o-Mx
 for qemu-arm@nongnu.org; Thu, 11 Jul 2019 13:32:48 -0400
Received: from mx1.redhat.com ([209.132.183.28]:60038)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eric.auger@redhat.com>)
 id 1hlcw1-0004zF-JV; Thu, 11 Jul 2019 13:32:45 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 49E2F59441;
 Thu, 11 Jul 2019 17:32:43 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-46.ams2.redhat.com [10.36.116.46])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B84325C69A;
 Thu, 11 Jul 2019 17:32:37 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, peter.maydell@linaro.org
Date: Thu, 11 Jul 2019 19:28:45 +0200
Message-Id: <20190711172845.31035-30-eric.auger@redhat.com>
In-Reply-To: <20190711172845.31035-1-eric.auger@redhat.com>
References: <20190711172845.31035-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.39]); Thu, 11 Jul 2019 17:32:43 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [RFC v4 29/29] vfio: Remove VFIO/SMMUv3 assert
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
X-TUID: /VfTqglYTqrj

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

