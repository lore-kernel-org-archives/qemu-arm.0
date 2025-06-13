Received: by 2002:a17:504:5d2c:b0:1be9:327d:8ee3 with SMTP id et12csp306840njc;
        Fri, 13 Jun 2025 07:46:43 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXwuUrjZdk29+5glXPRPMevzlNZ5r6RHRj/CXPdiPidvNWheu6Z3ReBtclUIvT4cdbW5lnQiWSPgXcuQw==@linaro.org
X-Google-Smtp-Source: AGHT+IE1Ey4mtnvugtrhcIieJBxDrKLaFg17j2XviRn0CKiWzgTcePPWLILAynoDVtL9X+7QkdV8
X-Received: by 2002:ac8:7d14:0:b0:4a6:f59c:e83d with SMTP id d75a77b69052e-4a739135e7cmr15122881cf.18.1749826003507;
        Fri, 13 Jun 2025 07:46:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1749826003; cv=none;
        d=google.com; s=arc-20240605;
        b=b06jVoG7UVivqx24OrRhjFk+MMpyl0KzHAWE/fAKmXSTgkQM9u3DM0+yUfK3RoRP7c
         KTtp75LqsU/JWsvBwdXa/ghA7zM3DNp3qrYl85w29cyNoPM5kdlWVA3Tu+vbGt8HY7FO
         ArjMgCGKpllgsTQxrzwC8KEcvIbkYPijyecNWBbHTQInb1FeknQLcoL8JKwmprsCp01W
         Zu+L6ShKyi9mjP07OlvK526c+uvX+qTuSI88/cU+G4mHg7U7l1qI4Rjs5S2mrscruoBi
         0KTqF/TjLTgfs+iO4f+ScZu0obdPQ0zcdc0cuTKx/edBbBj/G39N1b80Y3JC4+xVy33I
         EkYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to;
        bh=BBvg0qhQCnu4juFuWas+1sSdaqn6BGrZ5q90ZFcZYQk=;
        fh=12ij1D0xizeHJ+1WEqwo/9QFN2xwslWS8h/2oI6OPA8=;
        b=iZXrckoAkzWPQCmX9TWfWD8MtQ5Z7FYg71SKcNpdpVZhT68KYewhuHyJoRBj6qhSV6
         A6DuHzvO33HPgVkI4xhzC0yaaDIFF6IV+DSLNt3CsDwrQ2by3jLtETt3Qr3GjqSgxX5E
         LwRuuSCYxZcsK+6MW6cXUIe9fEbPwL8gILLsMbv9Xj/qkNTVJOocuEWXN2W6vzOjR7VB
         bbVBNDGuCVe+vK98f7NiHHNRbzOLzN3iZbgy/GcSsoeV6hbbkznKyJKEXyhnhDPQl5vN
         T8GLU3hLIlN5rgnKFLcABv+Eiw1iVpVIL4redJNuJzXJAUPZ9LXwd973kfCXUDKofVkx
         C08g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6fb35ad9ff6si42918906d6.28.2025.06.13.07.46.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 13 Jun 2025 07:46:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uQ5fj-0007l3-AR; Fri, 13 Jun 2025 10:46:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1uQ5fg-0007kl-DX; Fri, 13 Jun 2025 10:46:20 -0400
Received: from [185.176.79.56] (helo=frasgout.his.huawei.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1uQ5fd-0006dp-4T; Fri, 13 Jun 2025 10:46:20 -0400
Received: from mail.maildlp.com (unknown [172.18.186.31])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4bJht82dNMz67Hm8;
 Fri, 13 Jun 2025 22:41:36 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
 by mail.maildlp.com (Postfix) with ESMTPS id 5444A140159;
 Fri, 13 Jun 2025 22:46:01 +0800 (CST)
Received: from A2303104131.china.huawei.com (10.203.177.241) by
 frapeml500008.china.huawei.com (7.182.85.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 13 Jun 2025 16:45:53 +0200
To: <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>
CC: <eric.auger@redhat.com>, <peter.maydell@linaro.org>, <jgg@nvidia.com>,
 <nicolinc@nvidia.com>, <ddutile@redhat.com>, <berrange@redhat.com>,
 <imammedo@redhat.com>, <nathanc@nvidia.com>, <mochs@nvidia.com>,
 <smostafa@google.com>, <linuxarm@huawei.com>, <wangzhou1@hisilicon.com>,
 <jiangkunkun@huawei.com>, <jonathan.cameron@huawei.com>,
 <zhangfei.gao@linaro.org>
Subject: [PATCH v4 0/7] hw/arm/virt: Add support for user creatable SMMUv3
 device
Date: Fri, 13 Jun 2025 15:44:42 +0100
Message-ID: <20250613144449.60156-1-shameerali.kolothum.thodi@huawei.com>
X-Mailer: git-send-email 2.12.0.windows.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.203.177.241]
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-Host-Lookup-Failed: Reverse DNS lookup failed for 185.176.79.56 (deferred)
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=shameerali.kolothum.thodi@huawei.com;
 helo=frasgout.his.huawei.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) AC_FROM_MANY_DOTS=0.916, BAYES_00=-1.9,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Reply-to:  Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
