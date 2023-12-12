Received: by 2002:a17:906:535b:b0:a20:43fc:1f40 with SMTP id j27csp952399ejo;
        Tue, 12 Dec 2023 06:50:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGPQ3eqI4BkgR1p1sEWLiYo/AtaQVRF2iuwRe60ByIt2zWrwXBs8OdvwakiHO/sJYgmTUl1
X-Received: by 2002:a05:6122:4d18:b0:4b2:d42c:2d67 with SMTP id fi24-20020a0561224d1800b004b2d42c2d67mr4883719vkb.32.1702392636362;
        Tue, 12 Dec 2023 06:50:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702392636; cv=none;
        d=google.com; s=arc-20160816;
        b=XcQr3hTf8F2pmO2uHPvjgMNOay7ny6uEFO588FDyLu7bz9LU2gnqoopom7gNfVtdty
         02L11mE9E9alQIxt5r9m522QyEgsKiNUaiQgnLMEl6ER07D2RDRLE75DmqYwZIzx0il6
         j7rcorM5MfZ2lPfp7r7lSh9dFFF2IlGhr5Vk9+fKp15ejRKFgu7m7TumnQzaLxSgOWoh
         z3GriRdBJqvyku3TLEhuruUUPQKrBB1BvuWG2GgK0zkhyY7bPj0WOpVdYnJ0zTbjQ165
         8wnCU4pKpR7mjtMt6pn2ua3QhXhme2hhb8XRCe5liADUuFqtu/bMknDTEJd+EnRSTmcl
         KtDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:content-language:references:cc:to:subject:from
         :user-agent:mime-version:date:message-id;
        bh=xsGr9viYe194ZU6QvVDA4S//9P4Z0j5IyHQmCn81gf4=;
        fh=XjeWluILof3f/t2RMU9x5kUMQdajlxelk3b+5+95bRU=;
        b=FgghzmA1OuRIHFmw+qZ56GzTmXJHrWUxeB4cPJ3pOup0Bp8g4ZtXpTHTfqFjx5QDP8
         dXTYzYkIKHUWjwSdij513J53umQo9AL4aqjSmPk5JTgY3WArqr3PosFvOPQnZv7o3BV3
         yej+whEwumH28tRk8Bg4ydUjXgEfHTxlXFuL8EBQ7/ZS+ubfV8TQiTMb8Hxy9J6DUNTe
         E0CeltAdW17UICHuUtzVBl6t5g9VV/6OVUtOJgRN42is+02D9QKXMnyssVi+n7MML/0/
         qsU4AxQldO2zQRiJo5fRCo5cl0iuRoon3pYPNt4oX/9JcSwe5EZLvLvfClW/uublcVJK
         w6XQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t65-20020a1fc344000000b004b2ccee14f3si1791710vkf.236.2023.12.12.06.50.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 12 Dec 2023 06:50:36 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rD45f-0002GU-95; Tue, 12 Dec 2023 09:50:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=DDG+=HX=kaod.org=clg@ozlabs.org>)
 id 1rD45c-0002DK-Np; Tue, 12 Dec 2023 09:50:28 -0500
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3]
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=DDG+=HX=kaod.org=clg@ozlabs.org>)
 id 1rD45O-0004d2-BZ; Tue, 12 Dec 2023 09:50:27 -0500
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4SqM3N1wz7z4xQj;
 Wed, 13 Dec 2023 01:50:08 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4SqM3D2Rc6z4xS7;
 Wed, 13 Dec 2023 01:49:59 +1100 (AEDT)
Message-ID: <b4aca87e-dea4-4d7f-af2e-79c856136b3a@kaod.org>
Date: Tue, 12 Dec 2023 15:49:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Subject: Re: [PATCH v8 07/10] hw/arm: Hook up FSI module in AST2600
To: Ninad Palsule <ninad@linux.ibm.com>, qemu-devel@nongnu.org,
 peter.maydell@linaro.org, andrew@codeconstruct.com.au, joel@jms.id.au,
 pbonzini@redhat.com, marcandre.lureau@redhat.com, berrange@redhat.com,
 thuth@redhat.com, philmd@linaro.org, lvivier@redhat.com
Cc: qemu-arm@nongnu.org, Andrew Jeffery <andrew@aj.id.au>
References: <20231128235700.599584-1-ninad@linux.ibm.com>
 <20231128235700.599584-8-ninad@linux.ibm.com>
Content-Language: en-US
In-Reply-To: <20231128235700.599584-8-ninad@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2404:9400:2221:ea00::3;
 envelope-from=SRS0=DDG+=HX=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-TUID: eVoBzo83RsC7

