Received: by 2002:ac2:5cd0:0:0:0:0:0 with SMTP id f16csp2745814lfq;
        Tue, 1 Mar 2022 08:30:42 -0800 (PST)
X-Received: by 2002:a25:a223:0:b0:621:1238:68b1 with SMTP id b32-20020a25a223000000b00621123868b1mr24997573ybi.370.1646152241842;
        Tue, 01 Mar 2022 08:30:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1646152241; cv=none;
        d=google.com; s=arc-20160816;
        b=vOMwXzhaeBO760B4B4vR9Yxy+wRHAUwFlK6x/XNMVyWIO6xLek0BGkCIikmHQC1p7T
         gQJQQRH+GE79Hi0gThQEEg1fdunyuF5gpNzaJ98v6EY9egpKw98gnVZBEsKLfp0VDuAr
         bw7mtr/qQbMbgpIViylYywCYaMvdqewKsbVeYNDscvPKJrveIdu/RT4VAutS096afLvm
         duRlbC+WNsUv3M1nO5d4wNYGDCb8i0KPD6UYraAZwf13I5FIMppE3a4mvrnRuuHBk+9p
         1FMsU6dXTO6uYeq3M/c5IOMj4RrIRGpBMEf6Fjic0ZAJmkXfFzGBCCqLye4FgAjVxyaK
         j5+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bKVk10tObS6Zdp/IbgEapmTajXCeX0hwnk+7DEiX7gk=;
        b=n6xIB9nSJUPbhHLgraqKDIa8nOCz2IoYcCu87ULRu/PGfOSXg+34hMnlJPbJoSX37A
         Vm0FJuil8pqFjN5kn4xdoK43YEwvz6RMZf8wbq2aqdq7Eugcp41x/QeEO3bxhiqLEekl
         3N14+wOF0m+To61wQsZBPsYffG6H/L8WrPSTdvltyXtT/SdfK2TMcva7rafYc8IXuzAE
         xSqxu/SXWcrKTh5dnCSraTMi0wpAtTj5aMmvXXlzaPX7mFyIRJjQtQuOPg6T3QXpvhpT
         wWl32gKhLiACVlqIoq0EZuRW00QN+RxarB/WAe6aoib9474mdX6sLjUfFAx2SP6BDY2Y
         7QiQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=b3KJsZCB;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id y62-20020a257d41000000b006247a89ae5dsor6890286ybc.53.2022.03.01.08.30.41
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 01 Mar 2022 08:30:41 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=b3KJsZCB;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=bKVk10tObS6Zdp/IbgEapmTajXCeX0hwnk+7DEiX7gk=;
        b=b3KJsZCBZbZnrqH3KJ2XoWS1MTM/RX8dGQzNjc67HVxH9ML0fun2YyMlHAnoL0LAza
         MhnXPKQ4l+OW9tzyBBA36rzM1NWuoEqLVayehzW0cLa44culfa4DJ+erMdNwqpnPNUSi
         apaxiPu9QN4c7f3s9K4OQgY7/OPjHgTJOPsrlpDu9b0/vR4PgijUfnZ/FD1DUnNDnrg7
         qoeQfihrv0+RrNTQB/xtoeJKv9VU4K4KaxQdcnv37224Ky7X9FCvdWT1auhSJrIiSRq3
         kC/iCoiY8eQC7Fl+TciddYJEGO8BBTb2j8rSCUc5TIviJsIyOsDAdUVogwb/IAFc8ScY
         LxLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=bKVk10tObS6Zdp/IbgEapmTajXCeX0hwnk+7DEiX7gk=;
        b=GykOnzZPGB01+x8OJUA1FXo029IRkgpOieV09locGbYPJxSvAmRMSSwpGJrBzwUYdq
         2Tgt3IznkBd5Sq2i4cXsObksmnpnRzjiIgBHZGjixt6aXRNEDY8g4SbDnoEbIvyWAp6a
         q5RpEZEG84NiViLAQNaP5fb/HANGmVPXmeN3aWh5G+2xNbSqocmtouyT+jzV7+xi7LxS
         LdpktVeVkpiziJYKDSeuo8MEbL1WyRhAAo8LQ3dZf8djerIncG6+/AdoEiPI/tTeq7IG
         JZQgaSsWRM9GIi9UosrXL7WlbV4ZbJmfMjFICuEoQLmmQIPHApjVP/3m57GoO4ofjg2B
         BsHQ==
