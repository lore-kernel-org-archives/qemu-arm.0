Received: by 2002:a19:4310:0:0:0:0:0 with SMTP id q16csp2218709lfa;
        Sat, 5 Jun 2021 12:13:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy2onOuE4Mi2PUk2oFw7gZ5UYM7Dsy+l9m+DRQqB3BFPJT2TMGFWX6KBZnanEXo2T6x8C7W
X-Received: by 2002:a05:6e02:1068:: with SMTP id q8mr3309735ilj.276.1622920382318;
        Sat, 05 Jun 2021 12:13:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1622920382; cv=none;
        d=google.com; s=arc-20160816;
        b=OMwQzOm9cnIx/5rqXjlTJT4iO2uViY+iRhzbBSNBHHKteiNcDq6jqmefpVKgXZ7n+K
         mqCO08eJoXeSm2wWB++NuhTzXnTfqC4yGTyNrOPla/P5Pka/L5YU8BaGEImT1Vs6clmp
         bJFY0rrePEJvjxZwuSXLh1bXCXtA+jJcp6499mgKwName+tdCFJntCJpcg0Yn3dvAU0j
         yRkRkT/QpT5UwQsR75ctH1EGRce1HHYol95X8lroTKY5ocwDb5L8jiTz0MdGsWlTsXOQ
         uYGmHqLmJfmDvaYxDMpnGy7IM1U+Vm51P9aBt6i73DDYSTrtTE9RPeZksdZfcA7F/Uwy
         c2yA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=4d9434nQUPRcxLmg05Td+lpTHGV7h9sNbbrOKMzZhEI=;
        b=Gx2dFAMuPPKVppQFGgG8+x4yrxqfAOtAy6CkJXxSSEPoK96DuXFWupchtwdopfzRdM
         VggZJCgQFs8yrIM+oXLM8t4Krta2BuD/t0pfV2WJm6r1fWFcGSPv3HdpduAufiebZi2/
         38CSNaWSrQ4/xI3fDBm5L//WUodlr5aQy2s2jfTb7lhXF9i/rznxbnnWM1sxqe404Ui7
         0LjHqu5atR1sSXVLSr5+0dDKZSZe8SyjcolrHw2iO1ShVva01g44aovt2cVnuYtYewaX
         V4rbcxE5Lwo3/WfcDOfQYE2/l6AUrBQ4Wk76Rgea1XNYYmWcRv24irilkF8mncy6ndwx
         j9pw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g10si11601331iow.86.2021.06.05.12.13.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 05 Jun 2021 12:13:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:41780 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lpbjB-0006jI-KR
	for alex.bennee@linaro.org; Sat, 05 Jun 2021 15:13:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43280)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lpbj1-0006iC-Js; Sat, 05 Jun 2021 15:12:51 -0400
