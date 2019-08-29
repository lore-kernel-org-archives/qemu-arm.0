Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp1856530wrs;
        Thu, 29 Aug 2019 02:02:09 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyMIkeKQXhDSQ+aFiasD4McRZd3vYCJKWCFYs0HmfoKrEDe3SFJXqXR94lagXQhUtYSc32m
X-Received: by 2002:aed:27d5:: with SMTP id m21mr8503388qtg.153.1567069329837;
        Thu, 29 Aug 2019 02:02:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1567069329; cv=none;
        d=google.com; s=arc-20160816;
        b=iB7aphb/X7DOqiMi6bkdtn3GTGQehWiZ1BSTH9oRDW/06FH1anDj3n/NhN/7SkdAED
         xMAHkZH3gnsATC5hbJHtIoSM8xtuoh+5juMCRS6LggbO06KHgDLmUBuIBs9Acwo9sQh4
         8xRq5F6ZHxRksHy6iYvkWGq92DDzoXm83UlYlntMF2ToX1y/SOAT/mp41Eyik2SKuK0m
         aFkCmKgvNzyNibhwg/4/u/LVYLbHlRJx9h8ntFdDcltpIb5QQYQH5sP+BASrltQk0AzG
         7F89RFyYF5xtbt1rocAqnFbvDx0EuQDGbrjvH5MwDKVAWXQ80kC/j7ylckQN/roDyGmh
         tWPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from;
        bh=6GwKmzj2JPa9S+nWT7hdo0YWpwgxR5SzU/1FKsmqwnE=;
        b=yxyBa1oQqQpHvrObyehbnOmJJhh/yTvUEnsRU3mhg94N4z4ePhIVonjFJiswy3CnSG
         UUT7s/cG5cBvghHyIUPoEQpx6sD9+SOedZY7noKCpFTkCb+tpmXjsCs4b6MhBCvNdV0C
         oyGiLzgKRcrZAFUqcFQodgkEg40yvZTOXlNwUnl9HEr6rKeKhM4iDCRs2JMqRsf3XDyO
         aB7G+AMoNeDHoKaowCbVZ8jix5Y1IQDcsEMAGCrJHffyMmfamLpimthRN05Y/S2E+64r
         SyJn4xf6klNnVbRHKKJORQq4RaMD3YSzg4ajGffUD7Koq1/GLHaOq3kjhT8MqP0qyASD
         4dUQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c6si1380945qkb.154.2019.08.29.02.02.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 29 Aug 2019 02:02:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:47028 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i3GJj-0001oF-Te
	for alex.bennee@linaro.org; Thu, 29 Aug 2019 05:02:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33142)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eric.auger@redhat.com>) id 1i3GJY-0001o6-3y
 for qemu-arm@nongnu.org; Thu, 29 Aug 2019 05:01:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eric.auger@redhat.com>) id 1i3GJW-0000w4-Qw
 for qemu-arm@nongnu.org; Thu, 29 Aug 2019 05:01:55 -0400
Received: from mx1.redhat.com ([209.132.183.28]:57936)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eric.auger@redhat.com>)
 id 1i3GJW-0000vL-JA; Thu, 29 Aug 2019 05:01:54 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id C2B5183F3B;
 Thu, 29 Aug 2019 09:01:53 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-105.ams2.redhat.com [10.36.116.105])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 850F61001B09;
 Thu, 29 Aug 2019 09:01:43 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, peter.maydell@linaro.org, pbonzini@redhat.com,
 alex.williamson@redhat.com
Date: Thu, 29 Aug 2019 11:01:39 +0200
Message-Id: <20190829090141.21821-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.27]); Thu, 29 Aug 2019 09:01:53 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v5 0/2] VFIO/SMMUv3: Fail on VFIO/HW nested
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
X-TUID: hIreaQliOcYR

As of today when a guest is assigned with a host PCI device and
an SMMUv3, VFIO calls memory_region_iommu_replay() default
implementation. This translates the whole address range and
completely stalls the execution. As VFIO/SMMUv3 integration
is not supported yet (it requires SMMUv3 HW nested paging), let's
recognize this situation and fail.

Best Regards

Eric

This series can be found at:
https://github.com/eauger/qemu/tree/v4.1.0_smmu_vfio_fail_v5

History:

v4 -> v5:
- v4 patches: 1, 4, 5 were upstreamed separately
- IOMMU_ATTR_HW_NESTED_PAGING renamed into
  IOMMU_ATTR_NEED_HW_NESTED_PAGING

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


Eric Auger (2):
  memory: Add IOMMU_ATTR_NEED_HW_NESTED_PAGING IOMMU memory region
    attribute
  hw/vfio/common: Fail on VFIO/HW nested paging detection

 hw/arm/smmuv3.c       | 12 ++++++++++++
 hw/vfio/common.c      | 10 ++++++++++
 include/exec/memory.h |  8 +++++++-
 3 files changed, 29 insertions(+), 1 deletion(-)

--=20
2.20.1

