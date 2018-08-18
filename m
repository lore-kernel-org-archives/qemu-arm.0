Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp803810wrd;
        Fri, 17 Aug 2018 18:28:54 -0700 (PDT)
X-Google-Smtp-Source: ANB0VdZ1oLIX2tto4yUu4N7nNTDMFhG8jFXe514lD8628tq9gTJRY5itLfcVIjxWTybLtUC4VBaF
X-Received: by 2002:ac8:764c:: with SMTP id i12-v6mr2349597qtr.250.1534555734789;
        Fri, 17 Aug 2018 18:28:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1534555734; cv=none;
        d=google.com; s=arc-20160816;
        b=AoXD6AxExFMTIdRjrHB2xG3RkLGvAXSHtn/GOu12DaRfzSONuHrjYCZRl7fM7oolvV
         eANhKJgB3FOuEausxsujPat7Ge8mzWkiLdyL1LznQWsnI3HapRPvmJBMN5Ch/NiVDRYN
         jLho5RgHmqNNhGybHN7RcftPgAzyd3D7/ipVfOFgqymOXQ/blohLuToHKZnaC+B0wS0S
         kWBd7p7Gp5SCpEB52JMZwO+IwhGku8LnXdvBh5n7PSLaKp85FCqXgG7Rl9B3cWAWy4E0
         ocMh3uAuqNpC63rmCKHXItICmRSwqu+wZ7FRIKzmGfmOPkqB1JiDG0nSFXyixdwFjKvw
         pXDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=IQCBIecnpXTg8vGloqShuKjFAT7mOztWVScORqy4RIg=;
        b=cMilRcT3cxjZTCNLwAZAplbZXAhkT/sq3ccqRI3DI5l6h9jX4L0mPxgr8kT/+kmXUA
         REKyfMd+8P/gPQPqBLYM2S17HOEcU0e6DycSdgwoapk1cPrLRzyGJai8YjmQFCQ/CwBF
         TjFP4ILvUj7sECTSsCQHJFeuqKzB3X5L5mg5HCV0QIrwkpNkI52mXXhcm+uTWdipA/jI
         gf+x4vc/rfr8At37/OasrdBDqYBi/4ZUc7TG2gEq0THU03IpnYkg2UPdTzniorpCgNaC
         eWOWKHwShMxoubN1lzDqBtOZRvWTnCZhnxRzeNYHe0LTw0jyYY9qcfQIrhT3g1oJpQQT
         Pt6A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=NPEKbWNC;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d5-v6si2895835qvj.63.2018.08.17.18.28.54
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 17 Aug 2018 18:28:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=NPEKbWNC;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:37118 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fqq2w-0002Mp-AS
	for alex.bennee@linaro.org; Fri, 17 Aug 2018 21:28:54 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42206)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fqq1M-0001bg-AH
	for qemu-devel@nongnu.org; Fri, 17 Aug 2018 21:27:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fqq1I-000603-6o
	for qemu-devel@nongnu.org; Fri, 17 Aug 2018 21:27:16 -0400
