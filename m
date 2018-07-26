Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp231212wru;
        Thu, 26 Jul 2018 03:59:30 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpfacjHo2z10F7HS1rf7ebjO8IVHV6uTXz4g0S670Mbq3wzK6kEpmCe3GjHnSIwcmfxeG/4X
X-Received: by 2002:a0c:b145:: with SMTP id r5-v6mr1085994qvc.97.1532602770341;
        Thu, 26 Jul 2018 03:59:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1532602770; cv=none;
        d=google.com; s=arc-20160816;
        b=mgejX+vuTHRN9K61KcYB6xR4ZG4m/oCMYbMxQx9ti6q4yzMvwnTG/ygXjg78ECd9sQ
         gk+9SZYxhNrD+vApGBUeoRFdiWfIsENve5ZN/NzhthvBEpqJUePXlmQ7QyVwUWnyiNZ9
         IFb+9vsSny6XVw8Hj9zbzpC4ebetv7fB50u8SHt3WstS4g/2aoOoZXoVmJyicg+Eaf6a
         eoOVrdSUgPTRXcRhhGDou5FtLYwys4F3lf7dje+fWAQN9BYKNpJAOM0H9CuHi5kRB2nz
         6szEXw6LF4B+pTHj5hMqMoMWVEUIhrLDwI1oXcTob9G2LiiWJwQ9vPxaaWhyAa593bW3
         NvdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:arc-authentication-results;
        bh=LqJVaP4ebxSC1AFKur4OVw3EBsM15TGqUssdoEi9eh4=;
        b=rE2wZSn+5vqOYsNU7Ge+pp5FRzZiy5maWApvXKKIhHTf71BDhjbta6r+ZF6iZ+x0jl
         L/uX4LgE3d54ZMvaV6FRoQvS6uqfSGVVX3mCOS5bH8jmznJ3X8jjLFA8bmeehBQ7wizU
         fHPrhNxY3CJ3liRS0Hz1Mkwy2Sv6kaCxuSFVN9RaHiOVkFMDyx847ZNpAlGqcENY1jVS
         1XY/cpvl/cTCRtLykGbFUT8h7QmdE3HahZwuJCcKAM3eqm6TdFPmBIj1ay5dM6q6V6qM
         6JDS+XRlnBUDUcUF8+Z21bNnGuADvl9Z40CT+bGCLEVkaTj3pRjBK3QNUbzqT1/nK7Bb
         TFzA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 66.187.233.73 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <drjones@redhat.com>
Received: from mx1.redhat.com (mx3-rdu2.redhat.com. [66.187.233.73])
        by mx.google.com with ESMTPS id u190-v6si937310qkf.356.2018.07.26.03.59.30
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 26 Jul 2018 03:59:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of drjones@redhat.com designates 66.187.233.73 as permitted sender) client-ip=66.187.233.73;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 66.187.233.73 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id AE87B87A76;
	Thu, 26 Jul 2018 10:59:29 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F1A4A21568A1;
	Thu, 26 Jul 2018 10:59:27 +0000 (UTC)
Date: Thu, 26 Jul 2018 12:59:25 +0200
From: Andrew Jones <drjones@redhat.com>
To: Hongbo Zhang <hongbo.zhang@linaro.org>
Cc: Igor Mammedov <imammedo@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Radoslaw Biernacki <radoslaw.biernacki@linaro.org>,
	Ard Biesheuvel <ard.biesheuvel@linaro.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Leif Lindholm <leif.lindholm@linaro.org>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	qemu-arm <qemu-arm@nongnu.org>,
	Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: Re: [Qemu-devel] [PATCH v2 2/2] hw/arm: Add Arm Enterprise machine
 type
Message-ID: <20180726105925.tqppgyriu3vsi2u5@kamzik.brq.redhat.com>
References: <1532496652-26364-1-git-send-email-hongbo.zhang@linaro.org>
 <1532496652-26364-2-git-send-email-hongbo.zhang@linaro.org>
 <20180725095426.f7kv4ftngeje6pkx@kamzik.brq.redhat.com>
 <20180725105040.GA2366@work-vm>
 <20180725113645.fthwhvzx7otrr3ya@kamzik.brq.redhat.com>
 <20180725181542.0c02c720@redhat.com>
 <CAHmQWvCuWsBJjfoO0wi=Bzv6cA1R+ZYY0JM_2B4K_ejf85qFgg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHmQWvCuWsBJjfoO0wi=Bzv6cA1R+ZYY0JM_2B4K_ejf85qFgg@mail.gmail.com>
User-Agent: NeoMutt/20180622
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.1]); Thu, 26 Jul 2018 10:59:29 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.1]); Thu, 26 Jul 2018 10:59:29 +0000 (UTC) for IP:'10.11.54.6' DOMAIN:'int-mx06.intmail.prod.int.rdu2.redhat.com' HELO:'smtp.corp.redhat.com' FROM:'drjones@redhat.com' RCPT:''
X-TUID: 0X8bByk3d6mx

