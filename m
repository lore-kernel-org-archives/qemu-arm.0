Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp3207290lfb;
        Mon, 18 May 2020 09:52:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxU7+O9GjZRHjs97H040nyD4VXde+XI/DOM50AIY6DkGgIMCsZg14B+pf5emK3C6TGqvZrm
X-Received: by 2002:ae9:ea0f:: with SMTP id f15mr17418598qkg.435.1589820738009;
        Mon, 18 May 2020 09:52:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1589820738; cv=none;
        d=google.com; s=arc-20160816;
        b=m/xqg9zEAn+KncGF/Uc+7apfwtilKbh+mfNc+N+sYE4mMRxyRSWHpeUkeK/0OYh+aL
         p7dXMOfH89+LOgF+6Q9TJ3EjI5OwKZHOCg49n4Nk5jnaplNn+SColUT5p7ROosvFyVni
         50VK9yVYLfdVYanfHFHf0KHVpiGzDeABkAYgZb1yQkwk9275llsSjpuj+qFhQ2JCxxLF
         LCJ4GW5+MYRF9eA4eVYPU6KKqCm8gMjpM/GCq3TiFnxhr9dMmwycSD2GR0sJWTblcmvZ
         gatW2SlH83yZwtzA5qjRBesLoZFw1G0c8lTMxXukxISRBOA/bv2eqJgsp1wWop1A050F
         uExQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=JLl6Oqn+XkPIiE3xybVEx94h32oZCJQ+9UbkT17BpeA=;
        b=wxQ4kCBiM3ot6cWqL6qgBxuoV7QAslQUzPfEXFgKWWRy5XgJ/myWARoWuKje+Tb/3l
         iukj58Ob5eu91VYBa6xR+A1ULlAQJ2cL8YnnK+7lohDvzsYP00g11gLIv1Waqd2QQbg7
         FcjQp/HPXywn0/cy5zSVIY03Y+4Fq71AZO89Xrjh5mNnJ6bsbXVH3wJFgiqoAiOdfmod
         Hth/L5AtUkiZceXsICAjFXLmbmj3r1s+PGNYEcn15lEBvIsU67srI1WiVYCqIXExRWU2
         Kc/a9rPIcxKYeXbmnGBGUm6xTXXrFyMZIcAhzhfEGqyLtpYO2S7BBy619wx372oioK17
         v23Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=b5XV+Qnj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n9si5829364qvx.50.2020.05.18.09.52.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 18 May 2020 09:52:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=b5XV+Qnj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:57596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jaizx-0002er-4X
	for alex.bennee@linaro.org; Mon, 18 May 2020 12:52:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33664)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1jaizc-0002bD-0C; Mon, 18 May 2020 12:51:56 -0400
Received: from mail-il1-x142.google.com ([2607:f8b0:4864:20::142]:41436)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1jaiza-000170-Up; Mon, 18 May 2020 12:51:55 -0400
Received: by mail-il1-x142.google.com with SMTP id b71so10498704ilg.8;
 Mon, 18 May 2020 09:51:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=JLl6Oqn+XkPIiE3xybVEx94h32oZCJQ+9UbkT17BpeA=;
 b=b5XV+QnjRfTHqw0pZPs3qZJfegfmLONpgr0x61Gp36IOOaJ7jZICv4W4a9k6luZebj
 PVstfIbyByrQoXdLx5I8khqNEUaWNWTWj+QeNq/gj5y6g2uXH5LqhiV60L1IurhfBPhL
 D45BsfKSHGBaBeK27yYZ3EFP90h9XqJSaxxFZYOh4uG1UNqCuqXrhToL2W6pofkQuAMG
 0JBFg4Ci/9qUIUE/eG9kvSUVWhPoTfz+kRzy46/Y6sQmAF5QLuzib1NrpfbEvYNmKmxQ
 Zq208dqaDgNhyySup74o/3bcRskazOjG3XWt479OTRUKiNF5KjfC1IN3LOPXWj9e70Dm
 poog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=JLl6Oqn+XkPIiE3xybVEx94h32oZCJQ+9UbkT17BpeA=;
 b=Ygd2TTiGMwRPyuFCnjw6hCG8PJjomS5qJy4pX3neNFbdxd2fTjC5Zyd8C76ASN+t1P
 Cj/PAh36jwLRrwLlTD6ba6qoX9U0Loxzbnp8W9lbKQBJH1jct2UTjtPSsM4HmfmbjRd5
 iun8+PeljVJPhN1BK2hxhr6b8gVrknRJxxq8njd5q15vF2tPJauVnJFo8llWa4hJAYbb
 UBZviYT8JTUg0mdWH+7JDJbP65EjZzvdk2XgNI60mt1mCBrJd/E8uFcyvMiUZm5OgS8n
 gCiNnVnIksdqAN+YjoML2Ey9nUry53pImxl7O0fch1sZn2haO0qD+geQZvoVjvYMtChU
 fr8A==
X-Gm-Message-State: AOAM533D3by0jHeXhQ+kStG0SS5QngJjqgDqq3A1RseGqK0xi3rj0GH4
 1y92oQS9xT66WbhZSC6MBNRf+8Tt8r29G5rreQc=
X-Received: by 2002:a92:de02:: with SMTP id x2mr17846069ilm.267.1589820713247; 
 Mon, 18 May 2020 09:51:53 -0700 (PDT)
MIME-Version: 1.0
References: <20200518140309.5220-1-f4bug@amsat.org>
 <20200518140309.5220-3-f4bug@amsat.org>
