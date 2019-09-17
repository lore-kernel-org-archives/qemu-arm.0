Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp5846105wrp;
        Tue, 17 Sep 2019 16:34:10 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwHnVBAxi096KCyGc2BxkW64ofPKAwZwkinne0P1p8ahNqyk+ULoraKNnd+48y1zpO2g+4P
X-Received: by 2002:a17:906:cc9b:: with SMTP id oq27mr6086193ejb.125.1568763250870;
        Tue, 17 Sep 2019 16:34:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1568763250; cv=none;
        d=google.com; s=arc-20160816;
        b=ncxJFT6GgyQFv3oo0zSTUxscr9x6J3W6TN5lElT+exiSZVB2wGl5WZx5G9e+BydEQ7
         8yl/K+pdfVLKZK9WXcY3v89LcaYXbqdCE8Tw1A98VQ2w7BxHVps+JXUEtPT/mptPqLth
         gPdOzYye2lG/SQrwDM4g7UHKnase2CSYHIgp3sPt0CFP5oB3x/Ddl2hh63ZK28X6Mgyo
         rRcUvkhGXwlg/URt/DRjuQxS5CxT/4yq2At94Wel8Tr/g2j0Ntr1hJU7Lg9E5WCPrS/7
         pfDwZLHSYv3AOiYkvWtlHl7wXY/XSI19uCGY+MU4xLuaRQZ4bJLFI+3PnQy/BGEfg0+P
         E0Gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature;
        bh=NFfngu4qiu+UdawEd84UgqAiCsI9ZcVvohMXB947E/8=;
        b=vrZRMSMetxJkRPPblOP9GnCej6hsJHbIzfcMX7/KPv3z9Ai4DkcqNDs7PNN+t33pSO
         s/QMECyGueXILBrPeyIywzXp94k1XPTpmuMpa3Rm6z0dobsgMwgZaQbCEksn5K+jUrTw
         S0ulID6VgtKRXnTgbn57GYUrqk84r0qp45rvLCMqyVMXHIzvjR1rqCq35tOfiQd0fnr1
         U9cpuytO2qV7oAi4vtCJEtMej8OM6L9HGo1jqEF6T8eF27LmZmDPRnL+Dmoi2twuv2iF
         cpMNqRFlWgfP97iadCML4dgNyog20wrW36FcS4xNLPCLsgWal7sTPyHYnYATNJmDpm6j
         JWvA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Fi9CgOlQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k53si2372554edb.303.2019.09.17.16.34.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 17 Sep 2019 16:34:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Fi9CgOlQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:53504 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iAMz3-0000j7-RP
	for alex.bennee@linaro.org; Tue, 17 Sep 2019 19:34:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51483)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alistair23@gmail.com>) id 1iAMym-0000hC-Ri
 for qemu-arm@nongnu.org; Tue, 17 Sep 2019 19:33:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alistair23@gmail.com>) id 1iAMyj-00073F-O6
 for qemu-arm@nongnu.org; Tue, 17 Sep 2019 19:33:52 -0400
Received: from mail-lf1-x144.google.com ([2a00:1450:4864:20::144]:33791)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alistair23@gmail.com>)
 id 1iAMyX-0006uW-Dv; Tue, 17 Sep 2019 19:33:39 -0400
Received: by mail-lf1-x144.google.com with SMTP id y127so4252596lfc.0;
 Tue, 17 Sep 2019 16:33:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=NFfngu4qiu+UdawEd84UgqAiCsI9ZcVvohMXB947E/8=;
 b=Fi9CgOlQagT5Lkje+YIt6Smx3i+mgbFBaUUrOPV4PnZM2CSYTDWRgqaENqvb5NG0Sg
 9Wl8L9i8KT37Q+QnUymPUZo4rzNEuXj3PiYbM6Pb0KDOr9/luomcT3T3RIWqnDS0BzbQ
 /pDpW514OS4eZzQvySRaRPv1tX4VmzpoJ36HrUL5ZohaYKhh3+vuTKmDt3r66ePVHp1U
 jL/JtdxSZbSG7ie9qeTo7jGvwkC+cxomcDmUB5D2H1FIm2X6/mHmnQUyA7A9iHzYzrWZ
 YRrv+sFCz3/w5K4x21IYIh4Q1NUfKKxC9uAP/oR2oLWOiNgbF+xNkAWr4mBroPUseD2U
 KgUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=NFfngu4qiu+UdawEd84UgqAiCsI9ZcVvohMXB947E/8=;
 b=NoQ4lCb/h7m/jAt+4F5UANs+ZCb2h50qZn8Ps0tqrwhG89EtLVYDj4HMgnL5Masrs3
 nBCVq3KII7tpYLLx2NoWZLs33IDuokVZ8eNGw4Z9hmJOp8pFxmd6Vyk9uOA5THTkCcB9
 u1hPGOd9hFOp2B9BLYWirNEtuuD1ED+rt79QU7IVOGx5+T2BFkuZEAQNZjGs0Vo5G8sT
 KoRMoCba5yjlTnVXZrt+iAxPrCgbx6r3anxbKC8dUmr+i42WU7gpzfpyKE9YE4487Nmu
 rDDi/FZAXdz3Ud32Ikw3TSjPKOy50rHEEhQ5l1dBTngubVLUGMOMP70FaGAZh1mGidE9
 NkJA==
