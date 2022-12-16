Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp1725245ejb;
        Fri, 16 Dec 2022 13:39:32 -0800 (PST)
X-Received: by 2002:a17:90b:2681:b0:219:f1a2:b665 with SMTP id pl1-20020a17090b268100b00219f1a2b665mr35698099pjb.5.1671226772547;
        Fri, 16 Dec 2022 13:39:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1671226772; cv=none;
        d=google.com; s=arc-20160816;
        b=MF1ZGVjdK0kWyEOSf0914U9V1+gcg8aTCInzaG18/HCk7AzKI7B3TUlIH0fajmZsKD
         Ewnq2/rs5oHn4+ddMmlN3ikrVYoir4pWdva4hy1vIUUk+RUoOWRyHHzWFeCJ73YZwV3q
         jJSihpsziZF7ha65nmQl7Qz2VYRfSV4WrjTnlunwHzYXCzyVsgrXHTKOmjRwiQ55Zpw+
         68+YM1rX25iI7t5oZcboN+G53Hr7HMfk9PZsxRlX+oJ5I9tPHmOW5AmlXPHkBH9m1JBq
         XHQRIr5nw8SCrXin3x2WaSV4iu3ll5acqRy0OPzlKDRqm58CgXYbZVHKpxqqyCfgkJG4
         k6lA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=M34ulhpWVhreOtEad3y2TK+SkftUd/2KIT68iSexyiU=;
        b=t+Vdo78BsrYkVqP0cRpnQDlMM8dCq5yOksdS+t/EyJ6W2QEbhBtKUtoWNiCboXcwZ7
         vzUBROoWUHYU+xr9S9AvWWGB3XKmRO/CPmNGo4nFjdfKwF0tEox7+T3tR3Z9o9HBVbje
         dHdcrRIkxi28K00e4iC31Pk88YAASZv4TqTt8dnOSXAcWb0RiSfxjn1rIuTkiyEBL7FJ
         CaNuZJ7L+7ibYqv9BAjPGza90FT041RReTDxPd3NA867DqULJDdrVMdkCLLcFoP4EAba
         mspsg+lFouiFa1tIbD181/SVINkthHTXGq2C4+g905iZ8kZ1GB8MDPCouKVhY8tV/Oaz
         099Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Pn0+n1uX;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 10-20020a17090a1a0a00b00219767f1816sor1503051pjk.12.2022.12.16.13.39.32
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 16 Dec 2022 13:39:32 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Pn0+n1uX;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M34ulhpWVhreOtEad3y2TK+SkftUd/2KIT68iSexyiU=;
        b=Pn0+n1uXfjCz5NS6D1Lb/13zr2B3LdcwpAAApikElI2af17avnbXKz5x3gTVCUPWYC
         Z85um+sam7ozaAoCQBe8hsXbgx5L2l76Bd4IeuIejQmAPZb818jud2/A7XdG7XxByRdh
         tyd+Qf/krAw2NiO5aTSDSJx3cWMmRZRG+a5HgoThuE/l5+n1kwTCW0CKBCzc7HweZkZF
         kadoxsH5Psa5dWULyu0Se7aCH6e0hJcYet0WEcXwwWl8IMP0YJ9Etvf2Vpx94NmTGHnS
         Z5CPpQYS5KeSytFFoakFag5X4e4eUS2HuCcLRVT3PJARavkuxFCT9ciyQgxi9fYM+Ck9
         cfUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M34ulhpWVhreOtEad3y2TK+SkftUd/2KIT68iSexyiU=;
        b=paVRiTXkcAw3oLmdNEwPUIPNQeWsbr3k1hZ2mH15Wnp2nYqQ9OV4iL5Ps5MiSseRYP
         iiyI/H3oZKzBeeFNbZoMq44A4IEob2dpbBLQxPXj/hq+5wcC5ChSu9VtbRtXAsrgTv8a
         b1Kpw3EAWitppvk/1m+fdvA9S+akxO1oVIijElAYAzIs6uVN/NnsWe+a+ynNaQfHuAR2
         kcjK2uJ/HdO5XU339w+yS87RYyL+Dd66xA1wiI2pw3us62hrcI2FW2gY3LUJxWzROge6
         C01SeYnVkGSMvJgtmUWdWVkkmxobbbUnlhWO554ldB81mRgMRSsQ6cDPgIc1FHdzrtd2
         FkYg==
X-Gm-Message-State: AFqh2kqS0kMhLZj43WrqdubAQSCvVmCNmsDnhKqHuHT1hka2kuYV3XG1
	IWpxVMdW1CdWbpkspM4aO2nR3+eZurwuvjrofsxhcEwuK7+IVwNJ
X-Google-Smtp-Source: AMrXdXs16EIwuDAEJFTHeQ2mGaO1GBnsvtbM5ouPgkShXqaL6DLGMZMvS16X3wCTFt+HSy0E17jqVXlF+Nr4RABK6yU=
X-Received: by 2002:a17:90b:354c:b0:219:e2f1:81ad with SMTP id
 lt12-20020a17090b354c00b00219e2f181admr1223544pjb.19.1671226772055; Fri, 16
 Dec 2022 13:39:32 -0800 (PST)
