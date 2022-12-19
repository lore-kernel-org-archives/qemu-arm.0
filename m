Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp3369754ejb;
        Mon, 19 Dec 2022 02:39:52 -0800 (PST)
X-Received: by 2002:a17:90a:304b:b0:218:f8a6:7bda with SMTP id q11-20020a17090a304b00b00218f8a67bdamr42617701pjl.48.1671446391794;
        Mon, 19 Dec 2022 02:39:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1671446391; cv=none;
        d=google.com; s=arc-20160816;
        b=hJ8LcLR5B9PmadyCSMVgc0t2xBO7Sck7zmWp6v38gITy83yMAJoM3az8V9n6lYXROj
         2pa4xb3AeUA2GohxZvnm2mivQPiBNghDIhRZMmxYaVWNWqgsWRapScsxZf55eX2pWcUM
         994bOiNFj6wZksXRjAXS32SzJldfRy4YOEqdbnXixEBxrSYOo6o504zMf3DZ+kqd2aBR
         eLhUEv0XpXeAQQSARC9yEMjKWHQj8N34Dm1uEJUp/eHHYy2lnJBGKexKEbm3RAlCQDUp
         /UUjS+S4TAK4SvZtil2dWmWQXd70quFiXJl4+bLKepFFj0YmbyQHUcwCIfDNJoPMetaK
         1ETQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=u7KeSU+NIGRMiKUqkPJtZFR1KIYWRCK8Ds6T77hTh3w=;
        b=Un40BUbYWJ7PWV+aCB7ZQSwWhM5YC2XqgS6Q/uIrWlsYE0EAmt1PsV8k9M84AjoB99
         n3LwzPIZ+cZvlp2UrAK5oa49HplCtCP2JLqUx2e98cceUbMWgEFXR6r7ai9pMaTX6jKb
         4KKp1onfMYL979HdqE/Z70db+WAzM83pg1cq0whByRp0wdlndHc//9YEc/Rh0dphKWby
         WXzzWcWgwNSrInkrFSMTLq+U6CDcCkWSn/HYskEwbTQW8VAADZzX+rmm9ZJuxXT39vlt
         TKxajgXCthmc1vxdcSFjbnhzs1obkC5pLIu37dgk7onfjfcVN23PfsT+XJYkEYHy0xDj
         WZtw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uSptm9k0;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id o13-20020a17090a55cd00b0021918731871sor6279843pjm.8.2022.12.19.02.39.51
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 19 Dec 2022 02:39:51 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uSptm9k0;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=u7KeSU+NIGRMiKUqkPJtZFR1KIYWRCK8Ds6T77hTh3w=;
        b=uSptm9k0w65crp6lqNvmpCwAuG8sw4+YYo8YL+jJKAgdAISgjEFkoMJyHxncVFY0Ur
         7FrJpM1vq7PiSGGI1FxBK6nXxl2/PESX8HIsLKuEgjl2I2XJ+lbJvVJkIPP/nSHZyebw
         en2/IIu7lBIW/HnYYqbko3E5mj+0TVk7XXBjxNGyw5z0mqnSqAxT8rX7ngvBXdOCs7aH
         vH1v4pl2GKo0dwF2PiKP3eQXrh3qVLbFCmXmqvPqhksd4A7EckRVy7zkygGHdcan+o7c
         EQRmVTp98B6imAinzwShgSZYw5swi+DVYBXCPqG8K5X/aJPUg0vZR8ddGe1dCNLJ4VIr
         Fihg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u7KeSU+NIGRMiKUqkPJtZFR1KIYWRCK8Ds6T77hTh3w=;
        b=gRmo5FA/RHFISwar1/pnw+wvlrTm05lDBH+CalGRnFWjFoTyIpN7n8wwACLE/Kb6P2
         xvFBuMSbgPR7DaeP1Io2Hj+XcAOGKwDyStRhzlnhLX5I/XUMvsolCsMhQg1s4wJm1gvd
         kIaGDIWzFQ2/SldSDYetyibc5B2Y+hYPtzXGlPHf5F7Nzd9GNhjl+CcjrNMqHocQ/o8d
         HEfbfzSUnwiFyrpSDkhENF3Fe8AbHdccM6Xu61vvcI/gXDgIP7OxAcSvt/2ZeUQqdNqS
         oW4l9e2gXZB4bA+36iUdhyQRfV9Psz1yX0E1qk/FexVve8WeoNu34XroYuL0LvktVWmA
         xGLw==
