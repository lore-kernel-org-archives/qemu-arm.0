Received: by 2002:a05:7022:120c:b0:76:3752:a982 with SMTP id ox12csp109266dlb;
        Wed, 28 Feb 2024 01:31:23 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWSVwKXZmPN0RBEh9mT6b3ByMm9+R+eHYDpYhTkoG51GsKPU6cjcCphy1C0wszx8AoJRQVq4NZXZdFcq2jmNZoWtThwRBDh
X-Google-Smtp-Source: AGHT+IGX/Svhv/l4vxE7DYBWDvU16PbOU/1i8mAVo7n8xru43ATDV8bXFtcBri67ZnSgj3p3Py6A
X-Received: by 2002:a05:620a:2485:b0:787:ad2e:682f with SMTP id i5-20020a05620a248500b00787ad2e682fmr5751839qkn.52.1709112682853;
        Wed, 28 Feb 2024 01:31:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1709112682; cv=none;
        d=google.com; s=arc-20160816;
        b=v9TwxjKVbht52rptTtVnrXPJ/S2PrTM4LAzcxDI+gvvHoQph8qs+Dkl+zWc+I74VQC
         xh6Qn2lZql216fxyf5k0zogzx1HjuIKUAa0QMF1+n28vqa347cPVLcVMkCRqADW2kUD3
         uU6QUzC6jqsNSwhUJvgp4o4yisUROuv4wvs2bkr1h+vG+m8hfOC+KcjL2QS+AkGzeZ2m
         zGPmLXc+NF00fgt2QHi9YqHRUutW8q6O6KJ5NDtxnICXvQGYbLY9s6h64vM6ERMo80Qy
         6g9oWgn+RTJVYcrfZsl8xssfioT4uYybpxaWxX6V2h6ftD3LMjD1RFWj2ruPh5+WUBhT
         m5Zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to;
        bh=grhSq2Ql2KKlHJ9sWl+aw+CflRMvtrj8nr8YDnlHsus=;
        fh=7La06MPWnWIeY2syFASYiv5clJRkW0OVzImHIa97XCQ=;
        b=qZZzKXDAa+xOF4WUsJOfPyTgYwVlgWJO/CL1zRqqcSpYGaVaHZRSeKeeej5lAkXvnc
         IWlx0LGK+2FFynkupNy3p7Vm8G69Ha/K9qD01qIwgom8Bmgbh6uGQM7VfxnOzrB8Yu17
         sRRYlOt/FwIuMYbT8GmW8zRGGcf63KoWFrt42S91mmtPVeq2sWsDq4g5yKl9A8DaUy7A
         qxTfUlE7OaSVBGbBP58Cgdm41B2aBDI7e4+hcq3XdbnZqd6D3yvfPVvWYVsUoSIwF42b
         8WRgqsfwTtQjfb1m+L+FZ7G1GQ8RRJ/tq3pAFHddqGmtwyFSpyROHhA140oKPObIUZL6
         2xQQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c23-20020a37e117000000b00787b7b46c49si9363150qkm.683.2024.02.28.01.31.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 28 Feb 2024 01:31:22 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rfGHX-00019F-7U; Wed, 28 Feb 2024 04:31:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rfGHJ-00010x-Nu; Wed, 28 Feb 2024 04:31:07 -0500
Received: from szxga02-in.huawei.com ([45.249.212.188])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rfGHG-0001OW-1t; Wed, 28 Feb 2024 04:31:05 -0500
Received: from mail.maildlp.com (unknown [172.19.88.105])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4Tl8GB3y96zLqld;
 Wed, 28 Feb 2024 17:30:10 +0800 (CST)
Received: from kwepemi500008.china.huawei.com (unknown [7.221.188.139])
 by mail.maildlp.com (Postfix) with ESMTPS id BD1BC1402E2;
 Wed, 28 Feb 2024 17:30:49 +0800 (CST)
Received: from huawei.com (10.67.174.55) by kwepemi500008.china.huawei.com
 (7.221.188.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.35; Wed, 28 Feb
 2024 17:30:49 +0800
To: <peter.maydell@linaro.org>, <eduardo@habkost.net>,
 <marcel.apfelbaum@gmail.com>, <philmd@linaro.org>, <wangyanan55@huawei.com>,
 <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
CC: <ruanjinjie@huawei.com>
Subject: [RFC PATCH v4 00/22] target/arm: Implement FEAT_NMI and FEAT_GICv3_NMI
Date: Wed, 28 Feb 2024 09:29:24 +0000
Message-ID: <20240228092946.1768728-1-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.174.55]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemi500008.china.huawei.com (7.221.188.139)
Received-SPF: pass client-ip=45.249.212.188;
 envelope-from=ruanjinjie@huawei.com; helo=szxga02-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Reply-to:  Jinjie Ruan <ruanjinjie@huawei.com>
From:  Jinjie Ruan via <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 5RVv/X9RyqLA

This patch set implements FEAT_NMI and FEAT_GICv3_NMI for armv8. These
introduce support for a new category of interrupts in the architecture
which we can use to provide NMI like functionality.

There are two modes for using this FEAT_NMI. When PSTATE.ALLINT or
PSTATE.SP & SCTLR_ELx.SCTLR_SPINTMASK is set, any entry to ELx causes all
interrupts including those with superpriority to be masked on entry to ELn
until the mask is explicitly removed by software or hardware. PSTATE.ALLINT
can be managed by software using the new register control ALLINT.ALLINT.
Independent controls are provided for this feature at each EL, usage at EL1
should not disrupt EL2 or EL3.