On 11/29/23 00:56, Ninad Palsule wrote:
> This patchset introduces IBM's Flexible Service Interface(FSI).
> 
> Time for some fun with inter-processor buses. FSI allows a service
> processor access to the internal buses of a host POWER processor to
> perform configuration or debugging.
> 
> FSI has long existed in POWER processes and so comes with some baggage,
> including how it has been integrated into the ASPEED SoC.
> 
> Working backwards from the POWER processor, the fundamental pieces of
> interest for the implementation are:
> 
> 1. The Common FRU Access Macro (CFAM), an address space containing
>     various "engines" that drive accesses on buses internal and external
>     to the POWER chip. Examples include the SBEFIFO and I2C masters. The
>     engines hang off of an internal Local Bus (LBUS) which is described
>     by the CFAM configuration block.
> 
> 2. The FSI slave: The slave is the terminal point of the FSI bus for
>     FSI symbols addressed to it. Slaves can be cascaded off of one
>     another. The slave's configuration registers appear in address space
>     of the CFAM to which it is attached.
> 
> 3. The FSI master: A controller in the platform service processor (e.g.
>     BMC) driving CFAM engine accesses into the POWER chip. At the
>     hardware level FSI is a bit-based protocol supporting synchronous and
>     DMA-driven accesses of engines in a CFAM.
> 
> 4. The On-Chip Peripheral Bus (OPB): A low-speed bus typically found in
>     POWER processors. This now makes an appearance in the ASPEED SoC due
>     to tight integration of the FSI master IP with the OPB, mainly the
>     existence of an MMIO-mapping of the CFAM address straight onto a
>     sub-region of the OPB address space.
> 
> 5. An APB-to-OPB bridge enabling access to the OPB from the ARM core in
>     the AST2600. Hardware limitations prevent the OPB from being directly
>     mapped into APB, so all accesses are indirect through the bridge.
> 
> The implementation appears as following in the qemu device tree:
> 
>      (qemu) info qtree
>      bus: main-system-bus
>        type System
>        ...
>        dev: aspeed.apb2opb, id ""
>          gpio-out "sysbus-irq" 1
>          mmio 000000001e79b000/0000000000001000
>          bus: opb.1
>            type opb
>            dev: fsi.master, id ""
>              bus: fsi.bus.1
>                type fsi.bus
>                dev: cfam.config, id ""
>                dev: cfam, id ""
>                  bus: fsi.lbus.1
>                    type lbus
>                    dev: scratchpad, id ""
>                      address = 0 (0x0)
>          bus: opb.0
>            type opb
>            dev: fsi.master, id ""
>              bus: fsi.bus.0
>                type fsi.bus
>                dev: cfam.config, id ""
>                dev: cfam, id ""
>                  bus: fsi.lbus.0
>                    type lbus
>                    dev: scratchpad, id ""
>                      address = 0 (0x0)
> 
> The LBUS is modelled to maintain the qdev bus hierarchy and to take
> advantage of the object model to automatically generate the CFAM
> configuration block. The configuration block presents engines in the
> order they are attached to the CFAM's LBUS. Engine implementations
> should subclass the LBusDevice and set the 'config' member of
> LBusDeviceClass to match the engine's type.
> 
> CFAM designs offer a lot of flexibility, for instance it is possible for
> a CFAM to be simultaneously driven from multiple FSI links. The modeling
> is not so complete; it's assumed that each CFAM is attached to a single
> FSI slave (as a consequence the CFAM subclasses the FSI slave).
> 
> As for FSI, its symbols and wire-protocol are not modelled at all. This
> is not necessary to get FSI off the ground thanks to the mapping of the
> CFAM address space onto the OPB address space - the models follow this
> directly and map the CFAM memory region into the OPB's memory region.
> Future work includes supporting more advanced accesses that drive the
> FSI master directly rather than indirectly via the CFAM mapping, which
> will require implementing the FSI state machine and methods for each of
> the FSI symbols on the slave. Further down the track we can also look at
> supporting the bitbanged SoftFSI drivers in Linux by extending the FSI
> slave model to resolve sequences of GPIO IRQs into FSI symbols, and
> calling the associated symbol method on the slave to map the access onto
> the CFAM.
> 
> Testing:
>      Tested by reading cfam config address 0 on rainier machine type.
> 
>      root@p10bmc:~# pdbg -a getcfam 0x0
>      p0: 0x0 = 0xc0022d15
> 
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> Signed-off-by: Ninad Palsule <ninad@linux.ibm.com>
> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> Signed-off-by: Cédric Le Goater <clg@kaod.org>


Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.


