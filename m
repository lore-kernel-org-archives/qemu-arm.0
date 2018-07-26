Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp180686wru;
        Thu, 26 Jul 2018 02:55:55 -0700 (PDT)
X-Received: by 2002:a02:687:: with SMTP id 129-v6mr1081923jav.59.1532598955151;
        Thu, 26 Jul 2018 02:55:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1532598955; cv=none;
        d=google.com; s=arc-20160816;
        b=rranMbgtp+RZpprfXfGxjEZlmkadW1JcEm2Sjt0QvoqEeIwgtJNgNVdU2eB9QJjqW7
         7hU98yLTD14pS0wXNL2mahb0858KtP+yervHCQRtuhE+Mbegf3pSPwnmePIbhYfyuQqJ
         BJ22qcitUlmx2s5RsZkHYcqji3bjbEM65DUjcDk4Xkckar974GQIc7gjcXeoz9RJzJhI
         esD42kXkdrtLwHgVDWWVMWW978DOSxdtXXxuAt56RXmcNq1NSI5+F0rkh8qsZefBjwwo
         wdBaVYkYCuxAwqRbQEbx1ve5N0mM8ZKTmHQL1T+PoyWaOMWv/E56CNOLVYSQubsHDK+v
         kG+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:dkim-signature:arc-authentication-results;
        bh=IkBBfJvmrV75DH5vAz+GMu8ncCjWt8BBxgzjG6vO08o=;
        b=DTvN5Y62CLebLe1ywHbNX9EdkFF7jgH6BwWM3aQudugiXFSss+4XQMiQ5RcmUKvXHq
         urV/GR2lYD1CzwiYk2emAIcjoDG3m4YN8V+hF1Vop/PkAG2jmWDCli0RUmVQJQUS/OyX
         x0pdEtT4gD5DaCkimgRqiTLhnP/XYl7y4GsQhi9kXk4SEGr8FkGKb7zf0oS1zcrSlAnz
         A78gNgkMkaKq+ZrqoaWmB7lm/daSf97A4zQ0Efy8oiHmPY2qh6PGoqclpfwK0japcv2D
         ussYF3DeDPKnc2reE6lkCUXhjAGxI8J2ltxe4Evwyj2HMvTOV4eQnycqPTvCWepylMO6
         4xdA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=S+ji+qQd;
       spf=pass (google.com: domain of hongbo.zhang@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=hongbo.zhang@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <hongbo.zhang@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id g188-v6sor371603jag.79.2018.07.26.02.55.55
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 26 Jul 2018 02:55:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of hongbo.zhang@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=S+ji+qQd;
       spf=pass (google.com: domain of hongbo.zhang@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=hongbo.zhang@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=IkBBfJvmrV75DH5vAz+GMu8ncCjWt8BBxgzjG6vO08o=;
        b=S+ji+qQdFlxkOFxWN2mAZAZPtw4n+VEJLN0cZJKmuFcvhrQW5+D/3j8ifS+MFqgGAt
         5Rghi3nsMJsTXBMAxaiuW7UJPHZxpIpxWBwOw7wRc/oHAxsdA8c+ncKfVSqTzBFl80ig
         axVld55zVu/ipPms7fH+YihAvOpMdJw6HVuek=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=IkBBfJvmrV75DH5vAz+GMu8ncCjWt8BBxgzjG6vO08o=;
        b=U3mrIAA8UpLBiuAf2F+K9blnIDFPFwaCc2BenoQQHi4O3Y/DoD8SEhVH771ODFxBOJ
         /b7H1/zorjrpgXj+DxJQ0aPhQXC+0qlxM0o+7CziX4UbTkAZFsJh1Z2XFe4z/Xg7sRFe
         Jjw01aNarN2KYTs/9BKGmjN11R3Jl9anEHu2M5iLmMYFerjZRLbzXSgL5cIjl6xB05T/
         L44upQ1BLYbXYTIejDcvMZjfTcG8jlPu6LmNR6Z9TzLQwaRkOVCqObZVx9Ws/G3+mTvW
         tQOhCtCwMpzMXfLfMG9UZGogE/3+rYwIOZMOugnkpybRQameSihUOhkBCzuPMgSUBT4M
         sYUw==
X-Gm-Message-State: AOUpUlEc6gIbvhzj8lfRFVKLEk2FvaKT5205bV1YWpHbFZzVOggDrEFr
	0l6oBL4uF2HSsZsYTpKckWZRxLUirGpBxPtDDcGuUVJQ
X-Google-Smtp-Source: AAOMgpdsE6Pr7mV0YQ8gUSSg3DtXtb6A9u5J13VNIhvHXDo6MUdvGMmgJRjDY+5DDzF5fWFUHLgrA9qCyD9bw0NcZs4=
X-Received: by 2002:a02:687:: with SMTP id 129-v6mr1081915jav.59.1532598954786;
 Thu, 26 Jul 2018 02:55:54 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac0:a161:0:0:0:0:0 with HTTP; Thu, 26 Jul 2018 02:55:54
 -0700 (PDT)
In-Reply-To: <20180725181542.0c02c720@redhat.com>
References: <1532496652-26364-1-git-send-email-hongbo.zhang@linaro.org>
 <1532496652-26364-2-git-send-email-hongbo.zhang@linaro.org>
 <20180725095426.f7kv4ftngeje6pkx@kamzik.brq.redhat.com> <20180725105040.GA2366@work-vm>
 <20180725113645.fthwhvzx7otrr3ya@kamzik.brq.redhat.com> <20180725181542.0c02c720@redhat.com>
From: Hongbo Zhang <hongbo.zhang@linaro.org>
Date: Thu, 26 Jul 2018 17:55:54 +0800
Message-ID: <CAHmQWvCuWsBJjfoO0wi=Bzv6cA1R+ZYY0JM_2B4K_ejf85qFgg@mail.gmail.com>
Subject: Re: [Qemu-devel] [PATCH v2 2/2] hw/arm: Add Arm Enterprise machine type
To: Igor Mammedov <imammedo@redhat.com>
Cc: Andrew Jones <drjones@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>, 
	Peter Maydell <peter.maydell@linaro.org>, 
	Radoslaw Biernacki <radoslaw.biernacki@linaro.org>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, 
	QEMU Developers <qemu-devel@nongnu.org>, Leif Lindholm <leif.lindholm@linaro.org>, 
	qemu-arm <qemu-arm@nongnu.org>, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-TUID: 5V3AbAsfjhDw

On 26 July 2018 at 00:15, Igor Mammedov <imammedo@redhat.com> wrote:
> On Wed, 25 Jul 2018 13:36:45 +0200
> Andrew Jones <drjones@redhat.com> wrote:
>
>> On Wed, Jul 25, 2018 at 11:50:41AM +0100, Dr. David Alan Gilbert wrote:
>> > * Andrew Jones (drjones@redhat.com) wrote:
>> > > On Wed, Jul 25, 2018 at 01:30:52PM +0800, Hongbo Zhang wrote:
>> > > > For the Aarch64, there is one machine 'virt', it is primarily meant to
>> > > > run on KVM and execute virtualization workloads, but we need an
>> > > > environment as faithful as possible to physical hardware, for supporting
>> > > > firmware and OS development for pysical Aarch64 machines.
>> > > >
>> > > > This patch introduces new machine type 'Enterprise' with main features:
>> > > >  - Based on 'virt' machine type.
>> > > >  - Re-designed memory map.
>> > > >  - EL2 and EL3 are enabled by default.
>> > > >  - GIC version 3 by default.
>> > > >  - AHCI controller attached to system bus, and then CDROM and hard disc
>> > > >    can be added to it.
>> > > >  - EHCI controller attached to system bus, with USB mouse and key board
>> > > >    installed by default.
>> > > >  - E1000E ethernet card on PCIE bus.
>> > > >  - VGA display adaptor on PCIE bus.
>> > > >  - Default CPU type cortex-a57, 4 cores, and 1G bytes memory.
>> > > >  - No virtio functions enabled, since this is to emulate real hardware.
>> > >
>> > > In the last review it was pointed out that using virtio-pci should still
>> > > be "real" enough, so there's not much reason to avoid it. Well, unless
>> > > there's some concern as to what drivers are available in the firmware and
>> > > guest kernel. But that concern usually only applies to legacy firmwares
>> > > and kernels, and therefore shouldn't apply to AArch64.
>> >
>> > I think the difference from last time is Ard's comments earlier in this
>> > thread:
>> >
>> >     The purpose of the SBSA machine is not to provide a minimal
>> >     configuration. It is intended to exercise all the moving parts one
>> >     might find in a server firmware/OS stack, including pieces that are
>> >     not usually found on x86 machines, such as DRAM starting above 4 GB
>> >     and SATA/USB controllers that are not PCIe based.
>> >
>> > that suggests that the intent of this board is to provide everything
>> > which a firmware writer might want to test;  that's quite different
>> > from forming the basis of a virtualised machine for real use.
>> >
>>
>> I think I understand the purpose, and I also don't believe anything I've
>> said is counter to it. Whether or not one drives a virtio-pci nic with a
>> virtio-pci-net driver or drives an E1000e, also on the PCIe bus, makes
>> little difference to the firmware, nor to the guest kernel - besides which
>> driver gets used. And, nothing stops somebody from not plugging the
>> virtio-pci nic (use -nodefaults) and then plugging the E1000e (-device)
>> instead. Machine models don't need to hard code these assumptions. For
>> this patch it'd probably be best if we just ensured there were no
>> default devices at all, rather than replace one with another.
>
> with that thinking it might be better to put this machine in completely
> different file so not mess with 'production' virt machine code and
> call it intentionally ambiguous: "[linaro|generic|dev|...]_armv8"
> so it would be just another sbsa compliant board with  a bunch of
> default devices needed for testing purposes if users/authors think
> that it serves their purpose better.
>
Yes, before sending, I had to solutions: a separate file and share with virt.c.
For a internal release, I have a separate file sbsa.c
http://git.linaro.org/people/hongbo.zhang/qemu-enterprise.git/tree/hw/arm/sbsa.c?h=sbsa-v2.12

If separate file is used as above, there are much duplicate with
virt.c, such as both have create_pcie() etc, I need to move all the
common parts to a new file say virt-common.c, then the virt.c and
sbsa.c can only handle their specific parts, in such a way, the
previous still cannot be left untouched.

so I send out this solution for discuss, people mainly concern the
necessity of it till now, not the code and file format yet.
Thanks for you advice.

>> Thanks,
>> drew
>>
>
