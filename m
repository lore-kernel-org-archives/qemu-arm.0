Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp3020672lff;
        Sat, 14 Dec 2019 21:43:36 -0800 (PST)
X-Google-Smtp-Source: APXvYqwUTnS2sMKtbYoELKE/ULCGRJi7aT5rnzGGqd/cKOiG57dQbVP/F020a0gI+t1/Uz5/mG7g
X-Received: by 2002:a9d:245:: with SMTP id 63mr25955149otb.229.1576388616831;
        Sat, 14 Dec 2019 21:43:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1576388616; cv=none;
        d=google.com; s=arc-20160816;
        b=W6bFpYD5spqxaKGy7la9PZxJtLQ/TC4lUL7qoru4t6bUOzhGfc1zwrq5Vyi+f873Wn
         beyf4QTCg5fn/khiDyCmR6r5MMtstxQMH3DEVxTQT0CNnqiUIVBLWQliq/VccxHya4jk
         E7ze2fTZSk4RFqdh5yqpDQm9QCLK+D+NuU15ipFaIAaHK6f91BaHi60/9B8fwVFwRJly
         0+87vRTusroAKWoEMmGtGGmy8lM8xY2lyGXILOp27kbMibhi67F7g4tftawi0hiLMJ0h
         hUhoazKMzJwKy5S1qPkhK/zWh/k7KzsoyxSAptdxFFZZSsGSgAxXTpLaS1awome0keQk
         GoGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=WYWZRg8tJRvZtH4+epWuAT8aPcYqczquMIkdW2aRs0U=;
        b=XR8gCeviiLxiNEUFxcOKbgBSB8oo59ITy7CEKUJSA9MdBbJQs2JseRaBtFgbFKC3Y5
         Zon3pSe4+5rhf3rA9H66ezuKbpJ7xR/B/rJoIMIZd4FxhluabxA307d14oxxHFhyrvdI
         Ng91ELpnOZq1jIp7i4YFSegJnQGQzaifjhQltpD/yVoZeWP18uG6kYRmc16LBC5WU/Rw
         ge7sGarUYI5jZT0oXflsUoX3oWqPhR93dduMw/b5nb3va+iRqYjGQrCXa/fm0+aOnSXB
         hDmydtlNgmDPxIZIBB8ccCLIcIxkcOCZsN5LjqETrmrFxF/UP3ThixlSD4UrEl9we0dp
         2Otg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=UAXVrsM2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p9si8110305otk.207.2019.12.14.21.43.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 14 Dec 2019 21:43:36 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=UAXVrsM2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:36320 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1igMgp-0001qW-UC
	for alex.bennee@linaro.org; Sun, 15 Dec 2019 00:43:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40331)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1igMgg-0001nJ-H7
 for qemu-arm@nongnu.org; Sun, 15 Dec 2019 00:43:27 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1igMgZ-0002Gn-2o
 for qemu-arm@nongnu.org; Sun, 15 Dec 2019 00:43:26 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:51528
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1igMgY-0002GK-VL
 for qemu-arm@nongnu.org; Sun, 15 Dec 2019 00:43:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576388598;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WYWZRg8tJRvZtH4+epWuAT8aPcYqczquMIkdW2aRs0U=;
 b=UAXVrsM2vcrUzpoXXBdHMV3opYrg3iBEBrBA06yN4dCClbrwYcTmn0xTcM3RQ2FksdAEtW
 KAd8SUbNIjalYF2dj+0P+ml19PW6zj8srSxnx3mkJMnIO136iEkVHhp4DidHKTMSyCKlUw
 e8JJ2qUln6pLji5dh+5xBdXiEL07+Cw=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-203-sKPjmi1OPiaxsOZoiUyh2w-1; Sun, 15 Dec 2019 00:43:16 -0500
Received: by mail-wr1-f70.google.com with SMTP id l20so1818934wrc.13
 for <qemu-arm@nongnu.org>; Sat, 14 Dec 2019 21:43:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=/qB7Gi5SWtltKKOuurM6xBe7Sh+GNECta0fajZrtUyI=;
 b=YY5YGO06iLtS+Jo9v2dtqYzMixVfSlgbRDK8gLzQh5A2dsifEJmMtrLPo74/6urqtZ
 R4sO8zxK2fnDC2cvMDXmkrN6QBMY9mz3dR+35GdHiYV4sAr9n6Bxn74xm4n66gC07YIF
 rLUKCb4oP2BQToS7MhESk8QCy9qX51yh6bXtPgmLYXIerRhAj5GyVno5j9rLWMrft0RJ
 G32/ITsx6DKzSdSUNwsJFbQraQQXptZVWxXp424gPW1xvIcRPb/5Sp7dXNWhvzFiR1S5
 N33ct4lx0pM78syKFbimN/jqHQvbTC/KW4IEFo7Lt737//7ssYF4lBSe8gBR04vLU8CB
 devQ==
