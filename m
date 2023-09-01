Received: by 2002:a17:907:76b5:b0:9a1:fa4e:495e with SMTP id jw21csp389488ejc;
        Thu, 31 Aug 2023 22:20:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEjlC1e8vuvC/BvfIELqbQaTXUtf5onr6Hc8LPpf5NnOgRILxrQ/NutREoQPAKARnyTxEJ+
X-Received: by 2002:a05:620a:44cb:b0:76c:b7f0:2bb4 with SMTP id y11-20020a05620a44cb00b0076cb7f02bb4mr1944186qkp.51.1693545634275;
        Thu, 31 Aug 2023 22:20:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1693545634; cv=none;
        d=google.com; s=arc-20160816;
        b=jkDWQwVhzbd/j0GJxHiaqXExJZ/T8SKg/0utbkgqFjsCDz/+kc94/ROLenVJG6wlxt
         KA5LQj+pJbnWij1QE7+UCo0em1+To6eEkFypNv/mi+e7Cd/2/U50qW8YqVxVlUSFLJeb
         dq9hH00T0vfFhFZZ3IaLGgRqTEsnKecxpJHqiZfdDCTSkN0fUitzmPNkJxdQRAvyXe5o
         JJs/7cQWJVHCW7AtWfqYkUQQOtqUPyTaa3Hpq2qTltzjhVwTwZtw5uTe+g6N01tC2MJB
         Z9IzOdNGm716eHWFXyvGNRdjf2Jbw1BdT3So/LRb8keZaAlwAirgvN733FgaplZBMCi/
         QMFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=6o+SkscDBZQHxO4IPoXk2b6VpWaf2BDVtjcSJ5cypVY=;
        fh=4x3mzvj/d8qs4zPDcmmmvZALyvd3/3Q9NFYHo7v58t0=;
        b=1IGZ28pEhAdyg9Ll8KCzqVqVQHHu3S9Jclah+IsjyeRQmrmx3eNQUp0/+iJ6PysRVk
         jhUlbNX6FZlxYZEu51suRP2KRJVkddL6ty/LYM2bxIzOWrQxOBz46IQ55a/+rtTR7BGM
         +oS8gVEYcdgExXtLkXVm9YPKw3zGWT6SQdQeo9QGJb6BCzvToY/PD5wVF5wDQTHAstxo
         4rjF2UOKEOsdxu0hDCslRLH9IWVvYBGx7Dp1PpHgbtsefsCBPmakZ7sxKtNPxaMVRNB5
         55BQP0u3uKMir3E2u7bJja/s9lH0I6J5S06MM6RsSK/Zwn+5LcUZE0P3DP+o3UKnVAhi
         DHPQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@ilande.co.uk header.s=20220518 header.b=Nlv+qFmz;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ilande.co.uk
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id dv13-20020a05620a1b8d00b0076d743132absi1900091qkb.353.2023.08.31.22.20.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 31 Aug 2023 22:20:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@ilande.co.uk header.s=20220518 header.b=Nlv+qFmz;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ilande.co.uk
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qbwZU-00048l-Lr; Fri, 01 Sep 2023 01:19:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1qbwZP-00047h-1I; Fri, 01 Sep 2023 01:19:47 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1qbwZL-0003VH-G2; Fri, 01 Sep 2023 01:19:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:MIME-Version:Date:Message-ID:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=6o+SkscDBZQHxO4IPoXk2b6VpWaf2BDVtjcSJ5cypVY=; b=Nlv+qFmzy3W8ioaB3pick0Neaw
 dXlZXYhw4bZjD8zEARqJf8z8DNMlE63WKWFdfxlkSaEqftA7v9jCr4HZf+DsiXNYWiverKTt2kgHi
 dsOPC3EDQ4rJklkiKKQhvkrXsxFGLC5gTsCjyUvPk5Xreu6uCYBD4ZLcJs6uAvEpebhgGS6/xZaHf
 2sqW1lVimCdpu3EZoc+h17HuvvUJGDVlfUy0BZydvztwwQzMvqhekLNPX5DA3DQCWw6m7qqJFMkjs
 ++byBWKhGjwFO2u7vsFIBgE7Pfi368Idm5NR9/cWAPnXLSxRUusT62RXEveGSKZ+oFJEO3ctjllmA
 FlNOJUHxR/5XqellTXwYHmZP8/cSw2GA38Cz7SCk7vbWNd8UkziBXRmTGz2W1sMIeSRuh2AduAciI
 wIBLX8IB+W0VhwBUhKJq3SWH8ilzujcj4Y3Ykv1iA6dNWcHGeVPtcJ9U4oqRRNefry+hQ5BBgl0OG
 VWgA3d4RG5zZ3eR3D9hESAavUIFBwFY43bBhZO4rTrdukVIMO7cCXmyL8H44kmi/+I813UzkroxW+
 Jx1h5Yw363uvHLfRfx1mt7bMW0DUcr5w12kixjL6QlhtaceE/Gz7kvVpLp13hFMhM15o/DkGe7hTa
 +ZGShjDZ0zBkQbwAdX3fKVDLpy8d0xy7k+sMYXx0A=;
