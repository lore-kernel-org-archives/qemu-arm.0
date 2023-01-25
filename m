Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp689913ejc;
        Wed, 25 Jan 2023 14:07:04 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtWvxTf2M0QoePaoyH6cbgybv6dwWXZmw9C7K/wob+27T1TPC6Xcx/ZPkvu+QhEPm24ItH+
X-Received: by 2002:ac8:4d8d:0:b0:3af:f7f5:2b38 with SMTP id a13-20020ac84d8d000000b003aff7f52b38mr43947795qtw.59.1674684424576;
        Wed, 25 Jan 2023 14:07:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674684424; cv=none;
        d=google.com; s=arc-20160816;
        b=vrFGqCkojeLU2P/4U3wlJTEDSOeK55iF3jL1x9w+Vj+xhH9TixfJntqANKizH2C9/S
         fjRchoRPaf7vjGy+6huDibZFNIeY2Nwh0uhufID7NXzad2dDNeJf2Vqx12D6mrsoLntR
         qS4qxvGJg7wEJC2z+6U94U0MqDRxda48sxDAgdIixORhg1E1AU0yR/6x6sqlVoTb+c/t
         ADV1pO6/TcLgbH473teNZMKyWL9gWX48oTco5SRDMBbXfj2RqjIpsRLOwZjiiA3lsUSh
         qMXCk80TKKnXTzliiNggNrjhB9giWvGaoava0WWizdyOKSKl3dptv6VL7PLyyuRCUv7r
         IAbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :feedback-id:dkim-signature:dkim-signature;
        bh=fWOQF8QeveqlwiVl8p7yDNnr2qk1T7DXm+XUtf4RqQw=;
        b=z7W2CB/uJvwNqc4nbSTfZkkqfgAgvxC6yLqS8NXhfLchTGALsc34cvuEjMBY8/CWc2
         fkmyiBoFAXel6/4r4zTfLi8s7E30sPFHVOuefSCJ0xZ8HUXiOfR1Zvk7nwPpSM8fg2YI
         U0YVdAttBo8KXzG6e8lxGJJMSEmS7x60aThMPCUrR5dMjVmLZHvIUUn7VFEHBc0E4cCM
         wYEHfQxA173367M95RlJODkwsDpqnwvVm+Fls+ud1GWzyNxNFtrXznKKkBFKsIsI/Ia2
         nsHYbU3X4BKa3fT3V7IPRSi7BSQtwesMGM9+BiCwlpFWLTIeO8pkbBHOXtIYVAnK47Iz
         vdTw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@pjd.dev header.s=fm1 header.b=jVdPb8ZF;
       dkim=fail header.i=@messagingengine.com header.s=fm3 header.b=ecegVLYu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z2-20020ac86b82000000b003b636ff3449si4528125qts.426.2023.01.25.14.07.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 25 Jan 2023 14:07:04 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@pjd.dev header.s=fm1 header.b=jVdPb8ZF;
       dkim=fail header.i=@messagingengine.com header.s=fm3 header.b=ecegVLYu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pKnuq-0007le-3k; Wed, 25 Jan 2023 17:06:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>)
 id 1pKnuj-0007lK-PV; Wed, 25 Jan 2023 17:06:41 -0500
Received: from wout5-smtp.messagingengine.com ([64.147.123.21])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>)
 id 1pKnuh-0002Kp-Rl; Wed, 25 Jan 2023 17:06:41 -0500
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id C6BD732009C5;
 Wed, 25 Jan 2023 17:06:35 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Wed, 25 Jan 2023 17:06:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pjd.dev; h=cc:cc
 :content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm1; t=1674684395; x=1674770795; bh=fWOQF8Qeve
 qlwiVl8p7yDNnr2qk1T7DXm+XUtf4RqQw=; b=jVdPb8ZFT0Jn7hRcoquqN5PlZB
 aeCBkGYt/EzYdv2W4KN/6PS89/gZrA3L57qfe0473jnHdVKjgkn3eBk7EWwy8V4n
 BEkd7k1eE4F8KcGc2cCHD4+AAKg9BZsZNCz9GQp67WNNiiIrvTy14TYi5JRBf3Lp
 zAlZpqsIMm4fcGHTXYyPyXqOOYpMZK0vfUJ0a317/C6/zyICS09+79xc+h8Kx/Up
 aTCGdud857LuXAmVA/D+D6yQeTy9EXwTGqGMxpcJdUXYBFwNEF0eqSBgYaLZiKzS
 NGtBpErVRBEE9hzOHDkEGdrO3w5BzDdibZ3zANQs6t1WiOV5Fh7DoJLniJFQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; t=1674684395; x=1674770795; bh=fWOQF8QeveqlwiVl8p7yDNnr2qk1
 T7DXm+XUtf4RqQw=; b=ecegVLYu7RmTIX98z4Qp7DY0f48NjpYdXVFucZHyBv1p
 X12/q/hNCsUo1pBDxpQrrE+Ypfj6TMD1TcIixU0inKeNX+DWy2MRgzlgyw4SQG7Q
 J2k8tVH4U7nPI9nEXNEDQm2SxX1+uLKf91bPhgeDLt/JkxyzOO+D5huskcDBX3PT
 YVpmmAUbqF2NUPd6NZB76AEvXQY8AL1paLqgSEDXu7zWuQs/vgyWPWVcYQbQBWay
 SgScEn8bP6D8OnOJPbDNrUuLfO+FU+bbNsJ2643wyQqhAXLJQ4UytMppQ12yROnx
 AXbTUZxwWibBhNLDStLWYFUyDufA5JmD5wJuK9TsVg==
