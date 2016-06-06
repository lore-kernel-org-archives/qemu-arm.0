Received: by 10.25.27.66 with SMTP id b63csp1524784lfb;
        Mon, 6 Jun 2016 07:42:40 -0700 (PDT)
X-Received: by 10.55.42.12 with SMTP id q12mr17113423qkh.38.1465224160433;
        Mon, 06 Jun 2016 07:42:40 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g53si12261853qtb.40.2016.06.06.07.42.40
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 06 Jun 2016 07:42:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=pass (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42876 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1b9vjj-0003rp-PL
	for alex.bennee@linaro.org; Mon, 06 Jun 2016 10:42:39 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36079)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1b9vja-0003om-DO
	for qemu-arm@nongnu.org; Mon, 06 Jun 2016 10:42:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1b9vjV-0007Q0-HF
	for qemu-arm@nongnu.org; Mon, 06 Jun 2016 10:42:30 -0400
Received: from mail-vk0-x231.google.com ([2607:f8b0:400c:c05::231]:35278)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1b9vjU-0007Pa-7B
	for qemu-arm@nongnu.org; Mon, 06 Jun 2016 10:42:25 -0400
Received: by mail-vk0-x231.google.com with SMTP id d127so202159681vkh.2
	for <qemu-arm@nongnu.org>; Mon, 06 Jun 2016 07:42:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=dvX3JHFsNOJ+2x8zhCU9yuYpbI+qy9kpEzHhd91vgmc=;
	b=PSZoK5rFBORxllv9hE+4BoY/Bg2NjQCTa/YvUGGdWBk1xqley19pGBLp4VdX8KUnZ7
	KlDsSKU1kCGagH54CoCe6Td1IGdsjvPcR6VkKtWr2MW5O1HRIl7RKmP1vYo7+sZ5Qz31
	7u/VRd+K0TAgXEebAZ8V+sP/r/v8lB+lWWgn8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=dvX3JHFsNOJ+2x8zhCU9yuYpbI+qy9kpEzHhd91vgmc=;
	b=FdSIpt61efm9VahadnXmCBaUyfWgjEejF+xpJ3nKknyNxyOsEDhHJwc/HChafhFxtW
	VRJYa630x7LFD7eOID9+JXbtQCc/oFFlhSLnboIAIqq2FaNstidc///umUDHCtL94Wwa
	H7kkS7cjKNMlBoynD2fkRZhV9ZmdHmGOS8wTVamYLkHzcMTdIV4PMtoYG6I56hf1F/ZA
	089OmYtQZWe1Vsh4fbWdAIvQMV2WrgsqYOU2kUjPR3St/PW5nHrKOc3hRr/bc12A/oDf
	Xs9CHK+MwMTRt2n1ARjerLrfQRuxV4sjXiYSSubZ4RbHPhucdQYRP0SdfirtwACHdoMt
	6DhA==
X-Gm-Message-State: ALyK8tIP56MDaUr5VxoWVwcqIAt9zHDtuIU2Zqpth947TXRimKkbcUpCW2lE6cm2mrUdN7AeanINmhtgzBOqMFvv
X-Received: by 10.31.62.70 with SMTP id l67mr2406998vka.92.1465224141590; Mon,
	06 Jun 2016 07:42:21 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.67.65 with HTTP; Mon, 6 Jun 2016 07:42:02 -0700 (PDT)
In-Reply-To: <1464274540-19693-1-git-send-email-peter.maydell@linaro.org>
References: <1464274540-19693-1-git-send-email-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 6 Jun 2016 15:42:02 +0100
Message-ID: <CAFEAcA8aKqMdSJa8417EV9ppgBx9J6NcDT3PvG4pJE5USrYUVw@mail.gmail.com>
To: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::231
Subject: Re: [Qemu-arm] [PATCH v2 00/22] GICv3 emulation
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
Cc: Patch Tracking <patches@linaro.org>,
	Shlomo Pongratz <shlomo.pongratz@huawei.com>,
	Shlomo Pongratz <shlomopongratz@gmail.com>,
	Pavel Fedin <p.fedin@samsung.com>, Shannon Zhao <shannon.zhao@linaro.org>,
	Christoffer Dall <christoffer.dall@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 0aD2i0Qs6Vdx

Ping ?

thanks
-- PMM

