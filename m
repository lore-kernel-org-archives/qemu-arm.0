Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp189785lfm;
        Fri, 17 Jul 2020 19:18:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxYcHLWl0NZeaL1Vbdvyuy6Tgzdu5fGXg3HqXrE4GAKpelHDO50+tL6bTQLe1An6NKloCsb
X-Received: by 2002:a25:d1c6:: with SMTP id i189mr18671552ybg.497.1595038688207;
        Fri, 17 Jul 2020 19:18:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1595038688; cv=none;
        d=google.com; s=arc-20160816;
        b=IETd+pCIdKWQ2z7Rdat9LmvF6E4bOd4jABPhZoojwDOiZLgOMJL7KkJGl4JbkRked2
         YkUg29KMpiZpAgaSLjND7Epzq1crQWUliNBmhdtO0xdV0otrVBaIaiR11hoNXlEpxK4a
         qVJGnVVtyVlZsBJhlk2uNHw40b1zlpbSZOyuhHGE5pDuH+LseSa27sHe7Z/OsmiNPXti
         qHKO9zakTuW01OdTWlhEP5mOC2A8968eKrwFum/xf6Y3gJo3+1O2T3mQ45aFF5S4QVDL
         3SWHmtl2yxg/jnWdz1Vl5DMaxQUyrjFs+sHZOXzlYuZh7RGtZWu45OxEYr6SROPlInCy
         arLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=bT4jbb2ulW7Wd6Espc2xduoQRokWofllPb5ImnfoCEE=;
        b=t+uJMYyzWneRAZTiNUUQ/Ym9+7GHCOXLd8g1+bD56grBAUd2tUWiR07pU6ZqTYxUBc
         sHXpIVADdnwAZwgvK56Wq2xGt36Kw/y2txNl+jDWLEK/dOU/Gc986KEY4b4CgtH7wj86
         Q3vCI+1OdsoceNV4bRl6pZ1qnWbWUy80PBrpt+QJN3nmudxxqXIVCZ2ktyakeJhmdzc+
         iB3H+0JYM0YOpcnBb19SgnTsqR0h5kzC7bkk8sxeZyvzlDahQhJ6sGqyWT63ZBfYmnPM
         31BsKnZxe+JieMECA+pleMb4TxCir56iR0LpIqzReQQgtpS3AKrcCRHC0DIyhTJJX2GM
         ChZA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20161025 header.b=GxOCZxG8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x33si11466133ybd.174.2020.07.17.19.18.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 17 Jul 2020 19:18:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20161025 header.b=GxOCZxG8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1]:36222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jwcQR-00044z-KK
	for alex.bennee@linaro.org; Fri, 17 Jul 2020 22:18:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58964)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hskinnemoen@google.com>)
 id 1jwcQK-00044R-Va
 for qemu-arm@nongnu.org; Fri, 17 Jul 2020 22:18:00 -0400
Received: from mail-vs1-xe44.google.com ([2607:f8b0:4864:20::e44]:40723)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <hskinnemoen@google.com>)
 id 1jwcQI-0001Su-Nj
 for qemu-arm@nongnu.org; Fri, 17 Jul 2020 22:18:00 -0400
Received: by mail-vs1-xe44.google.com with SMTP id e15so5805285vsc.7
 for <qemu-arm@nongnu.org>; Fri, 17 Jul 2020 19:17:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=bT4jbb2ulW7Wd6Espc2xduoQRokWofllPb5ImnfoCEE=;
 b=GxOCZxG8zVUn+Jdcf9kKOl5bz6CyZULqVZ/xXYD1n9ix8bGXLX3VvOl6GrHR5fa1CJ
 3XHCRYUrlbQThqJa/FuIb/sdkkvmWyJ+xw52+Wmi1juF8IKt1mGP+DQb2kLHupozVpuU
 tuZ7wREz2sg/VhrRh3NEDuy/sANU3wGaOTyMXse5Wm0fSqAcv6OOJNhdWiTn0u/7hBss
 a/458pFLi512N6rDlZQxJ3aYozo4gBMb1bQc6GMKErC/61+0d0rUkp5aXPClEaIjGG4R
 zsbiEbYhl+DyI/rfAxIhVROeg9ukUCMEUV03MWKZ1/9AdMeJ96gU9XS8E3uCOW4gU9wX
 eX+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=bT4jbb2ulW7Wd6Espc2xduoQRokWofllPb5ImnfoCEE=;
 b=afhOa3S/x2GNFUw7VD5/XQYDErBWwm/BKz28mI2RoLvgVpnUPrXRTgIStxh9eXPr0O
 oBJNmUHtzdU64x6cMPr12bKRybKk7pq80cat6jLJlINOMcK7TzKjR1bOvMJazgoDS38L
 GSqzDLhDrs7EUnkMyO61iu0dfAyRJ4+eB62cip5jolA1vbw68cj041gJA9DMrMMJtHaT
 tFMPCmZuvZDhiD1mJOe10JUF78h7EGl7evUQKiLJNLi9WpyLQIZ3bPQ0/cH3OlRox43W
 kGQ67rJTHjbAAIm2ERzBO/PBaGzgka1AKLkG9lhkdQoZzVAzNFg40IBP2pQu/PPaMmQ/
 mIAw==
