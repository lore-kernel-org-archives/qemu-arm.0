Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1308554lfm;
        Thu, 25 Jun 2020 06:43:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzCuASl9Zet0FaVEgkQzbBtN6tkTZdCe9eq2F66ZfuT09BwuM6jsxk034kaSpP/9j5cPl71
X-Received: by 2002:aa7:df08:: with SMTP id c8mr22249902edy.372.1593092639095;
        Thu, 25 Jun 2020 06:43:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593092639; cv=none;
        d=google.com; s=arc-20160816;
        b=jiNpPhzJcIZtEfbgBaJ8bj22u2dUSHe/TY0Wp/2wOxL0uwQw8lzFmK6pgwzvmBeiJg
         CNOssCA77+LLgWOxJqH7KcZAzA1NTRdwlcYAFS3gyAHXUPZDt1Co3NZZShEdOxPdMRhQ
         nLSAHSHaS63hAurK4ykO9HfGUY0A+yV02B4mvNQ75hna7nfuPnzVy5V3pnjWxsCWy2nH
         6URFU3wH9Gbjzlvfq3UHuN5vcz81t7otWnhwg8KV0vmxEdKbMmrDo2YlG6WwnfgBTp/2
         7DrspvjZQV70B46YUg07YNk84F7DldpE/DoaYp8nAmWJX41k7X2ofzLD7TaOiivwKmKD
         diIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:mime-version:message-id:date:subject:cc
         :to:from;
        bh=q83tapiGBbbqZoX7CIlNw2hQYSBVRYLU+uhkbgZOBeY=;
        b=GVOJ3vIUJIGKAwXlqb2N4V7+/z9MzBnhkpP+gpyyDunk72Ke9H+9+VmfUs8O/ps7tS
         XOIfejPOc9kX9b1Fsin2CgIDw0YM/pI077IQfgiNJPM4ErmzA6awjVUNTEKJoMO/qKeV
         pzMtHWLu3U1BrXsTFjhcz4ghOwsAnYdi5+0ugJi02A2oky7+N/29Zi4hddIY+zEIkCXV
         pg5Uji9kFzD3t+hV8fKqsgjizYrnWzXoLrhahbwiPCmJiIQuN66UoJcbCK2u+aC+WEMa
         AGvyGSWGAz1gFfn5aSWWbjJXg0h7osZ/LnFEkWOnySFewhAHeVcwlmU5jYh5YMTaOMET
         Ee9Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of linux-kernel-owner@vger.kernel.org designates 23.128.96.18 as permitted sender) smtp.mailfrom=linux-kernel-owner@vger.kernel.org
Return-Path: <linux-kernel-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [23.128.96.18])
        by mx.google.com with ESMTP id b22si10259972edt.334.2020.06.25.06.43.58;
        Thu, 25 Jun 2020 06:43:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of linux-kernel-owner@vger.kernel.org designates 23.128.96.18 as permitted sender) client-ip=23.128.96.18;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of linux-kernel-owner@vger.kernel.org designates 23.128.96.18 as permitted sender) smtp.mailfrom=linux-kernel-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405213AbgFYNnx (ORCPT <rfc822;peter.puhov@linaro.org>
        + 27 others); Thu, 25 Jun 2020 09:43:53 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:60012 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2404890AbgFYNnx (ORCPT <rfc822;linux-kernel@vger.kernel.org>);
        Thu, 25 Jun 2020 09:43:53 -0400
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.60])
        by Forcepoint Email with ESMTP id 429DA41853EE28F8554D;
        Thu, 25 Jun 2020 21:43:50 +0800 (CST)
Received: from A190218597.china.huawei.com (10.47.76.118) by
 DGGEMS402-HUB.china.huawei.com (10.3.19.202) with Microsoft SMTP Server id
 14.3.487.0; Thu, 25 Jun 2020 21:43:41 +0800
