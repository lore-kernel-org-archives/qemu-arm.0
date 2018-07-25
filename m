Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp537332wru;
        Wed, 25 Jul 2018 03:33:02 -0700 (PDT)
X-Received: by 2002:a24:d98c:: with SMTP id p134-v6mr5872953itg.26.1532514782862;
        Wed, 25 Jul 2018 03:33:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1532514782; cv=none;
        d=google.com; s=arc-20160816;
        b=pmCjRPsNg1bnZph07MEMel5GKlY/4WKnAiSb6FtSbAIZZdbhWjjaXOluXl8XAXJmjP
         dhIip8TJCT8OaaE1mkeAYT6NFKnN/ihbuyvFBrDuJuH2IdRBq/AJyGRCBgVDPG/EdHIQ
         LIG2FddorGma0d9M236LxPcE7tYmejfcmJDdWrIwneXm2upqVS0AulgYtP7yAitGF5BX
         xWZjqesayh8vH4gVD8gDFfeP7ZVWxi0stbbs6SoyJhsbdklfagnl926Q0G/iWCk35eA9
         0ldXgDYXHRSz+BKC9toNM4o2sb2eqfylw5Yitdj40Gx6VOj1LqDvHF3YOAMBWLPCwTSe
         KTFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=IEn4cHPsuYZvhFqy2L/Qng+VE5/pX4LfFT1Kp4cdFoU=;
        b=B94iAXBJi2S11pzUz97/HtIJ6BNl8003JN+oYOyuLKIhFu2EQH7kMI2QUhp2vzpsZ7
         ED1mMoAXFpKewspuEcDQzt9SzUFJHXEgNqVz/rZ4LZEgmBJ3QuRRfxwZl0gV5JjEsSes
         orZDXUXrqXfxpbcHyKvYU2rPuDu49l6H8r1UDvnZoEb28a6QBo2t+N0qnh7CHAEmyLRG
         v6fcSDz9qpBKGihR4qIszDZRLWbPerJAJ0usL8ixSbaBZ1904bXklJplpTbGbmt0Nj+Q
         D4I4rJuv4RVKr6ncIlI9dK9zrfXUlkFF6cVxjc3CoLSXiGmg2DlL8byCwmlH4zKA/WV0
         Iwvw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cJc5QLcS;
       spf=pass (google.com: domain of hongbo.zhang@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=hongbo.zhang@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <hongbo.zhang@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id a190-v6sor1550066ita.107.2018.07.25.03.33.02
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 25 Jul 2018 03:33:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of hongbo.zhang@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cJc5QLcS;
       spf=pass (google.com: domain of hongbo.zhang@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=hongbo.zhang@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=IEn4cHPsuYZvhFqy2L/Qng+VE5/pX4LfFT1Kp4cdFoU=;
        b=cJc5QLcSXwwg2YT4JQdYwI8OswVb16wNnjzMoH7fk2vilWVCuVI8RuA7sHLqMQoHn4
         lGBkBvlJwbtjfOIOs0+4Qmk9FT7cenIBw0jq7+R2ZYrO0qnZ3zBS4bSDOe1MMEz30u8z
         oHwXOmGbF5MKtW/3Bua7kDhOY0FhheiA/dgYY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=IEn4cHPsuYZvhFqy2L/Qng+VE5/pX4LfFT1Kp4cdFoU=;
        b=BUhmGn3FPribBGCo99mpk3qCKEsKMlgSReFSF0ifSsy26O7YN26PQDIVoUBjs0eQZ5
         NrOyVQSOeo6TeXtAmLZe35b+HABCUmuuCsw+BObvpJ3Oq/QgIj3YMzo5rr2/3IMIF1my
         QbE9CMySwK8OXy2G8e/yXsxQi+v8X9H4Y1+6uva7xXQdf2nF/xnulP/RrATijtLfpLra
         3Td/HQWc41OJpGMnmO+pr7OVD3dKD+SyG7BdKaHcNibGJ5J5BklZQxkJofpDeZFYdBLQ
         +xaVIGHtnrbhh08bxVo+lnD2Ams/ZEbVeAqm6T2TFUTQszbxMgii1rqeN6/3DGfnoj8n
         parQ==
X-Gm-Message-State: AOUpUlGpJkSh86egA42xlmfn26AJYkwRtuEoNzm5dMVjR0KS9uU5/SbE
	CP6jmMykoL3CGEIzyca1Z2RmUWhaZGTjly+9LRjrv2cd
X-Google-Smtp-Source: AAOMgpela53RmNZzkyRbsxPERxFaANZ7pB320dVhgm2p0QesbdWd+g2m55iiTjEZ0pi5M4pu+zZ1VZTJ6GpRYxJSEzQ=
X-Received: by 2002:a24:cc07:: with SMTP id x7-v6mr5617366itf.3.1532514782528;
 Wed, 25 Jul 2018 03:33:02 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac0:a161:0:0:0:0:0 with HTTP; Wed, 25 Jul 2018 03:33:01
 -0700 (PDT)
In-Reply-To: <20180725094037.uzz4ycen4qja4q4a@kamzik.brq.redhat.com>
References: <1532496652-26364-1-git-send-email-hongbo.zhang@linaro.org>
 <1532496652-26364-2-git-send-email-hongbo.zhang@linaro.org>
 <20180725084824.GA12855@redhat.com> <CAKv+Gu_RHsed0KAH8njKB8UPvbUDeoTZ5sP76f_br6azisZzSQ@mail.gmail.com>
 <CAHmQWvCqKqQXnXxOUgi=kLTyE5BhV2NxqaKzvPp63HX02V=X2g@mail.gmail.com>
 <CAKv+Gu_eFjS_UvOuEKhbsWr34o3Jqd4h2duJ-gG1ofsFbwkGbQ@mail.gmail.com>
 <CAHmQWvC8_J4i32UZzdHqJ4w3EdEAHmWGdgqrvGwEA7uo0kvk9A@mail.gmail.com>
 <CAKv+Gu-B4o7dwZPOix2MkECJia6M6Q+zBMw8XVdw49kFYW6J+w@mail.gmail.com> <20180725094037.uzz4ycen4qja4q4a@kamzik.brq.redhat.com>
From: Hongbo Zhang <hongbo.zhang@linaro.org>
Date: Wed, 25 Jul 2018 18:33:01 +0800
Message-ID: <CAHmQWvBZLpmjozVU=y4Fz_vr_+tMW_nmtidKDzApHSccRSgZxw@mail.gmail.com>
Subject: Re: [Qemu-devel] [PATCH v2 2/2] hw/arm: Add Arm Enterprise machine type
To: Andrew Jones <drjones@redhat.com>
Cc: Ard Biesheuvel <ard.biesheuvel@linaro.org>, Peter Maydell <peter.maydell@linaro.org>, 
	Radoslaw Biernacki <radoslaw.biernacki@linaro.org>, QEMU Developers <qemu-devel@nongnu.org>, 
	Leif Lindholm <leif.lindholm@linaro.org>, qemu-arm <qemu-arm@nongnu.org>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: aI0xuKUFhWK5

On 25 July 2018 at 17:40, Andrew Jones <drjones@redhat.com> wrote:
> On Wed, Jul 25, 2018 at 11:20:03AM +0200, Ard Biesheuvel wrote:
>> On 25 July 2018 at 11:17, Hongbo Zhang <hongbo.zhang@linaro.org> wrote:
>> > On 25 July 2018 at 17:13, Ard Biesheuvel <ard.biesheuvel@linaro.org> w=
rote:
>> >> On 25 July 2018 at 11:09, Hongbo Zhang <hongbo.zhang@linaro.org> wrot=
e:
>> >>> On 25 July 2018 at 17:01, Ard Biesheuvel <ard.biesheuvel@linaro.org>=
 wrote:
>> >>>> On 25 July 2018 at 10:48, Daniel P. Berrang=C3=A9 <berrange@redhat.=
com> wrote:
>> >>>>> On Wed, Jul 25, 2018 at 01:30:52PM +0800, Hongbo Zhang wrote:
>> >>>>>> For the Aarch64, there is one machine 'virt', it is primarily mea=
nt to
>> >>>>>> run on KVM and execute virtualization workloads, but we need an
>> >>>>>> environment as faithful as possible to physical hardware, for sup=
porting
>> >>>>>> firmware and OS development for pysical Aarch64 machines.
>> >>>>>>
>> >>>>>> This patch introduces new machine type 'Enterprise' with main fea=
tures:
>> >>>>>
>> >>>>> The 'enterprise' name is really awful - this is essentially a mark=
eting
>> >>>>> term completely devoid of any useful meaning.
>> >>>>>
>> >>>>> You had previously called this "sbsa" which IIUC was related to a =
real
>> >>>>> world hardware specification that it was based on. IOW, I think th=
is old
>> >>>>> name was preferrable to calling it "enterprise".
>> >>>>>
>> >>>>
>> >>>> I couldn't agree more. However, IIUC this change was made at the
>> >>>> request of one of the reviewers, although I wasn't part of the
>> >>>> discussion at that point, so I'm not sure who it was.
>> >>>>
>> >>>> Hongbo, could you please share a link to that discussion?
>> >>>>
>> >>>> Thanks,
>> >>>> Ard.
>> >>>>
>> >>>
>> >>> V1 discussion here:
>> >>> https://www.mail-archive.com/qemu-devel@nongnu.org/msg545775.html
>> >>>
>> >>
>> >> So who asked for the sbsa -> enterprise change?
>> >
>> > Actually nobody, but it was argued that sbsa does not require ehci and
>> > ahci etc, then we should find a name fitting for this platform better.
>>
>> That doesn't make sense to me. The SBSA describes a minimal
>> configuration, it does not limit what peripherals may be attached to
>> the core system.
>>
>
> Hi Ard,
>
> I think that a machine model named 'sbsa' should provide all SBSA require=
d
> hardware, and nothing else, while providing a means to easily extend the
> machine beyond that in any way the user likes. The user can easily add
> devices with the command line and/or by using -readconfig to build a
> "typical" machine. Note, it should even be possible to add, e.g. an ACHI
> controller, to the memory map using the platform bus, if that's preferred
> over PCIe.
>
Even command line or readconfig can add AHCI on platform bus, I think
it can only create such devices, but no DT or ACPI nodes, which are
mandatory.

> Thanks,
> drew
