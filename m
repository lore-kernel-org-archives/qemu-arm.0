Received: by 2002:a19:4310:0:0:0:0:0 with SMTP id q16csp4749960lfa;
        Tue, 8 Jun 2021 12:56:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz64+acKgLfu/DQEAuotYYp1ETQ134bMs7qHrvYy9JK6Ds9bTdVAB9iyRV8PUI9hmMKqD8R
X-Received: by 2002:a5d:89c5:: with SMTP id a5mr20615819iot.172.1623182193579;
        Tue, 08 Jun 2021 12:56:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623182193; cv=none;
        d=google.com; s=arc-20160816;
        b=KSoDDaEx2WA9vSe+6GXyYpqBmlUpDpT7cOHUJ04MroGFyTOuxomrrdWpWunNvdO7Tb
         MTQPgGwF9JGBTthWqxDNjV5tS7Z1sIf+PW+nEFXF0QQbODlW+wkjtu7U1B/ODbvaJFLL
         QtBl3pBXFRn7PawloNNMc+YjiImXxuRI2jWtH2Zf+CocO49BlwcPmmOPrpP6T+q0VSBO
         /8N3KyKg+Zi81ey8iHqEegyShDPzT1ZkdBlgfWsdgtf4EW628Ls0J+JQ/5LEFofCtlin
         NiE4OSqT+e4QrnKI/tTY8wIbBlO8bULoIS1HF4ZGvBsV9N/vq8WBY4qkujUKQTtOzG4J
         z5vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=JoiZkH2m/01RiKGFsA3KtKvH441QPed40aWHbK03Aqc=;
        b=mRiubVsKz4A6aY92SfU5QMZMaXEKLjeMiONKW7mFCI/RSYizZ1AJ+BeITWQ4jJqtg1
         FmS5RcFUyEYd9FB4fJovHrkWiToPIv0rJaBRDi/xtF47qyF3w6gSrKvk0nM9sD7v2snD
         rAiOZBftkhy3g1TP6yDi/J/trCIsufudGwq5RnevsPHtyAFDnNfieMGDykc7AKxdIpEf
         M05a4+7bdF7wk6sv8U7dO3gkjLidOOHTiQFzU6G9uPBW7KckENYg+lUb5kdfCRJ9oL02
         Ld6AC0cjH6H0VFCNzMoJRS9+tUXF5NpqYy8lvbe4XiLjqfkwBe/xARrSb4gimSTzskRZ
         KOmQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20161025 header.b=YH9eDDgd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x6si704977ilv.59.2021.06.08.12.56.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 08 Jun 2021 12:56:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20161025 header.b=YH9eDDgd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1]:57456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lqhpw-0001Yp-R1
	for alex.bennee@linaro.org; Tue, 08 Jun 2021 15:56:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47998)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <venture@google.com>)
 id 1lqhpZ-0001Xc-W3
 for qemu-arm@nongnu.org; Tue, 08 Jun 2021 15:56:10 -0400
Received: from mail-qv1-xf35.google.com ([2607:f8b0:4864:20::f35]:46630)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <venture@google.com>)
 id 1lqhpV-0003Q7-B5
 for qemu-arm@nongnu.org; Tue, 08 Jun 2021 15:56:09 -0400
Received: by mail-qv1-xf35.google.com with SMTP id w9so11484714qvi.13
 for <qemu-arm@nongnu.org>; Tue, 08 Jun 2021 12:56:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JoiZkH2m/01RiKGFsA3KtKvH441QPed40aWHbK03Aqc=;
 b=YH9eDDgd6U7poMxwzC8bXsb+PK4Bn+HzzGjhvNgGnknLMPCXXkEJTBzLU0mQgLcjMA
 pCjZByIFti9Ygh7QpJW33U4OOMp+eV/xwnB34+mx+N4B2K7gBPIyhq8bXqTwawzo09Mw
 pP1u7qmN2uHPz+o3jWuC9uOxryBW2346Ku05HOnyx8merLyJtyp77j6k7KanHsfT9tIM
 x1QTSR9CM8oisUHR2ksvubgrknunurJHv5mz0xrAFSEE3831z6VWG0SU5RP10kOqAIDv
 ieKWarSWw+Gh3+gEu0QsLdaCV3mYiHQUc5f9aaVmR4vE9jBqYUrS0rn9OEYUqcWRSMy4
 l5HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JoiZkH2m/01RiKGFsA3KtKvH441QPed40aWHbK03Aqc=;
 b=skU7yJZlu3Q+IATg1x9bWDBnX+PRKps+TDI8YmzKnR/XH0g+KywPppssg74vJ48Uvd
 UWUqX3wEgeDY/g9oLmhMXfdXZq256T3X8mWndVtTn3BrS6uKRpzEPLn27r5lId6NTbnf
 Al2y0hvF+oz4QsgUN1uVYlQ+1qbZdWlBraQNmeJFQHywYtHLRkibIsKG54gfXYhdPq7/
 FNMUNMEPNJ9ppgmbE/HRTaGP5Fy+MbAnV0yX6fl9B40S4Wpw+bRtQf8XSsvUMoJqcz6k
 8AWDJqAe/ohLxb7CDfnI/5GYCWZfZ3D3foYZrI4jgWHUhUWqOmEPGuFWvXSsNRrOxc8L
 6AMg==
X-Gm-Message-State: AOAM532UeI7jVfl/zd80JL//lCKb1kPcK1GgkI6NCJWvDIgO6Ke1uZij
 MiCgbOch+uQLgtC4LtcB43DRJSHNXfplk8umoV6VQw==
