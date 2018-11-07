Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp2464011wrw;
        Wed, 7 Nov 2018 10:39:12 -0800 (PST)
X-Google-Smtp-Source: AJdET5dEFcZjnMO5N+0MbHEbnOcrpN8FBbt6nQ1p5OkbQEeRoz2c+6b3U9usk6SXBsHB0fTyip2P
X-Received: by 2002:ac8:1add:: with SMTP id h29mr1366664qtk.258.1541615952551;
        Wed, 07 Nov 2018 10:39:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1541615952; cv=none;
        d=google.com; s=arc-20160816;
        b=bAlMwusFnbw+kXP9bsw/mK1UmI5tyRPL3w5z4+xeJjfUaSBralqmLRmIeTPmNa6q1F
         fzCtO7qlsC/HftI4pD16a4pxW4spjmmldUmnctVb9E6RXmFbWpVtc3QI75OttdCCPWXU
         WrxigZiY1SYlafMgZ3V9lCW7xyWntx2xi6rvN/f02NaupiFo62dCBAg6ASOA9o5KQqRy
         SsJBEP4u66re+eeW7uPoVsJsxrGDbnqeYBbbNBKei0UYwjPSLpyJ2+Yf1pH/JVkehKlK
         +eXfzQi+TJqjGkYB1mGwaCU5Vkf7N4NKQ8YUjW3LXTl1Gk03ru/wU3MlCXTKAmg4iLir
         VeIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dkim-signature;
        bh=Btao0nQR92JR4Oue1FYtBwJ0iY2h8PGMUxFQLp3EgaY=;
        b=wP5KCPVdVZ4TMIbhkp3G95KPrOlq5s2a+InonlDF4qda79CrCL5dvulreUdUpO2Uyu
         pdyAkIvPSx0B9IXR4rFvVkkveP2BCAuYBoB8DEsd5czsu4gwstyaasw4bBb36hmmhd1t
         OOljmsHKEXbAsvbplTdwZk9mLB6UaDNYXYRoIO0BOHrBS9fGm0IaEUV9geZr/1VrIyj9
         GMGl7irOssnHAMsniw0g+D/oYHHRNvqdmYSFlmHWZpKpjvMYq806EN6pF+xpcjHPMHvS
         Q1R3rZ5Jh2Ff3wA1NWkmry8GeXtWhsMHPWD1a4T0We7mR7uKUgcZRf09bbfG62vR4Tjb
         hK+Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=TyzAng8m;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v9si1089022qkv.68.2018.11.07.10.39.12
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 07 Nov 2018 10:39:12 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=TyzAng8m;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:50125 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gKSjQ-0002Ft-0S
	for alex.bennee@linaro.org; Wed, 07 Nov 2018 13:39:12 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42220)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <groeck7@gmail.com>) id 1gKSjC-0002Eh-I7
	for qemu-arm@nongnu.org; Wed, 07 Nov 2018 13:38:59 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <groeck7@gmail.com>) id 1gKSj6-00088r-P4
	for qemu-arm@nongnu.org; Wed, 07 Nov 2018 13:38:54 -0500
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541]:46329)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <groeck7@gmail.com>)
	id 1gKSir-0007wO-PI; Wed, 07 Nov 2018 13:38:40 -0500
Received: by mail-pg1-x541.google.com with SMTP id w7so7657540pgp.13;
	Wed, 07 Nov 2018 10:38:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=Btao0nQR92JR4Oue1FYtBwJ0iY2h8PGMUxFQLp3EgaY=;
	b=TyzAng8mqP+EA1/d4NViA63z1U/pA1VcI0GVEiO2yW3MjLa2Ri6JFajHsX45R8Cx/v
	IzbSUHFU3NvlG5FJkYs6rkOmdRRiE8JGQYSjiQ1E/uloozeQgl9wo1jGHWoewibILDgP
	jwayAaQjtt/CwGjSDApTKg5qOIneTKznQakCG61XZPn3W3XOY/qgiGy8oPpsIC2mlAOU
	/gTbv9vrrqpg/WWrGHqVWsk2oTolVtjH4sN697jYgkzs+b76cdvxkVhgsqZqjL/Z7Y8Y
	QlnimEFcPxeoVB+s1xgcGiaVG1iG3Jh9+J6H/GHBxMkCw3eGJ2CuqyATuPolUKshC9Pn
	/wdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
	:references:mime-version:content-disposition:in-reply-to:user-agent;
	bh=Btao0nQR92JR4Oue1FYtBwJ0iY2h8PGMUxFQLp3EgaY=;
	b=gPSQHo70mQqTMebRzqt6fZd3kZQsQvomuwcxRB+RxnGHoBAnDUZFW45Y7RNlhXlhws
	ybuwGkjeZpCC3ea50V0ULwLWbxJED+plb+Ih2qYauE/niEm6ja4qMjxmj4x3Jw9O2dSa
	OQGDudwVe3ekUBEe+XAsGgsjgmR5Li+7zPL1+bbUllD3oYL50oOkNO1VcQWhsn8r3rdR
	Q+heUd2wbDOceGuJYmfx4WWI79JbiTTzRQ48GHscTQPSshVctijvGUCXJ+Uv+fPDOEzJ
	Wx4zDT57k5KyvYfK39JOgyssQKihXVn9+BLOyTdtb/8SfMfaWbmkdooD9Ml9Pb0rclOz
	WA9g==
