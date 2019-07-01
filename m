Received: by 2002:a5d:6790:0:0:0:0:0 with SMTP id v16csp2445844wru;
        Mon, 1 Jul 2019 02:31:40 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzjepyRUviuL0v13m1O+BIR2VT5qoDd4o3nHKnNjVI9rvqmaABLBBOEiuU+qtbpj+pG807x
X-Received: by 2002:a17:906:27c7:: with SMTP id k7mr22011852ejc.91.1561973500121;
        Mon, 01 Jul 2019 02:31:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1561973500; cv=none;
        d=google.com; s=arc-20160816;
        b=mKHl2RyVFcNtJvtbWg00j9h7vNBjthvkOeExzNT1nFewnCSQ1Hv05+tyHfmAU7z+HI
         WQSgXrftLSePFCQp3Vz+MTXP2vtSZ0Op0iu0ahJBni2BipjCOE4l45Rj0sarEu107K2O
         3ca1EudaeALmwcf7HRvmC2yKKIKyd4plUJ4akeuQbnu4gP/KdhuRrr1CzPCRwcRYU3xT
         maux0ZIGpBhzPe5TtcdRBLvGg4Tcz5YoMXn1mLskm/7YE9CTvhoE1vlsXsXUIoojGK2Y
         ZAj3HvZFInOvwfILsHbtku7Rx0QM5pqDCBMNPnZp+822qtk/i9PqiWy0cf0clwUw6yYA
         sRjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from;
        bh=bmEy38VtCAK5jPRtsmvFMaRktpZiZJoOw7HovHC++Ho=;
        b=Ldr09GlBvMtkfJW5iRE88NcjiWwq8MByXVk4OI5Pp68ep4WzLMJy9OVVN5lhcUmF/9
         krY8NGVhjMsvGjHZ4oeU82G+tliJoDvKfjTG4wsYE27s+RyVZ4JmqHx1BK3ytpmX3G69
         ZuKnA9f6MG9QrCA+tQ9QyAfFdUvOXdWbw78abuO9hC0PteHg9ZTfEH52poofnOYEmwVj
         A//b6G/RhLBo/iHgOG82Kdeogg7XaW22cfRPUQKhCLrmZMO5en55pPdZl8jUzSZ7IMAL
         CuhT6SyvZJg7RzJ0NF2FZGAtkNG9+5k5fMM80c1/TcKDODhsXGYCCaKRS+L65wG3qHzp
         o2cA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e26si8726700edd.294.2019.07.01.02.31.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 01 Jul 2019 02:31:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:56430 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hhsex-0002KA-1N
	for alex.bennee@linaro.org; Mon, 01 Jul 2019 05:31:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49540)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <eric.auger@redhat.com>) id 1hhsee-0002Ip-9E
 for qemu-arm@nongnu.org; Mon, 01 Jul 2019 05:31:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eric.auger@redhat.com>) id 1hhsec-0000Jz-08
 for qemu-arm@nongnu.org; Mon, 01 Jul 2019 05:31:20 -0400
Received: from mx1.redhat.com ([209.132.183.28]:54902)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eric.auger@redhat.com>)
 id 1hhseY-0008NE-5m; Mon, 01 Jul 2019 05:31:15 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 8F2A981F1B;
 Mon,  1 Jul 2019 09:30:50 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-89.ams2.redhat.com [10.36.116.89])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 30618BA4D;
 Mon,  1 Jul 2019 09:30:39 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, peter.maydell@linaro.org, peterx@redhat.com,
 pbonzini@redhat.com, alex.williamson@redhat.com
Date: Mon,  1 Jul 2019 11:30:28 +0200
Message-Id: <20190701093034.18873-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.27]); Mon, 01 Jul 2019 09:30:50 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v2 0/6] ARM SMMUv3: Fix spurious notification
 errors and stall with vfio-pci
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
X-TUID: ByZuwN/jymgE

This series fixes the guest stall observed when attempting to run
a guest exposed with a SMMUv3 and a VFIO-PCI device. As a reminder
SMMUv3 is not yet integrated with VFIO (the device will not work
properly) but this shouldn't prevent the guest from booting.

It also silences some spurious translation configuration decoding
errors (STE out of span or invalid STE) that may happen on guest IOVA
invalidation notifications.

Best Regards

Eric

History:

v1 -> v2:
- Added "memory: Remove unused memory_region_iommu_replay_all()" &
  "hw/arm/smmuv3: Log a guest error when decoding an invalid STE"
- do not attempt to implement replay Cb but rather remove the call
  in case it is not needed
- explain why we do not remove other log messages on config decoding

Eric Auger (6):
  memory: Remove unused memory_region_iommu_replay_all()
  memory: Add IOMMU_ATTR_VFIO_NESTED IOMMU memory region attribute
  hw/vfio/common: Do not replay IOMMU mappings in nested case
  hw/arm/smmuv3: Advertise VFIO_NESTED
  hw/arm/smmuv3: Log a guest error when decoding an invalid STE
  hw/arm/smmuv3: Remove spurious error messages on IOVA invalidations

 hw/arm/smmuv3-internal.h |  1 +
 hw/arm/smmuv3.c          | 26 ++++++++++++++++++++------
 hw/vfio/common.c         |  7 ++++++-
 include/exec/memory.h    | 13 ++-----------
 memory.c                 |  9 ---------
 5 files changed, 29 insertions(+), 27 deletions(-)

--=20
2.20.1

