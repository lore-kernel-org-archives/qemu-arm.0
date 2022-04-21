Received: by 2002:a19:e348:0:0:0:0:0 with SMTP id c8csp321600lfk;
        Thu, 21 Apr 2022 05:38:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJziCBicwxji+NehmwTIt9XS07+B5PiTEe81lNgeoAHgH/wgX2Czi1ZH/Ij9ko15dzqZKIPf
X-Received: by 2002:ad4:5e85:0:b0:446:7682:6273 with SMTP id jl5-20020ad45e85000000b0044676826273mr9167232qvb.93.1650544726733;
        Thu, 21 Apr 2022 05:38:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1650544726; cv=none;
        d=google.com; s=arc-20160816;
        b=ax9OkalnxNlZrRzHFcoNSSgI00Q8tV/mmHIzZkgag0mAlCkaKMYXf//jfJjjVLDmBI
         GwaTjOjUgrh5t7LQ4sae0KbOtDidESu1WmAKve2WZq+CeZA9oHxg6gzOC/3JeQkn2dje
         E6F4e9pJ4yle3kEL2nY4vdms6/WcjNPB+3QvkbmHm+oZPSWB6IwtXZ1a3IjlLdiqH78b
         LwLUWC0jozH+U/dQJYfwU4PUUV1HUOqBh0VE2lbTU3vQOqPPrbjiV6SMbPoyMM0qw5kW
         U5ItRNIukI1pXGUAivBXyAFbTRvT7VA9Ia+D4rC/kUd36yl7jNKSLn/jnoe+5X1opwYl
         te6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=R4R9xgKDB1C79Pz4Ib34WgDrkwkN8gt9hjRTO/+QBD0=;
        b=UeUIG8CMA3yGEAzuM08DKTDHnQ1AaCUFnVjBamSwDuZirqzWneN2okO/EDCqE941B0
         iDJFfhMmFi8nSKPhGBRRM2H0HAvuDROhTXFFqw8nmFxJrt8i7Wl+t+d2wCSXU4eQi1+k
         aBghwLaneYsfD2veoIMap9ZfY52ecE3lUkUcfX00oBltZoum6nmvYYyw1tloFWZI8D41
         g86ZfJFIet/9sWdauJL6yw/JFOES/Zw86QIqzojhn0GeVA955nFaHagAcSZIolteGP6B
         n4ZhtIn7vpgF7MpM9CTBH19qcAXn5ruFXvKhhRwL+Sqf06j/Xwccc2aRF4FX7NTaX+l7
         P4UA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=hioPgRXX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e21-20020ac85995000000b002ed0e96a437si1481406qte.307.2022.04.21.05.38.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 21 Apr 2022 05:38:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=hioPgRXX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34930 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nhW58-0004ND-7e
	for alex.bennee@linaro.org; Thu, 21 Apr 2022 08:38:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47984)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhW4d-0004LH-8y
 for qemu-arm@nongnu.org; Thu, 21 Apr 2022 08:38:15 -0400
Received: from mail-yw1-x112a.google.com ([2607:f8b0:4864:20::112a]:38123)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhW4b-0000a8-7X
 for qemu-arm@nongnu.org; Thu, 21 Apr 2022 08:38:14 -0400
Received: by mail-yw1-x112a.google.com with SMTP id
 00721157ae682-2ec0bb4b715so50526817b3.5
 for <qemu-arm@nongnu.org>; Thu, 21 Apr 2022 05:38:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=R4R9xgKDB1C79Pz4Ib34WgDrkwkN8gt9hjRTO/+QBD0=;
 b=hioPgRXXRaUrhN2yvIEzDsQwS1t6n/uaINZ/ymk5Mlm9QVQQcdmNVIZpgCVDZb88VL
 Tw2TbEb6zweisbNWsXIvD7CZxZDK9PUbhuJs74KZdKtzB/Kby23WZxqT3YRxmwnPA9eU
 twq2e+jmmgpNaOYxUJZsZpMNNRYafLRDMuQJbtWiDcpe3x2YKcVQYXeO6kXKQdqUz+am
 mHThWCJ992wlWmvjv8j5c3R4guqG6TtRHpTeqL4RDkN6Lv53rbZTBcMmjN2G5p8TW+cz
 F3Zhf1qIrJhQg//g+BlRwmBGcZcEr4BvEOnguOi59Q5bqhKCiNblEU3Hx8Ce3yg+bqjs
 RXAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=R4R9xgKDB1C79Pz4Ib34WgDrkwkN8gt9hjRTO/+QBD0=;
 b=Xc9vS72BscNo80P8euhtllJbtW2IfOO+F8VR9Ussyz9WlMGdpzZPKokmrma8Dbdg3E
 bLxtnjuC3szHaGyflTr3GFRR06t+osP4nHHRln/thHddId58y6apI5C0hfOuLYDn14eO
 xyGoeaJmaMBEIaDfVd1Leu9KBHdPn6XKHRP0z07EXhBrtqqnrK3aELmJf2kD+9c+JZbt
 N8j7oUHRx4KQdpZT8e52TWOs+K6OxrkLoIvXDEVprF8PERInaIdTrNdGebFmMKjDF30E
 gj9Z9Ui74H1EU13Xx+ysItRzgstjbNMYEsBAVs5HT3DD2jqkVb4fYarIKV8otOE1AVcA
 S1UA==
