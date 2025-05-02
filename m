Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp744660njj;
        Fri, 2 May 2025 03:27:53 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVF2WWVgGCpUE0ArOO3sh6PuZGeoZM66ote/Fea0Csk28DtqfWClIwC9YiiZLP9km/TnE0Ma1zFZCZygw==@linaro.org
X-Google-Smtp-Source: AGHT+IEnp5zPDS7DB77rKtW21c2qaxyWMtXM0ULcRkxfrhEppjFnevcq4rhmjJ1i9e8w99hhRm9j
X-Received: by 2002:a05:6214:224e:b0:6e8:fcc9:a291 with SMTP id 6a1803df08f44-6f51538de61mr45410186d6.23.1746181673748;
        Fri, 02 May 2025 03:27:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746181673; cv=none;
        d=google.com; s=arc-20240605;
        b=R36yBqv+GgqwgALOwqd3HlE8XyQocfWOgISOyoWlWQl/BzZXZcEJ0syPzWedDSEsHA
         PT8ZwKEU5a75+SDdA07zCPKq9W5deNwxHlDfbrjJKYLYNMFbNEO8WfLwPEoB44hDs57i
         7EZ41JvHSsWPp1psIZiCwLnm8CrzFuTW7AOKASANkhqCb2iwlbj3c/ZK45Ki/5KaMoSW
         uc5MfbJZOFp0pE0AN9YF4A+jsxFQTk3pHS2RvIw/2ogH18NGObF7HouifSnLyEV13hrK
         xtJyksioVXxnSN5rrbPJjvmhBFozeI56lQoXWAmKXd9gj7qJOBE8KLXE+ZdfASIyguZx
         RqyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to;
        bh=EOpoK/2qoFnvCCSqj9c//ke0kTmwVvrAICytsbWJlDE=;
        fh=PnSw404jJ+s1m+rSaKsD+X9lt69JOcV3ATg/BWbrXZg=;
        b=c2QOXL8Vc/R16UqTvbEaJYu6aFAiEXy0bfiS6dh/s6GOWajL72xvHXHoqb8uGs1ToO
         CW1Ka4/TEsaZ14Fy7LOsHKzfoJDiHfcyRLSnki5l6BOcu3dPrPgGLE4Uvp7jA0Ags+97
         Qr0gW+fkLjb8tRIePXuboIwUP7hXYTh1+O/zYCvHDPiXKvlgkj9MwNZcEYjfcm3MvJnv
         oFwobM/ZLuOJskTEAgtAqrnW84qjO3tznR0i8fuZnhJoemI00ct2XUIyM8d23J+xEu7S
         vJaPMCEbCK9/9gynF74kSJ/+d0ydvhwzGK6T25mwJoE+995zDA7jpV1S8Z/M9EpE7O0M
         eA8Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6f50f4adf1dsi26737976d6.465.2025.05.02.03.27.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 02 May 2025 03:27:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uAncN-0008Ln-7m; Fri, 02 May 2025 06:27:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1uAncK-0008LW-LK; Fri, 02 May 2025 06:27:40 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1uAncH-0001qs-SZ; Fri, 02 May 2025 06:27:40 -0400
Received: from mail.maildlp.com (unknown [172.18.186.31])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Zpn9h3sB3z67KX2;
 Fri,  2 May 2025 18:25:12 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
 by mail.maildlp.com (Postfix) with ESMTPS id B8C191402ED;
 Fri,  2 May 2025 18:27:23 +0800 (CST)
