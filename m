Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp907851wrw;
        Fri, 16 Nov 2018 14:04:19 -0800 (PST)
X-Received: by 2002:a6b:d205:: with SMTP id q5-v6mr10554292iob.80.1542405859798;
        Fri, 16 Nov 2018 14:04:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542405859; cv=none;
        d=google.com; s=arc-20160816;
        b=Vl+mJiTIhDh65yKAaCUqDV2dzbauK0xuZzLvG7vHYT1mU3OpiqsFs36eJqEb5QtEzb
         J6Op0q9AlJ3+x7/4rknHZygHkHbksU7b9Hz8xaxPSGqYAkUs+64P4OhquaYfkUFYuobh
         R6DbXca4MGTFtHgDoiS0oP5P1houWw/8r0ETenxW4VC6G5SrA2kREgU3FrpiG5KoGH4V
         dj4pLjWGMxfV3ODjj72EB3KWQyu5kbhzDTJp44m4QA3TQ1r6cc2h7qILA3b4rnXvaUBx
         38QsJ4HEkgEDtLg+MWxcJIR8BpCRKCtkvIm+O+mbkCNHJ+EdgoTdkmPosiaVPCw2f2LL
         il0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=z+A4JKGEHn+jg0uJXk1VIapzDZkseW1HzFxV1jReQnY=;
        b=AtWvns/Wj8FPzayCa28AEW6jimatm0AJtIFYuLb4kHoC4HSiMjW4xBnoRhQ5Lh3rzA
         rzU0dXA4rMWmJ7LaDCzxydps7d+tjvIl0kTz/4z4Nz7/9ltd0VddWs6KbEttVPFZT1ce
         DKNsxvGA15oyZ1qjEd3YqRWh+wWExVRlC/BGb/8nRcVjX5pvaEPOOtpGUtR4RDRECPSR
         KWDLxvmXKoK4fkxUvjqbCmdbi3fPpqcVAL1sdTJqpbw6BUxkUoBFpquZhKZl7ekpy6Eg
         2OUcTgUS600h0KDFrp0MRmMfspeGqOvsh9A40R/Jd/YFBo+EIJaKhk9w1B74eCfuh0hv
         66fg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PgwqKkR8;
       spf=pass (google.com: domain of ard.biesheuvel@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=ard.biesheuvel@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <ard.biesheuvel@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id 200-v6sor4246409itz.1.2018.11.16.14.04.19
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 16 Nov 2018 14:04:19 -0800 (PST)
Received-SPF: pass (google.com: domain of ard.biesheuvel@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PgwqKkR8;
       spf=pass (google.com: domain of ard.biesheuvel@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=ard.biesheuvel@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=z+A4JKGEHn+jg0uJXk1VIapzDZkseW1HzFxV1jReQnY=;
        b=PgwqKkR8AIo725ToIJV4rvSH5B/+PbQnrcqWbFjfm64OQRw8wwN6JI+z7+16p4pmWv
         7Ewxhf+EPSa3lxzpj9isLOiy2s4U9Xo4gEgpCQVPVVUylcMxSa0FYysUpliDSHLkxDsf
         YCXCPi0TJ8ft7cNzIpxEVmwCqYZDQkkDt8K8g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=z+A4JKGEHn+jg0uJXk1VIapzDZkseW1HzFxV1jReQnY=;
        b=hxKpWXWoabAD3jnWxBPTKQNnNglCQ1kJTuuu9ABszr8oAXoxqbUm3nEHuf4QRqm7Yf
         O+8JDR57gosRCroGRRkOfOwlxRVJwdG7vYSab7WeueUiIHLv4iBDbQYGZF9tKmrBZwZG
         sslyDoFCeU1O7WXtdSx9e5kSG33nfHhc+BPAJaEF0xNBBbVQC6nxuz0bracIDhzzPn/f
         sNflb3HQRzx87/sU5P+G1nXgMRrbM8CjIBEVE7VACLMMBxueykdg2+p3vsrD/nf2YkpE
         VxNgIuZPgkF5K1K51RKdADulNkIPETP67QySazYmFY6g2v5941n7dZitK9VcLhBZBywF
         11vA==
X-Gm-Message-State: AGRZ1gINEbUrFGk2Vd3yv43YAugBz13Awx7C2t+CrMl95Jg1GS82iv1G
	YbLfMdxMM9G18OR4gJtV3H70hcR9vJHfFgQh0BQy4gD2
X-Google-Smtp-Source: AJdET5cr9Lqu+TwvhdvKu0TXjJ6Yog4WosEDgpSTX22wZiz2tU3jeF9HFEiE5jZA09DnFUvFPOj0IAWOI+0sleomnmQ=
X-Received: by 2002:a02:914c:: with SMTP id b12-v6mr10122284jag.2.1542405859350;
 Fri, 16 Nov 2018 14:04:19 -0800 (PST)
MIME-Version: 1.0
References: <1539939312-19713-1-git-send-email-hongbo.zhang@linaro.org>
 <1539939312-19713-2-git-send-email-hongbo.zhang@linaro.org>
 <CAFEAcA-vF5orNpfGFe2sGWh=TxWL054PmCM-Yu4faJne+4CkbA@mail.gmail.com>
 <CAHmQWvD1ocAfZo=9aJYeuVDWrBk=AF_D-AgHriYb3-7=n+rR6A@mail.gmail.com> <20181116122705.msdb5hydmhtyzzxy@sirius.home.kraxel.org>
In-Reply-To: <20181116122705.msdb5hydmhtyzzxy@sirius.home.kraxel.org>
From: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Date: Fri, 16 Nov 2018 14:04:07 -0800
Message-ID: <CAKv+Gu8QXaRioVPNze_+mJg4aqjJmwn4O-1jdRcYwrkieXrBwQ@mail.gmail.com>
Subject: Re: [Qemu-devel] [PATCH v4] hw/arm: Add arm SBSA reference machine
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: Hongbo Zhang <hongbo.zhang@linaro.org>, Peter Maydell <peter.maydell@linaro.org>, 
	Radoslaw Biernacki <radoslaw.biernacki@linaro.org>, QEMU Developers <qemu-devel@nongnu.org>, 
	Leif Lindholm <leif.lindholm@linaro.org>, qemu-arm <qemu-arm@nongnu.org>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-TUID: KUw34dr6NnYP

On Fri, 16 Nov 2018 at 04:27, Gerd Hoffmann <kraxel@redhat.com> wrote:
>
>   Hi,
>
> > > What is this using the exynos4210 USB device for? That
> > > is definitely not correct for a generic board.
> > >
> > Checked the code:
> > #define TYPE_SYS_BUS_EHCI "sysbus-ehci-usb"
> > #define TYPE_EXYNOS4210_EHCI "exynos4210-ehci-usb"
> > #define TYPE_TEGRA2_EHCI "tegra2-ehci-usb"
> > #define TYPE_PPC4xx_EHCI "ppc4xx-ehci-usb"
> > #define TYPE_FUSBH200_EHCI "fusbh200-ehci-usb"
> >
> > The first one seems only a parent type, not a general instance, cannot
> > be used directly.
> > The other four are specific instances using the first as parent type,
> > one of them can be chosen to use.
> > That is my understanding, any comments, or do we need to implement one
> > which seems generic?
>
> I think what we *really* want is sysbus-xhci-generic.
>
> That'll be a bit more work though as xhci core and xhci pci needs to be
> splitted, simliar to how it was done for ehci in commit
> 5010d4dc618b6b8e7c21129c487c06f6493f71fc (and related patches).
>
> Or just plug qemu-xhci into a pcie slot.  Not sure which would be closer
> to physical hardware.
>

We don't need XHCI especially, EHCI is perfectly fine as well.

This is mostly about ensuring that the emulated hardware spans the
space of what we encounter on real hardware, and non-PCIE SATA and USB
controllers is something we see often.

So I could live with MMIO SATA and PCI USB as well, but I'd prefer it
if we could have both MMIO.
