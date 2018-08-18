Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp796803wrd;
        Fri, 17 Aug 2018 18:16:44 -0700 (PDT)
X-Google-Smtp-Source: AA+uWPx3WG/H1KDk8wpZBTLHlIwbLHrdgH2uUYnxdkTiHZgXsVByjD16j3Z0Wcvw6X6875SZ5wc/
X-Received: by 2002:ac8:37c2:: with SMTP id e2-v6mr36974858qtc.417.1534555004420;
        Fri, 17 Aug 2018 18:16:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1534555004; cv=none;
        d=google.com; s=arc-20160816;
        b=eGq7pSuSOZLxQfNVelifHJR82EscJ7DnmhSW0PGf7sdJfRF5Hm2tcMkrogB1+4If4E
         OWm0D8Jr+Hg014jyyTjTa1t2xV3esnkaiybX+mQFOwU8o9udvFB5rqUIk2OMcb0ShYtz
         apxFGdJ39atmXWZrIuxlw1RwjSqtCkxjwp4Quj6HQyHmbfqfYKbFTcUo4lB5foQMgvp7
         1VXOmEOlsux3++Y7mUg/Rwr6nIYDxWwv/cVRC2f8lqEIp91ZK0tfxt1zAaCXOI53IYlB
         VPgg2MmvLjb0DAVTsAlSApx8+dChVWWPkF+NHjBBWvgpkyIRuBq4bl8uIfnWfUstGsfA
         P0ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=5fheSO66XUdQfQCiJ85sclDZkhEGd0yZI2DiVqqUN3E=;
        b=0R8ftKfySAWwSykAIWc4U4nEFtl0G0A7D+tJjtac98cacEdnsGqcHShN7v/exPEoK/
         DcGbi+hbFohEMwtuezwIDgVeML+cVnzIyC6xeAof2tFMdW2CIPrOWIX9RePTpfsMCVO7
         h3FfcYzuZbY4x9NRw/Po7eH3bgVFWpe5v9vr7xSODTzx8Cb5gKmdnJ9fHFh5vERiaGdv
         DiHg/E4dOoEn0JOjieIpFPfnTrGkcmsjhvItEp7Jwd+Pta5naG33BVg9Pz+R64XkTunW
         8+IA2oJJ+R/QUbL3V93mJhpZClkDDV3GvGKHVETY2Oya+oU3ZoVESkPHu0wMomn5kTYC
         pY8A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Z+bLCBcc;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e12-v6si3381769qtf.249.2018.08.17.18.16.44
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 17 Aug 2018 18:16:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Z+bLCBcc;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:37085 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fqpr9-0007Vs-UL
	for alex.bennee@linaro.org; Fri, 17 Aug 2018 21:16:43 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40527)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fqppr-0007CC-DX
	for qemu-devel@nongnu.org; Fri, 17 Aug 2018 21:15:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fqppm-0007QW-MD
	for qemu-devel@nongnu.org; Fri, 17 Aug 2018 21:15:23 -0400
Received: from mail-ua1-x941.google.com ([2607:f8b0:4864:20::941]:34309)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fqppm-0007Pz-FY; Fri, 17 Aug 2018 21:15:18 -0400
Received: by mail-ua1-x941.google.com with SMTP id r15-v6so6784329uao.1;
	Fri, 17 Aug 2018 18:15:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:autocrypt:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=5fheSO66XUdQfQCiJ85sclDZkhEGd0yZI2DiVqqUN3E=;
	b=Z+bLCBccOWQTU6C6hupCQWwW084NwcHHSwk2nV1DWdyHhKevOTVHdzLm6540//W1Vy
	d61M5bwJ376nHLCpbDGSQaCNObUU7588sdyH+/TJou0faSHi2w0bQm+xJMxCLWU1iLoZ
	LDHvNVEKI/E8GumGYOrGO7gQlfLWfVhVpXVWGdMBDPHYV7hPk8cbhwSC5z+k7irnxMkk
	sKjCPz5QXT7Hptlx0VaYJGQ+6AtMkfcbkKgjV9DvoCZhCP3MFGifsEQ2NuNTFPeprG/e
	WSEuGSi/yS5E/vy0KIHX361ZU+9V0J1aRa4uCwQEr/zXn1mCxsjiyutx4evuXyJ9KQum
	hG4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:autocrypt:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=5fheSO66XUdQfQCiJ85sclDZkhEGd0yZI2DiVqqUN3E=;
	b=Xunu5Iv9f0obQMZroKb4bxocnETxWES8nS+Fu5uiU3oyooDs3xyJYW7g7NJgPCl1LI
	HpWGkJxJwtB8sXcDsHuUH6v72hEw8RAyF3GZk1PQ7qTnvKctLF8VkElhDPcwd6QL1P7e
	lfHS7Pdg+BxhT0JRTnfFIy0hJrmD9UEk8ReSaKXC17rMX8fD3i3+L0e8jOQzVDJwrARt
	q/+T21R/IThhfF72nwnL5IjRrWzj6Q0Oat0YVHUI+S013R3hbDYDnqFbzQoqA1OkZErE
	UB4qyNlbcFaoDJ0qRqkkNVvaeD30izxdlGQrd4V0W2nlH9gDOG1jsdH0rdSugSc3YZ6E
	fJmw==
