Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp977574wrv;
        Thu, 11 Jul 2019 10:30:27 -0700 (PDT)
X-Google-Smtp-Source: APXvYqz4mkMJ/65NUh8SHNpuiNNR8txPUNU84INCHLG70/tSe1aV2NXeI4ich7P/mtlVOJfUHBKu
X-Received: by 2002:aa7:c554:: with SMTP id s20mr4640651edr.209.1562866227942;
        Thu, 11 Jul 2019 10:30:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562866227; cv=none;
        d=google.com; s=arc-20160816;
        b=sc4lNxX7JwU6gGbhubt5QYBiy+7C1obCX8085cGFieOKzA4UUO0t+MOKKhzs3CCzY9
         oOQgnGVjQmQKN+X3G76BXRKHSfUnNwLbRmfYDdv4bMopjPQ0vc4WdLWIgglN5i0p09lz
         53MD00XihKuRg06JTT3AbU+SUjBIN5YRJ2rFJ8X0Su3kC1blwfNlHCoIP+QQdB2a1lN0
         K9ki+nMWtwr7hfA0KSyIHg68y/f/KI+URs7vJ8gW7VVAVl8/AYLUlSXSwc6RaGlW2Efd
         rgeSZO76UgOx8RS93d8qVppc+ULYs/yCY3Mqqa5xjdd27nbZYInrOC5hycjM+6v3uCwc
         XytQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=6jO7T4BL2LuxkL5QxXARnEjMBWv8CC5yu5Imj8SDAZc=;
        b=WTe+MnZv4iEvGr8LeCYfl66O+jSVubyEyOthB5gwliYDQleF5JSIgHlEGBXX6VgGJh
         kJA/I395uDAWFxQCUiwQCXpa+6Fn6vpQ+B3K1hRyZ/WSJVjVQeTLQDpnFJXTSU1bZqYR
         0CpV0WxMChxVBAcCgY8H0dsHa2VzfI93UzrzMjVg0FTTRu5BiUuF1ElJYMl6dbq5JR9u
         QXdN50WqsieK9kqPNhWv4MxYEykmUD6NjaSK90N0ghueUyvVqpbBpaBCBOtFd+SCbxhh
         ygqHGGk/cS0liqih5LDr3lHl4qWKpbajL/LSq6vfFq65u1he4TFAnHQP8dCQwsPWYmKY
         oKBg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g1si3197690ejc.278.2019.07.11.10.30.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 11 Jul 2019 10:30:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:43826 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hlctm-0007zH-2G
	for alex.bennee@linaro.org; Thu, 11 Jul 2019 13:30:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34101)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <eric.auger@redhat.com>) id 1hlctT-00072H-O1
 for qemu-arm@nongnu.org; Thu, 11 Jul 2019 13:30:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eric.auger@redhat.com>) id 1hlctS-0002RK-MQ
 for qemu-arm@nongnu.org; Thu, 11 Jul 2019 13:30:07 -0400
Received: from mx1.redhat.com ([209.132.183.28]:35718)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eric.auger@redhat.com>)
 id 1hlctS-0002R5-H0; Thu, 11 Jul 2019 13:30:06 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 923E1C049598;
 Thu, 11 Jul 2019 17:30:05 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-46.ams2.redhat.com [10.36.116.46])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6FE285C1B4;
 Thu, 11 Jul 2019 17:29:51 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, peter.maydell@linaro.org
Date: Thu, 11 Jul 2019 19:28:25 +0200
Message-Id: <20190711172845.31035-10-eric.auger@redhat.com>
In-Reply-To: <20190711172845.31035-1-eric.auger@redhat.com>
References: <20190711172845.31035-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.31]); Thu, 11 Jul 2019 17:30:05 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [RFC v4 09/29] memory: Add IOMMU_ATTR_MSI_TRANSLATE
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
X-TUID: O9m0HoVtxQPc

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

