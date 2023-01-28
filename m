Received: by 2002:a17:906:a8d:b0:883:7228:2f81 with SMTP id y13csp57414ejf;
        Fri, 27 Jan 2023 21:04:16 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsco0Cv4bAbuM8cKIscScnYf6S3P3nlw3NtlziLe1OY8WO/HKvccW4Si+/FbS7PjZCUJ/Q1
X-Received: by 2002:ac8:4703:0:b0:3a5:4064:9fd3 with SMTP id f3-20020ac84703000000b003a540649fd3mr61090493qtp.24.1674882255973;
        Fri, 27 Jan 2023 21:04:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674882255; cv=none;
        d=google.com; s=arc-20160816;
        b=DHU1A+5uT+cwTSjNfce5KSON/C5B00KcmoRzDSDxw2GwoFAMF5eLdFfihC9tKA+Rp0
         SUIx5Zuo0dwJ4Im7pwMJLtpNQv+eJNQRlYEEDvAI7Rt+UR3PeI4p9Lg8GRp+6e3ETXCo
         YbXkruwxF3aU7Tj3MHSu1n/ZsJ/8XnJKuP0iI+n+vOxgGEKg64oCGJUfvM/hA82uKAEg
         XhrcJ71dEAFO6Fj3x7xLB2tKXaeEUUTDtxZ9cujYscNqvDEU0McOcP3rxC4t1OdVFMuk
         EorZCaaiM0p/0ZoWdwLY25pYhSHFQBx6q6aTZYtuaAOWXdH6FTEY+gJuTw7dAF1WfbQg
         SavQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to
         :content-transfer-encoding:content-disposition:mime-version
         :references:message-id:subject:cc:to:from:date:feedback-id
         :dkim-signature:dkim-signature;
        bh=U8MxqB7Mh6dx8dUyfYs7VXbLoKImqkYd8hZs8FVw2UY=;
        b=kWKkJoSZAvn2ed8gAS4QaZhaETnwgNUzTQlSEXQ4F/ikTm0tnqcF+gnvPc31tD85XY
         lv+J7d5s/EZjNxEULY52NZMHDO7x8UCCNmaR6IcuskqPIXl9fK+0gmOFSLNXZUuAeU9L
         AtiESO/Ua5e2K3xnRpIsKi8jlunjpk2tGQI1UbtmHfk4BWM/VdwBjGl+72m8iTm+tydm
         wUvjQudHu2/auInEB6n2v+37b5QQToshZAauwpHD98CZSg6EPWQGcHeqGzLxPgaQ/KqU
         qxWTRiBHGNl/WAXfwqo4zvuu+RhpDCU2p3jLtL4Qxm07Eur/VW36cwzZJUuFMdLlvdcF
         7/2Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@pjd.dev header.s=fm1 header.b="IB+IoE/0";
       dkim=fail header.i=@messagingengine.com header.s=fm3 header.b=aCVqRscY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p13-20020a05622a00cd00b003a55b624080si3857031qtw.48.2023.01.27.21.04.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 27 Jan 2023 21:04:15 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@pjd.dev header.s=fm1 header.b="IB+IoE/0";
       dkim=fail header.i=@messagingengine.com header.s=fm3 header.b=aCVqRscY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pLdNY-0002To-RK; Sat, 28 Jan 2023 00:03:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>)
 id 1pLdNX-0002Ta-IN; Sat, 28 Jan 2023 00:03:51 -0500
Received: from out1-smtp.messagingengine.com ([66.111.4.25])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>)
 id 1pLdNV-0006QI-QY; Sat, 28 Jan 2023 00:03:51 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 12CEB5C06B1;
 Sat, 28 Jan 2023 00:03:47 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Sat, 28 Jan 2023 00:03:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pjd.dev; h=cc:cc
 :content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm1; t=1674882227; x=
 1674968627; bh=U8MxqB7Mh6dx8dUyfYs7VXbLoKImqkYd8hZs8FVw2UY=; b=I
 B+IoE/0zkJEooM4PAYyNjDzUV4TIQbhdOlksQt9iBqkoSRanmcUZAXTvfq+JQHda
 t/QLfZO5hYGpiTCnp56U3Nt4pednCa3pETBKR1JcfAChcpc9/gSjSawwuBbLzuKH
 Apasx7r4imRq/6rqTRc7OgbhO4Ry6kvfvF8V5f4d9on5j5x/b3c3qk6MHo91gBzQ
 qUkHL4E6fSHbnKHc7O4lIyN+5Ebfp0BJ3o9S5nhv7Ni/NJMk2G34e50aNV47xubg
 PLk+v6VDPGPzRrbtjL4Ub7kiJ48lI5iLay/NOaJumFW00hdQM2B287cxo850kzS1
 Gh7yOymhDcOh5BxhgJUWw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1674882227; x=
 1674968627; bh=U8MxqB7Mh6dx8dUyfYs7VXbLoKImqkYd8hZs8FVw2UY=; b=a
 CVqRscYghIybpgXHEBRk/GfRawnNXjSinf4RAY6knWr2svklWsaB9kIFtz9i+Pr+
 dKV1A3nSq2FG2wc1P03Lv3no/IExnuSa0hbK74u5c+drY3fda80daz38AHryBW1h
 DTUSVvewhWk+r+jaSvgLbMnttz/FDYUm7AEngMmnWiEmlP2gTM/z7kUKKjvO8R4C
 Wv9pxzFH7VA+QqiBT604uZ5MQf0q64U73jL3b+xclAzDY58rd/mGgINkrOgQhevo
 Ujc5PxwM3X4TGBI25+0Zt0uhh7G9ly8XdLbim+qBRLWFPaOLHuqZZDV3/+uESqPf
 KQVkWwRra5U4qC7VS+/Gg==
