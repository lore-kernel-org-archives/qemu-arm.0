Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp2913378lfm;
        Sun, 21 Jun 2020 23:48:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy2bOrYlxpfcAdZfr5nv5bsfJY1qUMiURvSGM4X2fkPzi1ux92y9XCDoMBygzG/JW9o1ffs
X-Received: by 2002:a25:3450:: with SMTP id b77mr24465739yba.197.1592808501143;
        Sun, 21 Jun 2020 23:48:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592808501; cv=none;
        d=google.com; s=arc-20160816;
        b=mLP5rdZVnQHw7kuGH+EvEoL/7xoPo43y7Sihc4VQCkRE/YIg783UpdgdtssTNhv0YK
         40FtqTAegSsoUThTa/QJCu1SC53LaR72jzilM0zfH6ucpfoVPEjM1phRcrab9/s0Q+PW
         2Xr3s4tdi0n5KpvxpiT2EvQr0AlbkL6iXoXTFahlNK/F92z37DyV0tXVN7gaDTVTxS8b
         FxyCYzpLQF61BlPEhmHPkTRzp1U0+cWDA0kUu8qOHfxzPnsZyWQ7FhHKxl6TmppoWQtO
         vZQgZFbU1df8kdcBStRutR9E4PpIrsPfUvwT+6QbB2ga/IVsua6oRjCrMiZC/gitQx22
         ri7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=Xi5p5metTTEGCISs7K9JwkzIRvhhDTl17ds7XNIYo0Y=;
        b=pq5ciV774udMTEHZ+Q4FhR1nJBtOG+L7a17O6kd7n+A7j4+XhZZ8dbP5T01elNFR/W
         KOJTT/bUHQfeLHFU8MnBbg1vN1Ybl3Etnxqo7viJeSvNwqFg+UVyLcBMTjHAU4USdHxy
         P66LQmwv3F4OyWBIwT7pt0cpUVrsMUUczj6q38siI7dg8sV9asM/sXwe6Pac6ieQnRun
         fUPuR7CNehYl1uA7mRPmPwj8nDmUbdNaRQIy2MaTWAYu7fqpD9CLtV+JaArxnRkkExJ0
         n5BevT0zZd1Tbx5+95Dj5FQSEJBx3+f3/FjO+RQRJVOfVA6yvZM1QMOV2A1Lz/zJxaZe
         e6Yg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d31si13924286yba.474.2020.06.21.23.48.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 21 Jun 2020 23:48:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:55908 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jnGFg-00013H-HT
	for alex.bennee@linaro.org; Mon, 22 Jun 2020 02:48:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40320)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1jnGFZ-00012J-4W
 for qemu-arm@nongnu.org; Mon, 22 Jun 2020 02:48:13 -0400
Received: from 17.mo7.mail-out.ovh.net ([188.165.35.227]:43433)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1jnGFW-0001vb-T3
 for qemu-arm@nongnu.org; Mon, 22 Jun 2020 02:48:12 -0400
Received: from player793.ha.ovh.net (unknown [10.110.103.169])
 by mo7.mail-out.ovh.net (Postfix) with ESMTP id B7DEA16D5F3
 for <qemu-arm@nongnu.org>; Mon, 22 Jun 2020 08:48:08 +0200 (CEST)
Received: from kaod.org (lfbn-tou-1-921-245.w86-210.abo.wanadoo.fr
 [86.210.152.245]) (Authenticated sender: clg@kaod.org)
 by player793.ha.ovh.net (Postfix) with ESMTPSA id 1A268139F96AF;
 Mon, 22 Jun 2020 06:47:59 +0000 (UTC)
Authentication-Results: garm.ovh; auth=pass
 (GARM-97G002b68c1cf3-1eae-4278-ac23-8ee7fc1be797,D5B34DF2F1998B4AFDB97B5973F1BB92C24DD330)
 smtp.auth=clg@kaod.org
Subject: Re: [PATCH v4 5/8] hw/misc/pca9552: Trace GPIO High/Low events
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20200620225854.31160-1-f4bug@amsat.org>
 <20200620225854.31160-6-f4bug@amsat.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <9e93c3d7-0896-07fa-3129-2f0142999ab5@kaod.org>
Date: Mon, 22 Jun 2020 08:47:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200620225854.31160-6-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 6064096898674887595
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduhedrudekuddguddtvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefuvfhfhffkffgfgggjtgfgsehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepgeeihfekfeduiefhhfdvleduheduleekgedtieelgfehfffhveeikeduhfffgeehnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucfkpheptddrtddrtddrtddpkeeirddvuddtrdduhedvrddvgeehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepphhlrgihvghrjeelfedrhhgrrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehqvghmuhdqrghrmhesnhhonhhgnhhurdhorhhg
Received-SPF: pass client-ip=188.165.35.227; envelope-from=clg@kaod.org;
 helo=17.mo7.mail-out.ovh.net
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/22 02:48:08
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Corey Minyard <cminyard@mvista.com>,
 qemu-arm@nongnu.org, Joel Stanley <joel@jms.id.au>,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 2/iojG5nWkam

