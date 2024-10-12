Received: by 2002:a17:505:3501:b0:1be9:327d:8ee3 with SMTP id mc1csp878109njb;
        Sat, 12 Oct 2024 03:41:37 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVcylqf0O2oHris3IoSOcru9/XowaMlMqE2Szt7KIeCtaoqAUenXkoPhFXqme9DXVn9btzufaEVDKU7Ag==@linaro.org
X-Google-Smtp-Source: AGHT+IGdpuND+O9mcdR7kGDruyrhK3AN2gp9yPZTRc1kIGmPZH36ehduhLeZXU1av4RpQJhW7GvX
X-Received: by 2002:a05:620a:29c6:b0:7a1:3ffb:e88e with SMTP id af79cd13be357-7b11a35f821mr745755285a.9.1728729697099;
        Sat, 12 Oct 2024 03:41:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1728729697; cv=none;
        d=google.com; s=arc-20240605;
        b=T8uhQ9E/Ozv2KKb+cIViOQsQD78B86mXBWKwpDqztZ0jD3qGlxUmMdcUvuwNw4gPwB
         JFjmlJ8kznHHUe/LAeurOFToOPV86Oa+4ow/r2xm8ZYWyXTtyaBTeSdJa8ePYb1U7zrx
         4uoXHzhEFH6a9AY8DMopp7Qu5194Rx4WAX+saLf7W/DUI6OlbDV4F3ENN12SjW/uQqvZ
         9edaJpCOc+BhH968YmM5yDILTFb6/4f2geNo3xQlu7HduUbHn6OYowF73HZoIWheczvp
         gdq7ol2zwAwBMo+7edy+JeWiePqn3+Tg/ZxtcmxX6KQ/mS2XHl2wVjN4boLWbzZQGJXi
         p4IQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=+1wRVLzP/BWQ3abWNRBeNRiaAAagshGdk2fzPyvuUe8=;
        fh=al2Njk11rEIuwmAjQmLy3wDtMI6CimPcYJd0DKEnS/o=;
        b=dJHt50LNcDwyG5rHNqj+wuxKqT+zxtYKyg34CCYUfQ/0sTzaFs97vI1nDwwgMkGCFJ
         MM9J1LWYeX+HmiYfIHALtlDld1O+BgMlmglt0BvpolwdDGfiBC44/cCHZ8Y09WZCQiLu
         4CKMipNcJQ/pKCHA5RO5pwxl8ctlQrCvOciiLPQq48UUZBphlGL2B7Zy7/+0DcejLC1K
         7HZjSgJAyX5pM2uhWDmzxidE4y1S63C9wfLfqyWoioj5qVwlxT8lh83z6nSOtWKawdbV
         dCB8ZnsdPgkbC5zDuSu3xaZx2DZLumH7afdghW6RhbqhA3lSh/cQnOXIQIBjhQxvppKR
         JJJw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=TNygrXLJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7b11535accfsi568645385a.488.2024.10.12.03.41.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 12 Oct 2024 03:41:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=TNygrXLJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1szZYL-0003Fe-Rk; Sat, 12 Oct 2024 06:40:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1szZYK-0003FH-9k
 for qemu-arm@nongnu.org; Sat, 12 Oct 2024 06:40:52 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1szZYH-0000ZI-8H
 for qemu-arm@nongnu.org; Sat, 12 Oct 2024 06:40:51 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 98e67ed59e1d1-2e2a97c2681so2152746a91.2
 for <qemu-arm@nongnu.org>; Sat, 12 Oct 2024 03:40:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1728729648; x=1729334448;
 darn=nongnu.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=+1wRVLzP/BWQ3abWNRBeNRiaAAagshGdk2fzPyvuUe8=;
 b=TNygrXLJB3244t8+ssRBhq91KHb5QzpmvH502c/jBCF9ToELdRzO5VgyAMjWubzMNY
 8BeGq5yQeGJ+CS6GC4fuxLEdZeAzDm/ZMEdq5/Gvhk1WYeN2OxPYeJ2tcGeJgstEn7j5
 MQDwNT2ummu6HUah2r5XatUQ1b09+zXvLJb//qxEHYC/q+Nq0Wyp5J4ABpE6mOrWCJGh
 1sigAkIX8oofyogxVUhBM3IgPMqv2oUot5NLBj13sRNeweekj8kRGREFqZtEr1yzG56J
 krIgBc9DvGwVFWjZtetdb40h1R4l0nfCJKsMU4EfS3EnuWdNoP+n6GcfT9viHhQ1VQ+R
 NphA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728729648; x=1729334448;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+1wRVLzP/BWQ3abWNRBeNRiaAAagshGdk2fzPyvuUe8=;
 b=TgVAWAAA5QEFwJCl8DpDRNlLvDjL1YoVZR281kScAeInxYO70EF7TEBvHjFq2BrnWr
 ben2acTCnQ14HMsS+JlMhPGDYGCQ2IOwkW74JNR9qpS0Dx653kCm5Lhty3G4vXZQ+SNx
 /Hi5Qk5AqMK24AYTSS06xgKOxCGs8djV1vIE0txtT5C/tUWGENrbVY+DIfRpTIgucJzn
 k2DGnqvQxoXmbVu0/byBzO+9oR7cFLouUzrmnEYdvZculyqrZ4OLEl2Gxob64fcAjltQ
 Xucd0jnaMTzC36Bi5AyDSU3EJu6SmOwSksLpP4MLpBt8eZnSNups0kqUrJB+3Vx8bYm6
 OFHw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUKUEiHzXSXV1Z/xXI19N98WHvX728xa+9f2LvSdUmU91Q9UagobIfAIy+E3efTGYGDhLhZzQs3TQ==@nongnu.org