X-Received: by 2002:a05:6214:c88:: with SMTP id
 r8mr1942910qvr.58.1623182163548; 
 Tue, 08 Jun 2021 12:56:03 -0700 (PDT)
MIME-Version: 1.0
References: <20210518194118.755410-1-venture@google.com>
 <20210518194118.755410-5-venture@google.com>
 <CACPK8XcCOTQe2ObaBP3rfbM1oe0h=E2murXyPAvGBewKV=qBdw@mail.gmail.com>
 <CAO=notyU64PAS003P97hiZ+V3ShSWiF3OmBRfL5D9fOJQByjEQ@mail.gmail.com>
In-Reply-To: <CAO=notyU64PAS003P97hiZ+V3ShSWiF3OmBRfL5D9fOJQByjEQ@mail.gmail.com>
From: Patrick Venture <venture@google.com>
Date: Tue, 8 Jun 2021 12:55:52 -0700
Message-ID: <CAO=notxHN_JVuyVTO7p+85zWOjeY_uxFfwdbjJXe94qdKhHD0A@mail.gmail.com>
Subject: Re: [PATCH 4/4] aspeed: sonorapass: enable pca954x muxes
To: Joel Stanley <joel@jms.id.au>
Cc: Havard Skinnemoen <hskinnemoen@google.com>,
 Tyrone Ting <kfting@nuvoton.com>, 
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>, 
 qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>, 
 Hao Wu <wuhaotsh@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::f35;
 envelope-from=venture@google.com; helo=mail-qv1-xf35.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
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
X-TUID: q5p+wW3GYiqs

On Wed, May 19, 2021 at 10:18 AM Patrick Venture <venture@google.com> wrote:
>
> On Tue, May 18, 2021 at 4:27 PM Joel Stanley <joel@jms.id.au> wrote:
> >
> > On Tue, 18 May 2021 at 19:41, Patrick Venture <venture@google.com> wrote:
> > >
> > > Enables the pca954x muxes in the bmc board configuration.
> > >
> > > Signed-off-by: Patrick Venture <venture@google.com>
> > > Reviewed-by: Hao Wu <wuhaotsh@google.com>
> >
> > Not sure about this one, there's no device tree for it in Linux.
>
> Yeah, this was just a pick-up from grepping other BMC boards.  I added
> these going off the comment alone.  I'd be okay with dropping this in
> the series.

In this case, the number of patches changed within a version change --
should I start a fresh series or just bump the version and drop the
last patch?

>
> >
> > > ---
> > >  hw/arm/aspeed.c | 22 +++++++++++-----------
> > >  1 file changed, 11 insertions(+), 11 deletions(-)
> > >
> > > diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
> > > index 35a28b0e8b..27fd51980c 100644
> > > --- a/hw/arm/aspeed.c
> > > +++ b/hw/arm/aspeed.c
> > > @@ -541,14 +541,16 @@ static void swift_bmc_i2c_init(AspeedMachineState *bmc)
> > >
> > >  static void sonorapass_bmc_i2c_init(AspeedMachineState *bmc)
> > >  {
> > > +    I2CSlave *i2c_mux;
> > >      AspeedSoCState *soc = &bmc->soc;
> > >
> > >      /* bus 2 : */
> > >      i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 2), "tmp105", 0x48);
> > >      i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 2), "tmp105", 0x49);
> > > -    /* bus 2 : pca9546 @ 0x73 */
> > > +    i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 2), "pca9546", 0x73);
> > >
> > > -    /* bus 3 : pca9548 @ 0x70 */
> > > +    /* bus 3 : */
> > > +    i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 3), "pca9548", 0x70);
> > >
> > >      /* bus 4 : */
> > >      uint8_t *eeprom4_54 = g_malloc0(8 * 1024);
> > > @@ -562,7 +564,7 @@ static void sonorapass_bmc_i2c_init(AspeedMachineState *bmc)
> > >      /* bus 6 : */
> > >      i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 6), "tmp105", 0x48);
> > >      i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 6), "tmp105", 0x49);
> > > -    /* bus 6 : pca9546 @ 0x73 */
> > > +    i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 6), "pca9546", 0x73);
> > >
> > >      /* bus 8 : */
> > >      uint8_t *eeprom8_56 = g_malloc0(8 * 1024);
> > > @@ -573,14 +575,12 @@ static void sonorapass_bmc_i2c_init(AspeedMachineState *bmc)
> > >      /* bus 8 : adc128d818 @ 0x1d */
> > >      /* bus 8 : adc128d818 @ 0x1f */
> > >
> > > -    /*
> > > -     * bus 13 : pca9548 @ 0x71
> > > -     *      - channel 3:
> > > -     *          - tmm421 @ 0x4c
> > > -     *          - tmp421 @ 0x4e
> > > -     *          - tmp421 @ 0x4f
> > > -     */
> > > -
> > > +    /* bus 13 : */
> > > +    i2c_mux = i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 13),
> > > +                                      "pca9548", 0x71);
> > > +    i2c_slave_create_simple(pca954x_i2c_get_bus(i2c_mux, 3), "tmp421", 0x4c);
> > > +    i2c_slave_create_simple(pca954x_i2c_get_bus(i2c_mux, 3), "tmp421", 0x4e);
> > > +    i2c_slave_create_simple(pca954x_i2c_get_bus(i2c_mux, 3), "tmp421", 0x4f);
> > >  }
> > >
> > >  static void witherspoon_bmc_i2c_init(AspeedMachineState *bmc)
> > > --
> > > 2.31.1.751.gd2f1c929bd-goog
> > >
