Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp891197lfm;
        Wed, 15 Jul 2020 14:19:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwedDc/PAcEEGI7baZVHM9qnJgEpx68GloZ0v7laxIbai7CYMRjK8blfn3yNyRdBonZ8Ons
X-Received: by 2002:a25:9c44:: with SMTP id x4mr1518555ybo.510.1594847965792;
        Wed, 15 Jul 2020 14:19:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1594847965; cv=none;
        d=google.com; s=arc-20160816;
        b=RSk/b2+2J8bex/uW4hgQS8I79suBmmbpcboGApKsS2uZ8KmCDLKU6ci6/zBhVF6LuZ
         N06aM83qKohMZE1WDfiIkFXBv9OKSkNZXJuqa0glkECg7tT3mOLswhTvRtiPV+1lc6bK
         ZTnhtv9BPPr5pNOEnkwc9qt9Sqe3k3Y+d0O3ojjfvzZdOijZX7a75uRNoK1HhyMQoxMx
         0jqZ1Zj0RnCyfo5Vbhk1UmO/OGS2abeNQCCQ2GrjtbmgZXkxeVuXIezN0UgAvnlygy5r
         43lw8mbw/fqdtpZkvcqpfzjklgRPQiR4L+ywjSktrCGwv53aT51jcaMf2MxLT8BRk60i
         7d6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=Potn9mzcEUjKpDHBj8d/p5FKGcs1ovgdzwYN0zt0NGY=;
        b=NaAuEPvKJSsmKbTVIEeKLRnKMGgqcryslkd2mYyYCYccjkUMPyZWdZiJsFDhzL3xEI
         Q7yjGwsRITsJ6GYMzdCyX1Hb3+6v1lWpfHe//prwYStlRVPPQr4SNIkqctuAMuWX8L/i
         jMl+jf7vxv2f0CfgS3zFYfW/n/NtRCA/sl+UdY5kDr2uE9VrI0treKios1dFUrENpcLO
         25tXwtnfEugaS1z94ryJ/6pdGi5oZwiudkHn2p9u6eU5/7FM4BPTLoK+9Vxm1hsmHo9x
         UsXG9LjD2inLy9JhjLNKp6XFVJjdT/jxofiH3RfpQFyF3KQM5vfAGatPEU9R9QWsXPL1
         Rq8A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20161025 header.b=RVvEgqfL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c81si3509584ybb.362.2020.07.15.14.19.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 15 Jul 2020 14:19:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20161025 header.b=RVvEgqfL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1]:48844 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jvooH-0005rS-6h
	for alex.bennee@linaro.org; Wed, 15 Jul 2020 17:19:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57124)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hskinnemoen@google.com>)
 id 1jvoo7-0005qx-IR
 for qemu-arm@nongnu.org; Wed, 15 Jul 2020 17:19:15 -0400
Received: from mail-vs1-xe42.google.com ([2607:f8b0:4864:20::e42]:46901)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <hskinnemoen@google.com>)
 id 1jvoo5-00088b-BD
 for qemu-arm@nongnu.org; Wed, 15 Jul 2020 17:19:15 -0400
Received: by mail-vs1-xe42.google.com with SMTP id x13so1856998vsx.13
 for <qemu-arm@nongnu.org>; Wed, 15 Jul 2020 14:19:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Potn9mzcEUjKpDHBj8d/p5FKGcs1ovgdzwYN0zt0NGY=;
 b=RVvEgqfLdM4JAOIel7pUvSo7yD3UETOQfm9TPRl4wZ53zwlm/8qsSEvipJgU8Ikg76
 IXHyaTKP0o5+qQnJilnd8GeSW3e4MI6GEGd1IX9BAVdAXuqKQYz1DbQ68FI7yP8sk+vG
 LowbfzCTzUaSh8zbejaYnoUSuzcUl0iomUXmV8Fs98G2nuNrPZwAk62xqZ5No73/PJBn
 bMnP+S9ZHZuO+VT6LKNjKY6bF445c25AHRX+6w9K05MVFebGTWXdQjDet1KSkqXLLTmj
 W3+JNEJrjxoh6oCS3PS4MxU1gr00yDh9pLoquzeOBSQt/KP1NN1+5Ic3guwTrvRkzV3B
 /eTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Potn9mzcEUjKpDHBj8d/p5FKGcs1ovgdzwYN0zt0NGY=;
 b=cJYZUNGVRhesVBnr332fhgf/S2KSpCm046O60G3o6lJsgo+iSj4K3EVYuB1EjgJ5ZZ
 aExhGkXySl3vN6GFkjluIbYXzbonRv9VCButLKf5X5D9JEnbgarGB71GHwJ5YJojLb/r
 gECWAGRs+QZE5Ta1RO2uA1bmekbBGCcK5skHhVdqqmNXsGkiiBCOOOarE/Ln4xyY6ZO6
 1SqMWa3AymyyOqgX8pXBxoQG8tcswr2g0JWV41vZkIlsqDKPE0s2ZKBe2roSTBQgFcmr
 o/KfaNi/uWZqz+vA6uXH2c/t7sCc0DQLW+HHxXVnSmMO4Tbj7OtP8v0XVRhXPxq/j20e
 pAtA==
