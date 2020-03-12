Received: by 2002:a19:f015:0:0:0:0:0 with SMTP id p21csp897750lfc;
        Thu, 12 Mar 2020 10:12:51 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vvvQWw1WIe232+NttP0Im86jJGxZzsRDWd5KFG1UUI8RWxAwEx/AcToQLr6p04yUw3WUQah
X-Received: by 2002:a37:6215:: with SMTP id w21mr8894753qkb.149.1584033171759;
        Thu, 12 Mar 2020 10:12:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584033171; cv=none;
        d=google.com; s=arc-20160816;
        b=Czgng5Jf40fJSeL0P/XFBml4yGTMFRGJecIOlEphg5UcYvk5bV9GgH8wbNUgFpJd9D
         wdh8d3rw0F+gFgPtBzxZQzVs/6b6IahwNmkfNqfrO6GqHcEkaFRE3yBIFUWnDOLcX4mn
         CErZf91h9vLwznfimcH9cw/LnctlDi5VCW9pb8uW6cXb0X/zf86Z+bgxR/MwEmHc0Ou8
         FoZ421Kur73Mvbex0862UiinS+2rc60JxfI9Kc/T9deLxwKlkCXtYwe2mqJBbJ9hnJ1R
         vRf00UxSQpI+Ktb3++2AY64v30ALpcafhgl54NEZN4qO64GTD9grs1Qx4ih6wZRgs6fi
         DLSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xxylgvPZt6pkmnnFax2EPHHdp0hc8wVzhGL5wzMXqGY=;
        b=JkQ9sSa2HxfK+jjoKZqyZJp7TvbZPWaf+TG7vO6geN8neN6y56zLXm7inUlL7JfF+Y
         EChHkvWNah5u6Q3cdSLhc1sqDQMvvx/xAlLGt/8KaDssMkIsPiSLDFgVFJaeZMojlXnJ
         bOG2tJoRYZ33iO7NFCHsCjL5SiMOXyh/fPzaUxujrxiG9aDjKw3bRyjEb7wes0xL+ULE
         LQzMDs36iDAJabbGJil6pb9Pe59PVPVM2ANLUN6dHDT6mwzS5DIVUK7TrPVnPulqScz1
         3H5s4VBKQf3h0aOuBpBwRioxgXBWteaInAlsZCrej38PpEWzkZ0LNnZxUu7OrbEs2m7Y
         xGOA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=hZUQiKxD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y32si512139qtd.62.2020.03.12.10.12.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 12 Mar 2020 10:12:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=hZUQiKxD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:46288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jCRO7-0006na-69
	for alex.bennee@linaro.org; Thu, 12 Mar 2020 13:12:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39629)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jCRH9-00050V-LP
 for qemu-arm@nongnu.org; Thu, 12 Mar 2020 13:05:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1jCRH8-0005m9-Eo
 for qemu-arm@nongnu.org; Thu, 12 Mar 2020 13:05:39 -0400
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244]:41336)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1jCRH8-0005j7-99
 for qemu-arm@nongnu.org; Thu, 12 Mar 2020 13:05:38 -0400
Received: by mail-oi1-x244.google.com with SMTP id i1so6194686oie.8
 for <qemu-arm@nongnu.org>; Thu, 12 Mar 2020 10:05:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xxylgvPZt6pkmnnFax2EPHHdp0hc8wVzhGL5wzMXqGY=;
 b=hZUQiKxD2gS4ydpHQe0PsuGgSYjvbEUL9z5cax7ZJz3CmMOsIUewoZCJB+lFJvk7qJ
 wEO5S/jbW9EgiUUOkofa8jLuJ2B3CN/MW6+agUW9IG2m2nxKD+jijKFnQCtNCA7Nvu9n
 dpwjxuHohl6hcpF31SZITg90RSCOb/Bs0grXDTdAIVBbI7QIMbccTU23fNxBCVMwbajl
 1LX0AC6C23F5t/iw1Cd90t0Jm0Dmxon25XMikfJcqTgx5ROFzgbuFB619fQsbZNlBRJy
 lmuav3OLkbTPSpTShGGtl/T0SGmdvOpNqsXfI9dOm/nX39ICj71UKKRapAZqM15HIabg
 aWjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xxylgvPZt6pkmnnFax2EPHHdp0hc8wVzhGL5wzMXqGY=;
 b=fs+O2rDKDtycvVA+0ttP/HL81HMyOlLqjXRp2DTni/3C5R9n/R0WQX1ymN4/aG5rfB
 o51rZd1jVBoZE25Hb5DFlPo885BikhX65iyq6ZBqfHRDEEjuVwPjB7c9QPzCT0Pc00wx
 l8qvT9iLFb4pmUfwNdwoLqkl6sEB3QJUq1BX6mt4rvH3OJC6dmeG7uQLQiko05fgBk9X
 C8Z+8JM4R2dLGf0mCAtY47zKN82wpIBpUDRhei6eel/JcG13n1O5Lb9lZmw+4WMZR/Z6
 qFfisBfA5W3NT5AgafH5DDNTVl1QFaPgRgm9D4nw6/A6vujyyPHAfut4c0ieCeLXVChK
 qYrA==
