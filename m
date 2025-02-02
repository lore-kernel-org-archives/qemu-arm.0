Received: by 2002:a17:505:11ab:b0:1be9:327d:8ee3 with SMTP id so11csp1657696njb;
        Sun, 2 Feb 2025 09:09:48 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCU9BxBoN41uFakqs+xKMFqzsLVjyHMSB88e+G6PbdwjNi58zc2c2O0QvrF9mQftiGoV8tqjMdcGkM1kLg==@linaro.org
X-Google-Smtp-Source: AGHT+IFeyE1R2vees7aBFjlqnTY8kZ80b6jouyn11HkH9HyYR19Xl+PUe6SHJpGpKT4+3r7bq86w
X-Received: by 2002:a05:6214:428f:b0:6e2:4940:400b with SMTP id 6a1803df08f44-6e249404305mr282261916d6.16.1738516187979;
        Sun, 02 Feb 2025 09:09:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738516187; cv=none;
        d=google.com; s=arc-20240605;
        b=OiQCVfjn8P0VZCIC4uDuRTXFkodDfiJZliDaYgBACoErfUcvgnfINbeLUUmsOIiwqx
         bmCwy84LNKzk1rSpl7pVC0ELZSiSY5tp40ZM5ZTdbxKF5FMT+eReHOaWNnU39Cl7ElLF
         rsHgx3sBsN8WW956QGwTkKk8gZolzdSQSBb53BU1lJNM3wyjhDq5k1KqMM98YpfXkoPk
         TuSuzshy3pNA116FdtlENKhciyww/sQIHrQp4qGaGg1bEBNW9tFsJ9P9PSkcwHzGDDOx
         9qk4cc3sJkkV823vZGUWVnCNiqEsValtGbIgJx9CYR+6Hipegmj6Awa7Boe71o3/OsCe
         PnoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=mZ7BVDT6VBewawO/AQZgenYlPX3uQqhjEFEwHdcs6eA=;
        fh=amsEkGQjy1YsPiuzrCI0HB+uzwNWZw48yVTS4gG6/Gk=;
        b=IHsIvrG6KdHVqBm37Ce86iHo6wpYRm+z0de7d9y2m9s8pnZ0XTTWUP9KTDtQaXvkIX
         OWWmfKANi/ZbVIbw+sGNWLyXJaRN0z4bkiAI/gbtk2/cEk5FsC0+1ApZTOkCvzi1+07Y
         QnJwat21u2TE+1VzVxnz7AEWP2gAvJ4yQnd4w+WDjqMmxB2cx0LjGiop+B/EvlHIqNUa
         DSWYRTMf/cyqnQ6oNdU/XassCjwYCmCVKOXYnwyKjKfifaGlRB4hDUy5ByiyVjtkDM6Z
         uP/xOnpEqeQuhTkHPDAoAlHIkPalFMo+KY6wXzq9FAUVxptnC0Ds7YN1veGpley0ln2y
         /ZoQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VtQfmPRD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6e2548141c2si80265426d6.79.2025.02.02.09.09.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 02 Feb 2025 09:09:47 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VtQfmPRD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tedTI-00053Q-EP; Sun, 02 Feb 2025 12:09:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tedTF-00052W-Fl
 for qemu-arm@nongnu.org; Sun, 02 Feb 2025 12:09:21 -0500
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tedTC-000183-PI
 for qemu-arm@nongnu.org; Sun, 02 Feb 2025 12:09:21 -0500
