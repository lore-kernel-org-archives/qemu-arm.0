Received: by 2002:ac2:51c9:0:0:0:0:0 with SMTP id u9csp1694388lfm;
        Wed, 19 May 2021 10:19:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwwtDN/RGEiIkKtlgHH3gTuLODE5ZhuXXMdk/QZkwUDHCKm7a/nbc6lX6V4dfLE8RHJO/mi
X-Received: by 2002:a6b:f808:: with SMTP id o8mr569164ioh.140.1621444768311;
        Wed, 19 May 2021 10:19:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1621444768; cv=none;
        d=google.com; s=arc-20160816;
        b=p9dv3UIzZ7CdV8925hpFEfyttrmJAEMi88uiSvljBcXPAiKmx6qdNmecv82731JTTR
         PIMbDXIPdwmBR0xAJ4rd3UNnxa1jIj3lDGCIb6A+jUrS7GnpDvxfKun/+mISRxwKIRAv
         sZTKtHgLelXMKATqPc2GWLrIY2HNVhmFYGwbKJKR+gSL0bHPNu4Q1lH1nJgvpzwzfWlz
         3Gr8tYQasmxiaia7Ys2viCHRMnk2dg/f6CkOHRzpwn1KVAYejpf/6EaRmyEIQJ+p9cJy
         gp3HiPnKnpRWlpmKU1z3iXQXkBZCs1y1tbXe/P7t1mkXHoZ5U4fvNPVFrV0nXQjdh45v
         RDQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=4T96VZMkZ1KnlLg5Ic8ua/tiugK4QPCAdCIRiTPIdVI=;
        b=FKd26v6Q3aDJcvWDmYG3VNq8tqjKFXViVXAJrTGTrvDx0Z3+S/BYX/OzekLZWIDy37
         3BpYJLRSexwtjZ2DE81q/PTTqOnzu4rhDSxsc0jK6ndiIsYLNLcggwDrQQdekg5tLm/M
         mM1uuwjX6LpBr+yZVFDOdLekp3S5EAN/cyoxVeF7qAvt22NH4PI9MSm5itPDFWKJjffv
         7x6vqesAEy1kvzL8qYIkDDx/2YxnxcCoyBYYg+AVNdLxJSExDC2hL4zbB5EBp5JZ+Ar2
         JR4FvN8xe2zainEY5Qis1VqvaPaEMzXrm7Lc3EasoNHhT+pYTFfQFbTZNL5nXGH2ge+h
         t47Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20161025 header.b=KT9lUrXP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w12si227467ill.144.2021.05.19.10.19.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 19 May 2021 10:19:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20161025 header.b=KT9lUrXP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1]:33852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ljPqx-0002FT-Ia
	for alex.bennee@linaro.org; Wed, 19 May 2021 13:19:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49162)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <venture@google.com>)
 id 1ljPqA-0002B8-VQ
 for qemu-arm@nongnu.org; Wed, 19 May 2021 13:18:39 -0400
Received: from mail-qt1-x836.google.com ([2607:f8b0:4864:20::836]:44886)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <venture@google.com>)
 id 1ljPq9-0007Iv-1F
 for qemu-arm@nongnu.org; Wed, 19 May 2021 13:18:38 -0400
Received: by mail-qt1-x836.google.com with SMTP id y12so10641191qtx.11
 for <qemu-arm@nongnu.org>; Wed, 19 May 2021 10:18:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4T96VZMkZ1KnlLg5Ic8ua/tiugK4QPCAdCIRiTPIdVI=;
 b=KT9lUrXPgRFpZWpZ0v+WyzTh6ALo3wGYk6Bg5fgKlNij0C4Rc1YY0kPK83F5GESfsW
 QEf9dDg5BlBxQLrs0qws/PAYQG1ssBxwOBnFsVtPIIOOA20fx2+BaVHnoqBazQHbPRbG
 yzHHgzUz+Nvuv4mHvOfagVVOCriRpEP0GS2DY0btrN2p1KDrWcUe3WcxSSL6nfMVVDbq
 Z59qxw/zREQ7dIAMlL3jaVVXrE95iXsjPp/CcXnBh9mj+8V4A4s9iZXAy+xrx7tjUry8
 p8ClHfC0B4ZfeT029yHomHk6YGZlDyAWa+poyfgzSvxiM7TDJgJyosT8Cs66mVDHEXGH
 fTDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4T96VZMkZ1KnlLg5Ic8ua/tiugK4QPCAdCIRiTPIdVI=;
 b=X5peVzKvBDXKGj8dB9yy6HvrDat7LZQknrDhcyn3C0r5GwBP9DHY3i1n81vql/uI4d
 d761Xo9em5J2RRz+YJgXQfqxcwbkcUBKWPEHKbfWx/wkKU4NyNz/ZGT/ByFJVliXMwfV
 /Yp3Dl2+YHWoZawlCUq9NZ3IQ3CvGHEuGOqOZG0++LkuZuMM5SjPaEyy41TkaX0mrmCb
 OkQ2pJGFuVEQaSKhmoE1PC2yLuE1JMEdUXVH4q4uAlSVy3RXAwef4WafnQK9EJvbSLBr
 y4YKc3X+joJu2+jBa9xtLKWvHyG6QzNh68VueDk5y4RyEtRbY5AVc9LOTsQ+dt8KPt8k
 CSLw==
