Received: by 10.25.0.6 with SMTP id 6csp1503284lfa;
        Mon, 15 May 2017 09:49:27 -0700 (PDT)
X-Received: by 10.200.2.159 with SMTP id p31mr6920499qtg.55.1494866967119;
        Mon, 15 May 2017 09:49:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1494866967; cv=none;
        d=google.com; s=arc-20160816;
        b=RYWW6OBxNqD0yntu2MhPFpTUQRR/5XYptIY2/UiZvXEoaa8+sA2pW1M+6ivHcq8gEI
         9dWP9HX7luFABdKxIerICiWm84t38T5RYRDqz/FeRqERi3IX/g0jUCTQebRDZbBDGczw
         E82V6b+prH2JsPVR7RHZrZLa2XtWsCEUMmXV/RGskirmvRSHUpL+y9s+EP3nZcuT/6B3
         uZaNAQ2Ie9C6TsSojsetImnsnSdMPSOLCWyx6f9HOZw6nF6eelKJMaemVrOnXiBbsce+
         +aat7wfJXacElHn/KHXC3YVbY8aDF12Y7XtIA3AuddX9VJZ057vE9yyDfe6fhbuCvnP4
         /FyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=gxwJdj7TjNsal0v6PB0WDC5EI8wMug7Lm59YP5MkDnA=;
        b=ZoDvL9ILvSuOrnKD+dxeWmTGORP6KNlqahYP9aSoQ0iYvi2LEI5gpRhcHNYfF9uXBJ
         WlMmLF9msTUaFJdHJ/ntQl2Og5MKsSyYlEx9rb7XZvSXDwZWUFhS3Lt5khF5yJ90ELmD
         7C5tw/RM5ueLeDBEUH5GlMO1Nn9qd+S3uCU3VnHfnqcab8PiliURBG2/vmN9ju3ya1QF
         pFPDwfKSD2oX5O1R1iFELBQDnJ/YBMOr1IoZeRrg6Sqnaej5caMUgfiEMdyWatk6fUeQ
         Yc3iKM00PYSgAOZlxkUizdcWp4P0mX6SyBHeY250jblnWb2+Hmqy2uyzhAg3ey/aN+E8
         uoAA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p67si5648640qkc.235.2017.05.15.09.49.26
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 15 May 2017 09:49:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:37784 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dAJBW-0001sH-KM
	for alex.bennee@linaro.org; Mon, 15 May 2017 12:49:26 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35739)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1dAJ9e-0000hS-Bd
	for qemu-devel@nongnu.org; Mon, 15 May 2017 12:47:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1dAJ9d-0002VZ-6f
	for qemu-devel@nongnu.org; Mon, 15 May 2017 12:47:30 -0400
Received: from mail-oi0-x243.google.com ([2607:f8b0:4003:c06::243]:35399)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1dAJ9d-0002UP-1S; Mon, 15 May 2017 12:47:29 -0400
Received: by mail-oi0-x243.google.com with SMTP id m17so19788957oik.2;
	Mon, 15 May 2017 09:47:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=gxwJdj7TjNsal0v6PB0WDC5EI8wMug7Lm59YP5MkDnA=;
	b=DkBz88FMwpCFcdt/gdIXBoH2gaXUw5RW6CidswTfIMZn8QOIyIIKM5cOPlH1QpMLIh
	oDX5/o+493c1Dy4l+wKCBzpUw7JlecJVi1yvdcTS4s2odxzVC67gAC5XqAWxkcdioEX1
	ZDddPmCbnZ5ZI9lWHO2QSmPZjMVV2O233J/gMhWAgLZvWQviU2ijZkrMnLodEkeHIybU
	/15EUZlCw/EKoT9GmryjAVFlpfkQDdXcf+9C9VFVUOEjkRzTtjl7BocQgK/oYqKh087V
	Jrph7aObdOiNKNYYEvLmNkZ1Dd7lsJW3sS5nO/+ahh2/O5Anxc7Sxds6qBIAdWHodJtY
	FN8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=gxwJdj7TjNsal0v6PB0WDC5EI8wMug7Lm59YP5MkDnA=;
	b=CNAsy/+8ObI2yS3vO/r6BWdrwSAAJxg8vGaIMAU5MPlENE9cNnSOiSw3rre731DvqO
	MVYdvOTkhh//RayXq2BTI7wFFtcfwoIobc5CVRChI5ejmJeUnLbqxLcVhdXuukEKoays
	vKBk/xsO0OmIgAsctyLYoJgMfzYGI7W4ZhHJZ2bT8t2Cu9Ae/8mJYLLJ2KFED71GzT/+
	+5dcu60k+GEJCY1vi6MceKsKJ1Sh4xhU5AdcIlfcMPXeiQC4jSd09I8eFTJYlHEmZze7
	GKzyB+QmZupiPjo4MENmz2NJ9IC3sshflf1pROt956pWF0lxxBdRfSSN4H1tyE3Wrkvt
	ncNA==
X-Gm-Message-State: AODbwcC+67Iht+Gg27KUoz5A2JXXXkRoqxODYgqlssaiL7zy/UIcaev0
	YVDZAc9xzaQWCf5cxz5CTxzbBj2tWw==
X-Received: by 10.157.84.38 with SMTP id j38mr3676258oth.183.1494866847651;
	Mon, 15 May 2017 09:47:27 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.182.16.163 with HTTP; Mon, 15 May 2017 09:46:57 -0700 (PDT)
