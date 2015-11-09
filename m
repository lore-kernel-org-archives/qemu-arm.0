Received: by 10.182.105.169 with SMTP id gn9csp1098941obb;
        Mon, 9 Nov 2015 03:22:56 -0800 (PST)
X-Received: by 10.129.136.5 with SMTP id y5mr24964207ywf.35.1447068176058;
        Mon, 09 Nov 2015 03:22:56 -0800 (PST)
Return-Path: <peter.maydell@linaro.org>
Received: from mail-yk0-x22b.google.com (mail-yk0-x22b.google.com. [2607:f8b0:4002:c07::22b])
        by mx.google.com with ESMTPS id y206si4678439ywc.240.2015.11.09.03.22.55
        for <alex.bennee@linaro.org>
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 09 Nov 2015 03:22:56 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 2607:f8b0:4002:c07::22b as permitted sender) client-ip=2607:f8b0:4002:c07::22b;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 2607:f8b0:4002:c07::22b as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dkim=pass header.i=@linaro_org.20150623.gappssmtp.com
Received: by ykdv3 with SMTP id v3so168734076ykd.0
        for <alex.bennee@linaro.org>; Mon, 09 Nov 2015 03:22:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro_org.20150623.gappssmtp.com; s=20150623;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-type;
        bh=+g6os6fvxLi8AfjxaDCnD0JuS5TgOV5oGG1LnyV8Dbo=;
        b=H8AgN3M4o21VUMkCBcOhnYT94wZDLR2qhRaoGQH1U1p6m3kXCT3vuWGekGcsKgijaT
         IB/uOIFAh1YXueHV7vGq11wPaS59o1GChRsJCq2edr3Dxdmbw6CTgZocaBApNC6z1chY
         zpMmXrAalHq07KiIgDXBryXH+SkLqrqwkUZFQD/ps/ty86ntVFXDrxCsbzcFUArg4RYU
         RmMqkq1xuGBCliqlxhrDilQkaTTRRyHZU3nocR4UELosu36i1GXbYlrXBKXsmMKoNlf4
         x2PkYlq1tVxlBOsTleDGtPZAMGyR64R2Kn/6GGHC+MG/mFfctMkIutFt3zk2TODELr8I
         H3wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc:content-type;
        bh=+g6os6fvxLi8AfjxaDCnD0JuS5TgOV5oGG1LnyV8Dbo=;
        b=hNIWvpcDdNoorKDUFx7EujYvi+TkJYzTGBUXiAtsU09XtbrN9aAmYe+hNhjoWb3sdJ
         eiemH5io25UwcobE4nrDtILboWlb+6ywI/sSYoMZ2Aml2PidoGGpsIA9d6pl9mMOc8+n
         1xJe+47jZPReCrn+6Ppscg8/7R0xKQCfJO1qSvreqcusJyhG/hrgbeWRnVQ6F5efMWwe
         xaSZ9cwD2P2KbCHG3c+8ttfdsMMUIt0K2y2bxhz5xHFWkd/sd75k7fEiz7KvoIzrFpzk
         pj0d0ILZbBPfXMh4Ce43w8fv9oAB2ceob4vplZVqyoafAHJMEa2D7js0ZvZ8CEkgmNod
         riBg==
X-Gm-Message-State: ALoCoQkyLbljvzw1VpNbopPW24Wcgw1dA7UDyJ5reyYVhboJZ4SnuHUwOuj8XuD2Uc0n7wXJWo8O
X-Received: by 10.129.75.131 with SMTP id y125mr25514373ywa.48.1447068175875;
 Mon, 09 Nov 2015 03:22:55 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.153.15 with HTTP; Mon, 9 Nov 2015 03:22:36 -0800 (PST)
In-Reply-To: <5640812F.4070008@redhat.com>
References: <1446747358-18214-1-git-send-email-peter.maydell@linaro.org>
 <1446747358-18214-10-git-send-email-peter.maydell@linaro.org>
 <56407AC8.9020100@redhat.com> <CAFEAcA9KrB0wZwQzYUmGBW2NPZWkxHFk-JUnW-XwOfbo4wbWUQ@mail.gmail.com>
 <56407D82.4090005@redhat.com> <CAFEAcA9YNOOXenTw=M84=ACXqV_VwRaUCS+P3DNswNkPkGg3Sw@mail.gmail.com>
 <5640812F.4070008@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 9 Nov 2015 11:22:36 +0000
Message-ID: <CAFEAcA8LA3nLzbDvqt5FyjXhtfrGQi6W44xcB9_=73xX+QU-+w@mail.gmail.com>
Subject: Re: [PATCH 09/16] target-arm: Support multiple address spaces in page
 table walks
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>, Patch Tracking <patches@linaro.org>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>, =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, 
	qemu-arm@nongnu.org
Content-Type: text/plain; charset=UTF-8
X-TUID: 5Z5/Y90eeces

On 9 November 2015 at 11:19, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
>
> On 09/11/2015 12:09, Peter Maydell wrote:
>>>> >> I could have handled that by making the CPU init code always
>>>> >> register two ASes (using the same one twice if the board code
>>>> >> only passes one or using system_address_space twice if the
>>>> >> board code doesn't pass one at all), but that seemed a bit wasteful.
>>> >
>>> > I think it's simpler though.  Complicating the init code is better than
>>> > handling the condition throughout all the helpers...
>> It was the overhead of having an extra AddressSpace that concerned
>> me (plus it shows up in things like 'info mtree' somewhat confusingly
>> if you didn't expect your board to really have 2 ASes).
>
> I don't think it shows up twice with address_space_init_shareable, does it?

Yes, looking at the code you're right.

-- PMM