Received: by mail-pl1-x62e.google.com with SMTP id
 d9443c01a7336-2166022c5caso53803205ad.2
 for <qemu-arm@nongnu.org>; Sun, 02 Feb 2025 09:09:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738516157; x=1739120957; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=mZ7BVDT6VBewawO/AQZgenYlPX3uQqhjEFEwHdcs6eA=;
 b=VtQfmPRDXz9zWPor5LtzUt7M9NLVQGN3P2wpRSD6WcQzk296VJN5U0Qe8WbUCUfGxH
 pJoj6H5FgEOv2qH28DTxSOVU3ebGVzEPGru4d24UtW35JZm+wDPbtCkf3czZDfpa0IPO
 r/+vbeAPZKRpMqGNP4M9LtaWgOMB+B547jw3HcrW2Y2GOCKC1TTsVJ1tvdsDBI4ksd1F
 a0OM0BFauc24R7dZrF2kLlxd9ao3WgQ7RyKEbuFafjkhD+0R5u9npxJmQQ8C2Ao6dN7U
 OSctWzHmFx2kDPOVGPc1ktj+V9CORwlUNP0Gq7z/ALKYDhSPXzCFF0idynMpaAhkU56c
 +58g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738516157; x=1739120957;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=mZ7BVDT6VBewawO/AQZgenYlPX3uQqhjEFEwHdcs6eA=;
 b=MzIdRpKzl/zQnGHr04XeC4gIdTRwHLE6Z40MJUNE06Xjaq4jN8Z9pKl3c+dhXQViuy
 DhGHN8eFY2NG6WFVc4qkpM25zcpcRClqVXbKf+TpPlVbeLQvgZOa60ieuIaibfQOoCCG
 /MeklFrQDxANfre13MxeVZCU3on30I4eG3dseboB7DwjJ4EVcfzYm6LmIkfrANHRSk6c
 Hx3G34HIpRMqxOSz6C/sQadxMXxxg4EBGo2HLpMatrxGCzey9q0qvGB4ba8UeD+P8Ujp
 LGLONgxaqEf0tsnsy09Bq3mKHk2B8rmYCdzmQhB2vve9cUV8/OsGLfs7IjKO/HBzsdzA
 6GwQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXcVRaVxsBfmKujpxoBQ5CFCJXds2kSGUBDhMJbr/tJggDk+atGb2FKBm6DCg+qf5N751DaIX28jg==@nongnu.org
X-Gm-Message-State: AOJu0YzmWzBXbT+kEtvEjlrlUm7TbB6g/Ex39KQNFdZ2MDBmUnL+cKpr
 Ffaljp4kUJW6KNx7I2Z61x1sGY8KZ9pgBO9ui1GPuSldPB4Z5sntTv4t9ptcsMI=
X-Gm-Gg: ASbGncuOn2Kbtwb8GQHnUFCEkT9LWj43wkusqOOWtJJctUNwaISLPhAFsby78c4DSXG
 90Wq7u4Pz2zdFqgdbfiEnYU+uh/MK+XI8fGoE62PU26EPAfVyuqjA2M05uuTZDiFJKyGdtY7+Xf
 CPyJnZYKatkMmXlQK1z7ZsRp0FsmKzoWSgUCVOXeW9E9OJbSXm0kIt8sedBzq9f3H2THkdeujku
 +xdsuEBbR+rxtMqcueKz45t6wAa6XUhecPe1aSBKPolRgSogf8IXdZgAeP8I8OaGs11jy5ANcbK
 uh8op4UkrAZtJkNNwyeQkOg9UNU4qvhgMT6whEQRgTfeKkhIrh2IssbPAww=
X-Received: by 2002:a17:903:2f84:b0:216:779a:d5f3 with SMTP id
 d9443c01a7336-21dd7c4ec56mr318427585ad.14.1738516156551; 
 Sun, 02 Feb 2025 09:09:16 -0800 (PST)
Received: from [192.168.69.198] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-21de31ee2c7sm61622175ad.9.2025.02.02.09.09.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 02 Feb 2025 09:09:16 -0800 (PST)
Message-ID: <9d957453-5749-47c7-aad1-6977dac9aeea@linaro.org>
Date: Sun, 2 Feb 2025 18:09:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 20/21] hw/i2c: Import TCA6416 emulation from Xilinx
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org,
 Sai Pavan Boddu <sai.pavan.boddu@amd.com>,
 "Edgar E. Iglesias" <edgar.iglesias@amd.com>,
 Francisco Iglesias <francisco.iglesias@amd.com>,
 Dmitrii Sharikhin <d.sharikhin@yadro.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 Peter Maydell <peter.maydell@linaro.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>, qemu-arm@nongnu.org,
 Andrey Smirnov <andrew.smirnov@gmail.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
