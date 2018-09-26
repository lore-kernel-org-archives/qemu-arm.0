Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp633793wrt;
        Wed, 26 Sep 2018 05:50:38 -0700 (PDT)
X-Google-Smtp-Source: ACcGV62EJC76FZ6WThJ8+Tz1t75Paz+2E7CwtSMEY6BF34M5doUBTdqkQ/4VkXQzq82ddc/QOV+q
X-Received: by 2002:a0c:f884:: with SMTP id u4-v6mr4065838qvn.150.1537966238452;
        Wed, 26 Sep 2018 05:50:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1537966238; cv=none;
        d=google.com; s=arc-20160816;
        b=sihH1BEdvrfPXGFpC7XLYSM/784tfqqz8XZoV/UMzEgU3VypG97eYKBNV7J1Mxkmwm
         m9GE1BGlkg3ThSTtf1BcfaknM8q0/dBqP2jbqJlXfAvBKUi0hvODF+1Tl5z5UBB+lf7M
         WvaOkAhvtuFkjgc9RWo2ZPosctKFSVnWT9xeVs4HqaY291wgltqzAZBkg5XfJ9ACXGiS
         OsSBiam2+nQXblLl9At3uhFHd+Q0KVXzP1dbBwXQrQyv90aCLzv0J5g+LwmOtPWtUo3r
         24pxCmnIaY+Z0i6qw3jMXFQbo9T1LpbwNp7u/QpMHviaGxvb6H+Nw8dd2PFjyulQVPxZ
         i0EA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version:message-id
         :date:to:from;
        bh=V/+7ub4KDQu4yyDj9jCcSPcGSydSi03FQ2trOYr4oig=;
        b=S5/q1Ho2lR8tivPa8wmK4Iq4INy+dyap+t73arE5mBUmQvYuFDB1jijQRSrjCsDJvf
         0hWkm9ByWw6ijfFc7lpswL1Xx95YqsT5H5covAp63r2/yb5zLuE00AKgwjXQgsGD2f6T
         Xm9fPpzyurF8qQ2ZkEAlyEHMkzr+sClx86gedebzXyx0iLQ2RMJNJpN018pWFJm0Z3mE
         NWZCC/NVdcKqu0vCgg3nMH9ZEjcd1Y6CoUdDQG2qu+IlR5nr0/3pHsKMAl5hv9oviBGX
         Vq/lKfK4skLN6kwCVNZcolr4RA5jFzVSTmkKaM7DWNYRfY8Km2fKoLREtAmsN3YlvKce
         EoCA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t127-v6si3786925qke.361.2018.09.26.05.50.38
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 26 Sep 2018 05:50:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:58761 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g59H3-000813-UF
	for alex.bennee@linaro.org; Wed, 26 Sep 2018 08:50:37 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56659)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gengdongjiu@huawei.com>) id 1g59GZ-0007zA-GO
	for qemu-devel@nongnu.org; Wed, 26 Sep 2018 08:50:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <gengdongjiu@huawei.com>) id 1g59GY-0001g4-Ou
	for qemu-devel@nongnu.org; Wed, 26 Sep 2018 08:50:07 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:60304 helo=huawei.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <gengdongjiu@huawei.com>)
	id 1g59GR-0001WH-Pf; Wed, 26 Sep 2018 08:50:00 -0400
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.58])
	by Forcepoint Email with ESMTP id BEA38F6FAC5;
	Wed, 26 Sep 2018 20:49:53 +0800 (CST)
Received: from localhost.localdomain (10.143.28.90) by
	DGGEMS409-HUB.china.huawei.com (10.3.19.209) with Microsoft SMTP Server
	id 14.3.399.0; Wed, 26 Sep 2018 20:49:47 +0800
From: Dongjiu Geng <gengdongjiu@huawei.com>
To: <peter.maydell@linaro.org>, <drjones@redhat.com>,
	<shannon.zhaosl@gmail.com>, <qemu-devel@nongnu.org>,
	<qemu-arm@nongnu.org>, <gengdongjiu@huawei.com>
Date: Wed, 26 Sep 2018 16:53:54 -0400
Message-ID: <1537995236-43145-1-git-send-email-gengdongjiu@huawei.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.143.28.90]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 45.249.212.32
Subject: [Qemu-devel] [PATCH RESEND RFC v10 0/2] add support for VCPU event
 states
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 2WQjWZQ7qubJ

Support KVM_GET/SET_VCPU_EVENTS to get/set the SError exception state, and
support the state migration.

Now the VCPU event only includes the SError exception status, it can be
extended if needed. When do migration, If source machine has serror pending, 
the target machine is also needed to pend this serror regardless of whether
target machine can support to set the serror syndrome.

Note: Because I do not have arm32 environment, I only this patch in the KVM64,
not test it in the KVM32. So I need someone else test it in the 32 bit KVM platform.
Thanks.

Dongjiu Geng (2):
  linux-headers: Update to linux kernel 4.19-rc5
  target/arm: Add support for VCPU event states

 include/standard-headers/linux/input.h |  9 +++--
 linux-headers/asm-arm/kvm.h            | 13 +++++++
 linux-headers/asm-arm64/kvm.h          | 13 +++++++
 linux-headers/asm-x86/kvm.h            |  1 +
 linux-headers/linux/kvm.h              |  2 +
 linux-headers/linux/vhost.h            |  2 +-
 target/arm/cpu.h                       |  7 ++++
 target/arm/kvm32.c                     | 70 ++++++++++++++++++++++++++++++++++
 target/arm/kvm64.c                     | 68 +++++++++++++++++++++++++++++++++
 target/arm/machine.c                   | 22 +++++++++++
 10 files changed, 202 insertions(+), 5 deletions(-)

-- 
2.7.4

