Received: by 10.25.221.202 with SMTP id w71csp820364lfi;
        Thu, 3 Aug 2017 08:57:23 -0700 (PDT)
X-Received: by 10.200.40.131 with SMTP id i3mr2757916qti.63.1501775843101;
        Thu, 03 Aug 2017 08:57:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1501775843; cv=none;
        d=google.com; s=arc-20160816;
        b=zVzsiFOOdF9zcYYfCsw/Jrd7D8d/SL13h3RliHnz6zKKGBzDhZdImuai/YSHhJjN41
         Vs49VpXVsxIDnjIYKc+Wspjsav405wFQLQGlixjCx6Pg9JoiEdCObAGNX/RSu6CtQXJJ
         kC3TqcUlbYGPetedBygYDo1b6/l5TtbfCa4JGF712Oxnu7ECE+LjfF67V6PBp4ju75zx
         54ql+GKNj3+BCEs+4eeNJjsBvj77oFK/9oXMqe8UO5q0RL8xRy3LzfBr3+U8fgRTpNnl
         hKBXia9xV7wUcuKQRxo6796KfCCRMuHDcTOQ8CPxLth5bhJYj5erpHY07lhmoPjQkyBz
         Xr1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dkim-signature:arc-authentication-results;
        bh=tobNEWmmw6fNjwPGxA/dh8zCge+Am/OxYR7Gzb2ReuE=;
        b=ID2+w3EaqXz+ooshUsjLcyuX0ruEzZEpa8C0vpwQj8JGpmkzWJZDcl3QaE/rW0fhPA
         yG8+vwbzKIoRWx7kZEH+y4AnRd95jjSWAHmOhF7UfU7VQYqwqU79L0CDKR2JOuZvKNoB
         qGzNFkOzDvM9heVyzNEzUSsufjj9FqhbfcWULZ1m+IjGS/K0dxX2trl/IE/Ks3lwQ7xL
         oSZm0atY9KfbMpixYLgPoQc+0jcRZ6n+7pexYoPWp0S5Yh8VYYTdHOXkn5if0jpFK77K
         bSxNHj4PtjqjkZzt8fbioawoyR/KECUUfWcK8dn63mRSvLdMnr10gWcNIudse1eS1CGb
         sCRw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.b=ETOGVuoa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j4si33594805qkh.52.2017.08.03.08.57.22
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 03 Aug 2017 08:57:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.b=ETOGVuoa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:56005 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ddIUy-0002Xn-Db
	for alex.bennee@linaro.org; Thu, 03 Aug 2017 11:57:20 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54289)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1ddIUs-0002W1-Si
	for qemu-arm@nongnu.org; Thu, 03 Aug 2017 11:57:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1ddIUp-0006dW-Pp
	for qemu-arm@nongnu.org; Thu, 03 Aug 2017 11:57:14 -0400
Received: from mail-lf0-x241.google.com ([2a00:1450:4010:c07::241]:33180)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <edgar.iglesias@gmail.com>)
	id 1ddIUp-0006cb-Im; Thu, 03 Aug 2017 11:57:11 -0400
Received: by mail-lf0-x241.google.com with SMTP id 65so1234155lfa.0;
	Thu, 03 Aug 2017 08:57:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=tobNEWmmw6fNjwPGxA/dh8zCge+Am/OxYR7Gzb2ReuE=;
	b=ETOGVuoaxi650+s6A2HJlxu4mG+vidak2uZwgzCBP2j7bI4PUtW7RWAgpv3SYleiUh
	kcwQbZeljKXVT++6+5A9vjmZY2xpyaHJt8WPA6P9otBOBndp8IcRUFYvwCBvvi/O8BCO
	5rrCpeV1ewjbn9VR4p7L/n4e8aEADGYZSlsV5zlTPZKcaZPBzAofec3TP7JTD+Ca7G+I
	DoWe4uc174gPfpGMaKGWF25/rMV0gjiBY0f5X1T2PoNaytxzgi+NQi36KiZrGQ01iNHc
	VvUt0Tn+RE8xrQSIbyDNVgeQYfLNTMpb09oAqNSeDDeMZZLu3pNjRK8bGTcWyKTzRvqC
	Cyow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=tobNEWmmw6fNjwPGxA/dh8zCge+Am/OxYR7Gzb2ReuE=;
	b=dkOOvYk88kQk3fhNpFytuwle3pC97Qj0AVquuKeaK2pqaCiwIzw4lP7MDcd15COB51
	lJnIHyq5omFsO/bucYGPP0NYYrROrnjxucW1f5owEmUUp8KVZiak0uX1l6ftVoj9sML5
	qliP/kBWSWDih/GMCgPPO0wvLqlsormmg+EUu9o0J8x9TXaISUodwbzL17Jfd/0+yOev
	+NtY/DZ0xlM88hszrv+17PxATZ1mdUUiCNGE729PQcFPcjjHOhqQrs3SLuhXO2RWFCpb
	vyWJAzACgKzOgPU4uqNOZXHadsKI0kEm9VrHFsgvPexZRsJX2aIbwQBI6YTvEHnELZXV
	u8Jg==
