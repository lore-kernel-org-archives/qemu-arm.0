Received: by 2002:a19:ca1d:0:0:0:0:0 with SMTP id a29csp3654509lfg;
        Sun, 27 Jun 2021 21:50:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzE8XFBtYBwBVaV4oNwUNMEo0uTnN6gYLfPM3y/PxJrucZGZysMk/d4PoTyMOEvd5afDSXN
X-Received: by 2002:a05:6214:a46:: with SMTP id ee6mr23474020qvb.42.1624855811329;
        Sun, 27 Jun 2021 21:50:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1624855811; cv=none;
        d=google.com; s=arc-20160816;
        b=Sh5dm3ufyUn5F7IS27kotjXUd6OzfSbfmINkFCgQBmHqS9QThOh6OVwKeZD3l+UZo6
         ET+8XINz/r5KkkePe7hjBTRM10OdKSdcPMSX46wxW/AIvLQ9/nlmzX8mxxe7HYVBKuD8
         K+HLkXWgtOVcSMhT2Lmpn6Bys1qZDwPdYXG/JdbYp9AHeg90boOIf3G/Ep2E7bdluuHC
         U6Ne0TPdvPLxPNsVe8IwPpR/JXlWjoUjtdmjTJo3A0Q4YyA9PHal5VZhJVH8Z+x8rxf5
         BgPrCxfFz7yIB6VeRiwrLbjHOhGUj/HCpowwAx3EZdKiRjPiJ/dlD/mmwgFFSQk8xB5/
         192A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Jj+x9ScZPbTVAVuu3vzDmyMEPihcFw7uEui7XmF32x8=;
        b=kJHx+kGt1PnV1kpO6zOYg4Q5CfRdZKXjnY4cw1cWPQTjVGpdkxRLG1pBNNU1GfCzXH
         HhhywvzHnguKu8LYILj+TH5xnD1kMbBe/yU9Y0fxypjMR1O9KY35nBZ+BZq+dzEwXG5I
         Ya+4DiWsaqCFWnwnQZ2AKMTqL/NgvHbASbVw2LeNpGPJ5tVH4knmWj0Cz4yjBjomwnhu
         Q3mZuxaFah4o2/KIhHP5Ueh+X1eMzw9ERin/cQQowD7TZLQsvAk0DrPlKaABiOn1W/nT
         /+2Vi7JaCaqhQHvbvjH63JpheSohNJi2JLGkadzuC3A8XP75leMhn+OajUIl8Xjh1hw0
         NY+g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@jms.id.au header.s=google header.b=aW1tWLOl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bj10si10103104qkb.13.2021.06.27.21.50.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 27 Jun 2021 21:50:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@jms.id.au header.s=google header.b=aW1tWLOl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:56716 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lxjDm-0005Rb-IN
	for alex.bennee@linaro.org; Mon, 28 Jun 2021 00:50:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57420)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1lxjDM-0005RL-99; Mon, 28 Jun 2021 00:49:44 -0400
Received: from mail-qv1-xf2f.google.com ([2607:f8b0:4864:20::f2f]:43901)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1lxjDK-0000uS-2Y; Mon, 28 Jun 2021 00:49:43 -0400
Received: by mail-qv1-xf2f.google.com with SMTP id w5so529985qvu.10;
 Sun, 27 Jun 2021 21:49:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Jj+x9ScZPbTVAVuu3vzDmyMEPihcFw7uEui7XmF32x8=;
 b=aW1tWLOlu2XG6LsPn5T6UmdbI1Ot3iXDZdsnsDJ/VCNvDk7IFERb61KsDoGv1Pkh89
 M1mLPQnAIsf9Y0Nt2ux6uPsEWYnyOPsXDIyq8nAydwSkdflSP9ajqqUb90gibB1p5Yya
 nKud943CIkJPjTEfaORnAB7NuNWn0m4VE4AeY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Jj+x9ScZPbTVAVuu3vzDmyMEPihcFw7uEui7XmF32x8=;
 b=uL2MXNvkLEKJoLaRuQd4+41WhKejbP7yS4eZ5/aTzcVX8Qbv0pxKcXTWQgqlWfg5c8
 SYGgBf1d75rTcNFh2qza8x7PbV1Gs8U3EYTdfVRqY3qWvmNsgRutqqNBrq3rCm/x7lBW
 2fnXTO8LzQ/EURJs/DvIMXNQ5RzXqeaxsXRuaQPpifmWzA1H/cpqz12paR4HZEk2JrRJ
 /kX3Ka/PYxuJhYJK9XwlV9RLbx3vnn7L5OO8GwsYNj3MCpe9bXdlZ7i2nrQ/k8rch5QR
 t+HUtculuhPTi3z6yJZpCTa6BaH1oStwQvkA1B1NAo73c2SUJvBqt3VqqiJpH7cnL+nF
 9hCg==
