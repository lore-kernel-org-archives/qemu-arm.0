Received: by 10.25.21.96 with SMTP id l93csp1124018lfi;
        Mon, 27 Jun 2016 06:43:16 -0700 (PDT)
X-Received: by 10.55.55.202 with SMTP id e193mr24214602qka.130.1467034996786;
        Mon, 27 Jun 2016 06:43:16 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b80si8875554qkh.9.2016.06.27.06.43.16
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 27 Jun 2016 06:43:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58781 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bHWom-00006k-9d
	for alex.bennee@linaro.org; Mon, 27 Jun 2016 09:43:16 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40923)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bHWoh-00006c-Ue
	for qemu-arm@nongnu.org; Mon, 27 Jun 2016 09:43:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bHWog-0000C5-JX
	for qemu-arm@nongnu.org; Mon, 27 Jun 2016 09:43:11 -0400
Received: from mail-vk0-x22e.google.com ([2607:f8b0:400c:c05::22e]:35405)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bHWog-0000Bb-2n
	for qemu-arm@nongnu.org; Mon, 27 Jun 2016 09:43:10 -0400
Received: by mail-vk0-x22e.google.com with SMTP id j2so232212806vkg.2
	for <qemu-arm@nongnu.org>; Mon, 27 Jun 2016 06:43:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=7nVdJcMn3UPxVMvHIASEKDaRMaPSlraDRd1YWx8en64=;
	b=jDZItv5V30ZLydCOe1ewy6EbdRsrsts12AA8Aii/e49Lgf8kcLs0IfIfngsBqhdQ0C
	VFmoFGEkQMncHrqa+KpRZV6xThz9yxByAXMvVD/XFV3ZbffHMOLziPSZqjFIZ8/xGVkp
	N5HFon9p4KZTUPV2+gVKurGILgPFDXLwOYmcY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=7nVdJcMn3UPxVMvHIASEKDaRMaPSlraDRd1YWx8en64=;
	b=miLNI7sF7aFxvBRpKjyTmabVYGYbMVnQU+vy+z01wek0qMfyU0U5+02J0y7zLoH0Fs
	qc29yAAmk/1MfE3a6gGxWREp46+yByaQM8h0LdctMpxNC4YdHdVNkRCbEwcJLxqgEjcs
	yY/nMfTwjgiwnwjOVtS4oQVp8FUAYE/skOoj8hzqpRF9mU+WVG68f4+mZSXjy0MS+A1D
	fYWq+CEoVm21ER8+OW8E9rfhaReYHOYbbl7e5f8SzPJ5XFTGJfgzoFQ92TD8XXnWaAO8
	DKKcuLnAkMFBH1mNVblcJ+IJ62Pg1jGpyVBRuB7lf9NuWz+Hhdsc0cbZCbp1rtcE+OJM
	4taQ==
X-Gm-Message-State: ALyK8tJ5QE6C6LD9FFt9nubW5XUYtPrB/7Mtu2WoXJaC6ZdlxORN1wxcwUbXlC/dGw5CXIT6uq1sLRkch/oE/PSn
X-Received: by 10.31.188.80 with SMTP id m77mr8265441vkf.30.1467034989158;
	Mon, 27 Jun 2016 06:43:09 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.157.141 with HTTP; Mon, 27 Jun 2016 06:42:49 -0700 (PDT)
In-Reply-To: <1466744305-23163-2-git-send-email-andrew@aj.id.au>
References: <1466744305-23163-1-git-send-email-andrew@aj.id.au>
	<1466744305-23163-2-git-send-email-andrew@aj.id.au>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 27 Jun 2016 14:42:49 +0100
Message-ID: <CAFEAcA-bDq2aLFdipC2ZGGnCbCG=NB8=S7xw2h1u5BAkL2=MbA@mail.gmail.com>
To: Andrew Jeffery <andrew@aj.id.au>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::22e
Subject: Re: [Qemu-arm] [PATCH v3 1/3] hw/misc: Add a model for the ASPEED
 System Control Unit
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
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
	=?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
	Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: qZ87ShhbSiLo

On 24 June 2016 at 05:58, Andrew Jeffery <andrew@aj.id.au> wrote:
> The SCU is a collection of chip-level control registers that manage the
> various functions supported by ASPEED SoCs. Typically the bits control
> interactions with clocks, external hardware or reset behaviour, and we
> can largly take a hands-off approach to reads and writes.
>
> Firmware makes heavy use of the state to determine how to boot, but the
> reset values vary from SoC to SoC (eg AST2400 vs AST2500). A qdev
> property is exposed so that the integrating SoC model can configure the
> silicon revision, which in-turn selects the appropriate reset values.
> Further qdev properties are exposed so the board model can configure the
> board-dependent hardware strapping.
>
> Almost all provided AST2400 reset values are specified by the datasheet.
> The notable exception is SOC_SCRATCH1, where we mark the DRAM as
> successfully initialised to avoid unnecessary dark corners in the SoC's
> u-boot support.
>
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> ---
> Since v2:
>
> * Fix mixing of offsets and register indexes
> * Sanity check device property values
> * Move trace event definition to hw/misc/trace-events
>
> Since v1:
>
> * Move reset values into SCU implementation (also make register defines private)
> * Expose silicon-rev property which is used to select appropriate reset values
> * Expose hw-strap1/hw-strap2 properties for board-specific SoC configuration
>
>  hw/misc/Makefile.objs        |   1 +
>  hw/misc/aspeed_scu.c         | 284 +++++++++++++++++++++++++++++++++++++++++++
>  hw/misc/trace-events         |   3 +
>  include/hw/misc/aspeed_scu.h |  34 ++++++
>  4 files changed, 322 insertions(+)
>  create mode 100644 hw/misc/aspeed_scu.c
>  create mode 100644 include/hw/misc/aspeed_scu.h
>
> diff --git a/hw/misc/Makefile.objs b/hw/misc/Makefile.objs
> index ffb49c11aca6..54020aa06c00 100644
> --- a/hw/misc/Makefile.objs
> +++ b/hw/misc/Makefile.objs
> @@ -52,3 +52,4 @@ obj-$(CONFIG_PVPANIC) += pvpanic.o
>  obj-$(CONFIG_EDU) += edu.o
>  obj-$(CONFIG_HYPERV_TESTDEV) += hyperv_testdev.o
>  obj-$(CONFIG_AUX) += aux.o
> +obj-$(CONFIG_ASPEED_SOC) += aspeed_scu.o
> diff --git a/hw/misc/aspeed_scu.c b/hw/misc/aspeed_scu.c
> new file mode 100644
> index 000000000000..ff231dbb3c17
> --- /dev/null
> +++ b/hw/misc/aspeed_scu.c
> @@ -0,0 +1,284 @@
> +/*
> + * ASPEED System Control Unit
> + *
> + * Andrew Jeffery <andrew@aj.id.au>
> + *
> + * Copyright 2016 IBM Corp.
> + *
> + * This code is licensed under the GPL version 2 or later.  See
> + * the COPYING file in the top-level directory.
> + */
> +
> +#include "qemu/osdep.h"
> +#include <inttypes.h>

osdep.h provides this, you don't need to include it yourself.

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

so if this is the only problem with the series I'll fix it up
when I put it in target-arm.next.

thanks
-- PMM
