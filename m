Received: by 2002:adf:b64b:0:0:0:0:0 with SMTP id i11-v6csp5457037wre;
        Wed, 30 May 2018 20:38:57 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKJiPxwcQ3ffIraLKMfZK0EhhU8POMGM9Y6u5sF7TK7gDo/iX6u2BDiA2DCODd+XCJoy/7kN
X-Received: by 2002:aed:25cb:: with SMTP id y11-v6mr5234545qtc.333.1527737937095;
        Wed, 30 May 2018 20:38:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1527737937; cv=none;
        d=google.com; s=arc-20160816;
        b=cAzySbOu4+McEgVtui17ql60oSXs9rRoeBYlJEZxjwtN7tqjjaQW1UCJOQQCfIvL4e
         NemIliy9YdXlPUNx4vPiCqE18gcR/hd+Sa7p9bzuws6WVc5zFOxNswVI3esuMM46KdP7
         fAVLjDtgw5NXAUpzjW+X2NCbbExa2HdPQUi6DJjPXyoIrlhI4uQqAEHrLeGZ+SsKxpsL
         O8/WqdBsrHM8A32HU7x7ele7iLq+P9vfbdoknqvJuLCEcR57fYDR8FQ87dCFdwyxXw3a
         KhVwUVpepaqdgVcqyfG2OPesWGdAHqYYoYyZt2V6ZNeTPO31cIl+9Ms3zZoxl3vk8eBT
         BpYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version:message-id
         :date:to:from:arc-authentication-results;
        bh=xJqwZ9uihxNgAm5/W3K49JL4ecLXCZb9C4CKaO4LGlw=;
        b=bk8IwOte7VDqK8ueHQtb+hs/Dd2Q52YBCbNtfN5X0IZD8hSXLp84jNBc5ErwKAqAsC
         8HG/rX3m01MzbhejeItgTwvAoSMqO2ecFi+nEVu9NV6IMORvP+ew/wHaVp33oEzdXF1u
         WpY+/TrJ9ug3JtSR71HBs9MC7ldZi29F80dwfScjsd/lNdaHPXP0H59CiuqcabxRpD8d
         tx5MtIVtdvZeht6GMJXhwK5dJMzN50I1zkMRZ43IA219VllX9CbKGS1tcicjW+/xpAMl
         cmusnJvLQbUjtxnRlYjDyh2CyqNEIxlp5uj9ZRO1xHnp/8ZQWFls6ZfrspQPekI+8kXK
         IMug==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 16-v6si11430505qtw.364.2018.05.30.20.38.56
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 30 May 2018 20:38:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:41814 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fOEQS-000323-7Q
	for alex.bennee@linaro.org; Wed, 30 May 2018 23:38:56 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54693)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gengdongjiu@huawei.com>) id 1fOEQF-00031l-7F
	for qemu-arm@nongnu.org; Wed, 30 May 2018 23:38:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <gengdongjiu@huawei.com>) id 1fOEQC-0007Ci-4z
	for qemu-arm@nongnu.org; Wed, 30 May 2018 23:38:43 -0400
Received: from [45.249.212.32] (port=33489 helo=huawei.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <gengdongjiu@huawei.com>)
	id 1fOEQB-0007B9-QA; Wed, 30 May 2018 23:38:40 -0400
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.60])
	by Forcepoint Email with ESMTP id ABAE339215FA;
	Thu, 31 May 2018 11:38:32 +0800 (CST)
Received: from localhost.localdomain (10.143.28.90) by
	DGGEMS412-HUB.china.huawei.com (10.3.19.212) with Microsoft SMTP Server
	id 14.3.382.0; Thu, 31 May 2018 11:38:28 +0800
From: Dongjiu Geng <gengdongjiu@huawei.com>
To: <peter.maydell@linaro.org>, <qemu-arm@nongnu.org>,
	<qemu-devel@nongnu.org>, <linuxarm@huawei.com>
Date: Thu, 31 May 2018 19:43:54 +0800
Message-ID: <1527767037-6105-1-git-send-email-gengdongjiu@huawei.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.143.28.90]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 45.249.212.32
Subject: [Qemu-arm] [PATCH v1 0/3] add support for VCPU event states
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: gDFvltBp/mFj

support for KVM_GET/SET_VCPU_EVENTS to get/set the SError exception
state, and support the state migration.

Dongjiu Geng (3):
  linux-headers: update to v4.17-rc7
  kvm: sync linux headers
  target: arm: Add support for VCPU event states

 include/standard-headers/asm-x86/hyperv.h       |   1 -
 include/standard-headers/asm-x86/kvm_para.h     |   2 +-
 include/standard-headers/linux/ethtool.h        |  36 ++-
 include/standard-headers/linux/input.h          |   4 +-
 include/standard-headers/linux/pci_regs.h       |   7 +-
 include/standard-headers/linux/virtio_balloon.h |  15 +
 include/standard-headers/linux/virtio_gpu.h     |   1 -
 include/standard-headers/rdma/vmw_pvrdma-abi.h  |  49 ++--
 linux-headers/COPYING                           | 358 +-----------------------
 linux-headers/asm-arm/kvm.h                     |  15 +
 linux-headers/asm-arm64/kvm.h                   |  19 ++
 linux-headers/asm-x86/hyperv.h                  |   1 -
 linux-headers/asm-x86/kvm.h                     |  19 +-
 linux-headers/linux/kvm.h                       |  31 +-
 linux-headers/linux/vfio.h                      |  27 ++
 target/arm/cpu.h                                |   5 +
 target/arm/kvm64.c                              |  64 +++++
 target/arm/machine.c                            |   3 +
 18 files changed, 268 insertions(+), 389 deletions(-)
 delete mode 100644 include/standard-headers/asm-x86/hyperv.h
 delete mode 100644 linux-headers/asm-x86/hyperv.h

-- 
2.7.4

