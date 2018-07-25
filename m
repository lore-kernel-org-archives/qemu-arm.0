Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp555152wru;
        Wed, 25 Jul 2018 03:53:34 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpfpVJdJ1QKCsk14YE8pbbPxPiI4q3jQnwaT3+bUz7Pqs53uwPCL4Vxh9hM15RIsm3imhGZ2
X-Received: by 2002:ac8:602:: with SMTP id d2-v6mr19729610qth.97.1532516014505;
        Wed, 25 Jul 2018 03:53:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1532516014; cv=none;
        d=google.com; s=arc-20160816;
        b=N8whfFaTHbc+zOY1Nm7/YEkAzr3W4FFDN2X2yQF+sl8qL1p0STzDVJY4Em/d2xrXc/
         fV1fF0CUPxGqFQAxUkE0kK5HU8KZa7BTJ+XBXk4XxWaxqoObmm9YOyrB9QGeUxKtwcAK
         jczwhXNJPkr9CZem1hfjh+H2ngMAueykfyEYuvlpoM9GT4FZ4ZWBqo/6LXe+oUINGclN
         1AWEc7sn3qdZdZFQI3pDwovOcwEFvWknhYBmWMrH2XjJHfa5Vrds+JcNzF9ULiuSY0iz
         JHUITUav4xW+zhv2OU4pJyv9BVJ+J90nftc5KP7MFJroV5BmS8lsJcXSkpEnqclZWLkM
         SSzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:arc-authentication-results;
        bh=B+OIRRp6vAlplNJc55nNyX2hEuA1mlXHVNLZ1riv/So=;
        b=v1JtGU9+WTR3z8cZvDIffVI+2QYkbVKUGFlEom34x/6uN4xrSP/SZu29Fu77ESbZ2O
         7hln6fnybEMek840HWEvvRVN2IO5QEbQ/cFhuTlekaxqzbq9Zhd8oba6CGuUcNreNDqr
         apiqpBAvLreTrU1g8NbSM+aqW/XXa+xcXHDMgI3QLz82F1uXS8zfjIhxmcLeXmrIM9d/
         gT61hC4YWArGF3EKL/PoYc8TYnZepSsfzQ5qgRf/Jq/ulWg7RYclWvteRLrTu/8npDaA
         7KgkKDDx0WboegmIH7qu/XpK2HtjcDAevI5Rc3GBOl3XQoXeFmqNmsaBVe9Ga6iv/Dui
         T5lw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of dgilbert@redhat.com designates 66.187.233.73 as permitted sender) smtp.mailfrom=dgilbert@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <dgilbert@redhat.com>
Received: from mx1.redhat.com (mx3-rdu2.redhat.com. [66.187.233.73])
        by mx.google.com with ESMTPS id l44-v6si609341qtb.119.2018.07.25.03.53.34
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 25 Jul 2018 03:53:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of dgilbert@redhat.com designates 66.187.233.73 as permitted sender) client-ip=66.187.233.73;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of dgilbert@redhat.com designates 66.187.233.73 as permitted sender) smtp.mailfrom=dgilbert@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 189758197006;
	Wed, 25 Jul 2018 10:53:34 +0000 (UTC)
Received: from work-vm (ovpn-117-189.ams2.redhat.com [10.36.117.189])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A75122156898;
	Wed, 25 Jul 2018 10:53:32 +0000 (UTC)
Date: Wed, 25 Jul 2018 11:53:30 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Hongbo Zhang <hongbo.zhang@linaro.org>
Cc: Andrew Jones <drjones@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Radoslaw Biernacki <radoslaw.biernacki@linaro.org>,
	Ard Biesheuvel <ard.biesheuvel@linaro.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Leif Lindholm <leif.lindholm@linaro.org>,
	qemu-arm <qemu-arm@nongnu.org>,
	Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Subject: Re: [Qemu-devel] [PATCH v2 2/2] hw/arm: Add Arm Enterprise machine
 type
Message-ID: <20180725105330.GB2366@work-vm>
References: <1532496652-26364-1-git-send-email-hongbo.zhang@linaro.org>
 <1532496652-26364-2-git-send-email-hongbo.zhang@linaro.org>
 <20180725095426.f7kv4ftngeje6pkx@kamzik.brq.redhat.com>
 <CAHmQWvCKkzim+-Z4Y69fWg6igZ7V6gaWhjKJZ0m0G0dhbwOFyw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHmQWvCKkzim+-Z4Y69fWg6igZ7V6gaWhjKJZ0m0G0dhbwOFyw@mail.gmail.com>
User-Agent: Mutt/1.10.0 (2018-05-17)
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.8]); Wed, 25 Jul 2018 10:53:34 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.8]); Wed, 25 Jul 2018 10:53:34 +0000 (UTC) for IP:'10.11.54.6' DOMAIN:'int-mx06.intmail.prod.int.rdu2.redhat.com' HELO:'smtp.corp.redhat.com' FROM:'dgilbert@redhat.com' RCPT:''
X-TUID: qQgyzRzQvg6g

* Hongbo Zhang (hongbo.zhang@linaro.org) wrote:
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

How would you deal with most modern hardware now using XHCI rather than
EHCI ?

Dave

> Concern is not only available firmwares, but more emphasis is on new
> firmwares to be developed on this platform (target is developing
> firmware for hardware, but using qemu if hardware is not available
> temporarily), if virtio device used, then the newly developed firmware
> must include virtio front-end codes, but it isn't needed while run on
> real hardware at last.
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
> If we develop firmware depends on paravirtualized device like fw_cfg,
> then we canot run such firmware on real hardware.
> 
> > Thanks,
> > drew
> 
--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK
