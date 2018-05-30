Received: by 2002:adf:b64b:0:0:0:0:0 with SMTP id i11-v6csp4642392wre;
        Wed, 30 May 2018 04:46:12 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKKe8RaDZ7slMGlG8a/B3HbkrE7txvqfkraqiIXBGv46L8Yr+Ncouti1yshRmlBhMMVvzaUI
X-Received: by 2002:a37:48cf:: with SMTP id v198-v6mr1940655qka.128.1527680772202;
        Wed, 30 May 2018 04:46:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1527680772; cv=none;
        d=google.com; s=arc-20160816;
        b=X2Fq/+JwEi7fkO08Ce8taw2C9hFu6OyKpo7e9Ts54SjCK/zi2Q7DyWvH77Bjnk7Gxl
         sb57CDJ2JGyLsVa3b6WcINnH8egbNUbf02icBxsfz+Kmf4/VeHBIOHenZqIq7vxdPupk
         89NM3PptWJpMxQHMeWiIb9E5dAjE9iEc5Yq/h2WJPlyLYD0l5R/cYZV6fG3WVW5Y8G9m
         xj0znLuPaCMpgUw5l0v6YYQ8Tlorq1kHkoNxI2TUs8QgGgqHNyx2PBFW4HZWA3y7bfnQ
         bWfao20/tpNmOs55tAmmxeQZD9drH1iB4gzgCd5O5+pd5zYL3Uzo1cgbLQJTjXaxwSnE
         1jRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :arc-authentication-results;
        bh=S/L8ZQrl7J1EtHYDysTMbsC2v90c3IlMtc34U+LI6ao=;
        b=HDu87rWL2q4XsWvtLQbGZ/rYnXhsBZP7lFyuWNjh/0GSIE1I0LzqzA0XwGLasoqC7G
         L6rJ97gtB22Dr2F06wYkG31RzUPHfi61TtOL4Dj1nOxkbQTEySwos/LDwdE9rACBSBYp
         AuO/pbZ+k6sNE7UI/7XfOfMcZWWBMFSOD7r9SBqV6XwcEFVM4TOLftYdWbPZ+PP7pb+o
         f7gs4zc8xlv0AtKqO3cyMjSxUINEJ2qC0h6m6tuHdxs9bXPe/u7n5XlP5JoPkfmSDQMM
         a8lairhQcpCSqEZFQQ8cqE5so5y5YKdKMGA6QYas72SaUGIHXVzVVKoyFFU6fTK+INDW
         DszQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k2-v6si13253888qva.0.2018.05.30.04.46.12
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 30 May 2018 04:46:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:37748 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fNzYR-0004mV-Il
	for alex.bennee@linaro.org; Wed, 30 May 2018 07:46:11 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49194)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fNzYF-0004kX-OR
	for qemu-arm@nongnu.org; Wed, 30 May 2018 07:46:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fNzYC-000579-9R
	for qemu-arm@nongnu.org; Wed, 30 May 2018 07:45:59 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:41406 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1fNzYC-00055s-4T; Wed, 30 May 2018 07:45:56 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 61539400E9BA;
	Wed, 30 May 2018 11:45:53 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-116-69.ams2.redhat.com
	[10.36.116.69])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 333A910EE95B;
	Wed, 30 May 2018 11:45:47 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org
Date: Wed, 30 May 2018 13:45:33 +0200
Message-Id: <1527680741-2725-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.7]);
	Wed, 30 May 2018 11:45:53 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.7]);
	Wed, 30 May 2018 11:45:53 +0000 (UTC) for IP:'10.11.54.3'
	DOMAIN:'int-mx03.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-arm] [RFC v3 0/8] KVM/ARM: Relax the max 123 vcpus limitation
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
X-TUID: +k739h8OdXgx

Currently the max number of VCPUs usable along with the KVM GICv3
device is limited to 123. The rationale is a single redistributor
region was supported and this latter was set to [0x80A0000, 0x9000000]
within the guest physical address space, surrounded with DIST and UART
MMIO regions.

[1] now allows to register several redistributor regions.
So this series overcomes the max 123 vcpu limitation by registering
a new redistributor region located just after the VIRT_MEM RAM region.
This second redistributor region has a capacity of 512 redistributors.

The max supported VCPUs in non accelerated mode is not modified.

Best Regards

Eric

Host Kernel dependencies:
[1] [PATCH v6 00/12] KVM: arm/arm64: Allow multiple GICv3 redistributor
    regions
https://github.com/eauger/linux/tree/v4.17-rc2-rdist-regions-v6

This QEMU series can be found at:
https://github.com/eauger/qemu/tree/v2.12.0-rdist_regions-rfc-v3
Previous version:
https://github.com/eauger/qemu/tree/v2.12.0-rdist_regions-rfc-v2

History:
v2 -> v3:
- Added the last patch defining 3.0 machine type and setting
  max_cpus to 512
- redistributor region total count exactly matching the number
  of requested vcpus
- added missing return in arm_gic_realize
- checked redist region capacity versus #vcpus earlier in
  gicv3_init_irqs_and_mmio
- use GICV3_REDIST_SIZE
- Changed the 2d region size to 64MB

v1 -> v2:
- Do not use KVM_MAX_VCPUS anymore
- In case the multiple redistributor region capability is not
  supported by the host kernel, the GICv3 device realize() fails
  with a hint for the end-user.
- use properties to set the redistributor region count
- sysbus_mmio_map is kept in virt and machine init done notifier
  mechanism is used with an address fixup addition.
- I have not yet extended the second redist region as Peter suggested.
  We can easily add another 3th region later on if requested. But
  if mandated, I will fix that in next release.


Eric Auger (8):
  linux-headers: Partial update for KVM/ARM multiple redistributor
    region registration
  target/arm: Allow KVM device address overwriting
  hw/intc/arm_gicv3: Introduce redist-region-count array property
  hw/intc/arm_gicv3_kvm: Get prepared to handle multiple redist regions
  hw/arm/virt: GICv3 DT node with one or two redistributor regions
  hw/arm/virt-acpi-build: Advertise one or two GICR structures
  hw/arm/virt: Register two redistributor regions when necessary
  hw/arm/virt: Add virt-3.0 machine type supporting up to 512 vcpus

 hw/arm/virt-acpi-build.c           |  9 ++++
 hw/arm/virt.c                      | 88 ++++++++++++++++++++++++++++++++------
 hw/intc/arm_gic_kvm.c              |  4 +-
 hw/intc/arm_gicv3.c                | 12 +++++-
 hw/intc/arm_gicv3_common.c         | 38 +++++++++++++---
 hw/intc/arm_gicv3_its_kvm.c        |  2 +-
 hw/intc/arm_gicv3_kvm.c            | 40 +++++++++++++++--
 include/hw/arm/virt.h              | 14 ++++++
 include/hw/intc/arm_gicv3_common.h |  8 +++-
 linux-headers/asm-arm/kvm.h        |  1 +
 linux-headers/asm-arm64/kvm.h      |  1 +
 target/arm/kvm.c                   | 10 ++++-
 target/arm/kvm_arm.h               |  3 +-
 13 files changed, 200 insertions(+), 30 deletions(-)

-- 
2.5.5

