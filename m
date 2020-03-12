Received: by 2002:a19:f015:0:0:0:0:0 with SMTP id p21csp908293lfc;
        Thu, 12 Mar 2020 10:22:04 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vuPqx9J2wxhUWgHnDNzeuB6L3YxE2ScOXUV24NWdKESFoSZ57WyRtIK1Q7lHeEDFp6cZZiN
X-Received: by 2002:a37:bc1:: with SMTP id 184mr8644349qkl.57.1584033724438;
        Thu, 12 Mar 2020 10:22:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584033724; cv=none;
        d=google.com; s=arc-20160816;
        b=ZPATUUCIArtHKJgFDEMwp6LAl7idanWQ/gQ+Q/qkXaZ1B/krma8Vyc6J3WOAElOjrV
         iwc67MxB7WNGrnNGSrLZ45tbnFI8fp9tTXOp0TEsKyT7CIYxBcjdahOz8lb8yDSOPSCY
         c9LT93sh+Zma0oWwC1KG+aHfRbuRxEdKOCOm4055v5mCPLrq01zgcbfcWc2m1H3AlrwT
         84t8MTwY4JajhYBwJvDC1poCtYSA/rFHFV9aa4ii2qL9BtgS8HEI4tn3157/Eb6K6vax
         gYCjTLxIM2lGrfLhxCeRcc+fjCQTcPOMyYsSjcLyQeBmjiRF2FnNrN17kh3boqAmm8wT
         Tk7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:subject:to
         :from:date:dkim-signature;
        bh=yThmBkuW2LdehValOsK92YJ4z7LhKs38L7+Dci/UMV8=;
        b=DZIe+R3WTfEMqSvQ51fc3nA8gVDEdMhA/NX51oK/TRUwZ3A1r2CfPrB39N6ZZzaRv6
         DLTwz1F3Hnafq8vt5lYLzdDhZlCMOLHNXl7qN356LZKJpUXiuVR/RszEBnvPOrf+duNT
         sWp5Oq3xZh+S/b4t1ExGU1dGBnL8GXXqrG2bbsrgpwzApcu7W/czvnvvDSCKmuluVmCl
         UevKX1cZQF6qYKsr+kfgoIkOzW6PwUtCoqyKhaLWnVqt9OjbjegOTQmOXCtA7wXB6lHD
         JLforyggi+u1w6LbVjoSlQYU/oOVv15UIao/br1Y4JYXdztdwDmWDtlp75FOk/4+0Amr
         qXjA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=djGOUB47;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 14si3253482qkb.162.2020.03.12.10.22.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 12 Mar 2020 10:22:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=djGOUB47;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:46540 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jCRX1-0004dz-TI
	for alex.bennee@linaro.org; Thu, 12 Mar 2020 13:22:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42185)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <groeck7@gmail.com>) id 1jCRVl-0002EQ-MI
 for qemu-arm@nongnu.org; Thu, 12 Mar 2020 13:20:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <groeck7@gmail.com>) id 1jCRVk-0005vn-DQ
 for qemu-arm@nongnu.org; Thu, 12 Mar 2020 13:20:45 -0400
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543]:33090)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <groeck7@gmail.com>)
 id 1jCRVk-0005vY-6c; Thu, 12 Mar 2020 13:20:44 -0400
Received: by mail-pg1-x543.google.com with SMTP id m5so3397075pgg.0;
 Thu, 12 Mar 2020 10:20:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=yThmBkuW2LdehValOsK92YJ4z7LhKs38L7+Dci/UMV8=;
 b=djGOUB475YL4CZMFaIOy3V9zmrXfRPXnevAeJafk00xB94yJoh5aBVVNkGZrzQVZez
 gx2LFv2WP1HuVkdxTGdCl7WoU2MlbRE6Ukj38aAqJE1xYqUPxpWIjGk+HAWtiEo2ncuw
 E+d5Nk8gSO3BFTyFTfJbMRTVqhcLr+OyR7wb4Xd8BAgmJ99EFQxUYp6tVTwQ31WsUQGY
 QXO5h36UMxX4ZzUekD9WtUS9/qAtBj/vafycjnqrzcdO6xYLYOMLXkf4L3y8MIwQSQN5
 rF3avUpeCLNONX7r4gFu04pMxPkP40z1cUFz+BL+0Eb32qbvwAFp+d5cKxeIwuYxmBoE
 WWpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=yThmBkuW2LdehValOsK92YJ4z7LhKs38L7+Dci/UMV8=;
 b=A4QuwkvbOXWvYQedEEuDKyZ2hi8rEdWyHhrIBqDTF0+120v5oOYe1XCJqLHDW4dTxB
 UyN15R8ZtpTyeZhQWC6e7xSF52FldWSYjB+Sjzjt3GjbuMf93mi2QohlLpHhREF4Og9B
 y5dRu4jrNZlsnSPKAjX1IfVo+jB8hLspJmKgd8xbtML4EyKVQGAomXnFRLfDqrnKTOg0
 woXZaW4O9zPX5g91ELple8k/M1j3ECyDokwmMC45xd1kljS2zqByUFytpwv4GHgpXpgn
 tV+d6FZxxGqCz+sLHcDCexlyf8XF43H4UoSsgeIH5MZb1ETtaXVEUz3FYmP1zkzp6LCm
 UieQ==
