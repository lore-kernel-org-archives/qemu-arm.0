Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp5812278wrv;
        Wed, 31 Jul 2019 08:46:18 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzcpKktlkkb6+3XRq2lKuKb+sxuT4sM9t9whHqOkiu0KivJGEobmDVRkQ5GBtr+9hLoEb3i
X-Received: by 2002:ab0:7042:: with SMTP id v2mr16805007ual.141.1564587978223;
        Wed, 31 Jul 2019 08:46:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564587978; cv=none;
        d=google.com; s=arc-20160816;
        b=ZEZ4Xm0GUus7eDs6I3rmdbv2xqtbPVlIbbMAQpafiUWthHvFUHRM4Rv0t+w0QNDCst
         ovS1ySa1BRWt75cX3JAjhgwfW+DYQmvDqgK06M4kxrArfvhM9amaZaK74SnfxESmegDu
         3XNmm7Vym45176m93sWps8iyxIA52DyWGQWtE58HyeJhWQqTjG2DaXqE/2WxtlM8bWvo
         fXCXnl1rtZrmsd6LI9iGgGfw7oYefE0QnJrwjsepFMubfnGeUZHRfk0hb942fXI6Asfr
         NdMd1Z1i5ac1C95ynLFIvXogztcA6KxHEbzl1f2Wkotx1XbDqLcyzurM/0wX4Liyejml
         pKHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:in-reply-to
         :references:mime-version;
        bh=eZUTq130Vr1BellBBksVsLLFPBlgAJiRnUqxsUwGW6k=;
        b=WJv8pTDjqShRTlAQJVfVmCPVHrGJ1a8gz8nMs2/tW2+q2SkHz4R1Eykhndos20mfhK
         uI9zN/imbt2dFew/bdHIXiQMeJKWr9XLsa/IQ0mdQOe0foFWyA+V/g9QEzsFJsormrtC
         s0fQp0yxh+w5f3Ak58uHhQLECiEu00LTOINDKH29KXGFGHrfRk0bgwwOTtPjImFCxkPZ
         Ue7Qa7LGqUwbogKwQub21UEavgS+Ohx3iI5ULdYX5x6tEDtp2O/ev3P2sPfIxtNRLE9m
         XG/osdC8mS0t2TqWZFYC0qBDZ3YMk2fWDxrD5s+yhcNbkPFvGSapKSO9LDO/7rxXF8ed
         QLYQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p21si15166248vsf.10.2019.07.31.08.46.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 31 Jul 2019 08:46:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:41934 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hsqnx-0000lB-Ni
	for alex.bennee@linaro.org; Wed, 31 Jul 2019 11:46:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35110)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <pmathieu@redhat.com>) id 1hsqng-0000ku-Cc
 for qemu-arm@nongnu.org; Wed, 31 Jul 2019 11:46:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pmathieu@redhat.com>) id 1hsqne-0005EI-U2
 for qemu-arm@nongnu.org; Wed, 31 Jul 2019 11:46:00 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:37982)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <pmathieu@redhat.com>) id 1hsqne-00056o-Oi
 for qemu-arm@nongnu.org; Wed, 31 Jul 2019 11:45:58 -0400
Received: by mail-wm1-f67.google.com with SMTP id s15so38922646wmj.3
 for <qemu-arm@nongnu.org>; Wed, 31 Jul 2019 08:45:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=eZUTq130Vr1BellBBksVsLLFPBlgAJiRnUqxsUwGW6k=;
 b=BuzvaYhyisTtlUpEqvJnb7ARJcGc/SkfRvwM1Wl4pGBdnrSzLJXVE18v/cUK3iVOQF
 hK5rkLEKuSXCOGNSWE/gpRJ65vWH83IpykeE8T417OOn2lZqRkMLG52isXQb+r+E06K0
 Y9AW50SecftFG+X4nQF5k1xXT2e5mktQwXgWH3xK5OCNxCL0pNxfYFL6SeCr7PpQjvRY
 iJ6deiY5fCxcpfZfvr9+RrhnHwQif/HEo8DZdCynJLhHHzjPFSfocdpzoPzIqzQXjqYH
 5Y6A592mUr5OUbe2l0pnhAj5st4hhJd0jDkW2EKx/KgRo4Ov0NxJeb8M/fcwuekV0/Sw
 MXUQ==