Received: from mail-ua1-x942.google.com ([2607:f8b0:4864:20::942]:42149)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fqq1I-0005zk-1S; Fri, 17 Aug 2018 21:27:12 -0400
Received: by mail-ua1-x942.google.com with SMTP id w7-v6so6780131uan.9;
	Fri, 17 Aug 2018 18:27:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:autocrypt:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=IQCBIecnpXTg8vGloqShuKjFAT7mOztWVScORqy4RIg=;
	b=NPEKbWNCWMsWaqDXi/mI+t3IaCnNym+G7F+tLH3TxqAr+Bo3WRnNMIap3BtARfBPdC
	RERdfbm6mQsOWT/4uMsIN7MyVwB63H32nvV1hr00cWmibwr0V1XI0DaoYd24fcLPIHAU
	w+VVBiCsKsUjp6GVaxizt8IqxBZx6voA5ieUvGWu7T2OnE1qdCbNFh6T2EjRaOOOLzLy
	4eV2Z+IhfldNJ/FtIC2NXelim6Sg1q9IiMu2v/Q7qnKfvxsVCKu3v5MGoM0BKQ1JvQNJ
	drXKESxaNIt5PIUX3OF33CJ/wu/70VYQcZAKZ9xD+fOJTgecQEeskMOuX+KNh1cVCkuY
	8rdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:autocrypt:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=IQCBIecnpXTg8vGloqShuKjFAT7mOztWVScORqy4RIg=;
	b=jPN5gxb6i3nWceoq42s6xzf5a27fdlzLCrGovL6MTONgpWBWZegefMl6isgWswbDn7
	M9TsyVR84M474yWlpDp05bsRwu4diiluyCT0a94B7HjxYKD77pK2X631rRIZ0k+OqUXl
	SqBaqz7lTYWpEbWrkz581EJxX1G3z5IIfKAy0d076HppiIsZH7hy3XFQqXfPnM6i4dwv
	Q7K50G2jVM9D4SH9RYmud/hGOpHFOyE5Iho3GxFHBF123n9pkULGzqnjUWlIdnMrdrXC
	a/PZ0U+ab7dnuMfSDLvQ5LGVgfJ7TBDPYBiqiBepTIShgD9wCD2a1QHsPKV0E6//U+dt
	1KXA==
X-Gm-Message-State: AOUpUlEkTjA4vosKwshP/PerAW9/pUFculB6wcHRXTSRNP6UutqmqpsI
	QOmhhYOEep0+OJ+ghniBTWA=
X-Received: by 2002:ab0:11dd:: with SMTP id
	q29-v6mr24672295uac.191.1534555631125; 
	Fri, 17 Aug 2018 18:27:11 -0700 (PDT)
Received: from [192.168.1.11] ([138.117.48.222])
	by smtp.gmail.com with ESMTPSA id
	c17-v6sm426682uan.51.2018.08.17.18.27.08
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 17 Aug 2018 18:27:10 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20180809130115.28951-1-peter.maydell@linaro.org>
	<20180809130115.28951-2-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Autocrypt: addr=f4bug@amsat.org; prefer-encrypt=mutual; keydata=
	mQINBDU8rLoBEADb5b5dyglKgWF9uDbIjFXU4gDtcwiga9wJ/wX6xdhBqU8tlQ4BroH7AeRl
	u4zXP0QnBDAG7EetxlQzcfYbPmxFISWjckDBFvDbFsojrZmwF2/LkFSzlvKiN5KLghzzJhLO
	HhjGlF8deEZz/d/G8qzO9mIw8GIBS8uuWh6SIcG/qq7+y+2+aifaj92EdwU79apZepT/U3vN
	YrfcAuo1Ycy7/u0hJ7rlaFUn2Fu5KIgV2O++hHYtCCQfdPBg/+ujTL+U+sCDawCyq+9M5+LJ
	ojCzP9rViLZDd/gS6jX8T48hhidtbtsFRj/e9QpdZgDZfowRMVsRx+TB9yzjFdMO0YaYybXp
	dg/wCUepX5xmDBrle6cZ8VEe00+UQCAU1TY5Hs7QFfBbjgR3k9pgJzVXNUKcJ9DYQP0OBH9P
	ZbZvM0Ut2Bk6bLBO5iCVDOco0alrPkX7iJul2QWBy3Iy9j02GnA5jZ1Xtjr9kpCqQT+sRXso
	Vpm5TPGWaWljIeLWy/qL8drX1eyJzwTB3A36Ck4r3YmjMjfmvltSZB1uAdo1elHTlFEULpU/
	HiwvvqXQ9koB15U154VCuguvx/Qnboz8GFb9Uw8VyawzVxYVNME7xw7CQF8FYxzj6eI7rBf2
	Dj/II6wxWPgDEy3oUzuNOxTB7sT3b/Ym76yOJzWX5BylXQIJ5wARAQABtDFQaGlsaXBwZSBN
	YXRoaWV1LURhdWTDqSAoRjRCVUcpIDxmNGJ1Z0BhbXNhdC5vcmc+iQI+BBMBAgAoBQI3aGSw
	AhsPBQkmUJgABgsJCAcDAgYVCAIJCgsEFgIDAQIeAQIXgAAKCRDj4yws3q3A3nS+EACxKosO
	3DZdwdVPXLVvSAA5y3Ohr2ByWN06RlVEkKWkOxm0lQ96LxBOZ03mDC+He/36DHaP+fujPBTz
	XjTXygWWZUtk0flDWR1w0a4yhX/JHfL5yloMZrxifCwouf2Sv9Yd6D46pzMeGsq8aCvbZYSf
	lDi3KXsVHc+jbmRwxtzJxz7366dsTC1tOJmjVSxc8bE55pHnPFOT1KKM9fxGWZFYx0UqAL/1
	NkrOKP5eXdJ51EhQa5pjivJw6dQlfWMQURG4o4e2+aLe4TkS2FI0r6nTgmoDmTT74u35NzZW
	Q3xjqcfqUX52+0drwlta22guNDbcJ4J+/I6FBF1C7CoSysBiIrldZQ6cJZ19st3jb7NHAoNk
	DcUt5I3gt4EpaiijWEEYAhw1/NSagm9bfn9veBqzVHNQrz76NZMiy2kP2vAxKOvo1XVlcEl0
	8MQ+IAUvYcLvU6yHRB4da7ts+ufqriNI5WBpvoLPRRa0wFDTj0nX/CfWFX9UkTwHA6/SWlhE
	hHau4xrpzFENwF5UDFtMkleo/u5Ipv7q8wYNs5JBpSXGmm4oSV9BbW0gp28D8fY4GGv1+6Dz
	BNDeuIdPf2NX0X55uyphpB0J4d70uNszAWXr7VqGOBbGrHcNHeT62BvoRd8bUQhaEyiJwOyC
	Ny4YIWW+I8W2wXkW+vSrZfEro2GZjQ==
