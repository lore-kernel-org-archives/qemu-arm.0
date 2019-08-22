Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp1056242wrs;
        Thu, 22 Aug 2019 10:24:25 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxOJi1wlA69IxyYOrgSYmqz/QLVisqy9nAWdfOoH9ZG1B0gFkvXtM/PbM8CfO1knh7k9yoI
X-Received: by 2002:a17:906:4813:: with SMTP id w19mr352869ejq.89.1566494665447;
        Thu, 22 Aug 2019 10:24:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566494665; cv=none;
        d=google.com; s=arc-20160816;
        b=kd5OcKChc9MpNWqU9gYUleRtADAaj4NfuFB2NjjxYNx3Du5ZuLRx4e7BumuOWaWcnC
         cwwtGt5TusiKqX7R0SfUXiegm9XL4aBhdqAQIqZJlNgi+5tHjzdrOl01ug1+ro2Qja5h
         BSVs/bUGFyJudZnkkdU4hz0971+PmIDl0rjPkYO+7KFj+y+eSHffYpZ5wJGA+7Zo3U8H
         lr2ALg3xKKYdkZHJBCs6pf64UqAZnzpi95Grw1Xz2weuZYONbLMlQ4CwjlgaReSEh8Rr
         jn4mUcQFxJDMxIo7802AaXTfY4St37Tyac/m2ibGbT3lgHt1mdv2PMy4BaFQrs1sI9iF
         yjcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from;
        bh=dzXMN4pRc6f9WsSV+A1I1goW01qP3NFe/CT1pJ2YwJE=;
        b=aRMdFcL1Si2tRPSUU2FJ1Zmo7gJQaODHGr3WR+bfrZDW1g3T0n2Ex+B3anFo0i+6/F
         bfHf+iDI0cPMIXqNWdRyU7Jnz6nMfQ7fML8vKxAJouEw52Lls9KaZQMPkhY66Rzin+at
         f7q2qMyhR5tv/G9aLkXt/m+C6dA0bi09yY12wW3YyZgmWnq9Tfi+yA1BZbtGzYXpmxND
         kcoA+XTeJCvZyP5BNZO1ADMo2/CQ78jfEXQKziscSuYSAN8GfWKRm3DaDpHB2MffT8Ij
         cku5kWBOkF7ld0du43IUj9tnPiu+ZrnFTbGxzzJATwjJHWQlzOq/9VorZRatRMjQtvm/
         OE2A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a11si121412eju.32.2019.08.22.10.24.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 22 Aug 2019 10:24:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:46602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i0qox-0005iX-Gd
	for alex.bennee@linaro.org; Thu, 22 Aug 2019 13:24:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35477)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eric.auger@redhat.com>) id 1i0qoi-0005bK-Qb
 for qemu-arm@nongnu.org; Thu, 22 Aug 2019 13:24:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eric.auger@redhat.com>) id 1i0qog-000304-LE
 for qemu-arm@nongnu.org; Thu, 22 Aug 2019 13:24:07 -0400
Received: from mx1.redhat.com ([209.132.183.28]:39536)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eric.auger@redhat.com>)
 id 1i0qog-0002y8-Ds; Thu, 22 Aug 2019 13:24:06 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id B040F10C696D;
 Thu, 22 Aug 2019 17:24:03 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-105.ams2.redhat.com [10.36.116.105])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E467760603;
 Thu, 22 Aug 2019 17:23:56 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, peter.maydell@linaro.org, peterx@redhat.com,
 pbonzini@redhat.com, alex.williamson@redhat.com
Date: Thu, 22 Aug 2019 19:23:45 +0200
Message-Id: <20190822172350.12008-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.65]); Thu, 22 Aug 2019 17:24:03 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v4 0/5] ARM SMMUv3: Fix spurious notification
 errors and fail with VFIO
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
X-TUID: z6ekccD+qqWG

As of today when a guest is assigned with a host PCI device and
an SMMUv3, VFIO calls memory_region_iommu_replay() default
implementation. This translates the whole address range and
completely stalls the execution. As VFIO/SMMUv3 integration
is not supported yet (it requires SMMUv3 HW nested paging), let's
recognize this situation and fail.

Also the series silences some spurious translation configuration
decoding errors (STE out of span or invalid STE) that may happen
on guest IOVA invalidation notifications.

Best Regards

Eric

This series can be found at:
https://github.com/eauger/qemu/tree/v4.1.0_smmu_vfio_fail_v4

History:

v3 -> v4:
- see individual patches

v2 -> v3:
- squash IOMMU_ATTR_VFIO_NESTED introduction and SMMUv3 usage
- assert when recognizing VFIO/NESTED case
- collect R-bs

v1 -> v2:
- Added "memory: Remove unused memory_region_iommu_replay_all()" &
  "hw/arm/smmuv3: Log a guest error when decoding an invalid STE"
- do not attempt to implement replay Cb but rather remove the call
  in case it is not needed
- explain why we do not remove other log messages on config decoding

Eric Auger (5):
  memory: Remove unused memory_region_iommu_replay_all()
  memory: Add IOMMU_ATTR_HW_NESTED_PAGING IOMMU memory region attribute
  hw/vfio/common: Fail on VFIO/HW nested paging detection
  hw/arm/smmuv3: Log a guest error when decoding an invalid STE
  hw/arm/smmuv3: Remove spurious error messages on IOVA invalidations

 hw/arm/smmuv3-internal.h |  1 +
 hw/arm/smmuv3.c          | 30 +++++++++++++++++++++++-------
 hw/vfio/common.c         | 10 ++++++++++
 include/exec/memory.h    | 18 +++++++-----------
 memory.c                 |  9 ---------
 5 files changed, 41 insertions(+), 27 deletions(-)

--=20
2.20.1

