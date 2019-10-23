Received: by 2002:a5d:4890:0:0:0:0:0 with SMTP id g16csp1527822wrq;
        Wed, 23 Oct 2019 15:58:20 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzFNIKL8GUVbKvMKczVo2oMWdbhU55/gpMHjdjlJ/vJ3Fi2qGkG2tteLqRiq8RFw5r0kBOe
X-Received: by 2002:a17:906:80c1:: with SMTP id a1mr35603502ejx.37.1571871500201;
        Wed, 23 Oct 2019 15:58:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571871500; cv=none;
        d=google.com; s=arc-20160816;
        b=jxf8C80c9dI5oe4W3UJaNxynkhRWeZezjBcYVEROYbnFV7ckSKANGVIL9MLwYf1YqD
         NTfwjor0wfuWhWhKYPGPeciL5RE9pgE/acXrENaykycVgyU2KpMyebs9DgfRNFuVzOyX
         eXtaypE6BpOuECpN/BrLtNotbdotPYxcBrGG+wIN4dhHwn4OKSEupffPP+A1iCRDZpV8
         ZbNCKma3DJ3Bv1AbrePrH4eyH7duusWqyeX1yb5X+eSHNl3qMHH9Klv8cYHRZnfCFkRP
         xL02z/3Xc9GOka0bHwETwLAoTJWO4qkgfqKujwLX7BxopIPN8uE4rIneCA+pyiAZDab6
         a8sA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=k6JUVaUWM4qS1cCgXr22Ex0L1oTDMaoieJAqQKyoFVk=;
        b=t5HWvHEgTL31hnkAMvKMo73heCxXVdCJUwxfoOUCabm/xvTkLCCkh37PbLVrfy4uXe
         ykij0Tx/fG8uGlmXIzaKO2bq3rXbmqCO61RNqIFBT+5X/Wn0x08YLQGGYSxs1MHBb7vY
         wNvWlWCwOPi1dTeSI3aK0rFomCN8n2sfHchve8xNHj2wLGgJkmBp3W/6C56zvot6d2oQ
         owMzC9p5lwEXBApz7xi7pK8NRPgfMTMrqbAQpPIAMW/iFCwepg3h7Quvn2QOXKbYSSUX
         YH9KmbHXqs5u9tXTtd0n8UA76tWg5SS1UMfQkLbMyj3/gv1cPLuc7s9PZYAxXoYe/Q3s
         YmrA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id dk11si6472912ejb.97.2019.10.23.15.58.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 23 Oct 2019 15:58:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:52036 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iNPa6-0002qN-1t
	for alex.bennee@linaro.org; Wed, 23 Oct 2019 18:58:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60027)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1iNPZq-0002kP-8y
 for qemu-arm@nongnu.org; Wed, 23 Oct 2019 18:58:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1iNPZo-0006s6-Om
 for qemu-arm@nongnu.org; Wed, 23 Oct 2019 18:58:02 -0400
Received: from mx1.redhat.com ([209.132.183.28]:60052)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1iNPZm-0006rb-QB
 for qemu-arm@nongnu.org; Wed, 23 Oct 2019 18:58:00 -0400
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 422224E924
 for <qemu-arm@nongnu.org>; Wed, 23 Oct 2019 22:57:57 +0000 (UTC)
Received: by mail-wr1-f72.google.com with SMTP id a15so11865705wrr.0
 for <qemu-arm@nongnu.org>; Wed, 23 Oct 2019 15:57:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=BazpvHYq6PyK/dknt5pLp0NK1GqFux09Ox3JHGYqZFs=;
 b=U6b5nhfyO7ORXb/yf4sBo9dkSV8yH1s6/0kWwJbFzRdfnSB8AVIwBnk5ifgi3xMp19
 yeSkm/S15ZD2hTWqA7JpmQ3NBLAoRMoIDR6j8xKriC5TzqJQWbbIWuH8AceHucCYFHsf
 anWK960iLrHp4HcP53KMzsHZZ0GGPTHMbTG6Wp28AZ5sVTVAmSdbHSFiiGtQyE0/+s5g
 mjtN6KC4enDxami7SMm001BrNgNcKNn7aXjlnUVwbB72aDDA0SLg5IRElQDdgjmFpkfY
 9pzB0HZtOpS7SoaOEEOro29QfCeZHuSsTg3WFejG9rXO7v7PPwRc1sXNXG1UXlHoaCkk
 7wcg==