X-ME-Sender: <xms:sqzUYyb-A4XUTgMIcm0b6jUTbf4fx2tLsLY9xjg5agfg8xMHWwJ7Mw>
 <xme:sqzUY1Z2B8CVDTwdlggDYRyiWXy8JAuqA3Sw2u-UdvKzm4PM_EF5uFlCZo_3EqOz7
 cAvwchNrYfODJVXy9U>
X-ME-Received: <xmr:sqzUY8_-JhrUVva1YEy9-0BJuYxCQfGaY6Dy9StQyfphXCWB6822ozT4dPbRPAMND7ZcN0hp6qJFEPsNhUFrvQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedruddvjedgkedtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggugfgjsehtkeertddttddunecuhfhrohhmpefrvght
 vghrucffvghlvghvohhrhigrshcuoehpvghtvghrsehpjhgurdguvghvqeenucggtffrrg
 htthgvrhhnpefhgeffvedufeevteegkeetieejhffhudeujedvgedvheffheejveethffh
 ffefueenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hpvghtvghrsehpjhgurdguvghv
X-ME-Proxy: <xmx:sqzUY0rkP9mHFewaWpBUkKH9mydBffg7fvhlxFuT1L2tbsLIHeH4mw>
 <xmx:sqzUY9pzysP5uEAaHFDTlcb6xazlUvEfK0jo3YNWgoU7y5l7uUn0Iw>
 <xmx:sqzUYyTMJ5uRDD0ewDRfUtmud6sfFgEfyOAxjtXG3iix3tyWLJwwMQ>
 <xmx:s6zUYxc5Xz_lMdEbEujDHeTmrauECmmpPXpftSfQ8Ku7bamxCEHa7Q>
Feedback-ID: i9e814621:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 28 Jan 2023 00:03:44 -0500 (EST)
Date: Fri, 27 Jan 2023 21:03:38 -0800
From: Peter Delevoryas <peter@pjd.dev>
To: =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
Cc: Corey Minyard <minyard@acm.org>, peter.maydell@linaro.org,
 andrew@aj.id.au, joel@jms.id.au, hskinnemoen@google.com,
 kfting@nuvoton.com, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 philmd@linaro.org
Subject: Re: [PATCH v4 3/5] hw/nvram/eeprom_at24c: Add init_rom field and
 at24c_eeprom_init_rom helper
Message-ID: <Y9SsquT1kNVJLesl@pdel-mbp.dhcp.thefacebook.com>
References: <20230118024214.14413-1-peter@pjd.dev>
 <20230118024214.14413-4-peter@pjd.dev>
 <Y9Gg15hBJ/aQgd3e@minyard.net>
 <Y9Gn5iLM87MKycMn@pdel-mbp.dhcp.thefacebook.com>
 <b10fb5c2-5d3c-e4c0-431c-0842f0b00bb8@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b10fb5c2-5d3c-e4c0-431c-0842f0b00bb8@kaod.org>
Received-SPF: pass client-ip=66.111.4.25; envelope-from=peter@pjd.dev;
 helo=out1-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: QXx+6ygDlFGD

On Fri, Jan 27, 2023 at 08:42:40AM +0100, Cédric Le Goater wrote:
> > > >   I2CSlave *at24c_eeprom_init(I2CBus *bus, uint8_t address, uint32_t rom_size)
> > > >   {
> > > > -    I2CSlave *i2c_dev = i2c_slave_new(TYPE_AT24C_EE, address);
> > > > -    DeviceState *dev = DEVICE(i2c_dev);
> > > > +    return at24c_eeprom_init_rom(bus, address, rom_size, NULL, 0);
> > > > +}
> > > > +
> > > > +I2CSlave *at24c_eeprom_init_rom(I2CBus *bus, uint8_t address, uint32_t rom_size,
> > > > +                                const uint8_t *init_rom, uint32_t init_rom_size)
> > > > +{
> > > > +    EEPROMState *s;
> > > > +
> > > > +    s = AT24C_EE(qdev_new(TYPE_AT24C_EE));
> > > > +
> > > > +    qdev_prop_set_uint8(DEVICE(s), "address", address);
> > > 
> > > Why did you switch from using i2c_slave_new()?  Using it is more
> > > documentation and future-proofing than convenience.
> > 
> > Oh, yeah that's my bad. I was probably doing it so that all the qdev_prop_set
> > calls to the object are in the same place, but I probably should have just kept
> > i2c_slave_new() and initialized only the at24c-eeprom properties here, instead
> > of initializing the I2CSlave ones too.
> 
> Will you send a v5 ?

Oh! Yeah sure: I thought I had already missed the boat because I thought you
sent a pull request, but I see that it hasn't been pulled yet.

- Peter

> 
> Thanks,
> 
> C.
