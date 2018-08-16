Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp2139696wru;
        Thu, 16 Aug 2018 11:10:10 -0700 (PDT)
X-Google-Smtp-Source: AA+uWPxVmneycAcEq4R7TT5K2yv4Q0j8h4pZ8wrehs2mgOKTxbgpgps/+i/FwEvvF3P6lvU2lr6O
X-Received: by 2002:a37:1b1c:: with SMTP id b28-v6mr2196596qkb.393.1534443010595;
        Thu, 16 Aug 2018 11:10:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1534443010; cv=none;
        d=google.com; s=arc-20160816;
        b=Bz3WuH6/QyeyWDza25IW/yLLEJPbb0LmtCBrfwvM99f8cNxKuKa57prVFF+L0jjPpX
         RCpjO7aiWA0k/KZm6vulKSST4TPzc5vOJrxWbM85niX3DAyZS+6pgJWrV/1kQRKSNwsS
         bqvsocfAKKlkznFRYwFAX6aHd2I6sIsXK5SggvjXDjQOAo1wqhigbLjwqkgK+YyHP2me
         Gt4AJW2mM8u7ykv2HAAZAKw5Osgt7kfNrYDGXtr+wwqZTVxJ4vztR4g7mb5WGfA5moQF
         XmKYJZPDkSIvqUODj9EqyUFXPzyYMvQwpNRAPQ0nTtnRi+QelGzse5Ph0dXtK8NM10M2
         6EWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=mGdSs7c0FajcW0CoWu4/rAzd5dOUqp6/sJh4o5qrbdA=;
        b=LrWCMqZMyuehGuGD29D+3E9/fg56Qh55TxvGEuKynq6D2sZ2lQL9WAhm8vxV8QLgJD
         YGUxewwgYnVwDw50JVUyQEYxaIM7rttwsON+Lq1zDYsKSK8IEiIUBGCBxBxIl/iHqwFR
         HiKKfPiDyNBOd3iZibpMQdstp+qEUYQzJ5sxs8ENqtsJUlLL75+b6HqnQPhzym8mISLD
         VknPrV+o0sU2DdyeahrIPV5TiaOHcubmtmUbzhSiZSMqhG73M8IAODIh456qhun22WMa
         0fdjkXDVyBsoAPwWp6tit+i7nM1BdlUyfg6pPm1DsbkL6nhz+ouxbXUbkQb1A5LxKb3R
         CXBA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=HKyIE4so;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a10-v6si7585868qvk.39.2018.08.16.11.10.10
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 16 Aug 2018 11:10:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=HKyIE4so;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57588 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fqMio-0001Op-22
	for alex.bennee@linaro.org; Thu, 16 Aug 2018 14:10:10 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57385)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fqMbI-0007Sk-RQ
	for qemu-devel@nongnu.org; Thu, 16 Aug 2018 14:02:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fqMbH-0005NQ-QW
	for qemu-devel@nongnu.org; Thu, 16 Aug 2018 14:02:24 -0400
Received: from mail-oi0-x242.google.com ([2607:f8b0:4003:c06::242]:45765)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fqMbH-0005NC-LE
	for qemu-devel@nongnu.org; Thu, 16 Aug 2018 14:02:23 -0400
Received: by mail-oi0-x242.google.com with SMTP id q11-v6so9573475oic.12
	for <qemu-devel@nongnu.org>; Thu, 16 Aug 2018 11:02:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=mGdSs7c0FajcW0CoWu4/rAzd5dOUqp6/sJh4o5qrbdA=;
	b=HKyIE4somq25RjkRyE8KkQoAVv410/QR4kz1nkg9T3ibIQtWryotlPf8xNbxusBKT9
	qifzWlhCSwrNu2kp7owBXMn3JEhWJZ8G/I9nKrdbqk+B/BUE3tTwGixjeQNp6ydY5Ekk
	K5WCIa1WuElsAAQ12i4atnwcApZwvknYohgj4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=mGdSs7c0FajcW0CoWu4/rAzd5dOUqp6/sJh4o5qrbdA=;
	b=p9lwJAa+PLh/EE16hcONxRgc/NUiWr8SusxbEYwZkV0tK9nndhsOsgitSvLXGrHX4C
	5QYuKCATXO9Ur1diUSS9rphodx1arqgfa4lrECf/Bn9zpQf02JrLFLXhOk1hmEF0h0vL
	WUyrM8fawKTeIp9JlfO3rnU1ghe78ywExSc8cadg5vn6g7K6GuiZY5rushN7pvUN5zra
	zX7owlrDJ9Jk0QHxAF0jy3OR5gbYkXbJaL2jF53SJGDumFMyCjt16QXjTigNJo7far/k
	R7f1xgnluN5WT7s3H0Dw3j4bfjGybWipjNW9OAXK84wRHIGuKbnIVT2FZXgnATibXH6M
	fL0g==
X-Gm-Message-State: AOUpUlFmRLUtM9coGyhEmOyniWcMnbvDO5SBPrqMbz8jWBxYsFeBSrbr
	JgbNRMLNG4QqL3KeVvnz/Jtz7+sSwqu5+NU8cd0VMQ==
X-Received: by 2002:aca:6142:: with SMTP id
	v63-v6mr34916162oib.137.1534442542770; 
	Thu, 16 Aug 2018 11:02:22 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:5c8a:0:0:0:0:0 with HTTP; Thu, 16 Aug 2018 11:02:02
	-0700 (PDT)
In-Reply-To: <20180809130115.28951-1-peter.maydell@linaro.org>
References: <20180809130115.28951-1-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 16 Aug 2018 19:02:02 +0100
Message-ID: <CAFEAcA-AD=cxpGzgyZDU3vhCwthVaPg+WKWNLH+gjP=devvWZw@mail.gmail.com>
To: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::242
Subject: Re: [Qemu-devel] [Qemu-arm] [PATCH 00/16] arm: Implement MPS2
 watchdogs and DMA
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
Cc: "patches@linaro.org" <patches@linaro.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: xtEV5gA4QrzG

