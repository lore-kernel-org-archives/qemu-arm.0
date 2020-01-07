Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp24408820lff;
        Tue, 7 Jan 2020 01:26:16 -0800 (PST)
X-Google-Smtp-Source: APXvYqwJBypLOEGi7M1kehrZQAQC1zoxLT9gBECVJ97OXBFDFWdSvjeNjFEDIB3LHWAR8Tstz1+N
X-Received: by 2002:a50:bae1:: with SMTP id x88mr93869521ede.10.1578389176190;
        Tue, 07 Jan 2020 01:26:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578389176; cv=none;
        d=google.com; s=arc-20160816;
        b=F03dVuPvC1YQManePgKtrK36AAS5Jh/uwp1ILq80e7CXZ8BKHOIUA+3b6H/3V0cACw
         DZX7Dzo14AsmwL1gDxEDJsN5TJQnnI2K1vyzmjuyvgVhcU3/c1bnJMnW0pqisk/Z6/p6
         HjsvZXR8PiTnaNRPJo5R8dUbPcj+pJ0FHK0mImuLUmwnKJ/S9J4oGGVhRoIT5j0gyOBZ
         d5A7bQWQeE+OmxTt20B8hvw1ax/Jnu847eUutbLJKU7q/Lgt8AN6wVVB2Xtngt5tM9gh
         ZhLvzYbwqtNUErD3x4BT6oEjJtyJAEjHe6fAdlVZKVP7tf1wsuQLoiRYY4lIO6gQo2Xw
         osWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=EItgcsqMjnzxV43V3Il8tJ34o6wX9PReSRH1fDJnmow=;
        b=jmvByCEINwtuq7cZnknMsT8h1OWVy226EJY8aGeHBZi8w6FOeFjIBjcZ6+rEk8cFCv
         oVFYhPSEc5hU6B6Jf8nYprLS/IYE7eKo7VXByqkZusLm0X7ANjtGo3zmksUcrze7V9u8
         rKVkwP5CXA4KQjm8J06eFqFcHvvfk0EYUToWamie9nnJS30OnVKgQqg0Vr/xF6qiKvoa
         dWaw+IEd+BzdFTPBlqUx6EamQGMZt+jct4qpMFnM/PszmFZqNLIy9uwOSFqodjAQHQie
         ZuKnLitRVTMK1Km+GWwNMIM5iFglw+ijIM2cGXF9PAAuNw5BVi52g0Jy4xc1QQVxmiFb
         zo/w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=aNOUyKvq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c6si23516296edw.302.2020.01.07.01.26.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 07 Jan 2020 01:26:16 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=aNOUyKvq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:45258 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iol7s-0003zP-Gm
	for alex.bennee@linaro.org; Tue, 07 Jan 2020 04:26:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60204)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1iokBS-0000o5-IE
 for qemu-arm@nongnu.org; Tue, 07 Jan 2020 03:25:51 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1iokBO-0001Tn-LD
 for qemu-arm@nongnu.org; Tue, 07 Jan 2020 03:25:50 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:34004
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1iokBO-0001TI-HK
 for qemu-arm@nongnu.org; Tue, 07 Jan 2020 03:25:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1578385545;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EItgcsqMjnzxV43V3Il8tJ34o6wX9PReSRH1fDJnmow=;
 b=aNOUyKvqrFFFWdllpnpQCj8HS+0bScMAoMkZRJrPvb2EwfBhMm6T1TJ+0KNrgFd+YVrdqx
 yRofnz0ZqwdrjBg8WoBtWzSs1KI96f7kcqXQc98YxEQ6eQFQGdWv19BhzTuqDKg/rJO2M1
 6xq6QHYvm3dif8SjeuUi1QUZZ/D+BBM=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-290-aY-HrNW6MdSCbCfo-TWliw-1; Tue, 07 Jan 2020 03:25:44 -0500
Received: by mail-wm1-f70.google.com with SMTP id t17so1690846wmi.7
 for <qemu-arm@nongnu.org>; Tue, 07 Jan 2020 00:25:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=twvR55DUgXtP77qfYthgZ5Mc4/jTQDOUFsTn2kgZRmQ=;
 b=udvBVl+qr82u0ifkZ6u57Wr5HCJALVHztGRxGUfX9vYmrch7qFAPhlS0WFIKkr6hAF
 uRIMFrb3TVVnPYz3Hr/f0zlGNeWYI4H9O4VjMOPp4t6tr+R5OdQ1PDh6wUYc4Wm1fRof
 3NSj8Rx1mTE6cFklGBaMoggDhywGFTfxxML4qjFEntLDRyYYopb7lGsHtD3nxY07B/Pg
 se2B6v5UV05VWaCvVVFRzKo9ULt2NcrBgaVIgAS72rIJsKbnRCwqwYjqUD6acCxWp36r
 jiFoj65JnY4FWtqQhwWEZIM187V5ZjkzCYIDXDZsDya3ByyU0HKIDWzmEb/mgEfXcx+9
 PN5g==