X-Gm-Message-State: APjAAAU31vZNGU0lLV6ay7oOhpBxGnmonKFgjKUPy3RGbyvX5xZKAxk3
 jb7T2jy6DZLBdyUfNB8hO50dO+5VPfBI98eeak8Lo+Bspw1Prog9bCtC0esDe7R0nUVMzasdNCW
 OX+e1RsTK7LUJ
X-Received: by 2002:a1c:234b:: with SMTP id j72mr8631663wmj.128.1576388595220; 
 Sat, 14 Dec 2019 21:43:15 -0800 (PST)
X-Received: by 2002:a1c:234b:: with SMTP id j72mr8631649wmj.128.1576388594995; 
 Sat, 14 Dec 2019 21:43:14 -0800 (PST)
Received: from [192.168.1.35] (34.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.34])
 by smtp.gmail.com with ESMTPSA id p26sm16212404wmc.24.2019.12.14.21.43.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 14 Dec 2019 21:43:14 -0800 (PST)
Subject: Re: [PATCH v4 33/37] omap-i2c: remove PROP_PTR
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 qemu-devel@nongnu.org
References: <20191120152442.26657-1-marcandre.lureau@redhat.com>
 <20191120152442.26657-34-marcandre.lureau@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <11934efd-128a-2ebf-5b5f-3f6433acf3c6@redhat.com>
Date: Sun, 15 Dec 2019 06:43:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191120152442.26657-34-marcandre.lureau@redhat.com>
Content-Language: en-US
X-MC-Unique: sKPjmi1OPiaxsOZoiUyh2w-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: fZUX/Y1l+Wvu

