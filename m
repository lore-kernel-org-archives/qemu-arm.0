Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp987542wrv;
        Thu, 11 Jul 2019 10:41:24 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwT3A8LjFU1mUxfuLrZVifNUwRLbQlxYIi50yYXB6zvtknQkIBJjBM1KnUdGPPAQRM40i9s
X-Received: by 2002:a17:906:ad82:: with SMTP id la2mr4415305ejb.123.1562866884752;
        Thu, 11 Jul 2019 10:41:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562866884; cv=none;
        d=google.com; s=arc-20160816;
        b=Il1txX5KrM1sJF5o7fKEZHPiiSj78EQCf5c4eYcN6VCkktqS3ZO/ZPZDpPT50fZspj
         QzmY3+KFdBJvxcNHUkAc5ojQbcCPvQfJooJGsNIN7qxkTwhh/hIGexZaFddpfh7prHlV
         QSX5meVVe3WNLTaz+ecF5xGA823yviosv+sKNx91Z8TynHRCbRVSqmQkZSEEMd70l+rU
         V1oB9VUbEXLOIWwr9k3ny1qA1CH3u2CmoZSTrudW/xU4Ubn9EmUBZg8syARVRb5tDGjU
         v6/K99j8dagtr7BcUqxbC7B+WUwSebuzHJtMkQMe7lBkcO0/BAPOJx46kTzj/T6o+wa4
         KzKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=6jO7T4BL2LuxkL5QxXARnEjMBWv8CC5yu5Imj8SDAZc=;
        b=WU0tazEi4s/8+9ZeXmUf8EUYxd0B7idkSRBLqUOXJ7UubYlZNL/tKAcyPw8jbJ5fW0
         G/dLPEcO5rkt9FILsDLVAhGVqpDPFxgCh8ZSsdZEXY2WxdDsSZvWG7oQGuwJZqvb4rUM
         4C7T0lZtCS7Z+3WHc/kN4bF166Ef2RvALSH3GGANTl/OeuO0ycAaaziHwLGGSa0Pl40R
         VrszQEqjM74ZZ9hShG/b2/VevEzY2tOYy0pks/myxNUQxjyqUk03YdeTf4LEzJz4Xdi0
         qitlBau2K0Voe2IVWt54InpreDbGXTYDFmfgc7AIp2aGhJ5YVnJVXGciSaiwktH0uk8O
         Oi0g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p39si4083834edc.343.2019.07.11.10.41.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 11 Jul 2019 10:41:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:44164 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hld4N-0004xO-Dy
	for alex.bennee@linaro.org; Thu, 11 Jul 2019 13:41:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38279)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <eric.auger@redhat.com>) id 1hld4G-0004k6-Gj
 for qemu-arm@nongnu.org; Thu, 11 Jul 2019 13:41:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eric.auger@redhat.com>) id 1hld4E-0004pS-An
 for qemu-arm@nongnu.org; Thu, 11 Jul 2019 13:41:16 -0400
Received: from mx1.redhat.com ([209.132.183.28]:50590)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eric.auger@redhat.com>)
 id 1hld41-0004aO-1T; Thu, 11 Jul 2019 13:41:05 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 22D8A3082B6D;
 Thu, 11 Jul 2019 17:40:46 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-46.ams2.redhat.com [10.36.116.46])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EB4BA6092E;
 Thu, 11 Jul 2019 17:40:33 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, peter.maydell@linaro.org
Date: Thu, 11 Jul 2019 19:39:13 +0200
Message-Id: <20190711173933.31203-10-eric.auger@redhat.com>
In-Reply-To: <20190711173933.31203-1-eric.auger@redhat.com>
References: <20190711173933.31203-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.45]); Thu, 11 Jul 2019 17:40:46 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [RFC v5 09/29] memory: Add IOMMU_ATTR_MSI_TRANSLATE
 IOMMU memory region attribute
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
X-TUID: 2CuHHiUeW9SO

We introduce a new IOMMU Memory Region attribute, IOMMU_ATTR_MSI_TRANSLAT=
E
which tells whether the virtual IOMMU translates MSIs. ARM SMMU
will expose this attribute since, as opposed to Intel DMAR, MSIs
are translated as any other DMA requests.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 include/exec/memory.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/exec/memory.h b/include/exec/memory.h
index e477a630a8..593ef947c6 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -206,6 +206,7 @@ struct MemoryRegionOps {
 enum IOMMUMemoryRegionAttr {
     IOMMU_ATTR_SPAPR_TCE_FD,
     IOMMU_ATTR_VFIO_NESTED,
+    IOMMU_ATTR_MSI_TRANSLATE,
 };
=20
 /**
--=20
2.20.1