Message-ID: <4275d409-cbbb-b1d6-fdb6-43aa9cd61b21@amsat.org>
Date: Fri, 17 Aug 2018 22:27:06 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20180809130115.28951-2-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::942
Subject: Re: [Qemu-devel] [Qemu-arm] [PATCH 01/16]
 hw/watchdog/cmsdk_apb_watchdog: Implement CMSDK APB watchdog module
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
Cc: patches@linaro.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Z8cPOhIw1coF

On 08/09/2018 10:01 AM, Peter Maydell wrote:
> The Arm Cortex-M System Design Kit includes a simple watchdog module
> based on a 32-bit down-counter. Implement this.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  Makefile.objs                            |   1 +
>  hw/watchdog/Makefile.objs                |   1 +
>  include/hw/watchdog/cmsdk-apb-watchdog.h |  59 ++++
>  hw/watchdog/cmsdk-apb-watchdog.c         | 326 +++++++++++++++++++++++
>  MAINTAINERS                              |   2 +
>  default-configs/arm-softmmu.mak          |   1 +
>  hw/watchdog/trace-events                 |   6 +
>  7 files changed, 396 insertions(+)
>  create mode 100644 include/hw/watchdog/cmsdk-apb-watchdog.h
>  create mode 100644 hw/watchdog/cmsdk-apb-watchdog.c
>  create mode 100644 hw/watchdog/trace-events
> 
> diff --git a/Makefile.objs b/Makefile.objs
> index 7a9828da282..ce9c79235e6 100644
> --- a/Makefile.objs
> +++ b/Makefile.objs
> @@ -240,6 +240,7 @@ trace-events-subdirs += hw/tpm
>  trace-events-subdirs += hw/usb
>  trace-events-subdirs += hw/vfio
>  trace-events-subdirs += hw/virtio
> +trace-events-subdirs += hw/watchdog
>  trace-events-subdirs += hw/xen
>  trace-events-subdirs += io
>  trace-events-subdirs += linux-user
> diff --git a/hw/watchdog/Makefile.objs b/hw/watchdog/Makefile.objs
> index 9589bed63a3..3f536d1cad8 100644
> --- a/hw/watchdog/Makefile.objs
> +++ b/hw/watchdog/Makefile.objs
> @@ -1,4 +1,5 @@
>  common-obj-y += watchdog.o
> +common-obj-$(CONFIG_CMSDK_APB_WATCHDOG) += cmsdk-apb-watchdog.o
>  common-obj-$(CONFIG_WDT_IB6300ESB) += wdt_i6300esb.o
>  common-obj-$(CONFIG_WDT_IB700) += wdt_ib700.o
>  common-obj-$(CONFIG_WDT_DIAG288) += wdt_diag288.o
> diff --git a/include/hw/watchdog/cmsdk-apb-watchdog.h b/include/hw/watchdog/cmsdk-apb-watchdog.h
> new file mode 100644
> index 00000000000..ab8b5987a19
> --- /dev/null
> +++ b/include/hw/watchdog/cmsdk-apb-watchdog.h
> @@ -0,0 +1,59 @@
> +/*
> + * ARM CMSDK APB watchdog emulation
> + *
> + * Copyright (c) 2018 Linaro Limited
> + * Written by Peter Maydell
> + *
> + *  This program is free software; you can redistribute it and/or modify
> + *  it under the terms of the GNU General Public License version 2 or
> + *  (at your option) any later version.
> + */
> +
> +/*
> + * This is a model of the "APB watchdog" which is part of the Cortex-M
> + * System Design Kit (CMSDK) and documented in the Cortex-M System
> + * Design Kit Technical Reference Manual (ARM DDI0479C):
> + * https://developer.arm.com/products/system-design/system-design-kits/cortex-m-system-design-kit
> + *
> + * QEMU interface:
> + *  + QOM property "wdogclk-frq": frequency at which the watchdog is clocked
> + *  + sysbus MMIO region 0: the register bank
> + *  + sysbus IRQ 0: watchdog interrupt
> + *
> + * In real hardware the watchdog's reset output is just a GPIO line
> + * which can then be masked by the board or treated as a simple interrupt.
> + * (For instance the IoTKit does this with the non-secure watchdog, so that
> + * secure code can control whether non-secure code can perform a system
> + * reset via its watchdog.) In QEMU, we just wire up the watchdog reset
> + * to watchdog_perform_action(), at least for the moment.
> + */
> +
> +#ifndef CMSDK_APB_WATCHDOG_H
> +#define CMSDK_APB_WATCHDOG_H
> +
> +#include "hw/sysbus.h"
> +#include "hw/ptimer.h"
> +
> +#define TYPE_CMSDK_APB_WATCHDOG "cmsdk-apb-watchdog"
> +#define CMSDK_APB_WATCHDOG(obj) OBJECT_CHECK(CMSDKAPBWatchdog, (obj), \
> +                                              TYPE_CMSDK_APB_WATCHDOG)
> +
> +typedef struct CMSDKAPBWatchdog {
> +    /*< private >*/
> +    SysBusDevice parent_obj;
> +
> +    /*< public >*/
> +    MemoryRegion iomem;
> +    qemu_irq wdogint;
> +    uint32_t wdogclk_frq;
> +    struct ptimer_state *timer;
> +
> +    uint32_t control;
> +    uint32_t intstatus;
> +    uint32_t lock;
> +    uint32_t itcr;
> +    uint32_t itop;
> +    uint32_t resetstatus;
> +} CMSDKAPBWatchdog;
> +
> +#endif
> diff --git a/hw/watchdog/cmsdk-apb-watchdog.c b/hw/watchdog/cmsdk-apb-watchdog.c
> new file mode 100644
> index 00000000000..eb79a73fa6c
> --- /dev/null
> +++ b/hw/watchdog/cmsdk-apb-watchdog.c
> @@ -0,0 +1,326 @@
> +/*
> + * ARM CMSDK APB watchdog emulation
> + *
> + * Copyright (c) 2018 Linaro Limited
> + * Written by Peter Maydell
> + *
> + *  This program is free software; you can redistribute it and/or modify
> + *  it under the terms of the GNU General Public License version 2 or
> + *  (at your option) any later version.
> + */
> +
> +/*
> + * This is a model of the "APB watchdog" which is part of the Cortex-M
> + * System Design Kit (CMSDK) and documented in the Cortex-M System
> + * Design Kit Technical Reference Manual (ARM DDI0479C):
> + * https://developer.arm.com/products/system-design/system-design-kits/cortex-m-system-design-kit
> + */
> +
> +#include "qemu/osdep.h"
> +#include "qemu/log.h"
> +#include "trace.h"
> +#include "qapi/error.h"
> +#include "qemu/main-loop.h"
> +#include "sysemu/watchdog.h"
> +#include "hw/sysbus.h"
> +#include "hw/registerfields.h"
> +#include "hw/watchdog/cmsdk-apb-watchdog.h"
> +
> +REG32(WDOGLOAD, 0x0)
> +REG32(WDOGVALUE, 0x4)
> +REG32(WDOGCONTROL, 0x8)
> +    FIELD(WDOGCONTROL, INTEN, 0, 1)
> +    FIELD(WDOGCONTROL, RESEN, 1, 1)
> +#define R_WDOGCONTROL_VALID_MASK (R_WDOGCONTROL_INTEN_MASK | \
> +                                  R_WDOGCONTROL_RESEN_MASK)

