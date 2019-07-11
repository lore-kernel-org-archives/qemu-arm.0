Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp327740wrv;
        Wed, 10 Jul 2019 23:20:37 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzQKsLfFBG8MLj8DII/WA+uM8RVPd48GEwxDgQZOkIhacMYKmenMIRw6SLb/lj1AtteulZq
X-Received: by 2002:a50:f4d8:: with SMTP id v24mr1762254edm.166.1562826037783;
        Wed, 10 Jul 2019 23:20:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562826037; cv=none;
        d=google.com; s=arc-20160816;
        b=PQsqqS7Ri7h9hdcVnaCTJggFyPqJTpRrHjU2VfHI4x0OWHVtUYC/e582EzDtGGSfpY
         3gDH4k1nJTYdrru+TfCTckYPHYpQg5bFbwOEafwyNVzvLub+H0QsolOonW/o0pIxwee6
         1yvnJL6CLES0pfJUCyXvIVfJ/Vls/PWLNVNfEQjx06Tq1/myWPr+MbSucP1MYYVdzisr
         NzcYKlDMeX/ADkmLJBid/XNsYgWg5uowWUYdEcDsGDsaGir1yx28TWkIqPmAQzXPMKBE
         OslMOludEy9FVXCtF5X0A8V7f90nmw6sQxFjA5Cwws6Y4juRq24dtR2ufzxs1jAzEIEY
         QQfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=3RHLSWCVmMxJOL8bGxLrxFoN6xSHaw1M4fO4s2sLPtM=;
        b=Oqr5OAfJWEi6t5FjdzWMzxB6JHWGI6ytlHiGQhQl8N3LzJmTnRqpCDF5lFZt4gpMrZ
         CuQho5qJxmTYUZzo9lgs41uSttky2Ht64m4aMi0Ina5c39mqSyU3IScBmwhGPNd2wLLi
         FqwcRTZacdOMlA5cApOKvrbF4gV8WVubfIoRyDCaLIODd4SvdR4ImmseI9x5OKnC1CS2
         lboJCiJyOm4i+rIbT3fJrlxYW1BORUGQG7MbjFoISI0fub34x00c49br4I4MDbG7TGBL
         WYUZsIugcmz39uH6igAN4K8QYFxODlllpt4ss6G1dSSpIh28uGqDReuYDEvDkRo67vV5
         DeBw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id gy1si2381870ejb.304.2019.07.10.23.20.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 10 Jul 2019 23:20:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:38856 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hlSRY-0007g4-Qg
	for alex.bennee@linaro.org; Thu, 11 Jul 2019 02:20:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41420)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <eric.auger@redhat.com>) id 1hlSQP-0005jJ-TD
 for qemu-arm@nongnu.org; Thu, 11 Jul 2019 02:19:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eric.auger@redhat.com>) id 1hlSQK-0000Jf-LJ
 for qemu-arm@nongnu.org; Thu, 11 Jul 2019 02:19:23 -0400
Received: from mx1.redhat.com ([209.132.183.28]:33956)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eric.auger@redhat.com>)
 id 1hlSQK-0000HC-Bj; Thu, 11 Jul 2019 02:19:20 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id A8AF975726;
 Thu, 11 Jul 2019 06:19:19 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-46.ams2.redhat.com [10.36.116.46])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 78FCD60A97;
 Thu, 11 Jul 2019 06:19:16 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, peter.maydell@linaro.org, peterx@redhat.com,
 pbonzini@redhat.com, alex.williamson@redhat.com
Date: Thu, 11 Jul 2019 08:18:55 +0200
Message-Id: <20190711061857.13086-4-eric.auger@redhat.com>
In-Reply-To: <20190711061857.13086-1-eric.auger@redhat.com>
References: <20190711061857.13086-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.25]); Thu, 11 Jul 2019 06:19:19 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH-for-4.2 v3 3/5] hw/vfio/common: Assert in case of
 nested mode
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
X-TUID: l8mW700LBqOp

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