Received: from mout.kundenserver.de ([212.227.17.24]:58291)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lpbiz-0006Jx-Ol; Sat, 05 Jun 2021 15:12:51 -0400
Received: from [192.168.100.1] ([82.142.12.38]) by mrelayeu.kundenserver.de
 (mreue108 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MxDck-1lRD9Q0q4G-00xbhr; Sat, 05 Jun 2021 21:12:44 +0200
Subject: Re: [PATCH] misc: Correct relative include path
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210516205034.694788-1-f4bug@amsat.org>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <5fbf8202-ecc3-43ef-4ad9-7fc15abdac82@vivier.eu>
Date: Sat, 5 Jun 2021 21:12:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210516205034.694788-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:L6nX/YxSopb7ZUN49nmRfwbeFsXKMCSnhm+opPXW1BkrgWKuiva
 syOW+TlvS86tVLlR8ER19llcsvpAZZ7mpBvUIBWsomUGtml1xd86aZtSFEAmg/96GVcNdAy
 3UgldQcpRL3jbCrjTA1E9VPkOG09WsiIudANEsFW0SDEm1VIoF8OFHNxr/MrDXAWEv9HZK0
 HqgyyB49U7Fx68Mmo3ukw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:PZDUueEhESE=:3S2VHZVqPAGmEQlJA5OApm
 eSyG8I9ViXhsw5OWN9ZZo/py0QkJW3GxqZHeqxc6SlBORajr8D4RVwiGUGLYM+1K+4JBzPzYu
 EgAbMpAnuNUhfFv+7rlAOdMcP8EfsnKOBA8BVqQeW09N/K+gv+TioFk7d03hesCgtJZVB9awY
 F3BAP2+vsIvngFfIhl1Oao5VZnntArRiR5FXi4oTOXz8xoHJ92meAwPur3EblH4+gC+s+L0+2
 mWr3BvhBt8sgxV3epKqDwCpK2x02we3TiQbhEP4IFxnXd7yh/ZfPeBw6Cx+kRRPk8CC8uG3y8
 3lUgFhgvOZrcGhOriZLQdBZxGW0mkB0hpRFLgFciwHJaqzdwLXOjva1xhzqvSp/Je1/8t7lSt
 woGFp1HhHaNM/CcO33VSRjZTCOhdSpl0w1gVo0JQYLQfsFcc2QJlY4up+hnzD8in6zbRlrx0Z
 jyhAhkjLWBnXIXccS4tX8LKlx8Ywt41grlwLNsTLE3awARjYHc2qX5tZsZLll0UC/MxJCAgZ3
 ViripPC8bEAXSYrsp8taaY=
Received-SPF: none client-ip=212.227.17.24; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.59,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: qemu-trivial@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: TrgYtu1wpyyv

Le 16/05/2021 à 22:50, Philippe Mathieu-Daudé a écrit :
> Headers should be included from the 'include/' directory,
> not from the root directory.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  hw/i386/acpi-common.h     | 6 +++---
>  include/monitor/monitor.h | 2 +-
>  hw/gpio/aspeed_gpio.c     | 2 +-
>  hw/intc/ppc-uic.c         | 2 +-
>  4 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/hw/i386/acpi-common.h b/hw/i386/acpi-common.h
> index b12cd73ea5d..a68825acf50 100644
> --- a/hw/i386/acpi-common.h
> +++ b/hw/i386/acpi-common.h
> @@ -1,9 +1,9 @@
>  #ifndef HW_I386_ACPI_COMMON_H
>  #define HW_I386_ACPI_COMMON_H
> -#include "include/hw/acpi/acpi_dev_interface.h"
>  
> -#include "include/hw/acpi/bios-linker-loader.h"
> -#include "include/hw/i386/x86.h"
> +#include "hw/acpi/acpi_dev_interface.h"
> +#include "hw/acpi/bios-linker-loader.h"
> +#include "hw/i386/x86.h"
>  
>  /* Default IOAPIC ID */
>  #define ACPI_BUILD_IOAPIC_ID 0x0
> diff --git a/include/monitor/monitor.h b/include/monitor/monitor.h
> index af3887bb71d..1211d6e6d69 100644
> --- a/include/monitor/monitor.h
> +++ b/include/monitor/monitor.h
> @@ -4,7 +4,7 @@
>  #include "block/block.h"
>  #include "qapi/qapi-types-misc.h"
>  #include "qemu/readline.h"
> -#include "include/exec/hwaddr.h"
> +#include "exec/hwaddr.h"
>  
>  typedef struct MonitorHMP MonitorHMP;
>  typedef struct MonitorOptions MonitorOptions;
> diff --git a/hw/gpio/aspeed_gpio.c b/hw/gpio/aspeed_gpio.c
> index 985a259e05b..db7ef88ee56 100644
> --- a/hw/gpio/aspeed_gpio.c
> +++ b/hw/gpio/aspeed_gpio.c
> @@ -10,7 +10,7 @@
>  #include "qemu/host-utils.h"
>  #include "qemu/log.h"
>  #include "hw/gpio/aspeed_gpio.h"
> -#include "include/hw/misc/aspeed_scu.h"
> +#include "hw/misc/aspeed_scu.h"
>  #include "qapi/error.h"
>  #include "qapi/visitor.h"
>  #include "hw/irq.h"
> diff --git a/hw/intc/ppc-uic.c b/hw/intc/ppc-uic.c
> index 7171de7b355..60013f2dde3 100644
> --- a/hw/intc/ppc-uic.c
> +++ b/hw/intc/ppc-uic.c
> @@ -23,7 +23,7 @@
>   */
>  
>  #include "qemu/osdep.h"
> -#include "include/hw/intc/ppc-uic.h"
> +#include "hw/intc/ppc-uic.h"
>  #include "hw/irq.h"
>  #include "cpu.h"
>  #include "hw/ppc/ppc.h"
> 

Applied to my trivial-patches branch.

Thanks,
Laurent
