Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp207712wru;
        Thu, 26 Jul 2018 03:29:00 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpckISwcGoY2/uLSGHjEjtrBx9fJY6pZDKTTGzjUffwGhN6Gw2AilvnPhFBryanZDO28nTXf
X-Received: by 2002:a37:6902:: with SMTP id e2-v6mr1122101qkc.0.1532600940006;
        Thu, 26 Jul 2018 03:29:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1532600940; cv=none;
        d=google.com; s=arc-20160816;
        b=W1nCItSx0AClo9u4hM65pyWDhMeoOBFxvDvnH/vqkRKVfDuJ0GiddFjX+D7J37zFNp
         8kZkwTbs3Zk3rCbFif6BldxbVTHUvglH49afKurQSAybBmb8736errAudAk60GH6mWqf
         NDtCSDo2zKfSJh5pcCtEWnXgtoDZwgVjIZZJLzEa58NtJMDPCDEf8a4AnyAJn9bcmdDe
         82PriWueWgpkMDgWCAujpc0UBrlJ86pKqXK8Tx8wdY64RQCMUM7su/v73Uyg6Crnctaj
         xS18MUSRO+/t+VcN4JwfiAnBuwkJ/4e1yhCTPj8t5GlK8sLAqe8z9r1PK0SvAkU4wBCv
         /LVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:arc-authentication-results;
        bh=WG4ABT4YRMkTZmrfKFeP5hwRCmsa2xVI4C3CbrICLmw=;
        b=Ey1n8TGozBNhv2/grUML9vbkD0iHZxXNWEsOlyjh3OMpGhQdDWcFoINt+yIkS9GmYf
         fqOooWCTSEQSZElRFf4LYmdUqG+lTqsRL6X+vtToAK9JOtvhp5wcWryvw2v2EoiSyU6O
         eCgRhYrp3S6lezAISPIIiVnvuoYwZhivJ3E7Okb7NrHEs2dHhN1DClKW370ophmslZsL
         GE6BzFuLOR/AIK8+SSaLN0bTviZQVgJFIhTwaLLlRmuzsrl45yRKlFmyOcd/WauE+OGQ
         ZO7rxII0a5gfXx9a4razwyWqG0Ao8yMoYroDLh7zJFUrJLsvckxLH82xOGi/lbyVA8FD
         gHbg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 66.187.233.73 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <drjones@redhat.com>
Received: from mx1.redhat.com (mx3-rdu2.redhat.com. [66.187.233.73])
        by mx.google.com with ESMTPS id c3-v6si791473qvo.55.2018.07.26.03.28.59
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 26 Jul 2018 03:28:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of drjones@redhat.com designates 66.187.233.73 as permitted sender) client-ip=66.187.233.73;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 66.187.233.73 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 65FD3406F8B8;
	Thu, 26 Jul 2018 10:28:59 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 12B1C2166BA3;
	Thu, 26 Jul 2018 10:28:57 +0000 (UTC)
Date: Thu, 26 Jul 2018 12:28:55 +0200
From: Andrew Jones <drjones@redhat.com>
To: Hongbo Zhang <hongbo.zhang@linaro.org>
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Radoslaw Biernacki <radoslaw.biernacki@linaro.org>,
	Ard Biesheuvel <ard.biesheuvel@linaro.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Leif Lindholm <leif.lindholm@linaro.org>,
	qemu-arm <qemu-arm@nongnu.org>,
	Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: Re: [Qemu-devel] [PATCH v2 2/2] hw/arm: Add Arm Enterprise machine
 type
Message-ID: <20180726102855.x6ffdoqjpejpyae7@kamzik.brq.redhat.com>
References: <1532496652-26364-1-git-send-email-hongbo.zhang@linaro.org>
 <1532496652-26364-2-git-send-email-hongbo.zhang@linaro.org>
 <20180725095426.f7kv4ftngeje6pkx@kamzik.brq.redhat.com>
 <CAHmQWvCKkzim+-Z4Y69fWg6igZ7V6gaWhjKJZ0m0G0dhbwOFyw@mail.gmail.com>
 <20180725112621.imdzdkntpmh3n5og@kamzik.brq.redhat.com>
 <CAHmQWvCfHFSU7RGKG5t6=m7ZSWZjf3TeqOo3cX2KT-GSiN3mPw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHmQWvCfHFSU7RGKG5t6=m7ZSWZjf3TeqOo3cX2KT-GSiN3mPw@mail.gmail.com>
User-Agent: NeoMutt/20180622
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.7]); Thu, 26 Jul 2018 10:28:59 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.7]); Thu, 26 Jul 2018 10:28:59 +0000 (UTC) for IP:'10.11.54.6' DOMAIN:'int-mx06.intmail.prod.int.rdu2.redhat.com' HELO:'smtp.corp.redhat.com' FROM:'drjones@redhat.com' RCPT:''
X-TUID: 2tDbdrPuuTxq