X-Gm-Message-State: APjAAAVYxESWu00j6jNOic5QK+2xNhPdKPl2L70zKChT+ICCu2B2avay
 zQX8qSRqPYN0dz7whNnB1xsGEPVU/GjKpM3zKOjsow==
X-Received: by 2002:a7b:c857:: with SMTP id c23mr117859927wml.51.1564587957073; 
 Wed, 31 Jul 2019 08:45:57 -0700 (PDT)
MIME-Version: 1.0
References: <6ea54e80-63cd-5759-337b-1eb1686453f5@greensocs.com>
 <e979936e-3545-87fb-eec6-e3a098785113@redhat.com>
In-Reply-To: <e979936e-3545-87fb-eec6-e3a098785113@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Date: Wed, 31 Jul 2019 17:45:46 +0200
Message-ID: <CAP+75-XzR9bQAm6KVdF=QZ4Bs9yWw-OLt6cRXNM=j8d0BjSZmQ@mail.gmail.com>
To: Damien Hedde <damien.hedde@greensocs.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.128.67
Subject: Re: [Qemu-arm] [Qemu-devel] RFC raspberry pi sd-card reset
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: o+Yp4rjMsQ8c

On Wed, Jul 31, 2019 at 5:43 PM Philippe Mathieu-Daud=C3=A9
<philmd@redhat.com> wrote:
> On 7/31/19 4:21 PM, Damien Hedde wrote:
> > Concerning the reset on the raspi2/3 machine, I ran into an issue with
> > the sd-card.
> >
> > Here follows a subset of the qbus/qdev tree of the raspi2&3 machine as
> > it is initialized:
> >  + System
> >    * bcm2835_gpio
> >      + sd-bus
> >        * sd-card
> >    * bcm2835-sdhost
> >      + bcm2835-sdhost-bus
> >    * generic-sdhci
> >      + sdhci-bus
> >
> > raspi_init does 2 things:
> >  + it creates the soc
> >  + then it explicitly creates the sd-card on the bcm2835_gpio's sd-bus
> >
> > As it happens, the reset moves the sd-card on another bus: the
> > sdhci-bus. More precisely the bcm2835_gpio reset method does it (the
> > sd-card can be mapped on bcm2835-sdhost-bus or sdhci-bus depending on
> > bcm2835_gpio registers, reset configuration corresponds to the sdhci-bu=
s).
> >
> > Reset call order is the following (it follows children-before-parent or=
der):
> >  1 sd-card
> >  2 sd-bus
> >  3 bcm2835_gpio -> move the sd-card
> >  4 bcm2835-sdhost-bus
> >  5 bcm2835-sdhost
> >  6 sd-card  (again)
> >  7 sdhci-bus
> >  8 generic-sdhci
> >
> > In the end, the sd-card is reset twice, which is no big-deal in itself.
>
> The machine cold reset implicitly cold resets the sd-card.
>
> IIRC the sd-bus shouldn't (cold/warm)-reset the sd-card.
>
> Only SDBusClass::set_inserted() can cold-reset the card.
>
> > But it only depends on the bcm2835_gpio tree being reset before the
> > generic-sdhci (probably depends on the machine creation code).
> >
> > I checked and it seems this is the only platform where such things
> > happen during master reset.
> >
> > IMO this is a bit hazardous because reset is based on the qdev/qbus
> > tree (and with the multi-phase I'm working on, even if it still works,
> > it's worse).
> > I'm not sure what we should do to avoid this (and if there's is
> > something to be done).
> >
> > The easiest solution would be to initialize the platform with the
> > sd-card at the right initial place (I do not really understand why it i=
s
> > created in the bcm2835_gpio in the first place since we move it just
> > after). But it won't solve the issue if a reset is done afterwards.
> >
> > Or maybe we could move the sd-card on the proper bus in a machine
> > reset code so that it's on the right place when we do the sysbus tree
> > reset just after.
> >
> > What do you think ?
>
> There is only 1 bus, the SDHCI bus lines are muxed with the GPIO ones.
>
> bcm2835-sdhost-bus should not be child of bcm2835-sdhost, the sdbus
> might be child of bcm2835-peripherals and shared by both sdhost and gpio
> (as a link property?).

There is a similar modelling issue with the AUX uart and SPI on this device=
.

> I tried to do that 2 years ago. I thought I posted the series and Peter
> rejected it but can't find it, maybe we had an IRC chat. I won't have
> time until next week to dig for it.
>
> >
> > --
> > Damien
> >
