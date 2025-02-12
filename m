Received: by 2002:a17:505:4688:b0:1be9:327d:8ee3 with SMTP id cb8csp934006njb;
        Wed, 12 Feb 2025 03:45:09 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCX1QuebykJ1gHcIqKNzkXt5g77L/2wWmCXtKQohoPerxCQLMR5UC3dTggh2VzXDKbKjmKH0zOumaqZ59w==@linaro.org
X-Google-Smtp-Source: AGHT+IEQ3TLwzi1g0wKkwDyn1LT7tOfLFlVdHqxMhEwdBS5qjqqpi+7UR6n026h6hOXAmQCE22as
X-Received: by 2002:a05:600c:1d9a:b0:439:5573:932a with SMTP id 5b1f17b1804b1-439581cb97bmr27084165e9.29.1739360709706;
        Wed, 12 Feb 2025 03:45:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1739360709; cv=none;
        d=google.com; s=arc-20240605;
        b=YIAVnAxUW3AGcnW5Xk05mtcQPCsfaxTUS1xcQreD155zKhXWBwk7Taym2RwHyH4Swv
         Z1ALFGc2n8/epAbco+cmrQbNNI25YoxwJzKjLrxFVPUcUn+sMiBIuz0qmDt4bnZeyxqW
         fOYEtxxharqum0ETEIdGDNwAsj56ZBq24xBF94WmYgzw5M7Xo72esz8iNsv3IEZO5+Ws
         maalgZWA27tLMkP1htBXUbbHALEzuFIRvyaazG0tUjgNeJ7UvoawvT0GGHq3GEvrqeai
         MwXtwd5yMTbu5YflFK8exOXKMukoargluFydREybICtsYqt/D1/fwHH55ARYOiJao7NN
         258A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=GUtgXWeGjH4fmUCFTN1pAgkStUkgWd6guj/Zi5JuNq0=;
        fh=/Ypf8y0F2fDZEaNtM8Xpa5Ns/Ih3qmiPHbwQ4LmZiaU=;
        b=d3ijMJPcAgx+viGDqUczJAsM2aLV+xZ1EoUFTKoSzAO7seEQ2NAvBxcZa0GjIVYWhA
         akqF2kQVztfJLieISDUyT2+pSE9t7mUTfOn2mLga0AHY52zC7qoL3A4k1A3ZlSyXnCpn
         2GDdri2POMeUOSJq7t6swwMzsL1AuPKjRK0jVSPHk0SrmSeUTw3vmO+9uZP2ggmipGZL
         I3mpWDevxcd1kbx6gvv6ltfCZnd2gCgnyjAcb4n14hrVkxr3BxJsym4+Il7cckzUiUgn
         sfpOLiVNsd64ipODcwqhwd0yH4agwxWTkN/4U/Rbjaj1s5wNoT5g52c5tcRglpov2F9R
         xIzQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=aWmGp5dO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 5b1f17b1804b1-43959d5c281si8911835e9.184.2025.02.12.03.45.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 12 Feb 2025 03:45:09 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=aWmGp5dO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tiBAl-0008DO-SY; Wed, 12 Feb 2025 06:44:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tiBAS-00088i-3X
 for qemu-arm@nongnu.org; Wed, 12 Feb 2025 06:44:37 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tiBAM-00021B-F7
 for qemu-arm@nongnu.org; Wed, 12 Feb 2025 06:44:35 -0500
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4361e89b6daso46673815e9.3
 for <qemu-arm@nongnu.org>; Wed, 12 Feb 2025 03:44:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739360665; x=1739965465; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=GUtgXWeGjH4fmUCFTN1pAgkStUkgWd6guj/Zi5JuNq0=;
 b=aWmGp5dOtduKglVDbobIIZIOwmXk/tN/cvSGHB/M00j8Ya7vyP/6xg5b4GniaaAqPi
 KLjBAQp1recKH7NX3GD8CoBwnScE4ebdY/Hn0oDjn/FM6f8S8Yv+Yqnyd+W/jUTr0ll6
 cOn+4LG5+hunsAQhOiro3iRVebop03f7yWngQV/1OLah/DhkeRHmmN5DgZf/iSj6ZC22
 fo3UnvHKX0yJh9z7Ehi3FZS2g7NJWAd4mql1Kd1CVsCBQqwrE9uJi/LRxlPHu/owARhg
 3VFNO0pJVbkzmA6pd0PqRIvSDy7xn5rNCowG2GlBLZFkxKIA++MDRoBdGFwqTb1Hap2w
 r41Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739360665; x=1739965465;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=GUtgXWeGjH4fmUCFTN1pAgkStUkgWd6guj/Zi5JuNq0=;
 b=JGd29q2bp2qU8Y9tk8UfnZVuAK3Nv4WAjgV1Qe7U7RmOJyydFKJXBgVHe+La64U7Ln
 2Qv0h9GZ4owuHYYFPNJ25xpzTaO9EIh9AS73K20ws/oRXxuzvzmIyBQ8mvteKgqCcPqW
 08DT1Gz1KY1yK6S8x/HRW7Hf99ptim5z0lGnVyhG1KmcMdQTM8sKuvYdhOx24GmZYQDX
 oLxb5w+Ce+IcEv0dqjtk/R6X2HgSmDodBzedq227Pm7+q5qdpcqAmLgfK2MhoODf7I8X
 ksRrKI4LUbBeClBzKLwDp2e5w+NKzU+knXd2u2NH9l/SJqyRLFFl3TZSMekY3Qw+770r
 dqfg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUOUXKGYBdMD03mFwoIc8v4GKtVo4xFktZWdR2BP5eY5PGbqZ3F2DYT99I++6ywtAhZNPgP3BGPVQ==@nongnu.org
