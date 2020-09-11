Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp258107lfq;
        Fri, 11 Sep 2020 13:12:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwW2+Izm0rBCpyUuynm7elL/RYJQvx9sPgMtk878kmf7D4z130NdTsngvnI9lyQ96kdpy5W
X-Received: by 2002:a05:6902:72b:: with SMTP id l11mr4739552ybt.505.1599855159401;
        Fri, 11 Sep 2020 13:12:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1599855159; cv=none;
        d=google.com; s=arc-20160816;
        b=ZafYZRLlQAc2hO+D5fZDQrz7U7QljptUvk5ecHuLiKlj7+c5ejw9AjmYgYkT8H1hB5
         I6DKHBv2c3uZlYcm8e7KIH6KX1KVxz086WAVOGzJ7fEaoO7mp7jdGZPx/zrBUHpS7rBm
         cHAsrF5ltTEmbaxtRDn9Do1AwxOa457yEOynuyxUcNWxx6mM3h+aDKdepccEqPMENL85
         L3QAkB13HKvR5Ta23sXF2WMhT7yzW7rUiSSu+W5GM1+0/8n6b5aMslcLY/QMhCLoKVDG
         PG2HIlN6OOGbgw5Ru2Q3Pj/EBzW9Zee7dpm/WTBgIjHYasDfvilghLusfJjcoXCpJB1U
         G7DQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=UMNnS6kf9hj0OrwbS9qBPoULwxCa1W4WiYFnh2Eo86E=;
        b=tB7Ds1mpUKiUsvnOp0rwqSaWoNhlreaFsNfdfhV1930W4rNGzOtLqcNVxisJpBnfVP
         gfDZP0HFUp+qC68S7kU59PkmV+uYWJcwCHW/HMudbW/g4wZTwcQ1ZuGk/UMtANTNBuho
         eD1QYf3nbTRFuUVxg9EP177S6IOLIU7PNqDYn2sbEtmA/kf05Ac9W+ukc7+JRn7kFjwq
         CD3hy0TE6d89/xje+sa7W1AveSEjuN79byKpwv4h4i1adk0gwSPYQepPkwl2TcT+hHq4
         KsGb9ik6X68fZSmyattZW9zT0KqXboVMyhXx3qt/ZvF5p5kS6h0DiRzfXFfvCH6ihTQx
         sV/A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b="iT/TBXe8";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 139si3058488ybl.218.2020.09.11.13.12.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 11 Sep 2020 13:12:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b="iT/TBXe8";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:41472 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kGpPS-0004Ph-KT
	for alex.bennee@linaro.org; Fri, 11 Sep 2020 16:12:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luc.michel@greensocs.com>)
 id 1kGpOv-0004PC-PI; Fri, 11 Sep 2020 16:12:05 -0400
Received: from beetle.greensocs.com ([5.135.226.135]:33660)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luc.michel@greensocs.com>)
 id 1kGpOt-0005rt-7D; Fri, 11 Sep 2020 16:12:05 -0400
Received: from [172.17.10.18] (unknown [172.17.10.18])
 by beetle.greensocs.com (Postfix) with ESMTPSA id 9792621C31;
 Fri, 11 Sep 2020 20:11:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1599855120;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UMNnS6kf9hj0OrwbS9qBPoULwxCa1W4WiYFnh2Eo86E=;
 b=iT/TBXe8Emvj7ZRIUCtXtZjzT2HmqnNTRVS+jRYqFf+kp9EehrdCk+6G4VfJ2YFexddS2q
 L/ppMmRkAURevzUlfPvO7x16/v+NVlIMCiwCWezXKNNAu+d7KG8bYYC02VbSYWQKo7Y1//
 sPVBJg+mjNJPnUYcJ3ZTe/Sj37Kc6rs=
Subject: Re: [PATCH v5 5/7] hw/misc/mps2-fpgaio: Use the LED device
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20200910205429.727766-1-f4bug@amsat.org>
 <20200910205429.727766-6-f4bug@amsat.org>
From: Luc Michel <luc.michel@greensocs.com>
Message-ID: <5630d710-09cb-bc8a-a67d-b9f01308fb12@greensocs.com>
Date: Fri, 11 Sep 2020 22:12:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200910205429.727766-6-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=5.135.226.135;
 envelope-from=luc.michel@greensocs.com; helo=beetle.greensocs.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/11 15:41:15
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.469,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Andrew Jeffery <andrew@aj.id.au>,
 qemu-arm@nongnu.org, =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Andrzej Zaborowski <balrogg@gmail.com>,
 Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: xY2F3RSC+bmH

Hi Phil,

On 9/10/20 10:54 PM, Philippe Mathieu-Daudé wrote:
> Per the 'ARM MPS2 and MPS2+ FPGA Prototyping Boards Technical
> Reference Manual' (100112_0200_07_en):
> 
>    2.1  Overview of the MPS2 and MPS2+ hardware
> 
>         The MPS2 and MPS2+ FPGA Prototyping Boards contain the
>         following components and interfaces:
> 
>         * User switches and user LEDs:
> 
>           - Two green LEDs and two push buttons that connect to
>             the FPGA.
>           - Eight green LEDs and one 8-way dip switch that connect
>             to the MCC.
> 
> Add the 2 LEDs connected to the FPGA.
> 
> This remplaces the 'mps2_fpgaio_leds' trace events by the generic
replaces
> 'led_set_intensity' event.

If I'm not mistaken the LED device being a DEVICE and not a 
SYS_BUS_DEVICE, it needs to be manually reset. So you probably need to 
reset it in mps2_fpgaio_reset so it doesn't get out of sync on system reset.

