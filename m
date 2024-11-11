Received: by 2002:a17:505:610b:b0:1be9:327d:8ee3 with SMTP id tt11csp6388725njc;
        Sun, 10 Nov 2024 20:21:37 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCW6+QIK1bfgc2Ks4tiCeXDkuTGAe+seP1JqxqX7nWl1zfE9ihJHs0RYIxX68yza3nNZHJ71IqSCfa98wQ==@linaro.org
X-Google-Smtp-Source: AGHT+IHpNGU3rG55VEzcnHS3gNRQTmbEcqXyn/Yguj2FavnqiAfuETEosfP9gfD9FzzZ2SaJTpCN
X-Received: by 2002:a05:620a:1a0c:b0:7b1:45ac:86b7 with SMTP id af79cd13be357-7b331eac74bmr1335996585a.17.1731298897733;
        Sun, 10 Nov 2024 20:21:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1731298897; cv=none;
        d=google.com; s=arc-20240605;
        b=HN/G+imsFW6xkLQ8EiN9H2Lt/G4Q3ZBVgP6O4BHn26XVYhE01n9mDQyTgIcX0lgIFi
         rciLL3jDgZc48nT37KH043aso8F6XlhlOS33GRNyMVEh3boT9lKLCQkwxziVinmDISTT
         ej2n596WGDXNI4jTZAmhqKB9TIDtImn8PWWvd2TLRBch5ZatgpMuKCtotZhAdqDT6mq2
         QmqaMGYdNdJiD9fKNawTxUIMdDCRdrB9tvXtwivpmrUHFjXwkNTIwAE3agX35Na3duO1
         QCiHnMGJLIwYwUtPJH4DOjkCHiZIXMdwZ6H/cL3ZujABaL6+YlAp8txfT93BAa9Y8JAG
         dO8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=+G2OcDxEd3TTI25Q+i+pbPjZKxVh8nFZi3BuKyG9e2Y=;
        fh=jjCkrDSL1B00CO6XsgBkhi0Bps7q8Ea9ejRqQXV903A=;
        b=aoaInGyYwrgKJM/kuwmAo8fSwgYP3Op8EFaMeNA9yR00GH2P5SJj/f07wHguPWcjch
         V5zjrFrJMJYG/dxfVAHjaD1FkfCNfGDmv3Mf93B+TPj5N4RpB82sOZnxF9Q1lBZ5kl2i
         p+Oegvs1Pg0A2MR2ImeENPB3hQ08WeGftP+XkUyYuINOaNJDg+mEpRw0JX/6WOl3B/8p
         85GmK9pfbhciUjJUl3C09CErcAI3vLmdaOxtzJSGy1Ode+UE8LgCWKYJt9IlNk+ARuKL
         7B2xcEbGPK5q2FK7ExJlRquw/j5eDKIHO3gWOpls8F4QPVCmi1fKB5w1To0GkugpMLZT
         a/sw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=fx6BwePv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7b32acbfe08si1024180585a.333.2024.11.10.20.21.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 10 Nov 2024 20:21:37 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=fx6BwePv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tALvM-00054P-5p; Sun, 10 Nov 2024 23:21:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1tALvK-00053z-PY
 for qemu-arm@nongnu.org; Sun, 10 Nov 2024 23:21:10 -0500
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1tALvD-0003K0-TL
 for qemu-arm@nongnu.org; Sun, 10 Nov 2024 23:21:10 -0500