X-Gm-Message-State: AFqh2koNUYwwfR4i6lSGTsavMo3ojYcd+R+s3FQan1XEIZutqefInXDx
	Y4p609HchwmnHsFYspmOZJ5Vyul4SlSUWY5PKvX6JPzt
X-Google-Smtp-Source: AMrXdXu8V+vWKNuuqzeYNpv8VSmTKPBB3zpbc1mjYmM/d4GUigUrVJyYdaGEPXMQaoDCgL1to3ucV4WZRN5C9CEotFU=
X-Received: by 2002:a17:90b:354c:b0:219:e2f1:81ad with SMTP id
 lt12-20020a17090b354c00b00219e2f181admr1914058pjb.19.1671446391242; Mon, 19
 Dec 2022 02:39:51 -0800 (PST)
MIME-Version: 1.0
References: <20221213125218.39868-1-philmd@linaro.org> <20221213125218.39868-3-philmd@linaro.org>
 <CAFEAcA96ncqvN9iXybCd2SrVKJ9CKsu5t3_GtdNt1ZEDAkFt0w@mail.gmail.com>
 <e8c3fdcb-81f1-7067-217c-c49e8748b84a@gmail.com> <CAFEAcA_jH3Zn1cFfnvsd_GhiBj1bNKscs7S7cwFa+FnTC9QC=g@mail.gmail.com>
 <Y6AFLpDEkpS+muSJ@yekko>
In-Reply-To: <Y6AFLpDEkpS+muSJ@yekko>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 19 Dec 2022 10:39:40 +0000
Message-ID: <CAFEAcA9CUtdLXKPOqC0uRCyA0xQFZ_SrJ62SSDvPKESaxL3X2A@mail.gmail.com>
Subject: Re: [RFC PATCH-for-8.0 2/3] hw/ppc/spapr: Replace tswap64(HPTE) by cpu_to_be64(HPTE)
To: David Gibson <david@gibson.dropbear.id.au>
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>, =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
	qemu-devel@nongnu.org, BALATON Zoltan <balaton@eik.bme.hu>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Alistair Francis <alistair@alistair23.me>, Jason Wang <jasowang@redhat.com>, 
	=?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, Greg Kurz <groug@kaod.org>, 
	qemu-arm@nongnu.org, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-ppc@nongnu.org
Content-Type: text/plain; charset="UTF-8"
X-TUID: y+iihGo+Qooy

On Mon, 19 Dec 2022 at 06:35, David Gibson <david@gibson.dropbear.id.au> wrote:
>
> On Fri, Dec 16, 2022 at 09:39:19PM +0000, Peter Maydell wrote:
> > On Fri, 16 Dec 2022 at 19:11, Daniel Henrique Barboza
> > <danielhb413@gmail.com> wrote:
> > >
> > >
> > >
> > > On 12/13/22 10:51, Peter Maydell wrote:
> > > Yes, most if not all accesses are being handled as "target endian", even
> > > though the target is always big endian.
>
> So "target is always big endian" is pretty misleading for POWER.  We
> always define "TARGET_BIG_ENDIAN" in qemu, but for at least 10 years
> the CPUs have been capable of running in either big endian or little
> endian mode (selected at runtime).  Some variants can choose
> endianness on a per-page basis.  Since the creation of the ISA it's
> had "byte reversed" load and store instructions that let it use little
> endian for specific memory accesses.

Yeah, this is like Arm (and for the purposes of this thread
I meant essentially "TARGET_BIG_ENDIAN is always defined").

> Really the whole notion of an ISA having an "endianness" doesn't make
> a lot of sense - it's an individual load or store to memory that has
> an endianness which can depend on a bunch of factors.  When these
> macros were created, an ISA nearly always used the same endianness,
> but that's not really true any more - not just for POWER, but for a
> bunch of targets.  So from that point of view, I think getting rid of
> tswap() - particularly one that has compile time semantics, rather
> than behaviour which can depend on cpu mode/state is a good idea.

I tend to think of the TARGET_BIG_ENDIAN/not setting as being
something like "CPU bus endianness". At least for Arm, when you
put the CPU into BE mode it pretty much means "the CPU byteswaps
the data when it comes in/out", AIUI.

> I believe that even when running in little-endian mode, the hash page
> tables are encoded in big-endian, so I think the proposed change makes
> sense.

OK. I still think we should consistently change all the places that are
accessing this data structure, though, not just half of them.

thanks
-- PMM
