Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp427743wrp;
        Thu, 3 Oct 2019 08:47:06 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyJzLIfBKVgHJE5FkqtAPRC7l4TzLdYGEa5IHVrguFZl7cvME7oP1jgpCiaM6QbCjuJdbXK
X-Received: by 2002:ac8:3525:: with SMTP id y34mr10842275qtb.140.1570117626439;
        Thu, 03 Oct 2019 08:47:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1570117626; cv=none;
        d=google.com; s=arc-20160816;
        b=LKIuVfglS+1R5v3O4LZlo/IfKk+eH0SsXSF0icM5TLwAG5VvN+wgRa6zBAXBehAb0P
         yg3mpsiy7A8iWPxo67oauUGNgSpUA5aiTxHSeSrmmEKvLRP4/vGq7tBkggRQkkNN3pd2
         n7v5Z2e/gkFyFKz8hjmWiMdFCFniYeBa4lCUBVyI8OmoTVNb+rfarK1ZZIbFIP6JKy8J
         CYpnQsbpxYF5HO1PMzCB8v6wvs7vNyu3dXwLpqwl5i2fcbhbks2SbasSIz6lZjXhFFPG
         lPyeuhCqzetaFmTsvIF7CWwLH72onztRyL7g3V89/G1uonLOqf99E/8abZYe5hl6x+RK
         Z8jA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from;
        bh=XbSSrJUQobqu59mMroIwwK13fFL5xPWdAQVakT5tdFc=;
        b=Eb1Xw/LlLAmy8IRh5gYHmGSV4m2aGyt2jFfUE+tenS538NiwschIRNmFt1VIeq7E0n
         6ArEf8hT7+mgGFIJsGBCpSPVooJmuuxCHJvPZv5Rz6qEXg67VBwMIzVlK+ht3R3otBnP
         /CFzvI4Uv/Q6J1M7BHW1NeVsavnXlTa+Sf/Jbvq7s3ShQZ3KfMqoF4zubf9aH3vo5Mya
         CTzTQC+rnNXRqX6Vfj+/5Mbfi6PT00ds+D2Dbi1s1YsWnpmc2iYyrn3BAiiiZ/bjH1w+
         JEqGJb/94JazpbQplTR4xQ/NPSrPb5U3swq9tg5S21NBG9H5iKv2WbJtATRMSLbxIpEB
         o++A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m2si2667681qtn.60.2019.10.03.08.47.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 03 Oct 2019 08:47:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:37814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iG3Jp-0003A7-8v
	for alex.bennee@linaro.org; Thu, 03 Oct 2019 11:47:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47966)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eric.auger@redhat.com>) id 1iG3Jb-00038g-RP
 for qemu-arm@nongnu.org; Thu, 03 Oct 2019 11:46:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eric.auger@redhat.com>) id 1iG3JZ-0006Fy-0w
 for qemu-arm@nongnu.org; Thu, 03 Oct 2019 11:46:50 -0400
Received: from mx1.redhat.com ([209.132.183.28]:51654)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eric.auger@redhat.com>)
 id 1iG3JY-0006FQ-Pl; Thu, 03 Oct 2019 11:46:48 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 9E5F4793E5;
 Thu,  3 Oct 2019 15:46:47 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-117-64.ams2.redhat.com [10.36.117.64])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 642B219C6A;
 Thu,  3 Oct 2019 15:46:43 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, peter.maydell@linaro.org
Subject: [PATCH v4 0/3] KVM/ARM: Fix >256 vcpus
Date: Thu,  3 Oct 2019 17:46:37 +0200
Message-Id: <20191003154640.22451-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.25]); Thu, 03 Oct 2019 15:46:47 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
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
Cc: yuzenghui@huawei.com, maz@kernel.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: HoMvNwdSPld3

Since 4.18, KVM/ARM exposes a KVM_MAX_VCPUS equal to 512. However it was
reported [1] that a VM with more than 256 vcpus cannot be launched. 5.4
fixes the situation with 2 patches:
- one upgrade of the KVM_IRQ_LINE API [2] supporting a vcpu id encoded
  on 12 bits,
