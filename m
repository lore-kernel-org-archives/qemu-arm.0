Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp222025wru;
        Thu, 26 Jul 2018 03:46:40 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpd+2U14yQ/0V5V5uziBDLLmFHWoVpjBp9VRMUvZiKeGrQN4h042X7VodsuqPTHiLINsOpyz
X-Received: by 2002:a37:4951:: with SMTP id w78-v6mr1131743qka.2.1532602000416;
        Thu, 26 Jul 2018 03:46:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1532602000; cv=none;
        d=google.com; s=arc-20160816;
        b=vRXfZ9YEA5bSQk1xew2E3o4TVlKvEqQWvWqNUR5KiCWCj89rL3XbvgvEFsMPPcmN3Q
         6DkiX4cc8BrcISSh4Uozmp87grHNnlUSh03r7z42uwzwVUl2eSW4OIKqCW461u4mCILu
         aSNkb7czVu0avDtUp/b+u+XPZkLJqWHNHi6IMmA/LHo98IKltZxtaCmL5tZTgcNai+NO
         D4wVg4mNKYb+945qZJE5tbqJ0Ig2imG0oD2FJ2NWaRuWKaYTtq3APHGtcwA2QLJU4Co/
         8WvPpdq7DZyz8f62UwyhQa+MqJ9igdzCfOGWUVSORLQqVBZ0L2L671vTydZ9i5L7oBo1
         +YvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:arc-authentication-results;
        bh=euchSZQx8cMisZE7x07cfgsmswaHDvOJUbefMAaroqU=;
        b=DUtx+hCmI8K7bcyJti/XL5cyPQSOIFtQd02TxAdNUDaK9Ujc0BkbRhjd0W1QeRGOKw
         W9a5q1xa/MGB7WSgh191ikbb/mu7eOrTptEsBQJq+PzseJi8c9GsDL06xfAfRs3CqrPL
         31E7sjRLJDb1X9B2a7Rrd3vP7ACC3aPD3fYH4+KmaDJ/zxUkqC9fbfUm4gsRZ3NCSS51
         ChE0cREkzVzcMLHTDQROI7JAUYyCiTUhyEF59Ij6rmhPaKuNCAF4JXnDpi5eTlMIe0Si
         KrWbx4MLU2GOTBVlD13KQ6whvKc1/db530f95cOunL7XpK6WZSe/RTffVchY3KU+OhdL
         FXRw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 66.187.233.73 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <drjones@redhat.com>
Received: from mx1.redhat.com (mx3-rdu2.redhat.com. [66.187.233.73])
        by mx.google.com with ESMTPS id g26-v6si957865qtf.118.2018.07.26.03.46.40
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 26 Jul 2018 03:46:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of drjones@redhat.com designates 66.187.233.73 as permitted sender) client-ip=66.187.233.73;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 66.187.233.73 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E71C98562A;
	Thu, 26 Jul 2018 10:46:39 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 968DD1C5AF;
	Thu, 26 Jul 2018 10:46:38 +0000 (UTC)
Date: Thu, 26 Jul 2018 12:46:36 +0200
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
Message-ID: <20180726104636.aua3pjsqkqnkvggk@kamzik.brq.redhat.com>
References: <1532496652-26364-1-git-send-email-hongbo.zhang@linaro.org>
 <1532496652-26364-2-git-send-email-hongbo.zhang@linaro.org>
 <20180725095426.f7kv4ftngeje6pkx@kamzik.brq.redhat.com>
 <CAHmQWvDu+P26Y5CJfcQ=1_9C=hej_B8w7dLMbmuOmCV-+pYOJQ@mail.gmail.com>
 <20180725114404.6g335n3rfjt23hjc@kamzik.brq.redhat.com>
 <CAHmQWvC44mLchhEFPU0T0gKWVcjjozp95ZumaKK9EkPwpeehTA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHmQWvC44mLchhEFPU0T0gKWVcjjozp95ZumaKK9EkPwpeehTA@mail.gmail.com>
User-Agent: NeoMutt/20180622
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.2]); Thu, 26 Jul 2018 10:46:39 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.2]); Thu, 26 Jul 2018 10:46:39 +0000 (UTC) for IP:'10.11.54.5' DOMAIN:'int-mx05.intmail.prod.int.rdu2.redhat.com' HELO:'smtp.corp.redhat.com' FROM:'drjones@redhat.com' RCPT:''
X-TUID: 7VygN6JsNKW7

On Thu, Jul 26, 2018 at 06:17:36PM +0800, Hongbo Zhang wrote:
> On 25 July 2018 at 19:44, Andrew Jones <drjones@redhat.com> wrote:
> > On Wed, Jul 25, 2018 at 06:46:59PM +0800, Hongbo Zhang wrote:
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
> >> For Armv7, there is one typical platform 'vexpress', but for Armv8, no
> >
> > Wasn't the vexpress model designed for a specific machine? Namely for
> > Arm's simulator? Is the vexpress model really something typical among
> > all the Armv7 platforms?
> >
> >> such typical one, the 'virt' is typically for running workloads, one
> >> example is using it under OpenStack.
> >> So a 'typical' one for Armv8 is needed for firmware and OS
> >> development, similar like 'vexpress' for Armv7.
> >
> > What is a "typical" Armv8 machine? What will a typical Armv8 machine be in
> > two years?
> >
> > Note, I'm not actually opposed to the current definition (because I don't
> > really have one myself). I'm just opposed to hard coding one.
> >
> For x86, we have i440fx and q35 (although they are old), but for
> Armv8, simple usage like "qemu -bios/-pflash -cdrom" to install an OS
> and "qemu -bios/-pflash -hda" to launch is needed too.
> Armv8 has no such ones like x86, but we need, and SBSA could be the one.

i440fx and q35 are specific machine types. 'sbsa' is a generic machine
type that conforms to the SBSA specification. If you weren't trying to
memory map AHCI and EHCI controllers, or if memory mapped AHCI and EHCI
controllers were mandated in the SBSA spec, then there wouldn't be
anything to discuss. But that's not the case. You're attempting to
hard code one instance of a generic class of SBSA machines, but then
just call it 'sbsa'.

> 
> Hard coding, user may have different customs, It couldn't be better if
> one platform satisfy requirement, if not satisfied we edit it with
> command or readconfig slightly, if we always need to change a platform
> to another one with huge difference, then why not maintain the other
> one, otherwise we don't need to maintain so many platforms at all.
>

I won't argue about creating a list of default devices for an 'sbsa'
machine that get plugged when '-nodefaults' isn't used, but if you add
them to the memory map then '-nodefaults' won't remove them, which isn't
acceptable for a machine type generically named 'sbsa'.

Thanks,
drew
