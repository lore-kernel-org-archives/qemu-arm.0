Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAA76FE51FD
	for <qemu-arm@archiver.kernel.org>; Fri, 24 Apr 2026 10:03:44 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wGDNU-0006KV-Iq; Fri, 24 Apr 2026 06:03:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wGDNT-0006KJ-0k
 for qemu-arm@nongnu.org; Fri, 24 Apr 2026 06:03:15 -0400
Received: from mail-yx1-xb12c.google.com ([2607:f8b0:4864:20::b12c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wGDNQ-00054m-ND
 for qemu-arm@nongnu.org; Fri, 24 Apr 2026 06:03:14 -0400
Received: by mail-yx1-xb12c.google.com with SMTP id
 956f58d0204a3-651bc83e74aso6356680d50.2
 for <qemu-arm@nongnu.org>; Fri, 24 Apr 2026 03:03:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777024991; cv=none;
 d=google.com; s=arc-20240605;
 b=Z4lvZU73uDpmnJWuwBUDDxtKjgL+hfkmMSgWS9rrMQNZCsYBKFD+njRN6dFEcjs/79
 0Zy/D/YsNMuJtRLiNyXuPk60DVxlEVV0vBp6878TJmkkuUj2jfEgH1qBuh8cMb57IE6z
 kC5nyw9I2cpzCER7x3FuBTZQAeCPG3hgsy4MHCZxyVctswOkvovvof6cLroCHt/oYbI7
 uq7Gl7DRXEECG9LzJ0AxATTORnhJ53/TXtgtHwWMvkj+ZK+q+q8j+wVJGFjKO1BPosBH
 HfAWXYlS50bzFhRuYEuW4nvN/2MSAO/4qzDge5GcsCjt64C/UJV59nrLJWQq8x0hIQIp
 Yhrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=1LSEfkzV+GJSbZihQSXugIWNSBAouS1WVSwLXcPfgkY=;
 fh=y6MrUtizKHMRWGRrY1qpUiq38biO2fL55FvIh3/gKmQ=;
 b=QNkYqAvyAOtKWwelwbI+IUgIqgspRIp+JBGvFHOTLI4pD9bAvWHxfctjnvxOZIJnbD
 zJh4ShnWqoxr7kGU+XCRHoaG90DHmVL49NzqRQlXjJAoeDpXIMuDbhaMAtG70zzcs7GM
 a6v8V1r0gUQ5clvOVwKRpVWVE7B6zu90PkAj2XDL6uLZVN4zIuq6L6l0/daLfR0f12Rl
 BihYhggfeuee3qr1XRFcC+SEeGG0Kmcm/5XZKwn1soDdLOzhX4EqGkQZ+9//ob84ChLS
 r7vSSsu770UiE5WP62w2NukPWB4ujdYIfR+kQoQWAMovpMAF5/ejqTTpPIToNItFE5Lf
 FxJA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1777024991; x=1777629791; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=1LSEfkzV+GJSbZihQSXugIWNSBAouS1WVSwLXcPfgkY=;
 b=QEEdR6Fk6rZoSto2Xxv4MRkpEoLJGmsVavqG8emTl4yFN5O0kMTHJliSPo4nN1U8D+
 MJWn99TeLaalZdoFiBzc6FLRzQ3JKVjC+pmy0LoOCQHgMKkfQDQAZwMKVSuKOR9lo3qF
 W0NZ2BUPE0W2xIk4fEeX/gGpO3beOOYsEe3JMkh4vji3Hqr7EjpCRtivq70yLRL66+zV
 6tL1aFHn5wO/TlE2u8cHNwDIb5+97j5BQ/cylx7nVHva5XMn9y0VojNp379dz2tB1wNz
 wCZoEhbw+nfqKgSWJzbach6lkfoV71rBiiKCLF00GXOlLOT4z8r2NBlm0745LvYseIxM
 G8jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777024991; x=1777629791;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1LSEfkzV+GJSbZihQSXugIWNSBAouS1WVSwLXcPfgkY=;
 b=fTSgjLZnWFdt14G++NlJKMbnMsgiGxstgMP/iyYDjOkJN5JZce5gD+MvYdhtqdpPdX
 oLhOvBnVROZ5jfmSVnTgu7qb3fJzTKv25kpP988UQVimwORM68JND8EjwaKmeJEhJ1e7
 vTS9HgTuLyS5b3BlLjQmMvYLqeyQwChypJRN3OfRA5BZu4jKE1bMOHkCzJBcEwIlbZGZ
 9zDe3p2dtI7IiBIBPI9Z+rnBZL4TXMAT8bObXlZ2cTnv4opTd7ejRweqIAE56ehh/MRI
 ZpEsBHFGXreQrYoonUVDa40MkIa85cfzENoIN4uHHzmBmd3s1C0uU5l8dUY7klhUzBM8
 JpDA==
X-Gm-Message-State: AOJu0YwzPrPyqK4QXvZ0B9MCrYQm2LvMmxITWdztScoRS9h3RHbDLfkW
 w85qB5Sg0fLyvSWjM0GeJ4YHxnnz8egquMxxpjIidrx/ZRiAYDjfSbsEUgVCL1W9QOzqGtDCgZK
 WV4NrY0Fe4soYesQ3m/5xQ0ddCdye0NCYlJvwOeN5EemdlD00SxUI
X-Gm-Gg: AeBDievRibkdNEtHqQuIm3TrKe/wUiccpKAhwTkoLsxkLj1J6EMcRI5zklBJXeGZviZ
 S61dlY/WrTj/vm4mGqhwFKYtRpzRZIbnVg1HbtK0PgGjMi/ylbodjlAv24DZCMW9mjoHZXPxfhS
 IILFOrcP176hvlum5Gm6J+tZFK7l1rnoCtzZIVQWZzxe7S1yYWDXx8ao6B/FHJBJP+vlywOLKDA
 0RhGisjtiWoVOFF7x52KFrEO0/7NX+qmzU3gNg82LBJab9cgRIXyMmEENxMPhgBMWLcD1lehydn
 YJI96Drrjatvt/Uj8LDaticZLdG8f/AOi5m3pSYXAwJmhYptfyJf6IHJNWUkCwkJCS5+bQaIxot
 j5uIkdC7DK+vJ
X-Received: by 2002:a05:690e:130e:b0:651:d634:6d32 with SMTP id
 956f58d0204a3-6531085f25cmr27963678d50.20.1777024990597; Fri, 24 Apr 2026
 03:03:10 -0700 (PDT)
MIME-Version: 1.0
References: <20260327111700.795099-1-peter.maydell@linaro.org>
In-Reply-To: <20260327111700.795099-1-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 24 Apr 2026 11:02:59 +0100
X-Gm-Features: AQROBzB79RFPgF_S8HuChb_5l9qnpWzxS3KKnLY0V7YeMOfvz5rts9uTHqpYqQE
Message-ID: <CAFEAcA-6zzrzwcR3C0k5nS=4j+GugD5_Y98Y3D6cdNSsc9riSg@mail.gmail.com>
Subject: Re: [PATCH v2 00/65] arm: Implement an emulation of GICv5 interrupt
 controller
To: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Cc: Jonathan Cameron <jonathan.cameron@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b12c;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb12c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Hi -- now that 11.0 is out, gentle ping for the last bits of
code review on this series. Philippe has reviweed patch 24,
but 10, 25, 32 are still in need of review.

thanks
-- PMM

On Fri, 27 Mar 2026 at 11:17, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> This patchset implements initial support of emulation of Arm's new
> interrupt controller architecture, GICv5.
>
> I've incorporated the review feedback from v1, so I figured I
> might as well send this out, though obviously there's no huge
> rush to review given we're in freeze.
>
> Patches still needing review: 10 24 25 32
>
> Changes v1->v2:
>  * minor tidyups to line wrap, etc, in various patches
>  * patch 1 is split into 2 patches but otherwise unchanged
>  * 3: define FRAME_OP_ENTRY macro to avoid duplication in writing
>    out entries of the config_frame_ops[] array
>  * 9: fixed IRS_IDR0 PA_RANGE field length
>  * 10: also zero IDR0 VIRT_ONE_N field for the EL3 domain
>  * 18, 21, 24, 25, 47, 50: use switch on IRQ type instead of if()
>    in gicv5_set_priority() and similar functions
>  * old 55 ("hw/arm/virt: Update error message for bad gic-version
>    option") is now upstream, so dropped from v2
>
>
> (Everything below here is the same as from v1's cover letter;
> repeated for context.)
>
> The most recent version of the GICv5 spec (currently 00EAC0) is at:
> https://developer.arm.com/documentation/aes0070/latest/
>
> The emulation is at an "experimental" level, both because the GICv5
> specification is still at an early-access level and minor changes are
> possible, and also because this emulation is missing some
> functionality which I plan to add later but which would have made this
> initial patchset even larger and later. To quote the docs patch:
>
>     - guest-visible behaviour may change when the final version of
>       the specification is released and QEMU implements it
>     - migration support is not yet implemented
>     - the GICv5 is not exposed to the guest via ACPI tables, only via DTB
>     - the way the interrupt controller is exposed to the guest and the
>       command line syntax for enabling it may change
>
>     The current implementation supports only an EL1 guest (no EL2 or
>     EL3 and no Realm support), and does not implement the ITS (no
>     MSI support).
>
> The GICv5 is supported by the "virt" board, and can be enabled with
> "-machine gic-version=x-5" (the 'x' standing for "experimental").
>
> Like the GICv3/v4, the GICv5 has both a system component part (the
> Interrupt Routing Service, IRS), and a part in the CPU itself (the CPU
> interface). Our GICv3 model puts both of these into code in hw/intc/,
> and has the cpuif part install itself into an existing CPU object by
> adding new system registers there. This works, but in retrospect I
> feel that it's a bit awkward and we would have done better to make our
> design a bit closer to the hardware setup, where the CPU interface is
> really part of the CPU and talks to the system component over an
> architected protocol. So for GICv5 I have taken that route: the IRS is
> in hw/intc/arm_gicv5.c, and the CPU interface is in
> target/arm/tcg/gicv5-cpuif.c. They communicate via a set of functions
> which loosely match the "stream protocol" defined in the GICv5
> architecture spec (with some simplifications that result from QEMU
> being strictly synchronous because we always hold the BQL when
> executing any GICv5 emulation code; the hardware has to handle the IRS
> and the CPU executing in parallel and the communications channel not
> being instantaneous transmission).
>
> Although the EL2/EL3/Realm functionality is not present in this
> patchset, I have implemented some of the foundations for it where I
> thought it made sense, to avoid having to refactor it later.
> Similarly, the class structure makes the usual "common baseclass + TCG
> subclass" split, as we are going to want a KVM subclass when we add
> KVM support.
>
> In a few places I have noted possible opportunities for performance
> optimisation; these are probably best left until we've done some
> analysis that shows them to be necessary.
>
> This patchset is sufficient to be able to boot a Linux guest at EL1
> (directly via -kernel): all the kernel support for GICv5 is upstream
> as of Linux 6.19.
>
> thanks
> -- PMM
>
> Peter Maydell (65):
>   qom/object: Add object_resolve_and_typecheck()
>   hw/core: Permit devices to define an array of link properties
>   hw/intc: Skeleton of GICv5 IRS classes
>   hw/arm/Kconfig: select ARM_GICV5 for ARM_VIRT board
>   hw/intc/arm_gicv5: Implement skeleton code for IRS register frames
>   hw/intc/arm_gicv5: Add migration blocker
>   hw/intc/arm_gicv5: Create and validate QOM properties
>   hw/intc/arm_gicv5: Create inbound GPIO lines for SPIs
>   hw/intc/arm_gicv5: Define macros for config frame registers
>   hw/intc/arm_gicv5: Implement IRS ID regs
>   hw/intc/arm_gicv5: Add link property for MemoryRegion for DMA
>   hw/intc/arm_gicv5: Implement gicv5_class_name()
>   hw/intc/arm_gicv5: Add defines for GICv5 architected PPIs
>   target/arm: GICv5 cpuif: Initial skeleton and GSB barrier insns
>   target/arm: Set up pointer to GICv5 in each CPU
>   hw/intc/arm_gicv5: Implement IRS_IST_{BASER, STATUSR, CFGR}
>   hw/intc/arm_gicv5: Cache LPI IST config in a struct
>   hw/intc/arm_gicv5: Implement gicv5_set_priority()
>   target/arm: GICv5 cpuif: Implement the GIC CDPRI instruction
>   hw/intc/arm_gicv5: Implement IRS_MAP_L2_ISTR
>   hw/intc/arm_gicv5: Implement remaining set-config functions
>   target/arm: GICv5 cpuif: Implement GIC CD* insns for setting config
>   hw/intc/arm_gicv5: Create backing state for SPIs
>   hw/intc/arm_gicv5: Make gicv5_set_* update SPI state
>   hw/intc/arm_gicv5: Implement gicv5_request_config()
>   target/arm: GICv5 cpuif: Implement GIC CDRCFG and ICC_ICSR_EL1
>   hw/intc/arm_gicv5: Implement IRS_SPI_{SELR,STATUSR,CFGR,DOMAINR}
>   hw/intc/arm_gicv5: Update SPI state for CLEAR/SET events
>   hw/intc/arm_gicv5: Implement IRS_CR0 and IRS_CR1
>   hw/intc/arm_gicv5: Implement IRS_SYNCR and IRS_SYNC_STATUSR
>   hw/intc/arm_gicv5: Implement IRS_PE_{CR0,SELR,STATUSR}
>   hw/intc/arm_gicv5: Implement CoreSight ID registers
>   hw/intc/arm_gicv5: Cache pending LPIs in a hash table
>   target/arm: GICv5 cpuif: Implement ICC_IAFFIDR_EL1
>   target/arm: GICv5 cpuif: Implement ICC_IDR0_EL1
>   target/arm: GICv5 cpuif: Implement GICv5 PPI active set/clear
>     registers
>   target/arm: GICv5 cpuif: Implement PPI handling mode register
>   target/arm: GICv5 cpuif: Implement PPI pending status registers
>   target/arm: GICv5 cpuif: Implement PPI enable register
>   target/arm: GICv5 cpuif: Implement PPI priority registers
>   target/arm: GICv5 cpuif: Implement ICC_APR_EL1 and ICC_HAPR_EL1
>   target/arm: GICv5 cpuif: Calculate the highest priority PPI
>   hw/intc/arm_gicv5: Calculate HPPI in the IRS
>   target/arm: GICv5 cpuif: Implement ICC_CR0_EL1
>   target/arm: GICv5 cpuif: Implement ICC_PCR_EL1
>   target/arm: GICv5 cpuif: Implement ICC_HPPIR_EL1
>   hw/intc/arm_gicv5: Implement Activate command
>   target/arm: GICv5 cpuif: Implement GICR CDIA command
>   target/arm: GICv5 cpuif: Implement GIC CDEOI
>   hw/intc/arm_gicv5: Implement Deactivate command
>   target/arm: GICv5 cpuif: Implement GIC CDDI
>   target/arm: GICv5 cpuif: Signal IRQ or FIQ
>   target/arm: Connect internal interrupt sources up as GICv5 PPIs
>   target/arm: Add has_gcie property to enable FEAT_GCIE
>   hw/intc/arm_gicv3_cpuif: Don't allow GICv3 if CPU has GICv5 cpuif
>   hw/arm/virt: Remember CPU phandles rather than looking them up by name
>   hw/arm/virt: Move MSI controller creation out of create_gic()
>   hw/arm/virt: Pull "wire CPU interrupts" out of create_gic()
>   hw/arm/virt: Split GICv2 and GICv3/4 creation
>   hw/arm/virt: Create and connect GICv5
>   hw/arm/virt: Advertise GICv5 in the DTB
>   hw/arm/virt: Handle GICv5 in interrupt bindings for PPIs
>   hw/arm/virt: Use correct interrupt type for GICv5 SPIs in the DTB
>   hw/arm/virt: Enable GICv5 CPU interface when using GICv5
>   hw/arm/virt: Allow user to select GICv5
>
>  docs/system/arm/virt.rst           |   19 +
>  hw/arm/Kconfig                     |    1 +
>  hw/arm/virt.c                      |  525 ++++++--
>  hw/core/qdev-properties.c          |   78 ++
>  hw/intc/Kconfig                    |    4 +
>  hw/intc/arm_gicv3.c                |    2 +-
>  hw/intc/arm_gicv3_cpuif.c          |   14 +-
>  hw/intc/arm_gicv5.c                | 1962 ++++++++++++++++++++++++++++
>  hw/intc/arm_gicv5_common.c         |  227 ++++
>  hw/intc/gicv3_internal.h           |    2 +-
>  hw/intc/meson.build                |    4 +
>  hw/intc/trace-events               |   23 +
>  include/hw/arm/fdt.h               |   10 +
>  include/hw/arm/virt.h              |   15 +
>  include/hw/core/qdev-properties.h  |   41 +
>  include/hw/intc/arm_gicv5.h        |   51 +
>  include/hw/intc/arm_gicv5_common.h |  236 ++++
>  include/hw/intc/arm_gicv5_stream.h |  228 ++++
>  include/hw/intc/arm_gicv5_types.h  |  110 ++
>  include/qom/object.h               |   17 +
>  meson.build                        |    1 +
>  qom/object.c                       |   41 +-
>  target/arm/cpregs-pmu.c            |    9 +-
>  target/arm/cpu-features.h          |   11 +
>  target/arm/cpu.c                   |   62 +
>  target/arm/cpu.h                   |   28 +
>  target/arm/helper.c                |   21 +
>  target/arm/internals.h             |    9 +
>  target/arm/tcg/gicv5-cpuif.c       |  952 ++++++++++++++
>  target/arm/tcg/meson.build         |    1 +
>  target/arm/tcg/trace-events        |   11 +
>  target/arm/tcg/trace.h             |    1 +
>  32 files changed, 4559 insertions(+), 157 deletions(-)
>  create mode 100644 hw/intc/arm_gicv5.c
>  create mode 100644 hw/intc/arm_gicv5_common.c
>  create mode 100644 include/hw/intc/arm_gicv5.h
>  create mode 100644 include/hw/intc/arm_gicv5_common.h
>  create mode 100644 include/hw/intc/arm_gicv5_stream.h
>  create mode 100644 include/hw/intc/arm_gicv5_types.h
>  create mode 100644 target/arm/tcg/gicv5-cpuif.c
>  create mode 100644 target/arm/tcg/trace-events
>  create mode 100644 target/arm/tcg/trace.h

