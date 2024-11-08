Received: by 2002:a17:505:610b:b0:1be9:327d:8ee3 with SMTP id tt11csp4889590njc;
        Fri, 8 Nov 2024 04:56:11 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWyZeutU1KmVBLrrq6ZqHP/HltNqNoOCrkxleuS7BjK8bGI8uB1NFb4JgkoX8fD7GGulilKS9W8dYMOrg==@linaro.org
X-Google-Smtp-Source: AGHT+IEQkv+nkZvcqcJEOjq0h/UwUnzfa7GUFaFmopnS8SZmZaYwGwGFr7jKNaovNNv0yJv4dkY5
X-Received: by 2002:a05:620a:40cf:b0:7b1:5311:1379 with SMTP id af79cd13be357-7b331dc5372mr306404185a.16.1731070571612;
        Fri, 08 Nov 2024 04:56:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1731070571; cv=none;
        d=google.com; s=arc-20240605;
        b=i/tPJfusUF7nbdEBLgJyeQxdBAEwQhwL1Ce1j7KCOtkTUvhiy/+jIHyZxjuPChH+3F
         bqByXsPjp4jqqb8gdZdwEH2z7VWH/4HQ8UuhKfYnUoSd1qSI0YEe0t7bu9Bna2h2q2Sj
         yiYjmu8RugznuQf8yuHybU+dCR8kcQnggNYU6PypY86rLFlXJ+sNfsJWqx8s7in8kISw
         R/5UuYJQGNuyA6vUyxAruTkkruwLgLCGKQpniNdUMj5artWv73ecFkCzg2eJuLR3T++4
         I20N8lWSEQtHzrqWsQj3uWSpSw/I5W0xUtChy+BwkTRehPb2JovbCtgQQZin2cA+byMD
         ny5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to;
        bh=X2i9Tx9ylD90PIVMrKBaQfUjHl07b0Y5og+y4FdEGnU=;
        fh=cBv4SKPzbf4CEhFYoUFnssX5GAjcCEGzof5+BStAs6s=;
        b=a62DD59k2Guhqgt6VUOpxwbqru1S761RDS7uKJ32QWU1FRgsNvG4eIx0zKF2nYRdfI
         1Z/PTrqQ3xGdKKQnXW1AfMgdeDTPcalJx3yO9kjCv0qQVCzXXXhyByhxQ7ehpGc4DEgX
         4wCoSoybdiXkZFN7QKBZSyIncQth2NusDBBdH6ZA7vEqT97a5mb+UUMzf7+CCzgqUIL3
         +/02iZzinp6PJv7gvFZlvlPF9L6XE3ii5mc4KGwPsZDAPTOi3frDrCdtbcgTTvD86+OH
         DDI1As33Nn/U/Kcn8NBCH93X8RliZzQAtPstx3vjA8kC5iVh0KvKkec9MEgfoB4qt9lk
         T2Yw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7b32ad05056si409065185a.509.2024.11.08.04.56.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 08 Nov 2024 04:56:11 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1t9OWz-0004y1-Rv; Fri, 08 Nov 2024 07:56:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1t9OWr-0004xN-PU; Fri, 08 Nov 2024 07:55:57 -0500
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1t9OWn-0006dw-EH; Fri, 08 Nov 2024 07:55:56 -0500
Received: from mail.maildlp.com (unknown [172.18.186.216])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4XlJns6rFbz6DBXd;
 Fri,  8 Nov 2024 20:55:29 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
 by mail.maildlp.com (Postfix) with ESMTPS id 623E0140B73;
 Fri,  8 Nov 2024 20:55:35 +0800 (CST)
