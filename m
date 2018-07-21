Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp3657705wru;
        Sat, 21 Jul 2018 02:53:27 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpcUu4WTBm1obM+1I+d/Yli80D1Ow4OC1Lmoqe7o16QPINL6OzXWLybgMKU1/xIwXLENQ2oZ
X-Received: by 2002:a0c:aa46:: with SMTP id e6-v6mr4722471qvb.50.1532166807576;
        Sat, 21 Jul 2018 02:53:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1532166807; cv=none;
        d=google.com; s=arc-20160816;
        b=yxcvxkkdSaS+TxDMxUIvXUfVB/AD3W7vhNl+WsqyweVVohXmbSyqZUa4QL5xT/3nZM
         FQfNis3GZJUWbISmS+UqTrDPfSRp9jcT70rjAMw7LIJE0Sw0d2H1oG+QHL7rK8/SY8rH
         x2Em69nGXVtag2+m5daSw/lMk4pGai9RB+8Jk8bXnH1RFbHchcI22CmjmjpbqqGmiulB
         n2OK9esA2ldsrqY/uT7PJDXWlI7GhpgqlPwftoGQua3lGx7DtzPehr5jZE2BEepBe1cm
         KnlZ/nUJeC9b6KYfLwjfD9/X+aQKDEZBfEyvOMlmVWfyjSWvw4mcDKw2PwCAl5L8BRKR
         nUdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version:message-id
         :date:to:from:arc-authentication-results;
        bh=VozGxwiV9Cqba6/Q02ILfmaCe3kUW7mvMaIndViYx6g=;
        b=DaBzLIFORh6LJI57sE1wMb4XZa9Yr8OZ2T3nUFHtws+X4MVdiH0I/6qmDtilOkHpjm
         Qs7UE+MaRBZlnlOUP0cj/qBN89r9mz4NI0vMZp/yP4IcK7sms+ItmSXKBW+rTL0Yo5hn
         NxZOjWDyMFZB0ClcWhEu0gJzgQ1ntxReVhpp7BzFDHgLKwi3Y8sdJ2Ldqdd3vEc6n1w9
         MbFaz4T8R2WaEBdrZoNGzSkLRMA4Q90s16e+oLUJlV9zxDywhdO5xYBq1lW4NafM+iKP
         sChGVvUrYlC1UQsmjK2g/CqSpZl4YCNfSw/Lg3UICsY+2YQ3+ZaP6S8LLBlQqkdcKR7i
         F/ow==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z30-v6si1393877qve.249.2018.07.21.02.53.27
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 21 Jul 2018 02:53:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:51323 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fgoZr-0006J5-34
	for alex.bennee@linaro.org; Sat, 21 Jul 2018 05:53:27 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33750)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gengdongjiu@huawei.com>) id 1fgoZL-00066W-Qa
	for qemu-arm@nongnu.org; Sat, 21 Jul 2018 05:52:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <gengdongjiu@huawei.com>) id 1fgoZI-0007Yo-QQ
	for qemu-arm@nongnu.org; Sat, 21 Jul 2018 05:52:55 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:2556 helo=huawei.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <gengdongjiu@huawei.com>)
	id 1fgoZI-0007XD-Cj; Sat, 21 Jul 2018 05:52:52 -0400
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.60])
	by Forcepoint Email with ESMTP id 1F5BC96309E59;
	Sat, 21 Jul 2018 17:52:30 +0800 (CST)
Received: from localhost.localdomain (10.143.28.90) by
	DGGEMS404-HUB.china.huawei.com (10.3.19.204) with Microsoft SMTP Server
	id 14.3.382.0; Sat, 21 Jul 2018 17:52:23 +0800
From: Dongjiu Geng <gengdongjiu@huawei.com>
To: <peter.maydell@linaro.org>, <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
Date: Sat, 21 Jul 2018 13:57:40 -0400
Message-ID: <1532195863-23945-1-git-send-email-gengdongjiu@huawei.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.143.28.90]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 45.249.212.191
Subject: [Qemu-arm] [PATCH v5 0/3] add support for VCPU event states
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
Cc: linuxarm@huawei.com, gengdongjiu@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 2mirweRKOP1A

Support for KVM_GET/SET_VCPU_EVENTS to get/set the SError exception
state, and support the state migration.

change since v4:
1. update the linux header file to 4.18-rc5 

change since v3:
1. Add a new new subsection with a suitable 'ras_needed' function
controlling whether it is present
2. Add a ARM_FEATURE_RAS feature bit for CPUARMState

change since v2:
1. add header definition for arm platform

change since v1:
1. update the code to fix the build errors

The related kernel change has been already applied to kvmarm/next.
(https://git.kernel.org/pub/scm/linux/kernel/git/kvmarm/kvmarm.git/log/?h=next)

Dongjiu Geng (3):
  Update Linux headers to 4.18-rc5
  kvm: sync linux headers
  target: arm: Add support for VCPU event states

 include/standard-headers/linux/virtio_config.h | 16 +++++--
 linux-headers/asm-arm/kvm.h                    | 13 ++++++
 linux-headers/asm-arm64/kvm.h                  | 13 ++++++
 linux-headers/asm-mips/unistd.h                | 18 +++++---
 linux-headers/asm-powerpc/kvm.h                |  1 +
 linux-headers/asm-powerpc/unistd.h             |  1 +
 linux-headers/asm-s390/unistd_32.h             |  2 +
 linux-headers/asm-s390/unistd_64.h             |  2 +
 linux-headers/linux/kvm.h                      |  1 +
 target/arm/cpu.h                               |  6 +++
 target/arm/kvm64.c                             | 59 ++++++++++++++++++++++++++
 target/arm/machine.c                           | 22 ++++++++++
 12 files changed, 144 insertions(+), 10 deletions(-)

-- 
1.8.3.1