Or:

       FIELD(WDOGCONTROL, VALID, 0, 2)

> +REG32(WDOGINTCLR, 0xc)
> +REG32(WDOGRIS, 0x10)
> +    FIELD(WDOGRIS, INT, 0, 1)
> +REG32(WDOGMIS, 0x14)
> +REG32(WDOGLOCK, 0xc00)
> +#define WDOG_UNLOCK_VALUE 0x1ACCE551
> +REG32(WDOGITCR, 0xf00)
> +    FIELD(WDOGITCR, ENABLE, 0, 1)
> +#define R_WDOGITCR_VALID_MASK R_WDOGITCR_ENABLE_MASK
> +REG32(WDOGITOP, 0xf04)
> +    FIELD(WDOGITOP, WDOGRES, 0, 1)
> +    FIELD(WDOGITOP, WDOGINT, 1, 1)
> +#define R_WDOGITOP_VALID_MASK (R_WDOGITOP_WDOGRES_MASK | \
> +                               R_WDOGITOP_WDOGINT_MASK)
> +REG32(PID4, 0xfd0)
> +REG32(PID5, 0xfd4)
> +REG32(PID6, 0xfd8)
> +REG32(PID7, 0xfdc)
> +REG32(PID0, 0xfe0)
> +REG32(PID1, 0xfe4)
> +REG32(PID2, 0xfe8)
> +REG32(PID3, 0xfec)
> +REG32(CID0, 0xff0)
> +REG32(CID1, 0xff4)
> +REG32(CID2, 0xff8)
> +REG32(CID3, 0xffc)
> +
> +/* PID/CID values */
> +static const int watchdog_id[] = {
> +    0x04, 0x00, 0x00, 0x00, /* PID4..PID7 */
> +    0x24, 0xb8, 0x1b, 0x00, /* PID0..PID3 */
> +    0x0d, 0xf0, 0x05, 0xb1, /* CID0..CID3 */
> +};
> +
> +static bool cmsdk_apb_watchdog_intstatus(CMSDKAPBWatchdog *s)
> +{
> +    /* Return masked interrupt status */
> +    return s->intstatus && (s->control & R_WDOGCONTROL_INTEN_MASK);
> +}
> +
> +static bool cmsdk_apb_watchdog_resetstatus(CMSDKAPBWatchdog *s)
> +{
> +    /* Return masked reset status */
> +    return s->resetstatus && (s->control & R_WDOGCONTROL_RESEN_MASK);
> +}
> +
> +static void cmsdk_apb_watchdog_update(CMSDKAPBWatchdog *s)
> +{
> +    bool wdogint;
> +    bool wdogres;
> +
> +    if (s->itcr) {
> +        wdogint = s->itop & R_WDOGITOP_WDOGINT_MASK;
> +        wdogres = s->itop & R_WDOGITOP_WDOGRES_MASK;
> +    } else {
> +        wdogint = cmsdk_apb_watchdog_intstatus(s);
> +        wdogres = cmsdk_apb_watchdog_resetstatus(s);
> +    }
> +
> +    qemu_set_irq(s->wdogint, wdogint);
> +    if (wdogres) {
> +        watchdog_perform_action();
> +    }
> +}
> +
> +static uint64_t cmsdk_apb_watchdog_read(void *opaque, hwaddr offset,
> +                                        unsigned size)
> +{
> +    CMSDKAPBWatchdog *s = CMSDK_APB_WATCHDOG(opaque);
> +    uint64_t r;
> +
> +    switch (offset) {
> +    case A_WDOGLOAD:
> +        r = ptimer_get_limit(s->timer);
> +        break;
> +    case A_WDOGVALUE:
> +        r = ptimer_get_count(s->timer);
> +        break;
> +    case A_WDOGCONTROL:
> +        r = s->control;
> +        break;
> +    case A_WDOGRIS:
> +        r = s->intstatus;
> +        break;
> +    case A_WDOGMIS:
> +        r = cmsdk_apb_watchdog_intstatus(s);
> +        break;
> +    case A_WDOGLOCK:
> +        r = s->lock;
> +        break;
> +    case A_WDOGITCR:
> +        r = s->itcr;
> +        break;
> +    case A_PID4 ... A_CID3:
> +        r = watchdog_id[(offset - A_PID4) / 4];
> +        break;
> +    case A_WDOGINTCLR:
> +    case A_WDOGITOP:
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +                      "CMSDK APB watchdog read: read of WO offset %x\n",
> +                      (int)offset);
> +        r = 0;
> +        break;
> +    default:
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +                      "CMSDK APB watchdog read: bad offset %x\n", (int)offset);
> +        r = 0;
> +        break;
> +    }
> +    trace_cmsdk_apb_watchdog_read(offset, r, size);
> +    return r;
> +}
> +
> +static void cmsdk_apb_watchdog_write(void *opaque, hwaddr offset,
> +                                     uint64_t value, unsigned size)
> +{
> +    CMSDKAPBWatchdog *s = CMSDK_APB_WATCHDOG(opaque);
> +
> +    trace_cmsdk_apb_watchdog_write(offset, value, size);
> +
> +    if (s->lock && offset != A_WDOGLOCK) {
> +        /* Write access is disabled via WDOGLOCK */
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +                      "CMSDK APB watchdog write: write to locked watchdog\n");
> +        return;
> +    }
> +
> +    switch (offset) {
> +    case A_WDOGLOAD:
> +        /*
> +         * Reset the load value and the current count, and make sure
> +         * we're counting.
> +         */
> +        ptimer_set_limit(s->timer, value, 1);
> +        ptimer_run(s->timer, 0);
> +        break;
> +    case A_WDOGCONTROL:
> +        s->control = value & R_WDOGCONTROL_VALID_MASK;
> +        cmsdk_apb_watchdog_update(s);
> +        break;
> +    case A_WDOGINTCLR:
> +        s->intstatus = 0;
> +        ptimer_set_count(s->timer, ptimer_get_limit(s->timer));
> +        cmsdk_apb_watchdog_update(s);
> +        break;
> +    case A_WDOGLOCK:
> +        s->lock = (value != WDOG_UNLOCK_VALUE);
> +        break;
> +    case A_WDOGITCR:
> +        s->itcr = value & R_WDOGITCR_VALID_MASK;
> +        cmsdk_apb_watchdog_update(s);
> +        break;
> +    case A_WDOGITOP:
> +        s->itop = value & R_WDOGITOP_VALID_MASK;
> +        cmsdk_apb_watchdog_update(s);
> +        break;
> +    case A_WDOGVALUE:
> +    case A_WDOGRIS:
> +    case A_WDOGMIS:
> +    case A_PID4 ... A_CID3:
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +                      "CMSDK APB watchdog write: write to RO offset 0x%x\n",
> +                      (int)offset);
> +        break;
> +    default:
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +                      "CMSDK APB watchdog write: bad offset 0x%x\n",
> +                      (int)offset);
> +        break;
> +    }
> +}
> +
> +static const MemoryRegionOps cmsdk_apb_watchdog_ops = {
> +    .read = cmsdk_apb_watchdog_read,
> +    .write = cmsdk_apb_watchdog_write,
> +    .endianness = DEVICE_LITTLE_ENDIAN,
> +    /* byte/halfword accesses are just zero-padded on reads and writes */
> +    .impl.min_access_size = 4,
> +    .impl.max_access_size = 4,
> +    .valid.min_access_size = 1,
> +    .valid.max_access_size = 4,
> +};
> +
> +static void cmsdk_apb_watchdog_tick(void *opaque)
> +{
> +    CMSDKAPBWatchdog *s = CMSDK_APB_WATCHDOG(opaque);
> +
> +    if (!s->intstatus) {
> +        /* Count expired for the first time: raise interrupt */
> +        s->intstatus = R_WDOGRIS_INT_MASK;
> +    } else {
> +        /* Count expired for the second time: raise reset and stop clock */
> +        s->resetstatus = 1;
> +        ptimer_stop(s->timer);
> +    }
> +    cmsdk_apb_watchdog_update(s);
> +}
> +
> +static void cmsdk_apb_watchdog_reset(DeviceState *dev)
> +{
> +    CMSDKAPBWatchdog *s = CMSDK_APB_WATCHDOG(dev);
> +
> +    trace_cmsdk_apb_watchdog_reset();
> +    s->control = 0;
> +    s->intstatus = 0;
> +    s->lock = 0;
> +    s->itcr = 0;
> +    s->itop = 0;
> +    s->resetstatus = 0;
> +    /* Set the limit and the count */
> +    ptimer_set_limit(s->timer, 0xffffffff, 1);
> +    ptimer_run(s->timer, 0);
> +}
> +
> +static void cmsdk_apb_watchdog_init(Object *obj)
> +{
> +    SysBusDevice *sbd = SYS_BUS_DEVICE(obj);
> +    CMSDKAPBWatchdog *s = CMSDK_APB_WATCHDOG(obj);
> +
> +    memory_region_init_io(&s->iomem, obj, &cmsdk_apb_watchdog_ops,
> +                          s, "cmsdk-apb-watchdog", 0x1000);
> +    sysbus_init_mmio(sbd, &s->iomem);
> +    sysbus_init_irq(sbd, &s->wdogint);
> +}
> +
> +static void cmsdk_apb_watchdog_realize(DeviceState *dev, Error **errp)
> +{
> +    CMSDKAPBWatchdog *s = CMSDK_APB_WATCHDOG(dev);
> +    QEMUBH *bh;
> +
> +    if (s->wdogclk_frq == 0) {
> +        error_setg(errp,
> +                   "CMSDK APB watchdog: wdogclk-frq property must be set");
> +        return;
> +    }
> +
> +    bh = qemu_bh_new(cmsdk_apb_watchdog_tick, s);
> +    s->timer = ptimer_init(bh,
> +                           PTIMER_POLICY_WRAP_AFTER_ONE_PERIOD |
> +                           PTIMER_POLICY_TRIGGER_ONLY_ON_DECREMENT |
> +                           PTIMER_POLICY_NO_IMMEDIATE_RELOAD |
> +                           PTIMER_POLICY_NO_COUNTER_ROUND_DOWN);
> +
> +    ptimer_set_freq(s->timer, s->wdogclk_frq);
> +}
> +
> +static const VMStateDescription cmsdk_apb_watchdog_vmstate = {
> +    .name = "cmsdk-apb-watchdog",
> +    .version_id = 1,
> +    .minimum_version_id = 1,
> +    .fields = (VMStateField[]) {
> +        VMSTATE_PTIMER(timer, CMSDKAPBWatchdog),
> +        VMSTATE_UINT32(control, CMSDKAPBWatchdog),
> +        VMSTATE_UINT32(intstatus, CMSDKAPBWatchdog),
> +        VMSTATE_UINT32(lock, CMSDKAPBWatchdog),
> +        VMSTATE_UINT32(itcr, CMSDKAPBWatchdog),
> +        VMSTATE_UINT32(itop, CMSDKAPBWatchdog),
> +        VMSTATE_UINT32(resetstatus, CMSDKAPBWatchdog),
> +        VMSTATE_END_OF_LIST()
> +    }
> +};
> +
> +static Property cmsdk_apb_watchdog_properties[] = {
> +    DEFINE_PROP_UINT32("wdogclk-frq", CMSDKAPBWatchdog, wdogclk_frq, 0),
> +    DEFINE_PROP_END_OF_LIST(),
> +};
> +
> +static void cmsdk_apb_watchdog_class_init(ObjectClass *klass, void *data)
> +{
> +    DeviceClass *dc = DEVICE_CLASS(klass);
> +
> +    dc->realize = cmsdk_apb_watchdog_realize;
> +    dc->vmsd = &cmsdk_apb_watchdog_vmstate;
> +    dc->reset = cmsdk_apb_watchdog_reset;
> +    dc->props = cmsdk_apb_watchdog_properties;
> +}
> +
> +static const TypeInfo cmsdk_apb_watchdog_info = {
> +    .name = TYPE_CMSDK_APB_WATCHDOG,
> +    .parent = TYPE_SYS_BUS_DEVICE,
> +    .instance_size = sizeof(CMSDKAPBWatchdog),
> +    .instance_init = cmsdk_apb_watchdog_init,
> +    .class_init = cmsdk_apb_watchdog_class_init,
> +};
> +
> +static void cmsdk_apb_watchdog_register_types(void)
> +{
> +    type_register_static(&cmsdk_apb_watchdog_info);
> +}
> +
> +type_init(cmsdk_apb_watchdog_register_types);
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 2c1a55ca207..7ea39c0176b 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -457,6 +457,8 @@ F: hw/timer/cmsdk-apb-dualtimer.c
>  F: include/hw/timer/cmsdk-apb-dualtimer.h
>  F: hw/char/cmsdk-apb-uart.c
>  F: include/hw/char/cmsdk-apb-uart.h
> +F: hw/watchdog/cmsdk-apb-watchdog.c
> +F: include/hw/watchdog/cmsdk-apb-watchdog.h
>  F: hw/misc/tz-ppc.c
>  F: include/hw/misc/tz-ppc.h
>  F: hw/misc/tz-mpc.c
> diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-softmmu.mak
> index 046e8903839..521c3d459fa 100644
> --- a/default-configs/arm-softmmu.mak
> +++ b/default-configs/arm-softmmu.mak
> @@ -105,6 +105,7 @@ CONFIG_STM32F205_SOC=y
>  CONFIG_CMSDK_APB_TIMER=y
>  CONFIG_CMSDK_APB_DUALTIMER=y
>  CONFIG_CMSDK_APB_UART=y
> +CONFIG_CMSDK_APB_WATCHDOG=y
>  
>  CONFIG_MPS2_FPGAIO=y
>  CONFIG_MPS2_SCC=y
> diff --git a/hw/watchdog/trace-events b/hw/watchdog/trace-events
> new file mode 100644
> index 00000000000..fee95847df0
> --- /dev/null
> +++ b/hw/watchdog/trace-events
> @@ -0,0 +1,6 @@
> +# See docs/devel/tracing.txt for syntax documentation.
> +
> +# hw/char/cmsdk_apb_watchdog.c
> +cmsdk_apb_watchdog_read(uint64_t offset, uint64_t data, unsigned size) "CMSDK APB watchdog read: offset 0x%" PRIx64 " data 0x%" PRIx64 " size %u"
> +cmsdk_apb_watchdog_write(uint64_t offset, uint64_t data, unsigned size) "CMSDK APB watchdog write: offset 0x%" PRIx64 " data 0x%" PRIx64 " size %u"
> +cmsdk_apb_watchdog_reset(void) "CMSDK APB watchdog: reset"
> 

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
