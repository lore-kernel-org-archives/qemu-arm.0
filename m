Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp405549ejc;
        Thu, 26 Jan 2023 04:43:35 -0800 (PST)
X-Received: by 2002:a17:902:c94e:b0:196:3650:63e3 with SMTP id i14-20020a170902c94e00b00196365063e3mr4334297pla.1.1674737014859;
        Thu, 26 Jan 2023 04:43:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674737014; cv=none;
        d=google.com; s=arc-20160816;
        b=ym4loO573IWTuI8ct+TuHHk1V3EyC4OEAfKTXgpGKM9VSp9763Z2DeEzb63e5PCGhM
         OjcW7FR3WNXZyK1qSI+Og3PEnmp3kq5fcZvYoI2a6x5bIoTTingmYd7ZAnV0pygsnLUi
         reWX59UWpglxAQ9o5FFRL8pcKojTktGan7X9xMzZJzWCN2+OYgSvidHoP6hzajHuineo
         JOxTGKhBWsq0zhdiNHGSpXe72UIQ/GvijVWABPeBq1d6crxTnY6RaPQGs4wNXWdTiLkr
         kUKrz1ocR0HSQ+p1cqODW6UI3sFMSuBIAozflgB72fkzVkl9CJ7/mzmDeeEfWeoMyhNn
         HRng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=D2hlvI8lyCcJMPlrPJST1vcEL6w9MkuLh14hpGUqyys=;
        b=rEFkZJwcqOFDmkC6bCH8tUIVtqwxyKnSPslSUx03O+YJ/LmlpoRliHc9GWQyLgvUu5
         STpTYzTnepBZMMp+RXK39oeNTQ4M6KgN/QEHeXw5OlpMBqFfYJ2xTRHc9fOPvCoDuGhw
         Ieg/iKeUcI3xPSuO3GESUNJAqjZu35PQzL0VHcasD2d6EbNGwBsqwQWQTClgSSBHt3Gx
         9eLYhscaXsB2pHhXuHCD5iclF8ZJm0Xo669Wi+ha+99vz7IKTMm30k7Hhx5DECxwPQDp
         Ki8QMlVrMspv+asI7KmCkDSz4ZbPzp+RjYjF2YYC/KCGWXxnPDlaubGArvqH9ncBwCT/
         Dqqg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ASWppiC5;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id i11-20020a170902c94b00b00194c43382fasor600531pla.142.2023.01.26.04.43.34
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 26 Jan 2023 04:43:34 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ASWppiC5;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D2hlvI8lyCcJMPlrPJST1vcEL6w9MkuLh14hpGUqyys=;
        b=ASWppiC5fQXEsg/mmROIFcS2qBpdkrjTX1VJKnfQ2/k03QZaFOxoKXXQhQRx8hSUrW
         TEHJ0C0DiKorAnM1FNlYuQEiEb2ApQtDfXMLxeVZqcv0UkqfgQeV4EKHVVaDgpn6a4my
         wgXiyD/lbqCXX6K+n8wOk45uIeC2WdUgKNEGmFVvayemjKMkszC2ilZCVORsJqX6T5ib
         mgTuZkYX68hij2JyHaTwb3LrdZwcDWjiobhq60hvRB7YI06Odb1TN+6Q6fsY6noLDwCI
         VRQtnIDejk3Q2C6NP2G0tZpi7tentRxJ2GhRxNb3jMhtDJ2jfUZAH9Eliq8FGYjO8BZA
         2SBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D2hlvI8lyCcJMPlrPJST1vcEL6w9MkuLh14hpGUqyys=;
        b=VERgYa/I+2RVZsiRFiKHLC/5TPo+mP4tCBkAq+eKwZHu5dB246YqIiXYHwrFzg+joC
         4JTsOgZLgYIk8slJ9rUiBR8ii4EWddH7L4AVzMlT9QC3th+JyS3HbijRxonrlw2Ov+OL
         PG90vgb8BnEekJa7W2hNCzFXENsPC9ZNHzBmFzuneZ4WCLE6tX18376bnV6mneavJQOl
         20P4xF4DV4n/ElKmtRWt2Q6+EFkxCrjKgwrrTCj2NGuTwZ8JAce5M5Yr65NsRV0umPRJ
         7Wz0P4WbSVnCgxPpde0iflYqs1M4hB/e7SlpKURZ38p2pw9yXpsmua3hmNfb9OpfrfNE
         8zKg==