In-Reply-To: <757990479.60759.1494722527715@mail.yahoo.com>
References: <757990479.60759.1494722527715.ref@mail.yahoo.com>
	<757990479.60759.1494722527715@mail.yahoo.com>
From: Alistair Francis <alistair.francis@xilinx.com>
Date: Mon, 15 May 2017 09:46:57 -0700
X-Google-Sender-Auth: zZmxWfC1YGJBqBVfpX7c64cS18Q
Message-ID: <CAKmqyKPy35OuMkixGnDXOvApAu82uXrtQStSz4GzHNRStdFFNA@mail.gmail.com>
To: John Bradley <flypie1@yahoo.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::243
Subject: Re: [Qemu-devel] Changes to Broadcom(BCM) files and Raspberry Pi
 files. Addition of PanelEmu
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Laurent Vivier <lvivier@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	John Bradley <flypie@rocketmail.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	Markus Armbruster <armbru@redhat.com>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: pIcnF4vDy6Dz

On Sat, May 13, 2017 at 5:42 PM, John Bradley via Qemu-devel
<qemu-devel@nongnu.org> wrote:
> From 7f74f048f135d9c9c230a9e90f72451c841c6d35 Mon Sep 17 00:00:00 2001
> From: John Bradley <flypie@rocketmail.com>
> Date: Sat, 13 May 2017 23:07:47 +0100
> Subject: [PATCH] Changes to Broadcom(BCM) files and Raspberry Pi files.
> Addition of PanelEmu
>
> The files add the ability to attach, via TCP, a panel emulator
> The include a unification of several PD Raspberry PI additions
> A modification to dev-network to all circle SDK WWW client to work
> The DummyPanel is not included but available at
> https://github.com/flypie/GDummyPanel.git
>
> Signed-off-by: John Bradley <flypie@rocketmail.com>

Hey John,

Thanks for the patch!

Unfortunately this patch is too long to review, you need to split the
patch up into shorter more readable patches. Otherwise it's too hard
to people to understand what you are changing and why.

There are some details here:
http://wiki.qemu.org/Contribute/SubmitAPatch about how to split up
patches. Each patch applied in order shouldn't break any compilation
or runtime. Generally the flow is to add the logic in earlier patches
and then connect it and switch it on in the later patches.

Try splitting up adding/editing each individual device and send that
our first. That is generally the easiest to review/accept.

Thanks,

Alistair

> ---
> .gitignore                           |   54 ++
> hw/arm/Makefile.objs                 |    2 +-
> hw/arm/bcm2835.c                     |  114 ++++
> hw/arm/bcm2835_peripherals.c         |  104 ++++
> hw/arm/bcm2836.c                     |    3 +-
> hw/arm/raspi.c                       |   77 ++-
> hw/gpio/bcm2835_gpio.c               |  333 ++++++-----
> hw/misc/Makefile.objs                |    2 +
> hw/misc/bcm2835_mphi.c               |  163 ++++++
> hw/misc/bcm2835_power.c              |  106 ++++
> hw/timer/Makefile.objs               |    2 +
> hw/timer/bcm2835_st.c                |  202 +++++++
> hw/timer/bcm2835_timer.c             |  224 +++++++
> hw/usb/Makefile.objs                 |    4 +-
> hw/usb/bcm2835_usb.c                 |  604 +++++++++++++++++++
> hw/usb/bcm2835_usb_regs.h            | 1061 ++++++++++++++++++++++++++++++++++
> hw/usb/dev-network.c                 |    2 +-
> include/hw/arm/bcm2835.h             |   37 ++
> include/hw/arm/bcm2835_peripherals.h |   10 +
> include/hw/gpio/bcm2835_gpio.h       |    5 +
> include/hw/intc/bcm2835_control.h    |   53 ++
> include/hw/intc/bcm2836_control.h    |    2 +
> include/hw/misc/bcm2835_mphi.h       |   28 +
> include/hw/misc/bcm2835_power.h      |   22 +
> include/hw/timer/bcm2835_st.h        |   25 +
> include/hw/timer/bcm2835_timer.h     |   32 +
> include/hw/usb/bcm2835_usb.h         |   78 +++
> include/qemu/PanelEmu.h              |   53 ++
> util/Makefile.objs                   |    1 +
> util/PanelEmu.c                      |  293 ++++++++++
> 30 files changed, 3547 insertions(+), 149 deletions(-)
> create mode 100644 hw/arm/bcm2835.c
> create mode 100644 hw/misc/bcm2835_mphi.c
> create mode 100644 hw/misc/bcm2835_power.c
> create mode 100644 hw/timer/bcm2835_st.c
> create mode 100644 hw/timer/bcm2835_timer.c
> create mode 100644 hw/usb/bcm2835_usb.c
> create mode 100644 hw/usb/bcm2835_usb_regs.h
> create mode 100644 include/hw/arm/bcm2835.h
> create mode 100644 include/hw/intc/bcm2835_control.h
> create mode 100644 include/hw/misc/bcm2835_mphi.h
> create mode 100644 include/hw/misc/bcm2835_power.h
> create mode 100644 include/hw/timer/bcm2835_st.h
> create mode 100644 include/hw/timer/bcm2835_timer.h
> create mode 100644 include/hw/usb/bcm2835_usb.h
> create mode 100644 include/qemu/PanelEmu.h
> create mode 100644 util/PanelEmu.c
>