Received: from A2303104131.china.huawei.com (10.203.177.241) by
 frapeml500008.china.huawei.com (7.182.85.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 8 Nov 2024 13:55:29 +0100
To: <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>
CC: <eric.auger@redhat.com>, <peter.maydell@linaro.org>, <jgg@nvidia.com>,
 <nicolinc@nvidia.com>, <ddutile@redhat.com>, <linuxarm@huawei.com>,
 <wangzhou1@hisilicon.com>, <jiangkunkun@huawei.com>,
 <jonathan.cameron@huawei.com>, <zhangfei.gao@linaro.org>
Subject: [RFC PATCH 0/5] hw/arm/virt: Add support for user-creatable nested
 SMMUv3
Date: Fri, 8 Nov 2024 12:52:37 +0000
Message-ID: <20241108125242.60136-1-shameerali.kolothum.thodi@huawei.com>
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
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
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
X-TUID: Qs028k6rp0uu

Hi,

This series adds initial support for a user-creatable "arm-smmuv3-nested"
device to Qemu. At present the Qemu ARM SMMUv3 emulation is per machine
and cannot support multiple SMMUv3s.

In order to support vfio-pci dev assignment with vSMMUv3, the physical
SMMUv3 has to be configured in nested mode. Having a pluggable
"arm-smmuv3-nested" device enables us to have multiple vSMMUv3 for Guests
running on a host with multiple physical SMMUv3s. A few benefits of doing
this are,

1. Avoid invalidation broadcast or lookup in case devices are behind
   multiple phys SMMUv3s.
2. Makes it easy to handle phys SMMUv3s that differ in features.
3. Easy to handle future requirements such as vCMDQ support.

This is based on discussions/suggestions received for a previous RFC by
Nicolin here[0].

This series includes,
 -Adds support for "arm-smmuv3-nested" device. At present only virt is
  supported and is using _plug_cb() callback to hook the sysbus mem
  and irq (Not sure this has any negative repercussions). Patch #3.
 -Provides a way to associate a pci-bus(pxb-pcie) to the above device.
  Patch #3.
 -The last patch is adding RMR support for MSI doorbell handling. Patch #5.
  This may change in future[1].

This RFC is for initial discussion/test purposes only and includes patches
that are only relevant for adding the "arm-smmuv3-nested" support. For the
complete branch please find,
https://github.com/hisilicon/qemu/tree/private-smmuv3-nested-dev-rfc-v1

Few ToDos to note,
1. At present default-bus-bypass-iommu=on should be set when
   arm-smmuv3-nested dev is specified. Otherwise you may get an IORT
   related boot error.  Requires fixing.
2. Hot adding a device is not working at the moment. Looks like pcihp irq issue.
   Could be a bug in IORT id mappings.
3. The above branch doesn't support vSVA yet.

Hopefully this is helpful in taking the discussion forward. Please take a
look and let me know.

How to use it(Eg:):

On a HiSilicon platform that has multiple physical SMMUv3s, the ACC ZIP VF
devices and HNS VF devices are behind different SMMUv3s. So for a Guest,
specify two smmuv3-nested devices each behind a pxb-pcie as below,

./qemu-system-aarch64 -machine virt,gic-version=3,default-bus-bypass-iommu=on \
-enable-kvm -cpu host -m 4G -smp cpus=8,maxcpus=8 \
-object iommufd,id=iommufd0 \
-bios QEMU_EFI.fd \
-kernel Image \
-device virtio-blk-device,drive=fs \
-drive if=none,file=rootfs.qcow2,id=fs \
-device pxb-pcie,id=pcie.1,bus_nr=8,bus=pcie.0 \
-device pcie-root-port,id=pcie.port1,bus=pcie.1,chassis=1 \
-device arm-smmuv3-nested,id=smmuv1,pci-bus=pcie.1 \
-device vfio-pci,host=0000:7d:02.1,bus=pcie.port1,iommufd=iommufd0 \
-device pxb-pcie,id=pcie.2,bus_nr=16,bus=pcie.0 \
-device pcie-root-port,id=pcie.port2,bus=pcie.2,chassis=2 \
-device arm-smmuv3-nested,id=smmuv2,pci-bus=pcie.2 \
-device vfio-pci,host=0000:75:00.1,bus=pcie.port2,iommufd=iommufd0 \
-append "rdinit=init console=ttyAMA0 root=/dev/vda2 rw earlycon=pl011,0x9000000" \
-device virtio-9p-pci,fsdev=p9fs2,mount_tag=p9,bus=pcie.0 \
-fsdev local,id=p9fs2,path=p9root,security_model=mapped \
-net none \
-nographic

Guest will boot with two SMMuv3s,
[    1.608130] arm-smmu-v3 arm-smmu-v3.0.auto: option mask 0x0
[    1.609655] arm-smmu-v3 arm-smmu-v3.0.auto: ias 48-bit, oas 48-bit (features 0x00020b25)
[    1.612475] arm-smmu-v3 arm-smmu-v3.0.auto: allocated 65536 entries for cmdq
[    1.614444] arm-smmu-v3 arm-smmu-v3.0.auto: allocated 32768 entries for evtq
[    1.617451] arm-smmu-v3 arm-smmu-v3.1.auto: option mask 0x0
[    1.618842] arm-smmu-v3 arm-smmu-v3.1.auto: ias 48-bit, oas 48-bit (features 0x00020b25)
[    1.621366] arm-smmu-v3 arm-smmu-v3.1.auto: allocated 65536 entries for cmdq
[    1.623225] arm-smmu-v3 arm-smmu-v3.1.auto: allocated 32768 entries for evtq

With a pci topology like below,
[root@localhost ~]# lspci -tv
-+-[0000:00]-+-00.0  Red Hat, Inc. QEMU PCIe Host bridge
 |           +-01.0  Red Hat, Inc. QEMU PCIe Expander bridge
 |           +-02.0  Red Hat, Inc. QEMU PCIe Expander bridge
 |           \-03.0  Virtio: Virtio filesystem
 +-[0000:08]---00.0-[09]----00.0  Huawei Technologies Co., Ltd. HNS Network Controller (Virtual Function)
 \-[0000:10]---00.0-[11]----00.0  Huawei Technologies Co., Ltd. HiSilicon ZIP Engine(Virtual Function)
[root@localhost ~]#

And if you want to add another HNS VF, it should be added to the same SMMUv3
as of the first HNS dev,

-device pcie-root-port,id=pcie.port3,bus=pcie.1,chassis=3 \
-device vfio-pci,host=0000:7d:02.2,bus=pcie.port3,iommufd=iommufd0 \

[root@localhost ~]# lspci -tv
-+-[0000:00]-+-00.0  Red Hat, Inc. QEMU PCIe Host bridge
 |           +-01.0  Red Hat, Inc. QEMU PCIe Expander bridge
 |           +-02.0  Red Hat, Inc. QEMU PCIe Expander bridge
 |           \-03.0  Virtio: Virtio filesystem
 +-[0000:08]-+-00.0-[09]----00.0  Huawei Technologies Co., Ltd. HNS Network Controller (Virtual Function)
 |           \-01.0-[0a]----00.0  Huawei Technologies Co., Ltd. HNS Network Controller (Virtual Function)
 \-[0000:10]---00.0-[11]----00.0  Huawei Technologies Co., Ltd. HiSilicon ZIP Engine(Virtual Function)
[root@localhost ~]#

Attempt to add the HNS VF to a different SMMUv3 will result in,

-device vfio-pci,host=0000:7d:02.2,bus=pcie.port3,iommufd=iommufd0: Unable to attach viommu
-device vfio-pci,host=0000:7d:02.2,bus=pcie.port3,iommufd=iommufd0: vfio 0000:7d:02.2:
   Failed to set iommu_device: [iommufd=29] error attach 0000:7d:02.2 (38) to id=11: Invalid argument

At present Qemu is not doing any extra validation other than the above
failure to make sure the user configuration is correct or not. The
assumption is libvirt will take care of this.

Thanks,
Shameer
[0] https://lore.kernel.org/qemu-devel/cover.1719361174.git.nicolinc@nvidia.com/
[1] https://lore.kernel.org/linux-iommu/ZrVN05VylFq8lK4q@Asurada-Nvidia/

Eric Auger (1):
  hw/arm/virt-acpi-build: Add IORT RMR regions to handle MSI nested
    binding

Nicolin Chen (2):
  hw/arm/virt: Add an SMMU_IO_LEN macro
  hw/arm/virt-acpi-build: Build IORT with multiple SMMU nodes

Shameer Kolothum (2):
  hw/arm/smmuv3: Add initial support for SMMUv3 Nested device
  hw/arm/smmuv3: Associate a pci bus with a SMMUv3 Nested device

 hw/arm/smmuv3.c          |  61 ++++++++++++++++++++++
 hw/arm/virt-acpi-build.c | 109 ++++++++++++++++++++++++++++++++-------
 hw/arm/virt.c            |  33 ++++++++++--
 hw/core/sysbus-fdt.c     |   1 +
 include/hw/arm/smmuv3.h  |  17 ++++++
 include/hw/arm/virt.h    |  15 ++++++
 6 files changed, 215 insertions(+), 21 deletions(-)

-- 
2.34.1

