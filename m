Received: by 2002:adf:b64b:0:0:0:0:0 with SMTP id i11-v6csp5462759wre;
        Wed, 30 May 2018 20:48:44 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKJHhr3nmQ4GmwPCtkZT5P6oaizThhWpMh55hs1gZzgUu6dUiY04uKE69gc3IEF2byvXtMPX
X-Received: by 2002:a0c:b99f:: with SMTP id v31-v6mr5091222qvf.159.1527738524602;
        Wed, 30 May 2018 20:48:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1527738524; cv=none;
        d=google.com; s=arc-20160816;
        b=gDBeKeZcwG8mlKFOKgvhF3/WIas9EafnR96LJ4oCjdamOqVkq3kxG6zT/MbWEBEDyW
         jF2LzQ1NQXosb73yvJlra5hN1dSB3cMwIGY92346j/enyt8boHlS4UjVpzs2bPkDEAaZ
         r7jReZMVzI5pJo8XQTKbfAyhBUctOVWG/c4XisTmUG45lP6fB2SbS/hI+G/0iij+4MFQ
         AvqZ0JRcI01hb9scv3bLC0JRVxns/KKGWOUtHY+x86ucNpITj/GBRi7jnNCjU81ZsIjb
         9R9w3RdRgW1bcuEr53oMEdKOQNfwL4UM8QI4WGZ82/ePR1tZdXUxtMd+u6MRDaXGa28i
         Ed0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version:message-id
         :date:to:from:arc-authentication-results;
        bh=xJqwZ9uihxNgAm5/W3K49JL4ecLXCZb9C4CKaO4LGlw=;
        b=bY6ZyjLlOV0uzeqSit2NAkNc5kRWZXKtziIlVTq1jQnb/blgQt2clKH+IPV65xfvR5
         b8MPUHreYxO/+tHd3hOSIUAp/xnNg1ksdEneBibFJwJ+yqRKvWcIDQzQC2HsON521gUE
         Z+p09zrtQ6v1Vz1yOp8S9viCW7DB83a+2QJJx2CI4e/5SqqbjFB0PfFQbaEnLmjbsX2U
         uTJtNG3jph87jRmxJWoapERq0q2RA0M+yJFy2utoGH9DQJOOC/EQznADqEHbEScUWOJX
         EW1qoU+OaCeTh152B5VIcki1be76asx4cUhplIbcFNkebAkdeNilvvK3e+3ycPJ1zSqM
         sLbA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o8-v6si3492212qte.112.2018.05.30.20.48.44
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 30 May 2018 20:48:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:41850 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fOEZw-0007Ac-4M
	for alex.bennee@linaro.org; Wed, 30 May 2018 23:48:44 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56221)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gengdongjiu@huawei.com>) id 1fOEZm-0007AT-S8
	for qemu-arm@nongnu.org; Wed, 30 May 2018 23:48:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <gengdongjiu@huawei.com>) id 1fOEZh-0003Ux-V4
	for qemu-arm@nongnu.org; Wed, 30 May 2018 23:48:34 -0400
Received: from [45.249.212.32] (port=36520 helo=huawei.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <gengdongjiu@huawei.com>)
	id 1fOEZh-0003UO-L1; Wed, 30 May 2018 23:48:29 -0400
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.60])
	by Forcepoint Email with ESMTP id 056B4A68E66C8;
	Thu, 31 May 2018 11:48:25 +0800 (CST)
Received: from localhost.localdomain (10.143.28.90) by
	DGGEMS408-HUB.china.huawei.com (10.3.19.208) with Microsoft SMTP Server
	id 14.3.382.0; Thu, 31 May 2018 11:48:20 +0800
From: Dongjiu Geng <gengdongjiu@huawei.com>
To: <peter.maydell@linaro.org>, <james.morse@arm.com>, <qemu-arm@nongnu.org>, 
	<qemu-devel@nongnu.org>, <linuxarm@huawei.com>
Date: Thu, 31 May 2018 19:53:47 +0800
Message-ID: <1527767630-6479-1-git-send-email-gengdongjiu@huawei.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.143.28.90]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 45.249.212.32
Subject: [Qemu-arm] [PATCH RESEND v1 0/3] add support for VCPU event states
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
X-TUID: nzVpXOFo9IjT

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