X-Gm-Message-State: APjAAAUw8Hs8M35R1NRMCKXEfOyKLfGRuku32GgG5hCXUqFPtK+LOBZv
 8uqVPMg4h1LzXH9pGvwI3YepbsrHTcggFZYwr3LOWM7fkRnDI1ZlDtDZghgtNenekGxrCW/OfIr
 JkOWUuGKUlGe7
X-Received: by 2002:adf:dfd2:: with SMTP id
 q18mr107226615wrn.152.1578385542885; 
 Tue, 07 Jan 2020 00:25:42 -0800 (PST)
X-Received: by 2002:adf:dfd2:: with SMTP id
 q18mr107226583wrn.152.1578385542506; 
 Tue, 07 Jan 2020 00:25:42 -0800 (PST)
Received: from [192.168.1.35] (34.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.34])
 by smtp.gmail.com with ESMTPSA id p5sm76736768wrt.79.2020.01.07.00.25.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Jan 2020 00:25:41 -0800 (PST)
Subject: Re: [PATCH 2/5] hw/arm: ast2600: Wire up the eMMC controller
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20200107073423.30043-1-clg@kaod.org>
 <20200107073423.30043-3-clg@kaod.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <a7c45303-e624-d7aa-df6f-e03f26b3cba7@redhat.com>
Date: Tue, 7 Jan 2020 09:25:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200107073423.30043-3-clg@kaod.org>
Content-Language: en-US
X-MC-Unique: aY-HrNW6MdSCbCfo-TWliw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.120
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
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm@nongnu.org,
 Joel Stanley <joel@jms.id.au>, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: e0QyOxPqNwhH

