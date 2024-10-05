Received: by 2002:a17:505:c89:b0:1be9:327d:8ee3 with SMTP id hp9csp845005njb;
        Fri, 4 Oct 2024 22:36:00 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWwyyjD+7NqQ9cmU+fnEm7mXeH2m+2PwL8gOvV4dNikVMA0Ox7X1V0OWNUxjZP3Yp7W/iu5B/tXnhmoaQ==@linaro.org
X-Google-Smtp-Source: AGHT+IEziNEfaWPfAK0I2sVeecuh2jBxJTX73XiujJiVNlmcFKfG28PA1JgOnapZawFQu2MIdjTC
X-Received: by 2002:a05:622a:110a:b0:458:4e9e:634e with SMTP id d75a77b69052e-45d9ba2f51amr83029261cf.11.1728106560514;
        Fri, 04 Oct 2024 22:36:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1728106560; cv=none;
        d=google.com; s=arc-20240605;
        b=gQvdO5dH3QHsF1J+d4EU0YGg3ENhm1dVxG5tnyWCuw6AGy4OEr3eNUVGmvr69l3E5i
         81h/HbC1Mp9/UY1+R8uM9cItbkM0Osm+1pprHGzny9jZbZxYTt+xLmvwJvTdEMlPlHeW
         SuWlTxm8Il3prx4KAxhCP3PXEwOt453REg7DpxAXFlpmn/gKX0gWdpL35/SpTpZB9hL1
         bO43NSUMsmk6unhm5Fw9uoouYaCqglZfbAh27vnxtE9ezAU5pdVXM/ZzzNECCEAL/si3
         oXIKl7LcDGb8GN8acpEGTYLM93GuBBWtKMA0o1G08jf+StqlQZJunY+6ZPXTnqNGlJQy
         4jLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=p8Sr+EBwS1eD92OGfwfRBZRDjRb9Dvjjpbwy0kCuUQE=;
        fh=gTQVK5bgz4Tsz7HXzWMV80MXWsj6a+2fpIvQKoOs4a8=;
        b=CJeIFsgSwvRFNjR+8HYTbhtbsFRFqazoUDyZCfuj76wwai/r8nNRvYU5cbwGNdQ4w3
         JAO4heUH9WmiZPCF+8dgZcRwIKwsxC0SZHd94xi06Ippi0KO6HAyDRQBALzEu5ViSBwW
         SqzodtYK8g6Jicn9diWSGXmWDrVwNTFjW7xdj172rDUVaAh4r0w9CnRIB0Uq6/LvYlId
         rgBXISuW/PQr34FrqpVylKVRk4g7PwXiWtuReQReKSiS03GzvMUCxVMk0egIl9eTLd5Q
         KbE1406hPzk6shNhjrSpgrgKU7ZsHAEjiQlt6a5ky4rHTPMNJfV0wK0y9YdXH0tLhd5p
         npYg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=zgNh3+W6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-45da76d91e3si13938131cf.745.2024.10.04.22.36.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 04 Oct 2024 22:36:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=zgNh3+W6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1swxRz-0002VX-CG; Sat, 05 Oct 2024 01:35:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1swxRx-0002UP-M7
 for qemu-arm@nongnu.org; Sat, 05 Oct 2024 01:35:29 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1swxRu-0005oC-19
 for qemu-arm@nongnu.org; Sat, 05 Oct 2024 01:35:29 -0400