X-Gm-Message-State: AOAM533pSrLhhIjQA82ftqxEzZ5m8KPycppnkyCP4aUOqW52mDjLdlrH
 Ms8t/Eo5aXWUkINBFwPi/wtTEcRRaxl1SDC9PgmlOg==
X-Received: by 2002:a67:e0c3:: with SMTP id m3mr1006915vsl.1.1594847951732;
 Wed, 15 Jul 2020 14:19:11 -0700 (PDT)
MIME-Version: 1.0
References: <20200709003608.3834629-1-hskinnemoen@google.com>
 <20200709003608.3834629-11-hskinnemoen@google.com>
 <109d52ed-65bf-0fcc-98f1-47b7a6671d0b@kaod.org>
 <CAFQmdRZcygskP3iwss01-Jz67yjAP_JENXjWM2Bp8U=DRzxR0Q@mail.gmail.com>
 <9a1567f0-f13c-326d-460f-6ad167bcf523@kaod.org>
In-Reply-To: <9a1567f0-f13c-326d-460f-6ad167bcf523@kaod.org>
From: Havard Skinnemoen <hskinnemoen@google.com>
Date: Wed, 15 Jul 2020 14:19:00 -0700
Message-ID: <CAFQmdRY8LaVTRcZG4rPPsVtOY6cK57HT1TT-OGROn1yNfL43pw@mail.gmail.com>
Subject: Re: [PATCH v5 10/11] hw/arm: Wire up BMC boot flash for npcm750-evb
 and quanta-gsj
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>, 
 IS20 Avi Fishman <Avi.Fishman@nuvoton.com>, CS20 KFTing <kfting@nuvoton.com>, 
 Joel Stanley <joel@jms.id.au>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::e42;
 envelope-from=hskinnemoen@google.com; helo=mail-vs1-xe42.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -185
X-Spam_score: -18.6
X-Spam_bar: ------------------
X-Spam_report: (-18.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 0vwhfMHwqKA7

On Wed, Jul 15, 2020 at 12:42 AM C=C3=A9dric Le Goater <clg@kaod.org> wrote=
:
>
> On 7/14/20 4:56 AM, Havard Skinnemoen wrote:
> > On Mon, Jul 13, 2020 at 7:57 AM C=C3=A9dric Le Goater <clg@kaod.org> wr=
ote:
> >>
> >> On 7/9/20 2:36 AM, Havard Skinnemoen wrote:
> >>> This allows these NPCM7xx-based boards to boot from a flash image, e.=
g.
> >>> one built with OpenBMC. For example like this:
> >>>
> >>> IMAGE=3D${OPENBMC}/build/tmp/deploy/images/gsj/image-bmc
> >>> qemu-system-arm -machine quanta-gsj -nographic \
> >>>       -bios ~/qemu/bootrom/npcm7xx_bootrom.bin \
> >>>       -drive file=3D${IMAGE},if=3Dmtd,bus=3D0,unit=3D0,format=3Draw,s=
napshot=3Don
> >>>
> >>> Reviewed-by: Tyrone Ting <kfting@nuvoton.com>
> >>> Signed-off-by: Havard Skinnemoen <hskinnemoen@google.com>
> >>
> >> May be we don't need to create the flash object if dinfo is NULL.
> >
> > It's soldered on the board, so you can't really boot the board without
> > it. But if you think it's better to remove it altogether if we don't
> > have an image to load into it, I can do that.
> >
> >>
> >> Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>
> >> Tested-by: C=C3=A9dric Le Goater <clg@kaod.org>
> >>
> >> Nice !
> >>
> >> We need a SPI controller model and a network device model now.
> >
> > Yeah, and i2c, PWM, GPIO, etc., but if you're referring to the kernel
> > crash, see below.
>
> We don't need all device models but fixing the crash would be better.
>
> >> npcm7xx_bootrom.bin is a bit of a pain. Could we include it in
> >> the QEMU roms ?
> >
> > Yeah, I was planning to include this in v6.
>
> Good. It will ease CI.
>
> >> spi_master spi0: /ahb/fiu@fb000000/spi-nor@0 has no valid 'spi-max-fre=
quency' property (-22)
> >> spi_master spi0: Failed to create SPI device for /ahb/fiu@fb000000/spi=
-nor@0
> >
> > This is a device tree bug:
> >
> > https://github.com/hskinnemoen/openbmc/commit/99b172f88002f4fac939f85de=
be1187b9c569871
> >
> >> libphy: Fixed MDIO Bus: probed
> >> 8<--- cut here ---
> >> Unable to handle kernel paging request at virtual address fffffffe
> >
> > I believe this is a kernel bug:
> >
> > https://github.com/hskinnemoen/openbmc/commit/77e9f58ba157eabc976f15fa4=
9892128fe2b2382
> >
> > I needed two additional patches to get all the way to the login prompt:
> >
> > https://github.com/hskinnemoen/openbmc/commits/20200711-gsj-qemu-0
>
>
> Great. So are these for mainline or Joel's openbmc branch ?

I believe they need to go to the openbmc kernel and/or the Nuvoton
vendor kernel. Mainline has none of the things these patches apply to
(gsj device tree and emac driver).

I'll try to send them out within the next day or two.

Thanks for testing!

Havard