X-Gm-Message-State: APjAAAWZgfWFbkdWJrdl5NOzcfUQ06k5UK05Kk/ny7OVpfz0eLHSTnnc
 mvXeARxdMe7trPBiciDQWvjNkb52bmT4C6avc/w=
X-Received: by 2002:a19:f11c:: with SMTP id p28mr420534lfh.44.1568763214402;
 Tue, 17 Sep 2019 16:33:34 -0700 (PDT)
MIME-Version: 1.0
References: <20190916154847.28936-1-philmd@redhat.com>
 <20190916154847.28936-10-philmd@redhat.com>
 <CAKmqyKPtRbU5X-72+HfNNbaV46LOD6D+JLQoGiBROB+zJczNgA@mail.gmail.com>
 <7a48ec0e-c386-7022-b7ab-00f0cb53fa82@redhat.com>
In-Reply-To: <7a48ec0e-c386-7022-b7ab-00f0cb53fa82@redhat.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 17 Sep 2019 16:29:01 -0700
Message-ID: <CAKmqyKPgz6a49mx==AUtLk0AKxB7XVNt7jxGW1dQZKkQBPM7Fg@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::144
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 09/13] hw: Move Xilinx ZynqMP
 RTC from hw/timer/ to hw/rtc/ subdirectory
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Aleksandar Rikalo <arikalo@wavecomp.com>, Helge Deller <deller@gmx.de>,
 =?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>,
 Joel Stanley <joel@jms.id.au>, David Gibson <david@gibson.dropbear.id.au>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <alistair@alistair23.me>, qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Igor Mammedov <imammedo@redhat.com>, Richard Henderson <rth@twiddle.net>,
 Andrew Jeffery <andrew@aj.id.au>, "open list:New World" <qemu-ppc@nongnu.org>,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: hklhv1QYAS0L

On Tue, Sep 17, 2019 at 3:28 AM Philippe Mathieu-Daud=C3=A9
<philmd@redhat.com> wrote:
>
> Hi Alistair,
>
> On 9/16/19 11:44 PM, Alistair Francis wrote:
> > On Mon, Sep 16, 2019 at 8:56 AM Philippe Mathieu-Daud=C3=A9
> > <philmd@redhat.com> wrote:
> >>
> >> Move RTC devices under the hw/rtc/ subdirectory.
> >>
> >> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> >> ---
> >>  hw/rtc/Makefile.objs                        | 1 +
> >>  hw/rtc/trace-events                         | 3 +++
> >>  hw/{timer =3D> rtc}/xlnx-zynqmp-rtc.c         | 2 +-
> >>  hw/timer/Makefile.objs                      | 1 -
> >>  hw/timer/trace-events                       | 3 ---
> >>  include/hw/arm/xlnx-zynqmp.h                | 2 +-
> >>  include/hw/{timer =3D> rtc}/xlnx-zynqmp-rtc.h | 6 +++---
> >>  7 files changed, 9 insertions(+), 9 deletions(-)
> >>  rename hw/{timer =3D> rtc}/xlnx-zynqmp-rtc.c (99%)
> >>  rename include/hw/{timer =3D> rtc}/xlnx-zynqmp-rtc.h (95%)
> >>
> >> diff --git a/hw/rtc/Makefile.objs b/hw/rtc/Makefile.objs
> >> index b195863291..543a550a0f 100644
> >> --- a/hw/rtc/Makefile.objs
> >> +++ b/hw/rtc/Makefile.objs
> >> @@ -6,5 +6,6 @@ common-obj-$(CONFIG_M48T59) +=3D m48t59-isa.o
> >>  endif
> >>  common-obj-$(CONFIG_PL031) +=3D pl031.o
> >>  common-obj-$(CONFIG_TWL92230) +=3D twl92230.o
> >> +common-obj-$(CONFIG_XLNX_ZYNQMP) +=3D xlnx-zynqmp-rtc.o
> >>  obj-$(CONFIG_MC146818RTC) +=3D mc146818rtc.o
> >>  common-obj-$(CONFIG_SUN4V_RTC) +=3D sun4v-rtc.o
> >> diff --git a/hw/rtc/trace-events b/hw/rtc/trace-events
> >> index ac9e0e0fba..7f1945ad4c 100644
> >> --- a/hw/rtc/trace-events
> >> +++ b/hw/rtc/trace-events
> >> @@ -4,6 +4,9 @@
> >>  sun4v_rtc_read(uint64_t addr, uint64_t value) "read: addr 0x%" PRIx64=
 " value 0x%" PRIx64