Received: by mail-pl1-x62b.google.com with SMTP id
 d9443c01a7336-20ba8d92af9so21585675ad.3
 for <qemu-arm@nongnu.org>; Fri, 04 Oct 2024 22:35:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1728106524; x=1728711324;
 darn=nongnu.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=p8Sr+EBwS1eD92OGfwfRBZRDjRb9Dvjjpbwy0kCuUQE=;
 b=zgNh3+W6LnvZQ0BV3teZ38rGIBeQUeJhxFtFuB1IB3lrRpN88l/8rqrKSFaGIunxuD
 cOirIoBS6Dfyw0I5hGfOU4sNUOx2PIg+fxDolsMOxxE/l5Gn8015EcMwqLu4MIf0GaqT
 4DbzUlqDUHkyGWi9DcKctszIuKx3U5eDCaNhtkQSMBQYr+3QO//YbZqrag2cW7bWb609
 pVUxcRwdd9FDxNWM51aMUE3qteui3qWZnyifzR4clqlWGZMPB9BxOOuAyciUASsk+uEe
 C3NaHArBC0Rjge94BmMD9Fwmw0Zwtz38xY2HlpZJBEvlcrMhj2/uzLqWRwx0OJhuAUnA
 8OMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728106524; x=1728711324;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=p8Sr+EBwS1eD92OGfwfRBZRDjRb9Dvjjpbwy0kCuUQE=;
 b=L2MJ++bGOIaFgwz/Ds/Xx81UluaoQPd61PbE/rk6gI50/tT85GmuAFs/n3zqNvpmaI
 3rGMWDWrWv12c9+r7t4JMEzZ089gXJcRc39q8NuQYR0xeIMBR+d85LwwnPmUR8IuXoXX
 +y1KNN+1R3eoEdNdUZIJbPkrlGjqPNP2+gc7dVgfd2D6V2vGoPcZLM+EzehqzsJovWIK
 J3VsoMiF2SVnNGqWq0JL8vJQa0Bfg1kcytXvdtTTHT848TD1UtClhP1J5GprgK4/UcOl
 UatIzW/TOoeTuzrxF/dLj74UzI7jXyiDNRh+UXqhs6/V1Qz7dKZPGRYZMfMrpUiC2xad
 ck/Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVdrlsksCQa9WipKNTwMCQ1+Q29J7SOi82xoC+8OGIcayxEKuwv0rINeUbxeXt0isp/EV74gU+ylA==@nongnu.org
X-Gm-Message-State: AOJu0YzxRGAScQduCbLfkmrgBfZ/S6GwCmlyoLZZEXfLe7cgffaY4S7p
 p2zGnSwHQu8FmA97RWON8zvthtjc3TK+fZ7auZ3JgebKygCkSSUVl1YwR1oX67g=
X-Received: by 2002:a17:902:ecd1:b0:207:2093:99bb with SMTP id
 d9443c01a7336-20bfe03529bmr66180915ad.31.1728106524086; 
 Fri, 04 Oct 2024 22:35:24 -0700 (PDT)
Received: from [157.82.202.230] ([157.82.202.230])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-20c138b104csm6893105ad.45.2024.10.04.22.35.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Oct 2024 22:35:23 -0700 (PDT)
Message-ID: <08fb08f5-b0ca-4334-8896-b0941cea614a@daynix.com>
Date: Sat, 5 Oct 2024 14:35:16 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 12/14] hw/vmapple/cfg: Introduce vmapple cfg region
To: Phil Dennis-Jordan <phil@philjordan.eu>, qemu-devel@nongnu.org
Cc: agraf@csgraf.de, peter.maydell@linaro.org, pbonzini@redhat.com,
 rad@semihalf.com, quic_llindhol@quicinc.com, marcin.juszkiewicz@linaro.org,
 stefanha@redhat.com, mst@redhat.com, slp@redhat.com,
 richard.henderson@linaro.org, eduardo@habkost.net,
 marcel.apfelbaum@gmail.com, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 chenhuacai@kernel.org, kwolf@redhat.com, hreitz@redhat.com,
 philmd@linaro.org, shorne@gmail.com, palmer@dabbelt.com,
 alistair.francis@wdc.com, bmeng.cn@gmail.com, liwei1518@gmail.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com, jcmvbkbc@gmail.com,
 marcandre.lureau@redhat.com, berrange@redhat.com, qemu-arm@nongnu.org,
 qemu-block@nongnu.org, qemu-riscv@nongnu.org,
 Alexander Graf <graf@amazon.com>
