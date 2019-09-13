Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp542007wrp;
        Fri, 13 Sep 2019 02:57:03 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyWGC8YUuAq+RoP6UgfdXQ85/R7XPDeZ67jWMu2sgTxrcMJy38lg6NfmcwoSr7/9rK8JQlE
X-Received: by 2002:ad4:4104:: with SMTP id i4mr29814324qvp.94.1568368622913;
        Fri, 13 Sep 2019 02:57:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1568368622; cv=none;
        d=google.com; s=arc-20160816;
        b=kVaLqFUbtN7OVaf+6/9QA3udMWUNVdNigKp97qZiuDN8u4Trvgar530D4TIcafjUkM
         j/DnJfInqViuZbHatLVG4Whj8WEz+LPcrMwVwuMy8rEBdQWWiihQ9FmSkWYlB4n8czBZ
         /iB90GYOPvoq53OSGiyd9lo+E3/10J8EXdpbh419NR22T1p7SDE31ePVPQWZzZBiVdhb
         XyR+iI7qzs86WyW6DJI6X1fsLXWhr+R03wN09dsveG7wQ3JbCneJ0xobWiICbkuv1gfk
         gTLYg41ohShvsofIN3HhG9iAVsRPmf7Uok4O2WypGJJW+FmXeZs3OKe5YpGfCmgnQRkH
         KPQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from;
        bh=19+IJZsGrEKykC9/W6UAVYgSSPe7v2/dadyYxh9XuTM=;
        b=FHqmjzezbvQ9MBGCIzMqmJ5gDgD2mRFcjdN/lBxmeYxZGZRLByVjVqYCdtJzJc3eW+
         3ST8B5QUPLHROa0G905yShqgB1CbbrhySEi0iGX86s6nRwx2/bEp9b4TZ7lZXiUr+KH7
         w0CUGKA2em1Zwok4MWnX3WVQzAn+Zm0x20PAH0x/LVmGC3VQOjwMxlx5HYLr34Q+gVRH
         Am6vdE8YaZJ+no5up/V2GwLej4wju9Cuuo38NPPh3nV/ZfaXGarlGx1vbQvGDPHlX1oo
         xO7fZISC8ck382Ce7PsdLCncGYSGdno315ezfdB5EmMLEZI5IMda/MRCA95d7MTu0gAz
         mFZw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g43si20844342qtc.379.2019.09.13.02.57.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 13 Sep 2019 02:57:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:41884 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i8iK5-0008CK-Gp
	for alex.bennee@linaro.org; Fri, 13 Sep 2019 05:57:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58445)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eric.auger@redhat.com>) id 1i8iJt-0008C9-TF
 for qemu-arm@nongnu.org; Fri, 13 Sep 2019 05:56:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eric.auger@redhat.com>) id 1i8iJs-0007LQ-IH
 for qemu-arm@nongnu.org; Fri, 13 Sep 2019 05:56:49 -0400
Received: from mx1.redhat.com ([209.132.183.28]:42934)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eric.auger@redhat.com>)
 id 1i8iJs-0007L8-Aj; Fri, 13 Sep 2019 05:56:48 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 1013518CB8EA;
 Fri, 13 Sep 2019 09:56:47 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-33.ams2.redhat.com [10.36.116.33])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BFFE460C44;
 Fri, 13 Sep 2019 09:56:42 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, peter.maydell@linaro.org
Date: Fri, 13 Sep 2019 11:56:36 +0200
Message-Id: <20190913095639.25447-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.63]); Fri, 13 Sep 2019 09:56:47 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [RFC v3 0/3] KVM/ARM: Fix >256 vcpus
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
X-TUID: Xnumc3X43UT6

Since 4.18, KVM/ARM exposes a KVM_MAX_VCPUS equal to 512. However it was
reported [1] that a VM with more than 256 vcpus cannot be launched. 5.4
is about to fix the situation with 2 patches:
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

References:
[1] Can we boot a 512U kvm guest?
    https://patchwork.kernel.org/patch/11091501/
[2] [PATCH] KVM: arm/arm64: vgic: Allow more than 256 vcpus for KVM_IRQ_L=
INE
    https://patchwork.kernel.org/patch/11099609/
[3] [PATCH] KVM: arm/arm64: vgic: Use a single IO device per redistributo=
r
    https://patchwork.kernel.org/patch/11112141/

This series can be found at:
https://github.com/eauger/qemu/tree/v4.1.0-256fix-rfc-v3

History:
v2 -> v3:
- simplifications in kvm_arm_gic_set_irq
- Implement KVM_CAP_ARM_IRQ_LINE_LAYOUT_2 check in kvm_arch_init

v1 -> v2:
- New layout set for kvm_arm_gic_set_irq and
  arm_cpu_kvm_set_irq through kvm_arm_set_irq
- Introduced kvm_arm_irq_line_layout_mismatch()

Eric Auger (3):
  linux headers: update for KVM_CAP_ARM_IRQ_LINE_LAYOUT_2
  intc/arm_gic: Support IRQ injection for more than 256 vpus
  ARM: KVM: Check KVM_CAP_ARM_IRQ_LINE_LAYOUT_2 for smp_cpus > 256

 hw/intc/arm_gic_kvm.c                        |  7 ++---
 include/standard-headers/asm-x86/bootparam.h |  2 ++
 include/standard-headers/asm-x86/kvm_para.h  |  1 +
 include/standard-headers/linux/ethtool.h     |  2 ++
 include/standard-headers/linux/pci_regs.h    |  4 +++
 include/standard-headers/linux/virtio_ids.h  |  1 +
 include/standard-headers/linux/virtio_pmem.h |  6 ++---
 linux-headers/asm-arm/kvm.h                  | 16 ++++++++++-
 linux-headers/asm-arm/unistd-common.h        |  2 ++
 linux-headers/asm-arm64/kvm.h                | 21 ++++++++++++++-
 linux-headers/asm-generic/mman-common.h      | 15 ++++++-----
 linux-headers/asm-generic/mman.h             | 10 +++----
 linux-headers/asm-generic/unistd.h           |  8 +++++-
 linux-headers/asm-mips/unistd_n32.h          |  1 +
 linux-headers/asm-mips/unistd_n64.h          |  1 +
 linux-headers/asm-mips/unistd_o32.h          |  1 +
 linux-headers/asm-powerpc/mman.h             |  6 +----
 linux-headers/asm-powerpc/unistd_32.h        |  2 ++
 linux-headers/asm-powerpc/unistd_64.h        |  2 ++
 linux-headers/asm-s390/unistd_32.h           |  2 ++
 linux-headers/asm-s390/unistd_64.h           |  2 ++
 linux-headers/asm-x86/kvm.h                  | 28 +++++++++++++++-----
 linux-headers/asm-x86/unistd_32.h            |  2 ++
 linux-headers/asm-x86/unistd_64.h            |  2 ++
 linux-headers/asm-x86/unistd_x32.h           |  2 ++
 linux-headers/linux/kvm.h                    | 12 ++++++---
 linux-headers/linux/psp-sev.h                |  5 +---
 target/arm/cpu.c                             | 10 +++----
 target/arm/kvm.c                             | 22 ++++++++++++++-
 target/arm/kvm_arm.h                         |  1 +
 30 files changed, 147 insertions(+), 49 deletions(-)

--=20
2.20.1

