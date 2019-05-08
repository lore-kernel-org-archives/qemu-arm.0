Received: by 2002:adf:9061:0:0:0:0:0 with SMTP id h88csp4708790wrh;
        Wed, 8 May 2019 04:23:21 -0700 (PDT)
X-Google-Smtp-Source: APXvYqywE/1gilLauaiFqjrY3uNez1xcTTPPH1g+SIeTNV/2qttMUhTmOPBc/uqK6S6oVGNQMaOg
X-Received: by 2002:adf:ce07:: with SMTP id p7mr6192145wrn.47.1557314601333;
        Wed, 08 May 2019 04:23:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557314601; cv=none;
        d=google.com; s=arc-20160816;
        b=MPPQswpPw2arSs/uzd2I5kbSN2oLo1P7pMFM5RjfiSty7/RaRjtIkmK6jsg5jTO7EN
         nH6ciXnC1U+YpR60f+ByAFrKfkCz54DChpdU3YnYMz7rygKJStxajIZAe/Zd0K7NjFA3
         8z1qIMBISPTqj80G1M7RmI13QdoG9ACAjVlqT0Qm3/BKEabgEgEY6gM+aVbTZEpwU9mb
         7zqKsMrAFizCbkRhyfMchSl+CjYBj8pz3ccWDGW8rV1V0/EYb/HaXCUAOOHK9Z1vp8p1
         0BTfEZw5POMhPrZoVFbYcS6wBP4yOOC7jsXiytk5EuGQ7bgqABxS8B1DTKv6oLL1zXVv
         hGQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=IGJAH0HZM1GOALss41HCE3mRR2j/AksdRl19nPeG2tQ=;
        b=ZQAetxr0frRTs5B8ZL/lFDAJvapE/nUCKVMloiVKUoVEvn3XHTd+hA7KQFvfxGiAv6
         00gblGAI6Y44ru56tRSnHcFbXarGeGPegMvQuIXPSfbxj9LsOTA3fCF+GQn/iPlscDI+
         3NQ8BwboZyUMJi+Hxfd8AdVeNuJYnIaCCmOZXH6CLoUfFIMoYuNij38RO7i2pn6gFiD7
         cD1+dHDYuJz6JMNCbAQuFMln5kIybv/tA7ZBhQMG8EtSY2fsTdnmxbusUn8mwjdTB6iO
         rB62R1CbkMNlYpPvFYll+jLnnL02ok8cYzB4Xm4GkOmKogtcxvdi87AAd7z2+yZPC59P
         +cRQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=bCj2UxRU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u9si991335wmm.14.2019.05.08.04.23.21
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 08 May 2019 04:23:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=bCj2UxRU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:35099 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hOKfQ-0002fS-7E
	for alex.bennee@linaro.org; Wed, 08 May 2019 07:23:20 -0400
Received: from eggs.gnu.org ([209.51.188.92]:39068)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <hongbo.zhang@linaro.org>) id 1hOKfA-0002eU-GD
	for qemu-arm@nongnu.org; Wed, 08 May 2019 07:23:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <hongbo.zhang@linaro.org>) id 1hOKf9-0008Vy-4f
	for qemu-arm@nongnu.org; Wed, 08 May 2019 07:23:04 -0400
Received: from mail-lj1-x243.google.com ([2a00:1450:4864:20::243]:42612)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <hongbo.zhang@linaro.org>)
	id 1hOKf8-0008Um-PP
	for qemu-arm@nongnu.org; Wed, 08 May 2019 07:23:03 -0400
Received: by mail-lj1-x243.google.com with SMTP id y10so10616358lji.9
	for <qemu-arm@nongnu.org>; Wed, 08 May 2019 04:23:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=IGJAH0HZM1GOALss41HCE3mRR2j/AksdRl19nPeG2tQ=;
	b=bCj2UxRUYVqkl8ZnHYdVSWTXc+Q71LgK7i+XyEGlbZqXGfhSiKuv+EnsospB8Envov
	2+Nis8zbrFTknLtW4LiNVmgn2HvNrC1gQ2gNcZ2zSo0FqwG7sjQAUTTTIZa3GcY7RJp7
	558ISZWbn5svG8zW6zpcX2B32icw/90AtvtsfXZbmycQzeFORErF+2o3dS12iMyiXsXK
	B6aE53j9v27E+KOIAZzQpC5tWvXWiGWkMKUhGZAYRZ3h1vzU8NRis1IooXVy7eFFk9A8
	4IxDNB5mWCtL360XCF86crQz5ohMTiTYWK1kAgCFg6Ms39WY0wq1GzEdCxzDFOH3yu05
	cnuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=IGJAH0HZM1GOALss41HCE3mRR2j/AksdRl19nPeG2tQ=;
	b=KRdxnPPkTCZPEhb+FrENosOLrgvKIrsKHe8lIqN/OyJhs9/u5NmguwzhjJp62GplRy
	UT9FCTYCbHkdounUDpP3hr/0q1NPmUxOuYXChrVCo8uTNlQtXkJCNlDg2llfNIx6Qf5e
	IX/rBooVVfnypUzjfUqNIETDN8BAZ3dssSAI9HoDpFXg7LLgajHLQQ7WuFwRa5pDwPld
	oLNRbyzfGCVbT01Krg/VbZhjDwmsrLjlLk8RIe5yRTUvJMDlKzDLDihoY6ONZhfP0CHZ
	OgWy3CXU9Ib6AX39YkyLQkW7KF1f5AdXnHg7i+IAQPG24t3lt2gRaEnvQWpH9R1lCeDa
	1w9w==