- the reduction of KVM IO devices consumed by each GICv3 redistributor [3=
]

This series uses the new KVM_IRQ_LINE API and also checks the associated
capability (KVM_CAP_ARM_IRQ_LINE_LAYOUT_2) in machvirt.

Without the series, as soon as the -smp arguments exceeds 256, QEMU exits
with "kvm_set_irq: Invalid argument".

Best Regards

Eric

This series can be found at:
https://github.com/eauger/qemu/tree/v4.1.0-256fix-patch-v4

History:

v3 -> v4:
- headers update against v5.4-rc1
- moved to patch as the kernel dependencies are resolved in 5.4
- Added Richard and Drew's R-b

v2 -> v3:
- simplifications in kvm_arm_gic_set_irq
- Implement KVM_CAP_ARM_IRQ_LINE_LAYOUT_2 check in kvm_arch_init

v1 -> v2:
- New layout set for kvm_arm_gic_set_irq and
  arm_cpu_kvm_set_irq through kvm_arm_set_irq
- Introduced kvm_arm_irq_line_layout_mismatch()

Eric Auger (3):
  linux headers: update against v5.4-rc1
  intc/arm_gic: Support IRQ injection for more than 256 vpus
  ARM: KVM: Check KVM_CAP_ARM_IRQ_LINE_LAYOUT_2 for smp_cpus > 256

 hw/intc/arm_gic_kvm.c                         |   7 +-
 include/standard-headers/asm-x86/bootparam.h  |   2 +
 include/standard-headers/asm-x86/kvm_para.h   |   1 +
 include/standard-headers/linux/ethtool.h      |  24 +++
 include/standard-headers/linux/pci_regs.h     |  19 +-
 include/standard-headers/linux/virtio_fs.h    |  19 ++
 include/standard-headers/linux/virtio_ids.h   |   2 +
 include/standard-headers/linux/virtio_iommu.h | 165 ++++++++++++++++++
 include/standard-headers/linux/virtio_pmem.h  |   6 +-
 linux-headers/asm-arm/kvm.h                   |  16 +-
 linux-headers/asm-arm/unistd-common.h         |   2 +
 linux-headers/asm-arm64/kvm.h                 |  21 ++-
 linux-headers/asm-generic/mman-common.h       |  18 +-
 linux-headers/asm-generic/mman.h              |  10 +-
 linux-headers/asm-generic/unistd.h            |  10 +-
 linux-headers/asm-mips/mman.h                 |   3 +
 linux-headers/asm-mips/unistd_n32.h           |   1 +
 linux-headers/asm-mips/unistd_n64.h           |   1 +
 linux-headers/asm-mips/unistd_o32.h           |   1 +
 linux-headers/asm-powerpc/mman.h              |   6 +-
 linux-headers/asm-powerpc/unistd_32.h         |   2 +
 linux-headers/asm-powerpc/unistd_64.h         |   2 +
 linux-headers/asm-s390/kvm.h                  |   6 +
 linux-headers/asm-s390/unistd_32.h            |   2 +
 linux-headers/asm-s390/unistd_64.h            |   2 +
 linux-headers/asm-x86/kvm.h                   |  28 ++-
 linux-headers/asm-x86/unistd.h                |   2 +-
 linux-headers/asm-x86/unistd_32.h             |   2 +
 linux-headers/asm-x86/unistd_64.h             |   2 +
 linux-headers/asm-x86/unistd_x32.h            |   2 +
 linux-headers/linux/kvm.h                     |  12 +-
 linux-headers/linux/psp-sev.h                 |   5 +-
 linux-headers/linux/vfio.h                    |  71 +++++---
 target/arm/cpu.c                              |  10 +-
 target/arm/kvm.c                              |  22 ++-
 target/arm/kvm_arm.h                          |   1 +
 36 files changed, 434 insertions(+), 71 deletions(-)
 create mode 100644 include/standard-headers/linux/virtio_fs.h
 create mode 100644 include/standard-headers/linux/virtio_iommu.h

--=20
2.20.1

