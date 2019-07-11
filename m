Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp986813wrv;
        Thu, 11 Jul 2019 10:40:33 -0700 (PDT)
X-Google-Smtp-Source: APXvYqw6kEoO81XwKhb+PhvcaDUysjqr5764UWK69xFR1MuMZhPBg+xOHLv/1A6WO8lY6ypERUMF
X-Received: by 2002:a17:906:5ad0:: with SMTP id x16mr4404870ejs.23.1562866833576;
        Thu, 11 Jul 2019 10:40:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562866833; cv=none;
        d=google.com; s=arc-20160816;
        b=B7k5PEQlJ1LyD/U8YKfgYIbf9k5mhLrnSN8nIs7M0OKsJbT0k5XsPmJzZqoH5WFCPQ
         T1ZyNj0HRtW6OWHA3WQiV+Lsh9u+p0vEif9DwHORQ5JfQjI1nkk8ZrVgQ9vHIxSthRFE
         GzdZMSSfI9kFckywGkk1+J9BL657VX+08XhYCRl5TlKEzeKNF4Lckz2ZQEy/fpmyN3bi
         +CsBTH8DDFno7HChP0YwaVTJkdnTnwO3G/+GDoSo3DA1w04+YKU+t4pzwfE3xpGifY95
         6p5qtdp8Zc9nLPbUmoXFi4zSuu0Y7Y6nAa231iZcmnaNElnObR6OccSh1MSoozFgiafr
         aCzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=3RHLSWCVmMxJOL8bGxLrxFoN6xSHaw1M4fO4s2sLPtM=;
        b=b6YCpxfO1sbwjJqgegintafQuajCp5MHRJJTB2B93DoAKgYykC0soKVO6+mjU+0WiU
         OnA0n0vnkcgJnv+/Toio6xLX/G2Gw2RCS1II+P2q3A7fDrsktNEVh3GH6s58D/74/fKJ
         dLdESsGMFOoNU0/xyyPSKTkIAdJdzy2UuJyXI/KfuRjfoPgS09vAxS7OgeQ00/wS4ib/
         LJvkJjkf/LQpcZ/i3l+y794aTho3BCIEkm0I669tW42z6pw/oggzlMQxWnb1u6wQzMBh
         neKJ48V1BWe+a6fNVF2zN/6M79yCo/NvEa8KfCEmd1ye1wA2ne8qeGiwyzneR9MjL2CO
         9wjQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k5si3429094ejp.230.2019.07.11.10.40.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 11 Jul 2019 10:40:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:44124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hld3Y-0001Kj-4x
	for alex.bennee@linaro.org; Thu, 11 Jul 2019 13:40:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37923)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <eric.auger@redhat.com>) id 1hld3C-0008M3-2Z
 for qemu-arm@nongnu.org; Thu, 11 Jul 2019 13:40:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eric.auger@redhat.com>) id 1hld3A-0003wo-Lh
 for qemu-arm@nongnu.org; Thu, 11 Jul 2019 13:40:09 -0400
Received: from mx1.redhat.com ([209.132.183.28]:56244)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eric.auger@redhat.com>)
 id 1hld3A-0003w8-Fw; Thu, 11 Jul 2019 13:40:08 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id A9B5885543;
 Thu, 11 Jul 2019 17:40:07 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-46.ams2.redhat.com [10.36.116.46])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7B45260600;
 Thu, 11 Jul 2019 17:39:55 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, peter.maydell@linaro.org
Date: Thu, 11 Jul 2019 19:39:07 +0200
Message-Id: <20190711173933.31203-4-eric.auger@redhat.com>
In-Reply-To: <20190711173933.31203-1-eric.auger@redhat.com>
References: <20190711173933.31203-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.28]); Thu, 11 Jul 2019 17:40:07 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [RFC v5 03/29] hw/vfio/common: Assert in case of nested
 mode
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
X-TUID: dB7pl9KQFajR

As of today, VFIO only works along with vIOMMU supporting
caching mode. The SMMUv3 does not support this mode and
requires HW nested paging to work properly with VFIO.

So any attempt to run a VFIO device protected by such IOMMU
would prevent the assigned device from working and at the
moment the guest does not even boot as the default
memory_region_iommu_replay() implementation attempts to
translate the whole address space and completely stalls
the execution.

So let's assert if we recognize nested mode case.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 hw/vfio/common.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index a859298fda..d622191fe6 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -604,9 +604,17 @@ static void vfio_listener_region_add(MemoryListener =
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
+        if (!memory_region_iommu_get_attr(iommu_mr, IOMMU_ATTR_VFIO_NEST=
ED,
+                                          (void *)&nested) && nested) {
+            error_report("VFIO/vIOMMU integration based on HW nested pag=
ing "
+                         "is not yet supported");
+            abort();
+        }
         /*
          * FIXME: For VFIO iommu types which have KVM acceleration to
          * avoid bouncing all map/unmaps through qemu this way, this
--=20
2.20.1

