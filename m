Received: by 2002:a17:505:610b:b0:1be9:327d:8ee3 with SMTP id tt11csp2679452njc;
        Tue, 5 Nov 2024 00:46:44 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVlE9/77YphWL7sTJxFBtE0EjNi+hKNbW7nw1CgPhd/GPgzvczF/IPQ7m6wP+kg3wfyRNv8zVGzrds32g==@linaro.org
X-Google-Smtp-Source: AGHT+IGxivNnuxNO01LOaWzqTgs6B3eEfDzHlPFagwclj28w+Go/qmH96GDnYhjqDhLGyAKpj+sm
X-Received: by 2002:a05:620a:4084:b0:7ac:b95b:7107 with SMTP id af79cd13be357-7b2fa6181bemr2252010485a.12.1730796404127;
        Tue, 05 Nov 2024 00:46:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1730796404; cv=none;
        d=google.com; s=arc-20240605;
        b=eylSjnOqP9h8N74bRGOAXW/JqGuK/kyNuu9ldn85rC1LRuy2ymiB8HRJolj87EuJaU
         p/rqjyiheGG9R7kWnVk5qJbd1unIYRxldx1wzbOO/wdjwiia1r3SFm2ImR9hTB1/Uk4J
         Hxj85dvKHrbG6d4dEne46E2Fvpgjyuy8f0gt2310QV/uyl6jvGvR/Avkk/VeK+NRJfYg
         h7vbqGrchb5AhewfvgrPXx4q4cufBeUyg58XxH2aaxep9BRpZbnTV9mmm6hVTbaBZR5A
         Tqqqg8MZA4EXpk4p6jbBvEWy65EU0vMU9o7VWrPsgicggWfSdV9uQMOZe7MLDY9qAWwr
         Fddg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=nTeJlnDxCDtp4tWmPTW7raIk8b7VAZIaFJKksBxGmS0=;
        fh=+Wm1kyfBkIgMVDgsXU1NRJgrTYvPBKgt23Xgw1yy2yI=;
        b=ZNvqJ5c2B28oYQc1KjiAoAIfq13cx/5+31fzKTXOMVxON9jn7YwlDcYw5jpQPSg5cg
         GlsHAjnPurQl9Huvo27lCvT04WzXiIZHDxtr0si1hIlXFMzQgbj0p5NdLgswgaXGMRyW
         KPZ6PSZHzsYSfcvtW6sGnsJZQoAGpm44y8DBqqXdioqdkichmytaN5jGH19FulB3ZC6Q
         QDv8vKARvW2tuxMR5mLaSiot3jnTjHIw+6tHK+W6+p5AlNgt9pj/GfphEJL9tVxlI5uA
         0Jdyc+MAZ8TDT0LjWiMaON4xZS/Qt9h+8A7X83Rmb+OSdcRNYMqtCt5zHJrL9pKv0u3S
         xt7w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=Mum687OL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-462ad1ec250si124916261cf.405.2024.11.05.00.46.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 05 Nov 2024 00:46:44 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=Mum687OL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1t8FCc-00033X-5u; Tue, 05 Nov 2024 03:46:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1t8FCa-000337-B4
 for qemu-arm@nongnu.org; Tue, 05 Nov 2024 03:46:16 -0500
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1t8FCY-00005t-71
 for qemu-arm@nongnu.org; Tue, 05 Nov 2024 03:46:16 -0500
