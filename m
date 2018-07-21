Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp3661358wru;
        Sat, 21 Jul 2018 02:59:51 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpc65qyywE1Yadi9c7HLnFjTmQ+9t4/q3zVTnVkJZuKmaa1rg6GMIkOzW8TVHpsrTNXq8Vod
X-Received: by 2002:a37:b91:: with SMTP id 139-v6mr4793138qkl.429.1532167191287;
        Sat, 21 Jul 2018 02:59:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1532167191; cv=none;
        d=google.com; s=arc-20160816;
        b=h7DRAX5MZbsNU2VpMhhaBKNwta/E6RJbTtjPA06zBKA/fZC6jWiid3JDsx+l4qL4tj
         URE6kbbb1jSFZvTnUd4AunvTsTKBAjnmet4EWuWdQJT5GMHbW5Pq/zWO7dyEgsNJjkX5
         L+DSf6MBBjJ5X4sSK0/vj2FYpZ5VeNtZ8hp2F9yoA1AuV9CMzm+Iv+7JKMp7BakXQC4N
         RPOe19z8LSM6WN873Z084VZJPpYSoEuPX/fQ+ta8i/gjQ4s/bz9cVknrISEJhCEZr5Me
         cDg90mE278XH3XuGBqL27HO8/IQ10UzktRoXdkm+42StLaxf7IjyPN7dsGIFq3wMK1HS
         miuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version:message-id
         :date:to:from:arc-authentication-results;
        bh=8S9eQbi76i2AZqDvc+tRH13lLpoT27T9GYgg0qFA6iQ=;
        b=fZpZB7Pc+/mnl0egd5fb0za36z5CfFwfbi+nt0hVSubZBhkS+FJqi8e92RqGnegIWF
         agn2YsB1aaMfY/5HbGUWGKQ7zRLWgQKB3VnEMVBidFIYumW8jz3RCCKvIpxOSB+I7STs
         J/S0R7RycDJy8YawHe6nv5T6kSLE8aU8oETYeSCckPud5Np893yn6cNZvF7KOnpfKwKN
         m8rHVbIWG0YzlP6D243GHj0IdohDzmqsAZZOR9RgMFYA+G695Y5KucgPnz0HhiEM4pbs
         GvacN4wPhg2Ek763aJEEZ1RQbYmKBD0snNtulw5o4jCiM4BFu/FOSLbje1g4XIt5q60O
         G0iQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e3-v6si582254qkm.142.2018.07.21.02.59.51
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 21 Jul 2018 02:59:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:51355 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fgog2-0002Vl-MR
	for alex.bennee@linaro.org; Sat, 21 Jul 2018 05:59:50 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34787)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gengdongjiu@huawei.com>) id 1fgoe3-0001SI-MB
	for qemu-devel@nongnu.org; Sat, 21 Jul 2018 05:57:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <gengdongjiu@huawei.com>) id 1fgoe2-0001aH-MU
	for qemu-devel@nongnu.org; Sat, 21 Jul 2018 05:57:47 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:2637 helo=huawei.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <gengdongjiu@huawei.com>)
	id 1fgody-0001Xe-2Q; Sat, 21 Jul 2018 05:57:42 -0400
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.59])
	by Forcepoint Email with ESMTP id B654B2552B5B3;
	Sat, 21 Jul 2018 17:57:26 +0800 (CST)
Received: from localhost.localdomain (10.143.28.90) by
	DGGEMS413-HUB.china.huawei.com (10.3.19.213) with Microsoft SMTP Server
	id 14.3.382.0; Sat, 21 Jul 2018 17:57:22 +0800
From: Dongjiu Geng <gengdongjiu@huawei.com>
To: <peter.maydell@linaro.org>, <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
Date: Sat, 21 Jul 2018 14:02:39 -0400
Message-ID: <1532196162-29453-1-git-send-email-gengdongjiu@huawei.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.143.28.90]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 45.249.212.190
Subject: [Qemu-devel] [PATCH v6 0/3] add support for VCPU event states
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
Cc: linuxarm@huawei.com, gengdongjiu@huawei.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: cQm9SYzDWoZs

Support for KVM_GET/SET_VCPU_EVENTS to get/set the SError exception
state, and support the state migration.

change since v4:
1. update the linux header files to 4.18-rc5 

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