From:  Shameer Kolothum via <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: bLAxBohDkgYo

Hi All,

Changes from v3:
https://lore.kernel.org/qemu-devel/20250602154110.48392-1-shameerali.kolothum.thodi@huawei.com/

Addressed feedback on v3. Thanks to all.
Major changes:
1. Based on Igor's suggestion, moved the associated primary-bus is of type
   TYPE_PCI_HOST_BRIDGE check to smmu-common.
2. Addressed IORT related comments from Eric
3. Picked up T-by tag from Nathan. Thanks for giving it a spin.
4. Added a documents entry for arm-smmuv3.

Cover letter:

This patch series introduces support for a user-creatable SMMUv3 device
(-device arm-smmuv3) in QEMU.

The implementation is based on feedback received from the RFCv2[0]:
"hw/arm/virt: Add support for user-creatable accelerated SMMUv3"

Currently, QEMU's SMMUv3 emulation (iommu=smmuv3) is tied to the machine
and does not support instantiating multiple SMMUv3 devices—each associated
with a separate PCIe root complex. In contrast, real-world ARM systems
often include multiple SMMUv3 instances, each bound to a different PCIe
root complex.

This series allows to specify multiple SMMUv3 instances as below,

 -device arm-smmuv3,primary-bus=pcie.0,id=smmuv3.0
  ...
 -device arm-smmuv3,primary-bus=pcie.1,,id=smmuv3.1

The multiple SMMUv3 instance support lays the groundwork for supporting
accelerated SMMUv3, as proposed in the aforementioned RFCv2[0]. The
proposed accelerated support will be an optional property like below,
-device arm-smmuv3,primary-bus=pcie.1,accel=on,..

Please note, the accelerated SMMUv3 support is not part of this series
and will be sent out as a separate series later on top of this one.

This series also,

-Supports either the legacy iommu=smmuv3 option or the new
  "-device arm-smmuv3" model.
  -Adds device tree bindings for the new SMMUv3 device on the arm/virt
   machine only, and only for the default pcie.0 root complex.
   (Note: pxb-pcie root complexes are currently not supported with the
    device tree due to known limitations[1].)

Example usage:
  -device arm-smmuv3,primary-bus=pcie.0,id=smmuv3.0
  -device virtio-net-pci,bus=pcie.0
  -device pxb-pcie,id=pcie.1,bus_nr=2
  -device arm-smmuv3,primary-bus=pcie.1,id=smmuv3.1
  -device pcie-root-port,id=pcie.port1,bus=pcie.1
  -device virtio-net-pci,bus=pcie.port1

Please take a look and let me know your feedback.

Thanks,
Shameer
[0]:https://lore.kernel.org/qemu-devel/20250311141045.66620-1-shameerali.kolothum.thodi@huawei.com/
[1]:https://lore.kernel.org/qemu-devel/20230421165037.2506-1-Jonathan.Cameron@huawei.com/

Nicolin Chen (1):
  hw/arm/virt: Add an SMMU_IO_LEN macro

Shameer Kolothum (6):
  hw/arm/smmu-common: Check SMMU has PCIe Root Complex association
  hw/arm/virt-acpi-build: Re-arrange SMMUv3 IORT build
  hw/arm/virt-acpi-build: Update IORT for multiple smmuv3 devices
  hw/arm/virt: Factor out common SMMUV3 dt bindings code
  hw/arm/virt: Allow user-creatable SMMUv3 dev instantiation
  qemu-options.hx: Document the arm-smmuv3 device

 hw/arm/smmu-common.c     |   4 +-
 hw/arm/smmuv3.c          |   2 +
 hw/arm/virt-acpi-build.c | 166 +++++++++++++++++++++++++++++++--------
 hw/arm/virt.c            | 108 ++++++++++++++++++-------
 hw/core/sysbus-fdt.c     |   3 +
 include/hw/arm/virt.h    |   1 +
 qemu-options.hx          |   6 ++
 7 files changed, 228 insertions(+), 62 deletions(-)

-- 
2.47.0