X-Gm-Message-State: AOAM533QAXqoLeHnFWcKg7iYFWPNbXawHF/wT+1yHtEpqrDnvF4kxCiG
 nwzZz/gvpz6mEeHa3hUALbz/uKFb3bgPnePWp0iOYiaM
X-Received: by 2002:a67:e0c3:: with SMTP id m3mr9956094vsl.1.1595038677017;
 Fri, 17 Jul 2020 19:17:57 -0700 (PDT)
MIME-Version: 1.0
References: <20200717060258.1602319-1-hskinnemoen@google.com>
 <686266f7-c19e-918c-6df4-02f470506446@kaod.org>
In-Reply-To: <686266f7-c19e-918c-6df4-02f470506446@kaod.org>
From: Havard Skinnemoen <hskinnemoen@google.com>
Date: Fri, 17 Jul 2020 19:17:45 -0700
Message-ID: <CAFQmdRZN5DW_NkovyV3DWDuOQoObga4efrgNDxuFeRVZV+nELQ@mail.gmail.com>
Subject: Re: [PATCH v6 00/13] Add Nuvoton NPCM730/NPCM750 SoCs and two BMC
 machines
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>, 
 IS20 Avi Fishman <Avi.Fishman@nuvoton.com>,
 CS20 KFTing <kfting@nuvoton.com>, 
 Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>, 
 Joel Stanley <joel@jms.id.au>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::e44;
 envelope-from=hskinnemoen@google.com; helo=mail-vs1-xe44.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -185
X-Spam_score: -18.6
X-Spam_bar: ------------------
X-Spam_report: (-18.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001, USER_IN_DEF_DKIM_WL=-7.5,
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
X-TUID: LaeW0cROyVCl

On Fri, Jul 17, 2020 at 1:32 PM C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> On 7/17/20 8:02 AM, Havard Skinnemoen wrote:
> > I also pushed this and the previous two patchsets to my qemu fork on gi=
thub.
> > The branches are named npcm7xx-v[1-6].
> >
> >   https://github.com/hskinnemoen/qemu
> >
> > This patch series models enough of the Nuvoton NPCM730 and NPCM750 SoCs=
 to boot
> > an OpenBMC image built for quanta-gsj. This includes device models for:
> >
> >   - Global Configuration Registers
> >   - Clock Control
> >   - Timers
> >   - Fuses
> >   - Memory Controller
> >   - Flash Controller
> >
> > These modules, along with the existing Cortex A9 CPU cores and built-in
> > peripherals, are integrated into a NPCM730 or NPCM750 SoC, which in tur=
n form
> > the foundation for the quanta-gsj and npcm750-evb machines, respectivel=
y. The
> > two SoCs are very similar; the only difference is that NPCM730 is missi=
ng some
> > peripherals that NPCM750 has, and which are not considered essential fo=
r
> > datacenter use (e.g. graphics controllers). For more information, see
> >
> > https://www.nuvoton.com/products/cloud-computing/ibmc/
> >
> > Both quanta-gsj and npcm750-evb correspond to real boards supported by =
OpenBMC.
> > At the end of the series, qemu can boot an OpenBMC image built for one =
of these
> > boards with some minor modifications.
> >
> > The patches in this series were developed by Google and reviewed by Nuv=
oton. We
> > will be maintaining the machine and peripheral support together.
> >
> > The data sheet for these SoCs is not generally available. Please let me=
 know if
> > more comments are needed to understand the device behavior.
>
> I think this series is ready to go.
>
> Patch 6 "roms: Add virtual Boot ROM for NPCM7xx SoCs" needs a few
> add-ons which can come later.
>
> Patch 13 "tests/acceptance: console boot tests for quanta-gsj" needs
> an Acked-by by our test gurus. Aspeed needs the same kind of tests
> if possible. It depends on the pressure that the QEMU CI will put on
> the web servers hosting the images.

Hmm, I didn't expect this to be a problem when hosting the images on github=
...?

> I think that the rest of the comments are minor and can be fixed
> as follow-ups when 5.2 is being assembled.

Great! Thanks a lot for reviewing and testing.

I've incorporated the feedback I got today, but I'm keeping them as
separate commits for now. I can either fold them into a v7 series or
post them as follow-ups.

Thanks!

Havard