X-Gm-Message-State: AOAM533cf/u6opC8jwZ/8RVpdI1E8Hce9J266c8/DshRrJhxU9Hp/COa
 m30mlnGFYrTFF43eYXaVaaymrpN8NYs+z/1SDc9P9g==
X-Received: by 2002:ac8:6605:: with SMTP id c5mr549129qtp.21.1621444714988;
 Wed, 19 May 2021 10:18:34 -0700 (PDT)
MIME-Version: 1.0
References: <20210518194118.755410-1-venture@google.com>
 <20210518194118.755410-5-venture@google.com>
 <CACPK8XcCOTQe2ObaBP3rfbM1oe0h=E2murXyPAvGBewKV=qBdw@mail.gmail.com>
In-Reply-To: <CACPK8XcCOTQe2ObaBP3rfbM1oe0h=E2murXyPAvGBewKV=qBdw@mail.gmail.com>
From: Patrick Venture <venture@google.com>
Date: Wed, 19 May 2021 10:18:23 -0700
Message-ID: <CAO=notyU64PAS003P97hiZ+V3ShSWiF3OmBRfL5D9fOJQByjEQ@mail.gmail.com>
Subject: Re: [PATCH 4/4] aspeed: sonorapass: enable pca954x muxes
To: Joel Stanley <joel@jms.id.au>
Cc: Havard Skinnemoen <hskinnemoen@google.com>,
 Tyrone Ting <kfting@nuvoton.com>, 
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>, 
 qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>, 
 Hao Wu <wuhaotsh@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::836;
 envelope-from=venture@google.com; helo=mail-qt1-x836.google.com
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
X-TUID: DYYhVcuxeo0u

On Tue, May 18, 2021 at 4:27 PM Joel Stanley <joel@jms.id.au> wrote:
>
> On Tue, 18 May 2021 at 19:41, Patrick Venture <venture@google.com> wrote:
> >
> > Enables the pca954x muxes in the bmc board configuration.
> >
> > Signed-off-by: Patrick Venture <venture@google.com>
> > Reviewed-by: Hao Wu <wuhaotsh@google.com>
>
> Not sure about this one, there's no device tree for it in Linux.

Yeah, this was just a pick-up from grepping other BMC boards.  I added
these going off the comment alone.  I'd be okay with dropping this in
the series.

>
> > ---
> >  hw/arm/aspeed.c | 22 +++++++++++-----------
> >  1 file changed, 11 insertions(+), 11 deletions(-)
> >
> > diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
> > index 35a28b0e8b..27fd51980c 100644
> > --- a/hw/arm/aspeed.c
> > +++ b/hw/arm/aspeed.c
> > @@ -541,14 +541,16 @@ static void swift_bmc_i2c_init(AspeedMachineState *bmc)
> >
> >  static void sonorapass_bmc_i2c_init(AspeedMachineState *bmc)
> >  {
> > +    I2CSlave *i2c_mux;
> >      AspeedSoCState *soc = &bmc->soc;
> >
> >      /* bus 2 : */
> >      i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 2), "tmp105", 0x48);
> >      i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 2), "tmp105", 0x49);
> > -    /* bus 2 : pca9546 @ 0x73 */
> > +    i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 2), "pca9546", 0x73);
> >
> > -    /* bus 3 : pca9548 @ 0x70 */
> > +    /* bus 3 : */
> > +    i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 3), "pca9548", 0x70);
> >
> >      /* bus 4 : */
> >      uint8_t *eeprom4_54 = g_malloc0(8 * 1024);
> > @@ -562,7 +564,7 @@ static void sonorapass_bmc_i2c_init(AspeedMachineState *bmc)
> >      /* bus 6 : */
> >      i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 6), "tmp105", 0x48);
> >      i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 6), "tmp105", 0x49);
> > -    /* bus 6 : pca9546 @ 0x73 */
> > +    i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 6), "pca9546", 0x73);
> >
> >      /* bus 8 : */
> >      uint8_t *eeprom8_56 = g_malloc0(8 * 1024);
> > @@ -573,14 +575,12 @@ static void sonorapass_bmc_i2c_init(AspeedMachineState *bmc)
> >      /* bus 8 : adc128d818 @ 0x1d */
> >      /* bus 8 : adc128d818 @ 0x1f */
> >
> > -    /*
> > -     * bus 13 : pca9548 @ 0x71
> > -     *      - channel 3:
> > -     *          - tmm421 @ 0x4c
> > -     *          - tmp421 @ 0x4e
> > -     *          - tmp421 @ 0x4f
> > -     */
> > -
> > +    /* bus 13 : */
> > +    i2c_mux = i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 13),
> > +                                      "pca9548", 0x71);
> > +    i2c_slave_create_simple(pca954x_i2c_get_bus(i2c_mux, 3), "tmp421", 0x4c);
> > +    i2c_slave_create_simple(pca954x_i2c_get_bus(i2c_mux, 3), "tmp421", 0x4e);
> > +    i2c_slave_create_simple(pca954x_i2c_get_bus(i2c_mux, 3), "tmp421", 0x4f);
> >  }
> >
> >  static void witherspoon_bmc_i2c_init(AspeedMachineState *bmc)
> > --
> > 2.31.1.751.gd2f1c929bd-goog
> >