X-ME-Sender: <xms:6qfRY5fC0ILwIgnu8WVQ8NSLJouQTTok2xyQZfqvJcfQV4fitbDMaA>
 <xme:6qfRY3Og4N6stahunbEpiGk3L_61Qo8qS4ZYgOTt6AJ6hlR2l_JWfpDHu0HZX-H8m
 G_RNLaA5d-IjXDEoKo>
X-ME-Received: <xmr:6qfRYyj7L1Hy7u-kFT39GOVV0e1mocBCa-uRd6I_pcBAeKE_nM7OwEJAQz2GXpJQwMVKk4-pwZGh2jhbV-XNg3N9>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedruddvvddgudehlecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefrvght
 vghrucffvghlvghvohhrhigrshcuoehpvghtvghrsehpjhgurdguvghvqeenucggtffrrg
 htthgvrhhnpeduteeihfffleeuveekgedugfeffeehtdeguefffffhleehgfduueejjeek
 feeukeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hpvghtvghrsehpjhgurdguvghv
X-ME-Proxy: <xmx:6qfRYy9M1yqVXsZ5HzqbPRlumL74dpInR4j9iETMBKsWO2CLAQzphw>
 <xmx:6qfRY1tuteVj7l4JsQ1Y5ox_Rm9YuHZD7ddpGL5MUlYsIuqTN0vQPA>
 <xmx:6qfRYxFbMPYkA_AtqxFWk-_HwO_KKqKfX5K-xj19zGBzV2GzeDkjvA>
 <xmx:66fRY7D98wKroa47g810iylZ5_C0GQ3CSUK3QSj3HJPUv8d4UqV3Jw>
Feedback-ID: i9e814621:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 25 Jan 2023 17:06:32 -0500 (EST)
Date: Wed, 25 Jan 2023 14:06:30 -0800
From: Peter Delevoryas <peter@pjd.dev>
To: Corey Minyard <minyard@acm.org>
Cc: clg@kaod.org, peter.maydell@linaro.org, andrew@aj.id.au, joel@jms.id.au,
 hskinnemoen@google.com, kfting@nuvoton.com, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, philmd@linaro.org
Subject: Re: [PATCH v4 3/5] hw/nvram/eeprom_at24c: Add init_rom field and
 at24c_eeprom_init_rom helper
Message-ID: <Y9Gn5iLM87MKycMn@pdel-mbp.dhcp.thefacebook.com>
References: <20230118024214.14413-1-peter@pjd.dev>
 <20230118024214.14413-4-peter@pjd.dev>
 <Y9Gg15hBJ/aQgd3e@minyard.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y9Gg15hBJ/aQgd3e@minyard.net>
Received-SPF: pass client-ip=64.147.123.21; envelope-from=peter@pjd.dev;
 helo=wout5-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 1P0sZkQ/kDzC

