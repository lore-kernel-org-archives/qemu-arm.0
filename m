Received: by 10.25.159.19 with SMTP id i19csp1272857lfe;
        Mon, 8 Feb 2016 03:33:42 -0800 (PST)
X-Received: by 10.55.71.146 with SMTP id u140mr32583921qka.14.1454931222559;
        Mon, 08 Feb 2016 03:33:42 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d66si30073095qkj.38.2016.02.08.03.33.42
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 08 Feb 2016 03:33:42 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro.org
Received: from localhost ([::1]:43714 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aSk4c-0003lG-2o
	for alex.bennee@linaro.org; Mon, 08 Feb 2016 06:33:42 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41511)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aSk4Z-0003kk-2e
	for qemu-arm@nongnu.org; Mon, 08 Feb 2016 06:33:40 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aSk4X-0005dM-QL
	for qemu-arm@nongnu.org; Mon, 08 Feb 2016 06:33:39 -0500
Received: from mail-vk0-x233.google.com ([2607:f8b0:400c:c05::233]:33583)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aSk4X-0005dG-IH
	for qemu-arm@nongnu.org; Mon, 08 Feb 2016 06:33:37 -0500
Received: by mail-vk0-x233.google.com with SMTP id k196so26480079vka.0
	for <qemu-arm@nongnu.org>; Mon, 08 Feb 2016 03:33:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=/jhR7+mwd1Y4YkV7OsOSeeTHZKgMvxtKHIUTP7yeYaQ=;
	b=BL8B+v7yHq88Wzxxw8SZb0kvY8XOF+bY/gLUt93nmvWv+J9zVZR9rX6hyRvFq0HBgc
	HpqUbHS8RnLD+jtH+ELfGhAVICCEr+oAaEJ7REZ3fsD8VCfeydhJNQE48JGaKqqyO05k
	Azcez+BRvxjg1ROSelpFgfWvwk8DPN5dsZv2I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=/jhR7+mwd1Y4YkV7OsOSeeTHZKgMvxtKHIUTP7yeYaQ=;
	b=eAOT034XNUlDXf7hEzhvsHO5yJ10r/XwlYt4mDO+s0bnnZfVQ5N5ae8LM5h6dGUCvr
	Yh8l1M4k6QURDf+bGEuXcxkoBRgsVOgg0j1Yl7ySd26KR4mY95JdOwR2QUJnLdh66wKW
	/11nIjYVS3s6if3UgK7RegFAU0P/ykrBww/SmMC9S/zFhLV+RKIhE3xlg+yZ9IRCyhZr
	yZRQjmO0O+FehFKntbBZv2ShHX0nKAnCoO1UxBxU5ZEgMKmW2qNNavpogYCo17+8omab
	e12UDGWRju7A6SWCweouvSgS7koLEJk7bV9HuIepD30DrYefrvM/AdsU9Vlxa6mQynuW
	Z6bA==
X-Gm-Message-State: AG10YOQfqKIUPyVqDHjPxhX3VTxwYe0Uq7uqt5Os2HxglsMOrEq8VbVd2LT+Vcy7cBEVLxrS0ji1bFgY+3IHiwpi
X-Received: by 10.31.141.2 with SMTP id p2mr19994712vkd.37.1454931216796; Mon,
	08 Feb 2016 03:33:36 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.56.216 with HTTP; Mon, 8 Feb 2016 03:33:17 -0800 (PST)
In-Reply-To: <1453479402-14870-1-git-send-email-peter.maydell@linaro.org>
References: <1453479402-14870-1-git-send-email-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 8 Feb 2016 11:33:17 +0000
Message-ID: <CAFEAcA9vA3mrDuZfR=uCOmX8o4eyfoQ-enaWi8061qos0qAuOA@mail.gmail.com>
To: QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::233
Cc: Patch Tracking <patches@linaro.org>,
	Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>,
	Markus Armbruster <armbru@redhat.com>,
	Alistair Francis <alistair.francis@xilinx.com>,
	Kevin O'Connor <kevin@koconnor.net>, qemu-arm <qemu-arm@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2 00/10] hw/sd: QOMify sd.c
	(and pxa2xx_mmci)
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: C9kF9+589lcy

Ping?

thanks
-- PMM

