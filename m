Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp480892wru;
        Wed, 25 Jul 2018 02:20:04 -0700 (PDT)
X-Received: by 2002:a02:fd6:: with SMTP id 83-v6mr19152165jao.35.1532510404634;
        Wed, 25 Jul 2018 02:20:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1532510404; cv=none;
        d=google.com; s=arc-20160816;
        b=RpsaKCqJPQHVGgPEHwdRBZtClDu3hpbguUW08U+tYWrISt1HMkA1D0PgJBX6zEe0+j
         0qM40A+hO708MCRVoBk7SWt1ZM5QhKF8+VyDAylm5Y7I0JvrA9XoJAOJYt6NKfmT1UTY
         /eh4f3o0MTuvcrgOO5nIRen6bzgLFzV7Qrz3nYDEhPuvD3fkm3YMjnkHYjQydRHYAyJi
         6WJ/dSAbguB0UbjFduCjXOA/vKi1j9DWPTRhEF5ewpld0soQHr3uYkSM+IXnSUunZ4Y2
         EQlWOEcXJ7YicyaW/YmhxdnLZNmpMl5sxeGzstjuR8andhI/H2VhTtkk8u0kvkvBVdp4
         kV2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=Qdb169l4PA59GOSJ/qB+dggRxKmvKxp3lAKbOGUmo8Q=;
        b=Nkd4hXY+Vj7mPYDJegdeugRJNqinYmIttc7JKHH6ROqDnLL8Ch5I8HAI8andvSJbsS
         vmXV12k/1fLn2dvstvpNHdJq7j+IIeL+QNER4n1IqJFFvqkFe6FBhp601Uw8xT88vidj
         7HgTIawpOt6KYxSXsAmoetzssq6Jjx+FciU7x0smtpJl3S4+tAKsRFe1+cXYPEgtUrw4
         dlDJR+FfTXTG9b6YH9BzvajxH8tKk4RDtW+SehulFesAmgHswS+VI8GXaROEOogcbAD0
         UHmK5ZieC+xLesxgm6kAXP8O/oBRQDU8SGUXGY4VkyGP94kR9XKOD8+2wK6ZjsiYu2Oo
         uGsg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=X0EELW33;
       spf=pass (google.com: domain of ard.biesheuvel@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=ard.biesheuvel@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <ard.biesheuvel@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id d5-v6sor4452819iok.167.2018.07.25.02.20.04
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 25 Jul 2018 02:20:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of ard.biesheuvel@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=X0EELW33;
       spf=pass (google.com: domain of ard.biesheuvel@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=ard.biesheuvel@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Qdb169l4PA59GOSJ/qB+dggRxKmvKxp3lAKbOGUmo8Q=;
        b=X0EELW33j3/JP8BwjiRrKNNQPgiGsXNoCBjQWBIxZSsVjslEuPz79nzJRtB9l+hxn4
         LBcRxU6bwsTAzQCAaZqGjQTS8772tEa9w+4CayD6h8OebaqjLAUobaRwcDHJAJlbgr+y
         1Ty2ruXm4t6CDJmJlzOs1oCdmisPSH90UsrOw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Qdb169l4PA59GOSJ/qB+dggRxKmvKxp3lAKbOGUmo8Q=;
        b=BVbX40/lcCFDLlbhKZFxwpoFODV8jEG+8moR30esKyRKg6EZq10yzmkm+vMML9nKxx
         VGAYMtkjrBM1HcEvCcdaL+UkU1q7czE1wHs2gJapvkr3JbTWsEpHVdmuPdc7UDQRW2IG
         eB+gtpkowr5BEPh0gt/yLSV9ra4jyApQxy/T6zvgR78WDJUwbL/Gpx4ErFN6IZfX2XWS
         A1caugqirfmY0NCdfU2/NdjxwtI2cZme/84EmWUq4EvF65IJvEWrEhQT6/kI8IADrd0r
         wKaWJXBZc+Jj5vzojeakImS1SZ1sCJ3J8+3fPaW2LFGjXzhgSxY156ljmBplkJbg6uI3
         SnuA==
X-Gm-Message-State: AOUpUlHydMoYqJKRzjWZkgmdYS0/4FhWZiqqs6Orv5EXjFkLC1WE7mwH
	lhiZJCpr3T7NXrBQo2Mztg4gdzms4qEjP0NN7k9ZefC9
X-Google-Smtp-Source: AAOMgpfsvmcnr9RqSaadTNi2rw9Ha7xfLK25jEdATWb4FT90DlBvnxoh/BB+OSismKgSHbJ1tRy3MindBxWD3z4DDL4=
X-Received: by 2002:a6b:5208:: with SMTP id g8-v6mr16917054iob.60.1532510404260;
 Wed, 25 Jul 2018 02:20:04 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a6b:ac05:0:0:0:0:0 with HTTP; Wed, 25 Jul 2018 02:20:03
 -0700 (PDT)
In-Reply-To: <CAHmQWvC8_J4i32UZzdHqJ4w3EdEAHmWGdgqrvGwEA7uo0kvk9A@mail.gmail.com>
References: <1532496652-26364-1-git-send-email-hongbo.zhang@linaro.org>
 <1532496652-26364-2-git-send-email-hongbo.zhang@linaro.org>
 <20180725084824.GA12855@redhat.com> <CAKv+Gu_RHsed0KAH8njKB8UPvbUDeoTZ5sP76f_br6azisZzSQ@mail.gmail.com>
 <CAHmQWvCqKqQXnXxOUgi=kLTyE5BhV2NxqaKzvPp63HX02V=X2g@mail.gmail.com>
 <CAKv+Gu_eFjS_UvOuEKhbsWr34o3Jqd4h2duJ-gG1ofsFbwkGbQ@mail.gmail.com> <CAHmQWvC8_J4i32UZzdHqJ4w3EdEAHmWGdgqrvGwEA7uo0kvk9A@mail.gmail.com>
From: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Date: Wed, 25 Jul 2018 11:20:03 +0200
Message-ID: <CAKv+Gu-B4o7dwZPOix2MkECJia6M6Q+zBMw8XVdw49kFYW6J+w@mail.gmail.com>
Subject: Re: [Qemu-devel] [PATCH v2 2/2] hw/arm: Add Arm Enterprise machine type
To: Hongbo Zhang <hongbo.zhang@linaro.org>
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
	Peter Maydell <peter.maydell@linaro.org>, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>, 
	Radoslaw Biernacki <radoslaw.biernacki@linaro.org>, Leif Lindholm <leif.lindholm@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: oxDV/m1MQlaG

On 25 July 2018 at 11:17, Hongbo Zhang <hongbo.zhang@linaro.org> wrote:
> On 25 July 2018 at 17:13, Ard Biesheuvel <ard.biesheuvel@linaro.org> wrot=
e:
>> On 25 July 2018 at 11:09, Hongbo Zhang <hongbo.zhang@linaro.org> wrote:
>>> On 25 July 2018 at 17:01, Ard Biesheuvel <ard.biesheuvel@linaro.org> wr=
ote:
>>>> On 25 July 2018 at 10:48, Daniel P. Berrang=C3=A9 <berrange@redhat.com=
> wrote:
>>>>> On Wed, Jul 25, 2018 at 01:30:52PM +0800, Hongbo Zhang wrote:
>>>>>> For the Aarch64, there is one machine 'virt', it is primarily meant =
to
>>>>>> run on KVM and execute virtualization workloads, but we need an
>>>>>> environment as faithful as possible to physical hardware, for suppor=
ting
>>>>>> firmware and OS development for pysical Aarch64 machines.
>>>>>>
>>>>>> This patch introduces new machine type 'Enterprise' with main featur=
es:
>>>>>
>>>>> The 'enterprise' name is really awful - this is essentially a marketi=
ng
>>>>> term completely devoid of any useful meaning.
>>>>>
>>>>> You had previously called this "sbsa" which IIUC was related to a rea=
l
>>>>> world hardware specification that it was based on. IOW, I think this =
old
>>>>> name was preferrable to calling it "enterprise".
>>>>>
>>>>
>>>> I couldn't agree more. However, IIUC this change was made at the
>>>> request of one of the reviewers, although I wasn't part of the
>>>> discussion at that point, so I'm not sure who it was.
>>>>
>>>> Hongbo, could you please share a link to that discussion?
>>>>
>>>> Thanks,
>>>> Ard.
>>>>
>>>
>>> V1 discussion here:
>>> https://www.mail-archive.com/qemu-devel@nongnu.org/msg545775.html
>>>
>>
>> So who asked for the sbsa -> enterprise change?
>
> Actually nobody, but it was argued that sbsa does not require ehci and
> ahci etc, then we should find a name fitting for this platform better.

That doesn't make sense to me. The SBSA describes a minimal
configuration, it does not limit what peripherals may be attached to
the core system.
