Received: by 2002:a5d:6790:0:0:0:0:0 with SMTP id v16csp2447738wru;
        Mon, 1 Jul 2019 02:33:48 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxZo0CAz9SXFONu/1l2eujTstMoWMGG6YjNFx6R9+VlCjGy0X33n9CWtDtk1XuJq2Dcmy2x
X-Received: by 2002:a17:906:7d12:: with SMTP id u18mr11507007ejo.24.1561973628917;
        Mon, 01 Jul 2019 02:33:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1561973628; cv=none;
        d=google.com; s=arc-20160816;
        b=mVejzmbWmtbPl6YysMPDJraEQb+kevzUpN4m+CjZtBER0djFiLoHb8dFeJ5/o1S6Bc
         oBWIWrRs4uOjBJWKgeh9Z8ZbaByum5r3mk50ncfBZ+XEK6gKN0vF1lSA4lA07XQWtl3z
         M3c0pUCJh55kJWBsNRtuMHRpHEAZtoNf5R5ZRDpKXiltt1PTWb0hURZqP31tyqGcKb1M
         z5DEkSAsbcBM7sper7CEReUyZfVSM7jH6QHv8t+ek9K3DPd5qW3okzT1IKB3x0XofkEi
         ui7yO6lPDhv7G3kUcw/WBwFij8v1T0ACLy8cQhLinXx2x6AsEzik2dvlDU/rgfGzEgHA
         3bxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=aQNTJV0ct3S6osIQQcMj+Q2+gT14z36R3n9b/knAMl0=;
        b=TSC5f2qqots/SzRvd+t8gvS9+5Yj38lZxuBg+JYPUheZrJxOCXzym8igu+OH6uPLbR
         KJX0mmSf7ceZ9lt/0exDFRZfZSRlQh+Ja0dg/5cR6Scf5QsRrzUZekphl1tOj18K1P6I
         s6bDl7M3Uyv3iuRcoUoBQyLwTpL4HWoIJ0sohjnooVjIO/t26Q25bFR6chcvVL+iOLQO
         VBUP5EnZp7L2y8nmISfhM/BiMshtwK91VF0y7FVMO6JzrGa2/evWU8nNHrxPXepUMBLL
         u1I/XunmdmM+ZfPByJMf5VijsXL7CDu5aF7CB0gKwQ04e4YnNd0AfIAeXqQK4Ssj8Rm0
         CSkw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n21si7093302ejr.46.2019.07.01.02.33.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 01 Jul 2019 02:33:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:56438 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hhsgz-0002hc-IZ
	for alex.bennee@linaro.org; Mon, 01 Jul 2019 05:33:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49592)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <eric.auger@redhat.com>) id 1hhsef-0002Jk-NL
 for qemu-arm@nongnu.org; Mon, 01 Jul 2019 05:31:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eric.auger@redhat.com>) id 1hhsee-0000Mc-Gc
 for qemu-arm@nongnu.org; Mon, 01 Jul 2019 05:31:21 -0400
Received: from mx1.redhat.com ([209.132.183.28]:35210)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eric.auger@redhat.com>)
 id 1hhsee-0000AI-8A; Mon, 01 Jul 2019 05:31:20 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 8494988307;
 Mon,  1 Jul 2019 09:30:59 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-89.ams2.redhat.com [10.36.116.89])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8C39D7D5CB;
 Mon,  1 Jul 2019 09:30:56 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, peter.maydell@linaro.org, peterx@redhat.com,
 pbonzini@redhat.com, alex.williamson@redhat.com
Date: Mon,  1 Jul 2019 11:30:31 +0200
Message-Id: <20190701093034.18873-4-eric.auger@redhat.com>
In-Reply-To: <20190701093034.18873-1-eric.auger@redhat.com>
References: <20190701093034.18873-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.28]); Mon, 01 Jul 2019 09:31:02 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v2 3/6] hw/vfio/common: Do not replay IOMMU
 mappings in nested case
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
X-TUID: RFvhUtfJBycP

In nested mode, the stage 1 translation tables are owned by
the guest and there is no caching on host side. So there is
no need to replay the mappings.

As of today, the SMMUv3 nested mode is not yet implemented
and there is no functional VFIO integration without. But
keeping the replay call would execute the default implementation
of memory_region_iommu_replay and attempt to translate the whole
address range, completely stalling qemu. Keeping the MAP/UNMAP
notifier registration allows to hit a warning message in the
SMMUv3 device that tells the user which VFIO device will not
function properly:

"qemu-system-aarch64: -device vfio-pci,host=3D0000:89:00.0: warning:
SMMUv3 does not support notification on MAP: device vfio-pci will not
function properly"

Besides, removing the replay call now allows the guest to boot.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 hw/vfio/common.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index a859298fda..9ea58df67a 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -604,6 +604,7 @@ static void vfio_listener_region_add(MemoryListener *=
listener,
     if (memory_region_is_iommu(section->mr)) {
         VFIOGuestIOMMU *giommu;
         IOMMUMemoryRegion *iommu_mr =3D IOMMU_MEMORY_REGION(section->mr)=
;
+        bool nested =3D false;
         int iommu_idx;
=20
         trace_vfio_listener_region_add_iommu(iova, end);
@@ -631,8 +632,12 @@ static void vfio_listener_region_add(MemoryListener =
*listener,
         QLIST_INSERT_HEAD(&container->giommu_list, giommu, giommu_next);
=20
         memory_region_register_iommu_notifier(section->mr, &giommu->n);
-        memory_region_iommu_replay(giommu->iommu, &giommu->n);
=20
+        memory_region_iommu_get_attr(iommu_mr, IOMMU_ATTR_VFIO_NESTED,
+                                     (void *)&nested);
+        if (!nested) {
+            memory_region_iommu_replay(iommu_mr, &giommu->n);
+        }
         return;
     }
=20
--=20
2.20.1