> >>  sun4v_rtc_write(uint64_t addr, uint64_t value) "write: addr 0x%" PRIx=
64 " value 0x%" PRIx64
> >>
> >> +# xlnx-zynqmp-rtc.c
> >> +xlnx_zynqmp_rtc_gettime(int year, int month, int day, int hour, int m=
in, int sec) "Get time from host: %d-%d-%d %2d:%02d:%02d"
> >> +
> >>  # pl031.c
> >>  pl031_irq_state(int level) "irq state %d"
> >>  pl031_read(uint32_t addr, uint32_t value) "addr 0x%08x value 0x%08x"
> >> diff --git a/hw/timer/xlnx-zynqmp-rtc.c b/hw/rtc/xlnx-zynqmp-rtc.c
> >> similarity index 99%
> >> rename from hw/timer/xlnx-zynqmp-rtc.c
> >> rename to hw/rtc/xlnx-zynqmp-rtc.c
> >> index 5692db98c2..f9f09b7296 100644
> >> --- a/hw/timer/xlnx-zynqmp-rtc.c
> >> +++ b/hw/rtc/xlnx-zynqmp-rtc.c
> >> @@ -36,7 +36,7 @@
> >>  #include "qemu/cutils.h"
> >>  #include "sysemu/sysemu.h"
> >>  #include "trace.h"
> >> -#include "hw/timer/xlnx-zynqmp-rtc.h"
> >> +#include "hw/rtc/xlnx-zynqmp-rtc.h"
> >>  #include "migration/vmstate.h"
> >>
> >>  #ifndef XLNX_ZYNQMP_RTC_ERR_DEBUG
> >> diff --git a/hw/timer/Makefile.objs b/hw/timer/Makefile.objs
> >> index 70b61b69c7..294465ef47 100644
> >> --- a/hw/timer/Makefile.objs
> >> +++ b/hw/timer/Makefile.objs
> >> @@ -14,7 +14,6 @@ common-obj-$(CONFIG_IMX) +=3D imx_epit.o
> >>  common-obj-$(CONFIG_IMX) +=3D imx_gpt.o
> >>  common-obj-$(CONFIG_LM32) +=3D lm32_timer.o
> >>  common-obj-$(CONFIG_MILKYMIST) +=3D milkymist-sysctl.o
> >> -common-obj-$(CONFIG_XLNX_ZYNQMP) +=3D xlnx-zynqmp-rtc.o
> >>  common-obj-$(CONFIG_NRF51_SOC) +=3D nrf51_timer.o
> >>
> >>  common-obj-$(CONFIG_ALTERA_TIMER) +=3D altera_timer.o
> >> diff --git a/hw/timer/trace-events b/hw/timer/trace-events
> >> index ce34b967db..1459d07237 100644
> >> --- a/hw/timer/trace-events
> >> +++ b/hw/timer/trace-events
> >> @@ -70,9 +70,6 @@ cmsdk_apb_dualtimer_reset(void) "CMSDK APB dualtimer=
: reset"
> >>  aspeed_rtc_read(uint64_t addr, uint64_t value) "addr 0x%02" PRIx64 " =
value 0x%08" PRIx64
> >>  aspeed_rtc_write(uint64_t addr, uint64_t value) "addr 0x%02" PRIx64 "=
 value 0x%08" PRIx64