MIME-Version: 1.0
References: <20221213125218.39868-1-philmd@linaro.org> <20221213125218.39868-3-philmd@linaro.org>
 <CAFEAcA96ncqvN9iXybCd2SrVKJ9CKsu5t3_GtdNt1ZEDAkFt0w@mail.gmail.com> <e8c3fdcb-81f1-7067-217c-c49e8748b84a@gmail.com>
In-Reply-To: <e8c3fdcb-81f1-7067-217c-c49e8748b84a@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 16 Dec 2022 21:39:19 +0000
Message-ID: <CAFEAcA_jH3Zn1cFfnvsd_GhiBj1bNKscs7S7cwFa+FnTC9QC=g@mail.gmail.com>
Subject: Re: [RFC PATCH-for-8.0 2/3] hw/ppc/spapr: Replace tswap64(HPTE) by cpu_to_be64(HPTE)
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
	qemu-devel@nongnu.org, BALATON Zoltan <balaton@eik.bme.hu>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Alistair Francis <alistair@alistair23.me>, David Gibson <david@gibson.dropbear.id.au>, 
	Jason Wang <jasowang@redhat.com>, =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
	Greg Kurz <groug@kaod.org>, qemu-arm@nongnu.org, 
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-ppc@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: BxdDLsDTxgU1

On Fri, 16 Dec 2022 at 19:11, Daniel Henrique Barboza
<danielhb413@gmail.com> wrote:
>
>
>
> On 12/13/22 10:51, Peter Maydell wrote:
> > On Tue, 13 Dec 2022 at 12:52, Philippe Mathieu-Daud=C3=A9 <philmd@linar=
o.org> wrote:
> >>
> >> The tswap64() calls introduced in commit 4be21d561d ("pseries:
> >> savevm support for pseries machine") are used to store the HTAB
> >> in the migration stream (see savevm_htab_handlers) and are in
> >> big-endian format.
> >
> > I think they're reading the run-time spapr->htab data structure
> > (some of which is stuck onto the wire as a stream-of-bytes buffer
> > and some of which is not). But either way, it's a target-endian
> > data structure, because the code in hw/ppc/spapr_softmmu.c which
> > reads and writes entries in it is using ldq_p() and stq_p(),
> > and the current in-tree version of these macros is doing a
> > "read host 64-bit and convert to/from target endianness wih tswap64".
> >
> >>   #define HPTE(_table, _i)   (void *)(((uint64_t *)(_table)) + ((_i) *=
 2))
> >> -#define HPTE_VALID(_hpte)  (tswap64(*((uint64_t *)(_hpte))) & HPTE64_=
V_VALID)
> >> -#define HPTE_DIRTY(_hpte)  (tswap64(*((uint64_t *)(_hpte))) & HPTE64_=
V_HPTE_DIRTY)
> >> -#define CLEAN_HPTE(_hpte)  ((*(uint64_t *)(_hpte)) &=3D tswap64(~HPTE=
64_V_HPTE_DIRTY))
> >> -#define DIRTY_HPTE(_hpte)  ((*(uint64_t *)(_hpte)) |=3D tswap64(HPTE6=
4_V_HPTE_DIRTY))
> >> +#define HPTE_VALID(_hpte)  (be64_to_cpu(*((uint64_t *)(_hpte))) & HPT=
E64_V_VALID)
> >> +#define HPTE_DIRTY(_hpte)  (be64_to_cpu(*((uint64_t *)(_hpte))) & HPT=
E64_V_HPTE_DIRTY)
> >> +#define CLEAN_HPTE(_hpte)  ((*(uint64_t *)(_hpte)) &=3D cpu_to_be64(~=
HPTE64_V_HPTE_DIRTY))
> >> +#define DIRTY_HPTE(_hpte)  ((*(uint64_t *)(_hpte)) |=3D cpu_to_be64(H=
PTE64_V_HPTE_DIRTY))
> >
> > This means we now have one file that's accessing this data structure
> > as "this is target-endian", and one file that's accessing it as
> > "this is big-endian". It happens that that ends up meaning the same
> > thing because PPC is always TARGET_BIG_ENDIAN, but it seems a bit
> > inconsistent.
> >
> > We should decide whether we're thinking of the data structure
> > as target-endian or big-endian and change all the accessors
> > appropriately (or none of them -- currently we're completely
> > consistent about treating it as "target endian", I think).
>
> Yes, most if not all accesses are being handled as "target endian", even
> though the target is always big endian.
>
> IIUC the idea behind Phil's cleanups is exactly to replace uses of
> "target-something" if the endianess of the host is irrelevant, which
> is the case for ppc64. We would then change the semantics of the code
> gradually to make it consistent again.

I would be happier if we just did all the functions that read and
write this byte array at once -- there are not many of them.

thanks
-- PMM
