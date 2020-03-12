Received: by 2002:a19:f015:0:0:0:0:0 with SMTP id p21csp903360lfc;
        Thu, 12 Mar 2020 10:17:45 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vv+tai54aGrk2llp2ttmT60o+Xisd6oSSUmHwCBhWf9qM17qwQqS2ean2tUR4TRwKLZSYVI
X-Received: by 2002:ac8:71d7:: with SMTP id i23mr8404631qtp.250.1584033464888;
        Thu, 12 Mar 2020 10:17:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584033464; cv=none;
        d=google.com; s=arc-20160816;
        b=u4762+nsHQ173Pkijk7Tbm16S3OJcfNcaFFkZkYqlYaTYqR12DMtV9KpymkUcqGVDi
         IhcE1XXh8H1kt60fdJf/q57XoPpxONHWBgVuaJisBK9Nk9WR91+7420X5CXd5PH+HmYb
         SQrhz480Yo6nSdi7lEycMMSARLM56dOFCac4eLvF+7AnHYcANZ0TkOeC1qr565cwGDrF
         xb01DhX1biBYdKKFiT3ooWODy2lBxfPMDrcI6X/p6kqKjLsT4HB+BkB9w786P5ZkvUfr
         GPG3KWtKPkICMW0Qn0mYkAiVvMPjheCE5IXRFmsAI745yPTzwI0SVZnbT+5V0J4D6YBg
         rP3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:subject:to
         :from:date:dkim-signature;
        bh=GXGrQMuSPuWRxxUAmh9Tg77oMP4Uo6B+0hy9wrgNx8o=;
        b=Ra8zE1pWzSswFVcNTZN3b++5lh8d5YE0g7Xi+fGhB9rlzuO5Sc2NcSQO+F9wwO0xn7
         sAtgXPFCykLjFzJQ3y5zwwRKEFnGt8Xnn/ATh8y9M+K2Ivph8PYufwaQBdZBTCYf4+jF
         p523wmnLC4+WoOs4jyUluhKkDWhrcc1mjdqOZjq7rjfWmTU2pX4dVIqATpHogWgfhShY
         DNYKiLKUOloc5QPGymhz414jXwfYjK9NQBOSasmd6xmasGJiF3zzXMEF+77L7Zs3oI+4
         weAI9lxV4LQtwnpwvOy8ZLZBWgMciHVCSWcif9t+StbDFlKv9RFe/21Jh6HKYsilb3xU
         bD1A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Qxj8Px8l;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d13si3163290qti.132.2020.03.12.10.17.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 12 Mar 2020 10:17:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Qxj8Px8l;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:46406 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jCRSq-0003TH-8D
	for alex.bennee@linaro.org; Thu, 12 Mar 2020 13:17:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37430)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <groeck7@gmail.com>) id 1jCR77-0001Rj-Rw
 for qemu-arm@nongnu.org; Thu, 12 Mar 2020 12:55:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <groeck7@gmail.com>) id 1jCR76-0003Cn-OQ
 for qemu-arm@nongnu.org; Thu, 12 Mar 2020 12:55:17 -0400
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444]:39335)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <groeck7@gmail.com>)
 id 1jCR76-0003B8-HV; Thu, 12 Mar 2020 12:55:16 -0400
Received: by mail-pf1-x444.google.com with SMTP id w65so3541526pfb.6;
 Thu, 12 Mar 2020 09:55:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=GXGrQMuSPuWRxxUAmh9Tg77oMP4Uo6B+0hy9wrgNx8o=;
 b=Qxj8Px8ldKKrd8gIZdiXJTZR3wr+I1t7cPG0CJiNHfZn71OLzGjtQMWc3ZuXjQroGw
 32X1uTWgvUBZPux2FEAeVpvnOAiNFzCOTV9GcPv7TTL8qv9szsGvBvHSKqTM/F0/76VY
 v3vxTaU7iS7yY/2t41i0BcUC58x2E3DmetoFQXrdC3i3PBZ3KsJmwUGxETq0fIJJ25Yh
 UO1yGi+jnnRvBH494b97XRdCfyPYhnE8J3zVEN/joinGIeg07YTQWXPsTZqxZhKSFIZv
 PUkdgudeNLWXiBLojaot5sS3NV72DoQ4eqbgyQq5oOW4zxNuMRh+wldy6pNAvXgkxhM/
 qlaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=GXGrQMuSPuWRxxUAmh9Tg77oMP4Uo6B+0hy9wrgNx8o=;
 b=uScsFmqoyiT16rk6oCUuiBAYy1gT8FCN6/AbeuPms0w+U0f5AoNG52dScgr0DMWPAk
 h1tNaPKgkVVsms+WlcZ3NgZaJYSym+68uYpmVNE/K7z5N1fIvBm8mEDTbWHOpfnU5q2J
 dXP/+RPAh90lskPC4GqoIOVD5uW6HgIRa0GC9vMnXpRHp/OBlvn394Ge6++vyVJ2bN9h
 jwXVVe4BFs839ZpUbl9eibEc7OhqwZML1HQBke93ZbaJl43HCwUWAQ7OQ5OfxaujmSOe
 pGDrFmF84pmM1zT7om63f2MTjXfaWUsefLGjQDhFi/7CyvP3DoJfjghSFqdwj5uVLSFj
 JY3g==
