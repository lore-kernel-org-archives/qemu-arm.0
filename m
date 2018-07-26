Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp83654wru;
        Thu, 26 Jul 2018 00:44:51 -0700 (PDT)
X-Received: by 2002:a6b:30c9:: with SMTP id w192-v6mr697617iow.291.1532591090979;
        Thu, 26 Jul 2018 00:44:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1532591090; cv=none;
        d=google.com; s=arc-20160816;
        b=yPknoH2nMy2sm9sELA2zFveXggovQQ0r6vXYy7N547JfJGKmI74wGxv8db4e2ImLOB
         tsba0PcONfc6mOOSwK+mgbbEiBqJ82jf7eBnVzPjZCLpTPrL2tnzVLgw6e0eoLnMUag3
         PFCfty5PIjxXhMM/O0hHAEu0VG7H8drlxFm6w637YiGkRKAD7vJIt6j9syDFGpz+1ijj
         snL0WUzCQZd4gUhBW43W67uDyUc0G1j18PUsn5f4leMQQ7tCW3SYpfD0TycdwhbvAa1A
         kbxHzhiqHdH97hTL0F3IWEbwsSPMWcxHk37mOsiAwfOy909y0qHHytchCblaq7s2X/Sx
         rmFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:dkim-signature:arc-authentication-results;
        bh=s7w6+aRS+D6BgqmeEe2/sjuVki0aDowQqFu5Nq1oTTc=;
        b=i743/j9aGlvJ88WGzqpwVM5SE4Fz0/JKyY4UV0ZB1YSctDZQFN8Kx99XkhE4+EmCJ3
         JEWcdSN2MKQaddf8yEB2/8EO0MFpblUPUl5LIfyFHOVZaKSAzYtcyGld5l1SfqPhhAEk
         vyxXWb9HMBl8MO7CMDVKHQaSjBp/P6046/ozmrA11gGiqW57hraG3PEPB9ev8r3b8InV
         Criko6Hsx/bPXFBzIuA3aHGCHcbXjXOltTl+IYtcAHRVXUxceq3KRLmETmfHunmXjK/s
         20AFrdEkLNQn+bD0GTo/qRKMqRi41ghM+gZ6rMh54Gz/GNZ1zIdg80vqbDR34990OLil
         iV9Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EEP9ek8b;
       spf=pass (google.com: domain of ard.biesheuvel@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=ard.biesheuvel@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <ard.biesheuvel@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id g66-v6sor416702itc.59.2018.07.26.00.44.50
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 26 Jul 2018 00:44:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of ard.biesheuvel@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EEP9ek8b;
       spf=pass (google.com: domain of ard.biesheuvel@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=ard.biesheuvel@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=s7w6+aRS+D6BgqmeEe2/sjuVki0aDowQqFu5Nq1oTTc=;
        b=EEP9ek8b2i2z6mRLeG7oD7QDCB9Ha4YS6St6Vu8FRbfgQW1EedOsa5n7twObiZZSHQ
         TWgQmNzrCi9riJfQRPr2ja25FqoK7GsYED1yKYFsVa3/bRWAa4Ctcaa2me9E9gaiuRAB
         mLJpQ76/PfWquHDuIynUKe2hzrMslBSWJ5twY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=s7w6+aRS+D6BgqmeEe2/sjuVki0aDowQqFu5Nq1oTTc=;
        b=ts4dh1qMa5w2VnC+z62079ZbT2uAbUbSmCkSZ4EU3tT3a949HM2PT5fia0nIQef0K5
         dpd1DeZ7YjR1uVhrBkigSc+5sN4F6BtPuIClns3Rzy42IsnTwNVp3ZWEN4i/Ctr/5NtU
         ib4+QU4UBQJFfTGNyUZZX0dF3oVsWFNQuonHS11yVtnL4S8qeQ3JuO0S8fuUlCG3sbGz
         NFhJrAHZGXbrI4PfvUbcdehpDiSv90/aVhQZT0LYUkSLgjzkUvDcOiL6efnRAJrmXSo7
         70Wwi2DwTXg757tR715GBEgefH2PNkcNc1XxOXf09Q46beKI5djAo5ZWxJziTFSy3yJ+
         YlIw==
X-Gm-Message-State: AOUpUlGpVk974/ldbMSg6zGs2pZttpgOscGpRNFIh0Czll9F7VJMt2lO
	HvJuDxZsEhBUBS2qaWhlqX3/EgBZvHapnYXsBzci3EkG
X-Google-Smtp-Source: AAOMgpfhqKsyQfhfHP2LC2xmGEmk/FU2a9C5EoU+CI5EukEHmkbLbCMYeGx1aMMjFGUqyez2aNop/tBozhpT8Q77qYU=
X-Received: by 2002:a24:d7c5:: with SMTP id y188-v6mr1002290itg.50.1532591090591;
 Thu, 26 Jul 2018 00:44:50 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a6b:ac05:0:0:0:0:0 with HTTP; Thu, 26 Jul 2018 00:44:49
 -0700 (PDT)
In-Reply-To: <CAHmQWvCHBxdMy+Qocc1XfURx86RTZd72rnB5-R=5QA00R6fEqw@mail.gmail.com>
References: <1532496652-26364-1-git-send-email-hongbo.zhang@linaro.org>
 <1532496652-26364-2-git-send-email-hongbo.zhang@linaro.org>
 <20180725095426.f7kv4ftngeje6pkx@kamzik.brq.redhat.com> <CAHmQWvCKkzim+-Z4Y69fWg6igZ7V6gaWhjKJZ0m0G0dhbwOFyw@mail.gmail.com>
 <20180725105330.GB2366@work-vm> <CAHmQWvCHBxdMy+Qocc1XfURx86RTZd72rnB5-R=5QA00R6fEqw@mail.gmail.com>
From: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Date: Thu, 26 Jul 2018 09:44:49 +0200
Message-ID: <CAKv+Gu8qM=C=bJeDrUHxMEp3mZ-PYemRXK-Qttvwk9k+C2uz+Q@mail.gmail.com>
Subject: Re: [Qemu-devel] [PATCH v2 2/2] hw/arm: Add Arm Enterprise machine type
To: Hongbo Zhang <hongbo.zhang@linaro.org>
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Andrew Jones <drjones@redhat.com>, 
	Peter Maydell <peter.maydell@linaro.org>, 
	Radoslaw Biernacki <radoslaw.biernacki@linaro.org>, QEMU Developers <qemu-devel@nongnu.org>, 
	Leif Lindholm <leif.lindholm@linaro.org>, qemu-arm <qemu-arm@nongnu.org>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-TUID: NiKD4uUmC9UM

On 26 July 2018 at 09:35, Hongbo Zhang <hongbo.zhang@linaro.org> wrote:
> On 25 July 2018 at 18:53, Dr. David Alan Gilbert <dgilbert@redhat.com> wrote:
>> * Hongbo Zhang (hongbo.zhang@linaro.org) wrote:
>>> On 25 July 2018 at 17:54, Andrew Jones <drjones@redhat.com> wrote:
>>> > On Wed, Jul 25, 2018 at 01:30:52PM +0800, Hongbo Zhang wrote:
>>> >> For the Aarch64, there is one machine 'virt', it is primarily meant to
>>> >> run on KVM and execute virtualization workloads, but we need an
>>> >> environment as faithful as possible to physical hardware, for supporting
>>> >> firmware and OS development for pysical Aarch64 machines.
>>> >>
>>> >> This patch introduces new machine type 'Enterprise' with main features:
>>> >>  - Based on 'virt' machine type.
>>> >>  - Re-designed memory map.
>>> >>  - EL2 and EL3 are enabled by default.
>>> >>  - GIC version 3 by default.
>>> >>  - AHCI controller attached to system bus, and then CDROM and hard disc
>>> >>    can be added to it.
>>> >>  - EHCI controller attached to system bus, with USB mouse and key board
>>> >>    installed by default.
>>> >>  - E1000E ethernet card on PCIE bus.
>>> >>  - VGA display adaptor on PCIE bus.
>>> >>  - Default CPU type cortex-a57, 4 cores, and 1G bytes memory.
>>> >>  - No virtio functions enabled, since this is to emulate real hardware.
>>> >
>>> > In the last review it was pointed out that using virtio-pci should still
>>> > be "real" enough, so there's not much reason to avoid it. Well, unless
>>> > there's some concern as to what drivers are available in the firmware and
>>> > guest kernel. But that concern usually only applies to legacy firmwares
>>> > and kernels, and therefore shouldn't apply to AArch64.
>>> >
>>> In real physical arm hardware, *HCI are system memory mapped, not on PCIE.
>>> we need a QEMU platform like that. We need firmware developed on this
>>> QEMU platform can run on real hardware without change(or only a minor
>>> change)
>>
>> How would you deal with most modern hardware now using XHCI rather than
>> EHCI ?
>>
> Well, EHCI still works well on server, some new X86 servers have both
> XHCI and EHCI, Qualcomm Centriq Arm server even has only EHCI, so
> currently only the EHCI is added.
> I had no strong reason for XHCI or EHCI, if newer is better or some
> users have special requirement for XHCI, it can be added too.
>

Does that really matter? As I pointed out before, we are not
interested in running the firmware on actual bare metal. What we do
care about is not having code in the reference firmware stack that was
added specifically to deal with the dynamic nature of our QEMU
platform.
