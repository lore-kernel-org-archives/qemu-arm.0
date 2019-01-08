Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp4781735wrt;
        Tue, 8 Jan 2019 08:36:57 -0800 (PST)
X-Google-Smtp-Source: ALg8bN7h/KrtBKFwufysk+jTICB1g7Z1SI8AxMGepIsN/p7KV8ndOn/8QXk8/h4c+AlPL0Goa9rd
X-Received: by 2002:a1c:544f:: with SMTP id p15mr2299238wmi.37.1546965417549;
        Tue, 08 Jan 2019 08:36:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1546965417; cv=none;
        d=google.com; s=arc-20160816;
        b=FVcMDSOd4asoHtf2BiYwlS4YDbuRaRPbr1ROFGm4sCivigHA61Gt70u2TpxyXOsqm9
         3T5i7DeAZInW1liqTIR38adXRfo/H0h8dvDqzxvXLJ1RBVpIMq90VQmctwxpf+2/oQMn
         Fwg+em748e+7U98cJhQlnoOYa5hywX0kYdSEhay3F/gymoLj7adXtjTTnqGbS+izqin2
         zkrTqHYJfMVyP8qTDxhdD9aV3JI0bvd/rkDpiQLJY6wq799tWA4U3ZQQcdtS9Bn3MALA
         ZXDwI7vgmSUD5ysqegqv7xJ8APOY57AJQIZttnq33iIldDJc3vSEpDVRe2xR9eHB8T90
         IxzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to;
        bh=TATC/GqsN/FgHq4MryhWjntMwp6JF75V7wv+ciYOThE=;
        b=w1cE47ZxChHqrsqLHUjd7v/9PCyMMv/anRGdRt5J2lTAN1tUIkX+oHG4bFhX1daT/Q
         iUsP0iGPwWoZvRJ96dGMTQBkQlIAhcux/B0RqywtmrWoGWzqP2GOpgvmTCEUhGmSkl3g
         1Znp+mxzq/nOMZbEzcHFn50JLNg14Pq0iem5PENI3940bmX+llC+xM57YTJqyfY7rpxA
         LHXI76xlyq52eZuExM3Dlblsl5had5zJItdo7fc5maScHeaWARSj0jXiohE5TCtX0pwn
         QyMIO9gf2h+YY1phKtpS+VxjlxySBAb5v91/7WZAKkWkDZUAkrXeWNOhPmDQrToMG0e8
         JYtQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t2si7291907wmd.99.2019.01.08.08.36.57
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 08 Jan 2019 08:36:57 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:55351 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gguN0-0007fe-L7
	for alex.bennee@linaro.org; Tue, 08 Jan 2019 11:36:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53997)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mail@steffen-goertz.de>) id 1gguLq-0006xs-7k
	for qemu-arm@nongnu.org; Tue, 08 Jan 2019 11:35:39 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mail@steffen-goertz.de>) id 1gguLn-0008Af-80
	for qemu-arm@nongnu.org; Tue, 08 Jan 2019 11:35:37 -0500
Received: from steffen-goertz.de ([88.198.119.201]:46402)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mail@steffen-goertz.de>)
	id 1gguLm-0007vg-26; Tue, 08 Jan 2019 11:35:35 -0500
Received: from [192.168.2.112] (p4FDCC8A8.dip0.t-ipconnect.de [79.220.200.168])
	by steffen-goertz.de (Postfix) with ESMTPSA id C2B9D52942;
	Tue,  8 Jan 2019 17:30:20 +0100 (CET)
To: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
References: <20190105144429.8702-1-stefanha@redhat.com>
From: =?UTF-8?Q?Steffen_G=c3=b6rtz?= <mail@steffen-goertz.de>
Openpgp: preference=signencrypt
Message-ID: <598e64e2-ea00-2ef3-ba21-1c5511aa6410@steffen-goertz.de>
Date: Tue, 8 Jan 2019 17:35:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190105144429.8702-1-stefanha@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 88.198.119.201
Subject: Re: [Qemu-arm] [PATCH] arm: Stub out NRF51 TWI
 magnetometer/accelerometer detection
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
Cc: Peter Maydell <peter.maydell@linaro.org>, jim@groklearning.com,
	contrib@steffen-goertz.de, qemu-arm@nongnu.org, joel@jms.id.au,
	jusual@mail.ru
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: n8bvAs3wR4Er

Signed-off by: Steffen G=C3=B6rtz <contrib@steffen-goertz.de>