X-Gm-Message-State: APjAAAX1jUru7cITNr/JrVvR60Jkjm9aS64OImCHn953oH+Oi3tXNvnU
 RslSgVuX3wfKI1lTST7KOGUW5i/mnTHWKWp38tSTyB1eDYnrqgYudVxM2194K2cVFXedwNVptMM
 5ke7DDHdLKDJH
X-Received: by 2002:adf:ea07:: with SMTP id q7mr950963wrm.78.1571871475969;
 Wed, 23 Oct 2019 15:57:55 -0700 (PDT)
X-Received: by 2002:adf:ea07:: with SMTP id q7mr950924wrm.78.1571871475607;
 Wed, 23 Oct 2019 15:57:55 -0700 (PDT)
Received: from [192.168.1.41] (129.red-83-57-174.dynamicip.rima-tde.net.
 [83.57.174.129])
 by smtp.gmail.com with ESMTPSA id p5sm553253wmi.4.2019.10.23.15.57.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Oct 2019 15:57:55 -0700 (PDT)
Subject: Re: [PATCH v3 19/33] sm501: make SerialMM a child, export chardev
 property
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 qemu-devel@nongnu.org
References: <20191023173154.30051-1-marcandre.lureau@redhat.com>
 <20191023173154.30051-20-marcandre.lureau@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <0033fd98-f191-c3f5-4726-ba052254808a@redhat.com>
Date: Thu, 24 Oct 2019 00:57:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191023173154.30051-20-marcandre.lureau@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
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
Cc: Corey Minyard <cminyard@mvista.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Magnus Damm <magnus.damm@gmail.com>,
 Jason Wang <jasowang@redhat.com>, qemu-ppc@nongnu.org,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Fabien Chouteau <chouteau@adacore.com>,
 Aleksandar Rikalo <arikalo@wavecomp.com>,
 KONRAD Frederic <frederic.konrad@adacore.com>, qemu-arm@nongnu.org,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Paul Burton <pburton@wavecomp.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: V/1bFg/OSJdy