Received: by mail-pl1-x634.google.com with SMTP id
 d9443c01a7336-20ca388d242so40905625ad.2
 for <qemu-arm@nongnu.org>; Sun, 10 Nov 2024 20:21:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1731298862; x=1731903662;
 darn=nongnu.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=+G2OcDxEd3TTI25Q+i+pbPjZKxVh8nFZi3BuKyG9e2Y=;
 b=fx6BwePvIuBWkzafV4d8HaqIS8Z+ksOPvdiMNOZEKCfHfHmu0dZcT/mekHKmyO1oIo
 3omE3dL7MjpITRbGYz8NrNeBaHgSIGRimrwkPXMuLPriDP5DE/1dri5VQX9oxeMd0uQ6
 oSam0HOHnPuvdp2N867zaBQic4pcn23p3CH4T1vDDucnDp/cFx7R+I2VQLp5ZpBJKyEe
 gys5ksMegmCyTq6BAjQSEtV7vkaRmaI9w4G2S5ZKGV+4L5yHGnwrI8ExDqdzM5u+HWxF
 oBs0KNm3tWtx3/HxVzeVhywE1l5ntwpJgK06w4ZKRVowf51wKhrfFsxAChlnJFbUA/0G
 avyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731298862; x=1731903662;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+G2OcDxEd3TTI25Q+i+pbPjZKxVh8nFZi3BuKyG9e2Y=;
 b=VjfE2hKHswp5i6UgQPKHwgd43jmK4luINdwACQwgePpQ7zhHJrMe4GfbB+GJx+deZ2
 sVjrDB2Qy/tgFsqXIM1Scgv6cDC4303c85SAeaa8vp8O7AGwolEd6aCv9vz5YxKpY/K4
 GnqlzVYg2vUUKb1RcRpHB+Aeo0YMPR9m9GKdL/zQFOE1gi8bwTzPHj9s+5PUpa6LW9H7
 8ykgHYJGsH7C9JEmZSUSYnzdHhli/9Mf7NIIVxhhohQkOIU0OktwjPWiixvDT+MuprQp
 ldVOMoS69o3GBg5hfL41aYgnLXbZtqV3JsU+Vap6cMsWhCoVwrpI0JOc6umpVv0M3UBn
 H3rw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVjnj6itT2TNzSycmScKmdA6J/nqG+EURm78oDzgtSioZQgc4ktnOVMzHmTV/XYuRoaurWKkruVrg==@nongnu.org
X-Gm-Message-State: AOJu0Yz2dLx9D3i88jC00yeRXzlzU5WuPhXnZviXcjMqDhHjsdxVKNk3
 jdmeTZWaXhop07Hr+IWKOf1bqwrushwHrCgGMejprnAKIcZoHWhnATtLdLyVHRg=
X-Received: by 2002:a17:903:1109:b0:20c:8c0f:f986 with SMTP id
 d9443c01a7336-21183d6eb7bmr151091195ad.24.1731298862032; 
 Sun, 10 Nov 2024 20:21:02 -0800 (PST)
Received: from [157.82.207.107] ([157.82.207.107])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-21177dc82a8sm66737545ad.28.2024.11.10.20.20.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 10 Nov 2024 20:21:01 -0800 (PST)
Message-ID: <d245e6b2-f089-42e6-9614-947192fc96d8@daynix.com>
Date: Mon, 11 Nov 2024 13:20:54 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 12/15] hw/vmapple/cfg: Introduce vmapple cfg region
To: Phil Dennis-Jordan <lists@philjordan.eu>
Cc: Phil Dennis-Jordan <phil@philjordan.eu>, qemu-devel@nongnu.org,
 agraf@csgraf.de, peter.maydell@linaro.org, pbonzini@redhat.com,
 rad@semihalf.com, quic_llindhol@quicinc.com, stefanha@redhat.com,
 mst@redhat.com, slp@redhat.com, richard.henderson@linaro.org,
 eduardo@habkost.net, marcel.apfelbaum@gmail.com, gaosong@loongson.cn,
 jiaxun.yang@flygoat.com, chenhuacai@kernel.org, kwolf@redhat.com,
 hreitz@redhat.com, philmd@linaro.org, shorne@gmail.com, palmer@dabbelt.com,
 alistair.francis@wdc.com, bmeng.cn@gmail.com, liwei1518@gmail.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com, jcmvbkbc@gmail.com,
 marcandre.lureau@redhat.com, berrange@redhat.com, qemu-arm@nongnu.org,
 qemu-block@nongnu.org, qemu-riscv@nongnu.org,
 Alexander Graf <graf@amazon.com>