On Wed, Jan 25, 2023 at 03:36:23PM -0600, Corey Minyard wrote:
> On Tue, Jan 17, 2023 at 06:42:12PM -0800, Peter Delevoryas wrote:
> > Allows users to specify binary data to initialize an EEPROM, allowing users to
> > emulate data programmed at manufacturing time.
> > 
> > - Added init_rom and init_rom_size attributes to TYPE_AT24C_EE
> > - Added at24c_eeprom_init_rom helper function to initialize attributes
> > - If -drive property is provided, it overrides init_rom data
> > 
> > Signed-off-by: Peter Delevoryas <peter@pjd.dev>
> > Reviewed-by: Joel Stanley <joel@jms.id.au>
> > ---
> >  hw/nvram/eeprom_at24c.c         | 37 ++++++++++++++++++++++++++++-----
> >  include/hw/nvram/eeprom_at24c.h | 16 ++++++++++++++
> >  2 files changed, 48 insertions(+), 5 deletions(-)
> > 
> > diff --git a/hw/nvram/eeprom_at24c.c b/hw/nvram/eeprom_at24c.c
> > index 98857e3626b9..f8d751fa278d 100644
> > --- a/hw/nvram/eeprom_at24c.c
> > +++ b/hw/nvram/eeprom_at24c.c
> > @@ -50,6 +50,9 @@ struct EEPROMState {
> >      uint8_t *mem;
> >  
> >      BlockBackend *blk;
> > +
> > +    const uint8_t *init_rom;
> > +    uint32_t init_rom_size;
> >  };
> >  
> >  static
> > @@ -131,19 +134,38 @@ int at24c_eeprom_send(I2CSlave *s, uint8_t data)
> >  
> >  I2CSlave *at24c_eeprom_init(I2CBus *bus, uint8_t address, uint32_t rom_size)
> >  {
> > -    I2CSlave *i2c_dev = i2c_slave_new(TYPE_AT24C_EE, address);
> > -    DeviceState *dev = DEVICE(i2c_dev);
> > +    return at24c_eeprom_init_rom(bus, address, rom_size, NULL, 0);
> > +}
> > +
> > +I2CSlave *at24c_eeprom_init_rom(I2CBus *bus, uint8_t address, uint32_t rom_size,
> > +                                const uint8_t *init_rom, uint32_t init_rom_size)
> > +{
> > +    EEPROMState *s;
> > +
> > +    s = AT24C_EE(qdev_new(TYPE_AT24C_EE));
> > +
> > +    qdev_prop_set_uint8(DEVICE(s), "address", address);
> 
> Why did you switch from using i2c_slave_new()?  Using it is more
> documentation and future-proofing than convenience.

Oh, yeah that's my bad. I was probably doing it so that all the qdev_prop_set
calls to the object are in the same place, but I probably should have just kept
i2c_slave_new() and initialized only the at24c-eeprom properties here, instead
of initializing the I2CSlave ones too.

- Peter

> 
> Other than that, looks good to me.
> 
> Reviewed-by: Corey Minyard <cminyard@mvista.com>
> 
> > +    qdev_prop_set_uint32(DEVICE(s), "rom-size", rom_size);
> >  
> > -    qdev_prop_set_uint32(dev, "rom-size", rom_size);
> > -    i2c_slave_realize_and_unref(i2c_dev, bus, &error_abort);
> > +    /* TODO: Model init_rom with QOM properties. */
> > +    s->init_rom = init_rom;
> > +    s->init_rom_size = init_rom_size;
> >  
> > -    return i2c_dev;
> > +    i2c_slave_realize_and_unref(I2C_SLAVE(s), bus, &error_abort);
> > +
> > +    return I2C_SLAVE(s);
> >  }
> >  
> >  static void at24c_eeprom_realize(DeviceState *dev, Error **errp)
> >  {
> >      EEPROMState *ee = AT24C_EE(dev);
> >  
> > +    if (ee->init_rom_size > ee->rsize) {
> > +        error_setg(errp, "%s: init rom is larger than rom: %u > %u",
> > +                   TYPE_AT24C_EE, ee->init_rom_size, ee->rsize);
> > +        return;
> > +    }
> > +
> >      if (ee->blk) {
> >          int64_t len = blk_getlength(ee->blk);
> >  
> > @@ -163,6 +185,7 @@ static void at24c_eeprom_realize(DeviceState *dev, Error **errp)
> >      }
> >  
> >      ee->mem = g_malloc0(ee->rsize);
> > +
> >  }
> >  
> >  static
> > @@ -176,6 +199,10 @@ void at24c_eeprom_reset(DeviceState *state)
> >  
> >      memset(ee->mem, 0, ee->rsize);
> >  
> > +    if (ee->init_rom) {
> > +        memcpy(ee->mem, ee->init_rom, MIN(ee->init_rom_size, ee->rsize));
> > +    }
> > +
> >      if (ee->blk) {
> >          int ret = blk_pread(ee->blk, 0, ee->rsize, ee->mem, 0);
> >  
> > diff --git a/include/hw/nvram/eeprom_at24c.h b/include/hw/nvram/eeprom_at24c.h
> > index 196db309d451..acb9857b2add 100644
> > --- a/include/hw/nvram/eeprom_at24c.h
> > +++ b/include/hw/nvram/eeprom_at24c.h
> > @@ -20,4 +20,20 @@
> >   */
> >  I2CSlave *at24c_eeprom_init(I2CBus *bus, uint8_t address, uint32_t rom_size);
> >  
> > +
> > +/*
> > + * Create and realize an AT24C EEPROM device on the heap with initial data.
> > + * @bus: I2C bus to put it on
> > + * @address: I2C address of the EEPROM slave when put on a bus
> > + * @rom_size: size of the EEPROM
> > + * @init_rom: Array of bytes to initialize EEPROM memory with
> > + * @init_rom_size: Size of @init_rom, must be less than or equal to @rom_size
> > + *
> > + * Create the device state structure, initialize it, put it on the specified
> > + * @bus, and drop the reference to it (the device is realized). Copies the data
> > + * from @init_rom to the beginning of the EEPROM memory buffer.
> > + */
> > +I2CSlave *at24c_eeprom_init_rom(I2CBus *bus, uint8_t address, uint32_t rom_size,
> > +                                const uint8_t *init_rom, uint32_t init_rom_size);
> > +
> >  #endif
> > -- 
> > 2.39.0
> > 
> > 