On 26 May 2016 at 15:55, Peter Maydell <peter.maydell@linaro.org> wrote:
> This series implements emulation of the GICv3 interrupt controller.
> It is based to some extent on previous patches from Shlomo and
> Pavel, but the bulk of it has turned out to be new code. (The
> combination of changing the underlying data structures, adding
> support for TrustZone and implementing proper GICv3 behaviour rather
> than borrowing fragments of GICv2 emulation code meant there wasn't
> much left to reuse.) I've tried to reflect this in the various
> authorship credits on the patches, but please let me know if you
> feel I got anything miscredited one way or the other.
>
> Key points about the GICv3 emulated here:
>  * "non-legacy" only, ie system registers and affinity routing
>  * TrustZone is implemented
>  * no virtualization support
>  * only the "core" GICv3, so no LPI support (via ITS or otherwise)
>  * no attempt to work around the Linux guest kernel bug fixed
>    in commit 7c9b973061b0 (so you need that fix for your guest to
>    boot with this GICv3)
>
> I have included the "support KVM save/restore" patches from Pavel,
> reworked to use the new data structures, but they are only RFC
> status because the kernel API is not yet final (there are a couple
> of loose threads there to be followed up). Those patches are at the
> end of the series; I think everything else is in a commitable state
> (give or take code review).
>
> Testing: I have confirmed that we can boot a Linux guest kernel,
> but not tried any other GIC-using guest code. I've done some light
> stress-testing using 'stress', and checked an SMP (2-cpu) boot.
> I've also tested booting a guest kernel via UEFI.
>
> Design: all the code here is in hw/intc/, split into several
> files to avoid them being huge. The interface between the CPU
> proper and the CPU interface is a bit ad-hoc (you can see the
> awkward seams that result from the choice to think of the cpu
> i/f as part of the GIC device rather than part of the CPU itself),
> but I think that if you put the cpu i/f in the CPU you'd end up
> with an ad-hoc interface and awkward seams in the other direction.
> The GICv3 device currently assumes it is always connected to all
> CPUs; we can change that later to allow some kind of QOM link
> property to specify the CPUs explicitly, but I think this is OK
> for now (and it's already a pretty huge set of code changes to
> have to review).
>
> Code review, testing, attempts to run guests other than Linux
> welcome.
>
> Changes v1->v2:
>  * I have dropped the kernel bug workaround, since it didn't work for
>    boots via UEFI anyway. This means that you will need kernel commit
>    7c9b973061b0 (or its equivalent backports to stable) to boot a Linux
>    guest with this emulated GICv3
>  * make bitmaps and arrays be GIC_MAXIRQS in size rather than
>    GIC_MAXSPIS in size; this uses an extra 512 bytes or so per
>    vcpu, but makes bugs of the "forgot to add/subtract GIC_INTERNAL"
>    variety less likely to happen (and indeed a few were found and fixed
>    in making this change...)
>  * fixed GICD_CTLR NS read to use correct bitmask
>  * moved ARMELChangeHook related prototypes etc into cpu.h from cpu-qom.h
>    (needed after Paolo's recent header reshuffles)
>  * added missing 'inline' qualifier to arm_is_el3_or_mon()
>  * fixed missing reset of GICD_NSACR
>  * fixed icc_activate_irq() to call gicv3_redist_update() rather than
>    gicv3_update() when it changes redistributor state
>  * make sure (and assert) gicv3_update() isn't called for out of range irqs
>  * add missing "bad num_irqs values" checks from gicv2 code
>
> thanks
> -- PMM
>
>
>
> Pavel Fedin (5):
>   target-arm: Add mp-affinity property for ARM CPU class
>   hw/intc/arm_gicv3: Add state information
>   hw/intc/arm_gicv3: Add vmstate descriptors
>   NOT-FOR-UPSTREAM: kernel: Add definitions for GICv3 attributes
>   RFC: hw/intc/arm_gicv3_kvm: Implement get/put functions
>
> Peter Maydell (14):
>   migration: Define VMSTATE_UINT64_2DARRAY
>   bitops.h: Implement half-shuffle and half-unshuffle ops
>   target-arm: Define new arm_is_el3_or_mon() function
>   target-arm: Provide hook to tell GICv3 about changes of security state
>   hw/intc/arm_gicv3: Move irq lines into GICv3CPUState structure
>   hw/intc/arm_gicv3: Implement functions to identify next pending irq
>   hw/intc/arm_gicv3: Wire up distributor and redistributor MMIO regions
>   hw/intc/arm_gicv3: Implement gicv3_set_irq()
>   hw/intc/arm_gicv3: Implement GICv3 CPU interface registers
>   hw/intc/arm_gicv3: Implement gicv3_cpuif_update()
>   hw/intc/arm_gicv3: Implement CPU i/f SGI generation registers
>   hw/intc/arm_gicv3: Add IRQ handling CPU interface registers
>   target-arm/machine.c: Allow user to request GICv3 emulation
>   target-arm/monitor.c: Advertise emulated GICv3 in capabilities
>
> Shlomo Pongratz (3):
>   hw/intc/arm_gicv3: ARM GICv3 device framework
>   hw/intc/arm_gicv3: Implement GICv3 distributor registers
>   hw/intc/arm_gicv3: Implement GICv3 redistributor registers
>
>  hw/intc/Makefile.objs              |    4 +
>  hw/intc/arm_gicv3.c                |  400 +++++++++++
>  hw/intc/arm_gicv3_common.c         |  225 +++++-
>  hw/intc/arm_gicv3_cpuif.c          | 1346 ++++++++++++++++++++++++++++++++++++
>  hw/intc/arm_gicv3_dist.c           |  873 +++++++++++++++++++++++
>  hw/intc/arm_gicv3_kvm.c            |  447 +++++++++++-
>  hw/intc/arm_gicv3_redist.c         |  556 +++++++++++++++
>  hw/intc/gicv3_internal.h           |  331 +++++++++
>  include/hw/intc/arm_gicv3.h        |   32 +
>  include/hw/intc/arm_gicv3_common.h |  216 +++++-
>  include/migration/vmstate.h        |    6 +
>  include/qemu/bitops.h              |  108 +++
>  linux-headers/asm-arm64/kvm.h      |   17 +-
>  target-arm/cpu.c                   |   10 +
>  target-arm/cpu.h                   |   47 +-
>  target-arm/helper.c                |    2 +
>  target-arm/internals.h             |    8 +
>  target-arm/machine.c               |    3 +-
>  target-arm/monitor.c               |    3 +-
>  target-arm/op_helper.c             |    4 +
>  tests/test-bitops.c                |   68 ++
>  trace-events                       |   41 ++
>  22 files changed, 4719 insertions(+), 28 deletions(-)
>  create mode 100644 hw/intc/arm_gicv3.c
>  create mode 100644 hw/intc/arm_gicv3_cpuif.c
>  create mode 100644 hw/intc/arm_gicv3_dist.c
>  create mode 100644 hw/intc/arm_gicv3_redist.c
>  create mode 100644 hw/intc/gicv3_internal.h
>  create mode 100644 include/hw/intc/arm_gicv3.h
>
> --
> 1.9.1
