Received: by 10.25.87.130 with SMTP id l124csp198814lfb;
        Mon, 5 Sep 2016 09:31:20 -0700 (PDT)
X-Received: by 10.176.65.7 with SMTP id j7mr11113355uad.21.1473093080178;
        Mon, 05 Sep 2016 09:31:20 -0700 (PDT)
Return-Path: <peter.maydell@linaro.org>
Received: from mail-ua0-x233.google.com (mail-ua0-x233.google.com. [2607:f8b0:400c:c08::233])
        by mx.google.com with ESMTPS id p93si8768716uap.52.2016.09.05.09.31.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 05 Sep 2016 09:31:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 2607:f8b0:400c:c08::233 as permitted sender) client-ip=2607:f8b0:400c:c08::233;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 2607:f8b0:400c:c08::233 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE dis=NONE) header.from=linaro.org
Received: by mail-ua0-x233.google.com with SMTP id u68so10328658uau.1
        for <alex.bennee@linaro.org>; Mon, 05 Sep 2016 09:31:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=qsfw6lxYG9OD2Q51LgAwDn3SWS8hs3EtemlbnDiz/es=;
        b=jSKwk6QBcsskEdfhnym7QvG8NPHrGuBxbZjDGXV8AjrTjosn9jUEf4Prj28CMbtnwJ
         pK/7UYVagXqUYjJOcoNtLF0J+6E9gZN+PZhlnmEGMsWjkqPSTkaZj7QpdxBOI2i6JGGs
         F2NDLneufuVEH+xEwX5oVH6l2b327U0HhnG2o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=qsfw6lxYG9OD2Q51LgAwDn3SWS8hs3EtemlbnDiz/es=;
        b=muqw8Hk83aaZA4b3pCiMivl8XW1jjBES6hdZ8TWh4I6rU0OF+oRdfeNs781BlFS9OY
         5+HWYg0yvcdPgrBTr1TguHbn8v4t5d50BOTgNyhUFr7UmSs1aTGZJueleLDtqYrPXH9Q
         QLag3EbbhUDCl9du5dV+1+9jMHBykkdMocG2yU9by4AS5rrLPUbC0aZiNzDoxNBzYMU3
         TThcY3opbwxfL9AF3xU/slPDqRunWK+SXKO3QYcDNAO1dZTxwzVUgId8zpHDtuDMT66E
         PXcslxsrlks5JT7rdvVAMcMXco6mJxIjEpKms2W99nd7j9Mq1Lr+aAsjRF02EmAAMgZ0
         un2Q==
X-Gm-Message-State: AE9vXwOPXIzbKpCZFuLtf80uwfY0HvGkQsoaONkC3oC48TQKoDgZz8hh48uXOr3zpUu4lGCGQCRXVb9hgJXCjGr4sm0=
X-Received: by 10.176.82.196 with SMTP id w4mr18751740uaw.119.1473093079563;
 Mon, 05 Sep 2016 09:31:19 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.9.131 with HTTP; Mon, 5 Sep 2016 09:30:59 -0700 (PDT)
In-Reply-To: <87lgz6z6y7.fsf@linaro.org>
References: <20160905140944.5379-1-alex.bennee@linaro.org> <CAFEAcA-k0js=eZa4NkoAh5Gwz0cDAwDLWXG7NBzLAeYAT7QO5A@mail.gmail.com>
 <87lgz6z6y7.fsf@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 5 Sep 2016 17:30:59 +0100
Message-ID: <CAFEAcA8AJ5sdH=PPDCv2XdPnFtbOxdrOWz=1Jqms8uwYgPeyog@mail.gmail.com>
Subject: Re: [RFC PATCH] hw/intc/arm_gic: handle Set-Active/Clear-Active registers
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, "open list:ARM cores" <qemu-arm@nongnu.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TUID: 67RGFNhQG+zj

On 5 September 2016 at 16:45, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
> Peter Maydell <peter.maydell@linaro.org> writes:
>
>> On 5 September 2016 at 15:09, Alex Benn=C3=A9e <alex.bennee@linaro.org> =
wrote:
>>>      } else if (offset < 0x400) {
>>> -        /* Interrupt Active.  */
>>> -        goto bad_reg;
>>> +        /* Interrupt Clear-Active  */
>>> +        irq =3D (offset - 0x380) * 8 + GIC_BASE_IRQ;
>>> +        if (irq >=3D s->num_irq)
>>> +            goto bad_reg;
>>
>> This is missing the check against s->revision.
>
> This was deliberate as the GICv1 reference was only mentioned in the
> GICD_ISACTIVERn description. Unfortunately the only documentation for
> GICs on silver.arm.com are for v2 and v3 so I had to guess what v1 had :-=
/

The GICv2 spec does actually say these registers don't exist
in v1: in the Table 4-1 Distributor register map, the entry
for GICD_ICACTIVERn is marked as having footnote 'e' applying,
which says "GICv2 only".

In the GICv1 spec range 0x380-0x3FC is marked Reserved (ie there
is no clear-active register set at all.) Ditto in the 11MPCore TRM
and the v7M ARM ARM. (The GICv1 register summary also appears in
the A9 MPCore TRM, though that's a bit of an obscure place to
know to look for it.)

As a rule of thumb, if unsure whether something exists in all
configurations, default to leaving it locked down/unimplemented.
We can always widen it later if guest software turns out to use
it, but it's much harder to later know we can remove something
safely once we've let a QEMU into the wild that implemented it.

thanks
-- PMM
