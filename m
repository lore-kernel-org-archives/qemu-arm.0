Received: by 2002:a8a:1193:0:0:0:0:0 with SMTP id m19csp2263094ocs;
        Mon, 26 Sep 2022 08:45:17 -0700 (PDT)
X-Received: by 2002:a17:907:1626:b0:782:e490:4f4 with SMTP id hb38-20020a170907162600b00782e49004f4mr11281437ejc.464.1664207116405;
        Mon, 26 Sep 2022 08:45:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1664207116; cv=none;
        d=google.com; s=arc-20160816;
        b=mXlaFrlvetHzePywm0/xGvBI9Fj8bnsJgh0r6eZGQyPH+ahI+nRl8/jeOS88CfsSAm
         tYSXmAGEVKfGRX+Cyd310ANFuBpSCSILgKxF0Ht0PRKUrsgMgdTNGm37QO/p21RCzQ8F
         4yXIi3j6Nma2fP2gwcL4M/+OlwTdgB/Z+FuiGnv9k1uxs30DEX0sDqZs27t6iRWv83Nr
         IlYkY4dD/Ap4l0t+OoGWSW4JhGU2dh3NBOYANuAC8v0jKfJe9pmBFMkGWOCGjFr4RMUh
         Vlqmvs2JJLvfbRTKBwDaEFUIE6dfqd+hN4pOyfCCmj+/0OA6bRPiJci5TghE6oYWAhnw
         G/aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+vNYGgenJsuZ/wV50s5UXKcM8Ou+iERgQnCiO2C40SQ=;
        b=EAxVifZIDhOqHj86oE8Lc65d52MKD/AwoSc5i07E6QIhfVO2yfQ9QM2DaBS4p33CRl
         CaXul1Hk3YiZpAWr7OjKcGv5glTvuW1BEka79OptXJoYDVk3Cl73bf4wCUFBuy/HebsG
         MSTqQHm4O/qBzM2Xpo6kM22vqePVBZGfBq2VoPu5hFzmXyj8bcN38NRFXaXpk/i/YgMD
         0LvtFhJRMnMj0ZwCNJhLOdt7f3bsD1eAs5txgXql1+DEd4gSLdd5l5dncWbGgk5bLsD7
         xtUHqidgo1Z+YTmDlNjYQAe5zp6ZSdVfP8UlB/XdEW5pSDtD7IxQ/T+GJG/1/TDcicZd
         gVpw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=y9oRn0x4;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id j25-20020a170906411900b00781132aefc9sor6947151ejk.94.2022.09.26.08.45.16
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 26 Sep 2022 08:45:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=y9oRn0x4;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date;
        bh=+vNYGgenJsuZ/wV50s5UXKcM8Ou+iERgQnCiO2C40SQ=;
        b=y9oRn0x4rmKT1czXiU5qrSvqIUudCclgW5rMywGmCdRg4RPbLqIhTq/RtqZSzZ321O
         xhAGKJ5HP49/b6LVHCiEZNlCAj1ea56yiLWSkb0nJoEzJbETmn8dGD7ClvNauicNWFy0
         3NgUefG9rbJzCK9IvgjIkuL6ceDC8DCDDWLQRaVuGxyodWEiMG92YVdzFFr6NIsI9dsX
         u8Cvisa7jZ6oGk87sz9zFu8QVG0kM1XAP7pwbtjkRIL3OMYUYxKFLQURKAzRGNtqE6pz
         1z8NH7rHkVlqq0/MRCvq9QxGpv3wU96OncK3d+AFlfNlYR8eqKIw5rRPooP1ngATVOJx
         3ggw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date;
        bh=+vNYGgenJsuZ/wV50s5UXKcM8Ou+iERgQnCiO2C40SQ=;
        b=MosEW0uyXSwETJHmEgwje0wRBiDMeY5WjrFc4GOzsYuT8ceNEYCmIbh4/zbaATwQdR
         o59N/3cH6cT4hJxl3s8lYWRrhwhj28ABKf2XL3VyPLDiCSADJ1xgpnewx+Y4r4ZjsSVF
         s8XK21Kr61toxD0h7WdERF7fI+cvXDMX4a5H5Em+edKU9MMigH0PdcvutGTAXTHHEXUb
         O+wrQJivkvNwUiU9sOnKHcQIfx9DP3Q8d93HWWk+d2seTYYFSmJHbrVCDkC4s4g9uxVw
         4Gy/IxCxzUhSoU4yD2BwL1DnyFwctqIniMOfRmECwcQG3BQCN0CbJvUN36AKMjeWPhk5
         6XyA==