I have tested it with the following linux patches which try to support
FEAT_NMI in linux kernel:

	https://lore.kernel.org/linux-arm-kernel/Y4sH5qX5bK9xfEBp@lpieralisi/T/#mb4ba4a2c045bf72c10c2202c1dd1b82d3240dc88

In the test, SGI, PPI and SPI interrupts can all be set to have super priority
to be converted to a hardware NMI interrupt. The SGI is tested with kernel
IPI as NMI framework, softlockup, hardlockup and kgdb test cases, and the PPI
interrupt is tested with "perf top" command with hardware NMI enabled, and
the SPI interrupt is tested with a custom test module, in which NMI interrupts
can be received and sent normally.

However, the Virtual NMI(VNMI) has not been tested.

         +-------------------------------------------------+
         |               Distributor                       |
         +-------------------------------------------------+
             SPI |  NMI                         |  NMI
                \/                            \/
            +--------+                     +-------+
            | Redist |                     | Redist|
            +--------+                     +-------+
            SGI  | NMI                     PPI | NMI
                \/                            \/
          +-------------+             +---------------+
          |CPU Interface|   ...       | CPU Interface |
          +-------------+             +---------------+
               | NMI                         | NMI
              \/                            \/
            +-----+                       +-----+
            |  PE |                       |  PE |
            +-----+                       +-----+

Changes in v4:
- Handle VNMI within the CPU and the GIC.
- Keep PSTATE.ALLINT in env->pstate but not env->allint.
- Fix the ALLINT MSR (immediate) decodetree implementation.
- Accept NMI unconditionally for arm_cpu_has_work() but add comment.
- Improve nmi mask in arm_excp_unmasked().
- Make the GICR_INMIR0 and GICD_INMIR implementation more clearer.
- Improve ICC_NMIAR1_EL1 implementation
- Extract gicv3_get_priority() to avoid priority code repetition.
- Add Reviewed-by.

Changes in v3:
- Remove the FIQ NMI.
- Adjust the patches Sequence.
- Reomve the patch "Set pstate.ALLINT in arm_cpu_reset_hold".
- Check whether support FEAT_NMI and FEAT_GICv3 for FEAT_GICv3_NMI.
- With CPU_INTERRUPT_NMI, both CPSR_I and ISR_IS must be set.
- Not include NMI logic when FEAT_NMI or SCTLR_ELx.NMI not enabled.
- Refator nmi mask in arm_excp_unmasked().
- Add VNMI definitions, add HCRX_VINMI and HCRX_VFNMI support in HCRX_EL2.
- Add Reviewed-by and Acked-by.
- Update the commit message.

Changes in v2:
- Break up the patches so that each one does only one thing.
- Remove the command line option and just implement it in "max" cpu.

Jinjie Ruan (22):
  target/arm: Handle HCR_EL2 accesses for bits introduced with FEAT_NMI
  target/arm: Add PSTATE.ALLINT
  target/arm: Add support for FEAT_NMI, Non-maskable Interrupt
  target/arm: Implement ALLINT MSR (immediate)
  target/arm: Support MSR access to ALLINT
  target/arm: Add support for Non-maskable Interrupt
  target/arm: Add support for NMI in arm_phys_excp_target_el()
  target/arm: Handle IS/FS in ISR_EL1 for NMI
  target/arm: Handle PSTATE.ALLINT on taking an exception
  hw/arm/virt: Wire NMI and VNMI irq lines from GIC to CPU
  hw/intc/arm_gicv3: Add external IRQ lines for NMI
  target/arm: Handle NMI in arm_cpu_do_interrupt_aarch64()
  hw/intc/arm_gicv3: Add irq superpriority information
  hw/intc/arm_gicv3_redist: Implement GICR_INMIR0
  hw/intc/arm_gicv3: Implement GICD_INMIR
  hw/intc: Enable FEAT_GICv3_NMI Feature
  hw/intc/arm_gicv3: Add NMI handling CPU interface registers
  hw/intc/arm_gicv3: Implement NMI interrupt prioirty
  hw/intc/arm_gicv3: Report the NMI interrupt in gicv3_cpuif_update()
  hw/intc/arm_gicv3: Report the VNMI interrupt
  target/arm: Add FEAT_NMI to max
  hw/arm/virt: Add FEAT_GICv3_NMI feature support in virt GIC

 docs/system/arm/emulation.rst      |  1 +
 hw/arm/virt.c                      | 25 ++++++++-
 hw/intc/arm_gicv3.c                | 71 +++++++++++++++++++++---
 hw/intc/arm_gicv3_common.c         |  7 +++
 hw/intc/arm_gicv3_cpuif.c          | 77 ++++++++++++++++++++++++--
 hw/intc/arm_gicv3_dist.c           | 36 ++++++++++++
 hw/intc/arm_gicv3_redist.c         | 19 +++++++
 hw/intc/gicv3_internal.h           |  6 ++
 hw/intc/trace-events               |  1 +
 include/hw/intc/arm_gic_common.h   |  2 +
 include/hw/intc/arm_gicv3_common.h |  7 +++
 target/arm/cpu-features.h          |  5 ++
 target/arm/cpu-qom.h               |  4 +-
 target/arm/cpu.c                   | 88 ++++++++++++++++++++++++++++--
 target/arm/cpu.h                   |  8 +++
 target/arm/helper.c                | 73 +++++++++++++++++++++++++
 target/arm/internals.h             | 13 +++++
 target/arm/tcg/a64.decode          |  1 +
 target/arm/tcg/cpu64.c             |  1 +
 target/arm/tcg/helper-a64.c        | 16 ++++++
 target/arm/tcg/helper-a64.h        |  1 +
 target/arm/tcg/translate-a64.c     | 19 +++++++
 22 files changed, 460 insertions(+), 21 deletions(-)

-- 
2.34.1

