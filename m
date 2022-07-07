Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp5668618lft;
        Thu, 7 Jul 2022 10:54:42 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tCKuW2WSCeckDlZp9CEscS4aqUwQ9ObwyUpbORaUJ7imqAxA36rBbY+ST5ufT5XYiVcRdN
X-Received: by 2002:a05:620a:2845:b0:6a9:b149:8d31 with SMTP id h5-20020a05620a284500b006a9b1498d31mr31880161qkp.86.1657216482620;
        Thu, 07 Jul 2022 10:54:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1657216482; cv=none;
        d=google.com; s=arc-20160816;
        b=PQa6jV/NTCkDUhs5zP9bQM1zuw1oc51D/zcx0PnFYX6dhvc8N3eyw3J5nCQBryV6nh
         /UKPt7f823fZXbetPecoIJvTBFITwjlbmeB0RuD/f/grU0/44nTccSBHGbfzbFYW2zEq
         LfZG1d/1DoibiGEh6tasBIzAc/Qmmp11WRueaHljVUvDHiVpJ/HMSCd3nQveisBYcaZy
         pNbG9pv/bQPT0MxMck+9y9b2W72bn7+QuBvR2kEJ15X8YC3IGi74O9TtTwo32+eSjdz8
         eFeVjeace5h8xY3TkIY/oKjfigaL7Cx9a5FD2yLoi5VX5Wc0l6xI9tjomYAfqFj4zK0g
         nmcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to
         :content-transfer-encoding:content-disposition:mime-version
         :references:message-id:subject:cc:to:from:date:feedback-id
         :dkim-signature:dkim-signature;
        bh=yPG/eYdVhjdJ32jsa+/xzrteYdA77S8EhopTZzDDysA=;
        b=Tk0dnSTo3ie6kuW0FbNjiFOdH/N0HrjuTIXVW8edXY7+VS3l6fDf1WOy8rKcVibs9/
         hXkaen98oO//K21PayCrLm0fV8OiezNYW/3TyxXM1lu4h3IkVa3k8eE3TQYC06vzfBqx
         ijyFjfx+xd14uQJlaA8/oR71Ad8UIuQtsdLihCqy9B169bZVsuH1tKWz2/UWB2xn0lfo
         2WCHpEAv5wVtw9GyP8f2tjb8vS2DoQ/SsKm4G6ht+8F0HwJEJpszH8aLwtCMGOU5cm2R
         I4Ve4Gm+YVXXz/+IniKp9Mvi3T2/1y7t8jK+PziK9v+b2N7JKx48Rok1+XBzB6Gi0Meo
         /ZEA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@pjd.dev header.s=fm1 header.b=aqqMAWQ0;
       dkim=fail header.i=@messagingengine.com header.s=fm3 header.b=Zp5BSb6u;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b2-20020ac85bc2000000b0031d3c082244si12360187qtb.598.2022.07.07.10.54.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 07 Jul 2022 10:54:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@pjd.dev header.s=fm1 header.b=aqqMAWQ0;
       dkim=fail header.i=@messagingengine.com header.s=fm3 header.b=Zp5BSb6u;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:44092 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o9Vi6-0001K7-4A
	for alex.bennee@linaro.org; Thu, 07 Jul 2022 13:54:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>)
 id 1o9VhU-0001JO-Q4; Thu, 07 Jul 2022 13:54:04 -0400
