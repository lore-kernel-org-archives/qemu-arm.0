Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp5358292wrt;
        Tue, 29 Jan 2019 23:45:06 -0800 (PST)
X-Received: by 2002:a19:1f54:: with SMTP id f81mr23131013lff.153.1548834306144;
        Tue, 29 Jan 2019 23:45:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1548834306; cv=none;
        d=google.com; s=arc-20160816;
        b=ih9dncjs1wTP2nJ0hhIOPW1DpdFWg84QHFvTdvMSaVA9E/h6NpgeJM4aAkhgRGNyVW
         qHYzwK+wmnprf5zbOxf99+bBpdFtn+rIWe72R+yD1VnX+TNUN+bwV4XUC/Kff1gvN5J/
         NPEoIPCeExBsUeP3K3wjejx2ZrEsDg9Ygw1COZTXHL7OjwWSasthol9VUN2OEL+agzKs
         Z5iOIOBHHODgSQgyQp9lXZ/odoHDIewwk/GdbuGjF4+SJ4fkuMsiMbU70TSruA1dGmdN
         A9VmqzD8bv2vDwl8cr0g6FCrUHPvhgARM+QHrkBfP2gwk7KXlDh/vQtMztPkjrclGHfF
         T2Uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=An3hepc1qDY7LmRdWZ/aCBDozrRykl+MTfC7A3Y2dOw=;
        b=Z6d47+H19EDcsT0fikwJBgwMoNBvtabJjf9i4D37a2ivOq2It0Xa8IuTzM/UB6eTwm
         +LWispx/2gI78RZC5bUl/isRMQSNCGmKL5VKSxNz9sMyilcfZO4UM6WoyLSO41nLMDqF
         JBh/9lwEzeD+owkrNjxEww4qEIqS9c/MNJ9lvvzuRz59nOqESggZCwcaXNCZQR0epRLe
         qdgQQcNzo4ly639pQU2Z+caV4KC7BTGxXLkok+K8xO2akArQxzKhcepx07cLZMsaqGZS
         yze3L8MppPEjFtcaYwHrb57trGTAyAjI/zVu2f8MIp47LR+Je8KjAp51KLyeZPGWL0jG
         kLRA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=El+pgdLI;
       spf=pass (google.com: domain of hongbo.zhang@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=hongbo.zhang@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <hongbo.zhang@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id w6sor205518lfc.24.2019.01.29.23.45.06
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 29 Jan 2019 23:45:06 -0800 (PST)
Received-SPF: pass (google.com: domain of hongbo.zhang@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=El+pgdLI;
       spf=pass (google.com: domain of hongbo.zhang@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=hongbo.zhang@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=An3hepc1qDY7LmRdWZ/aCBDozrRykl+MTfC7A3Y2dOw=;
        b=El+pgdLI67ZQf5i9bQ7S/uFfSQDSR8ZbLLzjEBep3xMrG/9Abqd3iOyMdmNAPd0y8Z
         bFFiSHnosBDoa0k2WVG8cYF0qMikSwGKWeGN9TPPsl5ZVbMx/7GOLGV+c2bqYDKentD+
         eTDXwxJF/NM91/8LFBFr0tg6kLfROgEZOvbHc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=An3hepc1qDY7LmRdWZ/aCBDozrRykl+MTfC7A3Y2dOw=;
        b=I5Z0b7B0/fsKSGZ/c0FzS+oxOzV/2jC8aThAl6IxsBy4GAM9FRBYdOBrPk4WgxeLxP
         ExJ1o9jCeWLrQkBtL0iW1nkISXfMpmVAdj+BtoLcw7hlMUHReZa4MvR/7/KD9rRNe5f3
         fNRfOGF574XKF06oPtRNacy1t89Uq0q9uFHfmo0RwwJnxTsAIRBOIO4K5WYR03A1pw9t
         oar9A6ZB2VBSzrfZZl8IjUdWNplzR9HHF1lrxXz4zzA4c+7X4kCZwsaWtFR74Nt+epVJ
         fG91U6aYURBGJklqTcQmTQLN2IcLVCoypVW4e2TU4jgxhwYUuNaZVxq2qPE8RQ3VVnMI
         U6pQ==
X-Gm-Message-State: AJcUukcnKJCDDmoNkpjzghmnhiJ834WRVuw9j8kxTrMEsDOS+0CX8hNH
	s3KVK2aTusLXtsOtDy5a0mr0F9uYUv0zvb/BNz+M3XMCqGCuiw==
X-Google-Smtp-Source: ALg8bN50psAbvhB/FUNdrj0TmewvxxWuj171CZjlqy7dhqcz1TfwKpdf9gT+XifVQurXLNh6cf8IDDWyLefKE+4BSeU=
X-Received: by 2002:a19:d486:: with SMTP id l128mr22739926lfg.114.1548834304300;
 Tue, 29 Jan 2019 23:45:04 -0800 (PST)
MIME-Version: 1.0
References: <1544173675-14217-1-git-send-email-hongbo.zhang@linaro.org>
 <1544173675-14217-3-git-send-email-hongbo.zhang@linaro.org>
 <CAFEAcA9mF+WiPLW4yyv1aEMLTg2QK2krZvxyjCSsMziJtzx3Ug@mail.gmail.com>
 <CAHmQWvCw5ndod93WqLXDgGxDERtRM3ee_qiLA+S34Y9X2JFvVQ@mail.gmail.com> <CAFEAcA_+UhU56D7Yx5K8+=DbtUiiV8V7sX2UgxFKSkScUypxFg@mail.gmail.com>
In-Reply-To: <CAFEAcA_+UhU56D7Yx5K8+=DbtUiiV8V7sX2UgxFKSkScUypxFg@mail.gmail.com>
From: Hongbo Zhang <hongbo.zhang@linaro.org>
Date: Wed, 30 Jan 2019 15:44:50 +0800
Message-ID: <CAHmQWvD2e48LJeyTWfjLARiN1kkg=AX-QBL7oMWbv1g91_eqeA@mail.gmail.com>
Subject: Re: [PATCH v5 2/2] hw/arm: add Arm SBSA reference machine, devices part
To: Peter Maydell <peter.maydell@linaro.org>
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>, 
	Ard Biesheuvel <ard.biesheuvel@linaro.org>, Leif Lindholm <leif.lindholm@linaro.org>, 
	Radoslaw Biernacki <radoslaw.biernacki@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-TUID: nTeUc9jecBHj

On Tue, 29 Jan 2019 at 23:26, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Mon, 28 Jan 2019 at 09:46, Hongbo Zhang <hongbo.zhang@linaro.org> wrote:
> >
> > On Tue, 22 Jan 2019 at 19:49, Peter Maydell <peter.maydell@linaro.org> wrote:
> > >
> > > On Fri, 7 Dec 2018 at 09:08, Hongbo Zhang <hongbo.zhang@linaro.org> wrote:
> > > > +static void sbsa_ref_machine_done(Notifier *notifier, void *data)
> > > > +{
> > > > +    VirtMachineState *vms = container_of(notifier, VirtMachineState,
> > > > +                                         machine_done);
> > > > +    ARMCPU *cpu = ARM_CPU(first_cpu);
> > > > +    struct arm_boot_info *info = &vms->bootinfo;
> > > > +    AddressSpace *as = arm_boot_address_space(cpu, info);
> > > > +
> > > > +    if (arm_load_dtb(info->dtb_start, info, info->dtb_limit, as) < 0) {
> > > > +        exit(1);
> > > > +    }
> > > > +}
> > >
> > > I still don't understand why we need this -- it doesn't seem
> > > to be doing anything different from the default behaviour that
> > > boot.c implements if skip_dtb_autoload is false.
> > >
> >
OK, I will track that patch and will remove machine_done() in my patch.

> > According to the process of arm_load_kernel() in boot.c, If only
> > kernel loaded via -kernel but without any firmware, it works fine.
> > While in this case, we have have firmware loaded but no kernel (eg
> > firmware loads kernel from storage, firmware never come back to qemu
> > again), so the arm_load_kernel() returns in the middle before calling
> > arm_load_dtb(),  because arm_load_dtb() is the final step in
> > arm_load_kernel(), so there is no chance for the arm_load_dtb() to be
> > called, then we get error message and qemu quits.
>
> Oh, I see now. I think this is a bug in boot.c and we should
> fix it by making the "this is a firmware boot" code path also
> do the arm_load_dtb() call. I'll send a patch.
>
> thanks
> -- PMM