On 11/20/19 4:24 PM, Marc-Andr=C3=A9 Lureau wrote:
> Since clocks are not QOM objects, replace PROP_PTR of clocks with
> setters methods.
>=20
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> Reviewed-by: Corey Minyard <cminyard@mvista.com>
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> ---
>   hw/arm/omap1.c        |  2 +-
>   hw/arm/omap2.c        |  8 ++++----
>   hw/i2c/omap_i2c.c     | 19 ++++++++++++-------
>   include/hw/arm/omap.h | 13 +++++++++++++
>   4 files changed, 30 insertions(+), 12 deletions(-)
>=20
> diff --git a/hw/arm/omap1.c b/hw/arm/omap1.c
> index 1afd1d3d7f..807e5f70d1 100644
> --- a/hw/arm/omap1.c
> +++ b/hw/arm/omap1.c
> @@ -4030,7 +4030,7 @@ struct omap_mpu_state_s *omap310_mpu_init(MemoryReg=
ion *dram,
>  =20
>       s->i2c[0] =3D qdev_create(NULL, "omap_i2c");
>       qdev_prop_set_uint8(s->i2c[0], "revision", 0x11);
> -    qdev_prop_set_ptr(s->i2c[0], "fclk", omap_findclk(s, "mpuper_ck"));
> +    omap_i2c_set_fclk(OMAP_I2C(s->i2c[0]), omap_findclk(s, "mpuper_ck"))=
;
>       qdev_init_nofail(s->i2c[0]);
>       busdev =3D SYS_BUS_DEVICE(s->i2c[0]);
>       sysbus_connect_irq(busdev, 0, qdev_get_gpio_in(s->ih[1], OMAP_INT_I=
2C));
> diff --git a/hw/arm/omap2.c b/hw/arm/omap2.c
> index 1d7cc435ef..171e2d0472 100644
> --- a/hw/arm/omap2.c
> +++ b/hw/arm/omap2.c
> @@ -2425,8 +2425,8 @@ struct omap_mpu_state_s *omap2420_mpu_init(MemoryRe=
gion *sdram,
>  =20
>       s->i2c[0] =3D qdev_create(NULL, "omap_i2c");
>       qdev_prop_set_uint8(s->i2c[0], "revision", 0x34);
> -    qdev_prop_set_ptr(s->i2c[0], "iclk", omap_findclk(s, "i2c1.iclk"));
> -    qdev_prop_set_ptr(s->i2c[0], "fclk", omap_findclk(s, "i2c1.fclk"));
> +    omap_i2c_set_iclk(OMAP_I2C(s->i2c[0]), omap_findclk(s, "i2c1.iclk"))=
;
> +    omap_i2c_set_fclk(OMAP_I2C(s->i2c[0]), omap_findclk(s, "i2c1.fclk"))=
;
>       qdev_init_nofail(s->i2c[0]);
>       busdev =3D SYS_BUS_DEVICE(s->i2c[0]);
>       sysbus_connect_irq(busdev, 0,
> @@ -2437,8 +2437,8 @@ struct omap_mpu_state_s *omap2420_mpu_init(MemoryRe=
gion *sdram,
>  =20
>       s->i2c[1] =3D qdev_create(NULL, "omap_i2c");
>       qdev_prop_set_uint8(s->i2c[1], "revision", 0x34);
> -    qdev_prop_set_ptr(s->i2c[1], "iclk", omap_findclk(s, "i2c2.iclk"));
> -    qdev_prop_set_ptr(s->i2c[1], "fclk", omap_findclk(s, "i2c2.fclk"));
> +    omap_i2c_set_iclk(OMAP_I2C(s->i2c[1]), omap_findclk(s, "i2c2.iclk"))=
;
> +    omap_i2c_set_fclk(OMAP_I2C(s->i2c[1]), omap_findclk(s, "i2c2.fclk"))=
;
>       qdev_init_nofail(s->i2c[1]);
>       busdev =3D SYS_BUS_DEVICE(s->i2c[1]);
>       sysbus_connect_irq(busdev, 0,
> diff --git a/hw/i2c/omap_i2c.c b/hw/i2c/omap_i2c.c
> index 3ba965a58f..3ccbd5cc2c 100644
> --- a/hw/i2c/omap_i2c.c
> +++ b/hw/i2c/omap_i2c.c
> @@ -28,10 +28,7 @@
>   #include "qemu/error-report.h"
>   #include "qapi/error.h"
>  =20
> -#define TYPE_OMAP_I2C "omap_i2c"
> -#define OMAP_I2C(obj) OBJECT_CHECK(OMAPI2CState, (obj), TYPE_OMAP_I2C)
> -
> -typedef struct OMAPI2CState {
> +struct OMAPI2CState {
>       SysBusDevice parent_obj;
>  =20
>       MemoryRegion iomem;
> @@ -56,7 +53,7 @@ typedef struct OMAPI2CState {
>       uint8_t divider;
>       uint8_t times[2];
>       uint16_t test;
> -} OMAPI2CState;
> +};
>  =20
>   #define OMAP2_INTR_REV=090x34
>   #define OMAP2_GC_REV=090x34
> @@ -504,10 +501,18 @@ static void omap_i2c_realize(DeviceState *dev, Erro=
r **errp)
>       }
>   }
>  =20
> +void omap_i2c_set_iclk(OMAPI2CState *i2c, omap_clk clk)
> +{
> +    i2c->iclk =3D clk;
> +}
> +
> +void omap_i2c_set_fclk(OMAPI2CState *i2c, omap_clk clk)
> +{
> +    i2c->fclk =3D clk;
> +}
> +
>   static Property omap_i2c_properties[] =3D {
>       DEFINE_PROP_UINT8("revision", OMAPI2CState, revision, 0),
> -    DEFINE_PROP_PTR("iclk", OMAPI2CState, iclk),
> -    DEFINE_PROP_PTR("fclk", OMAPI2CState, fclk),
>       DEFINE_PROP_END_OF_LIST(),
>   };
>  =20
> diff --git a/include/hw/arm/omap.h b/include/hw/arm/omap.h
> index bcecf19f89..39a295ba20 100644
> --- a/include/hw/arm/omap.h
> +++ b/include/hw/arm/omap.h
> @@ -81,6 +81,19 @@ typedef struct omap_intr_handler_s omap_intr_handler;
>   void omap_intc_set_iclk(omap_intr_handler *intc, omap_clk clk);
>   void omap_intc_set_fclk(omap_intr_handler *intc, omap_clk clk);
>  =20
> +/* omap_i2c.c */
> +#define TYPE_OMAP_I2C "omap_i2c"
> +#define OMAP_I2C(obj) OBJECT_CHECK(OMAPI2CState, (obj), TYPE_OMAP_I2C)
> +
> +typedef struct OMAPI2CState OMAPI2CState;
> +
> +/*
> + * TODO: Ideally we should have a clock framework that
> + * let us wire these clocks up with QOM properties or links.
> + */
> +void omap_i2c_set_iclk(OMAPI2CState *i2c, omap_clk clk);
> +void omap_i2c_set_fclk(OMAPI2CState *i2c, omap_clk clk);
> +
>   /* OMAP2 l4 Interconnect */
>   struct omap_l4_s;
>   struct omap_l4_region_s {
>=20

Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