X-Gm-Message-State: AOUpUlEeeGN8o2GF9WjTWDd3imEzLK7hh7NsTa5QMKGaJKKUn8ErR2Ld
	iduq4r5d2YCNI2SZqyM8aLQ=
X-Received: by 2002:ab0:a25:: with SMTP id
	q37-v6mr24532853uah.22.1534554917774; 
	Fri, 17 Aug 2018 18:15:17 -0700 (PDT)
Received: from [192.168.1.11] ([138.117.48.222])
	by smtp.gmail.com with ESMTPSA id
	v5-v6sm606659ual.18.2018.08.17.18.15.15
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 17 Aug 2018 18:15:17 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20180809130115.28951-1-peter.maydell@linaro.org>
	<20180809130115.28951-8-peter.maydell@linaro.org>
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
Message-ID: <a1de4849-63ee-a5f1-99b0-8e852acef2e8@amsat.org>
Date: Fri, 17 Aug 2018 22:15:12 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20180809130115.28951-8-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::941
Subject: Re: [Qemu-devel] [Qemu-arm] [PATCH 07/16] hw/misc/tz-msc: Model
 TrustZone Master Security Controller
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
X-TUID: KkZhdywo1aOp

On 08/09/2018 10:01 AM, Peter Maydell wrote:
> Implement a model of the TrustZone Master Securtiy Controller,

Security

> as documented in the Arm CoreLink SIE-200 System IP for
> Embedded TRM  (DDI0571G):
>   https://developer.arm.com/products/architecture/m-profile/docs/ddi0571/g

Your link returns 404.

This one worked:

https://developer.arm.com/docs/ddi0571/e

