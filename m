Received: by 2002:ac2:51c9:0:0:0:0:0 with SMTP id u9csp4244480lfm;
        Tue, 25 May 2021 00:49:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwbfiLo8xPKwBGkL7nMJZqz8CdYMYoJRFAOP2mpL3MrQH/VUqbAwF+hFn7/a6HE6xgcXOnj
X-Received: by 2002:a05:6638:270b:: with SMTP id m11mr28422450jav.59.1621928996611;
        Tue, 25 May 2021 00:49:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1621928996; cv=none;
        d=google.com; s=arc-20160816;
        b=Ue7zVI4yLldKPz4nGelLzBopsdT4a5gNP2nvehMkdIwzuqN5f0HsP2SHVGHhGFYshg
         RoZbMpW1+L369iumrFXiKY3KM0Hdcb/AyyUfkE22nd72YusPJIkJfuk9x5ogWkySbPbi
         /SIBOwOJCl2FGcs2yymy21+fuNG8rjx7kGWcSd20XX4U1nblfQmyFWV/hrXKY0mgfHm8
         17hfu/TTgGKW2mOIURt1Q7WHvBmLRBi/evO0oLrjAGkLgjTRvl10wV1ZZI+AwV+stW2C
         Shz1BdITU04+rgdQFpDnqhpYGjE47sGd+9Bzj6TOFwD+Oub/Dk0QVTp6Pq/Hnn5KOanF
         zBVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=UqgbO2Ym7wWWZi7Z9+p9ko/d0Pl+89qW9M2+6NAr1sg=;
        b=SLy/PqbaZBN7hppLnXw7LcrlLThaszCzd6i5ZRG69nPk4iqgTx1TX71jQqTQIGsfYm
         eGJiRTrraSwN5D/ai2q62aTMa0nyyywMW5gZ+P6UiDMTF1aTV1d3pmTfIs1U29uKkga0
         6iMc0Ic0JKAU5Xlg805IkjHGYlohiXjP2c0Wamcbe/xX5miacVeZJSw1hvGblw+ltuco
         9TFMeU+f7ulbX07EjMeRuFUAS5Ukkj8cMSY2cT4n1h7J5KRFiX2svY3WHM1UkUHJAgMV
         kTEQ0EuhJnQZCQPD0CpRkEce21iN6gEq+LThZDa/dG70mDbz/kBe0ujxp60P31koqhfF
         TxvA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=nwCaGhih;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l19si5942013ilk.115.2021.05.25.00.49.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 May 2021 00:49:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=nwCaGhih;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:48778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1llRp5-0006VE-U6
	for alex.bennee@linaro.org; Tue, 25 May 2021 03:49:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43108)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1llRoJ-0005qt-6v; Tue, 25 May 2021 03:49:07 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:52789)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1llRoH-0000dO-Lb; Tue, 25 May 2021 03:49:06 -0400
Received: by mail-wm1-x335.google.com with SMTP id z130so16169456wmg.2;
 Tue, 25 May 2021 00:49:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=UqgbO2Ym7wWWZi7Z9+p9ko/d0Pl+89qW9M2+6NAr1sg=;
 b=nwCaGhihB5kCgrebtqmaNM9JhEbCSF8KXOuEN3fkWammsYrCHnpxuVGcuzuQs8hsRu
 MNPxft/GmOfXACDGFOnIICBTulWJk9Vv6kZB6L55C+/3uzAtxbgWZdOw7+q8INUXI61l
 lmROqRpeGrTiYC2s1K1FZ8JFvp+hyP90imqk/kmoEB8Nlr2oskvQWBW3ASMIIGnhyMMu
 hv0MAwNv07agiRl9Qhdv93YN5zB7cwaRblBFQ/sbDagWhwVLo1Ru8QE00xDs2aDsxeia
 a6XDSd95EbpjG2Xs0D29djmgjhmHSdB7msuFKPnbh/lDYLEK20hY4+21OrWs3+uZVCBu
 d7KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=UqgbO2Ym7wWWZi7Z9+p9ko/d0Pl+89qW9M2+6NAr1sg=;
 b=JdV+EiU5g8I2lK1a6zQ2C+vJOUKD/Dwdv5XG3PaF8zwYhUsv56QB6fulKX57ViyKaV
 L1PTzkg/rzd9hU/UpDkN2IrT0bLUmZ5n66qliNppl9g8NHpLw4DXKYL4A0WswFShqgoZ
 U2duyBqyuH6ujkDR9INd5iwqrzeTzGuyHLhbmhcdh8PLvBTFzSarskP3cjXrs7DeMvEq
 s2z0WSJaF1OK1mQfm5KQiHtFYloVBSJaXuGgyb8avjPcjiwXFp+mAPUIZw+xo71phLF2
 giI2NEj5VEDODmtaz1nx0xdrswP7KR+c69gPDnMyMe8C9ygj+H3EgEYt++w4EBJvhhwM
 fgRg==
X-Gm-Message-State: AOAM533asB994y0iIfCrKMzFMk60KnNn4KT2DGWG5/hBRhPnmPhIqpIK
 mssuCi70PTx0HKoN82JquYYnM+jyc7WnDA==
X-Received: by 2002:a7b:c5cd:: with SMTP id n13mr22745792wmk.97.1621928943046; 
 Tue, 25 May 2021 00:49:03 -0700 (PDT)
Received: from [192.168.1.36] (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id s15sm18075824wrt.54.2021.05.25.00.49.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 May 2021 00:49:02 -0700 (PDT)
Subject: Re: [PATCH] misc: Correct relative include path
To: qemu-devel@nongnu.org
References: <20210516205034.694788-1-f4bug@amsat.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <92947a5a-9478-7939-e3aa-46b44d5ff785@amsat.org>
Date: Tue, 25 May 2021 09:49:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210516205034.694788-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x335.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-TUID: BwfXmGp+uhD1

ping? (patch reviewed)

On 5/16/21 10:50 PM, Philippe Mathieu-Daudé wrote:
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
