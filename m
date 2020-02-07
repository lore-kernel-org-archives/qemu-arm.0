Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp805164lfp;
        Fri, 7 Feb 2020 09:07:40 -0800 (PST)
X-Google-Smtp-Source: APXvYqyHTuU/FnIfQNpe8yz/SiZHct+5g8SI7p+pnR/On2LVfVm1O1p0QhEaA2GGZe6QD8n6SJvM
X-Received: by 2002:a37:a914:: with SMTP id s20mr8149047qke.270.1581095260682;
        Fri, 07 Feb 2020 09:07:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581095260; cv=none;
        d=google.com; s=arc-20160816;
        b=aqRCwdTsmJeD/m3hBroiT1/peaFlul8IDrgQlNUyEfi+TffQJONRR7dc11pwJFQqqh
         leMXXm+c3GXU2CGzuzBWFRFEr4EA5jF0aD52K9D1e+4TigkP2N/5BFjNY7F+knGRd4cl
         xiGTdXbdIk3X/9WSTI9bJ2xlPzpbOh/JB7+HuLT+isWK8pu4ZgJ9rcj1RxqAcivGC3yn
         H68XB+QcMmJTqojHVl986MnZjX8/8QdbNX3YHR8LyJ3tSKpUgBgNIHs/NzmQbnRMaWjh
         Y1dpnlsu7OAGdezIB2BkucVhz7LncSqUXS6YReyHzf+2tlb9cT0CvjOw+XDm1Hq3BM7q
         9p6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:user-agent:in-reply-to
         :content-transfer-encoding:content-disposition:mime-version
         :references:message-id:subject:to:from:date:dkim-signature;
        bh=TIQP/8thND8c4VaN0DU2ilUEjFFFPWdSmR/7tF0xtpY=;
        b=G5rPpUxJ7c2XBZyds27xL3RkIbsbcx/EGUyz/bBE0GzZa5E1nfHDBqgTGgSKfc+ox1
         tfD1FoVcIVqrBCvTHxG42nV/FECfG8UiCc8yPg2WngrtBx9+oEOAqqNd5Fb/YHtKIzCM
         i1KS/nb3QOCnH+Q76EPPOVbfnnwNRaRBszejmmeULjoi/GjP5Bj8q/N4TVJmeCC/Mch+
         uXwHOZRGQmIi3zdGcpdrVz5FchNBKlcaAstl7cidu+FhXE8je03DgwgKvTRwWuV4jdXN
         h2E8ehQpt6p1O985sSBTsT7TnfEhn55vHOVTQG0vDG0+PEAV+ylSqU9jkqthB4JroFH/
         i91w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=DvVHINgu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h6si76571qtp.98.2020.02.07.09.07.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 07 Feb 2020 09:07:40 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=DvVHINgu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:32924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j076S-0005dz-52
	for alex.bennee@linaro.org; Fri, 07 Feb 2020 12:07:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36757)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <groeck7@gmail.com>) id 1j076J-0005dH-Ie
 for qemu-arm@nongnu.org; Fri, 07 Feb 2020 12:07:32 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <groeck7@gmail.com>) id 1j076I-0007vf-DB
 for qemu-arm@nongnu.org; Fri, 07 Feb 2020 12:07:31 -0500
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442]:43484)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <groeck7@gmail.com>)
 id 1j076I-0007t9-6D; Fri, 07 Feb 2020 12:07:30 -0500
