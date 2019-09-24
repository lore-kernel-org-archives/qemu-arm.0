Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp4043927wrp;
        Tue, 24 Sep 2019 08:22:22 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxDa1kUSFUc8fq4/xIsMcKHsyY0/HYFTI2sk/iG3WUt6SyYntdIDv3VYFIY0D6BlWmS2gyG
X-Received: by 2002:a17:906:ccd6:: with SMTP id ot22mr3035980ejb.1.1569338542594;
        Tue, 24 Sep 2019 08:22:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1569338542; cv=none;
        d=google.com; s=arc-20160816;
        b=DidwJggEkT080Tn82BE5tT2rYi2RufZAnZbXfU48WJQqkU899tAR1sUOmHCSpqRAuz
         ku/Z22U8tLpHe1bn1NigVB1OaCe2Uy1Y0rRczEUm8EnouJvGHuwx7nj1MdojzAU0twpI
         52B4YLCm98XWwLa33Y/ootDdhrmF1rdZpVgARCc0yehi4AgA2y7mJXItaf8d+G4WCOI7
         jUh4O2DG/9+fowrWAfj71tuADQOq5j0bPgmKl6y/UdhEnPcUSs8zpVM6BQf7+RcmVAlX
         Sc1vunH9o7PISA2MYPeLsQtc/qlaRvi+SlAawIie856BZgiptbJY02gj1FZtb1WYmPi9
         iW+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:mime-version:message-id:date:subject:cc
         :to:from;
        bh=K19evHUiUHkaO5FBhqGL5o1nwS7Ou96O0gIFNabO/LE=;
        b=uGYUweGP+aoG9T8jdGiimK+n0XBU/pbqK/oGRBlxSZvtIweydpOPEPHtlRVXjGSgf5
         W12NtIZ4N3tgaAZsb5haim6vwnWRoJBSMHeNKzT9DVUtgaRvXGaMMf+w6GA0npD1jw7/
         DKi81H1U+MVKp3p9X/oj3MK10CVdXziYWzYalg+AtOE1Tl0NwQ9O5c7cFEnI55UoPd6k
         Ywd66bpnvntewSTkG1bTG9x8xLVfMXmjGCGUUuZHJDNP7F1EZ8FU/vN59gGg4Oak09cR
         jUXdT2ZgNnyX/vIDXulyHTsvUyiI7mmLP+5uvxO319OoOyCJsEDxV/TLLA/oahmK2eC1
         V8XQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of linux-kernel-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=linux-kernel-owner@vger.kernel.org
Return-Path: <linux-kernel-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id ot6si1073417ejb.62.2019.09.24.08.22.22;
        Tue, 24 Sep 2019 08:22:22 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of linux-kernel-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of linux-kernel-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=linux-kernel-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732527AbfIXPWV (ORCPT <rfc822;mike.holmes@linaro.org>
        + 26 others); Tue, 24 Sep 2019 11:22:21 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:46512 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727382AbfIXPWV (ORCPT <rfc822;linux-kernel@vger.kernel.org>);
        Tue, 24 Sep 2019 11:22:21 -0400
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.60])
        by Forcepoint Email with ESMTP id 19DE9F71006A9E2A596B;
        Tue, 24 Sep 2019 23:22:19 +0800 (CST)
Received: from linux-Bxxcye.huawei.com (10.175.104.222) by
 DGGEMS401-HUB.china.huawei.com (10.3.19.201) with Microsoft SMTP Server id
 14.3.439.0; Tue, 24 Sep 2019 23:22:09 +0800
From:   Heyi Guo <guoheyi@huawei.com>
To:     <linux-arm-kernel@lists.infradead.org>,
        <kvmarm@lists.cs.columbia.edu>, <linux-kernel@vger.kernel.org>,
        <kvm@vger.kernel.org>, <qemu-arm@nongnu.org>
CC:     <wanghaibin.wang@huawei.com>, Heyi Guo <guoheyi@huawei.com>,
        Peter Maydell <peter.maydell@linaro.org>,
        Dave Martin <Dave.Martin@arm.com>,
        Marc Zyngier <marc.zyngier@arm.com>,
        Mark Rutland <mark.rutland@arm.com>,
        James Morse <james.morse@arm.com>
Subject: [RFC PATCH 0/2] Add virtual SDEI support for arm64
Date:   Tue, 24 Sep 2019 23:20:52 +0800
Message-ID: <1569338454-26202-1-git-send-email-guoheyi@huawei.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.104.222]
X-CFilter-Loop: Reflected
Sender: linux-kernel-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kernel.vger.kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
X-TUID: 9IB4mH4QOKT/

As promised, this is the first RFC patch set for arm64 virtual SDEI
support.

New kvm capability KVM_CAP_FORWARD_HYPERCALL is added to probe if kvm
supports forwarding hypercalls, and the capability should be enabled
explicitly. PSCI can be set as exception for backward compatibility.

We reuse the existing term "hypercall" for SMC/HVC, as well as the
hypercall structure in kvm_run to exchange arguments and return
values. The definition on arm64 is as below:

exit_reason: KVM_EXIT_HYPERCALL

Input:
  nr: the immediate value of SMC/HVC calls; not really used today.
  args[6]: x0..x5 (This is not fully conform with SMCCC which requires
           x6 as argument as well, but use space can use GET_ONE_REG
           ioctl for such rare case).

Return:
  args[0..3]: x0..x3 as defined in SMCCC. We need to extract
              args[0..3] and write them to x0..x3 when hypercall exit
              returns.

And there is a corresponding patch set for qemu.

Please give your comments and suggestions.

Thanks,
HG

Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: Dave Martin <Dave.Martin@arm.com>
Cc: Marc Zyngier <marc.zyngier@arm.com>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: James Morse <james.morse@arm.com>

Heyi Guo (2):
  kvm/arm: add capability to forward hypercall to user space
  kvm/arm64: expose hypercall_forwarding capability

 arch/arm/include/asm/kvm_host.h   |  5 +++++
 arch/arm64/include/asm/kvm_host.h |  5 +++++
 arch/arm64/kvm/reset.c            | 25 +++++++++++++++++++++++++
 include/kvm/arm_psci.h            |  1 +
 include/uapi/linux/kvm.h          |  3 +++
 virt/kvm/arm/arm.c                |  2 ++
 virt/kvm/arm/psci.c               | 30 ++++++++++++++++++++++++++++--
 7 files changed, 69 insertions(+), 2 deletions(-)

-- 
1.8.3.1