Received: from A2303104131.china.huawei.com (10.203.177.241) by
 frapeml500008.china.huawei.com (7.182.85.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 2 May 2025 12:27:16 +0200
To: <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>
CC: <eric.auger@redhat.com>, <peter.maydell@linaro.org>, <jgg@nvidia.com>,
 <nicolinc@nvidia.com>, <ddutile@redhat.com>, <berrange@redhat.com>,
 <nathanc@nvidia.com>, <mochs@nvidia.com>, <smostafa@google.com>,
 <linuxarm@huawei.com>, <wangzhou1@hisilicon.com>, <jiangkunkun@huawei.com>,
 <jonathan.cameron@huawei.com>, <zhangfei.gao@linaro.org>
Subject: [PATCH v2 0/6] Add support for user creatable SMMUv3 device 
Date: Fri, 2 May 2025 11:27:01 +0100
Message-ID: <20250502102707.110516-1-shameerali.kolothum.thodi@huawei.com>
X-Mailer: git-send-email 2.12.0.windows.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.203.177.241]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 frapeml500008.china.huawei.com (7.182.85.71)
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=shameerali.kolothum.thodi@huawei.com;
 helo=frasgout.his.huawei.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) AC_FROM_MANY_DOTS=1.612, BAYES_00=-1.9,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: 58SIQyBos4Cv

Hi All,

Changes from v1:
https://lore.kernel.org/qemu-devel/20250415081104.71708-1-shameerali.kolothum.thodi@huawei.com/

Addressed feedback on v1. Thanks to all.
1. Retained the same name as the legacy SMMUv3(arm-smmuv3) for new
   device type as well (instead of arm-smmuv3-dev type usage in v1).
2. Changes to ACPI IORT to use the same struct SMMUv3Device for both
   legacy SMMUv3 and the new SMMUV3 device
3. Removed the restriction of creating SMMUv3 dev if virt ver > 9.2.

Cover letter from v1:

This patch series introduces support for a user-creatable SMMUv3 device
(-device arm-smmuv3) in QEMU.

The implementation is based on feedback received from the RFCv2[0]:
"hw/arm/virt: Add support for user-creatable accelerated SMMUv3"

Currently, QEMU's SMMUv3 emulation (iommu=smmuv3) is tied to the machine
and does not support instantiating multiple SMMUv3 devices—each associated
with a separate PCIe root complex. In contrast, real-world ARM systems
often include multiple SMMUv3 instances, each bound to a different PCIe
root complex.

This also lays the groundwork for supporting accelerated SMMUv3, as
proposed in the aforementioned RFC. Please note, the accelerated SMMUv3
support is not part of this series and will be sent out as a separate
series later on top of this one.

Summary of changes:

 -Introduces support for multiple -device arm-smmuv3-dev,bus=pcie.x
  instances.

  Example usage:

  -device arm-smmuv3,bus=pcie.0
  -device virtio-net-pci,bus=pcie.0
  -device pxb-pcie,id=pcie.1,bus_nr=2
  -device arm-smmuv3,bus=pcie.1
  -device pcie-root-port,id=pcie.port1,bus=pcie.1
  -device virtio-net-pci,bus=pcie.port1

  -Supports either the legacy iommu=smmuv3 option or the new
  "-device arm-smmuv3" model.

  -Adds device tree bindings for the new SMMUv3 device on the arm/virt
   machine only, and only for the default pcie.0 root complex.
   (Note: pxb-pcie root complexes are currently not supported with the
    device tree due to known limitations[1].)

Please take a look and let me know your feedback.

Thanks,
Shameer
[0]:https://lore.kernel.org/qemu-devel/20250311141045.66620-1-shameerali.kolothum.thodi@huawei.com/
[1]:https://lore.kernel.org/qemu-devel/20230421165037.2506-1-Jonathan.Cameron@huawei.com/

Nicolin Chen (1):
  hw/arm/virt: Add an SMMU_IO_LEN macro

Shameer Kolothum (5):
  hw/arm/smmuv3: Add support to associate a PCIe RC
  hw/arm/virt-acpi-build: Update IORT for multiple smmuv3 devices
  hw/arm/virt: Factor out common SMMUV3 dt bindings code
  hw/arm/virt: Add support for smmuv3 device
  hw/arm/smmuv3: Enable smmuv3 device creation

 hw/arm/smmuv3.c          |  27 +++++++
 hw/arm/virt-acpi-build.c | 162 +++++++++++++++++++++++++++++++--------
 hw/arm/virt.c            | 112 ++++++++++++++++++++-------
 hw/core/sysbus-fdt.c     |   3 +
 include/hw/arm/virt.h    |   1 +
 5 files changed, 244 insertions(+), 61 deletions(-)

-- 
2.34.1