On 10/23/19 7:31 PM, Marc-Andr=C3=A9 Lureau wrote:
> Embed the SerialMM sybus device, and re-export its "chardev" property.
> That way, we can get rid of PROP_PTR "chr-state" and better track
> devices relationship.
>=20
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> ---
>   hw/display/sm501.c | 31 ++++++++++++++++++++++---------
>   hw/sh4/r2d.c       |  2 +-
>   2 files changed, 23 insertions(+), 10 deletions(-)
>=20
> diff --git a/hw/display/sm501.c b/hw/display/sm501.c
> index 1f33c87e65..6efdf764c1 100644
> --- a/hw/display/sm501.c
> +++ b/hw/display/sm501.c
> @@ -1930,13 +1930,14 @@ typedef struct {
>       SM501State state;
>       uint32_t vram_size;
>       uint32_t base;
> -    void *chr_state;
> +    SerialMM serial;
>   } SM501SysBusState;
>  =20
>   static void sm501_realize_sysbus(DeviceState *dev, Error **errp)
>   {
>       SM501SysBusState *s =3D SYSBUS_SM501(dev);
>       SysBusDevice *sbd =3D SYS_BUS_DEVICE(dev);
> +    SerialState *ss =3D &s->serial.serial;
>       DeviceState *usb_dev;
>  =20
>       sm501_init(&s->state, dev, s->vram_size);
> @@ -1958,17 +1959,18 @@ static void sm501_realize_sysbus(DeviceState *d=
ev, Error **errp)
>       sysbus_pass_irq(sbd, SYS_BUS_DEVICE(usb_dev));
>  =20
>       /* bridge to serial emulation module */
> -    if (s->chr_state) {
> -        serial_mm_init(&s->state.mmio_region, SM501_UART0, 2,
> -                       NULL, /* TODO : chain irq to IRL */
> -                       115200, s->chr_state, DEVICE_LITTLE_ENDIAN);
> +    if (qemu_chr_fe_backend_connected(&ss->chr)) {

Oh, this is a Companion Chip (Northbridge + Southbridge), mostly=20
implementing the display part, that's why it is in hw/display/.

The SM501_UART0 is always mapped here, no need to check for the backend.
(Not related to your series goal, but cleaning this might simplify this=20
patch).

> +        MemoryRegion *mr;
> +        qdev_init_nofail(DEVICE(&s->serial));
> +        mr =3D sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->serial), 0);
> +        memory_region_add_subregion(&s->state.mmio_region, SM501_UART0=
, mr);
> +        /* TODO : chain irq to IRL */
>       }
>   }
>  =20
>   static Property sm501_sysbus_properties[] =3D {
>       DEFINE_PROP_UINT32("vram-size", SM501SysBusState, vram_size, 0),
>       DEFINE_PROP_UINT32("base", SM501SysBusState, base, 0),
> -    DEFINE_PROP_PTR("chr-state", SM501SysBusState, chr_state),
>       DEFINE_PROP_END_OF_LIST(),
>   };
>  =20
> @@ -1999,9 +2001,19 @@ static void sm501_sysbus_class_init(ObjectClass =
*klass, void *data)
>       dc->props =3D sm501_sysbus_properties;
>       dc->reset =3D sm501_reset_sysbus;
>       dc->vmsd =3D &vmstate_sm501_sysbus;
> -    /* Note: pointer property "chr-state" may remain null, thus
> -     * no need for dc->user_creatable =3D false;
> -     */
> +}
> +
> +static void sm501_sysbus_init(Object *o)
> +{
> +    SM501SysBusState *self =3D SYSBUS_SM501(o);
> +    SerialMM *s =3D &self->serial;
> +
> +    sysbus_init_child_obj(o, "serial", s, sizeof(SerialMM), TYPE_SERIA=
L_MM);
> +    qdev_prop_set_int32(DEVICE(s), "instance-id", SM501_UART0);
> +    qdev_prop_set_uint8(DEVICE(s), "regshift", 2);
> +    qdev_prop_set_uint8(DEVICE(s), "endianness", DEVICE_LITTLE_ENDIAN)=
;
> +
> +    object_property_add_alias(o, "chardev", OBJECT(s), "chardev", &err=
or_abort);
>   }
>  =20
>   static const TypeInfo sm501_sysbus_info =3D {
> @@ -2009,6 +2021,7 @@ static const TypeInfo sm501_sysbus_info =3D {
>       .parent        =3D TYPE_SYS_BUS_DEVICE,
>       .instance_size =3D sizeof(SM501SysBusState),
>       .class_init    =3D sm501_sysbus_class_init,
> +    .instance_init =3D sm501_sysbus_init,
>   };
>  =20
>   #define TYPE_PCI_SM501 "sm501"
> diff --git a/hw/sh4/r2d.c b/hw/sh4/r2d.c
> index ee0840f380..72bb5285cc 100644
> --- a/hw/sh4/r2d.c
> +++ b/hw/sh4/r2d.c
> @@ -272,7 +272,7 @@ static void r2d_init(MachineState *machine)
>       busdev =3D SYS_BUS_DEVICE(dev);
>       qdev_prop_set_uint32(dev, "vram-size", SM501_VRAM_SIZE);
>       qdev_prop_set_uint32(dev, "base", 0x10000000);
> -    qdev_prop_set_ptr(dev, "chr-state", serial_hd(2));
> +    qdev_prop_set_chr(dev, "chardev", serial_hd(2));
>       qdev_init_nofail(dev);
>       sysbus_mmio_map(busdev, 0, 0x10000000);
>       sysbus_mmio_map(busdev, 1, 0x13e00000);
>=20