On 22 January 2016 at 16:16, Peter Maydell <peter.maydell@linaro.org> wrote:
> This series attempts to QOMify sd.c (the actual SD card model),
> including a proper QOM bus between the controller and the card.
>
> This series removes the experimental x-drive property on sdhci-pci;
> the syntax for using that device changes:
>
> instead of using the x-drive property:
>
>   -device sdhci-pci,x-drive=mydrive -drive id=mydrive,[...]
>
> we create a specific sd device (which is autoplugged into the
> sdhci-pci device's "sd-bus" bus if you don't manually connect them):
>
>   -device sdhci-pci -drive id=mydrive,[...] -device sd-card,drive=mydrive
>
>
> The basic structure of the patch series is:
>  * QOMify sd.c itself
>  * Add the QOM bus APIs
>  * Convert sdhci to use the QOM bus APIs
>  * QOMify pxa2xx_mmci
>  * Convert pxa2xx_mmci to use the QOM bus APIs
>
> Some notes on compatibility/bisection:
>  * the old-style non-QOMified controllers (which get their drive
>    via blk_by_legacy_dinfo() continue to work through the whole series
>  * the only QOMified controller which doesn't do that is sdhci-pci,
>    which uses the experimental x-drive property to take a drive. This
>    support and property is removed in patch 1; support for the new
>    syntax is added in patch 5.
>    (Since we're breaking the old syntax anyway I chose to not try to
>    introduce the new syntax in the same commit as breaking the old one;
>    I think it makes the patches easier to review.)
>
> I don't have any Xilinx test images, so I haven't been able to test
> the changes to those boards (beyond confirming that the board doesn't
> crash on startup and that 'info qtree' seems to show SD cards
> connected to the right things). I have tested sdhci-pci and
> the pxa2xx.
>
> Changes v1->v2:
>  * change from "sd"/TYPE_SD/SD() to "sd-card"/TYPE_SD_CARD/SD_CARD()
>  * similarly SD_CLASS -> SD_CARD_CLASS; SD_GET_CLASS -> SD_CARD_GET_CLASS;
>    SDClass -> SDCardClass
>  * fix pxa cut-n-paste flub
>  * use error_propagate() rather than assuming input errp is non-NULL
>  * remove stray blank lines/etc
>  * use the new QOM alias-this-bus functionality as SPI does for Xilinx
>  * use ARRAY_SIZE rather than sizeof
>  * fix failure to register vmstate
>
> If you want 'change' and 'eject' to work in the monitor you need to
> base on top of Max's patches fixing that regression.
> Git branch with that setup available at:
> https://git.linaro.org/people/peter.maydell/qemu-arm.git pxa-mmci-qomify
>
> thanks
> -- PMM
>
>
> Peter Maydell (10):
>   hw/sd/sdhci.c: Remove x-drive property
>   hw/sd/sd.c: QOMify
>   hw/sd/sd.c: Convert sd_reset() function into Device reset method
>   hw/sd: Add QOM bus which SD cards plug in to
>   hw/sd/sdhci.c: Update to use SDBus APIs
>   sdhci_sysbus: Create SD card device in users, not the device itself
>   hw/sd/pxa2xx_mmci: convert to SysBusDevice object
>   hw/sd/pxa2xx_mmci: Update to use new SDBus APIs
>   hw/sd/pxa2xx_mmci: Convert to VMStateDescription
>   hw/sd/pxa2xx_mmci: Add reset function
>
>  hw/arm/xilinx_zynq.c  |  17 ++-
>  hw/arm/xlnx-ep108.c   |  21 ++++
>  hw/arm/xlnx-zynqmp.c  |   8 ++
>  hw/sd/Makefile.objs   |   2 +-
>  hw/sd/core.c          | 146 ++++++++++++++++++++++++
>  hw/sd/pxa2xx_mmci.c   | 306 ++++++++++++++++++++++++++++++++------------------
>  hw/sd/sd.c            | 149 +++++++++++++++++++-----
>  hw/sd/sdhci.c         |  82 ++++++++------
>  include/hw/sd/sd.h    |  65 +++++++++++
>  include/hw/sd/sdhci.h |   3 +-
>  10 files changed, 623 insertions(+), 176 deletions(-)
>  create mode 100644 hw/sd/core.c
>
> --
> 1.9.1
>
>