X-Gm-Message-State: ACrzQf2gti/OLwuj+rFHFTXuDYlq1QXvK3ZSDAlUTYj78x3dJL9kpddn
	wJzH5JFQRv+opDOH8yS2LpPHXDYmeGqmUGUorZf0fjhEoAtHfA==
X-Google-Smtp-Source: AMsMyM4zlT1rFw0ahT72yH4tYlRuB2ktmveb8ICcp/oZPtHEsBL/oUrnAhuHY0CXbaJBreqpGRg2kBma6amvs0CI2FQ=
X-Received: by 2002:a17:907:724b:b0:782:f2bb:24d3 with SMTP id
 ds11-20020a170907724b00b00782f2bb24d3mr10696682ejc.555.1664207115961; Mon, 26
 Sep 2022 08:45:15 -0700 (PDT)
MIME-Version: 1.0
References: <20220926133904.3297263-1-alex.bennee@linaro.org>
 <20220926133904.3297263-6-alex.bennee@linaro.org> <CAFEAcA_u8TQW5EoX5bBZGKhhaS6PYaYZGyqMrhB1Tsa6eTXCyQ@mail.gmail.com>
 <87leq641id.fsf@linaro.org> <CAFEAcA8D_SzU35DB-RvaegYkwkJHD0Y3stx7P=Jh=QC6LOqDZA@mail.gmail.com>
 <874jwu3zwr.fsf@linaro.org>
In-Reply-To: <874jwu3zwr.fsf@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 26 Sep 2022 16:45:04 +0100
Message-ID: <CAFEAcA-SGDR0mFZzBoCXHthf00PemTCafETd-VfQijXhifBqzQ@mail.gmail.com>
Subject: Re: [PATCH v2 05/11] hw/intc/gic: use MxTxAttrs to divine accessing CPU
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, f4bug@amsat.org, mads@ynddal.dk, 
	qemu-arm@nongnu.org, Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: hf/kge1yDrML

On Mon, 26 Sept 2022 at 16:42, Alex Benn=C3=A9e <alex.bennee@linaro.org> wr=
ote:
>
>
> Peter Maydell <peter.maydell@linaro.org> writes:
>
> > On Mon, 26 Sept 2022 at 16:08, Alex Benn=C3=A9e <alex.bennee@linaro.org=
> wrote:
> >> Peter Maydell <peter.maydell@linaro.org> writes:
> >> > On Mon, 26 Sept 2022 at 14:39, Alex Benn=C3=A9e <alex.bennee@linaro.=
org> wrote:
> >> >> -static inline int gic_get_current_cpu(GICState *s)
> >> >> +static inline int gic_get_current_cpu(GICState *s, MemTxAttrs attr=
s)
> >> >>  {
> >> >> -    if (!qtest_enabled() && s->num_cpu > 1) {
> >> >> -        return current_cpu->cpu_index;
> >> >> -    }
> >> >> -    return 0;
> >> >> +    /*
> >> >> +     * Something other than a CPU accessing the GIC would be a bug=
 as
> >> >> +     * would a CPU index higher than the GICState expects to be
> >> >> +     * handling
> >> >> +     */
> >> >> +    g_assert(attrs.requester_type =3D=3D MEMTXATTRS_CPU);
> >> >> +    g_assert(attrs.requester_id < s->num_cpu);
> >> >
> >> > Would it be a QEMU bug, or a guest code bug ? If it's possible
> >> > for the guest to mis-program a DMA controller to do a read that
> >> > goes through this function, we shouldn't assert. (Whether that
> >> > can happen will depend on how the board/SoC code puts together
> >> > the MemoryRegion hierarchy, I think.)
> >>
> >> Most likely a QEMU bug - how would a DMA master even access the GIC?
> >
> > If it's mapped into the system address space, the same way
> > as it does any memory access. For instance on the virt board
> > we just map the distributor MemoryRegion straight into the
> > system address space, and any DMA master can talk to it.
> > This is of course not how the hardware really works (where
> > the GIC is part of the CPU itself), but, as noted in previous
> > threads, up-ending the MemoryRegion handling in order to be
> > able to put the GIC only in the address space(s) that the CPU
> > sees would be a lot of work, which is why we didn't try to
> > solve the "how do you figure out which CPU is writing to the
> > GIC" problem that way.
>
> So hw_error?

That's just an assert by another name, and isn't any better.

> I don't think there is a way we can safely continue unless we just want
> to fallback to "it was vCPU 0 what did it".

You can do that, or just make the whole memory transaction
return 0, or return a suitable memtx error.

-- PMM
