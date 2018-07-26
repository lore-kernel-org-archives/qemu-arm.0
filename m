Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp212988wru;
        Thu, 26 Jul 2018 03:35:09 -0700 (PDT)
X-Received: by 2002:a24:43d0:: with SMTP id s199-v6mr1309801itb.28.1532601309229;
        Thu, 26 Jul 2018 03:35:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1532601309; cv=none;
        d=google.com; s=arc-20160816;
        b=ROvpY8OzaZwM57zL34kZhb6XCqrVLlMjGfw83tMFAhObagzSqXhkKMXuW6zuXUxg2G
         JmmB/3rFkDTIddpjncT96TfnWi/1OuAbI35p5a4hzFJMl4fEceHahBd5B8ZsiA8RLfEM
         yEbRyv7T/+f/U6t7xmwgHSXDCy1CquW0yekwjH0JxV5AZGXEnXMjdrbc8ewjfPewZRFI
         Zc7YVxd1ae7uBTLdM0Vc6cx6QMgFt/R7/+OWXtcbrW482rh09tXIqXl/aJ4t4V4uKVEU
         EpjbjkRhtoUvc4i9cGEwkYrT++U7e0RC74lNjbif8pLIFK3oG9iPrAQ26gzsi5pivYE2
         UOlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:dkim-signature:arc-authentication-results;
        bh=EpvzDumXYKiB9fDB3slbuDU/bhVpYTnie1si4Crt9JY=;
        b=WiZM2S22kuy3QzHyr3WZRWLdINILS+/VnW5DRIe7jAO3VxqwowtYJwekclRZf4Bw3F
         gCWtbpgxCwP+KvSXMRf8lXNAHN3eQ0lGMIF20/LY4DosjYcYvxgxre07Csg3iThVDaIo
         v3H8S+n/PZXVemBM0Og2xocD6JCYOjSf0FQRFpbzYgZ42CEFeT6lzco4C3Hrby6wKT7X
         HdH1nAooTLWOjS2iehZehzaxIFF8F+mn3/0/0+F/2pmUtGskOrhvMjAaIwiNOUysbafx
         sZlL5QhLTpnuHh2FijvolLENHQT71Xm8t/Hau3RON8KmXMzO76bpzRaaeO7vtNrcK8bx
         +EjA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OKO1gBvA;
       spf=pass (google.com: domain of ard.biesheuvel@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=ard.biesheuvel@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <ard.biesheuvel@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id p14-v6sor296548iod.206.2018.07.26.03.35.09
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 26 Jul 2018 03:35:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of ard.biesheuvel@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OKO1gBvA;
       spf=pass (google.com: domain of ard.biesheuvel@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=ard.biesheuvel@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=EpvzDumXYKiB9fDB3slbuDU/bhVpYTnie1si4Crt9JY=;
        b=OKO1gBvAs7L2P7YPdEEGwX7N/rUp0LBVgGpNw8Kj3Ov8xfaPq0kdsJcabpJxijpvkr
         2YBIuXdBKvLZlISFD+y906SCOFtVXxNYQVbSatZaoomvOyE0jo7wfg8G5X7zsQ2S9rYp
         Ie5Ey3AgYeG+/H7WRNfpcoM1i4qrH5GtzSdS0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=EpvzDumXYKiB9fDB3slbuDU/bhVpYTnie1si4Crt9JY=;
        b=QmpXr4raoBtvmjoaBk4DuxKd9EVNAiUcezOjcYY7AJp6i0WN9425yB54SfwqObaSlm
         Khn87lvf3zJqiO4SI0BY1cU01u/WzM8K/FYAJQAybNuF2w5SipERWRiIktyK3j315sOJ
         cqtguGCQPMUQJr+ykRhbN9ozrRYpn7qAYBk2mpt9KTqExAcpiFyjruLh3S3OqO0w8hr6
         1KjaF3qjVo7ulbZXt6O/9iUwu/dlVzNXxhKbcTdLNQmg+BRPtGFwd4QthEQ3BVqHfNFw
         +Kyk9fX+IVYp6Pvt0iQVVdR4eWj3DIbAMohm6TPRwVbGY92B9HJqnfD1w2y780+HACP5
         CO+A==
X-Gm-Message-State: AOUpUlE7BRn/2+cTQ7Vh4jac3VuB4oj9AWgy2BlvnudlYqW0roqyBRV4
	SLtMn4fXFJKnWT8pZNVsyzxhUQpZFvpqFkxrCTcRRbb1
X-Google-Smtp-Source: AAOMgpcSzOHZrajKWfZSFx1wcuwgBdScJXKMKX6kdrAc7tBnvrHVLKIw47iKwOyo3W2LRjNzvh5F9tMIDZMPOsobuxc=
X-Received: by 2002:a6b:be83:: with SMTP id o125-v6mr1013378iof.173.1532601308764;
 Thu, 26 Jul 2018 03:35:08 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a6b:ac05:0:0:0:0:0 with HTTP; Thu, 26 Jul 2018 03:35:08
 -0700 (PDT)
In-Reply-To: <20180726102855.x6ffdoqjpejpyae7@kamzik.brq.redhat.com>
References: <1532496652-26364-1-git-send-email-hongbo.zhang@linaro.org>
 <1532496652-26364-2-git-send-email-hongbo.zhang@linaro.org>
 <20180725095426.f7kv4ftngeje6pkx@kamzik.brq.redhat.com> <CAHmQWvCKkzim+-Z4Y69fWg6igZ7V6gaWhjKJZ0m0G0dhbwOFyw@mail.gmail.com>
 <20180725112621.imdzdkntpmh3n5og@kamzik.brq.redhat.com> <CAHmQWvCfHFSU7RGKG5t6=m7ZSWZjf3TeqOo3cX2KT-GSiN3mPw@mail.gmail.com>
 <20180726102855.x6ffdoqjpejpyae7@kamzik.brq.redhat.com>
From: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Date: Thu, 26 Jul 2018 12:35:08 +0200
Message-ID: <CAKv+Gu-ffZRNmACH6YieNsg=AHxJxYoXHsBGf6C=nOvFfTu7Sg@mail.gmail.com>
Subject: Re: [Qemu-devel] [PATCH v2 2/2] hw/arm: Add Arm Enterprise machine type
To: Andrew Jones <drjones@redhat.com>
Cc: Hongbo Zhang <hongbo.zhang@linaro.org>, Peter Maydell <peter.maydell@linaro.org>, 
	Radoslaw Biernacki <radoslaw.biernacki@linaro.org>, QEMU Developers <qemu-devel@nongnu.org>, 
	Leif Lindholm <leif.lindholm@linaro.org>, qemu-arm <qemu-arm@nongnu.org>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-TUID: ElECEFe+fpqZ

On 26 July 2018 at 12:28, Andrew Jones <drjones@redhat.com> wrote:
> On Thu, Jul 26, 2018 at 05:22:14PM +0800, Hongbo Zhang wrote:
>> On 25 July 2018 at 19:26, Andrew Jones <drjones@redhat.com> wrote:
>> > On Wed, Jul 25, 2018 at 06:22:17PM +0800, Hongbo Zhang wrote:
>> >> On 25 July 2018 at 17:54, Andrew Jones <drjones@redhat.com> wrote:
>> >> > On Wed, Jul 25, 2018 at 01:30:52PM +0800, Hongbo Zhang wrote:
>> >> >> For the Aarch64, there is one machine 'virt', it is primarily meant to
>> >> >> run on KVM and execute virtualization workloads, but we need an
>> >> >> environment as faithful as possible to physical hardware, for supporting
>> >> >> firmware and OS development for pysical Aarch64 machines.
>> >> >>
>> >> >> This patch introduces new machine type 'Enterprise' with main features:
>> >> >>  - Based on 'virt' machine type.
>> >> >>  - Re-designed memory map.
>> >> >>  - EL2 and EL3 are enabled by default.
>> >> >>  - GIC version 3 by default.
>> >> >>  - AHCI controller attached to system bus, and then CDROM and hard disc
>> >> >>    can be added to it.
>> >> >>  - EHCI controller attached to system bus, with USB mouse and key board
>> >> >>    installed by default.
>> >> >>  - E1000E ethernet card on PCIE bus.
>> >> >>  - VGA display adaptor on PCIE bus.
>> >> >>  - Default CPU type cortex-a57, 4 cores, and 1G bytes memory.
>> >> >>  - No virtio functions enabled, since this is to emulate real hardware.
>> >> >
>> >> > In the last review it was pointed out that using virtio-pci should still
>> >> > be "real" enough, so there's not much reason to avoid it. Well, unless
>> >> > there's some concern as to what drivers are available in the firmware and
>> >> > guest kernel. But that concern usually only applies to legacy firmwares
>> >> > and kernels, and therefore shouldn't apply to AArch64.
>> >> >
>> >> In real physical arm hardware, *HCI are system memory mapped, not on PCIE.
>> >> we need a QEMU platform like that. We need firmware developed on this
>> >> QEMU platform can run on real hardware without change(or only a minor
>> >> change)
>> >
>> > virtio-pci has nothing to do with *HCI. You're adding an E1000e to the
>> > PCIe bus instead of a virtio-pci nic. Why?
>> >
>> No virtio devices are need on this platform, so no virtio-pci either,
>> on the real Arm server hardware, a NIC is inserted into PCIE, and
>> E1000E is a typical one.
>
> It is possible to make a real piece of hardware that really goes in a PCIe
> slot which knows how to talk VirtIO. The fact that an E1000e driver will
> drive an E1000e QEMU model instead of a VirtIO driver driving a VirtIO
> backend is, to me, pretty arbitrary. The only reason it should matter for
> the guest firmware/kernel is whether or not the firmware/kernel will have
> VirtIO drivers available. Do we know that? Is it documented somewhere
> that the guest firmware/kernel is guaranteed to have E1000e drivers, but
> VirtIO drivers are optional, or even forbidden? If so, where's that
> document?
>

It is not pretty arbitrary. One is paravirtualization and one is not.

>>
>> >> Concern is not only available firmwares, but more emphasis is on new
>> >> firmwares to be developed on this platform (target is developing
>> >> firmware for hardware, but using qemu if hardware is not available
>> >> temporarily), if virtio device used, then the newly developed firmware
>> >> must include virtio front-end codes, but it isn't needed while run on
>> >> real hardware at last.
>> >
>> > Right. The new firmwares and kernels would need to include virtio-pci nic
>> > and scsi drivers. Is that a problem? Anyway, this is all the more reason
>> > not to hard code peripherals. If a particular peripheral is a problem
>> > for a given firmware, then simply don't add it to the command line, add a
>> > different one.
>> >
>> Yes that is problem, for newly developed firmwares, extra efforts will
>> be wasted on frontend codes (or glue-layer, whatever we call it), we
>> want firmwares developed on this platform can run easily on real
>> hardware, without such change.
>> Requirement is: some Linaro members just want a qemu platform as true
>> as possible with real hardware, there should be no problem with such
>> requirement, problem is 'virt' machine cannot satisfy the requirement,
>> so a new one is needed.
>
> It sounds like somebody knows what drivers are available and what
> drivers aren't. If that's not already documented, then it should
> be, and a pointer to it should be in this patch series.
>

Available where?

UEFI has drivers for ?HCI industry standard hardware. As for the
networking side, we should review whether E1000e is the most
appropriate or this, given the lack of open source drivers. However, I
do agree that discoverable hardware should not be hardcoded, and we
should even try to use the emulated option ROM to provide a UEFI
driver.

>>
>> >>
>> >> >>  - No paravirtualized fw_cfg device either.
>> >> >>
>> >> >> Arm Trusted Firmware and UEFI porting to this are done accordingly.
>> >> >>
>> >> >
>> >> > How will UEFI get the ACPI tables from QEMU without fw-cfg? I didn't
>> >> > see any sort of reserved ROM region in the patch for them.
>> >> >
>> >> UEFI gets ACPI and kernel from network or mass storage, just like the
>> >> real hardware.
>> >
>> > Hmm. I thought for real hardware that the ACPI tables were built into
>> > the firmware. So, assuming UEFI knows how to read ACPI tables from
>> > some storage, then how do the QEMU generated ACPI tables get into that
>> > storage?
>> >
>> I should say "mass storage and flash"
>> There was fw_cfg in v1 patch, it is removed in v2.
>> If no fw_cfg, just like real hardware, UEFI should include ACPI
>> support for this SBSA platform, and UEFI/ACPI is load via -pflash,
>> then the QEMU built-in ACPI isn't used.
>> But there are side effects too, command 'qemu -bios uefi -kernel'
>> won't work, I need extra time to evaluate this change.
>
> Right. Neither ACPI nor '-bios ... -kernel ...' can work without fw-cfg.
> This patch either needs to keep fw-cfg, or to remove the ACPI changes.
> I can't see how an SBSA reference platform would be much use without ACPI
> though.
>

Even if mach-virt's ACPI code depends on fw_cfg currently, there is no
reason whatsoever that this sbsa machine should not implement it like
real hardware does, i.e., hard coded tables.