Received: from wnew2-smtp.messagingengine.com ([64.147.123.27]:36625)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>)
 id 1o9VhT-0002XZ-6X; Thu, 07 Jul 2022 13:54:04 -0400
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.west.internal (Postfix) with ESMTP id EED7A2B05DE3;
 Thu,  7 Jul 2022 13:54:00 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Thu, 07 Jul 2022 13:54:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pjd.dev; h=cc:cc
 :content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm1; t=1657216440; x=
 1657220040; bh=yPG/eYdVhjdJ32jsa+/xzrteYdA77S8EhopTZzDDysA=; b=a
 qqMAWQ03LjbO2nTyaWyVn3Z1FZ/hZkRX2fD7ZWqL8MMj5OFHPADtqoasEM/V0+6w
 BiCSdQmbrX3Wp5OISsQN0QZhOzS9mjcNRJ4991WARaRsWqGG5LeRqBMNgAqO1kQH
 PN+5W1cpqQqhwQnEq1aH9F3DWPeHM/FLg5wSNrneanEOUcMDvr4ft98/bPWV23UQ
 mOmWv//oF/t90t3bvG55sgEA0z5JTT/4Pv+CDbX/GMj66/wXsA7cSGBZ91xOeu9P
 ZyQpHY5YKDL92eCB/Ki2Fdn+tyEoSTeRC1P3krBSVy64s2e1uECXW3e3q8rMwvur
 98BpCr67+nHFrbFkV6vGw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1657216440; x=
 1657220040; bh=yPG/eYdVhjdJ32jsa+/xzrteYdA77S8EhopTZzDDysA=; b=Z
 p5BSb6ug7KWmdZZtnBEIW7s0hruO7vKIGravkUZBWH2TOA/EezTuiwey2WPk3XK4
 lWoT/vKVDWQ3KkQnhlPn9MFqdDaWWsuo5WQK7+Dn0tRjmZHhxSBwXWQ84oWNz2kg
 yST72v9VTl//5c5D3IU+CGMhV2qo/DbzISwi6/ghYeti4xXNilxUQUJwJQezlvN3
 M4mu+5+H+kp8Iu2ScREGwolPpGDQ5hSWHwxfCRqUZbkojxHCWwvPbc5HW2lGYTaw
 tAACJ3mPb1e/6AEoA2fVZT8O9AicQWesceAEQ4f/L/Fk32zJZ1+QD7wJkgtAsvn9
 380GsPTdFwiT1YVKReKJw==
X-ME-Sender: <xms:uB3HYrCkoIfCpnQKuNVSQbPNusgGHVPCExJl-u5HQ9Mw8Q5spcO5YA>
 <xme:uB3HYhhbks13Usi8s5W2fk_V2yezAdSa55rlC9Ehtbz5akAZ5GPg7T9erkkvxAbnd
 uYOWLigKYm4RcyGNX8>
X-ME-Received: <xmr:uB3HYmmxqMbrWY7jLdIfLDGf2sgKGV3IA_hwmY2PoLtTE3Q9WOaf0Gf0Rihl>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudeihedguddulecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvvefukfhfgggtugfgjgesthekredttddtudenucfhrhhomheprfgv
 thgvrhcuffgvlhgvvhhorhihrghsuceophgvthgvrhesphhjugdruggvvheqnecuggftrf
 grthhtvghrnhephfegffevudefveetgeekteeijefhhfduueejvdegvdehffehjeevtefh
 hffffeeunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 epphgvthgvrhesphhjugdruggvvh
X-ME-Proxy: <xmx:uB3HYtxL5wS69vW0uqkZyrbryWwwQXG2FcGuQp-qDCnMoOZkE2UMSg>
 <xmx:uB3HYgS5ttfbrLFajU48x9zheS6nCQ0q3r0uziXmt1r8DgsDdxQWWQ>
 <xmx:uB3HYgb7nIvt1kIdwzw9oAImEMmQ31qsv7qAPHii0iRb1Ye9dveuaA>
 <xmx:uB3HYmO0abUxMG25DcY_iFxqTAxJ5gkEA4wXY70N3gphgbwrPRxA_2zVN88>
Feedback-ID: i9e814621:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 7 Jul 2022 13:53:59 -0400 (EDT)
Date: Thu, 7 Jul 2022 10:53:57 -0700
From: Peter Delevoryas <peter@pjd.dev>
To: =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Andrew Jeffery <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [PATCH 1/2] hw/gpio/aspeed: Don't let guests modify input pins
Message-ID: <YscdtXYL5sJRSm6Z@pdel-mbp>
References: <20220707071731.34047-1-peter@pjd.dev>
 <20220707071731.34047-2-peter@pjd.dev>
 <fa52743a-5730-3b3f-f07f-99931bb66b01@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fa52743a-5730-3b3f-f07f-99931bb66b01@kaod.org>
Received-SPF: pass client-ip=64.147.123.27; envelope-from=peter@pjd.dev;
 helo=wnew2-smtp.messagingengine.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FROM_FMBLA_NEWDOM14=0.998, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
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
X-TUID: 5y1mytBz1YUr

On Thu, Jul 07, 2022 at 10:56:02AM +0200, Cédric Le Goater wrote:
> On 7/7/22 09:17, Peter Delevoryas wrote:
> > It seems that aspeed_gpio_update is allowing the value for input pins to be
> > modified through register writes and QOM property modification.
> > 
> > The QOM property modification is fine, but modifying the value through
> > register writes from the guest OS seems wrong if the pin's direction is set
> > to input.
> > 
> > The datasheet specifies that "0" bits in the direction register select input
> > mode, and "1" selects output mode.
> > 
> > OpenBMC userspace code is accidentally writing 0's to the GPIO data
> > registers somewhere (or perhaps the driver is doing it through a reset or
> > something), and this is overwriting GPIO FRU information (board ID, slot
> > presence pins) that is initialized in Aspeed machine reset code (see
> > fby35_reset() in hw/arm/aspeed.c).
> 
> It might be good to log a GUEST_ERROR in that case, when writing to an
> input GPIO and when reading from an output GPIO.

