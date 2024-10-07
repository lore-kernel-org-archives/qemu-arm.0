Received: by 2002:a17:505:c89:b0:1be9:327d:8ee3 with SMTP id hp9csp2110127njb;
        Mon, 7 Oct 2024 11:04:39 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUqcOPvFfBXqprsVSCFkF/INcpSKEueebRPWkMLwgVW2SXv5CajtRw9wCpGCKJSm/IqTPb9AjpMvFU3yw==@linaro.org
X-Google-Smtp-Source: AGHT+IGN3vmkZx6hsN4j8g5Ufs7xxzViv4MuxRS66U6pV1OAsyZjfUY8Lx52Fu8vx9A0YBC7olFi
X-Received: by 2002:a05:6122:c98:b0:50c:55f4:b529 with SMTP id 71dfb90a1353d-50c855597c1mr8082413e0c.8.1728324279674;
        Mon, 07 Oct 2024 11:04:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1728324279; cv=none;
        d=google.com; s=arc-20240605;
        b=D/VhP8pkHobwYBh/lIm1TF5uO8WMU96Cw5IjiPfPE0uVeBXBAU7GWs3DA4soNq7bNk
         onx0Vyn2Qk0dOCCacuHyQ2Jpn3dHIImd76KOdSWiYfw4ntGOIB2js0dX/9raUDU6HrOp
         +q3ow5GgWwHQE4mJHAKHRNQpdDbxFan4pagaB57ebTPwEHqbz12bc58DM/qIFBJFNhrK
         V7jPd1YfxANnkRyUZ6M4xadH7URFM7NrvKJ2KiOsQI52BsUoDxKGJPFbL7NjUxPNS8e2
         qFVNW/npRN3vwbg7MTJAL47jTH4CKOB1msMoyFuifmZXqjBEkaHSxNJqBhIYs6oFnvxx
         IBrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=Aau8fGkCg5aBn9fZ8bbHYXM3XPYvUDH4wISezj3kCq8=;
        fh=HlZKYOYFtR/B5cL4n+2MmUgAE3dJahyDTbiA7rhIyvM=;
        b=eCHflng+dPb3GefkdAPxTQvREqPMnjCgyK72cPzk/2QshFb5GVwloUqLQUQUslQvdS
         WJIxE1l4gwNOCIZ/o5xNZ5XrkaCkgvhCf8w0J2r8haRpFJeh2xrLHpCasVx1orNb1apb
         y7FlckdW8RA1VAz3reW6K1+2IaIR5OVFLR4b3mC7tzGf9prubOCDO7cF0bHm7SBtHU/7
         yUtdOq6Mb0SxRh5VAMiG+Ii9t7hH+g8+kivHFs3//TEU7O9eD1GZCO4MG4cVQuhdcFyY
         +PQPXMwNCA442bg6pU07PUXeKmzOg7GfTQd/h+gv6s36AnjQXztVbOuZwkXvKdq9Eapv
         1K3Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=Il0cDIbD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 71dfb90a1353d-50c9ad50b91si978504e0c.50.2024.10.07.11.04.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 07 Oct 2024 11:04:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=Il0cDIbD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sxs5g-0007gR-By; Mon, 07 Oct 2024 14:04:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1sxs5c-0007ei-Dy
 for qemu-arm@nongnu.org; Mon, 07 Oct 2024 14:04:12 -0400
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1sxs5Y-00023r-Ko
 for qemu-arm@nongnu.org; Mon, 07 Oct 2024 14:04:11 -0400