X-Gm-Message-State: AOAM532FwK83K9tL4KoNIY35SoyO7XWsqn6rdCWys7FjtA+YGnziRr+J
 05bWICxNWTO1rs5cl/Mj/5SMY/YQU7TRVp9p0nzNiw==
X-Received: by 2002:a81:4e11:0:b0:2f1:47a0:5972 with SMTP id
 c17-20020a814e11000000b002f147a05972mr26889599ywb.469.1650544692177; Thu, 21
 Apr 2022 05:38:12 -0700 (PDT)
MIME-Version: 1.0
References: <20220410191238.760733-1-clabbe@baylibre.com>
In-Reply-To: <20220410191238.760733-1-clabbe@baylibre.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 21 Apr 2022 13:38:00 +0100
Message-ID: <CAFEAcA9L89oN5nfM4RRxyYPBMtwbH1VfO1FbnXFUyC+rmzk51A@mail.gmail.com>
Subject: Re: [PATCH] hw/crypto: add Allwinner sun4i-ss crypto device
To: Corentin Labbe <clabbe@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112a;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: b.galvani@gmail.com, qemu-arm@nongnu.org,
 "Daniel P. Berrange" <berrange@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: qbQOehbMQ0pH

On Sun, 10 Apr 2022 at 20:12, Corentin Labbe <clabbe@baylibre.com> wrote:
>
> From: Corentin LABBE <clabbe@baylibre.com>
>
> The Allwinner A10 has a cryptographic offloader device which
> could be easily emulated.
> The emulated device is tested with Linux only as any of BSD does not
> support it.
>
> Signed-off-by: Corentin LABBE <clabbe@baylibre.com>

Hi; thanks for this patch, and sorry it's taken me a while to get
to reviewing it.

(Daniel, I cc'd you since this device model is making use of crypto
related APIs.)

Firstly, a note on patch structure. This is quite a large patch,
and I think it would be useful to split it at least into two parts:
 (1) add the new device model
 (2) change the allwinner SoC to create that new device

> diff --git a/docs/system/arm/cubieboard.rst b/docs/system/arm/cubieboard.rst
> index 344ff8cef9..7836643ba4 100644
> --- a/docs/system/arm/cubieboard.rst
> +++ b/docs/system/arm/cubieboard.rst
> @@ -14,3 +14,4 @@ Emulated devices:
>  - SDHCI
>  - USB controller
>  - SATA controller
> +- crypto
> diff --git a/docs/system/devices/allwinner-sun4i-ss.rst b/docs/system/devices/allwinner-sun4i-ss.rst
> new file mode 100644
> index 0000000000..6e7d2142b5
> --- /dev/null
> +++ b/docs/system/devices/allwinner-sun4i-ss.rst
> @@ -0,0 +1,31 @@
> +Allwinner sun4i-ss
> +==================

If you create a new rst file in docs, you need to put it into the
manual by adding it to some table of contents. Otherwise sphinx
will complain when you build the documentation, and users won't be
able to find it. (If you pass 'configure' the --enable-docs option
that will check that you have everything installed to be able to
build the docs.)

There are two options here: you can have this document, and
add it to the toctree in docs/system/device-emulation.rst, and
make the "crypto" bullet point in cubieboard.rst be a hyperlink to
the device-emulation.rst file. Or you can compress the information
down and put it into orangepi.rst.

> +The ``sun4i-ss`` emulates the Allwinner cryptographic offloader
> +present on early Allwinner SoCs (A10, A10s, A13, A20, A33)
> +In qemu only A10 via the cubieboard machine is supported.
> +
> +The emulated hardware is capable of handling the following algorithms:
> +- SHA1 and MD5 hash algorithms
> +- AES/DES/DES3 in CBC/ECB
> +- PRNG
> +
> +The emulated hardware does not handle yet:
> +- CTS for AES
> +- CTR for AES/DES/DES3
> +- IRQ and DMA mode
> +Anyway the Linux driver also does not handle them yet.
> +
> +The emulation needs a real crypto backend, for the moment only gnutls/nettle is supported.
> +So the device emulation needs qemu to be compiled with optionnal gnutls.