On 05.01.19 15:44, Stefan Hajnoczi wrote:
> From: Steffen G=C3=B6rtz <contrib@steffen-goertz.de>
>=20
> Recent microbit firmwares panic if the TWI magnetometer/accelerometer
> devices are not detected during startup.  We don't implement TWI (I2C)
> so let's stub out these devices just to let the firmware boot.
>=20
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> Based-on: <20190103091119.9367-1-stefanha@redhat.com>
> ---
> Steffen: Please post your Signed-off-by.  I did some minor cleanups so
> your patch can be merged.  Thanks!
>=20
>  include/hw/arm/nrf51.h     |  1 +
>  include/hw/arm/nrf51_soc.h |  1 +
>  hw/arm/nrf51_soc.c         | 62 ++++++++++++++++++++++++++++++++++++++
>  3 files changed, 64 insertions(+)
>=20
> diff --git a/include/hw/arm/nrf51.h b/include/hw/arm/nrf51.h
> index 175bb6c301..5411121b66 100644
> --- a/include/hw/arm/nrf51.h
> +++ b/include/hw/arm/nrf51.h
> @@ -25,6 +25,7 @@
>  #define NRF51_IOMEM_SIZE      0x20000000
> =20
>  #define NRF51_UART_BASE       0x40002000
> +#define NRF51_TWI_BASE        0x40003000
>  #define NRF51_TIMER_BASE      0x40008000
>  #define NRF51_TIMER_SIZE      0x00001000
>  #define NRF51_RNG_BASE        0x4000D000
> diff --git a/include/hw/arm/nrf51_soc.h b/include/hw/arm/nrf51_soc.h
> index e06f0304b4..fbdefc07e4 100644
> --- a/include/hw/arm/nrf51_soc.h
> +++ b/include/hw/arm/nrf51_soc.h
> @@ -39,6 +39,7 @@ typedef struct NRF51State {
>      MemoryRegion sram;
>      MemoryRegion flash;
>      MemoryRegion clock;
> +    MemoryRegion twi;
> =20
>      uint32_t sram_size;
>      uint32_t flash_size;
> diff --git a/hw/arm/nrf51_soc.c b/hw/arm/nrf51_soc.c
> index 1630c27594..265438f916 100644
> --- a/hw/arm/nrf51_soc.c
> +++ b/hw/arm/nrf51_soc.c
> @@ -32,6 +32,11 @@
>  #define NRF51822_FLASH_SIZE     (256 * NRF51_PAGE_SIZE)
>  #define NRF51822_SRAM_SIZE      (16 * NRF51_PAGE_SIZE)
> =20
> +#define NRF51_TWI_EVENT_STOPPED 0x104
> +#define NRF51_TWI_EVENT_RXDREADY 0x108
> +#define NRF51_TWI_EVENT_TXDSENT 0x11c
> +#define NRF51_TWI_REG_RXD 0x518
> +
>  #define BASE_TO_IRQ(base) ((base >> 12) & 0x1F)
> =20
>  static uint64_t clock_read(void *opaque, hwaddr addr, unsigned int siz=
e)
> @@ -53,6 +58,58 @@ static const MemoryRegionOps clock_ops =3D {
>      .write =3D clock_write
>  };
> =20
> +/* Two-Wire Interface (TWI) is not implemented but the microbit-dal fi=
rmware
> + * panics if the TWI accelerometer and magnetometer WHO_AM_I registers=
 cannot
> + * be read.  Stub out this read sequence so microbit-dal starts up.
> + */
> +static uint32_t twi_read_sequence[] =3D {0x5A, 0x5A, 0x40};
> +static uint32_t twi_regs[0x1000 / 4];
> +
> +static uint64_t twi_read(void *opaque, hwaddr addr, unsigned int size)
> +{
> +    static int i;
> +    uint64_t data =3D 0x00;
> +
> +    switch (addr) {
> +    case NRF51_TWI_EVENT_STOPPED:
> +        data =3D 0x01;
> +        break;
> +    case NRF51_TWI_EVENT_RXDREADY:
> +        data =3D 0x01;
> +        break;
> +    case NRF51_TWI_EVENT_TXDSENT:
> +        data =3D 0x01;
> +        break;
> +    case NRF51_TWI_REG_RXD:
> +        data =3D twi_read_sequence[i];
> +        if (i < ARRAY_SIZE(twi_read_sequence)) {
> +            i++;
> +        }
> +        break;
> +    default:
> +        data =3D twi_regs[addr / 4];
> +        break;
> +    }
> +
> +    qemu_log_mask(LOG_UNIMP, "%s: 0x%" HWADDR_PRIx " [%u] =3D %" PRIx3=
2 "\n",
> +                  __func__, addr, size, (uint32_t)data);
> +
> +
> +    return data;
> +}
> +
> +static void twi_write(void *opaque, hwaddr addr, uint64_t data,
> +                      unsigned int size)
> +{
> +    qemu_log_mask(LOG_UNIMP, "%s: 0x%" HWADDR_PRIx " <- 0x%" PRIx64 " =
[%u]\n",
> +                  __func__, addr, data, size);
> +    twi_regs[addr / 4] =3D data;
> +}
> +
> +static const MemoryRegionOps twi_ops =3D {
> +    .read =3D twi_read,
> +    .write =3D twi_write
> +};
> =20
>  static void nrf51_soc_realize(DeviceState *dev_soc, Error **errp)
>  {
> @@ -156,6 +213,11 @@ static void nrf51_soc_realize(DeviceState *dev_soc=
, Error **errp)
>      memory_region_add_subregion_overlap(&s->container,
>                                          NRF51_IOMEM_BASE, &s->clock, -=
1);
> =20
> +    memory_region_init_io(&s->twi, NULL, &twi_ops, NULL,
> +                          "nrf51_soc.twi", 0x1000);
> +    memory_region_add_subregion_overlap(&s->container,
> +                                        NRF51_TWI_BASE, &s->twi, -1);
> +
>      create_unimplemented_device("nrf51_soc.io", NRF51_IOMEM_BASE,
>                                  NRF51_IOMEM_SIZE);
>      create_unimplemented_device("nrf51_soc.ficr", NRF51_FICR_BASE,
>=20
