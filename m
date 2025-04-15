Received: by 2002:a17:504:14cd:b0:1be9:327d:8ee3 with SMTP id g13csp2497011njc;
        Tue, 15 Apr 2025 01:15:57 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXWKKi6sC1VnzlZMa/tEWbrDBrRMh9tNSAKkVJewcFM8TVeb0qlYlbieYyOOtsU3FhvHqx3yrc1zEXLiQ==@linaro.org
X-Google-Smtp-Source: AGHT+IEUHHzTYoiPa9BnPloFKjbYovCwKKVfewo7VjtILUc0Or7xr9Ft1/7SjWCwmgxvlal/58Or
X-Received: by 2002:a05:6214:c8b:b0:6eb:2e88:d47b with SMTP id 6a1803df08f44-6f230d227c0mr218457076d6.17.1744704957449;
        Tue, 15 Apr 2025 01:15:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1744704957; cv=none;
        d=google.com; s=arc-20240605;
        b=DRqpLvR3qANGQxsaQs84orUhvxlSZ8X4iHXduALfRZa6c37ZZ5h8hYTamOQzOZ0Qrx
         JQtidSAYvR4EdtbZSQ14hqNmM7ioDVHRywF1vuD4EIzkSJYdVioH+4m6CVm+fSdB4OTr
         UEeEVdrhgTNF8k3e4bI7lU7ihx7C7+4qOuR1KSNmiD8205i6C6TYKBR63zYOlsZjRFpC
         c8o8xfMLf8F5OBne5gUlU3CH+fecEb3fJrD5YT9zOhouZ2n5ud8xfFTqPw4OweGb0dGr
         4i8uFV3JZn9Px4moDRlyiGUe4yC0I00P7A5G1hwn/4XLiQYAN53p8S2jKvfdhHys8tuy
         fhYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to;
        bh=XQRw8vXle/5TJbL5d+jxs3wSq5MJw+Myt2XREnwV3pA=;
        fh=PnSw404jJ+s1m+rSaKsD+X9lt69JOcV3ATg/BWbrXZg=;
        b=JT9mzZR3P7NVWNiywLTL5BtHLeK9ZsgqvfKr4LisT72Isslb8YRAYcqwwtReuWKqsN
         QtD0QIBPZF+2oRqWBunLPQpXRDbPDsdteHShnC3B6JbueEtuIkJ5MYCwq9/Dkn7T4umI
         K5abLQrTGxyJWFItDTndqp2yg0/fEY3ltCtsdHMXT17sdmDf2xMkVZjUSvV6g3qgoGA0
         j3XokV7JYmZLkk0Z1dnxt7eftiHAe6Hk5hzHJol2UnBCguNaePbImPyFb0pxolupj91R
         Wny3Y5x0wRWo0kmB+8tc0cSLyUWD7+4fkcErXbLDK5/FKYWu4TUQ978K3Jtu2qPXshdd
         1weA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6f0dea12d57si123519896d6.502.2025.04.15.01.15.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 15 Apr 2025 01:15:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1u4bOv-0003SS-Ju; Tue, 15 Apr 2025 04:12:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1u4bOq-0003Hn-Un; Tue, 15 Apr 2025 04:12:08 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1u4bOl-0001o4-Po; Tue, 15 Apr 2025 04:12:07 -0400
Received: from mail.maildlp.com (unknown [172.18.186.216])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4ZcGwq52Ssz6K9S3;
 Tue, 15 Apr 2025 16:07:39 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
 by mail.maildlp.com (Postfix) with ESMTPS id 83189140593;
 Tue, 15 Apr 2025 16:11:50 +0800 (CST)