Received: by mail-pl1-x62f.google.com with SMTP id
 d9443c01a7336-20c803787abso40397905ad.0
 for <qemu-arm@nongnu.org>; Tue, 05 Nov 2024 00:46:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1730796373; x=1731401173;
 darn=nongnu.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=nTeJlnDxCDtp4tWmPTW7raIk8b7VAZIaFJKksBxGmS0=;
 b=Mum687OLSrWGOAuYqi4Gzf/ksDNOrnIueS0TJ4cG+AFJFoTpjoYfWpDLW5mFFB2+Z0
 lP8kPMM9yQi0K4BPUPsGDfg3V8l4XxZN2b40O1rJPbVCmU8XYvAXJ9Ob/xgTsj7KlUGX
 i2Lunr9g3KQ5477zT0e8RnhQFIMuJpbiXRPbvAB/j8Tbmy+bh9YuqVl45W64nIHxz3DL
 lYFVCYHfWsh3hWYf3gjkQNFLihgmsPITxCtSo/MEFo7IDCa1K5zvhA4EjvWi3pCpDmq/
 AF6rYOL+ATa+N6FwcflC79KPdnHEDjkRhmjwHqwXruJD/sATolLiWel43lg8hnMhKxpx
 zILg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730796373; x=1731401173;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=nTeJlnDxCDtp4tWmPTW7raIk8b7VAZIaFJKksBxGmS0=;
 b=rpzfeuS0md0x6kiXyNLZKPRNDOWBytoIR+6Dxze5o0N0ezh7d40tiqmEhowpxV+2In
 yMn6WVuLX5PxBjWtN0rRNnTAEyjRRv0JJZ1K+lIKzO+4xvxExXkV/V97rIypBEIM8vYJ
 BPrMAuOwagQk17fq7lSPMPafacj46qsZM+Y88AFXY7Av0r2r4EQbAGLCyENba72ion7t
 rPlPVFiKMoqtvvZGSxgxVrCJcaRLFUHRUNWeq/ewd9KOtCBumE89tP7Lk7YphhfTSqLd
 I3SI2znYanjZXe0VbgnLL+ODs8eejS5O4NF7ntq53FXRZEKoL+EBTgMqHJ2HyBicqS0c
 KV3A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVNMVwXvW7KzuNCgoan4HjqnU0YXDT1R3bkQJEQhm1b3/oyBL9DRplLOFOQP+5lETAwNTpDhZMEmg==@nongnu.org
X-Gm-Message-State: AOJu0YwcaMqUNjLeu5D0D3NHLmdrOtcWoSknQkIqVZ5cU+hSURQUaS6v
 VTN3oVG1m0J2wRoXOCsJYhyaaJRYBK83YY2xwh43Dv95Nt5ikBWAwzc16D+9fOP28Zy4XNmohZ2
 o8f4=
X-Received: by 2002:a17:903:440d:b0:20c:ea22:3317 with SMTP id
 d9443c01a7336-211057cf265mr265976765ad.29.1730796372618; 
 Tue, 05 Nov 2024 00:46:12 -0800 (PST)
Received: from [157.82.207.107] ([157.82.207.107])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-211056ed8basm72994865ad.31.2024.11.05.00.46.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Nov 2024 00:46:12 -0800 (PST)
Message-ID: <a8c2cd84-6d3f-4ab7-b1d4-2ee11a464aad@daynix.com>
Date: Tue, 5 Nov 2024 17:46:05 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 12/15] hw/vmapple/cfg: Introduce vmapple cfg region
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
References: <20241103150037.48194-1-phil@philjordan.eu>
 <20241103150037.48194-13-phil@philjordan.eu>
Content-Language: en-US
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <20241103150037.48194-13-phil@philjordan.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::62f;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pl1-x62f.google.com
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
X-TUID: CRtg+bx7lMwF