> >>
> >> -# xlnx-zynqmp-rtc.c
> >> -xlnx_zynqmp_rtc_gettime(int year, int month, int day, int hour, int m=
in, int sec) "Get time from host: %d-%d-%d %2d:%02d:%02d"
> >> -
> >>  # nrf51_timer.c
> >>  nrf51_timer_read(uint64_t addr, uint32_t value, unsigned size) "read =
addr 0x%" PRIx64 " data 0x%" PRIx32 " size %u"
> >>  nrf51_timer_write(uint64_t addr, uint32_t value, unsigned size) "writ=
e addr 0x%" PRIx64 " data 0x%" PRIx32 " size %u"
> >> diff --git a/include/hw/arm/xlnx-zynqmp.h b/include/hw/arm/xlnx-zynqmp=
.h
> >> index d7483c3b42..53076fa29a 100644
> >> --- a/include/hw/arm/xlnx-zynqmp.h
> >> +++ b/include/hw/arm/xlnx-zynqmp.h
> >> @@ -29,7 +29,7 @@
> >>  #include "hw/dma/xlnx-zdma.h"
> >>  #include "hw/display/xlnx_dp.h"
> >>  #include "hw/intc/xlnx-zynqmp-ipi.h"
> >> -#include "hw/timer/xlnx-zynqmp-rtc.h"
> >> +#include "hw/rtc/xlnx-zynqmp-rtc.h"
> >>  #include "hw/cpu/cluster.h"
> >>  #include "target/arm/cpu.h"
> >>
> >> diff --git a/include/hw/timer/xlnx-zynqmp-rtc.h b/include/hw/rtc/xlnx-=
zynqmp-rtc.h
> >> similarity index 95%
> >> rename from include/hw/timer/xlnx-zynqmp-rtc.h
> >> rename to include/hw/rtc/xlnx-zynqmp-rtc.h
> >> index 97e32322ed..6fa1cb2f43 100644
> >> --- a/include/hw/timer/xlnx-zynqmp-rtc.h
> >> +++ b/include/hw/rtc/xlnx-zynqmp-rtc.h
> >> @@ -3,7 +3,7 @@
> >>   *
> >>   * Copyright (c) 2017 Xilinx Inc.
> >>   *
> >> - * Written-by: Alistair Francis <alistair.francis@xilinx.com>
> >> + * Written-by: Alistair Francis
> >
> > Why remove the email address?
>
> In https://lists.gnu.org/archive/html/qemu-devel/2019-01/msg00759.html
> Thomas suggested to remove invalid email addresses:
>
>   I don't think that this e-mail address is still valid since that
>   company has been bought up > 10 years ago... so it likely does not
>   make sense to mention it in new files anymore. So just mention the
>   name?
>
> In your case Xilinx still exists, but you warned us it might bounce:

Yeah, I assume it bounces now.

>
> $ git show c22e580c2ad
> commit c22e580c2ad1cccef582e1490e732f254d4ac064 (tag:
> pull-target-arm-20180301)
> Author: Alistair Francis <alistair.francis@xilinx.com>
> Date:   Thu Mar 1 11:05:58 2018 +0000
>
>     MAINTAINERS: Update my email address
>
>     I am leaving Xilinx, so to avoid having an email address that bounces
>     update my maintainer address to point to my personal email address.
>
> So I stripped your obsolete email.
>
> Since the line is not "(c) Name <email>" but simply "Written by" and the
> (C) remains to Xilinx, we could update the email by your personal one,
> that seems fair (so if someone want to contact you to ask you question
> about your code, he still can).

I always though that the email address indicated that "Alistair
Francis" wrote this, but while being funded by "Xilinx". It gave both
parties credit for the work. The email address is also unique (at
least somewhat) which helps tie things together if you have a common
name.

You are right though that the author and copyright tags do the same thing.

As for contact to ask questions that is where the maintainers file
comes in, so it probably doesn't matter too much.

>
> What do you prefer?

I'm not fussed, was just curious why you thought the email should be
removed. It's fine as it is.

Alistair

>
> >
> > Otherwise:
> >
> > Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
>
> Thanks!
>
> >
> > Alistair
> >
> >>   *
> >>   * Permission is hereby granted, free of charge, to any person obtain=
ing a copy
> >>   * of this software and associated documentation files (the "Software=
"), to deal
> >> @@ -24,8 +24,8 @@
> >>   * THE SOFTWARE.
> >>   */
> >>
> >> -#ifndef HW_TIMER_XLNX_ZYNQMP_RTC_H
> >> -#define HW_TIMER_XLNX_ZYNQMP_RTC_H
> >> +#ifndef HW_RTC_XLNX_ZYNQMP_H
> >> +#define HW_RTC_XLNX_ZYNQMP_H
> >>
> >>  #include "hw/register.h"
> >>  #include "hw/sysbus.h"
> >> --
> >> 2.20.1
> >>
> >>