X-Gm-Message-State: ANhLgQ09qEcK3gl0Xz/Qi9hVTB4Ck8rvDC1SlW47FXcNEjlX1aItWMf8
 s8OYLug9wNO4IHq8tX+cY8w=
X-Received: by 2002:a63:9d0c:: with SMTP id i12mr8688044pgd.378.1584033642964; 
 Thu, 12 Mar 2020 10:20:42 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id e187sm3149706pfe.50.2020.03.12.10.20.41
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 12 Mar 2020 10:20:42 -0700 (PDT)
Date: Thu, 12 Mar 2020 10:20:40 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH v2 2/3] hw/arm/fsl-imx6ul: Wire up USB controllers
Message-ID: <20200312172040.GA18358@roeck-us.net>
References: <20200310210434.31544-1-linux@roeck-us.net>
 <20200310210434.31544-3-linux@roeck-us.net>
 <CAFEAcA811Zo6JjCait2G467oQo-nL0RTYVdqE-ofmDSxWPcuCQ@mail.gmail.com>
 <20200312165511.GA16719@roeck-us.net>
 <CAFEAcA8QKwrVyBz-iGe0+1Kr7efJZC7nwwrTTV0FSUnmcEW=xA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA8QKwrVyBz-iGe0+1Kr7efJZC7nwwrTTV0FSUnmcEW=xA@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::543
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
X-TUID: TV2GI4NnV2zH

On Thu, Mar 12, 2020 at 05:05:25PM +0000, Peter Maydell wrote:
> On Thu, 12 Mar 2020 at 16:55, Guenter Roeck <linux@roeck-us.net> wrote:
> >
> > On Thu, Mar 12, 2020 at 01:19:41PM +0000, Peter Maydell wrote:
> > > On Tue, 10 Mar 2020 at 21:04, Guenter Roeck <linux@roeck-us.net> wrote:
> > > > diff --git a/hw/arm/fsl-imx6ul.c b/hw/arm/fsl-imx6ul.c
> > > > @@ -456,6 +467,28 @@ static void fsl_imx6ul_realize(DeviceState *dev, Error **errp)
> > > >                                              FSL_IMX6UL_ENETn_TIMER_IRQ[i]));
> > > >      }
> > > >
> > > > +    /* USB */
> > > > +    for (i = 0; i < FSL_IMX6UL_NUM_USBS; i++) {
> > > > +        static const int FSL_IMX6UL_USBn_IRQ[] = {
> > > > +            FSL_IMX6UL_USB2_IRQ,
> > > > +            FSL_IMX6UL_USB1_IRQ,
> > > > +        };
> > >
> > > Do we really want to wire up USB1 to USB2_IRQ and USB2 to USB1_IRQ ?
> > > If so, a comment explaining that it is deliberate would be useful.
> > >
> > Yes. I think the definitions may be incorrect (or the Linux dts files are
> > incorrect, but that seems unlikely). I tried the other way but then I get
> > unhandled interrupt errors when trying to access a USB flash drive.
> 
> I guess we should check the datasheet and see if we just
> have our #define names the wrong way around...
> 

From "i.MX 6UltraLite Applications Processor Reference Manual":

74 USB USBO2 USB OTG2
75 USB USBO2 USB OTG1
76 USB_PHY UTMI0 interrupt request
77 USB_PHY UTMI1 interrupt request

So it looks like the dts files in the Linux kernel are correct.

> > > Side note: not used here, but in the header file we define:
> > >     FSL_IMX6UL_USB1_IRQ     = 42,
> > >     FSL_IMX6UL_USB2_IRQ     = 43,
> > >     FSL_IMX6UL_USB_PHY1_IRQ = 44,
> > >     FSL_IMX6UL_USB_PHY2_IRQ = 44,
> > >
> > > Is that last one correct, or a cut-n-paste error that should be "45" ?
> > >
> > From Linux devicetree files:
> >
> >         usbphy1: usbphy@20c9000 {
> >                 compatible = "fsl,imx6ul-usbphy", "fsl,imx23-usbphy";
> >                 reg = <0x020c9000 0x1000>;
> >                 interrupts = <GIC_SPI 44 IRQ_TYPE_LEVEL_HIGH>;
> >         usbphy2: usbphy@20ca000 {
> >                 compatible = "fsl,imx6ul-usbphy", "fsl,imx23-usbphy";
> >                 reg = <0x020ca000 0x1000>;
> >                 interrupts = <GIC_SPI 45 IRQ_TYPE_LEVEL_HIGH>;
> >         usbotg1: usb@2184000 {
> >                 compatible = "fsl,imx6ul-usb", "fsl,imx27-usb";
> >                 reg = <0x02184000 0x200>;
> >                 interrupts = <GIC_SPI 43 IRQ_TYPE_LEVEL_HIGH>;
> >         usbotg2: usb@2184200 {
> >                 compatible = "fsl,imx6ul-usb", "fsl,imx27-usb";
> >                 reg = <0x02184200 0x200>;
> >                 interrupts = <GIC_SPI 42 IRQ_TYPE_LEVEL_HIGH>;
> >
> > Should I maybe fix the definitions in a separate patch ?
> 
> Yes please.
> 
Ok, will do. And, sorry, I should have done that in the first place.

Thanks,
Guenter
