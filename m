Received: by 2002:a1c:4d4:0:0:0:0:0 with SMTP id 203-v6csp3109703wme;
        Sun, 13 May 2018 07:35:41 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZqa7R9vhq1vdkb2MrpC7NNsaLs1ozbjrVCjIfp66E0T/JgFNjdhGSbssvau2F0HUILA35X6
X-Received: by 2002:a37:2301:: with SMTP id j1-v6mr5246341qkj.301.1526222141576;
        Sun, 13 May 2018 07:35:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1526222141; cv=none;
        d=google.com; s=arc-20160816;
        b=mmpjhw5eztfdCtpVu5so/C0hS89SmAAQ7cTg/1qtd6UGYM2CmFpupVRatDsM9EeLHw
         1qrZnE4jGwa4vmQAAmBGK4aL9PL/gH71Z9HnOQ6y96qxemOnaDlCUQOvaaxQvQhl4USc
         KtDnXJ4yWf127qrRm6lNtne89uJW1YAzyUZdbdCffYwD9/EMs/PZ8hI5WYvsvpmQkdS5
         vQOOdLYPR+YyFcVvXgnvT0YKKRJ2tz+IE4j1J8ph5oulnwbFkyHMWOUv24P6Fd0X/cyd
         IWun9Tx+QvdSwofJvEOgQhlL4tFGrOyFkaZFAsIGDYuc233J7CgdTqzM463RPJsMSCkw
         a1YQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :arc-authentication-results;
        bh=bpl+SVPpYLMddVrYWmGiOP9Pi9jWXQTlBPfth1B8rio=;
        b=kb6ChE1HC1M2Rb7BiVAdjpFsLxQoR6IAe0vDPpKCQ2oHGA3QqTquNBRpLxNwPeT8Jx
         WMvLhVYtckeL/0cC6b7uCKxOYrduzda926P4Tmzpycskl4z1MiCusWq1DI81/W9ag0Gi
         COy4CU6HHQQTJGKIvvhaBk7PzRigs2rNPxxC+L2ncADZpV8NCkdSt6XLk0YaTfRlubbu
         LjoTPwjrRTxHifapwct4YecYRNxspCODCmIf5l4QvTibJ/LhgXAfYuEm4R3q8GBO3V+q
         FB7WYXdNnnQNU/Ymb43lK3UpbqrZevulRFfIJTot61LiwIHRIVaqZmfIKJH37MHSZnuL
         p7VQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s66-v6si62420qkc.334.2018.05.13.07.35.41
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 13 May 2018 07:35:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:43975 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fHs68-000809-WC
	for alex.bennee@linaro.org; Sun, 13 May 2018 10:35:41 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53810)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fHs5x-0007yX-IW
	for qemu-arm@nongnu.org; Sun, 13 May 2018 10:35:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fHs5u-0006NV-E3
	for qemu-arm@nongnu.org; Sun, 13 May 2018 10:35:29 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:56736 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1fHs5u-0006Mw-8e; Sun, 13 May 2018 10:35:26 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0E460406F131;
	Sun, 13 May 2018 14:35:24 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-116-92.ams2.redhat.com
	[10.36.116.92])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C156D84459;
	Sun, 13 May 2018 14:35:17 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org
Date: Sun, 13 May 2018 16:35:07 +0200
Message-Id: <1526222114-5324-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.5]);
	Sun, 13 May 2018 14:35:24 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.5]);
	Sun, 13 May 2018 14:35:24 +0000 (UTC) for IP:'10.11.54.5'
	DOMAIN:'int-mx05.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-arm] [RFC v2 0/7] KVM/ARM: Relax the max 123 vcpus limitation
 along with KVM GICv3
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: marc.zyngier@arm.com, drjones@redhat.com, christoffer.dall@arm.com,
	zhaoshenglong@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: NhKtRtF8VUw4

Currently the max number of VCPUs usable along with the KVM GICv3
device is limited to 123. The rationale is a single redistributor
region was supported and this latter was set to [0x80A0000, 0x9000000]
within the guest physical address space, surrounded with DIST and UART
MMIO regions.

[1] now allows to register several redistributor regions.
So this series overcomes the max 123 vcpu limitation by registering
a new redistributor region located just after the VIRT_MEM RAM region.
The total redistributor region capacity is set to 512 vcpus.

The max supported VCPUs in non accelerated mode is not modified.

Best Regards

Eric

Host Kernel dependencies:
[1] [PATCH v6 00/12] KVM: arm/arm64: Allow multiple GICv3 redistributor
    regions
https://github.com/eauger/linux/tree/v4.17-rc2-rdist-regions-v6

This QEMU series can be found at:
https://github.com/eauger/qemu/tree/v2.12.0-rdist_regions-rfc-v2

History:
v1 -> v2:
- Do not use KVM_MAX_VCPUS anymore
- In case the multiple redistributor region capability is not
  supported by the host kernel, the GICv3 device realize() fails
  with a hint for the end-user.
- use properties to set the redistributor region count
- sysbus_mmio_map is kept in virt and machine init done notifier
  mechanism is used with an address fixup addition.
- I have not yet extended the second redist region as Peter suggested.
  We can easily add another 3d region later on if requested. But
  if mandated, I will fix that in next release.


Eric Auger (7):
  linux-headers: Partial update for KVM/ARM multiple redistributor
    region registration
  target/arm: Allow KVM device address overwriting
  hw/intc/arm_gicv3: Introduce redist-region-count array property
  hw/intc/arm_gicv3_kvm: Get prepared to handle multiple redist regions
  hw/arm/virt: GICv3 DT node with one or two redistributor regions
  hw/arm/virt-acpi-build: Advertise one or two GICR structures
  hw/arm/virt: Register two redistributor regions when necessary

 hw/arm/virt-acpi-build.c           |  9 +++++++
 hw/arm/virt.c                      | 48 ++++++++++++++++++++++++++++++++++----
 hw/intc/arm_gic_kvm.c              |  4 ++--
 hw/intc/arm_gicv3.c                | 11 ++++++++-
 hw/intc/arm_gicv3_common.c         | 35 +++++++++++++++++++++++----
 hw/intc/arm_gicv3_its_kvm.c        |  2 +-
 hw/intc/arm_gicv3_kvm.c            | 38 ++++++++++++++++++++++++++----
 include/hw/arm/virt.h              | 12 ++++++++++
 include/hw/intc/arm_gicv3_common.h |  6 +++--
 linux-headers/asm-arm/kvm.h        |  1 +
 linux-headers/asm-arm64/kvm.h      |  1 +
 target/arm/kvm.c                   | 10 +++++++-
 target/arm/kvm_arm.h               |  3 ++-
 13 files changed, 158 insertions(+), 22 deletions(-)

-- 
2.5.5