Good idea, I'll include a GUEST_ERROR for writing to an input GPIO.

I'm actually not totally certain about emitting an error when reading from an
output GPIO, because the driver can only do 8-bit reads at the finest
granularity, and if 1 of the 8 pins' direction is output, then it will be
reading the value of an output pin. But, that's not really bad, because
presumably the value will be ignored. Maybe I can go test this out on
hardware and figure out what happens though.

Thanks,
Peter

> 
> Thanks,
> 
> C.
> 
> > 
> > Signed-off-by: Peter Delevoryas <peter@pjd.dev>
> > Fixes: 4b7f956862dc ("hw/gpio: Add basic Aspeed GPIO model for AST2400 and AST2500")
> > ---
> >   hw/gpio/aspeed_gpio.c | 22 ++++++++++++----------
> >   1 file changed, 12 insertions(+), 10 deletions(-)
> > 
> > diff --git a/hw/gpio/aspeed_gpio.c b/hw/gpio/aspeed_gpio.c
> > index a62a673857..2eae427201 100644
> > --- a/hw/gpio/aspeed_gpio.c
> > +++ b/hw/gpio/aspeed_gpio.c
> > @@ -268,7 +268,7 @@ static ptrdiff_t aspeed_gpio_set_idx(AspeedGPIOState *s, GPIOSets *regs)
> >   }
> >   static void aspeed_gpio_update(AspeedGPIOState *s, GPIOSets *regs,
> > -                               uint32_t value)
> > +                               uint32_t value, bool force)
> >   {
> >       uint32_t input_mask = regs->input_mask;
> >       uint32_t direction = regs->direction;
> > @@ -293,10 +293,12 @@ static void aspeed_gpio_update(AspeedGPIOState *s, GPIOSets *regs,
> >               }
> >               /* ...then update the state. */
> > -            if (mask & new) {
> > -                regs->data_value |= mask;
> > -            } else {
> > -                regs->data_value &= ~mask;
> > +            if (direction & mask || force) {
> > +                if (mask & new) {
> > +                    regs->data_value |= mask;
> > +                } else {
> > +                    regs->data_value &= ~mask;
> > +                }
> >               }
> >               /* If the gpio is set to output... */
> > @@ -339,7 +341,7 @@ static void aspeed_gpio_set_pin_level(AspeedGPIOState *s, uint32_t set_idx,
> >           value &= ~pin_mask;
> >       }
> > -    aspeed_gpio_update(s, &s->sets[set_idx], value);
> > +    aspeed_gpio_update(s, &s->sets[set_idx], value, true);
> >   }
> >   /*
> > @@ -653,7 +655,7 @@ static void aspeed_gpio_write_index_mode(void *opaque, hwaddr offset,
> >           reg_value = update_value_control_source(set, set->data_value,
> >                                                   reg_value);
> >           set->data_read = reg_value;
> > -        aspeed_gpio_update(s, set, reg_value);
> > +        aspeed_gpio_update(s, set, reg_value, false);
> >           return;
> >       case gpio_reg_idx_direction:
> >           reg_value = set->direction;
> > @@ -753,7 +755,7 @@ static void aspeed_gpio_write_index_mode(void *opaque, hwaddr offset,
> >               __func__, offset, data, reg_idx_type);
> >           return;
> >       }
> > -    aspeed_gpio_update(s, set, set->data_value);
> > +    aspeed_gpio_update(s, set, set->data_value, false);
> >       return;
> >   }
> > @@ -799,7 +801,7 @@ static void aspeed_gpio_write(void *opaque, hwaddr offset, uint64_t data,
> >           data &= props->output;
> >           data = update_value_control_source(set, set->data_value, data);
> >           set->data_read = data;
> > -        aspeed_gpio_update(s, set, data);
> > +        aspeed_gpio_update(s, set, data, false);
> >           return;
> >       case gpio_reg_direction:
> >           /*
> > @@ -875,7 +877,7 @@ static void aspeed_gpio_write(void *opaque, hwaddr offset, uint64_t data,
> >                         PRIx64"\n", __func__, offset);
> >           return;
> >       }
> > -    aspeed_gpio_update(s, set, set->data_value);
> > +    aspeed_gpio_update(s, set, set->data_value, false);
> >       return;
> >   }
> 
