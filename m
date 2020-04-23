Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp1671819lfm;
        Thu, 23 Apr 2020 02:22:30 -0700 (PDT)
X-Google-Smtp-Source: APiQypJvgBeTOe+tNEX+y/5oyJIRTp5eznwmluUqXUYW4N9QR+YxecDBvMK60osgIu+HcY8YnSA4
X-Received: by 2002:aed:2bc1:: with SMTP id e59mr2891497qtd.313.1587633750250;
        Thu, 23 Apr 2020 02:22:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1587633750; cv=none;
        d=google.com; s=arc-20160816;
        b=AHeFv5fjHMb2z0IU49CG0cBeahubnKnTrFLmMRid4kt4VyJciDGfaSFeJjPY1ayBm0
         UKkQsrqaQ4imAc7lM2wRdqcIf8UI5kPioDcSb12Pqu/ZV6l9ssOUZqJkYGTuIxD84qdx
         2zpTuGXg0kCb3h10ff7EeP00S7jCVRlOhp1bRBM5CRQ7jUr9rvJMtGEmVIBKeG3qnmT3
         YgIobG9E/4/SiB/SsE3FjO+xaI/BkfSI1xHS6aMYc6R8VBy1nC7rb4J1wt/rdU4xuOmu
         uYUSoNaiWNf7vfroNVnxzBPTE9hdKFMN2vZdGMoohqbSfS66w10uNQdi9V7QkxQJPrNz
         Ua2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:autocrypt:from:references:to:subject:dkim-signature;
        bh=btabh5/U5IS4DvSrJ46McLe8iYZOnzD/LBG7g1Agp4o=;
        b=K4cdQoL0Zkkgc+ZiOoX9ex7bU/QAfoppgB7wRfbbYXrCcb64fi18ZL6tnW3FoNwAGr
         8hcGO23KuPcKfHBJL4f6rahPNi/fiMlZgGrFne5vR4rVA8LzDx37td4xgoDx9AeWVxt8
         TIPuhs9LyT90OUmdKg/AgRjp+vuSy6n2vRowRRMKBa/Famv0mbvajz/UjIYWwe35VWNF
         Sk15a3pev14gO4jxnkHbw0uEebd7pRiKl1qrTiSuVWgbnoadbKpBh10llZ3GUzI4fuN/
         O0VqYz4airCXpJVCRgNZIeM3Csnea1jLPa/R5SHGnzJQu3vgTcKAiSJ/HHdPBytDR0Yg
         8AsA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=JBc99Oy6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b2si972164qke.119.2020.04.23.02.22.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 23 Apr 2020 02:22:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=JBc99Oy6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:39592 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jRY3x-0007IX-LG
	for alex.bennee@linaro.org; Thu, 23 Apr 2020 05:22:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42210)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jRY3m-0007FB-AF
 for qemu-arm@nongnu.org; Thu, 23 Apr 2020 05:22:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jRY3l-00019t-Up
 for qemu-arm@nongnu.org; Thu, 23 Apr 2020 05:22:18 -0400
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:35221)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jRY3i-00019F-Va; Thu, 23 Apr 2020 05:22:15 -0400
Received: by mail-wm1-x343.google.com with SMTP id r26so5771251wmh.0;
 Thu, 23 Apr 2020 02:22:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:autocrypt:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=btabh5/U5IS4DvSrJ46McLe8iYZOnzD/LBG7g1Agp4o=;
 b=JBc99Oy6ycZr8AgmbN3PuDPMJt7RNI4PIxAMIfLKsk8ZBmEJs/cbOWPtLTd9WE2DkC
 rlWyQ9XwsMf5E3b/Zm+qrwqlHT2PL0F6/i2H3lIjtWZZYe4DN+0uT6H9KwXnW35XDDiV
 ROB3pzQWOAcYO38jZwCAldA5qlyg+QL0N5NZUVz36dejzpN2jItHfcSoPJFPoWHRUxJ3
 lahKj/chvBK3WhlwjeCtVrHU2dnp2GzW7rqM6wZMoisKPhdi7DicLeo2M80rIQDN0DRs
 mMoEjAnJYlHn+nqm2y5JnB1/GW0yOkcn27uJgCXhogCrSreqgOayXVprRRs3YuYOyKlR
 XOtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=btabh5/U5IS4DvSrJ46McLe8iYZOnzD/LBG7g1Agp4o=;
 b=edkZ34f+UcCcZtUuvOq7If/c5CH8bHTgKR10JhNCnAjtkCnKP9psEsbXpEafWCMxsH
 riRjANCXYOb85IUIrtCG6Y/N46m1+gxIwRboiEruXeTuqmzUac2y8ohjq59JVrd6v5Nd
 Smt7cE8tf/BAhLknUbglZvyoQMWaE/fxni2dFViCK2op/Mk2bXFbT1Jp/L7HoqHkdsnG
 sso7OD7nvB0GJ7TCErnLNPZbsUZMr/VARPevqQjL2dVjNz+dnClVBsaze5tuxnCU8Qf0
 uo80XMZ+AxkkVBjVcZKBp0bS/Z4FiQ/z5OZw0/hnSkc3WKsZmBmlCdrldANXvDdo80g8
 sQPQ==