On 6/21/20 12:58 AM, Philippe Mathieu-Daudé wrote:
> Add a trivial representation of the PCA9552 GPIOs.
> 
> Example booting obmc-phosphor-image:
> 
>   $ qemu-system-arm -M witherspoon-bmc -trace pca9552_gpio_status
>   1592689902.327837:pca9552_gpio_status pca-unspecified GPIOs 0-15 [*...............]
>   1592689902.329934:pca9552_gpio_status pca-unspecified GPIOs 0-15 [**..............]
>   1592689902.330717:pca9552_gpio_status pca-unspecified GPIOs 0-15 [***.............]
>   1592689902.331431:pca9552_gpio_status pca-unspecified GPIOs 0-15 [****............]
>   1592689902.332163:pca9552_gpio_status pca-unspecified GPIOs 0-15 [****.........*..]
>   1592689902.332888:pca9552_gpio_status pca-unspecified GPIOs 0-15 [****.........**.]
>   1592689902.333629:pca9552_gpio_status pca-unspecified GPIOs 0-15 [****.........***]
>   1592690032.793289:pca9552_gpio_status pca-unspecified GPIOs 0-15 [****.........*.*]
>   1592690033.303163:pca9552_gpio_status pca-unspecified GPIOs 0-15 [****.........***]
>   1592690033.812962:pca9552_gpio_status pca-unspecified GPIOs 0-15 [****.........*.*]
>   1592690034.323234:pca9552_gpio_status pca-unspecified GPIOs 0-15 [****.........***]
>   1592690034.832922:pca9552_gpio_status pca-unspecified GPIOs 0-15 [****.........*.*]
> 
> We notice the GPIO #14 (front-power LED) starts to blink.
> 
> This LED is described in the witherspoon device-tree [*]:
> 
>   front-power {
>       retain-state-shutdown;
>       default-state = "keep";
>       gpios = <&pca0 14 GPIO_ACTIVE_LOW>;
>   };
> 
> [*] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts?id=b1f9be9392f0#n140
> 
> Suggested-by: Cédric Le Goater <clg@kaod.org>
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  include/hw/misc/pca9552.h |  1 +
>  hw/misc/pca9552.c         | 29 +++++++++++++++++++++++++++++
>  hw/misc/trace-events      |  3 +++
>  3 files changed, 33 insertions(+)
> 
> diff --git a/include/hw/misc/pca9552.h b/include/hw/misc/pca9552.h
> index c5be7f1c5e..755be2e8e5 100644
> --- a/include/hw/misc/pca9552.h
> +++ b/include/hw/misc/pca9552.h
> @@ -26,6 +26,7 @@ typedef struct PCA9552State {
>      uint8_t pointer;
>  
>      uint8_t regs[PCA9552_NR_REGS];
> +    uint16_t pins_status; /* Holds latest INPUT0 & INPUT1 status */

Hmm, that is an extra state redundant with regs.

>      uint8_t max_reg;
>      char *description; /* For debugging purpose only */
>      uint8_t nr_leds;
> diff --git a/hw/misc/pca9552.c b/hw/misc/pca9552.c
> index 54ccdcf6d4..f0d435e310 100644
> --- a/hw/misc/pca9552.c
> +++ b/hw/misc/pca9552.c
> @@ -12,12 +12,14 @@
>  #include "qemu/osdep.h"
>  #include "qemu/log.h"
>  #include "qemu/module.h"
> +#include "qemu/bitops.h"
>  #include "hw/qdev-properties.h"
>  #include "hw/misc/pca9552.h"
>  #include "hw/misc/pca9552_regs.h"
>  #include "migration/vmstate.h"
>  #include "qapi/error.h"
>  #include "qapi/visitor.h"
> +#include "trace.h"
>  
>  #define PCA9552_LED_ON   0x0
>  #define PCA9552_LED_OFF  0x1
> @@ -34,6 +36,32 @@ static uint8_t pca9552_pin_get_config(PCA9552State *s, int pin)
>      return extract32(s->regs[reg], shift, 2);
>  }
>  
> +static void pca9552_display_pins_status(PCA9552State *s)
> +{
> +    uint16_t pins_status, pins_changed;
> +    int i;
> +
> +    pins_status = (s->regs[PCA9552_INPUT1] << 8) | s->regs[PCA9552_INPUT0];
> +    pins_changed = s->pins_status ^ pins_status;
> +    if (!pins_changed) {
> +        return;
> +    }
> +    s->pins_status = pins_status;

It's nice to have but it won't kill puppies if we recompute the 
state each time when traces are on. 

> +    if (trace_event_get_state_backends(TRACE_PCA9552_GPIO_STATUS)) {
> +        char buf[PCA9552_PIN_COUNT + 1];
> +
> +        for (i = 0; i < s->nr_leds; i++) {
> +            if (extract32(pins_status, i, 1)) {
> +                buf[i] = '*';
> +            } else {
> +                buf[i] = '.';
> +            }
> +        }
> +        buf[i] = '\0';
> +        trace_pca9552_gpio_status(s->description, buf);
> +    }
> +}
> +
>  static void pca9552_update_pin_input(PCA9552State *s)
>  {
>      int i;
> @@ -57,6 +85,7 @@ static void pca9552_update_pin_input(PCA9552State *s)
>              break;
>          }

and we could test TRACE_PCA9552_GPIO_STATUS here : 
>      }
> +    pca9552_display_pins_status(s);
>  }
>  
>  static uint8_t pca9552_read(PCA9552State *s, uint8_t reg)
> diff --git a/hw/misc/trace-events b/hw/misc/trace-events
> index 5561746866..7630e59652 100644
> --- a/hw/misc/trace-events
> +++ b/hw/misc/trace-events
> @@ -206,3 +206,6 @@ via1_rtc_cmd_pram_sect_write(int sector, int offset, int addr, int value) "secto
>  # grlib_ahb_apb_pnp.c
>  grlib_ahb_pnp_read(uint64_t addr, uint32_t value) "AHB PnP read addr:0x%03"PRIx64" data:0x%08x"
>  grlib_apb_pnp_read(uint64_t addr, uint32_t value) "APB PnP read addr:0x%03"PRIx64" data:0x%08x"
> +
> +# pca9552.c
> +pca9552_gpio_status(const char *description, const char *buf) "%s GPIOs 0-15 [%s]"
> 