On 2024/11/04 0:00, Phil Dennis-Jordan wrote:
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
> ---
> 
> v3:
> 
>   * Replaced legacy device reset method with Resettable method
> 
> v4:
> 
>   * Fixed initialisation of default values for properties
>   * Dropped superfluous endianness conversions
>   * Moved most header code to .c, device name #define goes in vmapple.h
> 
> v5:
> 
>   * Improved error reporting in case of string property buffer overflow.
> 
>   hw/vmapple/Kconfig           |   3 +
>   hw/vmapple/cfg.c             | 203 +++++++++++++++++++++++++++++++++++
>   hw/vmapple/meson.build       |   1 +
>   include/hw/vmapple/vmapple.h |   2 +
>   4 files changed, 209 insertions(+)
>   create mode 100644 hw/vmapple/cfg.c
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
> index 00000000000..91c57239f86
> --- /dev/null
> +++ b/hw/vmapple/cfg.c
> @@ -0,0 +1,203 @@
> +/*
> + * VMApple Configuration Region
> + *
> + * Copyright © 2023 Amazon.com, Inc. or its affiliates. All Rights Reserved.
> + *
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2 or later.
> + * See the COPYING file in the top-level directory.
> + */
> +
> +#include "qemu/osdep.h"
> +#include "hw/vmapple/vmapple.h"
> +#include "hw/sysbus.h"
> +#include "qemu/log.h"
> +#include "qemu/module.h"
> +#include "qapi/error.h"
> +#include "net/net.h"
> +
> +OBJECT_DECLARE_SIMPLE_TYPE(VMAppleCfgState, VMAPPLE_CFG)
> +
> +#define VMAPPLE_CFG_SIZE 0x00010000
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
> +struct VMAppleCfgState {
> +    SysBusDevice parent_obj;
> +    VMAppleCfg cfg;
> +
> +    MemoryRegion mem;
> +    char *serial;
> +    char *model;
> +    char *soc_name;
> +};
> +
> +static void vmapple_cfg_reset(Object *obj, ResetType type)
> +{
> +    VMAppleCfgState *s = VMAPPLE_CFG(obj);
> +    VMAppleCfg *cfg;
> +
> +    cfg = memory_region_get_ram_ptr(&s->mem);
> +    memset(cfg, 0, VMAPPLE_CFG_SIZE);
> +    *cfg = s->cfg;
> +}
> +
> +static bool strlcpy_set_error(char *restrict dst, const char *restrict src,
> +                              size_t dst_size, Error **errp,
> +                              const char *parent_func, const char *location,
> +                              const char *buffer_name, const char *extra_info)
> +{
> +    size_t len;
> +
> +    len = g_strlcpy(dst, src, dst_size);
> +    if (len < dst_size) { /* len does not count nul terminator */
> +        return true;
> +    }
> +
> +    error_setg(errp,
> +               "%s (%s) strlcpy error: Destination buffer %s too small "
> +               "(need %zu, have %zu) %s",
> +               parent_func, location, buffer_name, len + 1, dst_size, extra_info);

Let's avoid printing source locations. This is a user-facing error 
message so it should focus on pointing out what's wrong with the user input.

> +    return false;
> +}
> +
> +/*
> + * String copying wrapper that returns and reports a runtime error in
> + * case of truncation due to insufficient destination buffer space.
> + */
> +#define strlcpy_array_return_error(dst_array, src, errp, extra_info) \
> +    do { \
> +        if (!strlcpy_set_error((dst_array), (src), ARRAY_SIZE(dst_array), \
> +                               (errp), __func__, stringify(__LINE__), \
> +                               # dst_array, extra_info)) { \
> +            return; \
> +        } \
> +    } while (0)
> +
> +static void vmapple_cfg_realize(DeviceState *dev, Error **errp)
> +{
> +    VMAppleCfgState *s = VMAPPLE_CFG(dev);
> +    uint32_t i;
> +
> +    if (!s->serial) {
> +        s->serial = g_strdup("1234");
> +    }
> +    if (!s->model) {
> +        s->model = g_strdup("VM0001");
> +    }
> +    if (!s->soc_name) {
> +        s->soc_name = g_strdup("Apple M1 (Virtual)");
> +    }
> +
> +    strlcpy_array_return_error(s->cfg.serial, s->serial, errp,
> +                               "setting 'serial' property on VMApple cfg device");
> +    strlcpy_array_return_error(s->cfg.model, s->model, errp,
> +                               "setting 'model' property on VMApple cfg device");
> +    strlcpy_array_return_error(s->cfg.soc_name, s->soc_name, errp,
> +                               "setting 'soc_name' property on VMApple cfg device");
> +    strlcpy_array_return_error(s->cfg.unk8, "D/A", errp, "");
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
> +    if (s->cfg.nr_cpus > ARRAY_SIZE(s->cfg.cpu_ids)) {
> +        error_setg(errp,
> +                   "Failed to create %u CPUs, vmapple machine supports %zu max",
> +                   s->cfg.nr_cpus, ARRAY_SIZE(s->cfg.cpu_ids));
> +        return;
> +    }
> +    for (i = 0; i < s->cfg.nr_cpus; i++) {
> +        s->cfg.cpu_ids[i] = i;
> +    }
> +}
> +
> +static void vmapple_cfg_init(Object *obj)
> +{
> +    VMAppleCfgState *s = VMAPPLE_CFG(obj);
> +
> +    memory_region_init_ram(&s->mem, obj, "VMApple Config", VMAPPLE_CFG_SIZE,
> +                           &error_fatal);
> +    sysbus_init_mmio(SYS_BUS_DEVICE(obj), &s->mem);
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
> diff --git a/include/hw/vmapple/vmapple.h b/include/hw/vmapple/vmapple.h
> index 9090e9c5ac8..3bba59f5ec7 100644
> --- a/include/hw/vmapple/vmapple.h
> +++ b/include/hw/vmapple/vmapple.h
> @@ -16,4 +16,6 @@
>   
>   #define TYPE_VMAPPLE_BDIF "vmapple-bdif"
>   
> +#define TYPE_VMAPPLE_CFG "vmapple-cfg"
> +
>   #endif /* HW_VMAPPLE_VMAPPLE_H */