X-Gm-Message-State: AOJu0YwZGqBPvl6uf2RigXlWvSm8CuLKELrt5MvlsvsblnRo5DomFFRY
 YEHtGeGOiU1RLSr9mPnfEY8T+tOcpGEanJvmZ/OC5Z/YqmXvGNB3iAfy6woDkqA=
X-Received: by 2002:a17:90a:f494:b0:2d8:e3f3:fd66 with SMTP id
 98e67ed59e1d1-2e2f0d9a4cfmr5931754a91.34.1728729647655; 
 Sat, 12 Oct 2024 03:40:47 -0700 (PDT)
Received: from [157.82.207.107] ([157.82.207.107])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2e2d5f0a2b7sm4784450a91.27.2024.10.12.03.40.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 12 Oct 2024 03:40:47 -0700 (PDT)
Message-ID: <ccaddf26-b8ee-4ce8-b674-a8c16b97cffe@daynix.com>
Date: Sat, 12 Oct 2024 19:40:40 +0900
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
 <60753df2-c1da-400f-a9d4-36077ab0c1f7@daynix.com>
 <CAAibmn1j2db4yH1TVQ+e+6bSuGGaQtbQaf+joPkWWnD-z6rEqA@mail.gmail.com>
Content-Language: en-US
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <CAAibmn1j2db4yH1TVQ+e+6bSuGGaQtbQaf+joPkWWnD-z6rEqA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::102a;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pj1-x102a.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
X-TUID: coRUIVsQcKWo

