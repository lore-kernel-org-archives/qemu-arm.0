Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp5427744wrs;
        Tue, 27 Aug 2019 09:06:19 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxeGlml2g6nEcpXAWobYFWldYFncys31+Z/Ap8tlypcUNttGF+OfXEe5tECWNhNFsqAMkUS
X-Received: by 2002:ac8:2914:: with SMTP id y20mr23980184qty.150.1566921979382;
        Tue, 27 Aug 2019 09:06:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566921979; cv=none;
        d=google.com; s=arc-20160816;
        b=yGuyG7E26yWsaUS+7bO5iHH5Hva/9Ze2PmHj5/duBnM0JWI6LEGsWe2/zd89D5SobQ
         t7Qbp1yxRKP71KSbI5rnyvzOIM3AdvOeRSB8Wf+jrg7F3+kOGpfD2efKXPqn5eDkBG5Z
         xB3dsifFKscszFXirrwaKl/of37ZGtY86deNkfhI7ba9rfogFsyqYfTrzrdjovSY+o5q
         MGk39oNj/JV0Y8+KWO0/obJ2zZYxB18Vk33tGm3hiZLS2vOzwmNM6qQ3G1lyhc8L7kjm
         VGvRjkHWM0Hoj+PZArTq2DRPFRK8Ma1zkd5nVcBUJEBqAa/0f8IY/6F0cuqpfBMHzUkC
         Hd+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from;
        bh=A0/gJKu2cjc5yHfTfHkjOna4lo/cZS9MbH45p9FU8CA=;
        b=uOaRDwxkgVLAQ46QHrSA5yimIzfC45v3ij6DbM4ffTTUyzF0B3w7QFS5A6MWPHR5di
         tHXUwkCNo4OU972kFFraT718oMFRB+KXZ27uhxRnl9EmnVBdx48qnX1/cBMX4sP9onH3
         HeO1OB6l/SwqGncyVaXf900Vl02N8fOGgJA/FOqwYL2RLBV4gS1prQEb+zeYa6FRnFLY
         80o8GEd8NQp+X/L7sYIERtAnFVVq1pA4Uk9QrG3T/wzMBWYA+oABEucFhdxDZnGchSkD
         Il50Xp/OTlmVyFcrlGhc169XrF+wigshPDbLCFWbmDj9dGc3KgAYt7LP3zpC6bvoyV+S
         wKfw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y1si10976528qkj.189.2019.08.27.09.06.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 27 Aug 2019 09:06:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:53566 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i2dz8-00037V-Gx
	for alex.bennee@linaro.org; Tue, 27 Aug 2019 12:06:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58405)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eric.auger@redhat.com>) id 1i2dyv-00032e-Eg
 for qemu-arm@nongnu.org; Tue, 27 Aug 2019 12:06:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eric.auger@redhat.com>) id 1i2dyr-00029X-2g
 for qemu-arm@nongnu.org; Tue, 27 Aug 2019 12:06:03 -0400
Received: from mx1.redhat.com ([209.132.183.28]:44218)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eric.auger@redhat.com>)
 id 1i2dyq-00029L-RG; Tue, 27 Aug 2019 12:06:01 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 0338D49;
 Tue, 27 Aug 2019 16:06:00 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-105.ams2.redhat.com [10.36.116.105])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 234351001B13;
 Tue, 27 Aug 2019 16:05:57 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, peter.maydell@linaro.org
Date: Tue, 27 Aug 2019 18:05:51 +0200
Message-Id: <20190827160554.30995-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.71]); Tue, 27 Aug 2019 16:06:00 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [RFC 0/3] KVM/ARM: Fix >256 vcpus
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
X-TUID: 3kjpfsSaqo5C

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
https://github.com/eauger/qemu/tree/v4.1.0-256fix-rfc-v1

Eric Auger (3):
  linux headers: update for KVM_CAP_ARM_IRQ_LINE_LAYOUT_2
  intc/arm_gic: Support PPI injection for more than 256 vpus
  virt: Check KVM_CAP_ARM_IRQ_LINE_LAYOUT_2 for smp_cpus > 256

 hw/arm/virt.c                                |  7 +++++
 hw/intc/arm_gic_kvm.c                        | 10 ++++---
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
 target/arm/kvm.c                             |  7 +++++
 target/arm/kvm_arm.h                         | 13 +++++++++
 30 files changed, 153 insertions(+), 40 deletions(-)

--=20
2.20.1