References: <20250120203748.4687-1-shentey@gmail.com>
 <20250120203748.4687-21-shentey@gmail.com>
 <df0ed59a-fe1b-44b0-a0cc-c62303294d7b@linaro.org>
 <32A9B14A-A0F9-4768-A28F-80702FA93960@gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <32A9B14A-A0F9-4768-A28F-80702FA93960@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=philmd@linaro.org; helo=mail-pl1-x62e.google.com
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
X-TUID: mhPYj6Rm1wKb

On 1/2/25 16:28, Bernhard Beschow wrote:
> 
> 
> Am 30. Januar 2025 23:05:53 UTC schrieb "Philippe Mathieu-Daudé" <philmd@linaro.org>:
>> Cc'ing AMD folks
>>
>> Hi Bernhard,
>>
>> TL;DR; can't you use the PCF8574 which is a more complete model of I/O
>> expander? (See hw/gpio/pcf8574.c)
> 
> If it is software-compatible then I could use it. I'm modeling a real board whose device tree I'd like to use unchanged, so I don't have much choice. The only reason I need it is because its absence clogs the i2c bus.

No clue about compatibility. If you unfortunately need to add it,
then please address my comments in the next version.

> 
> Best regards,
> Bernhard
> 
>>
>> On 20/1/25 21:37, Bernhard Beschow wrote:
>>> Xilinx QEMU implements a TCA6416 device model which may be useful for the
>>> broader QEMU community, so upstream it. In the Xilinx fork, the device model
>>> gets compiled whenever CONFIG_CADENCE is true, so have it maintained by the
>>> "hw/*/cadence_*" maintainers.
>>>
>>> The code is based on Xilinx QEMU version xilinx_v2024.2 plus the following
>>> modifications:
>>> * Use OBJECT_DECLARE_SIMPLE_TYPE()
>>> * Port from DPRINTF() to trace events
>>> * Follow QEMU conventions for naming of state struct
>>> * Rename type to not contain a ','
>>> * Use DEFINE_TYPES() macro
>>> * Implement under hw/gpio since device is i2c client and gpio provider
>>> * Have dedicated Kconfig switch
>>>
>>> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
>>>
>>> --
>>> I have a use for TCA6416 emulation. Question: Are Xilinx Zynq maintainers
>>> willing to maintain this device model?
>>> ---
>>>    MAINTAINERS          |   1 +
>>>    hw/gpio/tca6416.c    | 122 +++++++++++++++++++++++++++++++++++++++++++
>>>    hw/gpio/Kconfig      |   5 ++
>>>    hw/gpio/meson.build  |   1 +
>>>    hw/gpio/trace-events |   4 ++
>>>    5 files changed, 133 insertions(+)
>>>    create mode 100644 hw/gpio/tca6416.c
>>>
>>> diff --git a/MAINTAINERS b/MAINTAINERS
>>> index 7531d65429..0cac9c90bc 100644
>>> --- a/MAINTAINERS
>>> +++ b/MAINTAINERS
>>> @@ -1030,6 +1030,7 @@ S: Maintained
>>>    F: hw/*/xilinx_*
>>>    F: hw/*/cadence_*
>>>    F: hw/misc/zynq_slcr.c
>>> +F: hw/gpio/tca6416.c
>>>    F: hw/adc/zynq-xadc.c
>>>    F: include/hw/misc/zynq_slcr.h
>>>    F: include/hw/adc/zynq-xadc.h
>>> diff --git a/hw/gpio/tca6416.c b/hw/gpio/tca6416.c
>>> new file mode 100644
>>> index 0000000000..81ed7a654d
>>> --- /dev/null
>>> +++ b/hw/gpio/tca6416.c
>>> @@ -0,0 +1,122 @@
>>> +/*
>>> + * QEMU model of TCA6416 16-Bit I/O Expander
>>
>> Please add datasheet reference.
>>
>>> + *
>>> + * Copyright (c) 2018 Xilinx Inc.
>>> + *
>>> + * Written by Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>
>>> + *
>>> + * Permission is hereby granted, free of charge, to any person obtaining a copy
>>> + * of this software and associated documentation files (the "Software"), to deal
>>> + * in the Software without restriction, including without limitation the rights
>>> + * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
>>> + * copies of the Software, and to permit persons to whom the Software is
>>> + * furnished to do so, subject to the following conditions:
>>> + *
>>> + * The above copyright notice and this permission notice shall be included in
>>> + * all copies or substantial portions of the Software.
>>> + *
>>> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
>>> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
>>> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
>>> + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
>>> + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
>>> + * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
>>> + * THE SOFTWARE.
>>
>> Sai/Edgar/Francisco, should we update to AMD here? Remove or update the
>> email address? Also, can you Ack the replacement of this license by a
>> SPDX tag?
>>
>>> + */
>>> +#include "qemu/osdep.h"
>>> +#include "hw/i2c/i2c.h"
>>> +#include "trace.h"
>>> +
>>> +#define TYPE_TCA6416 "tca6416"
>>> +OBJECT_DECLARE_SIMPLE_TYPE(Tca6416State, TCA6416)
>>> +
>>> +#define IN_PORT0    0
>>> +#define IN_PORT1    1
>>> +#define OUT_PORT0   2
>>> +#define OUT_PORT1   3
>>> +#define POL_INV0    4
>>> +#define POL_INV1    5
>>> +#define CONF_PORT0  6
>>> +#define CONF_PORT1  7
>>
>> enum up to here?
>>
>>> +#define RMAX (CONF_PORT1 + 1)
>>> +
>>> +enum tca6416_events {
>>> +     ADDR_DONE,
>>> +     ADDRESSING,
>>> +};
>>> +
>>> +struct Tca6416State {
>>> +     I2CSlave i2c;
>>> +
>>> +     uint8_t addr;
>>> +     uint8_t state;
>>> +     uint8_t regs[RMAX];
>>> +};
>>> +
>>> +static uint8_t tca6416_read(I2CSlave *i2c)
>>> +{
>>> +    Tca6416State *s = TCA6416(i2c);
>>> +    uint8_t ret;
>>> +
>>> +    ret = s->regs[s->addr];
>>> +    trace_tca6416_read(ret);
>>> +    return ret;
>>> +}
>>> +
>>> +static int tca6416_write(I2CSlave *i2c, uint8_t data)
>>> +{
>>> +    Tca6416State *s = TCA6416(i2c);
>>> +
>>> +    trace_tca6416_write(data);
>>> +    if (s->state == ADDRESSING) {
>>> +        s->addr = data;
>>
>> I suppose HW masks here.
>>
>>           s->addr = data & 0xf;
>>
>>> +    } else {
>>> +        s->regs[s->addr] = data;
>>
>> (otherwise this could overflow).
>>
>> So this device isn't doing anything actually (I'd have
>> expected 1 IRQ and 16 GPIO lines). What is the point,
>> at least in this state?
>>
>>> +    }
>>> +
>>> +    return 0;
>>> +}
>>> +
>>> +static void tca6416_realize(DeviceState *dev, Error **errp)
>>> +{
>>> +    Tca6416State *s = TCA6416(dev);
>>> +
>>
>> Missing:
>>
>>        s->regs[OUT_PORT0] = 0xff;
>>        s->regs[OUT_PORT1] = 0xff;
>>        s->regs[POL_INV0] = 0x00;
>>        s->regs[POL_INV1] = 0x00;
>>
>>> +    s->regs[CONF_PORT0] = 0xFF;
>>> +    s->regs[CONF_PORT1] = 0xFF;
>>
>> Style is 0xff.
>>
>> That said, this is not a REALIZE but RESET handler.
>>
>>> +}
>>> +
>>> +static int tca6416_event(I2CSlave *i2c, enum i2c_event event)
>>> +{
>>> +    Tca6416State *s = TCA6416(i2c);
>>> +
>>> +    switch (event) {
>>> +    case I2C_START_SEND:
>>> +        s->state = ADDRESSING;
>>> +        break;
>>> +    default:
>>> +         s->state = ADDR_DONE;
>>> +    };
>>> +    return 0;
>>> +}
>>> +
>>> +static void tca6416_class_init(ObjectClass *klass, void *data)
>>> +{
>>> +    DeviceClass *dc = DEVICE_CLASS(klass);
>>> +    I2CSlaveClass *k = I2C_SLAVE_CLASS(klass);
>>> +
>>> +    dc->realize = tca6416_realize;
>>
>> (tca6416_realize is a reset handler).
>>
>> Please complete:
>>
>>        dc->desc = "TCA6416 I/O Expander";
>>        set_bit(DEVICE_CATEGORY_MISC, dc->categories);
>>
>> No migration state?
>>
>>> +    k->recv = tca6416_read;
>>> +    k->send = tca6416_write;
>>> +    k->event = tca6416_event;
>>> +}> +
>>> +static const TypeInfo tca6416_types[] = {
>>> +    {
>>> +        .name = TYPE_TCA6416,
>>> +        .parent = TYPE_I2C_SLAVE,
>>> +        .class_init = tca6416_class_init,
>>> +        .instance_size = sizeof(Tca6416State),
>>> +    }
>>> +};
>>> +
>>> +DEFINE_TYPES(tca6416_types)
>>> diff --git a/hw/gpio/Kconfig b/hw/gpio/Kconfig
>>> index c423e10f59..a240cf2de2 100644
>>> --- a/hw/gpio/Kconfig
>>> +++ b/hw/gpio/Kconfig
>>> @@ -20,5 +20,10 @@ config PCF8574
>>>        bool
>>>        depends on I2C
>>>    +config TCA6416
>>> +    bool
>>> +    depends on I2C
>>> +    default y if I2C_DEVICES
>>> +
>>>    config ZAURUS_SCOOP
>>>        bool
>>> diff --git a/hw/gpio/meson.build b/hw/gpio/meson.build
>>> index 74840619c0..b3ff7c7460 100644
>>> --- a/hw/gpio/meson.build
>>> +++ b/hw/gpio/meson.build
>>> @@ -18,3 +18,4 @@ system_ss.add(when: 'CONFIG_STM32L4X5_SOC', if_true: files('stm32l4x5_gpio.c'))
>>>    system_ss.add(when: 'CONFIG_ASPEED_SOC', if_true: files('aspeed_gpio.c'))
>>>    system_ss.add(when: 'CONFIG_SIFIVE_GPIO', if_true: files('sifive_gpio.c'))
>>>    system_ss.add(when: 'CONFIG_PCF8574', if_true: files('pcf8574.c'))
>>> +system_ss.add(when: 'CONFIG_TCA6416', if_true: files('tca6416.c'))
>>> diff --git a/hw/gpio/trace-events b/hw/gpio/trace-events
>>> index cea896b28f..6724f2efb8 100644
>>> --- a/hw/gpio/trace-events
>>> +++ b/hw/gpio/trace-events
>>> @@ -46,3 +46,7 @@ stm32l4x5_gpio_read(char *gpio, uint64_t addr) "GPIO%s addr: 0x%" PRIx64 " "
>>>    stm32l4x5_gpio_write(char *gpio, uint64_t addr, uint64_t data) "GPIO%s addr: 0x%" PRIx64 " val: 0x%" PRIx64 ""
>>>    stm32l4x5_gpio_update_idr(char *gpio, uint32_t old_idr, uint32_t new_idr) "GPIO%s from: 0x%x to: 0x%x"
>>>    stm32l4x5_gpio_pins(char *gpio, uint16_t disconnected, uint16_t high) "GPIO%s disconnected pins: 0x%x levels: 0x%x"
>>> +
>>> +# tca6416.c
>>> +tca6416_write(uint8_t value) "0x%02x"
>>
>> "wr 0x%02x"
>>
>>> +tca6416_read(uint8_t value) "0x%02x"
>>
>> "rd ..."
>>
>> Regards,
>>
>> Phil.