On 2024/10/09 22:08, Phil Dennis-Jordan wrote:
> 
> 
> On Mon, 7 Oct 2024 at 20:04, Akihiko Odaki <akihiko.odaki@daynix.com 
> <mailto:akihiko.odaki@daynix.com>> wrote:
> 
>     On 2024/10/07 23:10, Phil Dennis-Jordan wrote:
>      >
>      >
>      > On Sat, 5 Oct 2024 at 07:35, Akihiko Odaki
>     <akihiko.odaki@daynix.com <mailto:akihiko.odaki@daynix.com>
>      > <mailto:akihiko.odaki@daynix.com
>     <mailto:akihiko.odaki@daynix.com>>> wrote:
>      >
>      >     On 2024/09/28 17:57, Phil Dennis-Jordan wrote:
>      >      > From: Alexander Graf <graf@amazon.com
>     <mailto:graf@amazon.com> <mailto:graf@amazon.com
>     <mailto:graf@amazon.com>>>
>      >      >
>      >      > Instead of device tree or other more standardized means,
>     VMApple
>      >     passes
>      >      > platform configuration to the first stage boot loader in a
>     binary
>      >     encoded
>      >      > format that resides at a dedicated RAM region in physical
>     address
>      >     space.
>      >      >
>      >      > This patch models this configuration space as a qdev
>     device which
>      >     we can
>      >      > then map at the fixed location in the address space. That
>     way, we can
>      >      > influence and annotate all configuration fields easily.
>      >      >
>      >      > Signed-off-by: Alexander Graf <graf@amazon.com
>     <mailto:graf@amazon.com>
>      >     <mailto:graf@amazon.com <mailto:graf@amazon.com>>>
>      >      > Signed-off-by: Phil Dennis-Jordan <phil@philjordan.eu
>     <mailto:phil@philjordan.eu>
>      >     <mailto:phil@philjordan.eu <mailto:phil@philjordan.eu>>>
>      >      >
>      >      > ---
>      >      > v3:
>      >      >
>      >      >   * Replaced legacy device reset method with Resettable method
>      >      >
>      >      >   hw/vmapple/Kconfig       |   3 ++
>      >      >   hw/vmapple/cfg.c         | 106 +++++++++++++++++++++++++
>     +++++++
>      >     +++++++
>      >      >   hw/vmapple/meson.build   |   1 +
>      >      >   include/hw/vmapple/cfg.h |  68 +++++++++++++++++++++++++
>      >      >   4 files changed, 178 insertions(+)
>      >      >   create mode 100644 hw/vmapple/cfg.c
>      >      >   create mode 100644 include/hw/vmapple/cfg.h
>      >      >
>      >      > diff --git a/hw/vmapple/Kconfig b/hw/vmapple/Kconfig
>      >      > index 68f88876eb9..8bbeb9a9237 100644
>      >      > --- a/hw/vmapple/Kconfig
>      >      > +++ b/hw/vmapple/Kconfig
>      >      > @@ -4,3 +4,6 @@ config VMAPPLE_AES
>      >      >   config VMAPPLE_BDIF
>      >      >       bool
>      >      >
>      >      > +config VMAPPLE_CFG
>      >      > +    bool
>      >      > +
>      >      > diff --git a/hw/vmapple/cfg.c b/hw/vmapple/cfg.c
>      >      > new file mode 100644
>      >      > index 00000000000..a5e5c62f59f
>      >      > --- /dev/null
>      >      > +++ b/hw/vmapple/cfg.c
>      >      > @@ -0,0 +1,106 @@
>      >      > +/*
>      >      > + * VMApple Configuration Region
>      >      > + *
>      >      > + * Copyright © 2023 Amazon.com, Inc. or its affiliates. All
>      >     Rights Reserved.
>      >      > + *
>      >      > + * This work is licensed under the terms of the GNU GPL,
>     version
>      >     2 or later.
>      >      > + * See the COPYING file in the top-level directory.
>      >      > + */
>      >      > +
>      >      > +#include "qemu/osdep.h"
>      >      > +#include "hw/vmapple/cfg.h"
>      >      > +#include "qemu/log.h"
>      >      > +#include "qemu/module.h"
>      >      > +#include "qapi/error.h"
>      >      > +
>      >      > +static void vmapple_cfg_reset(Object *obj, ResetType type)
>      >      > +{
>      >      > +    VMAppleCfgState *s = VMAPPLE_CFG(obj);
>      >      > +    VMAppleCfg *cfg;
>      >      > +
>      >      > +    cfg = memory_region_get_ram_ptr(&s->mem);
>      >      > +    memset((void *)cfg, 0, VMAPPLE_CFG_SIZE);
>      >      > +    *cfg = s->cfg;
>      >       > +}> +
>      >      > +static void vmapple_cfg_realize(DeviceState *dev, Error
>     **errp)
>      >      > +{
>      >      > +    VMAppleCfgState *s = VMAPPLE_CFG(dev);
>      >      > +    uint32_t i;
>      >      > +
>      >      > +    strncpy(s->cfg.serial, s->serial, sizeof(s->cfg.serial));
>      >      > +    strncpy(s->cfg.model, s->model, sizeof(s->cfg.model));
>      >      > +    strncpy(s->cfg.soc_name, s->soc_name, sizeof(s-
>      >cfg.soc_name));
>      >      > +    strncpy(s->cfg.unk8, "D/A", sizeof(s->cfg.soc_name));
>      >
>      >     Use qemu_strnlen() to report an error for too long strings.
>      >
>      >
>      > Hmm, I don't see any existing instances of such a pattern. I do
>     however
>      > see a couple of uses of g_strlcpy in the Qemu codebase - that
>     would be a
>      > better candidate for error checked string copying, though it still
>      > involves some awkward return value checks. I'm going to wrap that
>     in a
>      > helper function and macro to replace all 4 strncpy instances
>     here. If
>      > the same thing is useful elsewhere later, it can be promoted to
>     cutils
>      > or similar.
> 
>     g_strlcpy() internally performs strlen(), which is worse than
>     qemu_strnlen().
> 
> 
> Worse in what sense? It really depends what you're defending against. 
> Sure, strlcpy blows up if the source string isn't nul-terminated. All 
> the source strings here are expected to be nul-terminated here though.
> 
>     It is nice to have a helper function. Linux also has something similar
>     called strscpy():
>     https://www.kernel.org/doc/html/latest/core-api/kernel-
>     api.html#c.strscpy <https://www.kernel.org/doc/html/latest/core-api/
>     kernel-api.html#c.strscpy>
> 
> 
> I'm not convinced this is the right patch set to be reinventing Qemu's 
> string copying functions. Instances abound of the even less safe 
> strcpy() (and sprintf, etc.) being used in Qemu. Some of those are 
> likely even problematic, but it seems that should be subject to a more 
> holistic investigation into what kinds of usage patterns there are, and 
> then a handful of safe solutions can be found that would work for 99% of 
> string copying in the code base. Not by adding yet another strcpy 
> variant in a device backend and machine type patch set where one of the 
> existing variants works just fine.

My suggestion were for the case you were going to write one to avoid 
cumbersome return value checks as you told in the earlier email. It is 
fine if your helper function is to be specific to this device to add 
device-specific error reporting code, for example.

> 
>      >
>      > (Also, I notice that last strncpy actually uses the wrong
>     destination
>      > size; my wrapper macro uses ARRAY_SIZE to avoid this mistake
>     altogether.)
>      >
>      >      > +    s->cfg.ecid = cpu_to_be64(s->cfg.ecid);
>      >      > +    s->cfg.version = 2;
>      >      > +    s->cfg.unk1 = 1;
>      >      > +    s->cfg.unk2 = 1;
>      >      > +    s->cfg.unk3 = 0x20;
>      >      > +    s->cfg.unk4 = 0;
>      >      > +    s->cfg.unk5 = 1;
>      >      > +    s->cfg.unk6 = 1;
>      >      > +    s->cfg.unk7 = 0;
>      >      > +    s->cfg.unk10 = 1;
>      >      > +
>      >      > +    g_assert(s->cfg.nr_cpus < ARRAY_SIZE(s->cfg.cpu_ids));
>      >
>      >     Report an error instead of asserting.
>      >
>      >      > +    for (i = 0; i < s->cfg.nr_cpus; i++) {
>      >      > +        s->cfg.cpu_ids[i] = i;
>      >      > +    }
>      >       > +}> +
>      >      > +static void vmapple_cfg_init(Object *obj)
>      >      > +{
>      >      > +    VMAppleCfgState *s = VMAPPLE_CFG(obj);
>      >      > +
>      >      > +    memory_region_init_ram(&s->mem, obj, "VMApple Config",
>      >     VMAPPLE_CFG_SIZE,
>      >      > +                           &error_fatal);
>      >      > +    sysbus_init_mmio(SYS_BUS_DEVICE(obj), &s->mem);
>      >      > +
>      >      > +    s->serial = (char *)"1234";
>      >      > +    s->model = (char *)"VM0001";
>      >      > +    s->soc_name = (char *)"Apple M1 (Virtual)";
>      >
>      >     These casts are unsafe; these pointers will be freed when this
>      >     device is
>      >     freed.
>      >
>      >
>      > Good catch! The more usual pattern for default string property
>     values
>      > seems to be to fill them in _realize() (using g_strdup()) if no
>     other
>      > value was previously set, so I've applied that here for the next
>     version
>      > of the patch.
>      >
>      >
>      >      > +}
>      >      > +
>      >      > +static Property vmapple_cfg_properties[] = {
>      >      > +    DEFINE_PROP_UINT32("nr-cpus", VMAppleCfgState,
>     cfg.nr_cpus, 1),
>      >      > +    DEFINE_PROP_UINT64("ecid", VMAppleCfgState, cfg.ecid, 0),
>      >      > +    DEFINE_PROP_UINT64("ram-size", VMAppleCfgState,
>      >     cfg.ram_size, 0),
>      >      > +    DEFINE_PROP_UINT32("run_installer1", VMAppleCfgState,
>      >     cfg.run_installer1, 0),
>      >      > +    DEFINE_PROP_UINT32("run_installer2", VMAppleCfgState,
>      >     cfg.run_installer2, 0),
>      >      > +    DEFINE_PROP_UINT32("rnd", VMAppleCfgState, cfg.rnd, 0),
>      >      > +    DEFINE_PROP_MACADDR("mac-en0", VMAppleCfgState,
>     cfg.mac_en0),
>      >      > +    DEFINE_PROP_MACADDR("mac-en1", VMAppleCfgState,
>     cfg.mac_en1),
>      >      > +    DEFINE_PROP_MACADDR("mac-wifi0", VMAppleCfgState,
>      >     cfg.mac_wifi0),
>      >      > +    DEFINE_PROP_MACADDR("mac-bt0", VMAppleCfgState,
>     cfg.mac_bt0),
>      >      > +    DEFINE_PROP_STRING("serial", VMAppleCfgState, serial),
>      >      > +    DEFINE_PROP_STRING("model", VMAppleCfgState, model),
>      >      > +    DEFINE_PROP_STRING("soc_name", VMAppleCfgState,
>     soc_name),
>      >      > +    DEFINE_PROP_END_OF_LIST(),
>      >      > +};
>      >      > +
>      >      > +static void vmapple_cfg_class_init(ObjectClass *klass,
>     void *data)
>      >      > +{
>      >      > +    DeviceClass *dc = DEVICE_CLASS(klass);
>      >      > +    ResettableClass *rc = RESETTABLE_CLASS(klass);
>      >      > +
>      >      > +    dc->realize = vmapple_cfg_realize;
>      >      > +    dc->desc = "VMApple Configuration Region";
>      >      > +    device_class_set_props(dc, vmapple_cfg_properties);
>      >      > +    rc->phases.hold = vmapple_cfg_reset;
>      >      > +}
>      >      > +
>      >      > +static const TypeInfo vmapple_cfg_info = {
>      >      > +    .name          = TYPE_VMAPPLE_CFG,
>      >      > +    .parent        = TYPE_SYS_BUS_DEVICE,
>      >      > +    .instance_size = sizeof(VMAppleCfgState),
>      >      > +    .instance_init = vmapple_cfg_init,
>      >      > +    .class_init    = vmapple_cfg_class_init,
>      >      > +};
>      >      > +
>      >      > +static void vmapple_cfg_register_types(void)
>      >      > +{
>      >      > +    type_register_static(&vmapple_cfg_info);
>      >      > +}
>      >      > +
>      >      > +type_init(vmapple_cfg_register_types)
>      >      > diff --git a/hw/vmapple/meson.build b/hw/vmapple/meson.build
>      >      > index d4624713deb..64b78693a31 100644
>      >      > --- a/hw/vmapple/meson.build
>      >      > +++ b/hw/vmapple/meson.build
>      >      > @@ -1,2 +1,3 @@
>      >      >   system_ss.add(when: 'CONFIG_VMAPPLE_AES',  if_true:
>     files('aes.c'))
>      >      >   system_ss.add(when: 'CONFIG_VMAPPLE_BDIF', if_true:
>      >     files('bdif.c'))
>      >      > +system_ss.add(when: 'CONFIG_VMAPPLE_CFG',  if_true:
>     files('cfg.c'))
>      >      > diff --git a/include/hw/vmapple/cfg.h b/include/hw/
>     vmapple/cfg.h
>      >      > new file mode 100644
>      >      > index 00000000000..3337064e447
>      >      > --- /dev/null
>      >      > +++ b/include/hw/vmapple/cfg.h
>      >      > @@ -0,0 +1,68 @@
>      >      > +/*
>      >      > + * VMApple Configuration Region
>      >      > + *
>      >      > + * Copyright © 2023 Amazon.com, Inc. or its affiliates. All
>      >     Rights Reserved.
>      >      > + *
>      >      > + * This work is licensed under the terms of the GNU GPL,
>     version
>      >     2 or later.
>      >      > + * See the COPYING file in the top-level directory.
>      >      > + */
>      >      > +
>      >      > +#ifndef HW_VMAPPLE_CFG_H
>      >      > +#define HW_VMAPPLE_CFG_H
>      >      > +
>      >      > +#include "hw/sysbus.h"
>      >      > +#include "qom/object.h"
>      >      > +#include "net/net.h"
>      >      > +
>      >      > +typedef struct VMAppleCfg {
>      >      > +    uint32_t version;         /* 0x000 */
>      >      > +    uint32_t nr_cpus;         /* 0x004 */
>      >      > +    uint32_t unk1;            /* 0x008 */
>      >      > +    uint32_t unk2;            /* 0x00c */
>      >      > +    uint32_t unk3;            /* 0x010 */
>      >      > +    uint32_t unk4;            /* 0x014 */
>      >      > +    uint64_t ecid;            /* 0x018 */
>      >      > +    uint64_t ram_size;        /* 0x020 */
>      >      > +    uint32_t run_installer1;  /* 0x028 */
>      >      > +    uint32_t unk5;            /* 0x02c */
>      >      > +    uint32_t unk6;            /* 0x030 */
>      >      > +    uint32_t run_installer2;  /* 0x034 */
>      >      > +    uint32_t rnd;             /* 0x038 */
>      >      > +    uint32_t unk7;            /* 0x03c */
>      >      > +    MACAddr mac_en0;          /* 0x040 */
>      >      > +    uint8_t pad1[2];
>      >      > +    MACAddr mac_en1;          /* 0x048 */
>      >      > +    uint8_t pad2[2];
>      >      > +    MACAddr mac_wifi0;        /* 0x050 */
>      >      > +    uint8_t pad3[2];
>      >      > +    MACAddr mac_bt0;          /* 0x058 */
>      >      > +    uint8_t pad4[2];
>      >      > +    uint8_t reserved[0xa0];   /* 0x060 */
>      >      > +    uint32_t cpu_ids[0x80];   /* 0x100 */
>      >      > +    uint8_t scratch[0x200];   /* 0x180 */
>      >      > +    char serial[32];          /* 0x380 */
>      >      > +    char unk8[32];            /* 0x3a0 */
>      >      > +    char model[32];           /* 0x3c0 */
>      >      > +    uint8_t unk9[32];         /* 0x3e0 */
>      >      > +    uint32_t unk10;           /* 0x400 */
>      >      > +    char soc_name[32];        /* 0x404 */
>      >      > +} VMAppleCfg;
>      >      > +
>      >      > +#define TYPE_VMAPPLE_CFG "vmapple-cfg"
>      >      > +OBJECT_DECLARE_SIMPLE_TYPE(VMAppleCfgState, VMAPPLE_CFG)
>      >      > +
>      >      > +struct VMAppleCfgState {
>      >      > +    /* <private> */
>      >      > +    SysBusDevice parent_obj;
>      >      > +    VMAppleCfg cfg;
>      >      > +
>      >      > +    /* <public> */
>      >      > +    MemoryRegion mem;
>      >      > +    char *serial;
>      >      > +    char *model;
>      >      > +    char *soc_name;
>      >      > +};
>      >      > +
>      >      > +#define VMAPPLE_CFG_SIZE 0x00010000
>      >      > +
>      >      > +#endif /* HW_VMAPPLE_CFG_H */
>      >
> 