> ---
>   include/hw/arm/aspeed_soc.h |  4 ++++
>   hw/arm/aspeed_ast2600.c     | 19 +++++++++++++++++++
>   2 files changed, 23 insertions(+)
> 
> diff --git a/include/hw/arm/aspeed_soc.h b/include/hw/arm/aspeed_soc.h
> index cb832bc1ee..e452108260 100644
> --- a/include/hw/arm/aspeed_soc.h
> +++ b/include/hw/arm/aspeed_soc.h
> @@ -36,6 +36,7 @@
>   #include "hw/misc/aspeed_lpc.h"
>   #include "hw/misc/unimp.h"
>   #include "hw/misc/aspeed_peci.h"
> +#include "hw/fsi/aspeed-apb2opb.h"
>   #include "hw/char/serial.h"
>   
>   #define ASPEED_SPIS_NUM  2
> @@ -90,6 +91,7 @@ struct AspeedSoCState {
>       UnimplementedDeviceState udc;
>       UnimplementedDeviceState sgpiom;
>       UnimplementedDeviceState jtag[ASPEED_JTAG_NUM];
> +    AspeedAPB2OPBState fsi[2];
>   };
>   
>   #define TYPE_ASPEED_SOC "aspeed-soc"
> @@ -214,6 +216,8 @@ enum {
>       ASPEED_DEV_SGPIOM,
>       ASPEED_DEV_JTAG0,
>       ASPEED_DEV_JTAG1,
> +    ASPEED_DEV_FSI1,
> +    ASPEED_DEV_FSI2,
>   };
>   
>   #define ASPEED_SOC_SPI_BOOT_ADDR 0x0
> diff --git a/hw/arm/aspeed_ast2600.c b/hw/arm/aspeed_ast2600.c
> index b965fbab5e..2273a62426 100644
> --- a/hw/arm/aspeed_ast2600.c
> +++ b/hw/arm/aspeed_ast2600.c
> @@ -75,6 +75,8 @@ static const hwaddr aspeed_soc_ast2600_memmap[] = {
>       [ASPEED_DEV_UART12]    = 0x1E790600,
>       [ASPEED_DEV_UART13]    = 0x1E790700,
>       [ASPEED_DEV_VUART]     = 0x1E787000,
> +    [ASPEED_DEV_FSI1]      = 0x1E79B000,
> +    [ASPEED_DEV_FSI2]      = 0x1E79B100,
>       [ASPEED_DEV_I3C]       = 0x1E7A0000,
>       [ASPEED_DEV_SDRAM]     = 0x80000000,
>   };
> @@ -132,6 +134,8 @@ static const int aspeed_soc_ast2600_irqmap[] = {
>       [ASPEED_DEV_ETH4]      = 33,
>       [ASPEED_DEV_KCS]       = 138,   /* 138 -> 142 */
>       [ASPEED_DEV_DP]        = 62,
> +    [ASPEED_DEV_FSI1]      = 100,
> +    [ASPEED_DEV_FSI2]      = 101,
>       [ASPEED_DEV_I3C]       = 102,   /* 102 -> 107 */
>   };
>   
> @@ -264,6 +268,10 @@ static void aspeed_soc_ast2600_init(Object *obj)
>       object_initialize_child(obj, "emmc-boot-controller",
>                               &s->emmc_boot_controller,
>                               TYPE_UNIMPLEMENTED_DEVICE);
> +
> +    for (i = 0; i < ASPEED_FSI_NUM; i++) {
> +        object_initialize_child(obj, "fsi[*]", &s->fsi[i], TYPE_ASPEED_APB2OPB);
> +    }
>   }
>   
>   /*
> @@ -625,6 +633,17 @@ static void aspeed_soc_ast2600_realize(DeviceState *dev, Error **errp)
>           return;
>       }
>       aspeed_mmio_map(s, SYS_BUS_DEVICE(&s->sbc), 0, sc->memmap[ASPEED_DEV_SBC]);
> +
> +    /* FSI */
> +    for (i = 0; i < ASPEED_FSI_NUM; i++) {
> +        if (!sysbus_realize(SYS_BUS_DEVICE(&s->fsi[i]), errp)) {
> +            return;
> +        }
> +        aspeed_mmio_map(s, SYS_BUS_DEVICE(&s->fsi[i]), 0,
> +                        sc->memmap[ASPEED_DEV_FSI1 + i]);
> +        sysbus_connect_irq(SYS_BUS_DEVICE(&s->fsi[i]), 0,
> +                           aspeed_soc_get_irq(s, ASPEED_DEV_FSI1 + i));
> +    }
>   }
>   
>   static void aspeed_soc_ast2600_class_init(ObjectClass *oc, void *data)

