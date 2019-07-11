Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp990281wrv;
        Thu, 11 Jul 2019 10:44:18 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzaY0vvnlwmlOSt8yq71iF1dZl4WhjCU0yrjktfVRznNQ8sioKIKpam+G2O3Te/rZ5qpUSS
X-Received: by 2002:a17:906:ece7:: with SMTP id qt7mr4375013ejb.155.1562867058375;
        Thu, 11 Jul 2019 10:44:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562867058; cv=none;
        d=google.com; s=arc-20160816;
        b=CcIzqaJGEQXsAIUc+9OMwV1Sb3nasB5oKsFPNr99Zwz7gKoTBX8IvNrEuujdpNmB8e
         PF7ohMVd9Ur4KwxjFW8tBsF5OaP4+VV1TDCqKt/d8N5YtepXe3L/KWWaVt3bLGrBIg8P
         rlrU3NZpTacPSTomqO1JmOSlAcwS6AyWTGeU2/cBddRMZ0Yyl+oMKzVm1CKGo7hBTjGI
         523+3UmuCruMjw6LobFInA/eNIaVj123yzzmZaMUBZVYxFgcbChQyRFQ4+5ZnrAQ5HoU
         oUZjTl2PZn8zWVlhjTBY2xD4+Psk9EHFkAlyT5Euy4S5m3Pnv2Ye+rt70AR45hb7JTif
         gCCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=iM38rwHjKxjlYS4n98uSg5O+AEQyqmQMK7TZaEUsvZA=;
        b=g8Oon4GvtRK7+9SarY0FLXj3JSWrj2HUVy/CnAq2Idzj0CNwPr9/j8LxgzHPvDyTjZ
         3CGeQEzIBdxS5EXLeJnE+aY8b5OPViM7Kp0PPgCyjpuuv3RD7/x62lQUThUFL45MbM4g
         maH9oJXJCN9bDluQMpTPrwiJnrkgF5VJJuV8VNkv0uBSVu4mHjquMZxwYKDtcwruxKvl
         qYVwGqrI17fxkztmROooEraQbmMlBAIepJxLxaQ5HkAW+Nro3VGCUv8Ow8kc7QsG09Tm
         Hfgk5tQSNK2Pmvu5MTDMCeqBvp8yrQpefXBLrnkRLsVnJ8PSfhaWA4Kbfd7JQsuiDG8C
         0O9Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 46si4089266eds.445.2019.07.11.10.44.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 11 Jul 2019 10:44:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:44284 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hld78-0000i8-W7
	for alex.bennee@linaro.org; Thu, 11 Jul 2019 13:44:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39101)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <eric.auger@redhat.com>) id 1hld5Y-0002Dm-Qj
 for qemu-arm@nongnu.org; Thu, 11 Jul 2019 13:42:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eric.auger@redhat.com>) id 1hld5X-0006FB-Kq
 for qemu-arm@nongnu.org; Thu, 11 Jul 2019 13:42:36 -0400
Received: from mx1.redhat.com ([209.132.183.28]:36328)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eric.auger@redhat.com>)
 id 1hld5X-0006Cg-Ez; Thu, 11 Jul 2019 13:42:35 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 05F19308A98D;
 Thu, 11 Jul 2019 17:42:33 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-46.ams2.redhat.com [10.36.116.46])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 113B960600;
 Thu, 11 Jul 2019 17:42:29 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, peter.maydell@linaro.org
Date: Thu, 11 Jul 2019 19:39:29 +0200
Message-Id: <20190711173933.31203-26-eric.auger@redhat.com>
In-Reply-To: <20190711173933.31203-1-eric.auger@redhat.com>
References: <20190711173933.31203-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.41]); Thu, 11 Jul 2019 17:42:33 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [RFC v5 25/29] hw/arm/smmuv3: Fill the IOTLBEntry
 arch_id on NH_VA invalidation
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
X-TUID: EAKCBFeeszxC

When the guest invalidates one S1 entry, it passes the asid.
When propagating this invalidation downto the host, the asid
information also must be passed. So let's fill the arch_id field
introduced for that purpose.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 hw/arm/smmuv3.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
index f7497de9e4..8c88923f73 100644
--- a/hw/arm/smmuv3.c
+++ b/hw/arm/smmuv3.c
@@ -824,6 +824,7 @@ static void smmuv3_notify_iova(IOMMUMemoryRegion *mr,
     entry.iova =3D iova;
     entry.addr_mask =3D (1 << tt->granule_sz) - 1;
     entry.perm =3D IOMMU_NONE;
+    entry.arch_id =3D asid;
=20
     memory_region_notify_one(n, &entry);
 }
--=20
2.20.1

