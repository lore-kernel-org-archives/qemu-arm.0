Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp2795894ejc;
        Tue, 17 Jan 2023 14:26:19 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtFS4WCeDKvJOi8jRjwastVZVkHLDzDx9wFcAp6H/Lqk5NIe7YUEpC2z6f+9wdEzixjZmbq
X-Received: by 2002:a05:6214:2c20:b0:531:bde2:365a with SMTP id lc32-20020a0562142c2000b00531bde2365amr6413025qvb.7.1673994378821;
        Tue, 17 Jan 2023 14:26:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673994378; cv=none;
        d=google.com; s=arc-20160816;
        b=SAyF2lfLve9KRpI3PPfrW//XKJwekF9EwYWnhm7RbeIY9osXrbI+oihCHKbHxV1HFZ
         Otd5X7jaT5cYzKp1EDJ8qH5cicy+ZfKJhHjjrZ4s7QlAeWRO9ckdnwbCG809G0i1Ag0L
         PKNcfd93lb4YpEezXGluIoV9R/Js4qN9qNfjeY7ABTm65MZ4F6th5ESySOcC99FLGiZx
         Dhje8096I5K+EJh/yzDsO0NJUV3xcZcTS12m+HJ9JyFwSGRRg3kTHSNLMQ/WnGyRiaex
         5CkmvP77GiCRz/pHrNK4wFebVWobMoxKdOu1D9dW4LtWdCaUll432LiFGsuEPWXeCCUh
         dUHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to
         :content-transfer-encoding:content-disposition:mime-version
         :references:message-id:subject:cc:to:from:date:feedback-id
         :dkim-signature:dkim-signature;
        bh=o73WOcQWWADvNjkMxraihqIIuTE6assTpPlTpC/nFck=;
        b=XkQ5s6YGmWKWy5StJIoRJg0lcQhMxUaSqWgo9+QpzcOu7AzaTX82U9thsld4Pb6FZm
         B4z1se9LGwW4UAuzQoVwww5bVs7d644oM7vSh2jalvk8uQioiSIN3lYAMAqhFsNsBXX7
         dm5j2OhjyFKrsN8vIVg6caIgOX39DprNBvW41wQU8obVJBqNMQ08r+wnCusItRUF18lv
         W+qR1Ms54yfpspEmH0WGdfap5H0ZEvlvJH8ysgPXLu94qdAInsapRSb56E7M53Msvgro
         Cv+OYVwVI/3ywCH7dYEZdZhtr0PLltacOcxWSWjT/nzvs5XWOh2DTi2jzKOn4IX3is+Y
         uqGA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@pjd.dev header.s=fm1 header.b=qgX2WB+x;
       dkim=fail header.i=@messagingengine.com header.s=fm3 header.b=N69Y1rle;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m8-20020a0562141bc800b00534bc467b0asi6252085qvc.525.2023.01.17.14.26.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 17 Jan 2023 14:26:18 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@pjd.dev header.s=fm1 header.b=qgX2WB+x;
       dkim=fail header.i=@messagingengine.com header.s=fm3 header.b=N69Y1rle;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pHuPC-0007AX-1s; Tue, 17 Jan 2023 17:26:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>)
 id 1pHuPB-0007AM-7E; Tue, 17 Jan 2023 17:26:09 -0500