X-Gm-Message-State: AIVw110sg2kXUzG+96hcmRQIlxMB9xbWnoqCrs4HV+R8NKmNPpabILUZ
	4317lhW0kQ07+Q==
X-Received: by 10.46.8.74 with SMTP id g10mr917917ljd.194.1501775830118;
	Thu, 03 Aug 2017 08:57:10 -0700 (PDT)
Received: from gmail.com (81-231-233-234-no56.tbcn.telia.com. [81.231.233.234])
	by smtp.gmail.com with ESMTPSA id
	s186sm458201lja.17.2017.08.03.08.57.09
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 03 Aug 2017 08:57:09 -0700 (PDT)
Date: Thu, 3 Aug 2017 17:57:08 +0200
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20170803155708.GV4859@toto>
References: <1501692241-23310-1-git-send-email-peter.maydell@linaro.org>
	<1501692241-23310-15-git-send-email-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1501692241-23310-15-git-send-email-peter.maydell@linaro.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4010:c07::241
Subject: Re: [Qemu-arm] [PATCH 14/15] armv7m_nvic.h: Move from
 include/hw/arm to include/hw/intc
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 7jvL0oqTxI39

On Wed, Aug 02, 2017 at 05:44:00PM +0100, Peter Maydell wrote:
> The armv7m_nvic.h header file was accidentally placed in
> include/hw/arm; move it to include/hw/intc to match where
> its corresponding .c file lives.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>


> ---
>  hw/intc/armv7m_nvic.c                  | 2 +-
>  include/hw/arm/armv7m.h                | 2 +-
>  include/hw/{arm => intc}/armv7m_nvic.h | 0
>  3 files changed, 2 insertions(+), 2 deletions(-)
>  rename include/hw/{arm => intc}/armv7m_nvic.h (100%)
> 
> diff --git a/hw/intc/armv7m_nvic.c b/hw/intc/armv7m_nvic.c
> index 343bc16..5a18025 100644
> --- a/hw/intc/armv7m_nvic.c
> +++ b/hw/intc/armv7m_nvic.c
> @@ -17,7 +17,7 @@
>  #include "hw/sysbus.h"
>  #include "qemu/timer.h"
>  #include "hw/arm/arm.h"
> -#include "hw/arm/armv7m_nvic.h"
> +#include "hw/intc/armv7m_nvic.h"
>  #include "target/arm/cpu.h"
>  #include "exec/exec-all.h"
>  #include "qemu/log.h"
> diff --git a/include/hw/arm/armv7m.h b/include/hw/arm/armv7m.h
> index a9b3f2a..10eb058 100644
> --- a/include/hw/arm/armv7m.h
> +++ b/include/hw/arm/armv7m.h
> @@ -11,7 +11,7 @@
>  #define HW_ARM_ARMV7M_H
>  
>  #include "hw/sysbus.h"
> -#include "hw/arm/armv7m_nvic.h"
> +#include "hw/intc/armv7m_nvic.h"
>  
>  #define TYPE_BITBAND "ARM,bitband-memory"
>  #define BITBAND(obj) OBJECT_CHECK(BitBandState, (obj), TYPE_BITBAND)
> diff --git a/include/hw/arm/armv7m_nvic.h b/include/hw/intc/armv7m_nvic.h
> similarity index 100%
> rename from include/hw/arm/armv7m_nvic.h
> rename to include/hw/intc/armv7m_nvic.h
> -- 
> 2.7.4
> 
> 