References: <20240928085727.56883-1-phil@philjordan.eu>
 <20240928085727.56883-13-phil@philjordan.eu>
Content-Language: en-US
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <20240928085727.56883-13-phil@philjordan.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::62b;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pl1-x62b.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: CZgmeD/BhbJQ

On 2024/09/28 17:57, Phil Dennis-Jordan wrote:
> From: Alexander Graf <graf@amazon.com>
> 
> Instead of device tree or other more standardized means, VMApple passes
> platform configuration to the first stage boot loader in a binary encoded
> format that resides at a dedicated RAM region in physical address space.
> 
> This patch models this configuration space as a qdev device which we can
> then map at the fixed location in the address space. That way, we can
> influence and annotate all configuration fields easily.
> 
> Signed-off-by: Alexander Graf <graf@amazon.com>
> Signed-off-by: Phil Dennis-Jordan <phil@philjordan.eu>
> 
> ---
> v3:
> 
>   * Replaced legacy device reset method with Resettable method
> 
>   hw/vmapple/Kconfig       |   3 ++
>   hw/vmapple/cfg.c         | 106 +++++++++++++++++++++++++++++++++++++++
>   hw/vmapple/meson.build   |   1 +
>   include/hw/vmapple/cfg.h |  68 +++++++++++++++++++++++++
>   4 files changed, 178 insertions(+)
>   create mode 100644 hw/vmapple/cfg.c
>   create mode 100644 include/hw/vmapple/cfg.h
> 
> diff --git a/hw/vmapple/Kconfig b/hw/vmapple/Kconfig
> index 68f88876eb9..8bbeb9a9237 100644
> --- a/hw/vmapple/Kconfig
> +++ b/hw/vmapple/Kconfig
> @@ -4,3 +4,6 @@ config VMAPPLE_AES
>   config VMAPPLE_BDIF
>       bool
>   
> +config VMAPPLE_CFG
> +    bool
> +
> diff --git a/hw/vmapple/cfg.c b/hw/vmapple/cfg.c
> new file mode 100644
> index 00000000000..a5e5c62f59f
> --- /dev/null
> +++ b/hw/vmapple/cfg.c
> @@ -0,0 +1,106 @@
> +/*
> + * VMApple Configuration Region
> + *
> + * Copyright © 2023 Amazon.com, Inc. or its affiliates. All Rights Reserved.
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2 or later.
> + * See the COPYING file in the top-level directory.
> + */
> +
> +#include "qemu/osdep.h"
> +#include "hw/vmapple/cfg.h"
> +#include "qemu/log.h"
> +#include "qemu/module.h"
> +#include "qapi/error.h"
> +
> +static void vmapple_cfg_reset(Object *obj, ResetType type)
> +{
> +    VMAppleCfgState *s = VMAPPLE_CFG(obj);
> +    VMAppleCfg *cfg;
> +
> +    cfg = memory_region_get_ram_ptr(&s->mem);
> +    memset((void *)cfg, 0, VMAPPLE_CFG_SIZE);
> +    *cfg = s->cfg;
 > +}> +
> +static void vmapple_cfg_realize(DeviceState *dev, Error **errp)
> +{
> +    VMAppleCfgState *s = VMAPPLE_CFG(dev);
> +    uint32_t i;
> +
> +    strncpy(s->cfg.serial, s->serial, sizeof(s->cfg.serial));
> +    strncpy(s->cfg.model, s->model, sizeof(s->cfg.model));
> +    strncpy(s->cfg.soc_name, s->soc_name, sizeof(s->cfg.soc_name));
> +    strncpy(s->cfg.unk8, "D/A", sizeof(s->cfg.soc_name));

Use qemu_strnlen() to report an error for too long strings.

> +    s->cfg.ecid = cpu_to_be64(s->cfg.ecid);
> +    s->cfg.version = 2;
> +    s->cfg.unk1 = 1;
> +    s->cfg.unk2 = 1;
> +    s->cfg.unk3 = 0x20;
> +    s->cfg.unk4 = 0;
> +    s->cfg.unk5 = 1;
> +    s->cfg.unk6 = 1;
> +    s->cfg.unk7 = 0;
> +    s->cfg.unk10 = 1;
> +
> +    g_assert(s->cfg.nr_cpus < ARRAY_SIZE(s->cfg.cpu_ids));

Report an error instead of asserting.

> +    for (i = 0; i < s->cfg.nr_cpus; i++) {
> +        s->cfg.cpu_ids[i] = i;
> +    }
 > +}> +