-- 
Luc

> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>   include/hw/misc/mps2-fpgaio.h |  2 ++
>   hw/misc/mps2-fpgaio.c         | 19 ++++++++++++++-----
>   hw/misc/Kconfig               |  1 +
>   hw/misc/trace-events          |  1 -
>   4 files changed, 17 insertions(+), 6 deletions(-)
> 
> diff --git a/include/hw/misc/mps2-fpgaio.h b/include/hw/misc/mps2-fpgaio.h
> index 69e265cd4b2..901880cc3a7 100644
> --- a/include/hw/misc/mps2-fpgaio.h
> +++ b/include/hw/misc/mps2-fpgaio.h
> @@ -22,6 +22,7 @@
>   #define MPS2_FPGAIO_H
>   
>   #include "hw/sysbus.h"
> +#include "hw/misc/led.h"
>   
>   #define TYPE_MPS2_FPGAIO "mps2-fpgaio"
>   #define MPS2_FPGAIO(obj) OBJECT_CHECK(MPS2FPGAIO, (obj), TYPE_MPS2_FPGAIO)
> @@ -32,6 +33,7 @@ typedef struct {
>   
>       /*< public >*/
>       MemoryRegion iomem;
> +    LEDState *led[2];
>   
>       uint32_t led0;
>       uint32_t prescale;
> diff --git a/hw/misc/mps2-fpgaio.c b/hw/misc/mps2-fpgaio.c
> index 2f3fbeef348..86ca78eb235 100644
> --- a/hw/misc/mps2-fpgaio.c
> +++ b/hw/misc/mps2-fpgaio.c
> @@ -24,6 +24,7 @@
>   #include "migration/vmstate.h"
>   #include "hw/registerfields.h"
>   #include "hw/misc/mps2-fpgaio.h"
> +#include "hw/misc/led.h"
>   #include "hw/qdev-properties.h"
>   #include "qemu/timer.h"
>   
> @@ -176,12 +177,9 @@ static void mps2_fpgaio_write(void *opaque, hwaddr offset, uint64_t value,
>   
>       switch (offset) {
>       case A_LED0:
> -        /* LED bits [1:0] control board LEDs. We don't currently have
> -         * a mechanism for displaying this graphically, so use a trace event.
> -         */
> -        trace_mps2_fpgaio_leds(value & 0x02 ? '*' : '.',
> -                               value & 0x01 ? '*' : '.');
>           s->led0 = value & 0x3;
> +        led_set_state(s->led[0], value & 0x01);
> +        led_set_state(s->led[1], value & 0x02);
>           break;
>       case A_PRESCALE:
>           resync_counter(s);
> @@ -251,6 +249,16 @@ static void mps2_fpgaio_init(Object *obj)
>       sysbus_init_mmio(sbd, &s->iomem);
>   }
>   
> +static void mps2_fpgaio_realize(DeviceState *dev, Error **errp)
> +{
> +    MPS2FPGAIO *s = MPS2_FPGAIO(dev);
> +
> +    s->led[0] = led_create_simple(OBJECT(dev), GPIO_POLARITY_ACTIVE_HIGH,
> +                                  LED_COLOR_GREEN, "USERLED0");
> +    s->led[1] = led_create_simple(OBJECT(dev), GPIO_POLARITY_ACTIVE_HIGH,
> +                                  LED_COLOR_GREEN, "USERLED1");
> +}
> +
>   static bool mps2_fpgaio_counters_needed(void *opaque)
>   {
>       /* Currently vmstate.c insists all subsections have a 'needed' function */
> @@ -299,6 +307,7 @@ static void mps2_fpgaio_class_init(ObjectClass *klass, void *data)
>       DeviceClass *dc = DEVICE_CLASS(klass);
>   
>       dc->vmsd = &mps2_fpgaio_vmstate;
> +    dc->realize = mps2_fpgaio_realize;
>       dc->reset = mps2_fpgaio_reset;
>       device_class_set_props(dc, mps2_fpgaio_properties);
>   }
> diff --git a/hw/misc/Kconfig b/hw/misc/Kconfig
> index 5c151fa3a83..0cecad45aad 100644
> --- a/hw/misc/Kconfig
> +++ b/hw/misc/Kconfig
> @@ -93,6 +93,7 @@ config MIPS_ITU
>   
>   config MPS2_FPGAIO
>       bool
> +    select LED
>   
>   config MPS2_SCC
>       bool
> diff --git a/hw/misc/trace-events b/hw/misc/trace-events
> index 89d15f05f9a..43b9e0cf250 100644
> --- a/hw/misc/trace-events
> +++ b/hw/misc/trace-events
> @@ -93,7 +93,6 @@ mps2_scc_cfg_read(unsigned function, unsigned device, uint32_t value) "MPS2 SCC
>   mps2_fpgaio_read(uint64_t offset, uint64_t data, unsigned size) "MPS2 FPGAIO read: offset 0x%" PRIx64 " data 0x%" PRIx64 " size %u"
>   mps2_fpgaio_write(uint64_t offset, uint64_t data, unsigned size) "MPS2 FPGAIO write: offset 0x%" PRIx64 " data 0x%" PRIx64 " size %u"
>   mps2_fpgaio_reset(void) "MPS2 FPGAIO: reset"
> -mps2_fpgaio_leds(char led1, char led0) "MPS2 FPGAIO LEDs: %c%c"
>   
>   # msf2-sysreg.c
>   msf2_sysreg_write(uint64_t offset, uint32_t val, uint32_t prev) "msf2-sysreg write: addr 0x%08" PRIx64 " data 0x%" PRIx32 " prev 0x%" PRIx32
> 