X-Gm-Message-State: AOJu0Yy5U8SZNK4BtARTA1kvCfoOzCzoik25xCQsOO0UM5A606395t+C
 0KWNxNUllfGvkgNpaAACggeJQqoGap+HCUUgkX4Bh9ss/EEf0aYmJlYE+lZeQHo=
X-Gm-Gg: ASbGnctAI9kjzLPg5qqammKh90SkV4SOi4Q4VvMPX2NFzt2XKb7xZvp9ytSW2A+6Fab
 s6veCMu/+r5GeMrx6F3mdAhG9X0vXZwWeS6jvd5dx58/u26n6AgtxMujbUyHs9esljQqmm1TQrz
 6ADYhEExUNUawiw0M9e2iG2LwN0ezt+tX5eOwn7CvzaF/XYHqjVjw77sFaAUFi2TNF5pjonf/8I
 GmCRMOQU5jCj+x0M6MqEMtje6wzN60fB0doKyChAciRGDg9efzeqTPVZwQFzp7wQrdJBWSl4N1n
 akcSXU4/ckt1PjjK97THTgvZ/tImIp8xyz7k6VqTFN5q5Vp9QnhOC7Ob99Q=
X-Received: by 2002:a05:600c:1d9a:b0:439:5573:932a with SMTP id
 5b1f17b1804b1-439581cb97bmr27062355e9.29.1739360665149; 
 Wed, 12 Feb 2025 03:44:25 -0800 (PST)
Received: from [192.168.69.198] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4395a06b1ddsm17519645e9.22.2025.02.12.03.44.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Feb 2025 03:44:24 -0800 (PST)
Message-ID: <e2c0e0fe-dafa-4ed6-be0d-63f9afb5a8b2@linaro.org>
Date: Wed, 12 Feb 2025 12:44:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 02/11] hw/intc/xilinx_intc: Make device endianness
 configurable
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, qemu-ppc@nongnu.org,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, qemu-arm@nongnu.org,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
References: <20250212112413.37553-1-philmd@linaro.org>
 <20250212112413.37553-3-philmd@linaro.org>
 <125a3dac-8ef9-4748-a3ce-f8fb97d8cb59@redhat.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <125a3dac-8ef9-4748-a3ce-f8fb97d8cb59@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
X-TUID: KfO7r8I0M9US

