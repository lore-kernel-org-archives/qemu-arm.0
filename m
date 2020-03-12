Received: by 2002:a19:f015:0:0:0:0:0 with SMTP id p21csp905757lfc;
        Thu, 12 Mar 2020 10:19:42 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vsLbwIaaa70Qq/xsP+Lg1Eh2T0CDLZGL3tQGC9mAfTV+Hnlq36/N84nx+9o9+i2dLDJydeK
X-Received: by 2002:aed:34e6:: with SMTP id x93mr917524qtd.194.1584033581930;
        Thu, 12 Mar 2020 10:19:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584033581; cv=none;
        d=google.com; s=arc-20160816;
        b=pK7L5F3NsoEo2hhiPRrVcPmjSvnK9mjozeWj2Iatc+Mlz1OT8q+PXm38/AcEMTcJTj
         LajBe1mCRrskHm0jNKHO5RJnV+hsHyRH4Rbm7pzyjTu4mSe8hqYIMIFBNGTiazWe1370
         k2SivfF9H15fo4fhWOKuHJtkHz29qqkzB2OTZk48AGEnqh9H9X13ngol9IrLmbC1gZbu
         ZigIOd0/aSQEjFCv0Z+qXI//ul1/fYkJKP7U3isWINQU0a8g7qIRyj2+U73ERlS6t/ym
         J4Lp5wSJgtpz0326I6Ii9Csc8QyaUwEAUhhIr67AT3D+9klOMg8R6La1jLAuoVrZxE2N
         iESw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:subject:to
         :from:date:dkim-signature;
        bh=R1Klp5VmAGtpJcR4uZfnLflfD0zf1gm8bN8uDrXOuqw=;
        b=rphI6BKT3jWVRjenHMpQ+08sAonwSAr0XnxGRDMc6oJkKYt0JcKEOy6JsBU1cVKgQV
         HHPGRoxUvs2g/sWF4q0MLmkH0pWujDvD19kwxaQ+lRkCyIIgUJRXsqeSmVwCX0x9bRz0
         cNRxp5Uq06yF3LaY1uTWzXS3PPEK9bgtpL3BmUAvrj6vq6xFuyKAtLNUBbRReGApXvZ+
         +mR0vWEWSdOdYowbHPNZmmd2twEMXc2NvKTNKthUCOMNoG//8t6/+AovtHeR9D60i+RA
         Y0DJ6BhCjA0i8lCmntl39t8fy4Z86eJg9Je0WuYGRtRCU4XNiHVQ11kxcf8sl+ClvyD8
         sFqw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=n2GlV9qa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f15si3074389qtp.395.2020.03.12.10.19.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 12 Mar 2020 10:19:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=n2GlV9qa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:46450 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jCRUj-0008Cj-B3
	for alex.bennee@linaro.org; Thu, 12 Mar 2020 13:19:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37674)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <groeck7@gmail.com>) id 1jCR8m-0005Dr-L8
 for qemu-arm@nongnu.org; Thu, 12 Mar 2020 12:57:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <groeck7@gmail.com>) id 1jCR8l-0004U4-In
 for qemu-arm@nongnu.org; Thu, 12 Mar 2020 12:57:00 -0400
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541]:34039)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <groeck7@gmail.com>)
 id 1jCR8l-0004Rg-CY; Thu, 12 Mar 2020 12:56:59 -0400