X-Gm-Message-State: AOAM531Oa9BPs19xWZL4QayPBXp1tUAQdvagZ819ms9g8xeDKyodgLWQ
	wB9eL3bmmXL8IPiLGIvkBgkjoTpU3lqasKVDlg+flSOQ
X-Google-Smtp-Source: ABdhPJxBZU//e2cY51NLwGh9hDDqJQNvpYmkNU8IoxFgRGwwjRegsPZSI/LwN1+7TcvEOcrY/lPjiZZGo8w5zwNmM+4=
X-Received: by 2002:a05:6902:83:b0:61a:709b:d841 with SMTP id
 h3-20020a056902008300b0061a709bd841mr23693445ybs.140.1646152241450; Tue, 01
 Mar 2022 08:30:41 -0800 (PST)
MIME-Version: 1.0
References: <20220223223137.114264-1-richard.henderson@linaro.org>
 <CAFEAcA84cFnF9EygS6Xun3VorjeGKf+Lw7zRdkBbcRp6YT_OeQ@mail.gmail.com>
 <CAFEAcA_+70hkNaRhbT=ZT457x+cgD-qSad5QoJY8VAEds5UKeA@mail.gmail.com> <Yh5Jqg8oDDfPZ2c9@redhat.com>
In-Reply-To: <Yh5Jqg8oDDfPZ2c9@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 1 Mar 2022 16:30:30 +0000
Message-ID: <CAFEAcA-6C9XmP_HGwL8CarBrcuvg6n1wbR5Ys0jZBC-RrA0-AA@mail.gmail.com>
Subject: Re: [PATCH v3 00/17] target/arm: Implement LVA, LPA, LPA2 features
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org, 
	alex.bennee@linaro.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: LqcW+a/YgiTY

On Tue, 1 Mar 2022 at 16:28, Daniel P. Berrang=C3=A9 <berrange@redhat.com> =
wrote:
>
> On Tue, Mar 01, 2022 at 04:16:25PM +0000, Peter Maydell wrote:
> > On Tue, 1 Mar 2022 at 16:08, Peter Maydell <peter.maydell@linaro.org> w=
rote:
> > >
> > > On Wed, 23 Feb 2022 at 22:31, Richard Henderson
> > > <richard.henderson@linaro.org> wrote:
> > > >
> > > > Changes for v3:
> > > >   * Update emulation.rst.
> > > >   * Split out separate update to ID_AA64MMFR0.
> > > >   * Hack for avocado.
> > > >
> > > > If the avocado hack isn't acceptable, perhaps just drop the
> > > > last two patches for now?
> > >
> > > I think that given that there are Linux kernels out there
> > > that won't boot if LPA2 is enabled, we should probably have
> > > a -cpu command line option to disable it. Otherwise we might
> > > get a bunch of "why did my kernel stop booting" bug reports.
> >
> > ...and should using a versioned machine type also default
> > -cpu max to not enabling that? Not sure what x86 or other
> > precedent is there.
>
> I don't recall us coming across an important scenario where a guest
> would fail to boot when we /enable/ a given CPU feature on x86,
> requiring us to hide it from -cpu max/host.
>
> Assuming the QEMU/KVM implementation of a CPU feature is correct
> per the relevant spec, then artificially hiding it by default from
> -cpu max feels questionable, as that penalizes non-buggy guest OS.

Yeah. It's just unfortunate that "buggy guest OS" here is
"every Linux up to 5.11".

-- PMM