X-Gm-Message-State: AOAM531CYwWbsuia9CimCEERI1/isNdI5tqGZKSVToBdDRNm7oWjJzYB
 DkZROviSRd4c8ubDtwJ+QRYMDyMKYXsaDA0Z4xU=
X-Received: by 2002:a0c:e94c:: with SMTP id n12mr23813787qvo.61.1624855780208; 
 Sun, 27 Jun 2021 21:49:40 -0700 (PDT)
MIME-Version: 1.0
References: <20210625050643.161042-1-joel@jms.id.au>
 <aea5f8fe-438b-4c11-96c4-21c7e361778d@www.fastmail.com>
In-Reply-To: <aea5f8fe-438b-4c11-96c4-21c7e361778d@www.fastmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 28 Jun 2021 04:49:27 +0000
Message-ID: <CACPK8Xfrm-hT9iST2HjHMEJa50mgWYPKX4ijApqXLP=jSAXOKA@mail.gmail.com>
Subject: Re: [PATCH] arm/aspeed: rainier: Add i2c eeproms and muxes
To: Andrew Jeffery <andrew@aj.id.au>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2f;
 envelope-from=joel.stan@gmail.com; helo=mail-qv1-xf2f.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Cameron Esfahani via <qemu-devel@nongnu.org>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Patrick Venture <venture@google.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: gqbRoxzdy/aF

On Mon, 28 Jun 2021 at 04:33, Andrew Jeffery <andrew@aj.id.au> wrote:
>
>
>
> On Fri, 25 Jun 2021, at 14:36, Joel Stanley wrote:
> > These are the devices documented by the Rainier device tree. With this
> > we can see the guest discovering the multiplexers and probing the eeprom
> > devices:
> >
> >  i2c i2c-2: Added multiplexed i2c bus 16
> >  i2c i2c-2: Added multiplexed i2c bus 17
> >  i2c i2c-2: Added multiplexed i2c bus 18
> >  i2c i2c-2: Added multiplexed i2c bus 19
> >  i2c-mux-gpio i2cmux: 4 port mux on 1e78a180.i2c-bus adapter
> >  at24 20-0050: 8192 byte 24c64 EEPROM, writable, 1 bytes/write
> >  i2c i2c-4: Added multiplexed i2c bus 20
> >  at24 21-0051: 8192 byte 24c64 EEPROM, writable, 1 bytes/write
> >  i2c i2c-4: Added multiplexed i2c bus 21
> >  at24 22-0052: 8192 byte 24c64 EEPROM, writable, 1 bytes/write
> >
> > Signed-off-by: Joel Stanley <joel@jms.id.au>
> > ---
> >  hw/arm/aspeed.c | 56 +++++++++++++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 56 insertions(+)
> >
> > diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
> > index 1301e8fdffb2..7ed22294c6eb 100644
> > --- a/hw/arm/aspeed.c
> > +++ b/hw/arm/aspeed.c
> > @@ -677,6 +677,10 @@ static void g220a_bmc_i2c_init(AspeedMachineState *bmc)
> >  static void rainier_bmc_i2c_init(AspeedMachineState *bmc)
> >  {
> >      AspeedSoCState *soc = &bmc->soc;
> > +    I2CSlave *i2c_mux;
> > +
> > +    smbus_eeprom_init_one(aspeed_i2c_get_bus(&soc->i2c, 0), 0x51,
> > +                          g_malloc0(32 * 1024));
> >
> >      /* The rainier expects a TMP275 but a TMP105 is compatible */
> >      i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 4), TYPE_TMP105,
> > @@ -685,11 +689,25 @@ static void rainier_bmc_i2c_init(AspeedMachineState *bmc)
> >                       0x49);
> >      i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 4), TYPE_TMP105,
> >                       0x4a);
> > +    i2c_mux = i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 4),
> > +                                      "pca9546", 0x70);
> > +    smbus_eeprom_init_one(pca954x_i2c_get_bus(i2c_mux, 0), 0x50,
> > +                          g_malloc0(64 * 1024));
>
> The EEPROMs described in the Rainier devicetree are Atmel AT2x devices and
> not SMBus EEPROMs. The SMBus EEPROM model uses SMBus block reads and
> writes which are not what the AT2x driver issues. If you try to read or
> write data under Linux from the EEPROMs in this patch you just get
> corrupt results. So as far as I can see the patch needs to be reworked.

That's fine, these are just there so the drivers can probe. As you can
see the devices have no data in them either, so it's nowhere near an
incomplete model.

If you want to extend the modelling to have the correct VPD data, and
allow writes where applicable, that would be welcome.

Cheers,

Joel