Received: by mail-pg1-x541.google.com with SMTP id t3so3358207pgn.1;
 Thu, 12 Mar 2020 09:56:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=R1Klp5VmAGtpJcR4uZfnLflfD0zf1gm8bN8uDrXOuqw=;
 b=n2GlV9qaxcgxAWMqLiIAArXZ7T8pEEua/Q1vbXXt3GGW03JhWe2miqdzBtUKzZ0IvT
 e9Ca2xCAuq+Zclf2zA5gaFjm4Sq3Tun54zSVGei94jDUPoULUCW3JLyOhCi67Pjr+JTz
 VPY8C8G03QyboWBtG7fkmolFmycRTbXKQowD8WtzWrkmuaUZFnottGfo2HVqiidygAJh
 fNN0cyWUaHDbQHzlnOppNy4elBEdH1t4dnH9EvCLDkBfAKR3IjVi9glZe+J5feZRh130
 sZ6DFRLLE2+NiCGVAt9DZFZQo/5x793638F/vBQ4AoiYoC6BhvjufSxhaKzdwOBl5ktx
 zSjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=R1Klp5VmAGtpJcR4uZfnLflfD0zf1gm8bN8uDrXOuqw=;
 b=kh+eaIdMRL3xw9AgEQKqiO+YQ8VePlw+37UJDDqQr+vYZnS8zxd6B6McRND3pKOt6H
 K1c82dEFVP5U+KS6rG73vDODbA5hIhat9OpOvmPXri/ivxZL7lal5E0o9W5t/OlXih8i
 YUwSSitgHKlondwSw2OOBv0nIXvBUSnZ1ALLU1GteOJ7DdGjg486YjtvxkEBbkUxCgEO
 80BxVDX2lm03udC9uTjTgX8mXxsI9xCQ/fHInTPM1NVRQrfEzADyfMNfq0CLK8WXK74a
 pQ5OzS8mtvL3LkbCeYMi8twGc/LaW8g1xRNsmbm+s2d2nm7VJBFA4Rk0EQC0SuDENYyC
 S+TQ==
X-Gm-Message-State: ANhLgQ11s+F5gH3hzalsoR6MuqEfKOdzMPGSrDPmzZyxMYaDgedsBDwZ
 ytfSpAAVcrSan8U9vqLx6cHVN6OC
X-Received: by 2002:a63:e00c:: with SMTP id e12mr8766856pgh.354.1584032217640; 
 Thu, 12 Mar 2020 09:56:57 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id h132sm51332238pfe.118.2020.03.12.09.56.56
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 12 Mar 2020 09:56:57 -0700 (PDT)
Date: Thu, 12 Mar 2020 09:56:56 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH v2 3/3] hw/arm/fsl-imx6: Wire up USB controllers
Message-ID: <20200312165656.GB16719@roeck-us.net>
References: <20200310210434.31544-1-linux@roeck-us.net>
 <20200310210434.31544-4-linux@roeck-us.net>
 <CAFEAcA9itKNV6c07wm_4dJiGtHMLXCFt+A-W5xC5DX1Wxfu30w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA9itKNV6c07wm_4dJiGtHMLXCFt+A-W5xC5DX1Wxfu30w@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::541
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
X-TUID: KDIs9RCbhrGm

On Thu, Mar 12, 2020 at 01:29:34PM +0000, Peter Maydell wrote:
> On Tue, 10 Mar 2020 at 21:04, Guenter Roeck <linux@roeck-us.net> wrote:
> >
> > With this patch, the USB controllers on 'sabrelite' are detected
> > and can be used to boot the system.
> >
> > Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> 
> > +    for (i = 0; i < FSL_IMX6_NUM_USBS; i++) {
> > +        static const int FSL_IMX6_USBn_IRQ[] = {
> > +            FSL_IMX6_USB_OTG_IRQ,
> > +            FSL_IMX6_USB_HOST1_IRQ,
> > +            FSL_IMX6_USB_HOST2_IRQ,
> > +            FSL_IMX6_USB_HOST3_IRQ,
> > +        };
> > +
> > +        object_property_set_bool(OBJECT(&s->usbphy[i]), true, "realized",
> > +                                 &error_abort);
> > +        sysbus_mmio_map(SYS_BUS_DEVICE(&s->usbphy[i]), 0,
> > +                        FSL_IMX6_USBPHY1_ADDR + i * 0x1000);
> 
> Are you sure these addresses are right? Four of these starting
> at USBPHY1_ADDR means the last one clashes with what we define
> as "FSL_IMX6_SNVSHP_ADDR 0x020CC000".
> 
> I only have the i.MX 6Dual/6Quad reference manual to hand,
> so maybe this imx6 variant is different, but that document
> says there are 4 USB controllers but only 2 PHY blocks.
> 
Oops, I think you are correct. Good catch. I'll re-check the datsheet
and send an updated patch.

Thanks,
Guenter
