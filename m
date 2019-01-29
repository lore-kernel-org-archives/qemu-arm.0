Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp4580095wrt;
        Tue, 29 Jan 2019 07:26:41 -0800 (PST)
X-Received: by 2002:aca:6c4:: with SMTP id 187mr10056989oig.290.1548775601233;
        Tue, 29 Jan 2019 07:26:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1548775601; cv=none;
        d=google.com; s=arc-20160816;
        b=IHVU8jrW9yMhAdtt9cBjT9lzdoqu/PCAsiI4AH9PjztnQXUg4goPZ39skyQb+Vllyh
         zenZ13Aac3uC0Wy4gM2CRY2uX0ltJ3gUDXuktNb+NvjnbPG56p7nH/qm1yJUGXQzorrJ
         OwLBQ2ZpmPuTEMans/0w37nqb8FsQHnl5Fc22OqoTuBZfbrj3V8+C0CRPMhncARsxEat
         ny+LjOXWm79CHIFvom1ng+tXHeVR2uUPqsWSse42GjcF7lK1thMVMAleXrvJrCWbwRG9
         O64pQO8NK+Vbm1sfERAZVcz4x7HRo2Y6yDpv9jzz79AYdmUY5MtO+fX5tFmERUfF9mDf
         eBgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=PavnICnR9C4g2DTDZb6h4Hj9lAVBDBrrn5PFfMfMrWA=;
        b=ojq1Lnl1YQuBotihRHm1sRT+OJI/6oFPTCS2na5GjXLvLjjF5IyI9kY3cAEKDyCygS
         4l8c/jucPXK4NTNveTWJfmJ5UudNfL8tX5b9PVN15l3sHPHOTYmeFYcFAQMaKiIiGvXL
         wxr43RR0k6m4chh6T77Z43rj7m6w+mg53FDUrvWNoIK0Lz72dCRciruOhRF8OP9JLAnw
         +uXtg4mIyJbDclg9m4k2xFru7DtQeOp2x8u2RmKUxx1dR6wEO/A8QSCmEAm+8XNyyY9e
         i+WhEdOy209dDFE4vLpWVGDqN92Pbe57hV4P6IKSMz9UgdJlwd01pDQbtqxGMnFx67OW
         96gQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Gto6oKdi;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id x14sor8435009otk.84.2019.01.29.07.26.41
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 29 Jan 2019 07:26:41 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Gto6oKdi;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PavnICnR9C4g2DTDZb6h4Hj9lAVBDBrrn5PFfMfMrWA=;
        b=Gto6oKdiz3joJIeYMwWS4WzmOwRMnlGzMPfKEPijjo+hkqZtnSRgfrXZHBBec/udRV
         hSXJzImVuyCo+O9tgIBSAuYzZVcBnqfVTvpI/ojxCSbbFpX5xMzqI0RZcyIbsV/qaKeD
         vIQtJZMDRYPgSXLpSM6hortiMmC7qKa3d8xjc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PavnICnR9C4g2DTDZb6h4Hj9lAVBDBrrn5PFfMfMrWA=;
        b=gaNSZbhW7Xq68cYndiACswDADT/i+LVociGWoQ3RsKXyfHzjOCWskuhmkZ0Ap/iS0l
         /mgE0xqr/++ok8SORl9UHdy2rTWkBay7PSWr5FneL9KDAFLi61bNfiNEoUOuJXMFDavA
         bFBL6UW5IA6yonamtwaISwd7Zch5bXcLgjecdDDE5JRk/XyJ4PKPRwEQu2agiyWG9cVh
         bdx3wHrYoJBFiC8PhdjcVZ5dEBWOuwQQN62fB+XmQupBvwGtPfhsiBZYE8qqwSzK4CHN
         OVvB8vZvL7bNCm9dNsxetsQyWoMDWztlXFfY+ndq6/6eEuYsfqTqAUfaV1uSKNRg+5+S
         tSEA==
