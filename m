Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp156062wru;
        Thu, 26 Jul 2018 02:22:16 -0700 (PDT)
X-Received: by 2002:a24:f83:: with SMTP id 125-v6mr1281786ito.18.1532596936026;
        Thu, 26 Jul 2018 02:22:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1532596936; cv=none;
        d=google.com; s=arc-20160816;
        b=i5vmqJbHMEuDaBPet5NOZ5gxDqV2SRcI8z7OHjUHeSFwezosoWwyP0RVRQy+GY7RRk
         c6Ht1nKAsWsKCSf7SOzCcWId/OTuLeN4b/OrbQclf7mkEApiFrWEG56EnzbsIKcmuxqT
         Z3HQDv2sz3VfCJR1VC7gbc+0ED9dgx4mAj4/MZyXImz19FiQ+yBQMO7SGiPltFaIVclc
         jyHr5H0s/sbIgbaIDnrR1+uOww0iMxwlJtT0QYqkL5JTlPOhmKVbjsdSWxDHN+ic9M8u
         b2ZEjHEfi6ighokNy4BMK4v09eVqIMn8gd4QBCKmqEkcmrRlNxXhOwO1dkG3hg1jpwuI
         i99A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:dkim-signature:arc-authentication-results;
        bh=buMlBx38fwmRK30VsTSuhnnlwn6bRBMjPdwG6dHROfM=;
        b=RZXwliSXM1Q13F6s4bS456XEdp1kiYcU2fEi887GalRqtCIA6NnkGhezu4UtOc2Ei7
         JmZTJr4HoZnWE7BmzqLMxPMEcF+WvvaXinDWHbJx8OAIId+QP5zxm4neBmmx4Bfj2vRN
         zt12wg6CtH+zTWfQn+NDTQKc9MQV4+qill4hm6qoJT95q/SKCgZQ1IU1B4m2QVINS1V7
         C4ukJuBM5MRTx8rCsm336HV3x3ozmHJg7C6HnCMwAdbnmgqWaFpjDzUJltI10IL871IT
         tEq6Hr7K9iuF+83txtZlNEdFPfz7othfwfC9Sf3rD2kI0LRP/IhtvW4Ke/pEOThInljC
         XFYg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YLnJm4xX;
       spf=pass (google.com: domain of hongbo.zhang@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=hongbo.zhang@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <hongbo.zhang@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id x7-v6sor352435jai.20.2018.07.26.02.22.15
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 26 Jul 2018 02:22:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of hongbo.zhang@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YLnJm4xX;
       spf=pass (google.com: domain of hongbo.zhang@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=hongbo.zhang@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=buMlBx38fwmRK30VsTSuhnnlwn6bRBMjPdwG6dHROfM=;
        b=YLnJm4xX/T9o+uCMadtZ1bPHWbPzfwomdiPp7VniKcs6Qw+l83/EPSzpqKRYcLYE5T
         hwA3NehxFqSEDbnhFWtoLw71jJ7giYDXiWAhgTH9D1lInlKvZSccarAWiuWvdaOx7g//
         ebKPJQ4FA2RdmjT66YaGDc03ka5/jNPrCHQBc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=buMlBx38fwmRK30VsTSuhnnlwn6bRBMjPdwG6dHROfM=;
        b=aWvkVAdn61/dCFQGa/KcMCpegrtMkkNO4UKADVxD3OoxKbnXUKnwgq7qUr7fVH/Zbk
         LsC87n2fSmHIdBpr6IPsbXhb3MiAqviTMiNPoZcOD54no7+watzUdCXylICUV8aaRrFW
         v/RtkICHBlj+p10NGGY9H6G9mD8cIVx8i8C4TYIwb1hrhI5gfxKh4EMWiBZV/zRnzNg5
         FTAeQfmjJlJwGaMuBoAU6sM0jrxKYBWtjvHLi0kiyk8RO+FBS5VKopBokBcJFVu15h90
         qn9ixHLL7wzHL3j0w045L2wlmK5hJ0t0vpqLnKUfMUYZNOYPFYDU6bxecb2OsQ0VBsEC
         PsxQ==
X-Gm-Message-State: AOUpUlHycwVDF9Unud+oDmhjhUFQ1kxrqDxS5skhpNMW8Hd/eNV/nNJz
	5A8BTNsy8UNdw174UOVzuMvp766Ineqn1vL0o1YCjeT9
X-Google-Smtp-Source: AAOMgpeqcIABg5KcSbgLONoUCwNW71TCLfKiblTZE1vUECTHwjcfibfi6rwzeQhkXaWMYxgSFbysueHybviD+3rukkE=
X-Received: by 2002:a02:8b57:: with SMTP id w23-v6mr995631jak.73.1532596935655;
 Thu, 26 Jul 2018 02:22:15 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac0:a161:0:0:0:0:0 with HTTP; Thu, 26 Jul 2018 02:22:14
 -0700 (PDT)
In-Reply-To: <20180725112621.imdzdkntpmh3n5og@kamzik.brq.redhat.com>
References: <1532496652-26364-1-git-send-email-hongbo.zhang@linaro.org>
 <1532496652-26364-2-git-send-email-hongbo.zhang@linaro.org>
 <20180725095426.f7kv4ftngeje6pkx@kamzik.brq.redhat.com> <CAHmQWvCKkzim+-Z4Y69fWg6igZ7V6gaWhjKJZ0m0G0dhbwOFyw@mail.gmail.com>
 <20180725112621.imdzdkntpmh3n5og@kamzik.brq.redhat.com>
From: Hongbo Zhang <hongbo.zhang@linaro.org>
Date: Thu, 26 Jul 2018 17:22:14 +0800
Message-ID: <CAHmQWvCfHFSU7RGKG5t6=m7ZSWZjf3TeqOo3cX2KT-GSiN3mPw@mail.gmail.com>
Subject: Re: [Qemu-devel] [PATCH v2 2/2] hw/arm: Add Arm Enterprise machine type
To: Andrew Jones <drjones@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, 
	Radoslaw Biernacki <radoslaw.biernacki@linaro.org>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, 
	QEMU Developers <qemu-devel@nongnu.org>, Leif Lindholm <leif.lindholm@linaro.org>, 
	qemu-arm <qemu-arm@nongnu.org>, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-TUID: NnJOVaYbwq5s

On 25 July 2018 at 19:26, Andrew Jones <drjones@redhat.com> wrote:
> On Wed, Jul 25, 2018 at 06:22:17PM +0800, Hongbo Zhang wrote:
>> On 25 July 2018 at 17:54, Andrew Jones <drjones@redhat.com> wrote:
>> > On Wed, Jul 25, 2018 at 01:30:52PM +0800, Hongbo Zhang wrote:
>> >> For the Aarch64, there is one machine 'virt', it is primarily meant to
>> >> run on KVM and execute virtualization workloads, but we need an
>> >> environment as faithful as possible to physical hardware, for supporting
>> >> firmware and OS development for pysical Aarch64 machines.
>> >>
>> >> This patch introduces new machine type 'Enterprise' with main features:
>> >>  - Based on 'virt' machine type.
>> >>  - Re-designed memory map.
>> >>  - EL2 and EL3 are enabled by default.
>> >>  - GIC version 3 by default.
>> >>  - AHCI controller attached to system bus, and then CDROM and hard disc
>> >>    can be added to it.
>> >>  - EHCI controller attached to system bus, with USB mouse and key board
>> >>    installed by default.
>> >>  - E1000E ethernet card on PCIE bus.
>> >>  - VGA display adaptor on PCIE bus.
>> >>  - Default CPU type cortex-a57, 4 cores, and 1G bytes memory.
>> >>  - No virtio functions enabled, since this is to emulate real hardware.
>> >
>> > In the last review it was pointed out that using virtio-pci should still
>> > be "real" enough, so there's not much reason to avoid it. Well, unless
>> > there's some concern as to what drivers are available in the firmware and
>> > guest kernel. But that concern usually only applies to legacy firmwares
>> > and kernels, and therefore shouldn't apply to AArch64.
>> >
>> In real physical arm hardware, *HCI are system memory mapped, not on PCIE.
>> we need a QEMU platform like that. We need firmware developed on this
>> QEMU platform can run on real hardware without change(or only a minor
>> change)
>
> virtio-pci has nothing to do with *HCI. You're adding an E1000e to the
> PCIe bus instead of a virtio-pci nic. Why?
>
No virtio devices are need on this platform, so no virtio-pci either,
on the real Arm server hardware, a NIC is inserted into PCIE, and
E1000E is a typical one.

>> Concern is not only available firmwares, but more emphasis is on new
>> firmwares to be developed on this platform (target is developing
>> firmware for hardware, but using qemu if hardware is not available
>> temporarily), if virtio device used, then the newly developed firmware
>> must include virtio front-end codes, but it isn't needed while run on
>> real hardware at last.
>
> Right. The new firmwares and kernels would need to include virtio-pci nic
> and scsi drivers. Is that a problem? Anyway, this is all the more reason
> not to hard code peripherals. If a particular peripheral is a problem
> for a given firmware, then simply don't add it to the command line, add a
> different one.
>
Yes that is problem, for newly developed firmwares, extra efforts will
be wasted on frontend codes (or glue-layer, whatever we call it), we
want firmwares developed on this platform can run easily on real
hardware, without such change.
Requirement is: some Linaro members just want a qemu platform as true
as possible with real hardware, there should be no problem with such
requirement, problem is 'virt' machine cannot satisfy the requirement,
so a new one is needed.

>>
>> >>  - No paravirtualized fw_cfg device either.
>> >>
>> >> Arm Trusted Firmware and UEFI porting to this are done accordingly.
>> >>
>> >
>> > How will UEFI get the ACPI tables from QEMU without fw-cfg? I didn't
>> > see any sort of reserved ROM region in the patch for them.
>> >
>> UEFI gets ACPI and kernel from network or mass storage, just like the
>> real hardware.
>
> Hmm. I thought for real hardware that the ACPI tables were built into
> the firmware. So, assuming UEFI knows how to read ACPI tables from
> some storage, then how do the QEMU generated ACPI tables get into that
> storage?
>
I should say "mass storage and flash"
There was fw_cfg in v1 patch, it is removed in v2.
If no fw_cfg, just like real hardware, UEFI should include ACPI
support for this SBSA platform, and UEFI/ACPI is load via -pflash,
then the QEMU built-in ACPI isn't used.
But there are side effects too, command 'qemu -bios uefi -kernel'
won't work, I need extra time to evaluate this change.

>> If we develop firmware depends on paravirtualized device like fw_cfg,
>> then we canot run such firmware on real hardware.
>
> Yes, fw-cfg is paravirt, so it's obvious why you'd prefer it not be there,
> but, where real hardware builds its hardware descriptions into its
> platform-specific firmware, or uses some platform-specific means of
> extracting a description from some platform-specific place, QEMU
> machine models use fw-cfg.
>
> Thanks,
> drew
