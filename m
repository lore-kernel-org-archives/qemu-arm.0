Received: by 2002:adf:9061:0:0:0:0:0 with SMTP id h88csp4696778wrh;
        Wed, 8 May 2019 04:10:20 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzOiJkYouYVNdTFilDBNGWALJ0iS8WaPMz4wGeHtMHx+CwsCg3Trut4CfxBXhag5S0UfSfB
X-Received: by 2002:a1c:ef18:: with SMTP id n24mr2507289wmh.94.1557313820411;
        Wed, 08 May 2019 04:10:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557313820; cv=none;
        d=google.com; s=arc-20160816;
        b=fhwH5Sd16pY/bw+JYcT4DxTtXP+dIpWu0ySDYsC+bIHehO2s3PQIKSnPEy2eNL3GWe
         a3vU4BEA0xUU5N+nmz/qwXzocFU2xCercKSLJm/1DLE2/fNpj7jQHNMxsFIu3FL1ReTj
         RSYuXweh+uJeiay5fHpanknBQbzbfowh/tx9OT0lmIaItAjxxtzq6gVNid+pC+Ff/bBr
         9cz10JIyDEoUu4b0zklIOuC2FzDpEW8n7QtECM5XoVvEx/IxcxRrMI9A1L3CX/rSaHPQ
         AaCK/i4RwcA3govYLkDM+CbENTaIe56ufERWfuJzznSbtv2mNRSsEAoevwvkhNNjyqw6
         TMTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=kTeDAeJHTbTbhAf6Au5D/u+567YefQgAfLgDokL+9fI=;
        b=CLJS17/YGwgp25v0LMBVqt8HAAQWTLEG4zvSZReqa6MRf1x0I8zVzrRhEdlVt1+haO
         L++8Ehf4rsiIaqHgGOGTsaWrARbK/LIrceminvg9G7fpzp7bFh6/9WEtBuPn6cIDrJ40
         O+EU/nDBB/3hqmAvydnzx/h5+5CU6gnyCYbPQ5JlIm7Z9NsTpCUnaMLZN8mkdX/GNprD
         tYqdA2wb91klgvl1ziZuoucjyPjc41Z6q47uxVzY79g7B32QoPcrlFAqn/U2qgccDkQ+
         hU9/VvjCoKfObcwoNWgjO6cNpBHfX85zF+TJ/pfxEGnNt37O+zoRP+JnbgG2xwAECzUO
         Cv+Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n125si1359701wme.48.2019.05.08.04.10.20
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 08 May 2019 04:10:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:34870 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hOKSm-0000OF-EX
	for alex.bennee@linaro.org; Wed, 08 May 2019 07:10:16 -0400
Received: from eggs.gnu.org ([209.51.188.92]:36163)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1hOKST-0000Md-04
	for qemu-arm@nongnu.org; Wed, 08 May 2019 07:09:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1hOKSN-0007fX-EO
	for qemu-arm@nongnu.org; Wed, 08 May 2019 07:09:53 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:34578)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <pbonzini@redhat.com>) id 1hOKSN-0007eT-6z
	for qemu-arm@nongnu.org; Wed, 08 May 2019 07:09:51 -0400
Received: by mail-wr1-f67.google.com with SMTP id f7so16330381wrq.1
	for <qemu-arm@nongnu.org>; Wed, 08 May 2019 04:09:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=kTeDAeJHTbTbhAf6Au5D/u+567YefQgAfLgDokL+9fI=;
	b=UaoPcMe8V3CRYnpu6BeHY10aCRcD4XIB57YqzOtS8DRTdvWEMrGo4d72EQVSAthGa4
	170A0FDIE7JQQ/zL8YjHQcxMcA2liE7grLtEcCxPDIKnPFoHmlQd+UbhwTsqz4O2J+aK
	sx9mVLKZYb6BpzN+CypmcQRINOkl0iQ7XY8mwYujWR2Lw9w+q2IXNfPJJCreuvADrwgO
	5WgDT5f97UCz3iwh1c9GY8L8fNNsEl9kXzfiuQb5l63JNYWTDDAlFAOc1YuOWxQkOuCe
	CPQ4jRybL/6O27+B3D0QMRY9ZqbDadgPbN4EQfKNFZed4RtQLetqyVGFjVxDQuc03xcs
	yIZQ==
X-Gm-Message-State: APjAAAXoxF7XqW1Jujd/Nn3B6ubDElShqmXrDU08HQ8fsPkTqzQK4TVt
	iMlOs4c5SfWjxE1H7++E6rCD1g==
X-Received: by 2002:a5d:4e46:: with SMTP id r6mr7888937wrt.290.1557313788236; 
	Wed, 08 May 2019 04:09:48 -0700 (PDT)
Received: from [10.201.49.229] (nat-pool-mxp-u.redhat.com. [149.6.153.187])
	by smtp.gmail.com with ESMTPSA id
	s10sm2224950wrt.66.2019.05.08.04.09.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 08 May 2019 04:09:47 -0700 (PDT)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
	Markus Armbruster <armbru@redhat.com>, Thomas Huth <thuth@redhat.com>, 
	qemu-devel@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>