X-Gm-Message-State: AGi0PuZT72jUtQSdM3Y6U59gjOepdKkQGzLIvzibS8R6wx4BzbmEV4xo
 O7qJa/b6spIE9jJbqGgMgc2lmthX
X-Received: by 2002:a1c:e444:: with SMTP id b65mr3253089wmh.6.1587633732107;
 Thu, 23 Apr 2020 02:22:12 -0700 (PDT)
Received: from [192.168.1.39] (116.red-83-42-57.dynamicip.rima-tde.net.
 [83.42.57.116])
 by smtp.gmail.com with ESMTPSA id s8sm2796135wru.38.2020.04.23.02.22.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Apr 2020 02:22:11 -0700 (PDT)
Subject: Re: [PATCH QEMU v2 1/5] ARM: PL061: Move TYPE_PL061 to hw/gpio/pl061.h
To: Geert Uytterhoeven <geert+renesas@glider.be>,
 Peter Maydell <peter.maydell@linaro.org>, Paolo Bonzini
 <pbonzini@redhat.com>, Alexander Graf <graf@amazon.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <bartekgola@gmail.com>,
 Magnus Damm <magnus.damm@gmail.com>
References: <20200423090118.11199-1-geert+renesas@glider.be>
 <20200423090118.11199-2-geert+renesas@glider.be>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Autocrypt: addr=f4bug@amsat.org; keydata=
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
 YXRoaWV1LURhdWTDqSAoRjRCVUcpIDxmNGJ1Z0BhbXNhdC5vcmc+iQJVBBMBCAA/AhsPBgsJ
 CAcDAgYVCAIJCgsEFgIDAQIeAQIXgBYhBPqr514SkXIh3P1rsuPjLCzercDeBQJd660aBQks
 klzgAAoJEOPjLCzercDe2iMP+gMG2dUf+qHz2uG8nTBGMjgK0aEJrKVPodFA+iedQ5Kp3BMo
 jrTg3/DG1HMYdcvQu/NFLYwamUfUasyor1k+3dB23hY09O4xOsYJBWdilkBGsJTKErUmkUO2
 3J/kawosvYtJJSHUpw3N6mwz/iWnjkT8BPp7fFXSujV63aZWZINueTbK7Y8skFHI0zpype9s
 loU8xc4JBrieGccy3n4E/kogGrTG5jcMTNHZ106DsQkhFnjhWETp6g9xOKrzZQbETeRBOe4P
 sRsY9YSG2Sj+ZqmZePvO8LyzGRjYU7T6Z80S1xV0lH6KTMvq7vvz5rd92f3pL4YrXq+e//HZ
 JsiLen8LH/FRhTsWRgBtNYkOsd5F9NvfJtSM0qbX32cSXMAStDVnS4U+H2vCVCWnfNug2TdY
 7v4NtdpaCi4CBBa3ZtqYVOU05IoLnlx0miKTBMqmI05kpgX98pi2QUPJBYi/+yNu3fjjcuS9
 K5WmpNFTNi6yiBbNjJA5E2qUKbIT/RwQFQvhrxBUcRCuK4x/5uOZrysjFvhtR8YGm08h+8vS
 n0JCnJD5aBhiVdkohEFAz7e5YNrAg6kOA5IVRHB44lTBOatLqz7ntwdGD0rteKuHaUuXpTYy
 CRqCVAKqFJtxhvJvaX0vLS1Z2dwtDwhjfIdgPiKEGOgCNGH7R8l+aaM4OPOd
