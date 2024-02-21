Received: by 2002:a17:906:c8d8:b0:a3e:79c1:d636 with SMTP id gc24csp1982720ejb;
        Wed, 21 Feb 2024 07:17:02 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUyvEN04WQhnrcwe5Mr7LbSV3iHq95+PIm6qJgsSXVFDFz3fYtD4HwxMJNKs/ZtoKpTnR90TYfW/zEvgFcKxKu/h8hh2K6S
X-Google-Smtp-Source: AGHT+IFoE0olyD4tSQoJ+oHN9jF19rFlnHOU0EslaA3pxeAu8nsKTjtozlRni1V63lW8qsp2ykg4
X-Received: by 2002:ac8:5dc9:0:b0:42c:78bd:5207 with SMTP id e9-20020ac85dc9000000b0042c78bd5207mr24259185qtx.2.1708528622016;
        Wed, 21 Feb 2024 07:17:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708528622; cv=none;
        d=google.com; s=arc-20160816;
        b=ysqOfTobMDoEtl/gD6xttltQ+xBG3vTki5mi/YXzWDJyhG3/RuHli0FA32slbmAFgT
         Vdum8kLH5QyZ/hrF+U0J0amfH3icNYKFbWEnipKYLaA51ty9rTSIUlrND2SzBue4nFmW
         BzhmCZ0gMbWTHJA05VeDmIX7Fsrp8tZXrFQKSWt1r/FzlbnCMxIgkBEg4qR/xxukuj2K
         u/1SI9+DCytin5IGP3alpULyPtlJA7ghTv2W5bZxUh6vF0ofpW8dMf4nVXLW0cl7mXoW
         lzZYRPfPP5NojQBImBEbXveYn0BI6Zx5sZK/lzdy/QiH6rGeHUwYQAkm1SPNIkwQtlo9
         7w9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to;
        bh=xSuPAA/A2YxfZ8ExHn00W6q75ejVw8J5YsJkHm0Qkr0=;
        fh=7La06MPWnWIeY2syFASYiv5clJRkW0OVzImHIa97XCQ=;
        b=dUFAcXucVnGok9mmXBfxhFtVgBBDaDvZa0yD+90bwFLc3Q0iD42wr/OylU9AQy++lK
         zl4Q7FUJhPrRNVef5gUgxnuwyNHa7pLGVba2pLizlGSYgcg1TgXZZPdyofgIbRsb9p9/
         eFyQEAQrhsEjBumBEaavfcCbo97LQy6wDzUhXqLtgA1olPVDevEMqt/xIBDkh1wKqIqK
         SwGtwnDBKyiUV+peKXDIDhUMapkZOBtTvL8BWpe1GyiE799/92BQuSZgF0dpWRR+MgZ3
         fJj/WzHPMh3ZYP3pCmTLmB2kolw9Q2aueFOZ7GOCNdTdy7n2fHG9BAoOGjggAAbHtCt6
         02Xw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i4-20020ac871c4000000b0042e02a9e6besi8163461qtp.791.2024.02.21.07.17.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 21 Feb 2024 07:17:01 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rcoJz-0001VA-1z; Wed, 21 Feb 2024 10:15:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rcoJe-0000nB-4L; Wed, 21 Feb 2024 10:15:24 -0500
Received: from szxga01-in.huawei.com ([45.249.212.187])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rcmLx-0004oS-KG; Wed, 21 Feb 2024 08:09:40 -0500
Received: from mail.maildlp.com (unknown [172.19.163.174])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4TfxQP54w4zsX3R;
 Wed, 21 Feb 2024 21:07:41 +0800 (CST)
Received: from kwepemi500008.china.huawei.com (unknown [7.221.188.139])
 by mail.maildlp.com (Postfix) with ESMTPS id 64E6A1404DB;
 Wed, 21 Feb 2024 21:09:21 +0800 (CST)