X-Gm-Message-State: APjAAAVvB6FNZdFEgCzNph3eqiq725HeJJX8EUbfxBDW6tdkayp0w6gK
	xA6sQnodH9hA02geD/j4deAF9xgEE1V4IEM12I+8sg==
X-Received: by 2002:a2e:530d:: with SMTP id h13mr1450685ljb.70.1557314580330; 
	Wed, 08 May 2019 04:23:00 -0700 (PDT)
MIME-Version: 1.0
References: <1555560291-3415-1-git-send-email-hongbo.zhang@linaro.org>
	<1555560291-3415-2-git-send-email-hongbo.zhang@linaro.org>
	<CAFEAcA9rTL_4co1JvHrpJcqJqdrBsOiHo8sZS6wKWJOWphCCSA@mail.gmail.com>
In-Reply-To: <CAFEAcA9rTL_4co1JvHrpJcqJqdrBsOiHo8sZS6wKWJOWphCCSA@mail.gmail.com>
From: Hongbo Zhang <hongbo.zhang@linaro.org>
Date: Wed, 8 May 2019 19:22:53 +0800
Message-ID: <CAHmQWvAM3Jj_49Kq45jUgHnLmN-p3Yn-+GPQChpfTo1BS5hUJg@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::243
Subject: Re: [Qemu-arm] [PATCH v7 1/2] hw/arm: Add arm SBSA reference
 machine, skeleton part
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
Cc: Radoslaw Biernacki <radoslaw.biernacki@linaro.org>,
	Ard Biesheuvel <ard.biesheuvel@linaro.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Leif Lindholm <leif.lindholm@linaro.org>,
	Eric Auger <eric.auger@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: W8cITV7FQXZq

On Tue, 30 Apr 2019 at 22:04, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Thu, 18 Apr 2019 at 05:05, Hongbo Zhang <hongbo.zhang@linaro.org> wrote:
> >
> > For the Aarch64, there is one machine 'virt', it is primarily meant to
> > run on KVM and execute virtualization workloads, but we need an
> > environment as faithful as possible to physical hardware, for supporting
> > firmware and OS development for pysical Aarch64 machines.
> >
> > This patch introduces new machine type 'sbsa-ref' with main features:
> >  - Based on 'virt' machine type.
> >  - A new memory map.
> >  - CPU type cortex-a57.
> >  - EL2 and EL3 are enabled.
> >  - GIC version 3.
> >  - System bus AHCI controller.
> >  - System bus EHCI controller.
> >  - CDROM and hard disc on AHCI bus.
> >  - E1000E ethernet card on PCIE bus.
> >  - VGA display adaptor on PCIE bus.
> >  - No virtio deivces.
> >  - No fw_cfg device.
> >  - No ACPI table supplied.
> >  - Only minimal device tree nodes.
> >
> > Arm Trusted Firmware and UEFI porting to this are done accordingly, and
> > it should supply ACPI tables to load OS, the minimal device tree nodes
> > supplied from this platform are only to pass the dynamic info reflecting
> > command line input to firmware, not for loading OS.
> >
> > To make the review easier, this task is split into two patches, the
> > fundamental sceleton part and the peripheral devices part, this patch is
> > the first part.
> >
> > Signed-off-by: Hongbo Zhang <hongbo.zhang@linaro.org>
>
> Hi. This patch looks good to me. I have a couple of very minor
> comments below.
>
> The only other thing I'm not sure about is whether the recent work
> (both in master and in pending patchset) to add support for memory
> hotplug and nvdimms to the 'virt' board is applicable here. I've
> cc'd Igor and Eric to ask their opinion on that question.
>
My opinnion is, if we don't have conclusion before I send out next
iteration, we can just abandon it at this time, currently from my side
I don't see any reqirement for such features, what's more even if in
the future we need it, we can still add it by seperate patch, maybe we
probably have other features to be added in future too.