On Thu, Jul 26, 2018 at 05:22:14PM +0800, Hongbo Zhang wrote:
> On 25 July 2018 at 19:26, Andrew Jones <drjones@redhat.com> wrote:
> > On Wed, Jul 25, 2018 at 06:22:17PM +0800, Hongbo Zhang wrote:
> >> On 25 July 2018 at 17:54, Andrew Jones <drjones@redhat.com> wrote:
> >> > On Wed, Jul 25, 2018 at 01:30:52PM +0800, Hongbo Zhang wrote:
> >> >> For the Aarch64, there is one machine 'virt', it is primarily meant to
> >> >> run on KVM and execute virtualization workloads, but we need an
> >> >> environment as faithful as possible to physical hardware, for supporting
> >> >> firmware and OS development for pysical Aarch64 machines.
> >> >>
> >> >> This patch introduces new machine type 'Enterprise' with main features:
> >> >>  - Based on 'virt' machine type.
> >> >>  - Re-designed memory map.
> >> >>  - EL2 and EL3 are enabled by default.
> >> >>  - GIC version 3 by default.
> >> >>  - AHCI controller attached to system bus, and then CDROM and hard disc
> >> >>    can be added to it.
> >> >>  - EHCI controller attached to system bus, with USB mouse and key board
> >> >>    installed by default.
> >> >>  - E1000E ethernet card on PCIE bus.
> >> >>  - VGA display adaptor on PCIE bus.
> >> >>  - Default CPU type cortex-a57, 4 cores, and 1G bytes memory.
> >> >>  - No virtio functions enabled, since this is to emulate real hardware.
> >> >
> >> > In the last review it was pointed out that using virtio-pci should still
> >> > be "real" enough, so there's not much reason to avoid it. Well, unless
> >> > there's some concern as to what drivers are available in the firmware and
> >> > guest kernel. But that concern usually only applies to legacy firmwares
> >> > and kernels, and therefore shouldn't apply to AArch64.
> >> >
> >> In real physical arm hardware, *HCI are system memory mapped, not on PCIE.
> >> we need a QEMU platform like that. We need firmware developed on this
> >> QEMU platform can run on real hardware without change(or only a minor
> >> change)
> >
> > virtio-pci has nothing to do with *HCI. You're adding an E1000e to the
> > PCIe bus instead of a virtio-pci nic. Why?
> >
> No virtio devices are need on this platform, so no virtio-pci either,
> on the real Arm server hardware, a NIC is inserted into PCIE, and
> E1000E is a typical one.

It is possible to make a real piece of hardware that really goes in a PCIe
slot which knows how to talk VirtIO. The fact that an E1000e driver will
drive an E1000e QEMU model instead of a VirtIO driver driving a VirtIO
backend is, to me, pretty arbitrary. The only reason it should matter for
the guest firmware/kernel is whether or not the firmware/kernel will have
VirtIO drivers available. Do we know that? Is it documented somewhere
that the guest firmware/kernel is guaranteed to have E1000e drivers, but
VirtIO drivers are optional, or even forbidden? If so, where's that
document?

> 
> >> Concern is not only available firmwares, but more emphasis is on new
> >> firmwares to be developed on this platform (target is developing
> >> firmware for hardware, but using qemu if hardware is not available
> >> temporarily), if virtio device used, then the newly developed firmware
> >> must include virtio front-end codes, but it isn't needed while run on
> >> real hardware at last.
> >
> > Right. The new firmwares and kernels would need to include virtio-pci nic
> > and scsi drivers. Is that a problem? Anyway, this is all the more reason
> > not to hard code peripherals. If a particular peripheral is a problem
> > for a given firmware, then simply don't add it to the command line, add a
> > different one.
> >
> Yes that is problem, for newly developed firmwares, extra efforts will
> be wasted on frontend codes (or glue-layer, whatever we call it), we
> want firmwares developed on this platform can run easily on real
> hardware, without such change.
> Requirement is: some Linaro members just want a qemu platform as true
> as possible with real hardware, there should be no problem with such
> requirement, problem is 'virt' machine cannot satisfy the requirement,
> so a new one is needed.

It sounds like somebody knows what drivers are available and what
drivers aren't. If that's not already documented, then it should
be, and a pointer to it should be in this patch series.

> 
> >>
> >> >>  - No paravirtualized fw_cfg device either.
> >> >>
> >> >> Arm Trusted Firmware and UEFI porting to this are done accordingly.
> >> >>
> >> >
> >> > How will UEFI get the ACPI tables from QEMU without fw-cfg? I didn't
> >> > see any sort of reserved ROM region in the patch for them.
> >> >
> >> UEFI gets ACPI and kernel from network or mass storage, just like the
> >> real hardware.
> >
> > Hmm. I thought for real hardware that the ACPI tables were built into
> > the firmware. So, assuming UEFI knows how to read ACPI tables from
> > some storage, then how do the QEMU generated ACPI tables get into that
> > storage?
> >
> I should say "mass storage and flash"
> There was fw_cfg in v1 patch, it is removed in v2.
> If no fw_cfg, just like real hardware, UEFI should include ACPI
> support for this SBSA platform, and UEFI/ACPI is load via -pflash,
> then the QEMU built-in ACPI isn't used.
> But there are side effects too, command 'qemu -bios uefi -kernel'
> won't work, I need extra time to evaluate this change.

Right. Neither ACPI nor '-bios ... -kernel ...' can work without fw-cfg.
This patch either needs to keep fw-cfg, or to remove the ACPI changes.
I can't see how an SBSA reference platform would be much use without ACPI
though.

Thanks,
drew