On 12/2/25 12:42, Thomas Huth wrote:
> On 12/02/2025 12.24, Philippe Mathieu-Daudé wrote:
>> Replace the DEVICE_NATIVE_ENDIAN MemoryRegionOps by a pair
>> of DEVICE_LITTLE_ENDIAN / DEVICE_BIG_ENDIAN.
>> Add the "little-endian" property to select the device
>> endianness, defaulting to little endian.
>> Set the proper endianness for each machine using the device.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> ---
>>   hw/intc/xilinx_intc.c                    | 60 ++++++++++++++++++------
>>   hw/microblaze/petalogix_ml605_mmu.c      |  1 +
>>   hw/microblaze/petalogix_s3adsp1800_mmu.c |  3 ++
>>   hw/ppc/virtex_ml507.c                    |  1 +
>>   hw/riscv/microblaze-v-generic.c          |  1 +
>>   5 files changed, 52 insertions(+), 14 deletions(-)
>>
>> diff --git a/hw/intc/xilinx_intc.c b/hw/intc/xilinx_intc.c
>> index 6930f83907a..523402b688c 100644
>> --- a/hw/intc/xilinx_intc.c
>> +++ b/hw/intc/xilinx_intc.c
>> @@ -3,6 +3,9 @@
>>    *
>>    * Copyright (c) 2009 Edgar E. Iglesias.
>>    *
>> + * https://docs.amd.com/v/u/en-US/xps_intc
>> + * DS572: LogiCORE IP XPS Interrupt Controller (v2.01a)
>> + *
>>    * Permission is hereby granted, free of charge, to any person 
>> obtaining a copy
>>    * of this software and associated documentation files (the 
>> "Software"), to deal
>>    * in the Software without restriction, including without limitation 
>> the rights
>> @@ -23,10 +26,12 @@
>>    */
>>   #include "qemu/osdep.h"
>> +#include "qapi/error.h"
>>   #include "hw/sysbus.h"
>>   #include "qemu/module.h"
>>   #include "hw/irq.h"
>>   #include "hw/qdev-properties.h"
>> +#include "hw/qdev-properties-system.h"
>>   #include "qom/object.h"
>>   #define D(x)
>> @@ -49,6 +54,7 @@ struct XpsIntc
>>   {
>>       SysBusDevice parent_obj;
>> +    EndianMode model_endianness;
>>       MemoryRegion mmio;
>>       qemu_irq parent_irq;
>> @@ -140,18 +146,29 @@ static void pic_write(void *opaque, hwaddr addr,
>>       update_irq(p);
>>   }
>> -static const MemoryRegionOps pic_ops = {
>> -    .read = pic_read,
>> -    .write = pic_write,
>> -    .endianness = DEVICE_NATIVE_ENDIAN,
>> -    .impl = {
>> -        .min_access_size = 4,
>> -        .max_access_size = 4,
>> +static const MemoryRegionOps pic_ops[2] = {
>> +    [0 ... 1] = {
> 
> Hmm, ok, so here we have now an assumption that ENDIAN_MODE_BIG and 
> ENDIAN_MODE_LITTLE match 0 and 1, which would not work anymore when 
> using 0 as unspecified... a little bit ugly ... so maybe instead of 
> changing pic_ops into an array ....
> 
>> +        .read = pic_read,
>> +        .write = pic_write,
>> +        .endianness = DEVICE_BIG_ENDIAN,
>> +        .impl = {
>> +            .min_access_size = 4,
>> +            .max_access_size = 4,
>> +        },
>> +        .valid = {
>> +            /*
>> +             * All XPS INTC registers are accessed through the PLB 
>> interface.
>> +             * The base address for these registers is provided by the
>> +             * configuration parameter, C_BASEADDR. Each register is 
>> 32 bits
>> +             * although some bits may be unused and is accessed on a 
>> 4-byte
>> +             * boundary offset from the base address.
>> +             */
>> +            .min_access_size = 4,
>> +            .max_access_size = 4,
>> +        },
>>       },
>> -    .valid = {
>> -        .min_access_size = 4,
>> -        .max_access_size = 4
>> -    }
>> +    [ENDIAN_MODE_BIG].endianness = DEVICE_BIG_ENDIAN,
>> +    [ENDIAN_MODE_LITTLE].endianness = DEVICE_LITTLE_ENDIAN,
>>   };
>>   static void irq_handler(void *opaque, int irq, int level)
>> @@ -174,13 +191,27 @@ static void xilinx_intc_init(Object *obj)
>>       qdev_init_gpio_in(DEVICE(obj), irq_handler, 32);
>>       sysbus_init_irq(SYS_BUS_DEVICE(obj), &p->parent_irq);
>> -
>> -    memory_region_init_io(&p->mmio, obj, &pic_ops, p, "xlnx.xps-intc",
>> -                          R_MAX * 4);
>>       sysbus_init_mmio(SYS_BUS_DEVICE(obj), &p->mmio);
>>   }
>> +static void xilinx_intc_realize(DeviceState *dev, Error **errp)
>> +{
>> +    XpsIntc *p = XILINX_INTC(dev);
>> +
>> +    if (p->model_endianness == ENDIAN_MODE_UNSPECIFIED) {
>> +        error_setg(errp, TYPE_XILINX_INTC " property 'endianness'"
>> +                         " must be set to 'big' or 'little'");
>> +        return;
>> +    }
> 
> ... would it be possible to patch in the right value for pic_ops.endianness
> here instead?

Ah, clever than my reply on the previous patch. I'll give it a try, thanks!

> 
>   Thomas