X-Gm-Message-State: AFqh2krUbCNanNbTye3rzGVBn36d3xj7lv6qERf5yMzTzHz+TDaVvnfO
	RvhlX9m4x6TwMvyYVN1JBGhUZ3FNxgJWPs25hSlLY6rTt2eTiKmi
X-Google-Smtp-Source: AMrXdXs400WuawVLDuFJZyW+uz2qtMMPSdzkALNh4CWMBjNnVT1DTl2fekfvxxh7Z1TtcOdXSXeiungt30WkzYAY/gc=
X-Received: by 2002:a17:90a:d801:b0:22b:bc67:1dec with SMTP id
 a1-20020a17090ad80100b0022bbc671decmr3023795pjv.67.1674737014315; Thu, 26 Jan
 2023 04:43:34 -0800 (PST)
MIME-Version: 1.0
References: <20230110164406.94366-1-philmd@linaro.org> <20230110164406.94366-13-philmd@linaro.org>
 <CAFEAcA-yEN3F3p6W16vfML4dAHzdwSnOS=759MkqQ0qDpArnaw@mail.gmail.com> <87sffyreuv.fsf@linaro.org>
In-Reply-To: <87sffyreuv.fsf@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 26 Jan 2023 12:43:22 +0000
Message-ID: <CAFEAcA_KRTzJy6ywjBVPx34ccWNTdcnNsC=5JYVkTNDSRSRsRA@mail.gmail.com>
Subject: Re: [PATCH 12/18] hw/arm/digic: Replace object_initialize(ARMCPU) by object_new(ARMCPU)
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
	qemu-devel@nongnu.org, ale@rev.ng, Andrey Smirnov <andrew.smirnov@gmail.com>, 
	Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org, 
	Niek Linnenbank <nieklinnenbank@gmail.com>, Jean-Christophe Dubois <jcd@tribudubois.net>, 
	Antonio Caggiano <antonio.caggiano@collabora.com>, Rob Herring <robh@kernel.org>, 
	Antony Pavlov <antonynpavlov@gmail.com>, Jan Kiszka <jan.kiszka@web.de>, 
	Beniamino Galvani <b.galvani@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: Pbvm1/EWvyGt

On Wed, 25 Jan 2023 at 12:14, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
> Peter Maydell <peter.maydell@linaro.org> writes:
> > I'm not really a fan of this, because it moves away
> > from a standard coding pattern we've been using for
> > new QOM 'container' devices, where all the sub-components
> > of the device are structs embedded in the device's own
> > struct. This is as opposed to the old style which tended
> > to use "allocate memory for the sub-component and have
> > pointers to it". It means the CPU object is now being
> > treated differently from all the timers, UARTs, etc.
>
> I think you can certainly make the argument that CPU's have always been
> treated separately because we pass it around as an anonymous pointer all
> the time. We currently can't support two concrete CPU types in the same
> structure. For example zyncmp has:
>
>   struct XlnxZynqMPState {
>       /*< private >*/
>       DeviceState parent_obj;
>
>       /*< public >*/
>       CPUClusterState apu_cluster;
>       CPUClusterState rpu_cluster;
>       ARMCPU apu_cpu[XLNX_ZYNQMP_NUM_APU_CPUS];
>       ARMCPU rpu_cpu[XLNX_ZYNQMP_NUM_RPU_CPUS];
>
> which only works because A/R cpus are the same underlying type. However
> when we want to add Microblaze how would we do it?

You'd add fields
    MicroBlazeCPU other_cpu;

As you note, at the moment that doesn't work because cpu.h
is magic and embeds an assumption that it's only included
in compile-per-target objects and therefore any given source
file only includes one of them at once. I think we should be
aiming to remove those assumptions, not work around them.

thanks
-- PMM