In-Reply-To: <20200518140309.5220-3-f4bug@amsat.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 18 May 2020 09:43:02 -0700
Message-ID: <CAKmqyKN4bSSdvAyoPjAYZoiMLuPT=SDrVkq5OSb3Pk4Q0Jhp4w@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] hw/arm/pxa2xx: Replace hw_error() by
 qemu_log_mask()
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::142;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x142.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: KC1MtiCx+D38

On Mon, May 18, 2020 at 7:03 AM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g> wrote:
>
> hw_error() calls exit(). This a bit overkill when we can log
> the accesses as unimplemented or guest error.
>
> When fuzzing the devices, we don't want the whole process to
> exit. Replace some hw_error() calls by qemu_log_mask().
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/arm/pxa2xx_gpio.c    |  7 ++++---
>  hw/display/pxa2xx_lcd.c |  8 +++++---
>  hw/dma/pxa2xx_dma.c     | 14 +++++++++-----
>  3 files changed, 18 insertions(+), 11 deletions(-)
>
> diff --git a/hw/arm/pxa2xx_gpio.c b/hw/arm/pxa2xx_gpio.c
> index f8df3cc227..a01db54a51 100644
> --- a/hw/arm/pxa2xx_gpio.c
> +++ b/hw/arm/pxa2xx_gpio.c
> @@ -9,7 +9,6 @@
>
>  #include "qemu/osdep.h"
>  #include "cpu.h"
> -#include "hw/hw.h"
>  #include "hw/irq.h"
>  #include "hw/qdev-properties.h"
>  #include "hw/sysbus.h"
> @@ -199,7 +198,8 @@ static uint64_t pxa2xx_gpio_read(void *opaque, hwaddr=
 offset,
>          return s->status[bank];
>
>      default:
> -        hw_error("%s: Bad offset " REG_FMT "\n", __func__, offset);
> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: Bad offset 0x%" HWADDR_PRIX =
"\n",
> +                      __func__, offset);
>      }
>
>      return 0;
> @@ -252,7 +252,8 @@ static void pxa2xx_gpio_write(void *opaque, hwaddr of=
fset,
>          break;
>
>      default:
> -        hw_error("%s: Bad offset " REG_FMT "\n", __func__, offset);
> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: Bad offset 0x%" HWADDR_PRIX =
"\n",
> +                      __func__, offset);
>      }
>  }
>
> diff --git a/hw/display/pxa2xx_lcd.c b/hw/display/pxa2xx_lcd.c
> index 464e93161a..d5f2e82a4e 100644
> --- a/hw/display/pxa2xx_lcd.c
> +++ b/hw/display/pxa2xx_lcd.c
> @@ -11,7 +11,7 @@
>   */
>
>  #include "qemu/osdep.h"
> -#include "hw/hw.h"
> +#include "qemu/log.h"
>  #include "hw/irq.h"
>  #include "migration/vmstate.h"
>  #include "ui/console.h"
> @@ -407,7 +407,8 @@ static uint64_t pxa2xx_lcdc_read(void *opaque, hwaddr=
 offset,
>
>      default:
>      fail:
> -        hw_error("%s: Bad offset " REG_FMT "\n", __func__, offset);
> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: Bad offset 0x%" HWADDR_PRIX =
"\n",
> +                      __func__, offset);
>      }
>
>      return 0;
> @@ -562,7 +563,8 @@ static void pxa2xx_lcdc_write(void *opaque, hwaddr of=
fset,
>
>      default:
>      fail:
> -        hw_error("%s: Bad offset " REG_FMT "\n", __func__, offset);
> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: Bad offset 0x%" HWADDR_PRIX =
"\n",
> +                      __func__, offset);
>      }
>  }
>
> diff --git a/hw/dma/pxa2xx_dma.c b/hw/dma/pxa2xx_dma.c
> index 88ed4b6ff1..8a2eeb32bc 100644
> --- a/hw/dma/pxa2xx_dma.c
> +++ b/hw/dma/pxa2xx_dma.c
> @@ -9,6 +9,7 @@
>   */
>
>  #include "qemu/osdep.h"
> +#include "qemu/log.h"
>  #include "hw/hw.h"
>  #include "hw/irq.h"
>  #include "hw/qdev-properties.h"
> @@ -268,7 +269,8 @@ static uint64_t pxa2xx_dma_read(void *opaque, hwaddr =
offset,
>      unsigned int channel;
>
>      if (size !=3D 4) {
> -        hw_error("%s: Bad access width\n", __func__);
> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: Bad access width %u\n",
> +                      __func__, size);
>          return 5;
>      }
>
> @@ -315,8 +317,8 @@ static uint64_t pxa2xx_dma_read(void *opaque, hwaddr =
offset,
>              return s->chan[channel].cmd;
>          }
>      }
> -
> -    hw_error("%s: Bad offset 0x" TARGET_FMT_plx "\n", __func__, offset);
> +    qemu_log_mask(LOG_GUEST_ERROR, "%s: Bad offset 0x%" HWADDR_PRIX "\n"=
,
> +                  __func__, offset);
>      return 7;
>  }
>
> @@ -327,7 +329,8 @@ static void pxa2xx_dma_write(void *opaque, hwaddr off=
set,
>      unsigned int channel;
>
>      if (size !=3D 4) {
> -        hw_error("%s: Bad access width\n", __func__);
> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: Bad access width %u\n",
> +                      __func__, size);
>          return;
>      }
>
> @@ -420,7 +423,8 @@ static void pxa2xx_dma_write(void *opaque, hwaddr off=
set,
>              break;
>          }
>      fail:
> -        hw_error("%s: Bad offset " TARGET_FMT_plx "\n", __func__, offset=
);
> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: Bad offset 0x%" HWADDR_PRIX =
"\n",
> +                      __func__, offset);
>      }
>  }
>
> --
> 2.21.3
>
>