Ping for code review, please?

(It's only been a week so this is a little bit eager, but
I have some more MPS patches which wire up the PL022 SPI
controllers, which I'm holding off on posting until this
and the preceding FPGAIO set get reviewed and committed, so
as not to have too many MPS patches in flight at once.)

thanks
-- PMM

On 9 August 2018 at 14:00, Peter Maydell <peter.maydell@linaro.org> wrote:
> This patchset adds some more missing devices to the MPS2 AN505
> board model:
>
> Patches 1-3 implement and wire up the CMSDK APB watchdog devices.
>
> Patch 4 adds a CMSDK timer device that had been forgotten.
>
> Ppatches 5-6 implement and wire up the "system control element",
> which is some simple control/ID registers in the IoTKit
>
> Patches 7-16 are the meat of the patchset, and add support
> for the DMA controllers and their associated Master Security
> Controllers. A TrustZone MSC sits in front of a device which
> can be a bus master (such as a DMA controller) and allows secure
> software to configure it to either pass through or reject transactions
> made by that bus master. Rejected transactions may be configured to
> either be aborted, or to behave as RAZ/WI. An interrupt can be
> signalled for a rejected transaction. The AN505 has four
> PL081 DMA controllers, each with its own MSC.
>
> Patches 10-15 are various minor cleanups and bugfixes in
> the PL081 model that are needed for its use in the AN505.
> In particular the PL081 was previously entirely broken as
> it would hw_error() as soon as the guest enabled the DMA
> engine. I assume this was either accidentally left-in debug code,
> or a deliberate choice to guard a never-tested implementation
> so as to be able to identify when we had guest code to test it
> with. (Linux for the realview/versatile boards never tries to
> use the PL08x there for DMA.)
>
> This patchset is sufficient for the "DMA" test in the AN505
> self-test binary to pass. (I suspect it is not giving the
> PL081 or MSC a very thorough workout, though.)
>
> Based-on: <20180730162458.23186-1-peter.maydell@linaro.org>
> ("[PATCH 0/5] mps2: Implement FPGAIO counters and dual-timer")
>
> thanks
> -- PMM
>
> Peter Maydell (16):
>   hw/watchdog/cmsdk_apb_watchdog: Implement CMSDK APB watchdog module
>   nvic: Expose NMI line
>   hw/arm/iotkit: Wire up the watchdogs
>   hw/arm/iotkit: Wire up the S32KTIMER
>   hw/misc/iotkit-sysctl: Implement IoTKit system control element
>   hw/misc/iotkit: Wire up the system control element
>   hw/misc/tz-msc: Model TrustZone Master Security Controller
>   hw/misc/iotkit-secctl: Wire up registers for controlling MSCs
>   hw/arm/iotkit: Wire up the lines for MSCs
>   hw/dma/pl080: Allow use as embedded-struct device
>   hw/dma/pl080: Support all three interrupt lines
>   hw/dma/pl080: Don't use CPU address space for DMA accesses
>   hw/dma/pl080: Provide device reset function
>   hw/dma/pl080: Correct bug in register address decode logic
>   hw/dma/pl080: Remove hw_error() if DMA is enabled
>   hw/arm/mps2-tz: Create PL081s and MSCs
>
>  Makefile.objs                            |   1 +
>  hw/misc/Makefile.objs                    |   2 +
>  hw/watchdog/Makefile.objs                |   1 +
>  include/hw/arm/iotkit.h                  |  20 +-
>  include/hw/dma/pl080.h                   |  71 +++++
>  include/hw/misc/iotkit-secctl.h          |  14 +
>  include/hw/misc/iotkit-sysctl.h          |  50 ++++
>  include/hw/misc/tz-msc.h                 |  79 ++++++
>  include/hw/watchdog/cmsdk-apb-watchdog.h |  59 ++++
>  hw/arm/armv7m.c                          |   1 +
>  hw/arm/iotkit.c                          |  99 ++++++-
>  hw/arm/mps2-tz.c                         | 101 ++++++-
>  hw/arm/realview.c                        |   8 +-
>  hw/arm/versatilepb.c                     |   9 +-
>  hw/dma/pl080.c                           | 113 ++++----
>  hw/intc/armv7m_nvic.c                    |  19 ++
>  hw/misc/iotkit-secctl.c                  |  73 ++++-
>  hw/misc/iotkit-sysctl.c                  | 324 ++++++++++++++++++++++
>  hw/misc/tz-msc.c                         | 308 +++++++++++++++++++++
>  hw/watchdog/cmsdk-apb-watchdog.c         | 326 +++++++++++++++++++++++
>  MAINTAINERS                              |   7 +
>  default-configs/arm-softmmu.mak          |   3 +
>  hw/intc/trace-events                     |   1 +
>  hw/misc/trace-events                     |  16 ++
>  hw/watchdog/trace-events                 |   6 +
>  25 files changed, 1632 insertions(+), 79 deletions(-)
>  create mode 100644 include/hw/dma/pl080.h
>  create mode 100644 include/hw/misc/iotkit-sysctl.h
>  create mode 100644 include/hw/misc/tz-msc.h
>  create mode 100644 include/hw/watchdog/cmsdk-apb-watchdog.h
>  create mode 100644 hw/misc/iotkit-sysctl.c
>  create mode 100644 hw/misc/tz-msc.c
>  create mode 100644 hw/watchdog/cmsdk-apb-watchdog.c
>  create mode 100644 hw/watchdog/trace-events
>
> --
> 2.17.1