References: <20190507163416.24647-1-philmd@redhat.com>
	<20190507163416.24647-6-philmd@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <b88c1846-5490-8468-dfd5-1c35ac6a640f@redhat.com>
Date: Wed, 8 May 2019 13:09:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190507163416.24647-6-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.221.67
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2 05/16] hw/arm/bcm2835: Use
 object_initialize() on PL011State
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Paul Burton <pburton@wavecomp.com>, Andrew Jeffery <andrew@aj.id.au>,
	Alistair Francis <alistair@alistair23.me>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	=?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>,
	Jean-Christophe Dubois <jcd@tribudubois.net>,
	Aleksandar Rikalo <arikalo@wavecomp.com>,
	=?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
	qemu-arm@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
	Antony Pavlov <antonynpavlov@gmail.com>,
	Aleksandar Markovic <amarkovic@wavecomp.com>,
	Peter Chubb <peter.chubb@nicta.com.au>,
	David Gibson <david@gibson.dropbear.id.au>, qemu-ppc@nongnu.org,
	Aurelien Jarno <aurelien@aurel32.net>, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: pZvXjt6fAS4U

On 07/05/19 11:34, Philippe Mathieu-Daudé wrote:
> To be coherent with the other peripherals contained in the
> BCM2835PeripheralState structure, directly allocate the PL011State
> (instead of using the pl011 uart as a pointer to a SysBusDevice).
> 
> Initialize the PL011State with object_initialize() instead of
> object_new().
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  hw/arm/bcm2835_peripherals.c         | 14 +++++++-------
>  include/hw/arm/bcm2835_peripherals.h |  2 +-
>  2 files changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/hw/arm/bcm2835_peripherals.c b/hw/arm/bcm2835_peripherals.c
> index 7ffb51b6927..2931a82a25a 100644
> --- a/hw/arm/bcm2835_peripherals.c
> +++ b/hw/arm/bcm2835_peripherals.c
> @@ -46,9 +46,9 @@ static void bcm2835_peripherals_init(Object *obj)
>      qdev_set_parent_bus(DEVICE(&s->ic), sysbus_get_default());
>  
>      /* UART0 */
> -    s->uart0 = SYS_BUS_DEVICE(object_new(TYPE_PL011));
> -    object_property_add_child(obj, "uart0", OBJECT(s->uart0), NULL);
> -    qdev_set_parent_bus(DEVICE(s->uart0), sysbus_get_default());
> +    object_initialize(&s->uart0, sizeof(s->uart0), TYPE_PL011);
> +    object_property_add_child(obj, "uart0", OBJECT(&s->uart0), NULL);
> +    qdev_set_parent_bus(DEVICE(&s->uart0), sysbus_get_default());
>  
>      /* AUX / UART1 */
>      object_initialize(&s->aux, sizeof(s->aux), TYPE_BCM2835_AUX);
> @@ -166,16 +166,16 @@ static void bcm2835_peripherals_realize(DeviceState *dev, Error **errp)
>      sysbus_pass_irq(SYS_BUS_DEVICE(s), SYS_BUS_DEVICE(&s->ic));
>  
>      /* UART0 */
> -    qdev_prop_set_chr(DEVICE(s->uart0), "chardev", serial_hd(0));
> -    object_property_set_bool(OBJECT(s->uart0), true, "realized", &err);
> +    qdev_prop_set_chr(DEVICE(&s->uart0), "chardev", serial_hd(0));
> +    object_property_set_bool(OBJECT(&s->uart0), true, "realized", &err);
>      if (err) {
>          error_propagate(errp, err);
>          return;
>      }
>  
>      memory_region_add_subregion(&s->peri_mr, UART0_OFFSET,
> -                                sysbus_mmio_get_region(s->uart0, 0));
> -    sysbus_connect_irq(s->uart0, 0,
> +                sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->uart0), 0));
> +    sysbus_connect_irq(SYS_BUS_DEVICE(&s->uart0), 0,
>          qdev_get_gpio_in_named(DEVICE(&s->ic), BCM2835_IC_GPU_IRQ,
>                                 INTERRUPT_UART));
>      /* AUX / UART1 */
> diff --git a/include/hw/arm/bcm2835_peripherals.h b/include/hw/arm/bcm2835_peripherals.h
> index 959508d57dd..e79c21771fe 100644
> --- a/include/hw/arm/bcm2835_peripherals.h
> +++ b/include/hw/arm/bcm2835_peripherals.h
> @@ -38,7 +38,7 @@ typedef struct BCM2835PeripheralState {
>      MemoryRegion ram_alias[4];
>      qemu_irq irq, fiq;
>  
> -    SysBusDevice *uart0;
> +    PL011State uart0;
>      BCM2835AuxState aux;
>      BCM2835FBState fb;
>      BCM2835DMAState dma;
> 

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
