Received: by 10.25.205.13 with SMTP id d13csp1294785lfg;
        Mon, 16 Jan 2017 01:45:51 -0800 (PST)
X-Received: by 10.55.115.5 with SMTP id o5mr12284527qkc.83.1484559951223;
        Mon, 16 Jan 2017 01:45:51 -0800 (PST)
Return-Path: <kvmarm-bounces@lists.cs.columbia.edu>
Received: from mm01.cs.columbia.edu (mm01.cs.columbia.edu. [128.59.11.253])
        by mx.google.com with ESMTP id y187si13894880qka.67.2017.01.16.01.45.51;
        Mon, 16 Jan 2017 01:45:51 -0800 (PST)
Received-SPF: pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) client-ip=128.59.11.253;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) smtp.mailfrom=kvmarm-bounces@lists.cs.columbia.edu
Received: from localhost (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id C683040421;
	Mon, 16 Jan 2017 04:43:59 -0500 (EST)
X-Virus-Scanned: at lists.cs.columbia.edu
X-Spam-Flag: NO
X-Spam-Score: -1.501
X-Spam-Level: 
X-Spam-Status: No, score=-1.501 required=6.1 tests=[BAYES_00=-1.9,
	DNS_FROM_AHBL_RHSBL=2.699, RCVD_IN_DNSWL_MED=-2.3] autolearn=no
Received: from mm01.cs.columbia.edu ([127.0.0.1])
	by localhost (mm01.cs.columbia.edu [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BzGxeRlBAtHB; Mon, 16 Jan 2017 04:43:53 -0500 (EST)
Received: from mm01.cs.columbia.edu (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id 4153C401F2;
	Mon, 16 Jan 2017 04:43:53 -0500 (EST)
Received: from localhost (localhost [127.0.0.1])
 by mm01.cs.columbia.edu (Postfix) with ESMTP id 9BC6F401B9
 for <kvmarm@lists.cs.columbia.edu>; Mon, 16 Jan 2017 04:43:52 -0500 (EST)
X-Virus-Scanned: at lists.cs.columbia.edu
Received: from mm01.cs.columbia.edu ([127.0.0.1])
 by localhost (mm01.cs.columbia.edu [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5YiZ7fJjHpP9 for <kvmarm@lists.cs.columbia.edu>;
 Mon, 16 Jan 2017 04:43:49 -0500 (EST)
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [119.145.14.65])
 by mm01.cs.columbia.edu (Postfix) with ESMTP id 8ADFC40019
 for <kvmarm@lists.cs.columbia.edu>; Mon, 16 Jan 2017 04:43:47 -0500 (EST)
Received: from 172.24.1.36 (EHLO SZXEML424-HUB.china.huawei.com)
 ([172.24.1.36])
 by szxrg02-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
 with ESMTP id DTK49615; Mon, 16 Jan 2017 17:34:58 +0800 (CST)
Received: from HGHY1Z002260041.china.huawei.com (10.177.16.142) by
 SZXEML424-HUB.china.huawei.com (10.82.67.153) with Microsoft SMTP Server id
 14.3.235.1; Mon, 16 Jan 2017 17:34:46 +0800
From: Shannon Zhao <zhaoshenglong@huawei.com>
To: <kvmarm@lists.cs.columbia.edu>
Subject: [PATCH RFC 0/7] ARM64: KVM: Cross type vCPU support
Date: Mon, 16 Jan 2017 17:33:27 +0800
Message-ID: <1484559214-2248-1-git-send-email-zhaoshenglong@huawei.com>
X-Mailer: git-send-email 1.9.0.msysgit.0
MIME-Version: 1.0
X-Originating-IP: [10.177.16.142]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
 refid=str=0001.0A090201.587C93C3.0097, ss=1, re=0.000, recu=0.000, reip=0.000,
 cl=1, cld=1, fgs=0, ip=0.0.0.0,
 so=2013-06-18 04:22:30, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: 5bc4b27d120fa4f65d4d8515d76c7a7b
Cc: marc.zyngier@arm.com, qemu-arm@nongnu.org, wu.wubin@huawei.com
X-BeenThere: kvmarm@lists.cs.columbia.edu
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: Where KVM/ARM decisions are made <kvmarm.lists.cs.columbia.edu>
List-Unsubscribe: <https://lists.cs.columbia.edu/mailman/options/kvmarm>,
 <mailto:kvmarm-request@lists.cs.columbia.edu?subject=unsubscribe>
List-Archive: <https://lists.cs.columbia.edu/pipermail/kvmarm>
List-Post: <mailto:kvmarm@lists.cs.columbia.edu>
List-Help: <mailto:kvmarm-request@lists.cs.columbia.edu?subject=help>
List-Subscribe: <https://lists.cs.columbia.edu/mailman/listinfo/kvmarm>,
 <mailto:kvmarm-request@lists.cs.columbia.edu?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kvmarm-bounces@lists.cs.columbia.edu
Sender: kvmarm-bounces@lists.cs.columbia.edu
X-TUID: 89TJ06H22TUW

From: Shannon Zhao <shannon.zhao@linaro.org>

This patch set adds support for Cross type vCPU in KVM-ARM64. It allows
userspace to request a different vCPU type with the physical ones and
check whether the physical CPUs could support that specific vCPU. If so,
KVM will trap the ID registers and return guest with the values from
usersapce.

This patch set is not complete since the CPU Errata is not considered
and currently it only checks if the id_aa64mmfr0_el1 register value is
legal. I want this as an example and need some feedback from folks if
this approach is right or proper.

You can test this patch set with QEMU using
-cpu cortex-a53/cortex-a57/generic/cortex-a72

These patches can be fetched from:
https://git.linaro.org/people/shannon.zhao/linux-mainline.git cross_vcpu_rfc

You corresponding QEMU patches can be fetched from:
https://git.linaro.org/people/shannon.zhao/qemu.git cross_vcpu_rfc

Thanks,
Shannon

Shannon Zhao (7):
  ARM64: KVM: Add the definition of ID registers
  ARM64: KVM: Add reset handlers for all ID registers
  ARM64: KVM: Reset ID registers when creating the VCPUs
  ARM64: KVM: emulate accessing ID registers
  ARM64: KVM: Support cross type vCPU
  ARM64: KVM: Support heterogeneous system
  ARM64: KVM: Add user set handler for id_aa64mmfr0_el1

 arch/arm/kvm/arm.c                   |  36 ++++-
 arch/arm64/include/asm/kvm_coproc.h  |   1 +
 arch/arm64/include/asm/kvm_emulate.h |   3 +
 arch/arm64/include/asm/kvm_host.h    |  49 +++++-
 arch/arm64/include/uapi/asm/kvm.h    |   1 +
 arch/arm64/kvm/guest.c               |  18 ++-
 arch/arm64/kvm/hyp/sysreg-sr.c       |   2 +
 arch/arm64/kvm/sys_regs.c            | 290 +++++++++++++++++++++++------------
 include/uapi/linux/kvm.h             |   2 +
 9 files changed, 296 insertions(+), 106 deletions(-)

-- 
2.0.4


_______________________________________________
kvmarm mailing list
kvmarm@lists.cs.columbia.edu
https://lists.cs.columbia.edu/mailman/listinfo/kvmarm