Received: from out1-smtp.messagingengine.com ([66.111.4.25])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>)
 id 1pHuP6-0002RR-EM; Tue, 17 Jan 2023 17:26:08 -0500
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id 083625C00EC;
 Tue, 17 Jan 2023 17:26:03 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Tue, 17 Jan 2023 17:26:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pjd.dev; h=cc:cc
 :content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm1; t=1673994363; x=
 1674080763; bh=o73WOcQWWADvNjkMxraihqIIuTE6assTpPlTpC/nFck=; b=q
 gX2WB+xzyHPaH3nkZnGQWCIET1pmmddAanqXCvV/S8X/cKL50mkR/bEY/uEgqFRL
 ZyUUjDJPJ7XpS46Xhm4RafH90WPoORFgXRVkJtlySTkjny2aLadjoAPYDrsBsYQw
 2t+I3bZLXYjx4UtxbHdIfFxsniFIOUO3gW8VvEn5xJvfg23SRUKGnyPtMQUkI43F
 whOYJGVcZjgP1kDfbDcmwkgd+ygw9NIJt/hnwoaNOUKeYkBJsSk7Gybh6AAaVhz9
 9DmhXFve47a5H0OYMktVZAPagB2A4YhjgDFXX8LkFM+ZmO3kUSDr25kds6Df9YsI
 glDB4O/UI8QU3YaVbjNEA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1673994363; x=
 1674080763; bh=o73WOcQWWADvNjkMxraihqIIuTE6assTpPlTpC/nFck=; b=N
 69Y1rlefX8csVxZp9IhBVl2h6zLX7t+lG/mA6lc4MGS/22HKZ1+RmsjBqKwxsOJ/
 UPTIFa0LlMCgSYhUWCPESTZ/NMvz9ElFe2eGiP5LWohYN/K4E51+cru9bGfarGrZ
 +TrwA0jsQhhDlJsKiDVjzck/9n7V1q+gTzF1UL4PuUeBLE7TkSkZ/Q2Wj/kb618I
 zxPH5O7YiHKyoCjf0WINwp8mOBat0MsWzhm/hO1Zt3iWSoLS4d7UYeHfSba4gYnv
 tNjCm2ddvKEFaigiC2K2UD1cfNa+oT0uhgVWTMi1V6IA6613oVUp2jJYkpgecYg4
 JdCaXjijt2g3Wd0L6iODw==
X-ME-Sender: <xms:eiDHYzsn9FGnVl7Ni-IA19HreMRTORlDcVik57Yae76CCKJef8qfyg>
 <xme:eiDHY0fSjdzFD-TuuBguFYkCYo2ah7GnyY2R_DXbQQUsRf9_tDODCxNjfHNKrPcG8
 Pajo0aIPxez4y8JpRE>
X-ME-Received: <xmr:eiDHY2yqIrZ9mqluhslDCHimN8i6aQw9DDgsP2iiIz2JtAtCc8eTj2WPoaarLbnIJmxlpr5r8zWxkQCDHVhXRg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedruddtiedgudeitdcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvvefukfhfgggtugfgjgesthekredttddtudenucfhrhhomheprfgv
 thgvrhcuffgvlhgvvhhorhihrghsuceophgvthgvrhesphhjugdruggvvheqnecuggftrf
 grthhtvghrnhephfegffevudefveetgeekteeijefhhfduueejvdegvdehffehjeevtefh
 hffffeeunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 epphgvthgvrhesphhjugdruggvvh
X-ME-Proxy: <xmx:eiDHYyMEU7qyaTvlRnP88kvWb0B5o5ICxkn0D1J8hblthJX7PWexQQ>
 <xmx:eiDHYz_5l1E5dr9XmuIBwAEWBHafAS1qPjk_CER58NtsWt1IoF38HA>
 <xmx:eiDHYyVWnjAlzoAUu4tLNsE_TQSTde0EjfjKiwxpTgaBwQFvcD9ViQ>
 <xmx:eyDHY0N8PPZExlX8wJ5mZ2h41qQe6OGD1HFVufLTInJrhfBnPNPWmQ>
Feedback-ID: i9e814621:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 17 Jan 2023 17:26:01 -0500 (EST)
Date: Tue, 17 Jan 2023 14:25:58 -0800
From: Peter Delevoryas <peter@pjd.dev>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>
Cc: clg@kaod.org, peter.maydell@linaro.org, andrew@aj.id.au, joel@jms.id.au,
 hskinnemoen@google.com, kfting@nuvoton.com, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Subject: Re: [PATCH v2 1/5] hw/arm: Extract at24c_eeprom_init helper from
 Aspeed and Nuvoton boards
