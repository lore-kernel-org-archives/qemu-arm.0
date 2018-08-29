Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp634755wrd;
        Wed, 29 Aug 2018 06:42:23 -0700 (PDT)
X-Google-Smtp-Source: ANB0VdZ4gf3+wLVrmAumjrh97AxZJbtUUCz3PX5XluI5SagqwCRCUO+6oFw5PumSebBCQQlh/jSv
X-Received: by 2002:a0c:d5d3:: with SMTP id h19-v6mr6562610qvi.218.1535550143362;
        Wed, 29 Aug 2018 06:42:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1535550143; cv=none;
        d=google.com; s=arc-20160816;
        b=SF7lfinnx59G8s2fOKUDh/evzdhIiIETCRE0xYz5DshrFtB1tO9++ZJ7VgS7+vOKN5
         4yQK8rLiD5NQVy207Sp1MswRTy5MgDVCdnuU05sx+sSsDnLJ23sHTc9jmvLuKSvc6kf9
         QkRm+qLEf03OuUFhBUkvUchWF6sx78Z/neLHuufhZn/To0yqQP7uairJ8O0nF3M3TzN3
         /jS+I68oHNmhiYx582g3NfnGhdcG76KDwu39P3dEw2Qm2ywtYExwermj6MhcUm12k8yG
         ffhXYnA6FKohNWC7YT7SK3lKtEnmZg4qXRdt2qTURv+dGEi/wdHCMNh8FpWhAPRsQl0f
         vIHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:arc-authentication-results;
        bh=iAcAhLABN0czb+bOrWqdCfjC1PRFUNDtcISBAR2IYlU=;
        b=Q8yB3S+r/oMaZku9oKCr1IIpJRdr5uLZ7zD8dM2+rFA7b5CBBTbWaeFwol6pfs2a9I
         g2Gt35dYWnIxjulvu6THxlauUpzNQEg0145dJnK3LTVxdELWb9Ip4aaAw99TbWAHBCip
         WgH5JAXuaMBz9D52kFkdBb4NIwSSFTi0renzhmq937rdsICPrqnkswmMjRrSUbDRl529
         BKBZYN6nqVfUUCkwgvWne1WwSvUJCbs1ib+KLwo+UoA1o6qSIu1WSxwRaGyzD7pC0knL
         gOjzjqWQZxkRIskWTR/jI1yS4mkBwkDSZWddWALDy6TsGBG1DqyYw7Yn7JyUhrPS1r/e
         6rfg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 66.187.233.73 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <drjones@redhat.com>
Received: from mx1.redhat.com (mx3-rdu2.redhat.com. [66.187.233.73])
        by mx.google.com with ESMTPS id f53-v6si648734qta.336.2018.08.29.06.42.23
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 29 Aug 2018 06:42:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of drjones@redhat.com designates 66.187.233.73 as permitted sender) client-ip=66.187.233.73;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 66.187.233.73 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 94B805A74E;
	Wed, 29 Aug 2018 13:42:22 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 508BB63A6A;
	Wed, 29 Aug 2018 13:42:21 +0000 (UTC)
Date: Wed, 29 Aug 2018 15:42:19 +0200
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
Message-ID: <20180829134219.cmyqipnvukk6k2rp@kamzik.brq.redhat.com>
References: <1532496652-26364-1-git-send-email-hongbo.zhang@linaro.org>
 <1532496652-26364-2-git-send-email-hongbo.zhang@linaro.org>
 <CAFEAcA9hivJzqksiSZbco4+EysYj=_y0t3k_L7TobxNPS8T2dQ@mail.gmail.com>
 <CAHmQWvC4Kp1CAeCe8ZTGtSeG7fnT=Xen4GFKfnhTBWUCJdQV+g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHmQWvC4Kp1CAeCe8ZTGtSeG7fnT=Xen4GFKfnhTBWUCJdQV+g@mail.gmail.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.2]); Wed, 29 Aug 2018 13:42:22 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.2]); Wed, 29 Aug 2018 13:42:22 +0000 (UTC) for IP:'10.11.54.5' DOMAIN:'int-mx05.intmail.prod.int.rdu2.redhat.com' HELO:'smtp.corp.redhat.com' FROM:'drjones@redhat.com' RCPT:''
X-TUID: Iti2+2GZBdwu

On Wed, Aug 29, 2018 at 05:17:20PM +0800, Hongbo Zhang wrote:
> On 17 August 2018 at 21:37, Peter Maydell <peter.maydell@linaro.org> wrote:
> > On 25 July 2018 at 06:30, Hongbo Zhang <hongbo.zhang@linaro.org> wrote:
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
> >>  - No paravirtualized fw_cfg device either.
> >>
> >> Arm Trusted Firmware and UEFI porting to this are done accordingly.
> >>
> >> Signed-off-by: Hongbo Zhang <hongbo.zhang@linaro.org>
> >> ---
> >> Changes since v1:
> >>  - rebase on v3.0.0-rc0
> >>  - introduce another auxillary patch as 1/2, so this is 2/2
> >>  - rename 'sbsa' to 'enterprise'
> >>  - remove paravirualized fw_cfg
> >>  - set gic_vertion to 3 instead of 2
> >>  - edit commit message to describe purpose of this platform
> >
> > Hi; there's been a lot of discussion on this thread. I'm going
> > to assume that you don't need any further review commentary for
> > the moment, and will wait for a v3. If there are any specific
> > questions you want guidance on to produce that v3, let me know.
> >
> Thank you for this summary/remind.
> Sorry for the late reply due to my vacation last week.
> 
> Yes, I am working on the v3, with main changes:
>  - machine name "sbsa-ref" (good name?)
>  - a separate file sbsa-ref.c
>  - don't touch the acpi c file, acpi will be supplied by uefi

I agree with the above three bullets.

>  - only necessary dt node, no other peripheral dt nodes

I'm not sure what DT nodes are necessary. After discussing the
ACPI tables, and that firmware would supply them, I thought we
also agreed firmware would supply the DTB.

Thanks,
drew

> 
> Before my sending, I still like comments on the above effort, it is
> feasible/reasonable or not etc, in case I go wrong too much.
> 
> I also know that some reviewers may like to give comments when they
> see the patch codes, so if you don't have comments now, you can do it
> after seeing the patch.
> Thanks all.
> 
> > thanks
> > -- PMM
> 
