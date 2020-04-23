Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp1680907lfm;
        Thu, 23 Apr 2020 02:33:37 -0700 (PDT)
X-Google-Smtp-Source: APiQypKjHmJPrlUjmNaExRAiIgxTk58gR55MpJjJCPXVXxXxxb4wrsItF4t52/W2gRVqb09obg4V
X-Received: by 2002:a37:78c1:: with SMTP id t184mr2496197qkc.213.1587634417624;
        Thu, 23 Apr 2020 02:33:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1587634417; cv=none;
        d=google.com; s=arc-20160816;
        b=w0TAJf3n6oCyETAuMvLeJ4f86qmhbbcn2sHOyC8c2ZCdszP+FkQIiTmvwsdS2arkpg
         uqjqSwKkZ9gsWsuAr/roUGqIVDYp/GCym9DWjT0E9k83T1F/aIZNvtJY6AhafGQIo1cb
         zKlMetmu+Kbi46YPoCFDnqL0nTDrEuhG4TM0eWmnaSnhn/hXPJ1tYBWRxIoR533CUka8
         bd2b50b5YNcb72o/WC8Guhtlb1KhodSRR9b5mGagK9kkOyZSmdbY1yrvEid1Pquj7GSO
         kggAwyTq8l1alzjlMKPf5rgx95ZYu5GFk/1I9MimpHlx4g/pMPmKqGjTUkmGiq6bGBc6
         vKVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:autocrypt:from:references:to:subject:dkim-signature;
        bh=ie8fd80pKQOw/4law6NwTSp7VLmg/W54peLA+cXfPAU=;
        b=0zC276n8VWt9kMro+Be+6nWbROp5+mZBXrD/UgkU79kQ89r4AawqoCamaRu0G+n4WR
         1hVmUx5jtUIZc+Im/+eOGLCSMlqXXG1z/uHUb7ubE5Lxopn/toyOMvhfWYtxIaejbzaJ
         H7QAKSDwaDbPIfGQ4TOZnr8mfeeaA315M0c3pdckgUlaj0Zcof3FMB32I/rSuvzEpu3G
         lCrmUqp4QbTsvatUTV64J7hEwXuxnTDgCloDN0CE7U/OcmAyRwgVA3lSWvMjHFyj6qbp
         M0Aau2RDgRugvBPqTfU+REc6Sr7x2fb31ieV4SPEoe75Tj9VW8wzXqchL2UJLpdSdhWt
         VF3w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=U9L8z5Ys;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o4si1009336qtt.59.2020.04.23.02.33.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 23 Apr 2020 02:33:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=U9L8z5Ys;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:39716 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jRYEi-0004oR-16
	for alex.bennee@linaro.org; Thu, 23 Apr 2020 05:33:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46148)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jRYES-0004kj-KG
 for qemu-arm@nongnu.org; Thu, 23 Apr 2020 05:33:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jRYER-0002Ue-6H
 for qemu-arm@nongnu.org; Thu, 23 Apr 2020 05:33:19 -0400
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:34084)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jRYEM-0002Rk-Uu; Thu, 23 Apr 2020 05:33:15 -0400
Received: by mail-wm1-x343.google.com with SMTP id v4so6980157wme.1;
 Thu, 23 Apr 2020 02:33:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:autocrypt:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ie8fd80pKQOw/4law6NwTSp7VLmg/W54peLA+cXfPAU=;
 b=U9L8z5YsVN10xsWQsxpWiPLnYbY4YpZLAcOeu2Vf6klussm+SSqTJ/dRhRuqObBmqa
 dzMrmnQIo2bBvYe4rIuHWMCZO/EmjDUXngmmFXgfWO8ZPP7aLdSm8lWGGC/lrb5rVp5T
 HxPqDjVlzspM5759e6HC2csaoGdLC6Ng657/FQG5nBDmwjQ5EWZfqJmjej0yBix2pgFw
 PlLO0/sAJVrGP6DSawa6PLBAyR3+bey6sAaFRVQ9MHEJ+7qsTrIcbOy9aFJlvhQXm5u5
 i2eTa73gCOqe8xY6LaDx47HcIKhRNF6wBPuke9fHiX9Z29p0FX2Q2gUBd4iyTWknpcrY
 vFuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=ie8fd80pKQOw/4law6NwTSp7VLmg/W54peLA+cXfPAU=;
 b=s+jn0B0ZMk3vF7JpPpx3nVdoT+aUAkSUZQ3/eqGQQNx3ej0Lme2VCcSb77XHedyPna
 h9+dtK1nHMS1xmPJV35kxA3eU5EEI6l9q5I+Fq0GlPp2ojHV7ynBcL+/1SzxjJlzyZ/B
 FisY6bZ2iYBqK4vMGBwE5VNVVnvOLAEx83nXWFHxgOSoTR3BL++vdmZl0PwpU+7vnqA3
 85nrBEvSgv0sRrojbaV8QaiBWZWfOeuRzUokOo7uApYIzlnaxpEPee02qaRCF9dnQ1kf
 xooya86smCGY7JQh8IwBuVN7aTfV1iSOG4eXDo5UpJnw9eUtj89AXi9L1Aif+M+GQcQH
 Y/rA==
X-Gm-Message-State: AGi0PuZ5WEDFgx35y4OeQI538zv+IdLVEYwjGzIPyBPSpyzkxopVx/g7
 t6klSv84lF/WJJzwEyQ/T13L1cil
X-Received: by 2002:a7b:c931:: with SMTP id h17mr3317560wml.105.1587634392908; 
 Thu, 23 Apr 2020 02:33:12 -0700 (PDT)