Message-ID: <Y8cgdqG5TGJHaDRv@pdel-mbp.dhcp.thefacebook.com>
References: <20230116235604.55099-1-peter@pjd.dev>
 <20230116235604.55099-2-peter@pjd.dev>
 <961515e6-65ad-ec7f-f51e-a862424f574d@linaro.org>
 <Y8bprzjwzIRXej60@pdel-mbp>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Y8bprzjwzIRXej60@pdel-mbp>
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
X-TUID: 9X083SD/bTtI

On Tue, Jan 17, 2023 at 10:32:15AM -0800, Peter Delevoryas wrote:
> On Tue, Jan 17, 2023 at 09:00:34AM +0100, Philippe Mathieu-Daudé wrote:
> > On 17/1/23 00:56, Peter Delevoryas wrote:
> > > This helper is useful in board initialization because lets users initialize and
> > > realize an EEPROM on an I2C bus with a single function call.
> > > 
> > > Signed-off-by: Peter Delevoryas <peter@pjd.dev>
> > > ---
> > >   hw/arm/aspeed.c                 | 10 +---------
> > >   hw/arm/npcm7xx_boards.c         | 20 +++++---------------
> > >   hw/nvram/eeprom_at24c.c         | 12 ++++++++++++
> > >   include/hw/nvram/eeprom_at24c.h | 10 ++++++++++
> > >   4 files changed, 28 insertions(+), 24 deletions(-)
> > >   create mode 100644 include/hw/nvram/eeprom_at24c.h
> > 
> > > diff --git a/include/hw/nvram/eeprom_at24c.h b/include/hw/nvram/eeprom_at24c.h
> > > new file mode 100644
> > > index 000000000000..79a36b53ca87
> > > --- /dev/null
> > > +++ b/include/hw/nvram/eeprom_at24c.h
> > > @@ -0,0 +1,10 @@
> > > +/* Copyright (c) Meta Platforms, Inc. and affiliates. */
> > 
> > What license for this copyright?
> 
> Erg, yeah, thanks for calling this out, I did this wrong. Meta has some new
> licensing guidelines and I misinterpreted them. Contributors are just supposed
> to use whatever license the open-source project has, so I'll just change this
> to say it's under GPL2, like the one I used in hw/arm/fby35.c
> 
> > 
> > > +#ifndef EEPROM_AT24C_H
> > > +#define EEPROM_AT24C_H
> > > +
> > > +#include "hw/i2c/i2c.h"
> > 
> >  /**
> >   * Create and realize an AT24C EEPROM device on the heap.
> >   * @bus: I2C bus to put it on
> >   * @addr: I2C address of the EEPROM slave when put on a bus
> >   * @rom_size: size of the EEPROM
> >   *
> >   * Create the device state structure, initialize it, put it on
> >   * the specified @bus, and drop the reference to it (the device
> >   * is realized).
> >   */
> >  I2CSlave *at24c_eeprom_create_simple(I2CBus *bus, uint8_t addr,
> >                                       size_t rom_size);
> 
> +1, I'll include this comment

Oh, to clarify though: I'm not going to include the rename to the function,
maybe we could do that separately? I kinda want to avoid touching all the
at24c_eeprom_init calls unless I really need to. I know it's just a simple sed,
but also, smbus_eeprom_init is using the "init" suffix, so I'm not sure it's
consistent, although "create_simple" probably _is_ more consistent with devices
in general in QEMU. But anyways, main point, I just want to avoid making any
unnecessary refactoring here, and renaming it completely seems unnecessary.

> 
> > 
> > > +I2CSlave *at24c_eeprom_init(I2CBus *bus, uint8_t address, uint32_t rom_size);
> > > +
> > > +#endif
> > 
> 