X-Gm-Message-State: AGRZ1gI2cgnnW/4Oqs8Hq5JmYhp6wuWiyYD5JT0UzUaD31ww4UlgDi3X
	H7lGel34mEh7wZ3g2VQKJbY=
X-Received: by 2002:a63:205:: with SMTP id 5mr1104882pgc.327.1541615902379;
	Wed, 07 Nov 2018 10:38:22 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
	by smtp.gmail.com with ESMTPSA id
	m12-v6sm1322898pgd.81.2018.11.07.10.38.20
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 07 Nov 2018 10:38:21 -0800 (PST)
Date: Wed, 7 Nov 2018 10:38:19 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Gerd Hoffmann <kraxel@redhat.com>
Message-ID: <20181107183819.GA5468@roeck-us.net>
References: <20181029223207.31878-1-philmd@redhat.com>
	<20181029223207.31878-4-philmd@redhat.com>
	<20181030063830.edjacusffvgwvnt2@sirius.home.kraxel.org>
	<fc4b00b2-dda0-a0fb-e7b8-487065dbf6cc@redhat.com>
	<20181105081656.3u5vankppvabxmlg@sirius.home.kraxel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181105081656.3u5vankppvabxmlg@sirius.home.kraxel.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::541
Subject: Re: [Qemu-arm] [PATCH 3/3] arm: allwinner: Enable USB EHCI
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
	Beniamino Galvani <b.galvani@gmail.com>, qemu-arm@nongnu.org,
	Icenowy Zheng <icenowy@aosc.xyz>,
	Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 527CkHS3yB2u

On Mon, Nov 05, 2018 at 09:16:56AM +0100, Gerd Hoffmann wrote:
> > > > @@ -116,6 +116,8 @@ static void aw_a10_realize(DeviceState *dev, Error **errp)
> > > >       if (machine_usb(current_machine)) {
> > > >           sysbus_create_simple("sysbus-ohci", 0x01c14400, s->irq[64]);
> > > >           sysbus_create_simple("sysbus-ohci", 0x01c1c400, s->irq[65]);
> > > > +        sysbus_create_simple(TYPE_AW_A10_EHCI, 0x01c14000, s->irq[39]);
> > > > +        sysbus_create_simple(TYPE_AW_A10_EHCI, 0x01c1c000, s->irq[40]);
> > > 
> > > Hmm, is this a companion controller setup?  If so, then this is a bit
> > > more complicated  (see ehci_create_ich9_with_companions()).
> > 
> > I don't have enough USB knowledge. Can we have companion setup without PCI?
> > 
> > Per the datashit [1] p. 215 "21. USB Host Controller", each controller share
> > the same PHY. There is no mention of companion setup:
> > 
> >   The USB host controller includes the following features:
> >   ..
> >   - Complies with EHCI Specification, Version 1.0,
> >   - and  the OHCI Specification, Version 1.0a.
> >   ..
> >   - Support only 1 USB Root Port shared between EHCI and OHCI.
> 
> Looks like a companion setup.  Short introduction:
> 
> The port is shared, and ehci controls whenever the port is assigned to
> ehci or the companion (ohci in this case).  Typically the ehci driver
> sets the bit depending on usb device speed, i.e. usb2 devices are
> handled by ehci and usb1 devices are handled by ohci.
> 
> By default ohci owns the devices, so in case the OS has no ehci driver
> ohci can be used to handle usb2 devices in usb1 compat mode.  Pretty
> much moot these days.
> 
> On the qemu side you basically have to initialize ehci first (so the usb
> bus exists), then set the masterbus property to the ehci usb-bus for the
> ohci controller.
> 

I tried that; in theory it looks like it works, or at least both devices
instantiate. I took the implementation from hw/ppc/sam460ex.c as guideline.

In practice, however, it doesn't work (nor does my current code). EHCI
fails to instantiate with error -110, and OHCI fails to instantiate with
error -75.

Weird, I know I tested this when I implemented it. Nevertheless,
it doesn't work. Given that, I think the series should be dropped
for now, at least until I find the time to track down the problem.

Guenter