> 
> The MSC is intended to sit in front of a device which can
> be a bus master (eg a DMA controller) and programmably gate
> its transactions. This allows a bus-mastering device to be
> controlled by non-secure code but still restricted from
> making accesses to addresses which are secure-only.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/misc/Makefile.objs           |   1 +
>  include/hw/misc/tz-msc.h        |  79 ++++++++
>  hw/misc/tz-msc.c                | 308 ++++++++++++++++++++++++++++++++
>  MAINTAINERS                     |   2 +
>  default-configs/arm-softmmu.mak |   1 +
>  hw/misc/trace-events            |   9 +
>  6 files changed, 400 insertions(+)
>  create mode 100644 include/hw/misc/tz-msc.h
>  create mode 100644 hw/misc/tz-msc.c
> 
> diff --git a/hw/misc/Makefile.objs b/hw/misc/Makefile.objs
> index dbadb41d57a..d168f8ac304 100644
> --- a/hw/misc/Makefile.objs
> +++ b/hw/misc/Makefile.objs
> @@ -63,6 +63,7 @@ obj-$(CONFIG_MPS2_FPGAIO) += mps2-fpgaio.o
>  obj-$(CONFIG_MPS2_SCC) += mps2-scc.o
>  
>  obj-$(CONFIG_TZ_MPC) += tz-mpc.o
> +obj-$(CONFIG_TZ_MSC) += tz-msc.o
>  obj-$(CONFIG_TZ_PPC) += tz-ppc.o
>  obj-$(CONFIG_IOTKIT_SECCTL) += iotkit-secctl.o
>  obj-$(CONFIG_IOTKIT_SYSCTL) += iotkit-sysctl.o
> diff --git a/include/hw/misc/tz-msc.h b/include/hw/misc/tz-msc.h
> new file mode 100644
> index 00000000000..116b96ae9b8
> --- /dev/null
> +++ b/include/hw/misc/tz-msc.h
> @@ -0,0 +1,79 @@
> +/*
> + * ARM TrustZone master security controller emulation
> + *
> + * Copyright (c) 2018 Linaro Limited
> + * Written by Peter Maydell
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 or
> + * (at your option) any later version.
> + */
> +
> +/*
> + * This is a model of the TrustZone master security controller (MSC).
> + * It is documented in the ARM CoreLink SIE-200 System IP for Embedded TRM
> + * (DDI 0571G):
> + * https://developer.arm.com/products/architecture/m-profile/docs/ddi0571/g
> + *
> + * The MSC sits in front of a device which can be a bus master (such as
> + * a DMA controller) and allows secure software to configure it to either
> + * pass through or reject transactions made by that bus master.
> + * Rejected transactions may be configured to either be aborted, or to
> + * behave as RAZ/WI. An interrupt can be signalled for a rejected transaction.
> + *
> + * The MSC has no register interface -- it is configured purely by a
> + * collection of input signals from other hardware in the system. Typically
> + * they are either hardwired or exposed in an ad-hoc register interface by
> + * the SoC that uses the MSC.
> + *
> + * We don't currently implement the irq_enable GPIO input, because on
> + * the MPS2 FPGA images it is always tied high, which is awkward to
> + * implement in QEMU.
> + *
> + * QEMU interface:
> + * + Named GPIO input "cfg_nonsec": set to 1 if the bus master should be
> + *   treated as nonsecure, or 0 for secure
> + * + Named GPIO input "cfg_sec_resp": set to 1 if a rejected transaction should
> + *   result in a transaction error, or 0 for the transaction to RAZ/WI
> + * + Named GPIO input "irq_clear": set to 1 to clear a pending interrupt
> + * + Named GPIO output "irq": set for a transaction-failed interrupt
> + * + Property "downstream": MemoryRegion defining where bus master transactions
> + *   are made if they are not blocked
> + * + Property "idau": an object implementing IDAUInterface, which defines which
> + *   addresses should be treated as secure and which as non-secure.
> + *   This need not be the same IDAU as the one used by the CPU.
> + * + sysbus MMIO region 0: MemoryRegion defining the upstream end of the MSC;
> + *   this should be passed to the bus master device as the region it should
> + *   make memory transactions to
> + */
> +
> +#ifndef TZ_MSC_H
> +#define TZ_MSC_H
> +
> +#include "hw/sysbus.h"
> +#include "target/arm/idau.h"
> +
> +#define TYPE_TZ_MSC "tz-msc"
> +#define TZ_MSC(obj) OBJECT_CHECK(TZMSC, (obj), TYPE_TZ_MSC)
> +
> +typedef struct TZMSC {
> +    /*< private >*/
> +    SysBusDevice parent_obj;
> +
> +    /*< public >*/
> +
> +    /* State: these just track the values of our input signals */
> +    bool cfg_nonsec;
> +    bool cfg_sec_resp;
> +    bool irq_clear;
> +    /* State: are we asserting irq ? */
> +    bool irq_status;
> +
> +    qemu_irq irq;
> +    MemoryRegion *downstream;
> +    AddressSpace downstream_as;
> +    MemoryRegion upstream;
> +    IDAUInterface *idau;
> +} TZMSC;
> +
> +#endif
> diff --git a/hw/misc/tz-msc.c b/hw/misc/tz-msc.c
> new file mode 100644
> index 00000000000..9e352044ea5
> --- /dev/null
> +++ b/hw/misc/tz-msc.c
> @@ -0,0 +1,308 @@
> +/*
> + * ARM TrustZone master security controller emulation
> + *
> + * Copyright (c) 2018 Linaro Limited
> + * Written by Peter Maydell
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 or
> + * (at your option) any later version.
> + */
> +
> +#include "qemu/osdep.h"
> +#include "qemu/log.h"
> +#include "qapi/error.h"
> +#include "trace.h"
> +#include "hw/sysbus.h"
> +#include "hw/registerfields.h"
> +#include "hw/misc/tz-msc.h"
> +
> +static void tz_msc_update_irq(TZMSC *s)
> +{
> +    bool level = s->irq_status;
> +
> +    trace_tz_msc_update_irq(level);
> +    qemu_set_irq(s->irq, level);
> +}
> +
> +static void tz_msc_cfg_nonsec(void *opaque, int n, int level)
> +{
> +    TZMSC *s = TZ_MSC(opaque);
> +
> +    trace_tz_msc_cfg_nonsec(level);
> +    s->cfg_nonsec = level;
> +}
> +
> +static void tz_msc_cfg_sec_resp(void *opaque, int n, int level)
> +{
> +    TZMSC *s = TZ_MSC(opaque);
> +
> +    trace_tz_msc_cfg_sec_resp(level);
> +    s->cfg_sec_resp = level;
> +}
> +
> +static void tz_msc_irq_clear(void *opaque, int n, int level)
> +{
> +    TZMSC *s = TZ_MSC(opaque);
> +
> +    trace_tz_msc_irq_clear(level);
> +
> +    s->irq_clear = level;
> +    if (level) {
> +        s->irq_status = false;
> +        tz_msc_update_irq(s);
> +    }
> +}
> +
> +/* The MSC may either block a transaction by aborting it, block a
> + * transaction by making it RAZ/WI, allow it through with
> + * MemTxAttrs indicating a secure transaction, or allow it with
> + * MemTxAttrs indicating a non-secure transaction.
> + */
> +typedef enum MSCAction {
> +    MSCBlockAbort,
> +    MSCBlockRAZWI,
> +    MSCAllowSecure,
> +    MSCAllowNonSecure,
> +} MSCAction;
> +
> +static MSCAction tz_msc_check(TZMSC *s, hwaddr addr)
> +{
> +    /*
> +     * Check whether to allow an access from the bus master, returning
> +     * an MSCAction indicating the required behaviour. If the transaction
> +     * is blocked, the caller must check cfg_sec_resp to determine
> +     * whether to abort or RAZ/WI the transaction.
> +     */
> +    IDAUInterfaceClass *iic = IDAU_INTERFACE_GET_CLASS(s->idau);
> +    IDAUInterface *ii = IDAU_INTERFACE(s->idau);
> +    bool idau_exempt = false, idau_ns = true, idau_nsc = true;
> +    int idau_region = IREGION_NOTVALID;
> +
> +    iic->check(ii, addr, &idau_region, &idau_exempt, &idau_ns, &idau_nsc);
> +
> +    if (idau_exempt) {
> +        /*
> +         * Uncheck region -- OK, transaction type depends on
> +         * whether bus master is configured as Secure or NonSecure
> +         */
> +        return s->cfg_nonsec ? MSCAllowNonSecure : MSCAllowSecure;
> +    }
> +
> +    if (idau_ns) {
> +        /* NonSecure region -- always forward as NS transaction */
> +        return MSCAllowNonSecure;
> +    }
> +
> +    if (!s->cfg_nonsec) {
> +        /* Access to Secure region by Secure bus master: OK */
> +        return MSCAllowSecure;
> +    }
> +
> +    /* Attempted access to Secure region by NS bus master: block */
> +    trace_tz_msc_access_blocked(addr);
> +    if (!s->cfg_sec_resp) {
> +        return MSCBlockRAZWI;
> +    }
> +
> +    /*
> +     * The TRM isn't clear on behaviour if irq_clear is high when a
> +     * transaction is blocked. We assume that the MSC behaves like the
> +     * PPC, where holding irq_clear high suppresses the interrupt.
> +     */
> +    if (!s->irq_clear) {
> +        s->irq_status = true;
> +        tz_msc_update_irq(s);
> +    }
> +    return MSCBlockAbort;
> +}
> +
> +static MemTxResult tz_msc_read(void *opaque, hwaddr addr, uint64_t *pdata,
> +                               unsigned size, MemTxAttrs attrs)
> +{
> +    TZMSC *s = opaque;
> +    AddressSpace *as = &s->downstream_as;
> +    uint64_t data;
> +    MemTxResult res;
> +
> +    switch (tz_msc_check(s, addr)) {
> +    case MSCBlockAbort:
> +        return MEMTX_ERROR;
> +    case MSCBlockRAZWI:
> +        *pdata = 0;
> +        return MEMTX_OK;
> +    case MSCAllowSecure:
> +        attrs.secure = 1;
> +        attrs.unspecified = 0;
> +        break;
> +    case MSCAllowNonSecure:
> +        attrs.secure = 0;
> +        attrs.unspecified = 0;
> +        break;
> +    }
> +
> +    switch (size) {
> +    case 1:
> +        data = address_space_ldub(as, addr, attrs, &res);
> +        break;
> +    case 2:
> +        data = address_space_lduw_le(as, addr, attrs, &res);
> +        break;
> +    case 4:
> +        data = address_space_ldl_le(as, addr, attrs, &res);
> +        break;
> +    case 8:
> +        data = address_space_ldq_le(as, addr, attrs, &res);
> +        break;
> +    default:
> +        g_assert_not_reached();
> +    }
> +    *pdata = data;
> +    return res;
> +}
> +
> +static MemTxResult tz_msc_write(void *opaque, hwaddr addr, uint64_t val,
> +                                unsigned size, MemTxAttrs attrs)
> +{
> +    TZMSC *s = opaque;
> +    AddressSpace *as = &s->downstream_as;
> +    MemTxResult res;
> +
> +    switch (tz_msc_check(s, addr)) {
> +    case MSCBlockAbort:
> +        return MEMTX_ERROR;
> +    case MSCBlockRAZWI:
> +        return MEMTX_OK;
> +    case MSCAllowSecure:
> +        attrs.secure = 1;
> +        attrs.unspecified = 0;
> +        break;
> +    case MSCAllowNonSecure:
> +        attrs.secure = 0;
> +        attrs.unspecified = 0;
> +        break;
> +    }
> +
> +    switch (size) {
> +    case 1:
> +        address_space_stb(as, addr, val, attrs, &res);
> +        break;
> +    case 2:
> +        address_space_stw_le(as, addr, val, attrs, &res);
> +        break;
> +    case 4:
> +        address_space_stl_le(as, addr, val, attrs, &res);
> +        break;
> +    case 8:
> +        address_space_stq_le(as, addr, val, attrs, &res);
> +        break;
> +    default:
> +        g_assert_not_reached();
> +    }
> +    return res;
> +}
> +
> +static const MemoryRegionOps tz_msc_ops = {
> +    .read_with_attrs = tz_msc_read,
> +    .write_with_attrs = tz_msc_write,
> +    .endianness = DEVICE_LITTLE_ENDIAN,
> +};
> +
> +static void tz_msc_reset(DeviceState *dev)
> +{
> +    TZMSC *s = TZ_MSC(dev);
> +
> +    trace_tz_msc_reset();
> +    s->cfg_sec_resp = false;
> +    s->cfg_nonsec = false;
> +    s->irq_clear = 0;
> +    s->irq_status = 0;
> +}
> +
> +static void tz_msc_init(Object *obj)
> +{
> +    DeviceState *dev = DEVICE(obj);
> +    TZMSC *s = TZ_MSC(obj);
> +
> +    qdev_init_gpio_in_named(dev, tz_msc_cfg_nonsec, "cfg_nonsec", 1);
> +    qdev_init_gpio_in_named(dev, tz_msc_cfg_sec_resp, "cfg_sec_resp", 1);
> +    qdev_init_gpio_in_named(dev, tz_msc_irq_clear, "irq_clear", 1);
> +    qdev_init_gpio_out_named(dev, &s->irq, "irq", 1);
> +}
> +
> +static void tz_msc_realize(DeviceState *dev, Error **errp)
> +{
> +    Object *obj = OBJECT(dev);
> +    SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
> +    TZMSC *s = TZ_MSC(dev);
> +    const char *name = "tz-msc-downstream";
> +    uint64_t size;
> +
> +    /*
> +     * We can't create the upstream end of the port until realize,
> +     * as we don't know the size of the MR used as the downstream until then.
> +     * We insist on having a downstream, to avoid complicating the
> +     * code with handling the "don't know how big this is" case. It's easy
> +     * enough for the user to create an unimplemented_device as downstream
> +     * if they have nothing else to plug into this.
> +     */
> +    if (!s->downstream) {
> +        error_setg(errp, "MSC 'downstream' link not set");
> +        return;
> +    }
> +    if (!s->idau) {
> +        error_setg(errp, "MSC 'idau' link not set");
> +        return;
> +    }
> +
> +    size = memory_region_size(s->downstream);
> +    address_space_init(&s->downstream_as, s->downstream, name);
> +    memory_region_init_io(&s->upstream, obj, &tz_msc_ops, s, name, size);
> +    sysbus_init_mmio(sbd, &s->upstream);
> +}
> +
> +static const VMStateDescription tz_msc_vmstate = {
> +    .name = "tz-msc",
> +    .version_id = 1,
> +    .minimum_version_id = 1,
> +    .fields = (VMStateField[]) {
> +        VMSTATE_BOOL(cfg_nonsec, TZMSC),
> +        VMSTATE_BOOL(cfg_sec_resp, TZMSC),
> +        VMSTATE_BOOL(irq_clear, TZMSC),
> +        VMSTATE_BOOL(irq_status, TZMSC),
> +        VMSTATE_END_OF_LIST()
> +    }
> +};
> +
> +static Property tz_msc_properties[] = {
> +    DEFINE_PROP_LINK("downstream", TZMSC, downstream,
> +                     TYPE_MEMORY_REGION, MemoryRegion *),
> +    DEFINE_PROP_LINK("idau", TZMSC, idau,
> +                     TYPE_IDAU_INTERFACE, IDAUInterface *),
> +    DEFINE_PROP_END_OF_LIST(),
> +};
> +
> +static void tz_msc_class_init(ObjectClass *klass, void *data)
> +{
> +    DeviceClass *dc = DEVICE_CLASS(klass);
> +
> +    dc->realize = tz_msc_realize;
> +    dc->vmsd = &tz_msc_vmstate;
> +    dc->reset = tz_msc_reset;
> +    dc->props = tz_msc_properties;
> +}
> +
> +static const TypeInfo tz_msc_info = {
> +    .name = TYPE_TZ_MSC,
> +    .parent = TYPE_SYS_BUS_DEVICE,
> +    .instance_size = sizeof(TZMSC),
> +    .instance_init = tz_msc_init,
> +    .class_init = tz_msc_class_init,
> +};
> +
> +static void tz_msc_register_types(void)
> +{
> +    type_register_static(&tz_msc_info);
> +}
> +
> +type_init(tz_msc_register_types);
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 96fe011e952..5d1a3645dd4 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -463,6 +463,8 @@ F: hw/misc/tz-ppc.c
>  F: include/hw/misc/tz-ppc.h
>  F: hw/misc/tz-mpc.c
>  F: include/hw/misc/tz-mpc.h
> +F: hw/misc/tz-msc.c
> +F: include/hw/misc/tz-msc.h
>  
>  ARM cores
>  M: Peter Maydell <peter.maydell@linaro.org>
> diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-softmmu.mak
> index da59b820a4f..1f2ac3b1767 100644
> --- a/default-configs/arm-softmmu.mak
> +++ b/default-configs/arm-softmmu.mak
> @@ -111,6 +111,7 @@ CONFIG_MPS2_FPGAIO=y
>  CONFIG_MPS2_SCC=y
>  
>  CONFIG_TZ_MPC=y
> +CONFIG_TZ_MSC=y
>  CONFIG_TZ_PPC=y
>  CONFIG_IOTKIT=y
>  CONFIG_IOTKIT_SECCTL=y
> diff --git a/hw/misc/trace-events b/hw/misc/trace-events
> index 83ab58c30f5..f9be1b822e7 100644
> --- a/hw/misc/trace-events
> +++ b/hw/misc/trace-events
> @@ -92,6 +92,15 @@ tz_mpc_mem_blocked_write(uint64_t addr, uint64_t data, unsigned size, bool secur
>  tz_mpc_translate(uint64_t addr, int flags, const char *idx, const char *res) "TZ MPC translate: addr 0x%" PRIx64 " flags 0x%x iommu_idx %s: %s"
>  tz_mpc_iommu_notify(uint64_t addr) "TZ MPC iommu: notifying UNMAP/MAP for 0x%" PRIx64
>  
> +# hw/misc/tz-msc.c
> +tz_msc_reset(void) "TZ MSC: reset"
> +tz_msc_cfg_nonsec(int level) "TZ MSC: cfg_nonsec = %d"
> +tz_msc_cfg_sec_resp(int level) "TZ MSC: cfg_sec_resp = %d"
> +tz_msc_irq_enable(int level) "TZ MSC: int_enable = %d"
> +tz_msc_irq_clear(int level) "TZ MSC: int_clear = %d"
> +tz_msc_update_irq(int level) "TZ MSC: setting irq line to %d"
> +tz_msc_access_blocked(uint64_t offset) "TZ MSC: offset 0x%" PRIx64 " access blocked"
> +
>  # hw/misc/tz-ppc.c
>  tz_ppc_reset(void) "TZ PPC: reset"
>  tz_ppc_cfg_nonsec(int n, int level) "TZ PPC: cfg_nonsec[%d] = %d"
> 