Received: from [192.168.1.39] (116.red-83-42-57.dynamicip.rima-tde.net.
 [83.42.57.116])
 by smtp.gmail.com with ESMTPSA id m15sm2748741wmc.35.2020.04.23.02.33.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Apr 2020 02:33:12 -0700 (PDT)
Subject: Re: [PATCH QEMU v2 4/5] ARM: PL061: Add gpiodev support
To: Geert Uytterhoeven <geert+renesas@glider.be>,
 Peter Maydell <peter.maydell@linaro.org>, Paolo Bonzini
 <pbonzini@redhat.com>, Alexander Graf <graf@amazon.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <bartekgola@gmail.com>,
 Magnus Damm <magnus.damm@gmail.com>
References: <20200423090118.11199-1-geert+renesas@glider.be>
 <20200423090118.11199-5-geert+renesas@glider.be>
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
Message-ID: <520d1d07-7530-e133-af6e-a8b4615829b8@amsat.org>
Date: Thu, 23 Apr 2020 11:33:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200423090118.11199-5-geert+renesas@glider.be>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
X-TUID: SMhRG3FC5abM

On 4/23/20 11:01 AM, Geert Uytterhoeven wrote:
> Make the PL061 GPIO controller user-creatable, and allow the user to tie
> a newly created instance to a gpiochip on the host.
> 
> To create a new GPIO controller, the QEMU command line must be augmented
> with:
> 
>     -device pl061,host=<gpiochip>
> 
> with <gpiochip> the name or label of the gpiochip on the host.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> v2:
>   - New.
> ---
>  hw/gpio/pl061.c | 35 +++++++++++++++++++++++++++++++++++
>  qemu-options.hx |  9 +++++++++
>  2 files changed, 44 insertions(+)
> 
> diff --git a/hw/gpio/pl061.c b/hw/gpio/pl061.c
> index 74ba733a8a5e8ca5..98204f9a586ae8c8 100644
> --- a/hw/gpio/pl061.c
> +++ b/hw/gpio/pl061.c
> @@ -12,11 +12,14 @@
>  #include "hw/arm/fdt.h"
>  #include "hw/gpio/pl061.h"
>  #include "hw/irq.h"
> +#include "hw/qdev-properties.h"
>  #include "hw/sysbus.h"
>  #include "migration/vmstate.h"
> +#include "qapi/error.h"
>  #include "qemu/log.h"
>  #include "qemu/module.h"
>  #include "sysemu/device_tree.h"
> +#include "sysemu/gpiodev.h"
>  
>  //#define DEBUG_PL061 1
>  
> @@ -41,6 +44,9 @@ static const uint8_t pl061_id_luminary[12] =
>  typedef struct PL061State {
>      SysBusDevice parent_obj;
>  
> +#ifdef CONFIG_GPIODEV
> +    char *host;
> +#endif
>      MemoryRegion iomem;
>      uint32_t locked;
>      uint32_t data;
> @@ -370,10 +376,39 @@ static void pl061_init(Object *obj)
>      qdev_init_gpio_out(dev, s->out, 8);

Not related to this patch, but we should replace this 8 magic value by a
proper definition...

>  }
>  
> +#ifdef CONFIG_GPIODEV
> +static Property pl061_properties[] = {
> +    DEFINE_PROP_STRING("host", PL061State, host),
> +    DEFINE_PROP_END_OF_LIST(),
> +};
> +
> +static void pl061_realize(DeviceState *dev, Error **errp)
> +{
> +    PL061State *s = PL061(dev);
> +
> +    if (!dev->opts) {
> +        /* Not created by user */
> +        return;
> +    }
> +
> +    if (!s->host) {
> +        error_setg(errp, "'host' property is required");
> +        return;
> +    }
> +
> +    qemu_gpiodev_add(dev, s->host, 8, errp);
> +}
> +#endif /* CONFIG_GPIODEV */
> +
>  static void pl061_class_init(ObjectClass *klass, void *data)
>  {
>      DeviceClass *dc = DEVICE_CLASS(klass);
>  
> +#ifdef CONFIG_GPIODEV
> +    device_class_set_props(dc, pl061_properties);
> +    dc->realize = pl061_realize;
> +    dc->user_creatable = true;
> +#endif
>      dc->vmsd = &vmstate_pl061;
>      dc->reset = &pl061_reset;
>  }
> diff --git a/qemu-options.hx b/qemu-options.hx
> index 292d4e7c0cef6097..182de7fb63923b38 100644
> --- a/qemu-options.hx
> +++ b/qemu-options.hx
> @@ -875,6 +875,15 @@ SRST
>  ``-device isa-ipmi-bt,bmc=id[,ioport=val][,irq=val]``
>      Like the KCS interface, but defines a BT interface. The default port
>      is 0xe4 and the default interrupt is 5.
> +
> +#ifdef CONFIG_GPIODEV
> +``-device pl061,host=gpiochip``
> +    Add a PL061 GPIO controller, and map its virtual GPIO lines to a GPIO
> +    controller on the host.
> +
> +    ``host=gpiochip``
> +        The name or label of the GPIO controller on the host.
> +#endif
>  ERST
>  
>  DEF("name", HAS_ARG, QEMU_OPTION_name,
> 

Instead of restricting this to the pl061, it would be cleaner you add a
GPIO_PLUGGABLE_INTERFACE (or GPIO_BINDABLE_INTERFACE or better name),
and have TYPE_PL061 implement it.