X-Gm-Message-State: AJcUukejzai2SX0ygmnqcmvhrG7jKwye71kPaCbNVsiGbYbXb/UZxQ5L
	Er5QPmtkb729t4w2gBAIpzD34zD4/iRQ8a5iBvIf8lp0eAthmQ==
X-Google-Smtp-Source: ALg8bN7k8YYSJbuOhceZ8SeJvW9qo12no//fMDOgs+3uyA6LPyKsD202/Dok0y21y+ggNrAbANONQd6s4hXpyWgJPDY=
X-Received: by 2002:a9d:3a22:: with SMTP id j31mr20089584otc.238.1548775600876;
 Tue, 29 Jan 2019 07:26:40 -0800 (PST)
MIME-Version: 1.0
References: <1544173675-14217-1-git-send-email-hongbo.zhang@linaro.org>
 <1544173675-14217-3-git-send-email-hongbo.zhang@linaro.org>
 <CAFEAcA9mF+WiPLW4yyv1aEMLTg2QK2krZvxyjCSsMziJtzx3Ug@mail.gmail.com> <CAHmQWvCw5ndod93WqLXDgGxDERtRM3ee_qiLA+S34Y9X2JFvVQ@mail.gmail.com>
In-Reply-To: <CAHmQWvCw5ndod93WqLXDgGxDERtRM3ee_qiLA+S34Y9X2JFvVQ@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 29 Jan 2019 15:26:29 +0000
Message-ID: <CAFEAcA_+UhU56D7Yx5K8+=DbtUiiV8V7sX2UgxFKSkScUypxFg@mail.gmail.com>
Subject: Re: [PATCH v5 2/2] hw/arm: add Arm SBSA reference machine, devices part
To: Hongbo Zhang <hongbo.zhang@linaro.org>
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>, 
	Ard Biesheuvel <ard.biesheuvel@linaro.org>, Leif Lindholm <leif.lindholm@linaro.org>, 
	Radoslaw Biernacki <radoslaw.biernacki@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-TUID: q1fgisl9fCHD

On Mon, 28 Jan 2019 at 09:46, Hongbo Zhang <hongbo.zhang@linaro.org> wrote:
>
> On Tue, 22 Jan 2019 at 19:49, Peter Maydell <peter.maydell@linaro.org> wrote:
> >
> > On Fri, 7 Dec 2018 at 09:08, Hongbo Zhang <hongbo.zhang@linaro.org> wrote:
> > > +static void sbsa_ref_machine_done(Notifier *notifier, void *data)
> > > +{
> > > +    VirtMachineState *vms = container_of(notifier, VirtMachineState,
> > > +                                         machine_done);
> > > +    ARMCPU *cpu = ARM_CPU(first_cpu);
> > > +    struct arm_boot_info *info = &vms->bootinfo;
> > > +    AddressSpace *as = arm_boot_address_space(cpu, info);
> > > +
> > > +    if (arm_load_dtb(info->dtb_start, info, info->dtb_limit, as) < 0) {
> > > +        exit(1);
> > > +    }
> > > +}
> >
> > I still don't understand why we need this -- it doesn't seem
> > to be doing anything different from the default behaviour that
> > boot.c implements if skip_dtb_autoload is false.
> >
>
> According to the process of arm_load_kernel() in boot.c, If only
> kernel loaded via -kernel but without any firmware, it works fine.
> While in this case, we have have firmware loaded but no kernel (eg
> firmware loads kernel from storage, firmware never come back to qemu
> again), so the arm_load_kernel() returns in the middle before calling
> arm_load_dtb(),  because arm_load_dtb() is the final step in
> arm_load_kernel(), so there is no chance for the arm_load_dtb() to be
> called, then we get error message and qemu quits.

Oh, I see now. I think this is a bug in boot.c and we should
fix it by making the "this is a firmware boot" code path also
do the arm_load_dtb() call. I'll send a patch.

thanks
-- PMM