Received: by mail-pf1-x442.google.com with SMTP id s1so56428pfh.10;
 Fri, 07 Feb 2020 09:07:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=TIQP/8thND8c4VaN0DU2ilUEjFFFPWdSmR/7tF0xtpY=;
 b=DvVHINguMPVv2tNoEUQ8EXk4I5GEUI/K5GM8IFuGbU2NmRtL24nihKABmt0RNNc+Fi
 Tj1IrT2+woPTGBH1AtiOPUM8gAWQDMeJJuqkTNUA3JG/K3lHMai2Pax9Aq+AR9r92C4i
 yrJElhzuUFYhTAizhN5XeDCrqvBEo6OnzE413cZpJ1VVP2mtLbYsKHV4vsFUuguhRhsV
 gzgz3QEsTdJRloR+2B+F4UHM4LpxfegV1fimiDJx/ai+pC9oLif7k8i/DYkchnR2JE5g
 aH+kXiKn54/ZMlJoR6y8eiMwLb1Ed6lBfN6SmdNA84qH6zubyUGqAMlkyBQij9AOkjU8
 Q/HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to:user-agent;
 bh=TIQP/8thND8c4VaN0DU2ilUEjFFFPWdSmR/7tF0xtpY=;
 b=PB/bM/XVoMrPPNkhhdAwKPaKgF8FfFrKwAayWMHDeapUf7wm2oQrHusgCikzcFumOo
 8Ef2sIqVjlFNkO7HPRS4tDAbwt3Cm5I/wIzR4NNyyrU2NtU11nAAOaGEOVR4zLqkWmM9
 nBSl91excPLCjjsWNx/zh8QDxP5WNE+3cE82x1Ikaw3LUzEd0r3jlHb329OLHmimVO79
 fnRSbeJKdiqdcdEtCw2JB8l3M9BS8zBpG3uzMCgXbOkTF5k55l+E+dUJDsfJr9MfiXG3
 PdG6rNwW7JSrpwBRehRlpZnypcTH2LbmI86JikBs1kPMkx8wCE2R5RcGBPpPJckkhaYp
 DvEg==
X-Gm-Message-State: APjAAAU5imqTQTeHFwVGrvLESdMqNPnfoia8mu7U4arblLrdhUGzxWzO
 +aM/DGBu5hpwABu/5uxqN7M=
X-Received: by 2002:a63:c747:: with SMTP id v7mr181015pgg.291.1581095249043;
 Fri, 07 Feb 2020 09:07:29 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id q11sm3505454pff.111.2020.02.07.09.07.27
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 07 Feb 2020 09:07:28 -0800 (PST)
Date: Fri, 7 Feb 2020 09:07:26 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
Subject: Re: [PATCH] hw/arm: ast2600: Wire up EHCI controllers
Message-ID: <20200207170726.GA24635@roeck-us.net>
References: <20200207144954.13634-1-linux@roeck-us.net>
 <c0bcd37a-0745-69ec-471f-be54c8e5a54e@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c0bcd37a-0745-69ec-471f-be54c8e5a54e@kaod.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::442
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org, Joel Stanley <joel@jms.id.au>, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: xbwVTURww2e1

