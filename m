Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp4494531wrp;
        Mon, 16 Sep 2019 14:32:48 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzoko8Zv/odyRYSs4XIY9yCqsWfHl3jeNdEAQc6usm2m7vK4AZMaODDucUp5D01ijdmHwXI
X-Received: by 2002:aa7:d15a:: with SMTP id r26mr1355186edo.269.1568669568469;
        Mon, 16 Sep 2019 14:32:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1568669568; cv=none;
        d=google.com; s=arc-20160816;
        b=hD2tnPwkFduZvRO2eo92w576UeQuXG8ooyQE7wtAfsaJqZjE6ridHhjOwmShQHtc+R
         k3MTIcnf214AaOuvKgg/yyLOrES6686G+IbpKSQXtdZplnZBlXvdZgE6NPvxd3NY+hs3
         C0xPJCfAVBrNEAnxlkPg6bY3K18KQc8UMKVaMMgh19oR9Mrf1o8iOfXjpAO80ob+SlWy
         IugXu2GzQ5iN2uICM8qTAeEeitZ/kcBDT5OMKmHvYyPC+9r/p+AOW73/rRB4clPcSvUL
         +Ig7iiayySN6IakEQHz8Tu8bHfPgpElgUenpa6rByonZMcoRXUJpLwsU7cQucOPw/qdo
         zWbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature;
        bh=ZXzw5LMlyWRU9v9VwKPopFpn5OHw7FaTjj6xXjG9ahw=;
        b=uuWM9TegXHKQryRI4cP5bLuEeE90+LSDDd8+zKQuoZDSEdpaDLEcuK44kOwP6+t0tW
         T8wfd5EIxQAK5WpYpoZSDFZpsJltmXmg62i4BzVrSpX7Z4CHk+OVP3+pmSIyUKx7sjfV
         nyN5nbwjCJQHK+2AdZwr84rfWsIBZi6L1vZ5KtS71uxZUsMDoZ0Ji6fGS6gZiATaBQ3J
         DfEUvQCoEwmqq4IFQdNWX5dlSJmkfT+N++y9FoQ2zCVNH0c/iBGkKhhCRudOAhwergxL
         txrHlAD/Cxror+C5GdK+a9iNtAIUylHnY+x2x+g8kTpxOHtIl7TkjDpaXS238GpD++id
         foxQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="kvCejE/B";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y7si187248edp.279.2019.09.16.14.32.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 16 Sep 2019 14:32:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="kvCejE/B";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:40176 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i9yc3-0002Ud-Bv
	for alex.bennee@linaro.org; Mon, 16 Sep 2019 17:32:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34007)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alistair23@gmail.com>) id 1i9ybO-0002T3-Lk
 for qemu-arm@nongnu.org; Mon, 16 Sep 2019 17:32:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alistair23@gmail.com>) id 1i9ybM-0005Mc-NO
 for qemu-arm@nongnu.org; Mon, 16 Sep 2019 17:32:06 -0400
Received: from mail-lj1-x242.google.com ([2a00:1450:4864:20::242]:35894)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alistair23@gmail.com>)
 id 1i9ybG-0005J0-6q; Mon, 16 Sep 2019 17:31:58 -0400
Received: by mail-lj1-x242.google.com with SMTP id v24so1386338ljj.3;
 Mon, 16 Sep 2019 14:31:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=ZXzw5LMlyWRU9v9VwKPopFpn5OHw7FaTjj6xXjG9ahw=;
 b=kvCejE/BTtHlOR77RFIxk6096OIrmR0cG1YC3YHd4tfxN0CrVXVsVQePn0wpEbSFCh
 X3l67dqPVgnypx7EbSa8x9lw+6XMUIiAYvL3Jx+ZgxhHw4pzwDuX8/OTNic+7/gLgr+4
 snazezd48uljzHYjB8wW88g3F3ce8uGYEJ4qpiO/dJSvyNjTEOYBXNqQOEC+aWST51Rg
 Io80bYC9Q52cQYTIfs6OOFnESk2bk3B7reup4NzNgUHePaME3DyZR/VoxWVm08slNqYW
 ht20N+z+J1JrsYf2B+a2Sz22nA1yp1JUMEPE6kGix/qlXikh9YaaLjCS2zqSb6zB/DMK
 DURQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ZXzw5LMlyWRU9v9VwKPopFpn5OHw7FaTjj6xXjG9ahw=;
 b=NppzlttrtLPUMUObAvoAOrsrZlquIKOZBjukdNSZ89LyKUoufWT2gsjj5To0nTX3iO
 fR/j2uPzLyP6KegaZUzHH33q9EFRmH7LTXzLyGQclIEg9hFT0w13asm5wX2zFBOw7BRd
 1rxZ6tgVA85BWmxcwUeBfW0qwLDfOT9UAKjL/gqzsuh9QLkpIQtO70VQuEVgUS6iSZ0/
 vymgNqkhwJcd362gkcYFFleuZzzd0WcX8B7O1stNw8jKdw89SNiDJ9JFLsOzI767+YnA
 thVgoNTpelZXTa1eKjWQjVcx/yQWg/B8GFEA7cRMfWtzfmH42pFi5+IRNDKCcgZNOFii
 Mz4A==
