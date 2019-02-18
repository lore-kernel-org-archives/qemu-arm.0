Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp2737553wrx;
        Mon, 18 Feb 2019 13:55:20 -0800 (PST)
X-Google-Smtp-Source: AHgI3IaMQ6FBdYRcdIXTiiSgQTXeWxyXHO7GqfoWfbmyKxdTrGUKMMGlT2yKGDDIkWNsMUi6Q25t
X-Received: by 2002:a25:4d02:: with SMTP id a2mr10684669ybb.90.1550526920019;
        Mon, 18 Feb 2019 13:55:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1550526920; cv=none;
        d=google.com; s=arc-20160816;
        b=SYFIAzQ9I4Dqfby3fELrWwia4MGtp642ksP9dcLmfED/i6vtSZ6BiMCwOG2NPxL/cE
         /3HL0+jnX8w9fuC566YJTqBY7QulOz+ebplseM9XUIYE0ZZlrdYN1eHaqoNvkPTDB2L6
         FBO1Fx0KEmWm3rmIV4fZocuTwJiOWM2lMmcqkTg8mlrmEzXeJ7GFihk89kgGAc0glb/a
         xBzbLYdrHPJKhSugeM9hKhqEY33IZb+Kp0S7nmCYiJJeuR3uH6JEZ5WRuI8bfw3KtQpl
         wAfyCs0MHJ8eVopaSmlXhH9Yyu2aGpjpyIv7PjlqBVkNgywlX+0Vu69Zv2bYwT06pZxL
         gdZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to;
        bh=hzQ5HDWEkLZMPkoBtqERTbEMu3sAg/l4W65388sy88I=;
        b=GmbKoTAcnWH0o67x3hrk04TzospBPajKUFFlslseKeuuzWWCxyKSrJ82vac4kC5Of7
         zeH+1oxNVZVrOw+kLJVpib04Ri+ljCJZyNKj8jBUXhOvBg00U1lagVW4yV3jQlvQvGeP
         b4eTpMqqXOkDQum1gHHvJnSWFLzXeb14EdeY7+vTk8d4jwOSePz+7Gm4yUjNNeLYk5Zb
         xvgG9sSRwrtpHsAFWAl+3hq598hVI2L4vMZoHGkXxb7xdLhFFW14POOkcQCdwBsrjUjy
         LpnTSWcqzig4z4raEFRMIk6oaIyhDkf8c4tQuPJQHWRjQox5uGj+GTzrTOVgpBgkqsuK
         KCcA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r126si8790424ywh.140.2019.02.18.13.55.19
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 18 Feb 2019 13:55:20 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:37178 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gvqsh-0003V9-GS
	for alex.bennee@linaro.org; Mon, 18 Feb 2019 16:55:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55469)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gvqsX-0003Tl-UD
	for qemu-arm@nongnu.org; Mon, 18 Feb 2019 16:55:11 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gvqsV-0002ar-W6
	for qemu-arm@nongnu.org; Mon, 18 Feb 2019 16:55:09 -0500
Received: from mail-wr1-f68.google.com ([209.85.221.68]:43555)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1gvqsU-0002Qf-0v
	for qemu-arm@nongnu.org; Mon, 18 Feb 2019 16:55:07 -0500
Received: by mail-wr1-f68.google.com with SMTP id d17so5567756wre.10
	for <qemu-arm@nongnu.org>; Mon, 18 Feb 2019 13:54:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=hzQ5HDWEkLZMPkoBtqERTbEMu3sAg/l4W65388sy88I=;
	b=gcIIiYSO3Dn1H7f9skS5OchuPy74leZkMxb9oUynTyfPCh9Q6V4vnl+dT2Lh+NmyC+
	8WQ8P00zurUFHcRDnHQkxNzqA58V0c3q5w1sfM0hT4WBM5SMDXVJc2WaIdIEqMnZmiSC
	nj+ijJTscsvmo6CI7NzuX09FJUE/ICtL+4qRzFePXFpbJri+Ifm+BzB5u/jxGrMbHAXm
	kQZ6lH0tojx8B2L/XOLEy2aJ/7hijo3EjLgsSfI/5jsO8+bBk5e1u9uHNHzx8brJcEvO
	YxaT1aW6sq5klLPGqVQ/1JLsDrhz+ZX7WokOsz9lLDhoa8LZzuBxlPqWSp81srSkBq4S
	LxzA==
X-Gm-Message-State: AHQUAuZqniGYZ9ASZBXe2XWdNeawfuieBELeHF68++epeQvOm7XNKr06
	oPPkFUPz7PIWIM1WlOSHAXyJ+A==
X-Received: by 2002:adf:a104:: with SMTP id o4mr17693428wro.244.1550526888018; 
	Mon, 18 Feb 2019 13:54:48 -0800 (PST)