References: <20241108144709.95498-1-phil@philjordan.eu>
 <20241108144709.95498-13-phil@philjordan.eu>
 <49a1d82f-2464-4e10-b932-733e94be31b2@daynix.com>
 <CAGCz3vt_HuXu9uPwrOQkgE84-8nTgEQXST-BbXXc=FsEx_Wx2w@mail.gmail.com>
Content-Language: en-US
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <CAGCz3vt_HuXu9uPwrOQkgE84-8nTgEQXST-BbXXc=FsEx_Wx2w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pl1-x634.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: bl+d+bCCQAU4

On 2024/11/11 0:01, Phil Dennis-Jordan wrote:
> On Sun, 10 Nov 2024 at 08:15, Akihiko Odaki <akihiko.odaki@daynix.com> wrote:
>>
>> On 2024/11/08 23:47, Phil Dennis-Jordan wrote:
>>> From: Alexander Graf <graf@amazon.com>
>>>
>>> Instead of device tree or other more standardized means, VMApple passes
>>> platform configuration to the first stage boot loader in a binary encoded
>>> format that resides at a dedicated RAM region in physical address space.
>>>
>>> This patch models this configuration space as a qdev device which we can
>>> then map at the fixed location in the address space. That way, we can
>>> influence and annotate all configuration fields easily.
>>>
>>> Signed-off-by: Alexander Graf <graf@amazon.com>
>>> Signed-off-by: Phil Dennis-Jordan <phil@philjordan.eu>
>>> ---
>>>
>>> v3:
>>>
>>>    * Replaced legacy device reset method with Resettable method
>>>
>>> v4:
>>>
>>>    * Fixed initialisation of default values for properties
>>>    * Dropped superfluous endianness conversions
>>>    * Moved most header code to .c, device name #define goes in vmapple.h
>>>
>>> v5:
>>>
>>>    * Improved error reporting in case of string property buffer overflow.
>>>
>>> v7:
>>>
>>>    * Changed error messages for overrun of properties with
>>>      fixed-length strings to be more useful to users than developers.
>>>
>>> v8:
>>>
>>>    * Consistent parenthesising of macro arguments for better safety.
>>>
>>>    hw/vmapple/Kconfig           |   3 +
>>>    hw/vmapple/cfg.c             | 196 +++++++++++++++++++++++++++++++++++
>>>    hw/vmapple/meson.build       |   1 +
>>>    include/hw/vmapple/vmapple.h |   2 +
>>>    4 files changed, 202 insertions(+)
>>>    create mode 100644 hw/vmapple/cfg.c
>>>
>>> diff --git a/hw/vmapple/Kconfig b/hw/vmapple/Kconfig
>>> index 68f88876eb9..8bbeb9a9237 100644
>>> --- a/hw/vmapple/Kconfig
>>> +++ b/hw/vmapple/Kconfig
>>> @@ -4,3 +4,6 @@ config VMAPPLE_AES
>>>    config VMAPPLE_BDIF
>>>        bool
>>>
>>> +config VMAPPLE_CFG
>>> +    bool
>>> +
>>> diff --git a/hw/vmapple/cfg.c b/hw/vmapple/cfg.c
>>> new file mode 100644
>>> index 00000000000..787e2505d57
>>> --- /dev/null
>>> +++ b/hw/vmapple/cfg.c
>>> @@ -0,0 +1,196 @@
>>> +/*
>>> + * VMApple Configuration Region
>>> + *
>>> + * Copyright © 2023 Amazon.com, Inc. or its affiliates. All Rights Reserved.
>>> + *
>>> + * SPDX-License-Identifier: GPL-2.0-or-later
>>> + *
>>> + * This work is licensed under the terms of the GNU GPL, version 2 or later.
>>> + * See the COPYING file in the top-level directory.
>>> + */
>>> +
>>> +#include "qemu/osdep.h"
>>> +#include "hw/vmapple/vmapple.h"
>>> +#include "hw/sysbus.h"
>>> +#include "qemu/log.h"
>>> +#include "qemu/module.h"
>>> +#include "qapi/error.h"
>>> +#include "net/net.h"
>>> +
>>> +OBJECT_DECLARE_SIMPLE_TYPE(VMAppleCfgState, VMAPPLE_CFG)
>>> +
>>> +#define VMAPPLE_CFG_SIZE 0x00010000
>>> +
>>> +typedef struct VMAppleCfg {
>>> +    uint32_t version;         /* 0x000 */
>>> +    uint32_t nr_cpus;         /* 0x004 */
>>> +    uint32_t unk1;            /* 0x008 */
>>> +    uint32_t unk2;            /* 0x00c */
>>> +    uint32_t unk3;            /* 0x010 */
>>> +    uint32_t unk4;            /* 0x014 */
>>> +    uint64_t ecid;            /* 0x018 */
>>> +    uint64_t ram_size;        /* 0x020 */
>>> +    uint32_t run_installer1;  /* 0x028 */
>>> +    uint32_t unk5;            /* 0x02c */
>>> +    uint32_t unk6;            /* 0x030 */
>>> +    uint32_t run_installer2;  /* 0x034 */
>>> +    uint32_t rnd;             /* 0x038 */
>>> +    uint32_t unk7;            /* 0x03c */
>>> +    MACAddr mac_en0;          /* 0x040 */
>>> +    uint8_t pad1[2];
>>> +    MACAddr mac_en1;          /* 0x048 */
>>> +    uint8_t pad2[2];
>>> +    MACAddr mac_wifi0;        /* 0x050 */
>>> +    uint8_t pad3[2];
>>> +    MACAddr mac_bt0;          /* 0x058 */
>>> +    uint8_t pad4[2];
>>> +    uint8_t reserved[0xa0];   /* 0x060 */
>>> +    uint32_t cpu_ids[0x80];   /* 0x100 */
>>> +    uint8_t scratch[0x200];   /* 0x180 */
>>> +    char serial[32];          /* 0x380 */
>>> +    char unk8[32];            /* 0x3a0 */
>>> +    char model[32];           /* 0x3c0 */
>>> +    uint8_t unk9[32];         /* 0x3e0 */
>>> +    uint32_t unk10;           /* 0x400 */
>>> +    char soc_name[32];        /* 0x404 */
>>> +} VMAppleCfg;
>>> +
>>> +struct VMAppleCfgState {
>>> +    SysBusDevice parent_obj;
>>> +    VMAppleCfg cfg;
>>> +
>>> +    MemoryRegion mem;
>>> +    char *serial;
>>> +    char *model;
>>> +    char *soc_name;
>>> +};
>>> +
>>> +static void vmapple_cfg_reset(Object *obj, ResetType type)
>>> +{
>>> +    VMAppleCfgState *s = VMAPPLE_CFG(obj);
>>> +    VMAppleCfg *cfg;
>>> +
>>> +    cfg = memory_region_get_ram_ptr(&s->mem);
>>> +    memset(cfg, 0, VMAPPLE_CFG_SIZE);
>>> +    *cfg = s->cfg;
>>> +}
>>> +
>>> +static bool set_fixlen_property_or_error(char *restrict dst,
>>> +                                         const char *restrict src,
>>> +                                         size_t dst_size, Error **errp,
>>> +                                         const char *property_name)
>>> +{
>>> +    size_t len;
>>> +
>>> +    len = g_strlcpy(dst, src, dst_size);
>>> +    if (len < dst_size) { /* len does not count nul terminator */
>>> +        return true;
>>> +    }
>>> +
>>> +    error_setg(errp,
>>> +               "Failed to set property '%s' on VMApple 'cfg' device: length "
>>> +               "(%zu) exceeds maximum of %zu",
>>
>> Don't print the device name here as it will be automatically printed.
> 
> That's not what I'm seeing in tests. With code as-is, and setting an
> overly long value from create_cfg() in the vmapple machine type
> startup, I get the following output:
> 
> qemu-system-aarch64: Failed to set property 'soc_name' on VMApple
> 'cfg' device: length (50) exceeds maximum of 31
> 
> I don't see any redundant mention of an object or property name. Of
> course, this error occurs during the cfg device's realize(), not
> immediately when setting the property. I can't see a built-in way to
> explicitly limit the length of a string property.

I was thinking of the scenario where the device is added with the 
-device option. It seems the device name is not printed when it is 
realized by the machine, but in that case the user will not be aware of 
the 'cfg' device so it is not helpful. A proper way to add a context 
here is calling error_prepend() in the vmapple machine to tell that it 
is a failure in that machine type.

> 
>>> +               property_name, len, dst_size - 1);
>>> +    return false;
>>> +}
>>> +
>>> +#define set_fixlen_property_or_return(dst_array, src, errp, property_name) \
>>> +    do { \
>>> +        if (!set_fixlen_property_or_error((dst_array), (src), \
>>> +                                          ARRAY_SIZE(dst_array), \
>>> +                                          (errp), (property_name))) { \
>>> +            return; \
>>> +        } \
>>> +    } while (0)
>>> +
>>> +static void vmapple_cfg_realize(DeviceState *dev, Error **errp)
>>> +{
>>> +    VMAppleCfgState *s = VMAPPLE_CFG(dev);
>>> +    uint32_t i;
>>> +
>>> +    if (!s->serial) {
>>> +        s->serial = g_strdup("1234");
>>> +    }
>>> +    if (!s->model) {
>>> +        s->model = g_strdup("VM0001");
>>> +    }
>>> +    if (!s->soc_name) {
>>> +        s->soc_name = g_strdup("Apple M1 (Virtual)");
>>> +    }
>>> +
>>> +    set_fixlen_property_or_return(s->cfg.serial, s->serial, errp, "serial");
>>> +    set_fixlen_property_or_return(s->cfg.model, s->model, errp, "model");
>>> +    set_fixlen_property_or_return(s->cfg.soc_name, s->soc_name, errp, "soc_name");
>>> +    set_fixlen_property_or_return(s->cfg.unk8, "D/A", errp, "unk8");
>>> +    s->cfg.version = 2;
>>> +    s->cfg.unk1 = 1;
>>> +    s->cfg.unk2 = 1;
>>> +    s->cfg.unk3 = 0x20;
>>> +    s->cfg.unk4 = 0;
>>> +    s->cfg.unk5 = 1;
>>> +    s->cfg.unk6 = 1;
>>> +    s->cfg.unk7 = 0;
>>> +    s->cfg.unk10 = 1;
>>> +
>>> +    if (s->cfg.nr_cpus > ARRAY_SIZE(s->cfg.cpu_ids)) {
>>> +        error_setg(errp,
>>> +                   "Failed to create %u CPUs, vmapple machine supports %zu max",
>>> +                   s->cfg.nr_cpus, ARRAY_SIZE(s->cfg.cpu_ids));
>>> +        return;
>>> +    }
>>> +    for (i = 0; i < s->cfg.nr_cpus; i++) {
>>> +        s->cfg.cpu_ids[i] = i;
>>> +    }
>>> +}
>>> +
>>> +static void vmapple_cfg_init(Object *obj)
>>> +{
>>> +    VMAppleCfgState *s = VMAPPLE_CFG(obj);
>>> +
>>> +    memory_region_init_ram(&s->mem, obj, "VMApple Config", VMAPPLE_CFG_SIZE,
>>> +                           &error_fatal);
>>> +    sysbus_init_mmio(SYS_BUS_DEVICE(obj), &s->mem);
>>> +}
>>> +
>>> +static Property vmapple_cfg_properties[] = {
>>> +    DEFINE_PROP_UINT32("nr-cpus", VMAppleCfgState, cfg.nr_cpus, 1),
>>> +    DEFINE_PROP_UINT64("ecid", VMAppleCfgState, cfg.ecid, 0),
>>> +    DEFINE_PROP_UINT64("ram-size", VMAppleCfgState, cfg.ram_size, 0),
>>> +    DEFINE_PROP_UINT32("run_installer1", VMAppleCfgState, cfg.run_installer1, 0),
>>> +    DEFINE_PROP_UINT32("run_installer2", VMAppleCfgState, cfg.run_installer2, 0),
>>> +    DEFINE_PROP_UINT32("rnd", VMAppleCfgState, cfg.rnd, 0),
>>> +    DEFINE_PROP_MACADDR("mac-en0", VMAppleCfgState, cfg.mac_en0),
>>> +    DEFINE_PROP_MACADDR("mac-en1", VMAppleCfgState, cfg.mac_en1),
>>> +    DEFINE_PROP_MACADDR("mac-wifi0", VMAppleCfgState, cfg.mac_wifi0),
>>> +    DEFINE_PROP_MACADDR("mac-bt0", VMAppleCfgState, cfg.mac_bt0),
>>> +    DEFINE_PROP_STRING("serial", VMAppleCfgState, serial),
>>> +    DEFINE_PROP_STRING("model", VMAppleCfgState, model),
>>> +    DEFINE_PROP_STRING("soc_name", VMAppleCfgState, soc_name),
>>> +    DEFINE_PROP_END_OF_LIST(),
>>> +};
>>> +
>>> +static void vmapple_cfg_class_init(ObjectClass *klass, void *data)
>>> +{
>>> +    DeviceClass *dc = DEVICE_CLASS(klass);
>>> +    ResettableClass *rc = RESETTABLE_CLASS(klass);
>>> +
>>> +    dc->realize = vmapple_cfg_realize;
>>> +    dc->desc = "VMApple Configuration Region";
>>> +    device_class_set_props(dc, vmapple_cfg_properties);
>>> +    rc->phases.hold = vmapple_cfg_reset;
>>> +}
>>> +
>>> +static const TypeInfo vmapple_cfg_info = {
>>> +    .name          = TYPE_VMAPPLE_CFG,
>>> +    .parent        = TYPE_SYS_BUS_DEVICE,
>>> +    .instance_size = sizeof(VMAppleCfgState),
>>> +    .instance_init = vmapple_cfg_init,
>>> +    .class_init    = vmapple_cfg_class_init,
>>> +};
>>> +
>>> +static void vmapple_cfg_register_types(void)
>>> +{
>>> +    type_register_static(&vmapple_cfg_info);
>>> +}
>>> +
>>> +type_init(vmapple_cfg_register_types)
>>> diff --git a/hw/vmapple/meson.build b/hw/vmapple/meson.build
>>> index d4624713deb..64b78693a31 100644
>>> --- a/hw/vmapple/meson.build
>>> +++ b/hw/vmapple/meson.build
>>> @@ -1,2 +1,3 @@
>>>    system_ss.add(when: 'CONFIG_VMAPPLE_AES',  if_true: files('aes.c'))
>>>    system_ss.add(when: 'CONFIG_VMAPPLE_BDIF', if_true: files('bdif.c'))
>>> +system_ss.add(when: 'CONFIG_VMAPPLE_CFG',  if_true: files('cfg.c'))
>>> diff --git a/include/hw/vmapple/vmapple.h b/include/hw/vmapple/vmapple.h
>>> index 9090e9c5ac8..3bba59f5ec7 100644
>>> --- a/include/hw/vmapple/vmapple.h
>>> +++ b/include/hw/vmapple/vmapple.h
>>> @@ -16,4 +16,6 @@
>>>
>>>    #define TYPE_VMAPPLE_BDIF "vmapple-bdif"
>>>
>>> +#define TYPE_VMAPPLE_CFG "vmapple-cfg"
>>> +
>>>    #endif /* HW_VMAPPLE_VMAPPLE_H */
>>
>>