Received: from huawei.com (10.67.174.55) by kwepemi500008.china.huawei.com
 (7.221.188.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 21 Feb
 2024 21:09:20 +0800
To: <peter.maydell@linaro.org>, <eduardo@habkost.net>,
 <marcel.apfelbaum@gmail.com>, <philmd@linaro.org>, <wangyanan55@huawei.com>,
 <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
CC: <ruanjinjie@huawei.com>
Subject: [RFC PATCH v2 00/22] target/arm: Implement FEAT_NMI and FEAT_GICv3_NMI
Date: Wed, 21 Feb 2024 13:08:01 +0000
Message-ID: <20240221130823.677762-1-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.67.174.55]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemi500008.china.huawei.com (7.221.188.139)
Received-SPF: pass client-ip=45.249.212.187;
 envelope-from=ruanjinjie@huawei.com; helo=szxga01-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-to:  Jinjie Ruan <ruanjinjie@huawei.com>
From:  Jinjie Ruan via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: nzsRExQKPRuI

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
IPI as NMI framework, and the PPI interrupt is tested with "perf top" command
with hardware NMI enabled, and the PPI interrupt is tested with a custom
test module, in which NMI interrupts can be received and transmitted normally.

Changes in v2:
- Break up the patches so that each one does only one thing.
- Remove the command line option and just implement it in "max" cpu.

Jinjie Ruan (22):
  target/arm: Add FEAT_NMI to max
  target/arm: Handle HCR_EL2 accesses for bits introduced with FEAT_NMI
  target/arm: Add PSTATE.ALLINT
  target/arm: Implement ALLINT MSR (immediate)
  target/arm: Support MSR access to ALLINT
  target/arm: Add support for Non-maskable Interrupt
  target/arm: Add support for NMI event state
  target/arm: Handle IS/FS in ISR_EL1 for NMI
  target/arm: Add support for FEAT_NMI, Non-maskable Interrupt
  target/arm: Handle PSTATE.ALLINT on taking an exception
  target/arm: Set pstate.ALLINT in arm_cpu_reset_hold
  hw/arm/virt: Wire NMI irq line from GIC to CPU
  hw/intc/arm_gicv3: Add external IRQ lines for NMI
  target/arm: Handle NMI in arm_cpu_do_interrupt_aarch64()
  hw/intc/arm_gicv3_redist: Implement GICR_INMIR0
  hw/intc/arm_gicv3: Implement GICD_INMIR
  hw/intc: Enable FEAT_GICv3_NMI Feature
  hw/arm/virt: Add FEAT_GICv3_NMI feature support in virt GIC
  hw/intc/arm_gicv3: Add irq superpriority information
  hw/intc/arm_gicv3: Add NMI handling CPU interface registers
  hw/intc/arm_gicv3: Implement NMI interrupt prioirty
  hw/intc/arm_gicv3: Report the NMI interrupt in gicv3_cpuif_update()

 docs/system/arm/emulation.rst      |  1 +
 hw/arm/virt.c                      |  7 ++-
 hw/intc/arm_gicv3.c                | 61 ++++++++++++++++++++++---
 hw/intc/arm_gicv3_common.c         |  4 ++
 hw/intc/arm_gicv3_cpuif.c          | 53 ++++++++++++++++++++--
 hw/intc/arm_gicv3_dist.c           | 40 +++++++++++++++++
 hw/intc/arm_gicv3_redist.c         | 23 ++++++++++
 hw/intc/gicv3_internal.h           |  5 +++
 include/hw/intc/arm_gic_common.h   |  1 +
 include/hw/intc/arm_gicv3_common.h |  6 +++
 target/arm/cpu-features.h          |  5 +++
 target/arm/cpu-qom.h               |  3 +-
 target/arm/cpu.c                   | 46 ++++++++++++++++---
 target/arm/cpu.h                   | 15 ++++++-
 target/arm/helper.c                | 72 ++++++++++++++++++++++++++++++
 target/arm/internals.h             |  3 ++
 target/arm/tcg/a64.decode          |  1 +
 target/arm/tcg/cpu64.c             |  1 +
 target/arm/tcg/helper-a64.c        | 24 ++++++++++
 target/arm/tcg/helper-a64.h        |  1 +
 target/arm/tcg/translate-a64.c     | 10 +++++
 21 files changed, 362 insertions(+), 20 deletions(-)

-- 
2.34.1