X-Gm-Message-State: ANhLgQ1hsomiy/J02IA7PzBOH9uAAACxjDRgj4q7VGriHDrpICETMlop
 ajsMwM6qkrJ3/ojnJz5YqIc=
X-Received: by 2002:a63:df15:: with SMTP id u21mr8008518pgg.95.1584032114160; 
 Thu, 12 Mar 2020 09:55:14 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id e20sm2677449pfi.171.2020.03.12.09.55.12
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 12 Mar 2020 09:55:13 -0700 (PDT)
Date: Thu, 12 Mar 2020 09:55:11 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH v2 2/3] hw/arm/fsl-imx6ul: Wire up USB controllers
Message-ID: <20200312165511.GA16719@roeck-us.net>
References: <20200310210434.31544-1-linux@roeck-us.net>
 <20200310210434.31544-3-linux@roeck-us.net>
 <CAFEAcA811Zo6JjCait2G467oQo-nL0RTYVdqE-ofmDSxWPcuCQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA811Zo6JjCait2G467oQo-nL0RTYVdqE-ofmDSxWPcuCQ@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::444
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
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Oo1qHyNU67XE

On Thu, Mar 12, 2020 at 01:19:41PM +0000, Peter Maydell wrote:
> On Tue, 10 Mar 2020 at 21:04, Guenter Roeck <linux@roeck-us.net> wrote:
> >
> > IMX6UL USB controllers are quite similar to IMX7 USB controllers.
> > Wire them up the same way.
> >
> > The only real difference is that wiring up phy devices is necessary
> > to avoid phy reset timeouts in the Linux kernel.
> >
> > Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> > ---
> > v2: Use USB PHY emulation
> >
> >  hw/arm/fsl-imx6ul.c         | 33 +++++++++++++++++++++++++++++++++
> >  include/hw/arm/fsl-imx6ul.h |  9 +++++++++
> >  2 files changed, 42 insertions(+)
> >
> > diff --git a/hw/arm/fsl-imx6ul.c b/hw/arm/fsl-imx6ul.c
> > @@ -456,6 +467,28 @@ static void fsl_imx6ul_realize(DeviceState *dev, Error **errp)
> >                                              FSL_IMX6UL_ENETn_TIMER_IRQ[i]));
> >      }
> >
> > +    /* USB */
> > +    for (i = 0; i < FSL_IMX6UL_NUM_USBS; i++) {
> > +        static const int FSL_IMX6UL_USBn_IRQ[] = {
> > +            FSL_IMX6UL_USB2_IRQ,
> > +            FSL_IMX6UL_USB1_IRQ,
> > +        };
> 
> Do we really want to wire up USB1 to USB2_IRQ and USB2 to USB1_IRQ ?
> If so, a comment explaining that it is deliberate would be useful.
> 
Yes. I think the definitions may be incorrect (or the Linux dts files are
incorrect, but that seems unlikely). I tried the other way but then I get
unhandled interrupt errors when trying to access a USB flash drive.

> Side note: not used here, but in the header file we define:
>     FSL_IMX6UL_USB1_IRQ     = 42,
>     FSL_IMX6UL_USB2_IRQ     = 43,
>     FSL_IMX6UL_USB_PHY1_IRQ = 44,
>     FSL_IMX6UL_USB_PHY2_IRQ = 44,
> 
> Is that last one correct, or a cut-n-paste error that should be "45" ?
> 
From Linux devicetree files:

	usbphy1: usbphy@20c9000 {
        	compatible = "fsl,imx6ul-usbphy", "fsl,imx23-usbphy";
                reg = <0x020c9000 0x1000>;
                interrupts = <GIC_SPI 44 IRQ_TYPE_LEVEL_HIGH>;
	usbphy2: usbphy@20ca000 {
                compatible = "fsl,imx6ul-usbphy", "fsl,imx23-usbphy";
                reg = <0x020ca000 0x1000>;
                interrupts = <GIC_SPI 45 IRQ_TYPE_LEVEL_HIGH>;
	usbotg1: usb@2184000 {
                compatible = "fsl,imx6ul-usb", "fsl,imx27-usb";
                reg = <0x02184000 0x200>;
                interrupts = <GIC_SPI 43 IRQ_TYPE_LEVEL_HIGH>;
	usbotg2: usb@2184200 {
                compatible = "fsl,imx6ul-usb", "fsl,imx27-usb";
                reg = <0x02184200 0x200>;
                interrupts = <GIC_SPI 42 IRQ_TYPE_LEVEL_HIGH>;

Should I maybe fix the definitions in a separate patch ?

Thanks,
Guenter