Received: from A2303104131.china.huawei.com (10.203.177.241) by
 frapeml500008.china.huawei.com (7.182.85.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 15 Apr 2025 10:11:43 +0200
To: <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>
CC: <eric.auger@redhat.com>, <peter.maydell@linaro.org>, <jgg@nvidia.com>,
 <nicolinc@nvidia.com>, <ddutile@redhat.com>, <berrange@redhat.com>,
 <nathanc@nvidia.com>, <mochs@nvidia.com>, <smostafa@google.com>,
 <linuxarm@huawei.com>, <wangzhou1@hisilicon.com>, <jiangkunkun@huawei.com>,
 <jonathan.cameron@huawei.com>, <zhangfei.gao@linaro.org>
Subject: [PATCH 0/5] Add support for user creatable SMMUv3 device 
Date: Tue, 15 Apr 2025 09:10:59 +0100
Message-ID: <20250415081104.71708-1-shameerali.kolothum.thodi@huawei.com>
X-Mailer: git-send-email 2.12.0.windows.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.203.177.241]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 frapeml500008.china.huawei.com (7.182.85.71)
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=shameerali.kolothum.thodi@huawei.com;
 helo=frasgout.his.huawei.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) AC_FROM_MANY_DOTS=2.499, BAYES_00=-1.9,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-TUID: rDSpMxdu6DO6

Hi All,

This patch series introduces support for a user-creatable SMMUv3 device
(-device arm-smmuv3-dev) in QEMU.

The implementation is based on feedback received from the RFCv2[0]:
"hw/arm/virt: Add support for user-creatable accelerated SMMUv3"

Currently, QEMU's SMMUv3 emulation (iommu=smmuv3) is tied to the machine
and does not support instantiating multiple SMMUv3 devices—each associated
with a separate PCIe root complex. In contrast, real-world ARM systems
often include multiple SMMUv3 instances, each bound to a different PCIe
root complex.

This also lays the groundwork for supporting accelerated SMMUv3, as
proposed in the aforementioned RFC. Please note, the accelerated SMMUv3
support is not part of this series and will be sent out as a separate
series later on top of this one.

Summary of changes:

 -Introduces support for multiple -device arm-smmuv3-dev,bus=pcie.x
  instances.

  Example usage:

  -device arm-smmuv3-dev,bus=pcie.0
  -device virtio-net-pci,bus=pcie.0
  -device pxb-pcie,id=pcie.1,bus_nr=2
  -device arm-smmuv3-dev,bus=pcie.1
  -device pcie-root-port,id=pcie.port1,bus=pcie.1
  -device virtio-net-pci,bus=pcie.port1

  -Supports either the legacy iommu=smmuv3 option or the new
  "-device arm-smmuv3-dev" model.

  -Adds device tree bindings for the new SMMUv3 device on the arm/virt
   machine only, and only for the default pcie.0 root complex.
   (Note: pxb-pcie root complexes are currently not supported with the
    device tree due to known limitations[1].)
  -Restricts usage of the new SMMUv3 device to virt machine versions > 9.2.
   This is to avoid creating new smmuv3 device for old virt machine versions
   and accidently breaking the migration support.

Please take a look and let me know your feedback.

Thanks,
Shameer
[0]:https://lore.kernel.org/qemu-devel/20250311141045.66620-1-shameerali.kolothum.thodi@huawei.com/
[1]:https://lore.kernel.org/qemu-devel/20230421165037.2506-1-Jonathan.Cameron@huawei.com/

Shameer Kolothum (5):
  hw/arm/smmuv3: Introduce SMMUv3 device
  hw/arm/virt-acpi-build: Update IORT for multiple smmuv3 devices
  hw/arm/virt: Factor out common SMMUV3 dt bindings code
  hw/arm/virt: Add support for smmuv3 device
  hw/arm/smmuv3: Enable smmuv3 device creation

 hw/arm/smmuv3.c          |  55 ++++++++++++++++++
 hw/arm/virt-acpi-build.c | 119 +++++++++++++++++++++++++++++++++++----
 hw/arm/virt.c            | 109 ++++++++++++++++++++++++++---------
 hw/core/sysbus-fdt.c     |   3 +
 include/hw/arm/smmuv3.h  |  16 ++++++
 include/hw/arm/virt.h    |   2 +
 6 files changed, 266 insertions(+), 38 deletions(-)

-- 
2.34.1