X-Gm-Message-State: APjAAAWMha2Sv93L6NnzZboAiAXjBl8rBxWfN76UpOBJ3d1HW9VTU334
 IjXqfVos04/GGTH0/dDAiCDanbQGbDOVAjRUUTs=
X-Received: by 2002:a2e:91d9:: with SMTP id u25mr3432ljg.85.1568669516227;
 Mon, 16 Sep 2019 14:31:56 -0700 (PDT)
MIME-Version: 1.0
References: <20190916154847.28936-1-philmd@redhat.com>
 <20190916154847.28936-7-philmd@redhat.com>
In-Reply-To: <20190916154847.28936-7-philmd@redhat.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 16 Sep 2019 14:27:25 -0700
Message-ID: <CAKmqyKO5ww_Q3-XHKG8GwLHvS=crhfy-PDJpDWm_xgwEMYVDJQ@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::242
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 06/13] hw: Move sun4v hypervisor
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
X-TUID: qq/kjh42afWG

On Mon, Sep 16, 2019 at 9:30 AM Philippe Mathieu-Daud=C3=A9
<philmd@redhat.com> wrote:
>
> Move RTC devices under the hw/rtc/ subdirectory.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  MAINTAINERS                   |  4 ++--
>  hw/rtc/Kconfig                |  3 +++
>  hw/rtc/Makefile.objs          |  1 +
>  hw/{timer =3D> rtc}/sun4v-rtc.c |  2 +-
>  hw/rtc/trace-events           |  4 ++++
>  hw/sparc64/niagara.c          |  2 +-
>  hw/timer/Kconfig              |  3 ---
>  hw/timer/Makefile.objs        |  1 -
>  hw/timer/trace-events         |  4 ----
>  include/hw/rtc/sun4v-rtc.h    | 19 +++++++++++++++++++
>  include/hw/timer/sun4v-rtc.h  |  1 -
>  11 files changed, 31 insertions(+), 13 deletions(-)
>  rename hw/{timer =3D> rtc}/sun4v-rtc.c (98%)
>  create mode 100644 include/hw/rtc/sun4v-rtc.h
>  delete mode 100644 include/hw/timer/sun4v-rtc.h
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index fd68b2383a..fb9a1ed075 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1165,8 +1165,8 @@ Sun4v
>  M: Artyom Tarasenko <atar4qemu@gmail.com>
>  S: Maintained
>  F: hw/sparc64/niagara.c
> -F: hw/timer/sun4v-rtc.c
> -F: include/hw/timer/sun4v-rtc.h
> +F: hw/rtc/sun4v-rtc.c
> +F: include/hw/rtc/sun4v-rtc.h
>
>  Leon3
>  M: Fabien Chouteau <chouteau@adacore.com>
> diff --git a/hw/rtc/Kconfig b/hw/rtc/Kconfig
> index 434b20b2b1..cc7fead764 100644
> --- a/hw/rtc/Kconfig
> +++ b/hw/rtc/Kconfig
> @@ -10,3 +10,6 @@ config PL031
>
>  config MC146818RTC
>      bool
> +
> +config SUN4V_RTC
> +    bool
> diff --git a/hw/rtc/Makefile.objs b/hw/rtc/Makefile.objs
> index 89e8e48c64..4621b37bc2 100644
> --- a/hw/rtc/Makefile.objs
> +++ b/hw/rtc/Makefile.objs
> @@ -5,3 +5,4 @@ common-obj-$(CONFIG_M48T59) +=3D m48t59-isa.o
>  endif
>  common-obj-$(CONFIG_PL031) +=3D pl031.o
>  obj-$(CONFIG_MC146818RTC) +=3D mc146818rtc.o
> +common-obj-$(CONFIG_SUN4V_RTC) +=3D sun4v-rtc.o
> diff --git a/hw/timer/sun4v-rtc.c b/hw/rtc/sun4v-rtc.c
> similarity index 98%
> rename from hw/timer/sun4v-rtc.c
> rename to hw/rtc/sun4v-rtc.c
> index 54272a822f..ada01b5774 100644
> --- a/hw/timer/sun4v-rtc.c
> +++ b/hw/rtc/sun4v-rtc.c
> @@ -13,7 +13,7 @@
>  #include "hw/sysbus.h"
>  #include "qemu/module.h"
>  #include "qemu/timer.h"
> -#include "hw/timer/sun4v-rtc.h"
> +#include "hw/rtc/sun4v-rtc.h"
>  #include "trace.h"
>
>
> diff --git a/hw/rtc/trace-events b/hw/rtc/trace-events
> index 54c94ac557..ac9e0e0fba 100644
> --- a/hw/rtc/trace-events
> +++ b/hw/rtc/trace-events
> @@ -1,5 +1,9 @@
>  # See docs/devel/tracing.txt for syntax documentation.
>
> +# sun4v-rtc.c
> +sun4v_rtc_read(uint64_t addr, uint64_t value) "read: addr 0x%" PRIx64 " =
value 0x%" PRIx64
> +sun4v_rtc_write(uint64_t addr, uint64_t value) "write: addr 0x%" PRIx64 =
" value 0x%" PRIx64
> +
>  # pl031.c
>  pl031_irq_state(int level) "irq state %d"
>  pl031_read(uint32_t addr, uint32_t value) "addr 0x%08x value 0x%08x"
> diff --git a/hw/sparc64/niagara.c b/hw/sparc64/niagara.c
> index 167143bffe..dfa0817eae 100644
> --- a/hw/sparc64/niagara.c
> +++ b/hw/sparc64/niagara.c
> @@ -30,7 +30,7 @@
>  #include "hw/misc/unimp.h"
>  #include "hw/loader.h"
>  #include "hw/sparc/sparc64.h"
> -#include "hw/timer/sun4v-rtc.h"
> +#include "hw/rtc/sun4v-rtc.h"
>  #include "exec/address-spaces.h"
>  #include "sysemu/block-backend.h"
>  #include "qemu/error-report.h"
> diff --git a/hw/timer/Kconfig b/hw/timer/Kconfig
> index a6b668b255..b04c928136 100644
> --- a/hw/timer/Kconfig
> +++ b/hw/timer/Kconfig
> @@ -35,9 +35,6 @@ config ALLWINNER_A10_PIT
>  config STM32F2XX_TIMER
>      bool
>
> -config SUN4V_RTC
> -    bool
> -
>  config CMSDK_APB_TIMER
>      bool
>      select PTIMER
> diff --git a/hw/timer/Makefile.objs b/hw/timer/Makefile.objs
> index 2fb12162a6..034bd30255 100644
> --- a/hw/timer/Makefile.objs
> +++ b/hw/timer/Makefile.objs
> @@ -35,7 +35,6 @@ common-obj-$(CONFIG_ALLWINNER_A10_PIT) +=3D allwinner-a=
10-pit.o
>  common-obj-$(CONFIG_STM32F2XX_TIMER) +=3D stm32f2xx_timer.o
>  common-obj-$(CONFIG_ASPEED_SOC) +=3D aspeed_timer.o aspeed_rtc.o
>
> -common-obj-$(CONFIG_SUN4V_RTC) +=3D sun4v-rtc.o
>  common-obj-$(CONFIG_CMSDK_APB_TIMER) +=3D cmsdk-apb-timer.o
>  common-obj-$(CONFIG_CMSDK_APB_DUALTIMER) +=3D cmsdk-apb-dualtimer.o
>  common-obj-$(CONFIG_MSF2) +=3D mss-timer.o
> diff --git a/hw/timer/trace-events b/hw/timer/trace-events
> index 6936fe8573..ce34b967db 100644
> --- a/hw/timer/trace-events
> +++ b/hw/timer/trace-events
> @@ -70,10 +70,6 @@ cmsdk_apb_dualtimer_reset(void) "CMSDK APB dualtimer: =
reset"
>  aspeed_rtc_read(uint64_t addr, uint64_t value) "addr 0x%02" PRIx64 " val=
ue 0x%08" PRIx64
>  aspeed_rtc_write(uint64_t addr, uint64_t value) "addr 0x%02" PRIx64 " va=
lue 0x%08" PRIx64
>
> -# sun4v-rtc.c
> -sun4v_rtc_read(uint64_t addr, uint64_t value) "read: addr 0x%" PRIx64 " =
value 0x%" PRIx64
> -sun4v_rtc_write(uint64_t addr, uint64_t value) "write: addr 0x%" PRIx64 =
" value 0x%" PRIx64
> -
>  # xlnx-zynqmp-rtc.c
>  xlnx_zynqmp_rtc_gettime(int year, int month, int day, int hour, int min,=
 int sec) "Get time from host: %d-%d-%d %2d:%02d:%02d"
>
> diff --git a/include/hw/rtc/sun4v-rtc.h b/include/hw/rtc/sun4v-rtc.h
> new file mode 100644
> index 0000000000..fd868f6ed2
> --- /dev/null
> +++ b/include/hw/rtc/sun4v-rtc.h
> @@ -0,0 +1,19 @@
> +/*
> + * QEMU sun4v Real Time Clock device
> + *
> + * The sun4v_rtc device (sun4v tod clock)
> + *
> + * Copyright (c) 2016 Artyom Tarasenko
> + *
> + * This code is licensed under the GNU GPL v3 or (at your option) any la=
ter
> + * version.
> + */
> +
> +#ifndef HW_RTC_SUN4V
> +#define HW_RTC_SUN4V
> +
> +#include "exec/hwaddr.h"
> +
> +void sun4v_rtc_init(hwaddr addr);
> +
> +#endif
> diff --git a/include/hw/timer/sun4v-rtc.h b/include/hw/timer/sun4v-rtc.h
> deleted file mode 100644
> index 407278f918..0000000000
> --- a/include/hw/timer/sun4v-rtc.h
> +++ /dev/null
> @@ -1 +0,0 @@
> -void sun4v_rtc_init(hwaddr addr);
> --
> 2.20.1
>
>
