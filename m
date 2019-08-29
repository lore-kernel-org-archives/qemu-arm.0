Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp1857121wrs;
        Thu, 29 Aug 2019 02:02:41 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzYKRdtJMsFc9ys7guOIM0F7agKZWonAeekA8TQUWsi12Z97OZ8nva+J5P0lXmRWzyK6zED
X-Received: by 2002:a37:6715:: with SMTP id b21mr8074312qkc.397.1567069361272;
        Thu, 29 Aug 2019 02:02:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1567069361; cv=none;
        d=google.com; s=arc-20160816;
        b=PYA4WqQNyPAX9ZwyAfg81DwvRnL31J4fHrRIBq68rc37ToKlsZblr1gN8RsE39vkRu
         43HTqoBa5UkvoMhFshEWR2ikj7ttVYrd9VF9v4o/OLyUYEqtRWjeYVsbmYHvOGYvhw21
         fkf+F69e2ikxziGx5vdlgUIiMW0jnp2Wl+Zx9d0MSRFwZJqGgrCHndErftcVBT4DX8iy
         0B+G/dnYnlB73Zl518u3bwX87Vr6EW7jSHWEuez1HhCwEY+vfgvLV/drPRNymriGBndR
         agKBElchQ868bDW+Jiyw5rayzTpI5ZoQyU2MpdCUOPAdyc9tsOeAgkuxG8uteUtatwvm
         2ZaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=YVBuGdqVPEfy6yZBRFP/r4odQo3nzL2TwJuN5O5An2k=;
        b=C9w5zJPS0qov4y/xIq/5X+KPwXIzGH/KIBFaddFcIzlD4xXifbtVMsZXqatnx3hZJS
         gEAfHJp1Ac0yUfIVxxXwjWdNv7i+OwRPqPTN9zUg75t/1jQbRvsSpxOYiuI0maNHLOTG
         MmtJI4DVZWcSnaBuWeO2ggiTdVdjMNXmyNC+p/3lDXJtxUMz7RZ8folOGy9XyR8x14Qj
         V8AR1kMz3YQ4QcRKiBhhWHyFDMFiMJq4emfGcAMcXyXRVzuMtiyOQM19WlAJhRvrYYjs
         ZiM8WR2mXbmp692HnyvrbUjmzjtEU6Ikrz3jh3kizpv7JRpbQaAZoZUu8KqM8i9OJyqr
         c7Qg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n36si1278916qvg.97.2019.08.29.02.02.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 29 Aug 2019 02:02:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:47054 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i3GKG-0002D5-0s
	for alex.bennee@linaro.org; Thu, 29 Aug 2019 05:02:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33200)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eric.auger@redhat.com>) id 1i3GJf-0001uR-KD
 for qemu-arm@nongnu.org; Thu, 29 Aug 2019 05:02:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eric.auger@redhat.com>) id 1i3GJe-00014F-8x
 for qemu-arm@nongnu.org; Thu, 29 Aug 2019 05:02:03 -0400
Received: from mx1.redhat.com ([209.132.183.28]:36693)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eric.auger@redhat.com>)
 id 1i3GJe-00013M-0m; Thu, 29 Aug 2019 05:02:02 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 3C47F106E28D;
 Thu, 29 Aug 2019 09:02:01 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-105.ams2.redhat.com [10.36.116.105])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A3A3B1001938;
 Thu, 29 Aug 2019 09:01:56 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, peter.maydell@linaro.org, pbonzini@redhat.com,
 alex.williamson@redhat.com
Date: Thu, 29 Aug 2019 11:01:41 +0200
Message-Id: <20190829090141.21821-3-eric.auger@redhat.com>
In-Reply-To: <20190829090141.21821-1-eric.auger@redhat.com>
References: <20190829090141.21821-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.64]); Thu, 29 Aug 2019 09:02:01 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v5 2/2] hw/vfio/common: Fail on VFIO/HW nested
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
Cc: aik@ozlabs.ru, peterx@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: jceh6k4xbAhs

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
index 3e03c495d8..e8c009d019 100644
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
+                                          IOMMU_ATTR_NEED_HW_NESTED_PAGI=
NG,
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