From:   Salil Mehta <salil.mehta@huawei.com>
To:     <linux-arm-kernel@lists.infradead.org>
CC:     <maz@kernel.org>, <will@kernel.org>, <catalin.marinas@arm.com>,
        <christoffer.dall@arm.com>, <andre.przywara@arm.com>,
        <james.morse@arm.com>, <mark.rutland@arm.com>,
        <lorenzo.pieralisi@arm.com>, <sudeep.holla@arm.com>,
        <qemu-arm@nongnu.org>, <peter.maydell@linaro.org>,
        <richard.henderson@linaro.org>, <imammedo@redhat.com>,
        <mst@redhat.com>, <drjones@redhat.com>, <pbonzini@redhat.com>,
        <eric.auger@redhat.com>, <gshan@redhat.com>, <david@redhat.com>,
        <kvm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linuxarm@huawei.com>, <mehta.salil.lnk@gmail.com>,
        Salil Mehta <salil.mehta@huawei.com>
Subject: [PATCH RFC 0/4] Changes to Support *Virtual* CPU Hotplug for ARM64
Date:   Thu, 25 Jun 2020 14:37:53 +0100
Message-ID: <20200625133757.22332-1-salil.mehta@huawei.com>
X-Mailer: git-send-email 2.8.3
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.47.76.118]
X-CFilter-Loop: Reflected
Sender: linux-kernel-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kernel.vger.kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
X-TUID: lOzW3X4Wgk8X

Changes to support virtual cpu hotplug in QEMU[1] have been introduced to the
community as RFC. These are under review.

To support virtual cpu hotplug guest kernel must:
1. Identify disabled/present vcpus and set/unset the present mask of the vcpu
   during initialization and hotplug event. It must also set the possible mask
   (which includes disabled vcpus) during init of guest kernel.
2. Provide architecture specific ACPI hooks, for example to map/unmap the
   logical cpuid to hwids/MPIDR. Linux kernel already has generic ACPI cpu
   hotplug framework support.

Changes introduced in this patch-set also ensures that initialization of the
cpus when virtual cpu hotplug is not supported remains un-affected.

Repository:
(*) Kernel changes are at,
     https://github.com/salil-mehta/linux.git virt-cpuhp-arm64/rfc-v1
(*) QEMU changes for vcpu hotplug could be cloned from below site,
     https://github.com/salil-mehta/qemu.git virt-cpuhp-armv8/rfc-v1


THINGS TO DO:
1. Handling of per-cpu variables especially the first-chunk allocations
   (which are NUMA aware) when the vcpu is hotplugged needs further attention
   and review.
2. NUMA related stuff has not been fully tested both in QEMU and kernel.
3. Comprehensive Testing including when cpu hotplug is not supported.
4. Docs

DISCLAIMER:
This is not a complete work but an effort to present the arm vcpu hotplug
implementation to the community. This RFC is being used as a way to verify
the idea mentioned above and to support changes presented for QEMU[1] to
support vcpu hotplug. As of now this is *not* a production level code and might
have bugs. Only a basic testing has been done on HiSilicon Kunpeng920 ARM64
based SoC for Servers to verify the proof-of-concept that has been found working!

Best regards
Salil.

REFERENCES:
[1] https://www.mail-archive.com/qemu-devel@nongnu.org/msg712010.html
[2] https://lkml.org/lkml/2019/6/28/1157
[3] https://lists.cs.columbia.edu/pipermail/kvmarm/2018-July/032316.html

Organization of Patches:
[Patch 1-3]
(*) Changes required during guest boot time to support vcpu hotplug 
(*) Max cpu overflow checks
(*) Changes required to pre-setup cpu-operations even for disabled cpus
[Patch 4]
(*) Arch changes required by guest kernel ACPI CPU Hotplug framework.


Salil Mehta (4):
  arm64: kernel: Handle disabled[(+)present] cpus in MADT/GICC during
    init
  arm64: kernel: Bound the total(present+disabled) cpus with nr_cpu_ids
  arm64: kernel: Init cpu operations for all possible vcpus
  arm64: kernel: Arch specific ACPI hooks(like logical cpuid<->hwid
    etc.)

 arch/arm64/kernel/smp.c | 153 ++++++++++++++++++++++++++++++++--------
 1 file changed, 123 insertions(+), 30 deletions(-)

-- 
2.17.1