Received: from [2a00:23c4:8bae:9a00:e29b:2528:c042:5a0c]
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1qbwYg-0000Et-0K; Fri, 01 Sep 2023 06:19:06 +0100
Message-ID: <10c161a3-e22b-5319-4d6e-6f24abfe564a@ilande.co.uk>
Date: Fri, 1 Sep 2023 06:19:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
To: Alexander Graf <graf@amazon.com>, qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, qemu-arm@nongnu.org,
 Cameron Esfahani <dirty@apple.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Peter Maydell
 <peter.maydell@linaro.org>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@linaro.org>, Mads Ynddal <mads@ynddal.dk>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Bernhard Beschow <shentey@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>
References: <20230830161425.91946-1-graf@amazon.com>
 <20230830161425.91946-3-graf@amazon.com>
Content-Language: en-US
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20230830161425.91946-3-graf@amazon.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8bae:9a00:e29b:2528:c042:5a0c
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH v2 02/12] hw/misc/pvpanic: Add MMIO interface
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -55
X-Spam_score: -5.6
X-Spam_bar: -----
X-Spam_report: (-5.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.478,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: Gl3cIEnVHIcU

On 30/08/2023 17:14, Alexander Graf wrote:

Hi Alex,

> In addition to the ISA and PCI variants of pvpanic, let's add an MMIO
> platform device that we can use in embedded arm environments.
> 
> Signed-off-by: Alexander Graf <graf@amazon.com>
> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> Tested-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> 
> ---
> 
> v1 -> v2:
> 
>    - Use SPDX header
>    - Remove useless includes
>    - Adapt to new meson.build target (system_ss)
> ---
>   include/hw/misc/pvpanic.h |  1 +
>   hw/misc/pvpanic-mmio.c    | 61 +++++++++++++++++++++++++++++++++++++++
>   hw/misc/Kconfig           |  4 +++
>   hw/misc/meson.build       |  1 +
>   4 files changed, 67 insertions(+)
>   create mode 100644 hw/misc/pvpanic-mmio.c
> 
> diff --git a/include/hw/misc/pvpanic.h b/include/hw/misc/pvpanic.h
> index fab94165d0..f9e7c1ea17 100644
> --- a/include/hw/misc/pvpanic.h
> +++ b/include/hw/misc/pvpanic.h
> @@ -20,6 +20,7 @@
>   
>   #define TYPE_PVPANIC_ISA_DEVICE "pvpanic"
>   #define TYPE_PVPANIC_PCI_DEVICE "pvpanic-pci"
> +#define TYPE_PVPANIC_MMIO_DEVICE "pvpanic-mmio"
>   
>   #define PVPANIC_IOPORT_PROP "ioport"
>   
> diff --git a/hw/misc/pvpanic-mmio.c b/hw/misc/pvpanic-mmio.c
> new file mode 100644
> index 0000000000..99a24f104c
> --- /dev/null
> +++ b/hw/misc/pvpanic-mmio.c
> @@ -0,0 +1,61 @@
> +/*
> + * QEMU simulated pvpanic device (MMIO frontend)
> + *
> + * Copyright © 2023 Amazon.com, Inc. or its affiliates. All Rights Reserved.
> + *
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + */
> +
> +#include "qemu/osdep.h"
> +
> +#include "hw/qdev-properties.h"
> +#include "hw/misc/pvpanic.h"
> +#include "hw/sysbus.h"
> +#include "standard-headers/linux/pvpanic.h"
> +
> +OBJECT_DECLARE_SIMPLE_TYPE(PVPanicMMIOState, PVPANIC_MMIO_DEVICE)
> +
> +#define PVPANIC_MMIO_SIZE 0x2
> +
> +struct PVPanicMMIOState {
> +    SysBusDevice parent_obj;
> +
> +    PVPanicState pvpanic;
> +};
> +
> +static void pvpanic_mmio_initfn(Object *obj)
> +{
> +    PVPanicMMIOState *s = PVPANIC_MMIO_DEVICE(obj);
> +
> +    pvpanic_setup_io(&s->pvpanic, DEVICE(s), PVPANIC_MMIO_SIZE);
> +    sysbus_init_mmio(SYS_BUS_DEVICE(obj), &s->pvpanic.mr);
> +}
> +
> +static Property pvpanic_mmio_properties[] = {
> +    DEFINE_PROP_UINT8("events", PVPanicMMIOState, pvpanic.events,
> +                      PVPANIC_PANICKED | PVPANIC_CRASH_LOADED),
> +    DEFINE_PROP_END_OF_LIST(),
> +};
> +
> +static void pvpanic_mmio_class_init(ObjectClass *klass, void *data)
> +{
> +    DeviceClass *dc = DEVICE_CLASS(klass);
> +
> +    device_class_set_props(dc, pvpanic_mmio_properties);
> +    set_bit(DEVICE_CATEGORY_MISC, dc->categories);
> +}
> +
> +static const TypeInfo pvpanic_mmio_info = {
> +    .name          = TYPE_PVPANIC_MMIO_DEVICE,
> +    .parent        = TYPE_SYS_BUS_DEVICE,
> +    .instance_size = sizeof(PVPanicMMIOState),
> +    .instance_init = pvpanic_mmio_initfn,
> +    .class_init    = pvpanic_mmio_class_init,
> +};
> +
> +static void pvpanic_register_types(void)
> +{
> +    type_register_static(&pvpanic_mmio_info);
> +}
> +
> +type_init(pvpanic_register_types)

Instead of using the above boilerplate, the current recommended way to register QOM 
types is with the DEFINE_TYPES() macro.

> diff --git a/hw/misc/Kconfig b/hw/misc/Kconfig
> index 6996d265e4..b69746a60a 100644
> --- a/hw/misc/Kconfig
> +++ b/hw/misc/Kconfig
> @@ -125,6 +125,10 @@ config PVPANIC_ISA
>       depends on ISA_BUS
>       select PVPANIC_COMMON
>   
> +config PVPANIC_MMIO
> +    bool
> +    select PVPANIC_COMMON
> +
>   config AUX
>       bool
>       select I2C
> diff --git a/hw/misc/meson.build b/hw/misc/meson.build
> index 892f8b91c5..63821d6040 100644
> --- a/hw/misc/meson.build
> +++ b/hw/misc/meson.build
> @@ -116,6 +116,7 @@ system_ss.add(when: 'CONFIG_ARMSSE_MHU', if_true: files('armsse-mhu.c'))
>   
>   system_ss.add(when: 'CONFIG_PVPANIC_ISA', if_true: files('pvpanic-isa.c'))
>   system_ss.add(when: 'CONFIG_PVPANIC_PCI', if_true: files('pvpanic-pci.c'))
> +system_ss.add(when: 'CONFIG_PVPANIC_MMIO', if_true: files('pvpanic-mmio.c'))
>   system_ss.add(when: 'CONFIG_AUX', if_true: files('auxbus.c'))
>   system_ss.add(when: 'CONFIG_ASPEED_SOC', if_true: files(
>     'aspeed_hace.c',


ATB,

Mark.