> > +static const MemMapEntry sbsa_ref_memmap[] = {
> > +    /* 512M boot ROM */
> > +    [SBSA_FLASH] =              {          0, 0x20000000 },
> > +    /* 512M secure memory */
> > +    [SBSA_SECURE_MEM] =         { 0x20000000, 0x20000000 },
> > +    /* Space reserved for CPU peripheral devices */
> > +    [SBSA_CPUPERIPHS] =         { 0x40000000, 0x00040000 },
> > +    [SBSA_GIC_DIST] =           { 0x40060000, 0x00010000 },
> > +    [SBSA_GIC_REDIST] =         { 0x40080000, 0x04000000 },
> > +    [SBSA_UART] =               { 0x60000000, 0x00001000 },
> > +    [SBSA_RTC] =                { 0x60010000, 0x00001000 },
> > +    [SBSA_GPIO] =               { 0x60020000, 0x00001000 },
> > +    [SBSA_SECURE_UART] =        { 0x60030000, 0x00001000 },
> > +    [SBSA_SECURE_UART_MM] =     { 0x60040000, 0x00001000 },
> > +    [SBSA_SMMU] =               { 0x60050000, 0x00020000 },
> > +    /* Space here reserved for more SMMUs */
> > +    [SBSA_AHCI] =               { 0x60100000, 0x00010000 },
> > +    [SBSA_EHCI] =               { 0x60110000, 0x00010000 },
> > +    /* Space here reserved for other devices */
> > +    [SBSA_PCIE_PIO] =           { 0x7fff0000, 0x00010000 },
> > +    /* 32-bit address PCIE MMIO space */
> > +    [SBSA_PCIE_MMIO] =          { 0x80000000, 0x70000000 },
> > +    /* 256M PCIE ECAM space */
> > +    [SBSA_PCIE_ECAM] =          { 0xf0000000, 0x10000000 },
> > +    /* ~1TB PCIE MMIO space (4GB to 1024GB boundary) */
> > +    [SBSA_PCIE_MMIO_HIGH] =     { 0x100000000ULL, 0xFF00000000ULL },
> > +    [SBSA_MEM] =                { 0x10000000000ULL, RAMLIMIT_BYTES },
> > +};
> > +
> > +static const int sbsa_ref_irqmap[] = {
> > +    [SBSA_UART] = 1,
> > +    [SBSA_RTC] = 2,
> > +    [SBSA_PCIE] = 3, /* ... to 6 */
> > +    [SBSA_GPIO] = 7,
> > +    [SBSA_SECURE_UART] = 8,
> > +    [SBSA_SECURE_UART_MM] = 9,
> > +    [SBSA_AHCI] = 10,
> > +    [SBSA_EHCI] = 11,
> > +};
>
> Since we only have one memory map and one irqmap, I think that
> rather than setting up vms->memmap[x] and vms->irqmap[x] and then
> always using those, we should just refer directly to the globals.
> The indirection in virt is originally because I was thinking we
> might want to have more than one layout (and because the code
> derives from the vexpress boards, which really do have two
> different layouts depending on the version), and then it turned
> out to be useful that we could pass the VirtMachineState* to
> the ACPI table generation code and let it get at the addresses
> and IRQ numbers that way. But neither of those applies here, I think.
>
Yes, good.

> > +
> > +static void sbsa_ref_init(MachineState *machine)
> > +{
> > +    SBSAMachineState *vms = SBSA_MACHINE(machine);
>
> This is a very trivial nitpick, but I think we should call
> this variable 'sms', not 'vms', since we changed the name of
> the struct type. (Same applies in some other functions later.)
>
Good catch, this is not 'trivial' I think, they should be changed obviously.

> > +    MachineClass *mc = MACHINE_GET_CLASS(machine);
> > +    MemoryRegion *sysmem = get_system_memory();
> > +    MemoryRegion *secure_sysmem = NULL;
> > +    MemoryRegion *ram = g_new(MemoryRegion, 1);
> > +    bool firmware_loaded = bios_name || drive_get(IF_PFLASH, 0, 0);
> > +    const CPUArchIdList *possible_cpus;
> > +    int n, sbsa_max_cpus;
> > +
> > +    if (strcmp(machine->cpu_type, ARM_CPU_TYPE_NAME("cortex-a57"))) {
> > +        error_report("sbsa-ref: CPU type other than the built-in "
> > +                     "cortex-a57 not supported");
> > +        exit(1);
> > +    }
> > +
> > +    if (kvm_enabled()) {
> > +        error_report("sbsa-ref: KVM is not supported at this machine");
>
> "for this machine".
>
> > +        exit(1);
> > +    }
>
> thanks
> -- PMM
