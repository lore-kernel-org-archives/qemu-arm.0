Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp1033080wrp;
        Wed, 11 Sep 2019 08:52:35 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzgNNMC0FUWY9pjSZwE1dTnkWmk3gpf6jLa/V78YjZ5HG7sRQjLk3X2T1h4jGQHhAG9cFkd
X-Received: by 2002:a17:906:32c3:: with SMTP id k3mr2839994ejk.117.1568217155578;
        Wed, 11 Sep 2019 08:52:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1568217155; cv=none;
        d=google.com; s=arc-20160816;
        b=WWxzKVJlFxprJyK7gF92Bhrim4kxlvKqfkluYxP9U8DuHBJ9oPqfV+XosZzEt0kO1b
         zTGEhT+2yQGauYiTrXrAiVycEQlTp6yDcbSkyVhZgy+fFHki1ruwpqERcgpxmDMzJBnx
         q/NrkP9VNHz4urOMzfWUH2ZjUZ03xYjP5m9vogUArQBQ9DddUQguxlH2l//q9ySf0ife
         3ZeZkBUwC3r+8Sc11INZlS/TTj0FTkabnBGYjpq6gpanr3RDLSUh8AOWNtrwKBuDd90W
         9yYlUc6AuTTgYb9oU/riSon2SSN28p80D4M5Scmd6zbPvVGOVQIxP85Z5fSIFRuiADaK
         x46A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from;
        bh=OU5rgrxiSiwKLp8uxFAnjAPE5s5s1gV8uVfZSHd97Ug=;
        b=WOxi9rs8h4ugSphdyuQ7DX+yAb6hcyqZLn5ea7OBQSCG7P9l2eWFI3jXMunNntg8yO
         NmTj5XSqVK8CARAVo1fnPOOEYjO3Mcg0sAVAJxeOEsNHV2NDWtPs+ouJ51BvphEGJcte
         2eaTeaK1HP7C2uKSmY1TkEVuZX70XUXDQY1HRjbibVRADAFTDlwq5uKcQ900IQWRMklp
         eGHiZa/EVBM7m06m+cVdRoMpFkjPWwW75a1w/tiNu87oMe9QonjQzBYB8wHIBEBq2YgR
         eVny9zl+wfb8L2FzSkARqGnkgle8GSu48mqcTeuk7GnhS771P4KlIZ2qgVNlgEZZUMtL
         As3Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id gr19si5261285ejb.371.2019.09.11.08.52.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 11 Sep 2019 08:52:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:52900 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i84v3-0002HA-Ox
	for alex.bennee@linaro.org; Wed, 11 Sep 2019 11:52:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59860)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eric.auger@redhat.com>) id 1i84uG-0002Go-6a
 for qemu-arm@nongnu.org; Wed, 11 Sep 2019 11:51:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eric.auger@redhat.com>) id 1i84uD-00035I-GC
 for qemu-arm@nongnu.org; Wed, 11 Sep 2019 11:51:42 -0400
Received: from mx1.redhat.com ([209.132.183.28]:59034)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eric.auger@redhat.com>)
 id 1i84u9-00033l-6Q; Wed, 11 Sep 2019 11:51:41 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 3C487301A638;
 Wed, 11 Sep 2019 15:51:35 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-168.ams2.redhat.com [10.36.116.168])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6A21160852;
 Wed, 11 Sep 2019 15:51:28 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, peter.maydell@linaro.org
Date: Wed, 11 Sep 2019 17:51:22 +0200
Message-Id: <20190911155125.11932-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.40]); Wed, 11 Sep 2019 15:51:35 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [RFC v2 0/3] KVM/ARM: Fix >256 vcpus
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
X-TUID: 6VBgP97gaHn5

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
https://github.com/eauger/qemu/tree/v4.1.0-256fix-rfc-v2

History:
v1 -> v2:
- New layout set for kvm_arm_gic_set_irq and
  arm_cpu_kvm_set_irq through kvm_arm_set_irq
- Introduced kvm_arm_irq_line_layout_mismatch()


Eric Auger (3):
  linux headers: update for KVM_CAP_ARM_IRQ_LINE_LAYOUT_2
  intc/arm_gic: Support IRQ injection for more than 256 vpus
  virt: Check KVM_CAP_ARM_IRQ_LINE_LAYOUT_2 for smp_cpus > 256

 hw/arm/virt.c                                |  4 +++
 hw/intc/arm_gic_kvm.c                        |  7 ++--
 include/standard-headers/asm-x86/bootparam.h |  2 ++
 include/standard-headers/asm-x86/kvm_para.h  |  1 +
 include/standard-headers/linux/ethtool.h     |  2 ++
 include/standard-headers/linux/pci_regs.h    |  4 +++
 include/standard-headers/linux/virtio_ids.h  |  1 +
 include/standard-headers/linux/virtio_pmem.h |  6 ++--
 linux-headers/asm-arm/kvm.h                  | 16 ++++++++-
 linux-headers/asm-arm/unistd-common.h        |  2 ++
 linux-headers/asm-arm64/kvm.h                | 21 ++++++++++-
 linux-headers/asm-generic/mman-common.h      | 15 ++++----
 linux-headers/asm-generic/mman.h             | 10 +++---
 linux-headers/asm-generic/unistd.h           |  8 ++++-
 linux-headers/asm-mips/unistd_n32.h          |  1 +
 linux-headers/asm-mips/unistd_n64.h          |  1 +
 linux-headers/asm-mips/unistd_o32.h          |  1 +
 linux-headers/asm-powerpc/mman.h             |  6 +---
 linux-headers/asm-powerpc/unistd_32.h        |  2 ++
 linux-headers/asm-powerpc/unistd_64.h        |  2 ++
 linux-headers/asm-s390/unistd_32.h           |  2 ++
 linux-headers/asm-s390/unistd_64.h           |  2 ++
 linux-headers/asm-x86/kvm.h                  | 28 +++++++++++----
 linux-headers/asm-x86/unistd_32.h            |  2 ++
 linux-headers/asm-x86/unistd_64.h            |  2 ++
 linux-headers/asm-x86/unistd_x32.h           |  2 ++
 linux-headers/linux/kvm.h                    | 12 +++++--
 linux-headers/linux/psp-sev.h                |  5 +--
 target/arm/cpu.c                             | 10 +++---
 target/arm/kvm.c                             | 37 ++++++++++++++++++++
 target/arm/kvm_arm.h                         | 16 +++++++++
 31 files changed, 182 insertions(+), 48 deletions(-)

--=20
2.20.1

