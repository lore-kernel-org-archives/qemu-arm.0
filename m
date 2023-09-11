Received: by 2002:a17:906:9502:b0:9a1:fa4e:495e with SMTP id u2csp1304507ejx;
        Mon, 11 Sep 2023 05:19:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IExg3YZpHgoz6M4iR371v01TstrvxwY4IdtqT53or+ebZcXKM8b0VIaH4sAwFkTB5J6sZF1
X-Received: by 2002:a05:6358:2927:b0:135:51a5:4da0 with SMTP id y39-20020a056358292700b0013551a54da0mr8937969rwb.1.1694434792958;
        Mon, 11 Sep 2023 05:19:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1694434792; cv=none;
        d=google.com; s=arc-20160816;
        b=pVznbEaomedkTmGeTs+m8l+3I9lu9RUcJZGT8BVljHRGwMWzP6Kqa6LYmrueHxGblI
         azfxLbqKR7b7HVRHK8TeBi/G0tfu6rVyasQIDP8whwhpNuIlSWfjqfC7oqdy6kgX5CQv
         TApno9DJ9EUpPw8B91bjNDCjlfCtJ05Ca87Olr16NJF229GAR/BX2lBIM3MEOkat1mv8
         E7k1K+okxJYmQv/pv1iTS+fmvNSlL4iqsDv1bbLJ/wwYZhn6KRuBqZEbm3XpmjFyzRKh
         Lfas6Mom6YLRcNzSPZ8KRnLJCgN/9jjjUfZuELEVAuLmzd2mXjzYLIELCr0kZVHRpptM
         Yo4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id;
        bh=4bmkRYRvFVaoEWplBhXuy2oW1lwHXvscURTpJTFwZYU=;
        fh=mIJGsCCezl/E0qHOjEsRVAduFTIo6OTQPvroE0vb+p0=;
        b=BQdM1ifg1EleHF8NLCqrlXQNSnf14/EYsdTeegW5GD55hjtY0tu+enlOsMj1zdEy2b
         zhXUuGn0cw5uhI7tlDZiPfIQy6oBqrlQob/hqISI/kohkinIJexNSkXgL/H4HkYWPKzg
         x/ZPTER+B4m/keR15xnlhbItYVCoIxItDGPFuaYIWav0phUS2k5XijS3PRpsueAjVnuw
         BdKANJYgmGWh0iVDlrYHu5Ire82ioqKiRbQex4q9gcjh8Qu/xB6eK+PaEkQL7MmLO/ih
         g07mFaS2uPHQm2+XyJKKMSSpQE6YbgUpt72uVSqaiK7TXkAJPJdsarMw+RFgmZ9WxH0Y
         +2Hg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i4-20020a0cf384000000b005eee9ede7e0si4653487qvk.95.2023.09.11.05.19.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 11 Sep 2023 05:19:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qffss-000346-EG; Mon, 11 Sep 2023 08:19:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=62xJ=E3=kaod.org=clg@ozlabs.org>)
 id 1qffsr-0002yj-0k; Mon, 11 Sep 2023 08:19:17 -0400
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3]
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=62xJ=E3=kaod.org=clg@ozlabs.org>)
 id 1qffsn-0000Ud-76; Mon, 11 Sep 2023 08:19:16 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4Rkm3c2FbPz4xKR;
 Mon, 11 Sep 2023 22:19:08 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Rkm3X1pPSz4x09;
 Mon, 11 Sep 2023 22:19:03 +1000 (AEST)
Message-ID: <b40b9fd5-7fbb-92c6-747f-839a1ca2a0c1@kaod.org>
Date: Mon, 11 Sep 2023 14:19:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v4 02/10] hw/fsi: Introduce IBM's scratchpad
Content-Language: en-US
To: Ninad Palsule <ninad@linux.ibm.com>, qemu-devel@nongnu.org,
 peter.maydell@linaro.org, andrew@aj.id.au, joel@jms.id.au,
 pbonzini@redhat.com, marcandre.lureau@redhat.com, berrange@redhat.com,
 thuth@redhat.com, philmd@linaro.org, lvivier@redhat.com