Received: by mail-pg1-x534.google.com with SMTP id
 41be03b00d2f7-7ea1b850d5cso310807a12.1
 for <qemu-arm@nongnu.org>; Mon, 07 Oct 2024 11:04:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1728324247; x=1728929047;
 darn=nongnu.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Aau8fGkCg5aBn9fZ8bbHYXM3XPYvUDH4wISezj3kCq8=;
 b=Il0cDIbDwvQaqzbN2cHqRKY7IkODivwSRmnz8hDAa/vfmgyMyzgMS9RMqnN8UgHBqR
 TZIj6HNJVOyRhVVGNl8YzgVFqBy+H4iPJlU4LgRpMwOQ2wsx5CvRq91s2qvieiZL6Y9z
 mHYIPptNEeVuegfPdt40Q/LZWkTNqOQamBmZSJteW1D/2yWeL3SUkEsD2X+5L2NC1fhx
 A7lyG3KvIpIYPp5pjK7f/I8twBTcF5nVrPVrYwGXwRIIc8qwgvnB+bXT8B+HbE4KlOHQ
 GSkr0pHq0uwurUMbjD78vAd/RzZIDOvlhCaJ8hSyNhkTWLTkEE1BEsvJfBwBaq2+r3KU
 Fugg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728324247; x=1728929047;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Aau8fGkCg5aBn9fZ8bbHYXM3XPYvUDH4wISezj3kCq8=;
 b=KkchUr7wSln8b7Cp3Q2NuYckNwnpkEXuzjlPnkYFFz/mD3dalGMY2Rk5zO26UyHNPn
 tRbsiWyhNnkISg67iifCpAFgmbg/V4c4+JmEJ9olyj77uMYNsmezjHjJRzQ2CnlLS0c8
 rLvzkxC4NAvQ9023iPm577IfO9d/2MA0AXvWCsGmJslnBZy81Yxy5mRxnUFuvPX06Qvv
 ehSWPggzeawUXnlDzPPUkSzmlIKUcum3nWnH72Uvceo8iQhS3HowDJV2qGVDleMM2SdG
 HsrkuEI2R86bflERIigqKJTAOjs35kBpXvISZOYK7WXOcRHDctjH+kNO2vXs9WWca6gk
 i2kA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXrXR2rFK4fGY9S5fHTTaessddRjT5KZQiaRAhd1kNyeprG4y0z0Hcar5u/DkbFygYJRTkbcZ6FFw==@nongnu.org
X-Gm-Message-State: AOJu0Yy2TYmIo0ssAFnI85oYzCpFSBXLVVqReywhn8UApyYBaOSRuSi1
 ieZJTxXPXXfdWi533+hJOqNf+6kLnSEAcfEDHr6kpcXMPs6ROOpmqOpFc056S4o=
X-Received: by 2002:a17:90a:77c4:b0:2e1:ce67:5d29 with SMTP id
 98e67ed59e1d1-2e1e62a197dmr15443053a91.21.1728324246929; 
 Mon, 07 Oct 2024 11:04:06 -0700 (PDT)
Received: from ?IPV6:2400:4050:a840:1e00:32ed:25ae:21b1:72d6?
 ([2400:4050:a840:1e00:32ed:25ae:21b1:72d6])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2e20aed02c2sm5768439a91.24.2024.10.07.11.04.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Oct 2024 11:04:06 -0700 (PDT)
Message-ID: <60753df2-c1da-400f-a9d4-36077ab0c1f7@daynix.com>
Date: Tue, 8 Oct 2024 03:03:58 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 12/14] hw/vmapple/cfg: Introduce vmapple cfg region
To: Phil Dennis-Jordan <phil@philjordan.eu>
Cc: qemu-devel@nongnu.org, agraf@csgraf.de, peter.maydell@linaro.org,
 pbonzini@redhat.com, rad@semihalf.com, quic_llindhol@quicinc.com,
 marcin.juszkiewicz@linaro.org, stefanha@redhat.com, mst@redhat.com,
 slp@redhat.com, richard.henderson@linaro.org, eduardo@habkost.net,
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
 <08fb08f5-b0ca-4334-8896-b0941cea614a@daynix.com>
 <CAAibmn0S6Qe4gLirAA9eU+M_PbSUUqcJs1-eZmwGge+CXg4p1A@mail.gmail.com>
Content-Language: en-US
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <CAAibmn0S6Qe4gLirAA9eU+M_PbSUUqcJs1-eZmwGge+CXg4p1A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::534;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pg1-x534.google.com
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
X-TUID: BU4w/Rt7dZrR

