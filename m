Received: by 10.28.71.155 with SMTP id m27csp727433wmi;
        Tue, 27 Mar 2018 07:15:59 -0700 (PDT)
X-Google-Smtp-Source: AG47ELusf001OwgUShvu2V3inrhaoqAXULSeb/iZ9aRtDj3uoOmXrPXCO+XP1PafKiAtyvXbl1Ap
X-Received: by 10.237.61.184 with SMTP id i53mr37402019qtf.293.1522160159431;
        Tue, 27 Mar 2018 07:15:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1522160159; cv=none;
        d=google.com; s=arc-20160816;
        b=wsbRCPgtYiD+N1oye1xHwImcheCrIejFN7jXKn97Sfgo5LREyeDQLw0CRPpN9feV7F
         GuwXHUvkAF32Fi4vU2L8D8nObDXAePYugOz10fICXmoDYPSd4GFjLjkGkDxifsMuw3Lz
         xywg/s2OQwHHUUGU/WP9sX2FdA1qzSCQMY7I4fPiWvEWOXrZxS4ZgZg+SP0QVKZ7o8V5
         z1gwx1PXXg5rw/Qs+ODrL7nZY5xHYNLnkojBmdajr+5YExneBGgQXhdPisaDiGUKhsLU
         2azd4nrSUh2yhf6/zbbP9Knh7nODycVkXqSaJG8ARIi+37wylrnfVbki5ervL5FwIPGH
         pJjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :arc-authentication-results;
        bh=IK+XrQJEs63A+5jz+/pyJE0z7Ft/lQqBpCbVu7+ndsM=;
        b=TonxMyQ7vkXmhK4f4hNg7dPoICQ6EU/bYWrFuMRVJ5+Qyn4Ocmz/217fABNlNnPWG0
         0l5EUZZgdOP+DVL/3cL9N7VI139NMILQCvPhaiBd+teMjFmSgk19pdzhV6bzr58o72qo
         o3NazQDTNgiHcYKrkT85nj3X1dV50hdBfAZluKuC1g1BAgX/Eo9Y3MHt+XK7K7T0u/IW
         J7phBJ6XTD5aR1tSBKPxn2DaMgOXVY4lyU9TS7Rsd8mEvUyYTLETtw8QEVZJpk9CRU06
         GXWwkOH7GUxvWwuTau9ZP9vmPBjuWVk41lJ+zIt1GxrQ55+zQJZiZiqX19ka6SGUzXbH
         gqTw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m18si1379242qtn.304.2018.03.27.07.15.59
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 27 Mar 2018 07:15:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:34524 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1f0pOI-00032m-UA
	for alex.bennee@linaro.org; Tue, 27 Mar 2018 10:15:58 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45413)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1f0pO4-000318-Lv
	for qemu-arm@nongnu.org; Tue, 27 Mar 2018 10:15:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1f0pO2-0006Q8-I1
	for qemu-arm@nongnu.org; Tue, 27 Mar 2018 10:15:44 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:59994 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1f0pO2-0006Nz-5u; Tue, 27 Mar 2018 10:15:42 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4AA29401DEA6;
	Tue, 27 Mar 2018 14:15:36 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-116-135.ams2.redhat.com
	[10.36.116.135])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5FAB06F9E4;
	Tue, 27 Mar 2018 14:15:25 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org
Date: Tue, 27 Mar 2018 16:15:14 +0200
Message-Id: <1522160122-10744-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.6]);
	Tue, 27 Mar 2018 14:15:36 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.6]);
	Tue, 27 Mar 2018 14:15:36 +0000 (UTC) for IP:'10.11.54.5'
	DOMAIN:'int-mx05.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-arm] [RFC 0/8] KVM/ARM: Relax the max 123 vcpus limitation
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
Cc: marc.zyngier@arm.com, drjones@redhat.com, cdall@kernel.org,
	zhaoshenglong@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: qZoUYp7NprVJ

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
[1] [RFC v2 00/12] KVM: arm/arm64: Allow multiple GICv3 redistributor regions
https://github.com/eauger/linux/tree/4.16-rc7-rdist-regions-rfc-v2

This QEMU series can be found at:
https://github.com/eauger/qemu/tree/v2.12.0-rc0-rdist_regions-rfc

Eric Auger (8):
  linux-headers: Partial update for KVM/ARM multiple redistributor
    region registration
  hw/intc/arm_gicv3: Use an array of redistributor regions
  kvm: Expose kvm_max_vcpus()
  hw/intc/arm_gicv3: Implement register_redist_region API
  hw/intc/arm_gicv3_kvm: Allow multiple redistributor regions
  hw/arm/virt: Allow GICv3 DT node with multiple redistributor regions
  hw/arm/virt-acpi-build: Handle multiple GICR structures
  hw/arm/virt: Allow up to 512 vcpus along with KVM VGICv3

 accel/kvm/kvm-all.c                |  2 +-
 accel/stubs/kvm-stub.c             |  5 ++++
 hw/arm/virt-acpi-build.c           | 21 ++++++++++----
 hw/arm/virt.c                      | 55 +++++++++++++++++++++++++++++++-----
 hw/intc/arm_gicv3.c                | 21 ++++++++++++++
 hw/intc/arm_gicv3_common.c         |  9 ++++--
 hw/intc/arm_gicv3_kvm.c            | 57 ++++++++++++++++++++++++++++++++++++--
 include/hw/arm/virt.h              |  3 ++
 include/hw/intc/arm_gicv3_common.h | 14 +++++++++-
 include/sysemu/kvm.h               |  7 +++++
 linux-headers/asm-arm/kvm.h        |  7 +++--
 linux-headers/asm-arm64/kvm.h      |  7 +++--
 12 files changed, 182 insertions(+), 26 deletions(-)

-- 
2.5.5

