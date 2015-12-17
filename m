Received: by 10.182.158.201 with SMTP id ww9csp74709obb;
        Wed, 16 Dec 2015 17:25:41 -0800 (PST)
X-Received: by 10.55.20.1 with SMTP id e1mr20971008qkh.60.1450315541805;
        Wed, 16 Dec 2015 17:25:41 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c67si9180028qgc.16.2015.12.16.17.25.41
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 16 Dec 2015 17:25:41 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com
Received: from localhost ([::1]:50243 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1a9NK9-0007Jq-DZ
	for alex.bennee@linaro.org; Wed, 16 Dec 2015 20:25:41 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41773)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1a9NK7-0007H3-4V
	for qemu-arm@nongnu.org; Wed, 16 Dec 2015 20:25:40 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1a9NK6-0001UA-2r
	for qemu-arm@nongnu.org; Wed, 16 Dec 2015 20:25:39 -0500
Received: from mail-oi0-x234.google.com ([2607:f8b0:4003:c06::234]:33091)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>)
	id 1a9NK3-0001Tn-Ip; Wed, 16 Dec 2015 20:25:35 -0500
Received: by mail-oi0-x234.google.com with SMTP id y66so34892024oig.0;
	Wed, 16 Dec 2015 17:25:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=ADa1hQlDkih5ToB3UKALCln7hw+5XBjnAeU/bnHC6no=;
	b=CiNawR13YGR2cF0tfVf9XFY65a3wqe1kpi1m4TzjdWBQpQ/A8RaiQjwLuFgRji0K7s
	IPZcjhVXZXVQzDUoDRiIs5HxeA/CuSgwTUtiK/mMcdQNpxDqCKm3fyGfocxc2DPvrTSu
	ubRr1kak834NGy4b3XAWJgRJ6pSTvM6+EL2uJN69HI9iEfa/WfJoCUHE0owRYVV1HXIL
	PECXrUaA5edAIqd1C7FcChKp1yq0yAQN0lxO5FQM+8jNo/GcNY+5YQlgzPIshD9yvz5/
	UvRJKtWJkQFsw9o6lj6ZPzkYlBgPGDBU7Ftymf9BGRWH4ZPKea7FJkJlfSumw5/LgQAb
	IJHA==
X-Received: by 10.202.94.4 with SMTP id s4mr9265207oib.8.1450315534930; Wed,
	16 Dec 2015 17:25:34 -0800 (PST)
MIME-Version: 1.0
Received: by 10.182.49.199 with HTTP; Wed, 16 Dec 2015 17:25:05 -0800 (PST)
In-Reply-To: <1449851831-4966-1-git-send-email-peter.maydell@linaro.org>
References: <1449851831-4966-1-git-send-email-peter.maydell@linaro.org>
From: Alistair Francis <alistair.francis@xilinx.com>
Date: Wed, 16 Dec 2015 17:25:05 -0800
X-Google-Sender-Auth: S6eRNaKoZ9HFdo9TsT5QtKP-Kxw
Message-ID: <CAKmqyKMtThT0D47q8jz_+nfxPA-+BEC=RnKkvW_YwODw2G7sQQ@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:4003:c06::234
Cc: Patch Tracking <patches@linaro.org>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Markus Armbruster <armbru@redhat.com>,
	Alistair Francis <alistair.francis@xilinx.com>,
	Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>,
	Kevin O'Connor <kevin@koconnor.net>, qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 00/10] hw/sd: QOMify sd.c (and
	pxa2xx_mmci)
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
X-TUID: 2SD84lxpe/Cd

+Sai Pavan

On Fri, Dec 11, 2015 at 8:37 AM, Peter Maydell <peter.maydell@linaro.org> wrote:
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
>   -device sdhci-pci -drive id=mydrive,[...] -device sd,drive=mydrive
>
>
> The basic structure of the patch series is:
>  * QOMify sd.c itself
>  * Add the QOM bus APIs
>  * Convert sdhci to use the QOM bus APIs
>  * QOMify pxa2xx_mmci
>  * Convert pxa2xx_mmci to use the QOM bus APIs
>
>
> Points worthy of review:
>  * is the code in "sdhci_sysbus: Create SD card device in users"
>    for xlnx-ep108.c to connect the SD cards up to the two controllers
>    inside the SoC doing this in the right way?
>  * I chose not to try to make the SD card type a subclass of
>    SSI, because the interface we have at the moment didn't really
>    seem to line up with what SSI has
>  * generally do I have the QOM style right?
>
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
>
> I don't have any Xilinx test images, so I haven't been able to test
> the changes to those boards (beyond confirming that the board doesn't
> crash on startup and that 'info qtree' seems to show SD cards
> connected to the right things). I have tested sdhci-pci and
> the pxa2xx.
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
>  hw/arm/xlnx-ep108.c   |  19 ++++
>  hw/sd/Makefile.objs   |   2 +-
>  hw/sd/core.c          | 146 ++++++++++++++++++++++++
>  hw/sd/pxa2xx_mmci.c   | 304 ++++++++++++++++++++++++++++++++------------------
>  hw/sd/sd.c            | 149 ++++++++++++++++++++-----
>  hw/sd/sdhci.c         |  83 ++++++++------
>  include/hw/sd/sd.h    |  63 +++++++++++
>  include/hw/sd/sdhci.h |   3 +-
>  9 files changed, 610 insertions(+), 176 deletions(-)
>  create mode 100644 hw/sd/core.c
>
> --
> 1.9.1
>
>