On Thu, Jul 26, 2018 at 05:55:54PM +0800, Hongbo Zhang wrote:
> On 26 July 2018 at 00:15, Igor Mammedov <imammedo@redhat.com> wrote:
> > On Wed, 25 Jul 2018 13:36:45 +0200
> > Andrew Jones <drjones@redhat.com> wrote:
> >
> >> On Wed, Jul 25, 2018 at 11:50:41AM +0100, Dr. David Alan Gilbert wrote:
> >> > * Andrew Jones (drjones@redhat.com) wrote:
> >> > > On Wed, Jul 25, 2018 at 01:30:52PM +0800, Hongbo Zhang wrote:
> >> > > > For the Aarch64, there is one machine 'virt', it is primarily meant to
> >> > > > run on KVM and execute virtualization workloads, but we need an
> >> > > > environment as faithful as possible to physical hardware, for supporting
> >> > > > firmware and OS development for pysical Aarch64 machines.
> >> > > >
> >> > > > This patch introduces new machine type 'Enterprise' with main features:
> >> > > >  - Based on 'virt' machine type.
> >> > > >  - Re-designed memory map.
> >> > > >  - EL2 and EL3 are enabled by default.
> >> > > >  - GIC version 3 by default.
> >> > > >  - AHCI controller attached to system bus, and then CDROM and hard disc
> >> > > >    can be added to it.
> >> > > >  - EHCI controller attached to system bus, with USB mouse and key board
> >> > > >    installed by default.
> >> > > >  - E1000E ethernet card on PCIE bus.
> >> > > >  - VGA display adaptor on PCIE bus.
> >> > > >  - Default CPU type cortex-a57, 4 cores, and 1G bytes memory.
> >> > > >  - No virtio functions enabled, since this is to emulate real hardware.
> >> > >
> >> > > In the last review it was pointed out that using virtio-pci should still
> >> > > be "real" enough, so there's not much reason to avoid it. Well, unless
> >> > > there's some concern as to what drivers are available in the firmware and
> >> > > guest kernel. But that concern usually only applies to legacy firmwares
> >> > > and kernels, and therefore shouldn't apply to AArch64.
> >> >
> >> > I think the difference from last time is Ard's comments earlier in this
> >> > thread:
> >> >
> >> >     The purpose of the SBSA machine is not to provide a minimal
> >> >     configuration. It is intended to exercise all the moving parts one
> >> >     might find in a server firmware/OS stack, including pieces that are
> >> >     not usually found on x86 machines, such as DRAM starting above 4 GB
> >> >     and SATA/USB controllers that are not PCIe based.
> >> >
> >> > that suggests that the intent of this board is to provide everything
> >> > which a firmware writer might want to test;  that's quite different
> >> > from forming the basis of a virtualised machine for real use.
> >> >
> >>
> >> I think I understand the purpose, and I also don't believe anything I've
> >> said is counter to it. Whether or not one drives a virtio-pci nic with a
> >> virtio-pci-net driver or drives an E1000e, also on the PCIe bus, makes
> >> little difference to the firmware, nor to the guest kernel - besides which
> >> driver gets used. And, nothing stops somebody from not plugging the
> >> virtio-pci nic (use -nodefaults) and then plugging the E1000e (-device)
> >> instead. Machine models don't need to hard code these assumptions. For
> >> this patch it'd probably be best if we just ensured there were no
> >> default devices at all, rather than replace one with another.
> >
> > with that thinking it might be better to put this machine in completely
> > different file so not mess with 'production' virt machine code and
> > call it intentionally ambiguous: "[linaro|generic|dev|...]_armv8"
> > so it would be just another sbsa compliant board with  a bunch of
> > default devices needed for testing purposes if users/authors think
> > that it serves their purpose better.
> >
> Yes, before sending, I had to solutions: a separate file and share with virt.c.
> For a internal release, I have a separate file sbsa.c
> http://git.linaro.org/people/hongbo.zhang/qemu-enterprise.git/tree/hw/arm/sbsa.c?h=sbsa-v2.12
> 
> If separate file is used as above, there are much duplicate with
> virt.c, such as both have create_pcie() etc, I need to move all the
> common parts to a new file say virt-common.c, then the virt.c and
> sbsa.c can only handle their specific parts, in such a way, the
> previous still cannot be left untouched.
> 
> so I send out this solution for discuss, people mainly concern the
> necessity of it till now, not the code and file format yet.
> Thanks for you advice.
>

Let's try to figure out how the "sbsa" machine type memory map should look
first. If it isn't adding a bunch of new stuff then it may not matter that
it's in the same file. OTOH, separating virt machine class device and fdt
building functions from virt machine instance parameters would be a nice
cleanup anyway. Doing that cleanup first, and then simply adding a new
machine instance file, would probably be the cleanest approach.

Thanks,
drew