On 2024/10/07 23:10, Phil Dennis-Jordan wrote:
> 
> 
> On Sat, 5 Oct 2024 at 07:35, Akihiko Odaki <akihiko.odaki@daynix.com 
> <mailto:akihiko.odaki@daynix.com>> wrote:
> 
>     On 2024/09/28 17:57, Phil Dennis-Jordan wrote:
>      > From: Alexander Graf <graf@amazon.com <mailto:graf@amazon.com>>
>      >
>      > Instead of device tree or other more standardized means, VMApple
>     passes
>      > platform configuration to the first stage boot loader in a binary
>     encoded
>      > format that resides at a dedicated RAM region in physical address
>     space.
>      >
>      > This patch models this configuration space as a qdev device which
>     we can
>      > then map at the fixed location in the address space. That way, we can
>      > influence and annotate all configuration fields easily.
>      >
>      > Signed-off-by: Alexander Graf <graf@amazon.com
>     <mailto:graf@amazon.com>>
>      > Signed-off-by: Phil Dennis-Jordan <phil@philjordan.eu
>     <mailto:phil@philjordan.eu>>
>      >
>      > ---
>      > v3:
>      >
>      >   * Replaced legacy device reset method with Resettable method
>      >
>      >   hw/vmapple/Kconfig       |   3 ++
>      >   hw/vmapple/cfg.c         | 106 ++++++++++++++++++++++++++++++++
>     +++++++
>      >   hw/vmapple/meson.build   |   1 +
>      >   include/hw/vmapple/cfg.h |  68 +++++++++++++++++++++++++
>      >   4 files changed, 178 insertions(+)
>      >   create mode 100644 hw/vmapple/cfg.c
>      >   create mode 100644 include/hw/vmapple/cfg.h
>      >
>      > diff --git a/hw/vmapple/Kconfig b/hw/vmapple/Kconfig
>      > index 68f88876eb9..8bbeb9a9237 100644
>      > --- a/hw/vmapple/Kconfig
>      > +++ b/hw/vmapple/Kconfig
>      > @@ -4,3 +4,6 @@ config VMAPPLE_AES
>      >   config VMAPPLE_BDIF
>      >       bool
>      >
>      > +config VMAPPLE_CFG
>      > +    bool
>      > +
>      > diff --git a/hw/vmapple/cfg.c b/hw/vmapple/cfg.c
>      > new file mode 100644
>      > index 00000000000..a5e5c62f59f
>      > --- /dev/null
>      > +++ b/hw/vmapple/cfg.c
>      > @@ -0,0 +1,106 @@
>      > +/*
>      > + * VMApple Configuration Region
>      > + *
>      > + * Copyright © 2023 Amazon.com, Inc. or its affiliates. All
>     Rights Reserved.
>      > + *
>      > + * This work is licensed under the terms of the GNU GPL, version
>     2 or later.
>      > + * See the COPYING file in the top-level directory.
>      > + */
>      > +
>      > +#include "qemu/osdep.h"
>      > +#include "hw/vmapple/cfg.h"
>      > +#include "qemu/log.h"
>      > +#include "qemu/module.h"
>      > +#include "qapi/error.h"
>      > +
>      > +static void vmapple_cfg_reset(Object *obj, ResetType type)
>      > +{
>      > +    VMAppleCfgState *s = VMAPPLE_CFG(obj);
>      > +    VMAppleCfg *cfg;
>      > +
>      > +    cfg = memory_region_get_ram_ptr(&s->mem);
>      > +    memset((void *)cfg, 0, VMAPPLE_CFG_SIZE);
>      > +    *cfg = s->cfg;
>       > +}> +
>      > +static void vmapple_cfg_realize(DeviceState *dev, Error **errp)
>      > +{
>      > +    VMAppleCfgState *s = VMAPPLE_CFG(dev);
>      > +    uint32_t i;
>      > +
>      > +    strncpy(s->cfg.serial, s->serial, sizeof(s->cfg.serial));
>      > +    strncpy(s->cfg.model, s->model, sizeof(s->cfg.model));
>      > +    strncpy(s->cfg.soc_name, s->soc_name, sizeof(s->cfg.soc_name));
>      > +    strncpy(s->cfg.unk8, "D/A", sizeof(s->cfg.soc_name));
> 
>     Use qemu_strnlen() to report an error for too long strings.
> 
> 
> Hmm, I don't see any existing instances of such a pattern. I do however 
> see a couple of uses of g_strlcpy in the Qemu codebase - that would be a 
> better candidate for error checked string copying, though it still 
> involves some awkward return value checks. I'm going to wrap that in a 
> helper function and macro to replace all 4 strncpy instances here. If 
> the same thing is useful elsewhere later, it can be promoted to cutils 
> or similar.

g_strlcpy() internally performs strlen(), which is worse than 
qemu_strnlen().

It is nice to have a helper function. Linux also has something similar 
called strscpy():
https://www.kernel.org/doc/html/latest/core-api/kernel-api.html#c.strscpy

> 
> (Also, I notice that last strncpy actually uses the wrong destination 
> size; my wrapper macro uses ARRAY_SIZE to avoid this mistake altogether.)
> 
>      > +    s->cfg.ecid = cpu_to_be64(s->cfg.ecid);
>      > +    s->cfg.version = 2;
>      > +    s->cfg.unk1 = 1;
>      > +    s->cfg.unk2 = 1;
>      > +    s->cfg.unk3 = 0x20;
>      > +    s->cfg.unk4 = 0;
>      > +    s->cfg.unk5 = 1;
>      > +    s->cfg.unk6 = 1;
>      > +    s->cfg.unk7 = 0;
>      > +    s->cfg.unk10 = 1;
>      > +
>      > +    g_assert(s->cfg.nr_cpus < ARRAY_SIZE(s->cfg.cpu_ids));
> 
>     Report an error instead of asserting.
> 
>      > +    for (i = 0; i < s->cfg.nr_cpus; i++) {
>      > +        s->cfg.cpu_ids[i] = i;
>      > +    }
>       > +}> +
>      > +static void vmapple_cfg_init(Object *obj)
>      > +{
>      > +    VMAppleCfgState *s = VMAPPLE_CFG(obj);
>      > +
>      > +    memory_region_init_ram(&s->mem, obj, "VMApple Config",
>     VMAPPLE_CFG_SIZE,
>      > +                           &error_fatal);
>      > +    sysbus_init_mmio(SYS_BUS_DEVICE(obj), &s->mem);
>      > +
>      > +    s->serial = (char *)"1234";
>      > +    s->model = (char *)"VM0001";
>      > +    s->soc_name = (char *)"Apple M1 (Virtual)";
> 
>     These casts are unsafe; these pointers will be freed when this
>     device is
>     freed.
> 
> 
> Good catch! The more usual pattern for default string property values 
> seems to be to fill them in _realize() (using g_strdup()) if no other 
> value was previously set, so I've applied that here for the next version 
> of the patch.
> 
> 
>      > +}
>      > +
>      > +static Property vmapple_cfg_properties[] = {
>      > +    DEFINE_PROP_UINT32("nr-cpus", VMAppleCfgState, cfg.nr_cpus, 1),
>      > +    DEFINE_PROP_UINT64("ecid", VMAppleCfgState, cfg.ecid, 0),
>      > +    DEFINE_PROP_UINT64("ram-size", VMAppleCfgState,
>     cfg.ram_size, 0),
>      > +    DEFINE_PROP_UINT32("run_installer1", VMAppleCfgState,
>     cfg.run_installer1, 0),
>      > +    DEFINE_PROP_UINT32("run_installer2", VMAppleCfgState,
>     cfg.run_installer2, 0),
>      > +    DEFINE_PROP_UINT32("rnd", VMAppleCfgState, cfg.rnd, 0),
>      > +    DEFINE_PROP_MACADDR("mac-en0", VMAppleCfgState, cfg.mac_en0),
>      > +    DEFINE_PROP_MACADDR("mac-en1", VMAppleCfgState, cfg.mac_en1),
>      > +    DEFINE_PROP_MACADDR("mac-wifi0", VMAppleCfgState,
>     cfg.mac_wifi0),
>      > +    DEFINE_PROP_MACADDR("mac-bt0", VMAppleCfgState, cfg.mac_bt0),
>      > +    DEFINE_PROP_STRING("serial", VMAppleCfgState, serial),
>      > +    DEFINE_PROP_STRING("model", VMAppleCfgState, model),
>      > +    DEFINE_PROP_STRING("soc_name", VMAppleCfgState, soc_name),
>      > +    DEFINE_PROP_END_OF_LIST(),
>      > +};
>      > +
>      > +static void vmapple_cfg_class_init(ObjectClass *klass, void *data)
>      > +{
>      > +    DeviceClass *dc = DEVICE_CLASS(klass);
>      > +    ResettableClass *rc = RESETTABLE_CLASS(klass);
>      > +
>      > +    dc->realize = vmapple_cfg_realize;
>      > +    dc->desc = "VMApple Configuration Region";
>      > +    device_class_set_props(dc, vmapple_cfg_properties);
>      > +    rc->phases.hold = vmapple_cfg_reset;
>      > +}
>      > +
>      > +static const TypeInfo vmapple_cfg_info = {
>      > +    .name          = TYPE_VMAPPLE_CFG,
>      > +    .parent        = TYPE_SYS_BUS_DEVICE,
>      > +    .instance_size = sizeof(VMAppleCfgState),
>      > +    .instance_init = vmapple_cfg_init,
>      > +    .class_init    = vmapple_cfg_class_init,
>      > +};
>      > +
>      > +static void vmapple_cfg_register_types(void)
>      > +{
>      > +    type_register_static(&vmapple_cfg_info);
>      > +}
>      > +
>      > +type_init(vmapple_cfg_register_types)
>      > diff --git a/hw/vmapple/meson.build b/hw/vmapple/meson.build
>      > index d4624713deb..64b78693a31 100644
>      > --- a/hw/vmapple/meson.build
>      > +++ b/hw/vmapple/meson.build
>      > @@ -1,2 +1,3 @@
>      >   system_ss.add(when: 'CONFIG_VMAPPLE_AES',  if_true: files('aes.c'))
>      >   system_ss.add(when: 'CONFIG_VMAPPLE_BDIF', if_true:
>     files('bdif.c'))
>      > +system_ss.add(when: 'CONFIG_VMAPPLE_CFG',  if_true: files('cfg.c'))
>      > diff --git a/include/hw/vmapple/cfg.h b/include/hw/vmapple/cfg.h
>      > new file mode 100644
>      > index 00000000000..3337064e447
>      > --- /dev/null
>      > +++ b/include/hw/vmapple/cfg.h
>      > @@ -0,0 +1,68 @@
>      > +/*
>      > + * VMApple Configuration Region
>      > + *
>      > + * Copyright © 2023 Amazon.com, Inc. or its affiliates. All
>     Rights Reserved.
>      > + *
>      > + * This work is licensed under the terms of the GNU GPL, version
>     2 or later.
>      > + * See the COPYING file in the top-level directory.
>      > + */
>      > +
>      > +#ifndef HW_VMAPPLE_CFG_H
>      > +#define HW_VMAPPLE_CFG_H
>      > +
>      > +#include "hw/sysbus.h"
>      > +#include "qom/object.h"
>      > +#include "net/net.h"
>      > +
>      > +typedef struct VMAppleCfg {
>      > +    uint32_t version;         /* 0x000 */
>      > +    uint32_t nr_cpus;         /* 0x004 */
>      > +    uint32_t unk1;            /* 0x008 */
>      > +    uint32_t unk2;            /* 0x00c */
>      > +    uint32_t unk3;            /* 0x010 */
>      > +    uint32_t unk4;            /* 0x014 */
>      > +    uint64_t ecid;            /* 0x018 */
>      > +    uint64_t ram_size;        /* 0x020 */
>      > +    uint32_t run_installer1;  /* 0x028 */
>      > +    uint32_t unk5;            /* 0x02c */
>      > +    uint32_t unk6;            /* 0x030 */
>      > +    uint32_t run_installer2;  /* 0x034 */
>      > +    uint32_t rnd;             /* 0x038 */
>      > +    uint32_t unk7;            /* 0x03c */
>      > +    MACAddr mac_en0;          /* 0x040 */
>      > +    uint8_t pad1[2];
>      > +    MACAddr mac_en1;          /* 0x048 */
>      > +    uint8_t pad2[2];
>      > +    MACAddr mac_wifi0;        /* 0x050 */
>      > +    uint8_t pad3[2];
>      > +    MACAddr mac_bt0;          /* 0x058 */
>      > +    uint8_t pad4[2];
>      > +    uint8_t reserved[0xa0];   /* 0x060 */
>      > +    uint32_t cpu_ids[0x80];   /* 0x100 */
>      > +    uint8_t scratch[0x200];   /* 0x180 */
>      > +    char serial[32];          /* 0x380 */
>      > +    char unk8[32];            /* 0x3a0 */
>      > +    char model[32];           /* 0x3c0 */
>      > +    uint8_t unk9[32];         /* 0x3e0 */
>      > +    uint32_t unk10;           /* 0x400 */
>      > +    char soc_name[32];        /* 0x404 */
>      > +} VMAppleCfg;
>      > +
>      > +#define TYPE_VMAPPLE_CFG "vmapple-cfg"
>      > +OBJECT_DECLARE_SIMPLE_TYPE(VMAppleCfgState, VMAPPLE_CFG)
>      > +
>      > +struct VMAppleCfgState {
>      > +    /* <private> */
>      > +    SysBusDevice parent_obj;
>      > +    VMAppleCfg cfg;
>      > +
>      > +    /* <public> */
>      > +    MemoryRegion mem;
>      > +    char *serial;
>      > +    char *model;
>      > +    char *soc_name;
>      > +};
>      > +
>      > +#define VMAPPLE_CFG_SIZE 0x00010000
>      > +
>      > +#endif /* HW_VMAPPLE_CFG_H */
> 