On Fri, Feb 07, 2020 at 04:47:09PM +0100, Cédric Le Goater wrote:
> On 2/7/20 3:49 PM, Guenter Roeck wrote:
> > Initialize EHCI controllers on AST2600 using the existing
> > TYPE_PLATFORM_EHCI. After this change, booting ast2600-evb
> > into Linux successfully instantiates a USB interface after
> > the necessary changes are made to its devicetree files.
> > 
> > ehci_hcd: USB 2.0 'Enhanced' Host Controller (EHCI) Driver
> > ehci-platform: EHCI generic platform driver
> > ehci-platform 1e6a3000.usb: EHCI Host Controller
> > ehci-platform 1e6a3000.usb: new USB bus registered, assigned bus number 1
> > ehci-platform 1e6a3000.usb: irq 25, io mem 0x1e6a3000
> > ehci-platform 1e6a3000.usb: USB 2.0 started, EHCI 1.00
> > usb usb1: Manufacturer: Linux 5.5.0-09825-ga0802f2d0ef5-dirty ehci_hcd
> > usb 1-1: new high-speed USB device number 2 using ehci-platform
> > 
> > Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> > ---
> >  hw/arm/aspeed_ast2600.c | 23 +++++++++++++++++++++++
> >  1 file changed, 23 insertions(+)
> > 
> > diff --git a/hw/arm/aspeed_ast2600.c b/hw/arm/aspeed_ast2600.c
> > index 931887ac68..a528251c8d 100644
> > --- a/hw/arm/aspeed_ast2600.c
> > +++ b/hw/arm/aspeed_ast2600.c
> > @@ -31,6 +31,8 @@ static const hwaddr aspeed_soc_ast2600_memmap[] = {
> >      [ASPEED_FMC]       = 0x1E620000,
> >      [ASPEED_SPI1]      = 0x1E630000,
> >      [ASPEED_SPI2]      = 0x1E641000,
> > +    [ASPEED_EHCI1]     = 0x1E6A1000,
> > +    [ASPEED_EHCI2]     = 0x1E6A3000,
> >      [ASPEED_MII1]      = 0x1E650000,
> >      [ASPEED_MII2]      = 0x1E650008,
> >      [ASPEED_MII3]      = 0x1E650010,
> > @@ -77,6 +79,8 @@ static const int aspeed_soc_ast2600_irqmap[] = {
> >      [ASPEED_ADC]       = 78,
> >      [ASPEED_XDMA]      = 6,
> >      [ASPEED_SDHCI]     = 43,
> > +    [ASPEED_EHCI1]     = 5,
> > +    [ASPEED_EHCI2]     = 9,
> 
> There is a conflict here with commit a29e3e127077 ("hw/arm: ast2600: Wire 
> up the eMMC controller") which is mainline already 
> 
Ah, sorry, I had tested this on top of v4.2. Fortunately it is only
a context conflict. Should I resend ?

Thanks,
Guenter

> C. 
> 
> >      [ASPEED_GPIO]      = 40,
> >      [ASPEED_GPIO_1_8V] = 11,
> >      [ASPEED_RTC]       = 13,
> > @@ -167,6 +171,11 @@ static void aspeed_soc_ast2600_init(Object *obj)
> >                                sizeof(s->spi[i]), typename);
> >      }
> >  
> > +    for (i = 0; i < sc->ehcis_num; i++) {
> > +        sysbus_init_child_obj(obj, "ehci[*]", OBJECT(&s->ehci[i]),
> > +                              sizeof(s->ehci[i]), TYPE_PLATFORM_EHCI);
> > +    }
> > +
> >      snprintf(typename, sizeof(typename), "aspeed.sdmc-%s", socname);
> >      sysbus_init_child_obj(obj, "sdmc", OBJECT(&s->sdmc), sizeof(s->sdmc),
> >                            typename);
> > @@ -395,6 +404,19 @@ static void aspeed_soc_ast2600_realize(DeviceState *dev, Error **errp)
> >                          s->spi[i].ctrl->flash_window_base);
> >      }
> >  
> > +    /* EHCI */
> > +    for (i = 0; i < sc->ehcis_num; i++) {
> > +        object_property_set_bool(OBJECT(&s->ehci[i]), true, "realized", &err);
> > +        if (err) {
> > +            error_propagate(errp, err);
> > +            return;
> > +        }
> > +        sysbus_mmio_map(SYS_BUS_DEVICE(&s->ehci[i]), 0,
> > +                        sc->memmap[ASPEED_EHCI1 + i]);
> > +        sysbus_connect_irq(SYS_BUS_DEVICE(&s->ehci[i]), 0,
> > +                           aspeed_soc_get_irq(s, ASPEED_EHCI1 + i));
> > +    }
> > +
> >      /* SDMC - SDRAM Memory Controller */
> >      object_property_set_bool(OBJECT(&s->sdmc), true, "realized", &err);
> >      if (err) {
> > @@ -499,6 +521,7 @@ static void aspeed_soc_ast2600_class_init(ObjectClass *oc, void *data)
> >      sc->silicon_rev  = AST2600_A0_SILICON_REV;
> >      sc->sram_size    = 0x10000;
> >      sc->spis_num     = 2;
> > +    sc->ehcis_num    = 2;
> >      sc->wdts_num     = 4;
> >      sc->macs_num     = 4;
> >      sc->irqmap       = aspeed_soc_ast2600_irqmap;
> > 
> 