Message-ID: <f976df56-7426-0cc3-c421-67c2a5b523a2@amsat.org>
Date: Thu, 23 Apr 2020 11:22:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200423090118.11199-2-geert+renesas@glider.be>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::343;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x343.google.com
X-detected-operating-system: by eggs.gnu.org: Error: [-] PROGRAM ABORT :
 Malformed IPv6 address (bad octet value).
 Location : parse_addr6(), p0f-client.c:67
X-Received-From: 2a00:1450:4864:20::343
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
Cc: linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 95apOzdk7HDX

On 4/23/20 11:01 AM, Geert Uytterhoeven wrote:
> Move the definition of TYPE_PL061 to a new header file, so it can be
> used outside the driver.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> v2:
>   - New.
> ---
>  MAINTAINERS             |  1 +
>  hw/gpio/pl061.c         |  2 +-
>  include/hw/gpio/pl061.h | 16 ++++++++++++++++
>  3 files changed, 18 insertions(+), 1 deletion(-)
>  create mode 100644 include/hw/gpio/pl061.h
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 8cbc1fac2bfcec86..e760f65270d29d5d 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -538,6 +538,7 @@ F: hw/dma/pl080.c
>  F: include/hw/dma/pl080.h
>  F: hw/dma/pl330.c
>  F: hw/gpio/pl061.c
> +F: include/hw/gpio/pl061.h
>  F: hw/input/pl050.c
>  F: hw/intc/pl190.c
>  F: hw/sd/pl181.c
> diff --git a/hw/gpio/pl061.c b/hw/gpio/pl061.c
> index 2a828260bdb0b946..e776c09e474216ef 100644
> --- a/hw/gpio/pl061.c
> +++ b/hw/gpio/pl061.c
> @@ -9,6 +9,7 @@
>   */
>  
>  #include "qemu/osdep.h"
> +#include "hw/gpio/pl061.h"
>  #include "hw/irq.h"
>  #include "hw/sysbus.h"
>  #include "migration/vmstate.h"
> @@ -33,7 +34,6 @@ static const uint8_t pl061_id[12] =
>  static const uint8_t pl061_id_luminary[12] =
>    { 0x00, 0x00, 0x00, 0x00, 0x61, 0x00, 0x18, 0x01, 0x0d, 0xf0, 0x05, 0xb1 };
>  
> -#define TYPE_PL061 "pl061"
>  #define PL061(obj) OBJECT_CHECK(PL061State, (obj), TYPE_PL061)
>  
>  typedef struct PL061State {
> diff --git a/include/hw/gpio/pl061.h b/include/hw/gpio/pl061.h
> new file mode 100644
> index 0000000000000000..78cc40c52679dc4e
> --- /dev/null
> +++ b/include/hw/gpio/pl061.h
> @@ -0,0 +1,16 @@
> +/*
> + * Arm PrimeCell PL061 General Purpose IO with additional Luminary Micro
> + * Stellaris bits.
> + *
> + * Copyright (c) 2007 CodeSourcery.
> + * Written by Paul Brook
> + *
> + * This code is licensed under the GPL.
> + */
> +
> +#ifndef PL061_GPIO_H
> +#define PL061_GPIO_H
> +
> +#define TYPE_PL061 "pl061"
> +
> +#endif /* PL061_GPIO_H */
> 

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
