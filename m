Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp585435wru;
        Wed, 25 Jul 2018 04:26:25 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpesSspN2Abq0onXFiCW7MDdtNHx5CMBL0iiwlMdZdScm311myOVFQ7W3qhUq6cTSLbSz5fo
X-Received: by 2002:a37:6809:: with SMTP id d9-v6mr18382676qkc.444.1532517985419;
        Wed, 25 Jul 2018 04:26:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1532517985; cv=none;
        d=google.com; s=arc-20160816;
        b=KylEbVB3RWl693J70Wqxzz1EuhoVuMd+cavqNQzFPHNgttx1c363uJzmkqBsoqKU4V
         NgPYpNo872MWiv4PeanfEKruo/LL3q2bxFWXwW/L1bpKJkHJvicviikFYdEPemqFGtkc
         kkHcP2fYc0W+cYcuvngbj8bqsW1iUPPdV62rKxthI0vsYGD/bPCjg8vb38OzH0GmbIzY
         tU0g8T/46/ip3N4oOrCtzgPFSIxjYCyTd0R+xwugUHGewCLMTJPwQ/bGuz5zrhH1cytB
         adyUnyAgIKPtj9vivbz9Y0wxoDo1cByOOdcSQBHODA6vTBPXQaic7I798QJpVZ7aIaOp
         lLsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:arc-authentication-results;
        bh=+a5UZUP0iCqTnj9T3a3SvFnHMQqkakpgKJUskSxwk+k=;
        b=qvQ1vKARyJsoevQkf/7NDGIh9Z18JeGcXA7oQ2IbP1BZuFrt3qmKlrGgXWIEyEt3ie
         FSGfe+pOc+XozZjo3isRjQSjt14ou8nPvMxjKhXuDEn9fQIpVkEut/OgdI/dAm22UBAG
         J50x3DyAKv33SIKeOz3L+UMG3Pxi5y0Q4RP67bA54QPRlznLVp1d9SBvy8NHG2DM26e/
         jjZ28kWldchoTWKzXW6eGB2bFG8BAmDpCnXFdTQvmIzYczufqHz9DzYy5XyyakIg0Rr2
         0BniTYK5CbNEnQGU0vJXatZIWr3TPR8SGPXhrH0G6ujjGAsAXdITn56YboMhNRFFcPGr
         DHuA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 66.187.233.73 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <drjones@redhat.com>
Received: from mx1.redhat.com (mx3-rdu2.redhat.com. [66.187.233.73])
        by mx.google.com with ESMTPS id m7-v6si1232168qvi.101.2018.07.25.04.26.25
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 25 Jul 2018 04:26:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of drjones@redhat.com designates 66.187.233.73 as permitted sender) client-ip=66.187.233.73;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 66.187.233.73 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C84E9CFB54;
	Wed, 25 Jul 2018 11:26:24 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 728882156898;
	Wed, 25 Jul 2018 11:26:23 +0000 (UTC)
Date: Wed, 25 Jul 2018 13:26:21 +0200
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
Message-ID: <20180725112621.imdzdkntpmh3n5og@kamzik.brq.redhat.com>
References: <1532496652-26364-1-git-send-email-hongbo.zhang@linaro.org>
 <1532496652-26364-2-git-send-email-hongbo.zhang@linaro.org>
 <20180725095426.f7kv4ftngeje6pkx@kamzik.brq.redhat.com>
 <CAHmQWvCKkzim+-Z4Y69fWg6igZ7V6gaWhjKJZ0m0G0dhbwOFyw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHmQWvCKkzim+-Z4Y69fWg6igZ7V6gaWhjKJZ0m0G0dhbwOFyw@mail.gmail.com>
User-Agent: NeoMutt/20180622
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.1]); Wed, 25 Jul 2018 11:26:24 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.1]); Wed, 25 Jul 2018 11:26:24 +0000 (UTC) for IP:'10.11.54.6' DOMAIN:'int-mx06.intmail.prod.int.rdu2.redhat.com' HELO:'smtp.corp.redhat.com' FROM:'drjones@redhat.com' RCPT:''
X-TUID: 9tZfISFIou+l

On Wed, Jul 25, 2018 at 06:22:17PM +0800, Hongbo Zhang wrote:
> On 25 July 2018 at 17:54, Andrew Jones <drjones@redhat.com> wrote:
> > On Wed, Jul 25, 2018 at 01:30:52PM +0800, Hongbo Zhang wrote:
> >> For the Aarch64, there is one machine 'virt', it is primarily meant to
> >> run on KVM and execute virtualization workloads, but we need an
> >> environment as faithful as possible to physical hardware, for supporting
> >> firmware and OS development for pysical Aarch64 machines.
> >>
> >> This patch introduces new machine type 'Enterprise' with main features:
> >>  - Based on 'virt' machine type.
> >>  - Re-designed memory map.
> >>  - EL2 and EL3 are enabled by default.
> >>  - GIC version 3 by default.
> >>  - AHCI controller attached to system bus, and then CDROM and hard disc
> >>    can be added to it.
> >>  - EHCI controller attached to system bus, with USB mouse and key board
> >>    installed by default.
> >>  - E1000E ethernet card on PCIE bus.
> >>  - VGA display adaptor on PCIE bus.
> >>  - Default CPU type cortex-a57, 4 cores, and 1G bytes memory.
> >>  - No virtio functions enabled, since this is to emulate real hardware.
> >
> > In the last review it was pointed out that using virtio-pci should still
> > be "real" enough, so there's not much reason to avoid it. Well, unless
> > there's some concern as to what drivers are available in the firmware and
> > guest kernel. But that concern usually only applies to legacy firmwares
> > and kernels, and therefore shouldn't apply to AArch64.
> >
> In real physical arm hardware, *HCI are system memory mapped, not on PCIE.
> we need a QEMU platform like that. We need firmware developed on this
> QEMU platform can run on real hardware without change(or only a minor
> change)

virtio-pci has nothing to do with *HCI. You're adding an E1000e to the
PCIe bus instead of a virtio-pci nic. Why?

> Concern is not only available firmwares, but more emphasis is on new
> firmwares to be developed on this platform (target is developing
> firmware for hardware, but using qemu if hardware is not available
> temporarily), if virtio device used, then the newly developed firmware
> must include virtio front-end codes, but it isn't needed while run on
> real hardware at last.

Right. The new firmwares and kernels would need to include virtio-pci nic
and scsi drivers. Is that a problem? Anyway, this is all the more reason
not to hard code peripherals. If a particular peripheral is a problem
for a given firmware, then simply don't add it to the command line, add a
different one.

> 
> >>  - No paravirtualized fw_cfg device either.
> >>
> >> Arm Trusted Firmware and UEFI porting to this are done accordingly.
> >>
> >
> > How will UEFI get the ACPI tables from QEMU without fw-cfg? I didn't
> > see any sort of reserved ROM region in the patch for them.
> >
> UEFI gets ACPI and kernel from network or mass storage, just like the
> real hardware.

Hmm. I thought for real hardware that the ACPI tables were built into
the firmware. So, assuming UEFI knows how to read ACPI tables from
some storage, then how do the QEMU generated ACPI tables get into that
storage?

> If we develop firmware depends on paravirtualized device like fw_cfg,
> then we canot run such firmware on real hardware.

Yes, fw-cfg is paravirt, so it's obvious why you'd prefer it not be there,
but, where real hardware builds its hardware descriptions into its
platform-specific firmware, or uses some platform-specific means of
extracting a description from some platform-specific place, QEMU
machine models use fw-cfg.

Thanks,
drew
