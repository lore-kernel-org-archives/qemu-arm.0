Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp261411lfq;
        Fri, 11 Sep 2020 13:17:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyg/cQSsK3N9XOkASZTCBdrKNKYuNCSyZN0sO8NT7nbWNUuSL4kgkErta53QqpP6ATKx1pL
X-Received: by 2002:a37:545:: with SMTP id 66mr3093531qkf.338.1599855454869;
        Fri, 11 Sep 2020 13:17:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1599855454; cv=none;
        d=google.com; s=arc-20160816;
        b=nDV9ImrYe5LSAH4JK2wHnhCLOvFS45EmVhcSMUt4k9BxSOXM4v3nYJqcSyqQRJDK21
         PfASpDePywgDenQtntC0fb1TG592A5cy4aH1PA6LL6BlPaZfm3KVO4/uic+uxJuRnk2T
         7wKazTd0Or12xuy2Vg/BIT/VZLeTKklst2zhDfpqF5z/iuMmGMh320WdI0VXXgOuXeqB
         Q4eR5DmRsdNlW6ZHCzSc7OPL3uTU/QgQXaObaZM/gkiEGgXFe3x29UEMRCQpj9CWxVIK
         Mn8Asagn2xmv3yBJaE8AVP0qErSe+r/mx/hL+MuYB+OC8JnmQBv+3Njum9KrJathRBrd
         wPIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=i88TfxeGEFU+vElX5ESO4RbOvSDOvcZGyygm/y17c4k=;
        b=GNrq0MEKQ+F93ZYMQGTPAP8NdtVvB0jnbLwDzIL8AI4EoGATpNUUNY0itrkCUt1fwO
         DTT/hYb0m7xHWKUl3HISSRwjgzrc6Yx6ygZPVm9xolmtcznKLfdNam0XccR1H2r3RXJa
         BOt19yU68twYdQTMU4COB3uwAqsy9on2b+Zvi60vPUArzu63sTPOp9Ov4mbSjP9Byk3V
         NofHTHD+USwZu+UAyP4zBgrMfwAJ1P/HNzuEoliaLa9T9xnEV8gCJtlEQnyfQWO3+dAj
         C/O+kua2z6qlnZInkUEHRqWkBKoZP3qPXcUBzZEelaTwZrlQ5PhYcXmnWDvKj6Oj7gbm
         E1CQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=Bz8oLOU0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n5si1985830qtv.365.2020.09.11.13.17.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 11 Sep 2020 13:17:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=Bz8oLOU0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:45168 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kGpUE-0006Gq-5P
	for alex.bennee@linaro.org; Fri, 11 Sep 2020 16:17:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54470)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luc.michel@greensocs.com>)
 id 1kGpRY-0005B9-H3; Fri, 11 Sep 2020 16:14:48 -0400
Received: from beetle.greensocs.com ([5.135.226.135]:33794)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luc.michel@greensocs.com>)
 id 1kGpRW-00067u-FF; Fri, 11 Sep 2020 16:14:48 -0400
Received: from [172.17.10.18] (unknown [172.17.10.18])
 by beetle.greensocs.com (Postfix) with ESMTPSA id D5BE321C1F;
 Fri, 11 Sep 2020 20:14:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1599855284;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=i88TfxeGEFU+vElX5ESO4RbOvSDOvcZGyygm/y17c4k=;
 b=Bz8oLOU0j7dQVPEt9hMostWx1smZmYbOl1XJIp86G3hLZBZLTig0CDAcSPu1mwJ/owTTcR
 hLTSvXc2GwYjmnacLXQbesQJGXDXHgee+L7CIvdldZi2JUHFMUQ6ditG+sVSPJwbCgrDjW
 H5T3SeRmNlzdhLBFVexfCEmImLtemoI=
Subject: Re: [PATCH v5 6/7] hw/misc/mps2-scc: Use the LED device
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20200910205429.727766-1-f4bug@amsat.org>
 <20200910205429.727766-7-f4bug@amsat.org>
From: Luc Michel <luc.michel@greensocs.com>
Message-ID: <6d07fc49-b86b-4ec6-66de-470515b12487@greensocs.com>
Date: Fri, 11 Sep 2020 22:15:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200910205429.727766-7-f4bug@amsat.org>
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
X-TUID: NQULykpOAPiN

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
> Add the 8 LEDs connected to the MCC.
> 
> This remplaces the 'mps2_scc_leds' trace events by the generic
replaces
> 'led_set_intensity' event.

Same as patch 5, I think you need to reset your LEDs in mps2_scc_reset.

Also, see below for a superfluous new line.

> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
> https://youtu.be/l9kD70uPchk?t=288
> ---
>   include/hw/misc/mps2-scc.h |  2 ++
>   hw/misc/mps2-scc.c         | 25 ++++++++++++++-----------
>   hw/misc/Kconfig            |  1 +
>   hw/misc/trace-events       |  1 -
>   4 files changed, 17 insertions(+), 12 deletions(-)
> 
> diff --git a/include/hw/misc/mps2-scc.h b/include/hw/misc/mps2-scc.h
> index 7045473788b..8542f384227 100644
> --- a/include/hw/misc/mps2-scc.h
> +++ b/include/hw/misc/mps2-scc.h
> @@ -13,6 +13,7 @@
>   #define MPS2_SCC_H
>   
>   #include "hw/sysbus.h"
> +#include "hw/misc/led.h"
>   
>   #define TYPE_MPS2_SCC "mps2-scc"
>   #define MPS2_SCC(obj) OBJECT_CHECK(MPS2SCC, (obj), TYPE_MPS2_SCC)
> @@ -25,6 +26,7 @@ typedef struct {
>   
>       /*< public >*/
>       MemoryRegion iomem;
> +    LEDState *led[8];
>   
>       uint32_t cfg0;
>       uint32_t cfg1;
> diff --git a/hw/misc/mps2-scc.c b/hw/misc/mps2-scc.c
> index 9d0909e7b35..745505b849d 100644
> --- a/hw/misc/mps2-scc.c
> +++ b/hw/misc/mps2-scc.c
> @@ -20,11 +20,13 @@
>   #include "qemu/osdep.h"
>   #include "qemu/log.h"
>   #include "qemu/module.h"
> +#include "qemu/bitops.h"
>   #include "trace.h"
>   #include "hw/sysbus.h"
>   #include "migration/vmstate.h"
>   #include "hw/registerfields.h"
>   #include "hw/misc/mps2-scc.h"
> +#include "hw/misc/led.h"
>   #include "hw/qdev-properties.h"
>   
>   REG32(CFG0, 0)
> @@ -152,18 +154,10 @@ static void mps2_scc_write(void *opaque, hwaddr offset, uint64_t value,
>           s->cfg0 = value;
>           break;
>       case A_CFG1:
> -        /* CFG1 bits [7:0] control the board LEDs. We don't currently have
> -         * a mechanism for displaying this graphically, so use a trace event.
> -         */
> -        trace_mps2_scc_leds(value & 0x80 ? '*' : '.',
> -                            value & 0x40 ? '*' : '.',
> -                            value & 0x20 ? '*' : '.',
> -                            value & 0x10 ? '*' : '.',
> -                            value & 0x08 ? '*' : '.',
> -                            value & 0x04 ? '*' : '.',
> -                            value & 0x02 ? '*' : '.',
> -                            value & 0x01 ? '*' : '.');
>           s->cfg1 = value;
> +        for (size_t i = 0; i < ARRAY_SIZE(s->led); i++) {
> +            led_set_state(s->led[i], extract32(value, i, 1));
> +        }
>           break;
>       case A_CFGDATA_OUT:
>           s->cfgdata_out = value;
> @@ -245,10 +239,19 @@ static void mps2_scc_init(Object *obj)
>   
>       memory_region_init_io(&s->iomem, obj, &mps2_scc_ops, s, "mps2-scc", 0x1000);
>       sysbus_init_mmio(sbd, &s->iomem);
> +
Superfluous new line.

-- 
Luc
>   }
>   
>   static void mps2_scc_realize(DeviceState *dev, Error **errp)
>   {
> +    MPS2SCC *s = MPS2_SCC(dev);
> +
> +    for (size_t i = 0; i < ARRAY_SIZE(s->led); i++) {
> +        char *name = g_strdup_printf("SCC LED%zu", i);
> +        s->led[i] = led_create_simple(OBJECT(dev), GPIO_POLARITY_ACTIVE_HIGH,
> +                                      LED_COLOR_GREEN, name);
> +        g_free(name);
> +    }
>   }
>   
>   static const VMStateDescription mps2_scc_vmstate = {
> diff --git a/hw/misc/Kconfig b/hw/misc/Kconfig
> index 0cecad45aad..7557a3e7b46 100644
> --- a/hw/misc/Kconfig
> +++ b/hw/misc/Kconfig
> @@ -97,6 +97,7 @@ config MPS2_FPGAIO
>   
>   config MPS2_SCC
>       bool
> +    select LED
>   
>   config TZ_MPC
>       bool
> diff --git a/hw/misc/trace-events b/hw/misc/trace-events
> index 43b9e0cf250..a620a358feb 100644
> --- a/hw/misc/trace-events
> +++ b/hw/misc/trace-events
> @@ -85,7 +85,6 @@ aspeed_scu_write(uint64_t offset, unsigned size, uint32_t data) "To 0x%" PRIx64
>   mps2_scc_read(uint64_t offset, uint64_t data, unsigned size) "MPS2 SCC read: offset 0x%" PRIx64 " data 0x%" PRIx64 " size %u"
>   mps2_scc_write(uint64_t offset, uint64_t data, unsigned size) "MPS2 SCC write: offset 0x%" PRIx64 " data 0x%" PRIx64 " size %u"
>   mps2_scc_reset(void) "MPS2 SCC: reset"
> -mps2_scc_leds(char led7, char led6, char led5, char led4, char led3, char led2, char led1, char led0) "MPS2 SCC LEDs: %c%c%c%c%c%c%c%c"
>   mps2_scc_cfg_write(unsigned function, unsigned device, uint32_t value) "MPS2 SCC config write: function %d device %d data 0x%" PRIx32
>   mps2_scc_cfg_read(unsigned function, unsigned device, uint32_t value) "MPS2 SCC config read: function %d device %d data 0x%" PRIx32
>   
> 
