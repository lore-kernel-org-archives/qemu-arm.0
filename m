Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp479118wrp;
        Fri, 13 Sep 2019 01:37:22 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxU/70G3fM978sm8X2melrObssmiZyzHAAy7EqRiHMOzbNFORSx3TGM9fYh+OfbKMyaVEnY
X-Received: by 2002:ac8:7601:: with SMTP id t1mr1736696qtq.342.1568363842314;
        Fri, 13 Sep 2019 01:37:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1568363842; cv=none;
        d=google.com; s=arc-20160816;
        b=rod5SrlcwGvNutkgWtlEMek9Q3PZzj4NWfBEq4OW+rAjIcaf+aakBSdIwgdnrDRPvV
         Awr4QwsAucfGq18j0OA7Ktv5qhXJK/QdSe41fufLq2h5EICV4ODj3N6KKYdnM/Sc9vpn
         lXrhy1M6GH1QbvaTqsO3k56Gi2Wn1BuEDeGT/Sqqn2ngW+Jm/xGfmxECYEef3sontDAW
         d2gyuwPSgC896M3slcmxINVPOSxSAjzuXa1s3ECaKJ5q+7ko70y7nVg2Bcl5lXfAXOBg
         3hRBoe38MdzN8/IODHHW7Kibn1MYyZiBtiy6GQ6UGAkKo9tPCVWiMrHzdUCoPNbs9cfH
         EXXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=MZc0sC0tZXLovBuSiumccirCyb9sz6BRuca3GWfCr3E=;
        b=AFP9eeVLKJCC8wao7jEKyaNpUXH/PgimX1m8Hq7xma7wjo9KfKCDKk5URAZsBt15qO
         DmmyWeTwQARlle87VIi5/bnCJQ1YdjyiGiDAu/+BdN4WojCGdYEwchXAYD9xt3vPupNy
         KB8mA9p3epTJpgiHOzW4hlVODRB8R7K0jLv6raJUaaglCv+qqX2+TQpb0JuUdv2W+XGU
         fHOi5BCWIewa+kQQY6DRJ186tW/TphE1lD/5l4jGU1xpivEAM5eJTLfLKZxUjKPqefvl
         fmvlhJz7MRVVFU6ycGGogiN0mh11Yc3gJ25znZ0Pl44OJ83Vl/N1QwU6vq+sQ7eBQRhs
         IuWA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y128si26402qke.369.2019.09.13.01.37.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 13 Sep 2019 01:37:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:41317 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i8h4y-0005t1-VA
	for alex.bennee@linaro.org; Fri, 13 Sep 2019 04:37:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46392)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eric.auger@redhat.com>) id 1i8h4d-0005iE-GG
 for qemu-arm@nongnu.org; Fri, 13 Sep 2019 04:37:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eric.auger@redhat.com>) id 1i8h4c-0008BO-FI
 for qemu-arm@nongnu.org; Fri, 13 Sep 2019 04:36:59 -0400
Received: from mx1.redhat.com ([209.132.183.28]:43044)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eric.auger@redhat.com>)
 id 1i8h4c-0008BA-AD; Fri, 13 Sep 2019 04:36:58 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id A2DE410C0922;
 Fri, 13 Sep 2019 08:36:57 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-33.ams2.redhat.com [10.36.116.33])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4661D60F80;
 Fri, 13 Sep 2019 08:36:53 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, peter.maydell@linaro.org, pbonzini@redhat.com,
 alex.williamson@redhat.com, peterx@redhat.com
Date: Fri, 13 Sep 2019 10:36:13 +0200
Message-Id: <20190913083615.14719-5-eric.auger@redhat.com>
In-Reply-To: <20190913083615.14719-1-eric.auger@redhat.com>
References: <20190913083615.14719-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.66]); Fri, 13 Sep 2019 08:36:57 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v1 4/6] vhost: assert on
 memory_region_register_iommu_notifier() failure
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
Cc: mst@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 9XavnDIzvso8

memory_region_register_iommu_notifier now returns an error
in case of failure. Assert in such a case.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 hw/virtio/vhost.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
index 34accdf615..9b5551fc4d 100644
--- a/hw/virtio/vhost.c
+++ b/hw/virtio/vhost.c
@@ -696,7 +696,7 @@ static void vhost_iommu_region_add(MemoryListener *li=
stener,
     iommu->iommu_offset =3D section->offset_within_address_space -
                           section->offset_within_region;
     iommu->hdev =3D dev;
-    memory_region_register_iommu_notifier(section->mr, &iommu->n);
+    assert(!memory_region_register_iommu_notifier(section->mr, &iommu->n=
));
     QLIST_INSERT_HEAD(&dev->iommu_list, iommu, iommu_next);
     /* TODO: can replay help performance here? */
 }
--=20
2.20.1