X-Gm-Message-State: ANhLgQ0VB8yA5mt9fli3mjQY9jPzeSs7bNPVDn3xgRhowFM5L/z9tt6H
 Z0DTKzjSs8eWd3J/IQbUMsnYvV3CE5N1lMiEsiso2Q==
X-Received: by 2002:aca:47c8:: with SMTP id u191mr3523548oia.170.1584032737245; 
 Thu, 12 Mar 2020 10:05:37 -0700 (PDT)
MIME-Version: 1.0
References: <20200310210434.31544-1-linux@roeck-us.net>
 <20200310210434.31544-3-linux@roeck-us.net>
 <CAFEAcA811Zo6JjCait2G467oQo-nL0RTYVdqE-ofmDSxWPcuCQ@mail.gmail.com>
 <20200312165511.GA16719@roeck-us.net>
In-Reply-To: <20200312165511.GA16719@roeck-us.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 12 Mar 2020 17:05:25 +0000
Message-ID: <CAFEAcA8QKwrVyBz-iGe0+1Kr7efJZC7nwwrTTV0FSUnmcEW=xA@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] hw/arm/fsl-imx6ul: Wire up USB controllers
To: Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::244
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
X-TUID: ttt5wjPSlBOo

On Thu, 12 Mar 2020 at 16:55, Guenter Roeck <linux@roeck-us.net> wrote:
>
> On Thu, Mar 12, 2020 at 01:19:41PM +0000, Peter Maydell wrote:
> > On Tue, 10 Mar 2020 at 21:04, Guenter Roeck <linux@roeck-us.net> wrote:
> > > diff --git a/hw/arm/fsl-imx6ul.c b/hw/arm/fsl-imx6ul.c
> > > @@ -456,6 +467,28 @@ static void fsl_imx6ul_realize(DeviceState *dev, Error **errp)
> > >                                              FSL_IMX6UL_ENETn_TIMER_IRQ[i]));
> > >      }
> > >
> > > +    /* USB */
> > > +    for (i = 0; i < FSL_IMX6UL_NUM_USBS; i++) {
> > > +        static const int FSL_IMX6UL_USBn_IRQ[] = {
> > > +            FSL_IMX6UL_USB2_IRQ,
> > > +            FSL_IMX6UL_USB1_IRQ,
> > > +        };
> >
> > Do we really want to wire up USB1 to USB2_IRQ and USB2 to USB1_IRQ ?
> > If so, a comment explaining that it is deliberate would be useful.
> >
> Yes. I think the definitions may be incorrect (or the Linux dts files are
> incorrect, but that seems unlikely). I tried the other way but then I get
> unhandled interrupt errors when trying to access a USB flash drive.

I guess we should check the datasheet and see if we just
have our #define names the wrong way around...

> > Side note: not used here, but in the header file we define:
> >     FSL_IMX6UL_USB1_IRQ     = 42,
> >     FSL_IMX6UL_USB2_IRQ     = 43,
> >     FSL_IMX6UL_USB_PHY1_IRQ = 44,
> >     FSL_IMX6UL_USB_PHY2_IRQ = 44,
> >
> > Is that last one correct, or a cut-n-paste error that should be "45" ?
> >
> From Linux devicetree files:
>
>         usbphy1: usbphy@20c9000 {
>                 compatible = "fsl,imx6ul-usbphy", "fsl,imx23-usbphy";
>                 reg = <0x020c9000 0x1000>;
>                 interrupts = <GIC_SPI 44 IRQ_TYPE_LEVEL_HIGH>;
>         usbphy2: usbphy@20ca000 {
>                 compatible = "fsl,imx6ul-usbphy", "fsl,imx23-usbphy";
>                 reg = <0x020ca000 0x1000>;
>                 interrupts = <GIC_SPI 45 IRQ_TYPE_LEVEL_HIGH>;
>         usbotg1: usb@2184000 {
>                 compatible = "fsl,imx6ul-usb", "fsl,imx27-usb";
>                 reg = <0x02184000 0x200>;
>                 interrupts = <GIC_SPI 43 IRQ_TYPE_LEVEL_HIGH>;
>         usbotg2: usb@2184200 {
>                 compatible = "fsl,imx6ul-usb", "fsl,imx27-usb";
>                 reg = <0x02184200 0x200>;
>                 interrupts = <GIC_SPI 42 IRQ_TYPE_LEVEL_HIGH>;
>
> Should I maybe fix the definitions in a separate patch ?

Yes please.

thanks
-- PMM
