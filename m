Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp601058wru;
        Wed, 25 Jul 2018 04:44:09 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpd9lZyiK+a2KbwA06chu/lcQepFzVM2Ib008FOV3L9/3tLcyxkh0VYU0kEHmJOW3WEbcGai
X-Received: by 2002:a37:14cd:: with SMTP id 74-v6mr19199888qku.184.1532519049111;
        Wed, 25 Jul 2018 04:44:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1532519049; cv=none;
        d=google.com; s=arc-20160816;
        b=Crt2v0Mos3nXBc1re0XsoQDF5wsRe7M7pZCWSRbk7W9YRMzApt+D/cYYuBaPL6ClEX
         axqbBZnXUZSomN/V+1+vBP20su5wRboywNyIED9Lqn06C+p/GPzz0ZCFJuFnw03ILtCT
         k+jPq/XdKLy2MNeH/FPTYFTIQAY7RuUojV7y+IBw7JUvUo9P3hCk/JXXVfx3w1nnnsD3
         m6yCEblLgKP9MaKbPar8bf4r66HeeYV75+jxhQOElF4B995VwI0RYQ/zd/u3nzi9tbxR
         G8mtjT9cq5Xlmhs6LcGWR9XGFE+gy0egg+3oheg1fmw8T0Hojrt4iv0z8tSxMKdMzSZk
         B1Gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:arc-authentication-results;
        bh=eLLqJ24pzhk0KfhWR5GaHXoDDqbHOJ1WxIm5RaMrnMk=;
        b=mV0ewgjIeJwfU2hf4BIuFJiQ6rGQkl7A4f+zRqqXPzvoBkApLSWolgjFiW0Gjk4Hx6
         /qvw+yVifrzbwQvc03kg7w7sy123BDMlh1MWWelgaE8+crsmk/lVKYLAKgbB0TnUad79
         uSgNcYGZL8Y4sZHqEwtgl9dgSx8mFBL7b6wBJv2lWEGnrVbcdr6Rx0cOybgb0mWaC90+
         8Ox4HYZj+C/3JmjWJ5S20gDSHA72hIGwMxxNd9fNT5LKtMVwb2VFvftBNjqBLG/oD/Ik
         fWQCMWy9cWd5EBtdus176bHGwufh9DyClFjuq2FGnHfu4rkFWwaGupV+VvoyIjlwL/qD
         xX0w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 66.187.233.73 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <drjones@redhat.com>
Received: from mx1.redhat.com (mx3-rdu2.redhat.com. [66.187.233.73])
        by mx.google.com with ESMTPS id n30-v6si5372671qva.213.2018.07.25.04.44.08
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 25 Jul 2018 04:44:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of drjones@redhat.com designates 66.187.233.73 as permitted sender) client-ip=66.187.233.73;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 66.187.233.73 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 863FC401EF35;
	Wed, 25 Jul 2018 11:44:08 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3083710FFE4D;
	Wed, 25 Jul 2018 11:44:07 +0000 (UTC)
Date: Wed, 25 Jul 2018 13:44:04 +0200
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
Message-ID: <20180725114404.6g335n3rfjt23hjc@kamzik.brq.redhat.com>
References: <1532496652-26364-1-git-send-email-hongbo.zhang@linaro.org>
 <1532496652-26364-2-git-send-email-hongbo.zhang@linaro.org>
 <20180725095426.f7kv4ftngeje6pkx@kamzik.brq.redhat.com>
 <CAHmQWvDu+P26Y5CJfcQ=1_9C=hej_B8w7dLMbmuOmCV-+pYOJQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHmQWvDu+P26Y5CJfcQ=1_9C=hej_B8w7dLMbmuOmCV-+pYOJQ@mail.gmail.com>
User-Agent: NeoMutt/20180622
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.5]); Wed, 25 Jul 2018 11:44:08 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.5]); Wed, 25 Jul 2018 11:44:08 +0000 (UTC) for IP:'10.11.54.3' DOMAIN:'int-mx03.intmail.prod.int.rdu2.redhat.com' HELO:'smtp.corp.redhat.com' FROM:'drjones@redhat.com' RCPT:''
X-TUID: WxxNrB54K+dr

On Wed, Jul 25, 2018 at 06:46:59PM +0800, Hongbo Zhang wrote:
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
> For Armv7, there is one typical platform 'vexpress', but for Armv8, no

Wasn't the vexpress model designed for a specific machine? Namely for
Arm's simulator? Is the vexpress model really something typical among
all the Armv7 platforms?

> such typical one, the 'virt' is typically for running workloads, one
> example is using it under OpenStack.
> So a 'typical' one for Armv8 is needed for firmware and OS
> development, similar like 'vexpress' for Armv7.

What is a "typical" Armv8 machine? What will a typical Armv8 machine be in
two years?

Note, I'm not actually opposed to the current definition (because I don't
really have one myself). I'm just opposed to hard coding one.

Thanks,
drew