Cc: qemu-arm@nongnu.org
References: <20230908222859.3381003-1-ninad@linux.ibm.com>
 <20230908222859.3381003-3-ninad@linux.ibm.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20230908222859.3381003-3-ninad@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2404:9400:2221:ea00::3;
 envelope-from=SRS0=62xJ=E3=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -53
X-Spam_score: -5.4
X-Spam_bar: -----
X-Spam_report: (-5.4 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-1.473,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 65qMvqCrHFuT

On 9/9/23 00:28, Ninad Palsule wrote:
> This is a part of patchset where IBM's Flexible Service Interface is
> introduced.
> 
> The LBUS device is embeded inside the scratchpad. The scratchpad
> provides a non-functional registers. There is a 1-1 relation between
> scratchpad and LBUS devices. Each LBUS device has 1K memory mapped in
> the LBUS.


The commit log is a bit confusing.

C.


> 
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> Signed-off-by: Ninad Palsule <ninad@linux.ibm.com>
> ---
> v2:
> - Incorporated Joel's review comments.
> ---
>   hw/fsi/Kconfig                     |   4 ++
>   hw/fsi/engine-scratchpad.c         | 100 +++++++++++++++++++++++++++++
>   hw/fsi/meson.build                 |   1 +
>   include/hw/fsi/engine-scratchpad.h |  33 ++++++++++
>   4 files changed, 138 insertions(+)
>   create mode 100644 hw/fsi/engine-scratchpad.c
>   create mode 100644 include/hw/fsi/engine-scratchpad.h
> 
> diff --git a/hw/fsi/Kconfig b/hw/fsi/Kconfig
> index 687449e14e..2a9c49f2c9 100644
> --- a/hw/fsi/Kconfig
> +++ b/hw/fsi/Kconfig
> @@ -1,2 +1,6 @@
> +config SCRATCHPAD
> +    bool
> +    select LBUS
> +
>   config LBUS
>       bool
> diff --git a/hw/fsi/engine-scratchpad.c b/hw/fsi/engine-scratchpad.c
> new file mode 100644
> index 0000000000..15a8f8cc66
> --- /dev/null
> +++ b/hw/fsi/engine-scratchpad.c
> @@ -0,0 +1,100 @@
> +/*
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + * Copyright (C) 2023 IBM Corp.
> + *
> + * IBM scratchpad engine
> + */
> +
> +#include "qemu/osdep.h"
> +
> +#include "qapi/error.h"
> +#include "qemu/log.h"
> +
> +#include "hw/fsi/engine-scratchpad.h"
> +
> +static uint64_t scratchpad_read(void *opaque, hwaddr addr, unsigned size)
> +{
> +    ScratchPad *s = SCRATCHPAD(opaque);
> +
> +    qemu_log_mask(LOG_UNIMP, "%s: read @0x%" HWADDR_PRIx " size=%d\n",
> +                  __func__, addr, size);
> +
> +    if (addr) {
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +                      "%s: Out of bounds read: 0x%"HWADDR_PRIx" for %u\n",
> +                      __func__, addr, size);
> +        return 0;
> +    }
> +
> +    return s->reg;
> +}
> +
> +static void scratchpad_write(void *opaque, hwaddr addr, uint64_t data,
> +                                 unsigned size)
> +{
> +    ScratchPad *s = SCRATCHPAD(opaque);
> +
> +    qemu_log_mask(LOG_UNIMP, "%s: write @0x%" HWADDR_PRIx " size=%d "
> +                  "value=%"PRIx64"\n", __func__, addr, size, data);
> +
> +    if (addr) {
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +                      "%s: Out of bounds write: 0x%"HWADDR_PRIx" for %u\n",
> +                      __func__, addr, size);
> +        return;
> +    }
> +
> +    s->reg = data;
> +}
> +
> +static const struct MemoryRegionOps scratchpad_ops = {
> +    .read = scratchpad_read,
> +    .write = scratchpad_write,
> +    .endianness = DEVICE_BIG_ENDIAN,
> +};
> +
> +static void scratchpad_realize(DeviceState *dev, Error **errp)
> +{
> +    LBusDevice *ldev = LBUS_DEVICE(dev);
> +
> +    memory_region_init_io(&ldev->iomem, OBJECT(ldev), &scratchpad_ops,
> +                          ldev, TYPE_SCRATCHPAD, 0x400);
> +}
> +
> +static void scratchpad_reset(DeviceState *dev)
> +{
> +    ScratchPad *s = SCRATCHPAD(dev);
> +
> +    s->reg = 0;
> +}
> +
> +static void scratchpad_class_init(ObjectClass *klass, void *data)
> +{
> +    DeviceClass *dc = DEVICE_CLASS(klass);
> +    LBusDeviceClass *ldc = LBUS_DEVICE_CLASS(klass);
> +
> +    dc->realize = scratchpad_realize;
> +    dc->reset = scratchpad_reset;
> +
> +    ldc->config =
> +          ENGINE_CONFIG_NEXT            /* valid */
> +        | 0x00010000                    /* slots */
> +        | 0x00001000                    /* version */
> +        | ENGINE_CONFIG_TYPE_SCRATCHPAD /* type */
> +        | 0x00000007;                   /* crc */
> +}
> +
> +static const TypeInfo scratchpad_info = {
> +    .name = TYPE_SCRATCHPAD,
> +    .parent = TYPE_LBUS_DEVICE,
> +    .instance_size = sizeof(ScratchPad),
> +    .class_init = scratchpad_class_init,
> +    .class_size = sizeof(LBusDeviceClass),
> +};
> +
> +static void scratchpad_register_types(void)
> +{
> +    type_register_static(&scratchpad_info);
> +}
> +
> +type_init(scratchpad_register_types);
> diff --git a/hw/fsi/meson.build b/hw/fsi/meson.build
> index e1007d5fea..f90e09ddab 100644
> --- a/hw/fsi/meson.build
> +++ b/hw/fsi/meson.build
> @@ -1 +1,2 @@
>   system_ss.add(when: 'CONFIG_LBUS', if_true: files('lbus.c'))
> +system_ss.add(when: 'CONFIG_SCRATCHPAD', if_true: files('engine-scratchpad.c'))
> diff --git a/include/hw/fsi/engine-scratchpad.h b/include/hw/fsi/engine-scratchpad.h
> new file mode 100644
> index 0000000000..63bf89ac5a
> --- /dev/null
> +++ b/include/hw/fsi/engine-scratchpad.h
> @@ -0,0 +1,33 @@
> +/*
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + * Copyright (C) 2023 IBM Corp.
> + *
> + * IBM scratchpad engne
> + */
> +#ifndef FSI_ENGINE_SCRATCHPAD_H
> +#define FSI_ENGINE_SCRATCHPAD_H
> +
> +#include "qemu/bitops.h"
> +
> +#include "hw/fsi/lbus.h"
> +
> +#define ENGINE_CONFIG_NEXT              BE_BIT(0)
> +#define ENGINE_CONFIG_VPD               BE_BIT(1)
> +#define ENGINE_CONFIG_SLOTS             BE_GENMASK(8, 15)
> +#define ENGINE_CONFIG_VERSION           BE_GENMASK(16, 19)
> +#define ENGINE_CONFIG_TYPE              BE_GENMASK(20, 27)
> +#define   ENGINE_CONFIG_TYPE_PEEK       (0x02 << 4)
> +#define   ENGINE_CONFIG_TYPE_FSI        (0x03 << 4)
> +#define   ENGINE_CONFIG_TYPE_SCRATCHPAD (0x06 << 4)
> +#define ENGINE_CONFIG_CRC              BE_GENMASK(28, 31)
> +
> +#define TYPE_SCRATCHPAD "scratchpad"
> +#define SCRATCHPAD(obj) OBJECT_CHECK(ScratchPad, (obj), TYPE_SCRATCHPAD)
> +
> +typedef struct ScratchPad {
> +        LBusDevice parent;
> +
> +        uint32_t reg;
> +} ScratchPad;
> +
> +#endif /* FSI_ENGINE_SCRATCHPAD_H */