On 1/7/20 8:34 AM, C=C3=A9dric Le Goater wrote:
> From: Andrew Jeffery <andrew@aj.id.au>
>=20
> Initialise another SDHCI model instance for the AST2600's eMMC
> controller and use the SDHCI's num_slots value introduced previously to
> determine whether we should create an SD card instance for the new slot.
>=20
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
> ---
>   include/hw/arm/aspeed_soc.h |  2 ++
>   hw/arm/aspeed.c             | 25 ++++++++++++++++---------
>   hw/arm/aspeed_ast2600.c     | 21 +++++++++++++++++++++
>   3 files changed, 39 insertions(+), 9 deletions(-)
>=20
> diff --git a/include/hw/arm/aspeed_soc.h b/include/hw/arm/aspeed_soc.h
> index e84380984f7b..90ac7f7ffa3b 100644
> --- a/include/hw/arm/aspeed_soc.h
> +++ b/include/hw/arm/aspeed_soc.h
> @@ -57,6 +57,7 @@ typedef struct AspeedSoCState {
>       AspeedGPIOState gpio;
>       AspeedGPIOState gpio_1_8v;
>       AspeedSDHCIState sdhci;
> +    AspeedSDHCIState emmc;
>   } AspeedSoCState;
>  =20
>   #define TYPE_ASPEED_SOC "aspeed-soc"
> @@ -126,6 +127,7 @@ enum {
>       ASPEED_MII4,
>       ASPEED_SDRAM,
>       ASPEED_XDMA,
> +    ASPEED_EMMC,
>   };
>  =20
>   #endif /* ASPEED_SOC_H */
> diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
> index 4174e313cae5..0a7dfd29868b 100644
> --- a/hw/arm/aspeed.c
> +++ b/hw/arm/aspeed.c
> @@ -171,6 +171,18 @@ static void aspeed_board_init_flashes(AspeedSMCState=
 *s, const char *flashtype,
>       }
>   }
>  =20
> +static void sdhci_attach_drive(SDHCIState *sdhci, DriveInfo *dinfo)
> +{
> +        BlockBackend *blk;
> +        DeviceState *card;
> +
> +        blk =3D dinfo ? blk_by_legacy_dinfo(dinfo) : NULL;
> +        card =3D qdev_create(qdev_get_child_bus(DEVICE(sdhci), "sd-bus")=
,
> +                           TYPE_SD_CARD);
> +        qdev_prop_set_drive(card, "drive", blk, &error_fatal);

I find this form easier to review:

            if (dinfo) {
                 qdev_prop_set_drive(card, "drive",
                                     blk_by_legacy_dinfo(dinfo),
                                     &error_fatal);
            }

> +        object_property_set_bool(OBJECT(card), true, "realized", &error_=
fatal);
> +}
> +
>   static void aspeed_machine_init(MachineState *machine)
>   {
>       AspeedBoardState *bmc;
> @@ -264,16 +276,11 @@ static void aspeed_machine_init(MachineState *machi=
ne)
>       }
>  =20
>       for (i =3D 0; i < bmc->soc.sdhci.num_slots; i++) {
> -        SDHCIState *sdhci =3D &bmc->soc.sdhci.slots[i];
> -        DriveInfo *dinfo =3D drive_get_next(IF_SD);
> -        BlockBackend *blk;
> -        DeviceState *card;
> +        sdhci_attach_drive(&bmc->soc.sdhci.slots[i], drive_get_next(IF_S=
D));
> +    }
>  =20
> -        blk =3D dinfo ? blk_by_legacy_dinfo(dinfo) : NULL;
> -        card =3D qdev_create(qdev_get_child_bus(DEVICE(sdhci), "sd-bus")=
,
> -                           TYPE_SD_CARD);
> -        qdev_prop_set_drive(card, "drive", blk, &error_fatal);
> -        object_property_set_bool(OBJECT(card), true, "realized", &error_=
fatal);
> +    if (bmc->soc.emmc.num_slots) {
> +        sdhci_attach_drive(&bmc->soc.emmc.slots[0], drive_get_next(IF_SD=
));
>       }
>  =20
>       arm_load_kernel(ARM_CPU(first_cpu), machine, &aspeed_board_binfo);
> diff --git a/hw/arm/aspeed_ast2600.c b/hw/arm/aspeed_ast2600.c
> index fb73c4043ea3..e59cdd291925 100644
> --- a/hw/arm/aspeed_ast2600.c
> +++ b/hw/arm/aspeed_ast2600.c
> @@ -46,6 +46,7 @@ static const hwaddr aspeed_soc_ast2600_memmap[] =3D {
>       [ASPEED_ADC]       =3D 0x1E6E9000,
>       [ASPEED_VIDEO]     =3D 0x1E700000,
>       [ASPEED_SDHCI]     =3D 0x1E740000,
> +    [ASPEED_EMMC]      =3D 0x1E750000,
>       [ASPEED_GPIO]      =3D 0x1E780000,
>       [ASPEED_GPIO_1_8V] =3D 0x1E780800,
>       [ASPEED_RTC]       =3D 0x1E781000,
> @@ -64,6 +65,7 @@ static const hwaddr aspeed_soc_ast2600_memmap[] =3D {
>  =20
>   #define ASPEED_SOC_AST2600_MAX_IRQ 128
>  =20
> +/* Shared Peripheral Interrupt values below are offset by -32 from datas=
heet */
>   static const int aspeed_soc_ast2600_irqmap[] =3D {
>       [ASPEED_UART1]     =3D 47,
>       [ASPEED_UART2]     =3D 48,
> @@ -77,6 +79,7 @@ static const int aspeed_soc_ast2600_irqmap[] =3D {
>       [ASPEED_ADC]       =3D 78,
>       [ASPEED_XDMA]      =3D 6,
>       [ASPEED_SDHCI]     =3D 43,
> +    [ASPEED_EMMC]      =3D 15,
>       [ASPEED_GPIO]      =3D 40,
>       [ASPEED_GPIO_1_8V] =3D 11,
>       [ASPEED_RTC]       =3D 13,
> @@ -206,6 +209,14 @@ static void aspeed_soc_ast2600_init(Object *obj)
>           sysbus_init_child_obj(obj, "sdhci[*]", OBJECT(&s->sdhci.slots[i=
]),
>                                 sizeof(s->sdhci.slots[i]), TYPE_SYSBUS_SD=
HCI);
>       }
> +
> +    sysbus_init_child_obj(obj, "emmc", OBJECT(&s->emmc), sizeof(s->emmc)=
,
> +                          TYPE_ASPEED_SDHCI);
> +
> +    object_property_set_int(OBJECT(&s->emmc), 1, "num-slots", &error_abo=
rt);
> +
> +    sysbus_init_child_obj(obj, "emmc[*]", OBJECT(&s->emmc.slots[0]),

Single block, so use "emmc" instead.

Using "emmc":
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

> +            sizeof(s->emmc.slots[0]), TYPE_SYSBUS_SDHCI);
>   }
>  =20
>   /*
> @@ -497,6 +508,16 @@ static void aspeed_soc_ast2600_realize(DeviceState *=
dev, Error **errp)
>                       sc->memmap[ASPEED_SDHCI]);
>       sysbus_connect_irq(SYS_BUS_DEVICE(&s->sdhci), 0,
>                          aspeed_soc_get_irq(s, ASPEED_SDHCI));
> +
> +    /* eMMC */
> +    object_property_set_bool(OBJECT(&s->emmc), true, "realized", &err);
> +    if (err) {
> +        error_propagate(errp, err);
> +        return;
> +    }
> +    sysbus_mmio_map(SYS_BUS_DEVICE(&s->emmc), 0, sc->memmap[ASPEED_EMMC]=
);
> +    sysbus_connect_irq(SYS_BUS_DEVICE(&s->emmc), 0,
> +                       aspeed_soc_get_irq(s, ASPEED_EMMC));
>   }
>  =20
>   static void aspeed_soc_ast2600_class_init(ObjectClass *oc, void *data)
>=20

