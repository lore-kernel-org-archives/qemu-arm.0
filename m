Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp246936wru;
        Thu, 26 Jul 2018 04:15:16 -0700 (PDT)
X-Received: by 2002:a24:83c6:: with SMTP id d189-v6mr1566512ite.75.1532603716364;
        Thu, 26 Jul 2018 04:15:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1532603716; cv=none;
        d=google.com; s=arc-20160816;
        b=0h/0qi25q/LwdmyVzyhOGCR19YUlhfMSUpdqeLmd0V2ZLiuAXreDDM4KjV7DtoJWx5
         iM0ggkVqURHmMcFVx9jLB1gtJLwJyR5heQk/FnNaspl8KBciCyRt1mzRmoBtwF7LnuwM
         hWn5I7TyAj+x1KO9/ZGqNmcVON5JrMnxeIq/agfTrj+n0yBvbK5HEyt12OLOY8KbLp8r
         obRuVGROhF9y7JOELByalsBMuqQxlQhB/2cSu7w9g0eJKmetTat3F1oR8oxuJ21V5W00
         x4hNOYE5B1agAwRySGJorPAEBbY1gWLoabXfuW33uane6gscnCj1QQFyj33w77NPUShj
         +ENA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:dkim-signature:arc-authentication-results;
        bh=xjh1EvPpoYFfvSajNykHiJHGPlvJX6DR4wb1ACOvZm8=;
        b=wxK93R/mb/uTOKpUb8bVdjh15pYMM6yfTUBJwiIxtPNiKQ+O93cPrrLgDViIzVWoRc
         xTAVk7Wnt7BYc9/obFrpXU8GMvetNfCIgleCyfocJt+uJ1DXZAmPRyFTO7XU76JB/53b
         W7zr5lAshW/3Z0bA96VILCtxqKTCUO97gM4xKhf+i4Xtg/bhh4X3p9NmOW8vlVmWukkP
         VvnMDOd+LnBaJDqjStkS1+lST4ukUcX+4/tkHzs/WZh2J1izZ1vaWTjcpsCrvFPE1Vx2
         yU+QZ1BCaBxmFSvwm4F5rD8d1EO1VvHD19BcFaWtNLC76Ak99fjwzi1aXgfob61p7EpN
         Z4DQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="WN/8v512";
       spf=pass (google.com: domain of ard.biesheuvel@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=ard.biesheuvel@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <ard.biesheuvel@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id 204-v6sor427192jaa.136.2018.07.26.04.15.16
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 26 Jul 2018 04:15:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of ard.biesheuvel@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="WN/8v512";
       spf=pass (google.com: domain of ard.biesheuvel@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=ard.biesheuvel@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=xjh1EvPpoYFfvSajNykHiJHGPlvJX6DR4wb1ACOvZm8=;
        b=WN/8v5124jlxXPxjY7etv98CPAVAA+jJBrP7Dv/rJ0ImhB19wMfghJ8fUsGhUPFzli
         qclrkYqraoH0k3VITgIxpXVoRLyB3iTWA9xYgofBJRi05CFuxlHpZ1W+XisMo3GQmNXw
         77VPKjZTbA+byyQ08zvlYxnx3gwaZ26seoUPo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=xjh1EvPpoYFfvSajNykHiJHGPlvJX6DR4wb1ACOvZm8=;
        b=B0xJ5d+HBaxuAZhXRgnu9yuoJi1ANjJ5iEVQuTQTKBOvjgGL/LzkaSoERPyitGJsyS
         rpCjwqiPu33VifidHyO8rtkUJFQEvTAP5tAjfIlaKtwObUcUrLS4goyDVDz8J7ebdNGz
         xEs48DYeNlZIhgHLoqmeMsD8weqZYha/TVAetpzEbYo9soUIWaHtOBsvB2H6550pQKoM
         lNwKP/CePGf4ZpLgWlDueSGiJXK3CMIJpYE40juyL67kaNerryO25U/z2c/RuAsBDud0
         9i/XPBGppzhUShH8xVc4Q4VYd/bdQ6no3BtEBmfF6qnYqwfy8+zdTm8M6aTXsJ3yO4Af
         /9yA==
X-Gm-Message-State: AOUpUlFXHX887Zvb4cJrz0bACBzYLrNQPjwrf/gCPJM3IPR0Bc7FEAig
	E79RouJHyo3/Kl7jRRf/fvcJn0UUPz+Aes6SW8L5qDAffkk=
X-Google-Smtp-Source: AAOMgpcczjp/FYefy9MuTCcEAi1Wn/uzqMETvpHS8YPVmAikDac/25f7FaU8qzvD6nAs08X8pP0HNGi8ZnhG22XTqJ4=
X-Received: by 2002:a02:a1d9:: with SMTP id o25-v6mr1394479jah.86.1532603715917;
 Thu, 26 Jul 2018 04:15:15 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a6b:ac05:0:0:0:0:0 with HTTP; Thu, 26 Jul 2018 04:15:15
 -0700 (PDT)
In-Reply-To: <20180726111109.w24jk6ehklimige7@kamzik.brq.redhat.com>
References: <1532496652-26364-1-git-send-email-hongbo.zhang@linaro.org>
 <1532496652-26364-2-git-send-email-hongbo.zhang@linaro.org>
 <20180725095426.f7kv4ftngeje6pkx@kamzik.brq.redhat.com> <CAHmQWvCKkzim+-Z4Y69fWg6igZ7V6gaWhjKJZ0m0G0dhbwOFyw@mail.gmail.com>
 <20180725112621.imdzdkntpmh3n5og@kamzik.brq.redhat.com> <CAHmQWvCfHFSU7RGKG5t6=m7ZSWZjf3TeqOo3cX2KT-GSiN3mPw@mail.gmail.com>
 <20180726102855.x6ffdoqjpejpyae7@kamzik.brq.redhat.com> <CAKv+Gu-ffZRNmACH6YieNsg=AHxJxYoXHsBGf6C=nOvFfTu7Sg@mail.gmail.com>
 <20180726111109.w24jk6ehklimige7@kamzik.brq.redhat.com>
From: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Date: Thu, 26 Jul 2018 13:15:15 +0200
Message-ID: <CAKv+Gu80KfwZft4t1HtOXPuijuPLV80K9iW+BsTgs7WcnosMXA@mail.gmail.com>
Subject: Re: [Qemu-devel] [PATCH v2 2/2] hw/arm: Add Arm Enterprise machine type
To: Andrew Jones <drjones@redhat.com>
Cc: Hongbo Zhang <hongbo.zhang@linaro.org>, 
	Radoslaw Biernacki <radoslaw.biernacki@linaro.org>, Peter Maydell <peter.maydell@linaro.org>, 
	QEMU Developers <qemu-devel@nongnu.org>, Leif Lindholm <leif.lindholm@linaro.org>, 
	qemu-arm <qemu-arm@nongnu.org>, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-TUID: +vaceKNPK3Nt

On 26 July 2018 at 13:11, Andrew Jones <drjones@redhat.com> wrote:
> On Thu, Jul 26, 2018 at 12:35:08PM +0200, Ard Biesheuvel wrote:
>> On 26 July 2018 at 12:28, Andrew Jones <drjones@redhat.com> wrote:
>> > On Thu, Jul 26, 2018 at 05:22:14PM +0800, Hongbo Zhang wrote:
>> >> On 25 July 2018 at 19:26, Andrew Jones <drjones@redhat.com> wrote:
>> >> > On Wed, Jul 25, 2018 at 06:22:17PM +0800, Hongbo Zhang wrote:
>> >> >> On 25 July 2018 at 17:54, Andrew Jones <drjones@redhat.com> wrote:
>> >> >> > On Wed, Jul 25, 2018 at 01:30:52PM +0800, Hongbo Zhang wrote:
>> >> >> >> For the Aarch64, there is one machine 'virt', it is primarily meant to
>> >> >> >> run on KVM and execute virtualization workloads, but we need an
>> >> >> >> environment as faithful as possible to physical hardware, for supporting
>> >> >> >> firmware and OS development for pysical Aarch64 machines.
>> >> >> >>
>> >> >> >> This patch introduces new machine type 'Enterprise' with main features:
>> >> >> >>  - Based on 'virt' machine type.
>> >> >> >>  - Re-designed memory map.
>> >> >> >>  - EL2 and EL3 are enabled by default.
>> >> >> >>  - GIC version 3 by default.
>> >> >> >>  - AHCI controller attached to system bus, and then CDROM and hard disc
>> >> >> >>    can be added to it.
>> >> >> >>  - EHCI controller attached to system bus, with USB mouse and key board
>> >> >> >>    installed by default.
>> >> >> >>  - E1000E ethernet card on PCIE bus.
>> >> >> >>  - VGA display adaptor on PCIE bus.
>> >> >> >>  - Default CPU type cortex-a57, 4 cores, and 1G bytes memory.
>> >> >> >>  - No virtio functions enabled, since this is to emulate real hardware.
>> >> >> >
>> >> >> > In the last review it was pointed out that using virtio-pci should still
>> >> >> > be "real" enough, so there's not much reason to avoid it. Well, unless
>> >> >> > there's some concern as to what drivers are available in the firmware and
>> >> >> > guest kernel. But that concern usually only applies to legacy firmwares
>> >> >> > and kernels, and therefore shouldn't apply to AArch64.
>> >> >> >
>> >> >> In real physical arm hardware, *HCI are system memory mapped, not on PCIE.
>> >> >> we need a QEMU platform like that. We need firmware developed on this
>> >> >> QEMU platform can run on real hardware without change(or only a minor
>> >> >> change)
>> >> >
>> >> > virtio-pci has nothing to do with *HCI. You're adding an E1000e to the
>> >> > PCIe bus instead of a virtio-pci nic. Why?
>> >> >
>> >> No virtio devices are need on this platform, so no virtio-pci either,
>> >> on the real Arm server hardware, a NIC is inserted into PCIE, and
>> >> E1000E is a typical one.
>> >
>> > It is possible to make a real piece of hardware that really goes in a PCIe
>> > slot which knows how to talk VirtIO. The fact that an E1000e driver will
>> > drive an E1000e QEMU model instead of a VirtIO driver driving a VirtIO
>> > backend is, to me, pretty arbitrary. The only reason it should matter for
>> > the guest firmware/kernel is whether or not the firmware/kernel will have
>> > VirtIO drivers available. Do we know that? Is it documented somewhere
>> > that the guest firmware/kernel is guaranteed to have E1000e drivers, but
>> > VirtIO drivers are optional, or even forbidden? If so, where's that
>> > document?
>> >
>>
>> It is not pretty arbitrary. One is paravirtualization and one is not.
>
> But the paravirtness is a driver detail, not a platform detail. The
> virtio-pci device is just a PCIe device to the platform. Drive it or
> not, drive it with knowledge that it's paravirt or not, the platform
> doesn't care.
>

That may be true. But we'll still end up with a UEFI build that has
OVMF virtio bus drivers and device drivers included, blurring the line
between emulation and virtualization.

>>
>> >>
>> >> >> Concern is not only available firmwares, but more emphasis is on new
>> >> >> firmwares to be developed on this platform (target is developing
>> >> >> firmware for hardware, but using qemu if hardware is not available
>> >> >> temporarily), if virtio device used, then the newly developed firmware
>> >> >> must include virtio front-end codes, but it isn't needed while run on
>> >> >> real hardware at last.
>> >> >
>> >> > Right. The new firmwares and kernels would need to include virtio-pci nic
>> >> > and scsi drivers. Is that a problem? Anyway, this is all the more reason
>> >> > not to hard code peripherals. If a particular peripheral is a problem
>> >> > for a given firmware, then simply don't add it to the command line, add a
>> >> > different one.
>> >> >
>> >> Yes that is problem, for newly developed firmwares, extra efforts will
>> >> be wasted on frontend codes (or glue-layer, whatever we call it), we
>> >> want firmwares developed on this platform can run easily on real
>> >> hardware, without such change.
>> >> Requirement is: some Linaro members just want a qemu platform as true
>> >> as possible with real hardware, there should be no problem with such
>> >> requirement, problem is 'virt' machine cannot satisfy the requirement,
>> >> so a new one is needed.
>> >
>> > It sounds like somebody knows what drivers are available and what
>> > drivers aren't. If that's not already documented, then it should
>> > be, and a pointer to it should be in this patch series.
>> >
>>
>> Available where?
>
> Available in UEFI, ARM-TF, and the target guest kernel. What software
> stack is this machine model targeting? I get the impression people
> know what they need, but knowing and specifying with a document are
> two different things.
>

Right.

>>
>> UEFI has drivers for ?HCI industry standard hardware. As for the
>> networking side, we should review whether E1000e is the most
>> appropriate or this, given the lack of open source drivers. However, I
>> do agree that discoverable hardware should not be hardcoded, and we
>> should even try to use the emulated option ROM to provide a UEFI
>> driver.
>
> Amen to that.
>
>>
>> >>
>> >> >>
>> >> >> >>  - No paravirtualized fw_cfg device either.
>> >> >> >>
>> >> >> >> Arm Trusted Firmware and UEFI porting to this are done accordingly.
>> >> >> >>
>> >> >> >
>> >> >> > How will UEFI get the ACPI tables from QEMU without fw-cfg? I didn't
>> >> >> > see any sort of reserved ROM region in the patch for them.
>> >> >> >
>> >> >> UEFI gets ACPI and kernel from network or mass storage, just like the
>> >> >> real hardware.
>> >> >
>> >> > Hmm. I thought for real hardware that the ACPI tables were built into
>> >> > the firmware. So, assuming UEFI knows how to read ACPI tables from
>> >> > some storage, then how do the QEMU generated ACPI tables get into that
>> >> > storage?
>> >> >
>> >> I should say "mass storage and flash"
>> >> There was fw_cfg in v1 patch, it is removed in v2.
>> >> If no fw_cfg, just like real hardware, UEFI should include ACPI
>> >> support for this SBSA platform, and UEFI/ACPI is load via -pflash,
>> >> then the QEMU built-in ACPI isn't used.
>> >> But there are side effects too, command 'qemu -bios uefi -kernel'
>> >> won't work, I need extra time to evaluate this change.
>> >
>> > Right. Neither ACPI nor '-bios ... -kernel ...' can work without fw-cfg.
>> > This patch either needs to keep fw-cfg, or to remove the ACPI changes.
>> > I can't see how an SBSA reference platform would be much use without ACPI
>> > though.
>> >
>>
>> Even if mach-virt's ACPI code depends on fw_cfg currently, there is no
>> reason whatsoever that this sbsa machine should not implement it like
>> real hardware does, i.e., hard coded tables.
>>
>
> I don't disagree, but there's no point in making QEMU ACPI generation
> code changes that will never be consumed. This patch adds tables for
> the hard coded ?HCI controllers to ACPI. We don't need those changes for
> the virt machine and, without fw-cfg, you can't use them on the reference
> machine.
>

Ah, indeed. I missed that bit.

We should not include any changes that modify the DT node or ACPI
table generation for mach-virt.