> +static void vmapple_cfg_init(Object *obj)
> +{
> +    VMAppleCfgState *s = VMAPPLE_CFG(obj);
> +
> +    memory_region_init_ram(&s->mem, obj, "VMApple Config", VMAPPLE_CFG_SIZE,
> +                           &error_fatal);
> +    sysbus_init_mmio(SYS_BUS_DEVICE(obj), &s->mem);
> +
> +    s->serial = (char *)"1234";
> +    s->model = (char *)"VM0001";
> +    s->soc_name = (char *)"Apple M1 (Virtual)";

These casts are unsafe; these pointers will be freed when this device is 
freed.

> +}
> +
> +static Property vmapple_cfg_properties[] = {
> +    DEFINE_PROP_UINT32("nr-cpus", VMAppleCfgState, cfg.nr_cpus, 1),
> +    DEFINE_PROP_UINT64("ecid", VMAppleCfgState, cfg.ecid, 0),
> +    DEFINE_PROP_UINT64("ram-size", VMAppleCfgState, cfg.ram_size, 0),
> +    DEFINE_PROP_UINT32("run_installer1", VMAppleCfgState, cfg.run_installer1, 0),
> +    DEFINE_PROP_UINT32("run_installer2", VMAppleCfgState, cfg.run_installer2, 0),
> +    DEFINE_PROP_UINT32("rnd", VMAppleCfgState, cfg.rnd, 0),
> +    DEFINE_PROP_MACADDR("mac-en0", VMAppleCfgState, cfg.mac_en0),
> +    DEFINE_PROP_MACADDR("mac-en1", VMAppleCfgState, cfg.mac_en1),
> +    DEFINE_PROP_MACADDR("mac-wifi0", VMAppleCfgState, cfg.mac_wifi0),
> +    DEFINE_PROP_MACADDR("mac-bt0", VMAppleCfgState, cfg.mac_bt0),
> +    DEFINE_PROP_STRING("serial", VMAppleCfgState, serial),
> +    DEFINE_PROP_STRING("model", VMAppleCfgState, model),
> +    DEFINE_PROP_STRING("soc_name", VMAppleCfgState, soc_name),
> +    DEFINE_PROP_END_OF_LIST(),
> +};
> +
> +static void vmapple_cfg_class_init(ObjectClass *klass, void *data)
> +{
> +    DeviceClass *dc = DEVICE_CLASS(klass);
> +    ResettableClass *rc = RESETTABLE_CLASS(klass);
> +
> +    dc->realize = vmapple_cfg_realize;
> +    dc->desc = "VMApple Configuration Region";
> +    device_class_set_props(dc, vmapple_cfg_properties);
> +    rc->phases.hold = vmapple_cfg_reset;
> +}
> +
> +static const TypeInfo vmapple_cfg_info = {
> +    .name          = TYPE_VMAPPLE_CFG,
> +    .parent        = TYPE_SYS_BUS_DEVICE,
> +    .instance_size = sizeof(VMAppleCfgState),
> +    .instance_init = vmapple_cfg_init,
> +    .class_init    = vmapple_cfg_class_init,
> +};
> +
> +static void vmapple_cfg_register_types(void)
> +{
> +    type_register_static(&vmapple_cfg_info);
> +}
> +
> +type_init(vmapple_cfg_register_types)
> diff --git a/hw/vmapple/meson.build b/hw/vmapple/meson.build
> index d4624713deb..64b78693a31 100644
> --- a/hw/vmapple/meson.build
> +++ b/hw/vmapple/meson.build
> @@ -1,2 +1,3 @@
>   system_ss.add(when: 'CONFIG_VMAPPLE_AES',  if_true: files('aes.c'))
>   system_ss.add(when: 'CONFIG_VMAPPLE_BDIF', if_true: files('bdif.c'))
> +system_ss.add(when: 'CONFIG_VMAPPLE_CFG',  if_true: files('cfg.c'))
> diff --git a/include/hw/vmapple/cfg.h b/include/hw/vmapple/cfg.h
> new file mode 100644
> index 00000000000..3337064e447
> --- /dev/null
> +++ b/include/hw/vmapple/cfg.h
> @@ -0,0 +1,68 @@
> +/*
> + * VMApple Configuration Region
> + *
> + * Copyright © 2023 Amazon.com, Inc. or its affiliates. All Rights Reserved.
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2 or later.
> + * See the COPYING file in the top-level directory.
> + */
> +
> +#ifndef HW_VMAPPLE_CFG_H
> +#define HW_VMAPPLE_CFG_H
> +
> +#include "hw/sysbus.h"
> +#include "qom/object.h"
> +#include "net/net.h"
> +
> +typedef struct VMAppleCfg {
> +    uint32_t version;         /* 0x000 */
> +    uint32_t nr_cpus;         /* 0x004 */
> +    uint32_t unk1;            /* 0x008 */
> +    uint32_t unk2;            /* 0x00c */
> +    uint32_t unk3;            /* 0x010 */
> +    uint32_t unk4;            /* 0x014 */
> +    uint64_t ecid;            /* 0x018 */
> +    uint64_t ram_size;        /* 0x020 */
> +    uint32_t run_installer1;  /* 0x028 */
> +    uint32_t unk5;            /* 0x02c */
> +    uint32_t unk6;            /* 0x030 */
> +    uint32_t run_installer2;  /* 0x034 */
> +    uint32_t rnd;             /* 0x038 */
> +    uint32_t unk7;            /* 0x03c */
> +    MACAddr mac_en0;          /* 0x040 */
> +    uint8_t pad1[2];
> +    MACAddr mac_en1;          /* 0x048 */
> +    uint8_t pad2[2];
> +    MACAddr mac_wifi0;        /* 0x050 */
> +    uint8_t pad3[2];
> +    MACAddr mac_bt0;          /* 0x058 */
> +    uint8_t pad4[2];
> +    uint8_t reserved[0xa0];   /* 0x060 */
> +    uint32_t cpu_ids[0x80];   /* 0x100 */
> +    uint8_t scratch[0x200];   /* 0x180 */
> +    char serial[32];          /* 0x380 */
> +    char unk8[32];            /* 0x3a0 */
> +    char model[32];           /* 0x3c0 */
> +    uint8_t unk9[32];         /* 0x3e0 */
> +    uint32_t unk10;           /* 0x400 */
> +    char soc_name[32];        /* 0x404 */
> +} VMAppleCfg;
> +
> +#define TYPE_VMAPPLE_CFG "vmapple-cfg"
> +OBJECT_DECLARE_SIMPLE_TYPE(VMAppleCfgState, VMAPPLE_CFG)
> +
> +struct VMAppleCfgState {
> +    /* <private> */
> +    SysBusDevice parent_obj;
> +    VMAppleCfg cfg;
> +
> +    /* <public> */
> +    MemoryRegion mem;
> +    char *serial;
> +    char *model;
> +    char *soc_name;
> +};
> +
> +#define VMAPPLE_CFG_SIZE 0x00010000
> +
> +#endif /* HW_VMAPPLE_CFG_H */