Received: from [192.168.1.37] (109.red-83-53-160.dynamicip.rima-tde.net.
	[83.53.160.109])
	by smtp.gmail.com with ESMTPSA id 12sm1064472wme.25.2019.02.18.13.54.47
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Mon, 18 Feb 2019 13:54:47 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20190214125107.22178-1-peter.maydell@linaro.org>
	<20190214125107.22178-4-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <cae6418d-0cc0-f0a9-7632-69d804fb7b5b@redhat.com>
Date: Mon, 18 Feb 2019 22:54:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.5.0
MIME-Version: 1.0
In-Reply-To: <20190214125107.22178-4-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.221.68
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 03/14] hw/timer/pl031: Allow use
 as an embedded-struct device
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
Cc: patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: HomQQICqqv9X

On 2/14/19 1:50 PM, Peter Maydell wrote:
> Create a new include file for the pl031's device struct,
> type macros, etc, so that it can be instantiated using
> the "embedded struct" coding style.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

> ---
>  include/hw/timer/pl031.h | 44 ++++++++++++++++++++++++++++++++++++++++
>  hw/timer/pl031.c         | 25 +----------------------
>  MAINTAINERS              |  1 +
>  3 files changed, 46 insertions(+), 24 deletions(-)
>  create mode 100644 include/hw/timer/pl031.h
> 
> diff --git a/include/hw/timer/pl031.h b/include/hw/timer/pl031.h
> new file mode 100644
> index 00000000000..99416d8ba52
> --- /dev/null
> +++ b/include/hw/timer/pl031.h
> @@ -0,0 +1,44 @@
> +/*
> + * ARM AMBA PrimeCell PL031 RTC
> + *
> + * Copyright (c) 2007 CodeSourcery
> + *
> + * This file is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + *
> + * Contributions after 2012-01-13 are licensed under the terms of the
> + * GNU GPL, version 2 or (at your option) any later version.
> + */
> +
> +#ifndef HW_TIMER_PL031
> +#define HW_TIMER_PL031
> +
> +#include "hw/sysbus.h"
> +
> +#define TYPE_PL031 "pl031"
> +#define PL031(obj) OBJECT_CHECK(PL031State, (obj), TYPE_PL031)
> +
> +typedef struct PL031State {
> +    SysBusDevice parent_obj;
> +
> +    MemoryRegion iomem;
> +    QEMUTimer *timer;
> +    qemu_irq irq;
> +
> +    /*
> +     * Needed to preserve the tick_count across migration, even if the
> +     * absolute value of the rtc_clock is different on the source and
> +     * destination.
> +     */
> +    uint32_t tick_offset_vmstate;
> +    uint32_t tick_offset;
> +
> +    uint32_t mr;
> +    uint32_t lr;
> +    uint32_t cr;
> +    uint32_t im;
> +    uint32_t is;
> +} PL031State;
> +
> +#endif
> diff --git a/hw/timer/pl031.c b/hw/timer/pl031.c
> index d3aacce80da..f774dcd5223 100644
> --- a/hw/timer/pl031.c
> +++ b/hw/timer/pl031.c
> @@ -12,6 +12,7 @@
>   */
>  
>  #include "qemu/osdep.h"
> +#include "hw/timer/pl031.h"
>  #include "hw/sysbus.h"
>  #include "qemu/timer.h"
>  #include "sysemu/sysemu.h"
> @@ -36,30 +37,6 @@ do { printf("pl031: " fmt , ## __VA_ARGS__); } while (0)
>  #define RTC_MIS     0x18    /* Masked interrupt status register */
>  #define RTC_ICR     0x1c    /* Interrupt clear register */
>  
> -#define TYPE_PL031 "pl031"
> -#define PL031(obj) OBJECT_CHECK(PL031State, (obj), TYPE_PL031)
> -
> -typedef struct PL031State {
> -    SysBusDevice parent_obj;
> -
> -    MemoryRegion iomem;
> -    QEMUTimer *timer;
> -    qemu_irq irq;
> -
> -    /* Needed to preserve the tick_count across migration, even if the
> -     * absolute value of the rtc_clock is different on the source and
> -     * destination.
> -     */
> -    uint32_t tick_offset_vmstate;
> -    uint32_t tick_offset;
> -
> -    uint32_t mr;
> -    uint32_t lr;
> -    uint32_t cr;
> -    uint32_t im;
> -    uint32_t is;
> -} PL031State;
> -
>  static const unsigned char pl031_id[] = {
>      0x31, 0x10, 0x14, 0x00,         /* Device ID        */
>      0x0d, 0xf0, 0x05, 0xb1          /* Cell ID      */
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 9a76845581b..85d4b4c9f7c 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -493,6 +493,7 @@ F: hw/sd/pl181.c
>  F: hw/ssi/pl022.c
>  F: include/hw/ssi/pl022.h
>  F: hw/timer/pl031.c
> +F: include/hw/timer/pl031.h
>  F: include/hw/arm/primecell.h
>  F: hw/timer/cmsdk-apb-timer.c
>  F: include/hw/timer/cmsdk-apb-timer.h
> 