> diff --git a/hw/Kconfig b/hw/Kconfig
> index ad20cce0a9..43bd7fc14d 100644
> --- a/hw/Kconfig
> +++ b/hw/Kconfig
> @@ -6,6 +6,7 @@ source audio/Kconfig
>  source block/Kconfig
>  source char/Kconfig
>  source core/Kconfig
> +source crypto/Kconfig
>  source display/Kconfig
>  source dma/Kconfig
>  source gpio/Kconfig

I don't think we really need a new subdirectory of hw/
for a single device. If you can find two other devices that
already exist in QEMU that would also belong in hw/crypto/
then we can create it. Otherwise just put this device in
hw/misc.

> diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
> index 97f3b38019..fd8232b1d4 100644
> --- a/hw/arm/Kconfig
> +++ b/hw/arm/Kconfig
> @@ -317,6 +317,7 @@ config ALLWINNER_A10
>      select AHCI
>      select ALLWINNER_A10_PIT
>      select ALLWINNER_A10_PIC
> +    select ALLWINNER_CRYPTO_SUN4I_SS
>      select ALLWINNER_EMAC
>      select SERIAL
>      select UNIMP
> diff --git a/hw/arm/allwinner-a10.c b/hw/arm/allwinner-a10.c
> index 05e84728cb..e9104ee028 100644
> --- a/hw/arm/allwinner-a10.c
> +++ b/hw/arm/allwinner-a10.c
> @@ -23,6 +23,7 @@
>  #include "hw/misc/unimp.h"
>  #include "sysemu/sysemu.h"
>  #include "hw/boards.h"
> +#include "hw/crypto/allwinner-sun4i-ss.h"
>  #include "hw/usb/hcd-ohci.h"
>
>  #define AW_A10_MMC0_BASE        0x01c0f000
> @@ -32,6 +33,7 @@
>  #define AW_A10_EMAC_BASE        0x01c0b000
>  #define AW_A10_EHCI_BASE        0x01c14000
>  #define AW_A10_OHCI_BASE        0x01c14400
> +#define AW_A10_CRYPTO_BASE      0x01c15000
>  #define AW_A10_SATA_BASE        0x01c18000
>  #define AW_A10_RTC_BASE         0x01c20d00
>
> @@ -48,6 +50,10 @@ static void aw_a10_init(Object *obj)
>
>      object_initialize_child(obj, "emac", &s->emac, TYPE_AW_EMAC);
>
> +#if defined CONFIG_NETTLE
> +    object_initialize_child(obj, "crypto", &s->crypto, TYPE_AW_SUN4I_SS);
> +#endif

Don't put this kind of ifdef into device/SoC code, please.
The device emulation needs to work regardless of what
the specific crypto backends that got compiled into QEMU are.

> +#include <nettle/aes.h>
> +#include <nettle/cbc.h>
> +#include <nettle/des.h>
> +#include <nettle/md5.h>
> +#include <nettle/sha1.h>

Similarly, don't directly include nettle headers. The device needs
to use the backend-agnostic headers from include/crypto. To the
extent that they aren't sufficient to implement this device we
can look at enhancing them.

> +static const VMStateDescription vmstate_allwinner_sun4i_ss = {
> +    .name = "allwinner-sun4i-ss",
> +    .version_id = 1,
> +    .minimum_version_id = 1,
> +    .fields = (VMStateField[]) {
> +        VMSTATE_UINT32(ctl, AwSun4iSSState),
> +        VMSTATE_UINT32(fcsr, AwSun4iSSState),
> +        VMSTATE_UINT32_ARRAY(iv, AwSun4iSSState, 5),
> +        VMSTATE_UINT32_ARRAY(key, AwSun4iSSState, 8),
> +        VMSTATE_UINT32_ARRAY(md, AwSun4iSSState, 5),

Shouldn't this also include rx, rxc, tx, txc ? Or do they
never contain live data at the point where we're migrating?

> +        VMSTATE_END_OF_LIST()
> +    }
> +};


> +/**
> + * Object model
> + * @{
> + */

We don't use these @{ ... @} markers in our doc comments,
so you can delete all of those.

I haven't looked at the rest of the code in detail, but I
skimmed over it and didn't see anything that looked wrong.

thanks
-- PMM
