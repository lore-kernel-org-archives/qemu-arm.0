Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp3020410lff;
        Sat, 14 Dec 2019 21:43:10 -0800 (PST)
X-Google-Smtp-Source: APXvYqyixrdrtUF6C84YdNiZtiPKfeR9oKl5qH9CVIzJNHe28Zzu35MHM56AC9IsFZtpJw4Zjbon
X-Received: by 2002:a9d:6f0d:: with SMTP id n13mr24775445otq.165.1576388590462;
        Sat, 14 Dec 2019 21:43:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1576388590; cv=none;
        d=google.com; s=arc-20160816;
        b=FS55c8gd9Tf8l5HZhF38j595dMd+9d4AZ7s0Wb2Hy44z8ERVbilHvx0TQbE6KFdQJf
         r7vPxzj2Wl7xvibHuZ1JIZIJe/Qx6KXtowGhjeiJrxIKP45Ha114vNTGVZcE6N+25hGU
         n28vH+sv3D9vmvZR6EM79mqWoN+qnNpL0aBC5BJYrwnhevROSU9RBqVMzqJIE+UjzyS8
         3W7I95KAXA4YwthKWxz1wrPb24xQrZ1enTx5wIxsF6ecMn/aVqYWghq46rDLFzeR3Edp
         DvNFauLwrtXd1ENMyB7KQ/El4dvN805fvG03z2tgXucOz94gx+MkU8WaxJI8MhkUv0YW
         D0zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=w0iguMPjCokhk/BvXOjAERKF2ncfLyt4ZTfeIaCQ0W4=;
        b=THEHvnUz+kBYZ/ev6LwWYDf+kZiU/d4u+VXGxTo5WsGayMcCSr37gdhpIb5dkvNzgW
         o5r4NCbsNEX6t1Y8f6Tl4iyBDGrnkO3JrcgN0BjEW5nlvsOz3aoqsR4pPt0qRbMn4rz3
         N1WLTZG06AEydTm0J6XpTsYi+9oUSp8ZL/hjDAOmXD9Bl6zv5vYY4JJrIUIZ7NUcuXvj
         CdxT+By7t7VHVJNA3jwDyVb+sYBxlv3i0F5LHmhya2xoO7+MBO5qQlKVAcCnXlaqm7M8
         J+L1zCubjpXEOkg+nBbeO4Neomw8447Gjb0kPZqBkcpWViTT6ANZM2FwNpjAkPGIzssE
         FmKA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=hBIk5xKm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k7si8103542oia.44.2019.12.14.21.43.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 14 Dec 2019 21:43:10 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=hBIk5xKm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:36312 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1igMgP-0001TA-Iy
	for alex.bennee@linaro.org; Sun, 15 Dec 2019 00:43:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39390)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1igMgD-0001Sk-3h
 for qemu-arm@nongnu.org; Sun, 15 Dec 2019 00:43:01 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1igMgB-000233-P8
 for qemu-arm@nongnu.org; Sun, 15 Dec 2019 00:42:57 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:26116
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1igMgB-00022c-Lp
 for qemu-arm@nongnu.org; Sun, 15 Dec 2019 00:42:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576388575;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=w0iguMPjCokhk/BvXOjAERKF2ncfLyt4ZTfeIaCQ0W4=;
 b=hBIk5xKmpXjAK5Km2TRJByT/p9Y9sEoVszVL/cPpqOyTNrq+gTmqc5LaHDF2DJkUBZI2kb
 Hixx2R/h3mXTZ5JNq14cdwXX9YtP29jujLHTygbrokRk4kvoNTSrGTMXNXfahCW+Hp6BKO
 mZOct9qKlq6aVKa5d9Xc8p5aGPx9Kto=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-334-kiqccb5BPG6mhE7BwzzB2w-1; Sun, 15 Dec 2019 00:42:53 -0500
Received: by mail-wr1-f70.google.com with SMTP id r2so1820010wrp.7
 for <qemu-arm@nongnu.org>; Sat, 14 Dec 2019 21:42:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=BBVF+N2UHHpH8XDGBlGPZ8YLFBLf9UkQTyU2RhxBcDk=;
 b=dhoAHuPki9A/7GhHFDQ9CZ/IgGFdRvNVZGH6/fFck5xRhLdrk2OZs54/dZvnRL81W4
 RLuaYv6fmkFyV6i5y2AcRwE12uPqK+PBtr71ZmEHu7ErnScREVyneEsng5TZpxAKHWYU
 7mCY7AyVIEUSPhVGEKce7C85xnMx0JJEHUedX6/GxH/2OmKD5Fnt6x4tPf5ImiFy1oHL
 G2iPrMjlFZjC+fx2GVDPzVfZv2Enhl4bwI+pQqYYqXp0Cvrtmeity4lZFyYSpvS9p+zH
 kH/wQI9I0r8hB/dZmqJjSZNIDwYmNtbbrUq1pxl9CtsuxiB+jOTRXlVcV+0E9bDFImhd
 2WIQ==
X-Gm-Message-State: APjAAAXCP6yQ+Huyj+a8X7I0i/MHMN+QyVeDB15sSnCi1ns47z+EkG3D
 lIH9d87vaMbACR3h1ScI3Z/aBry2VCn6DMmlQ930RrxaWOCnDLnYdjLqd28H7v3nvvHWkDNGSdh
 JlYWCNp06G2p5
X-Received: by 2002:adf:ea4f:: with SMTP id j15mr23480572wrn.356.1576388571768; 
 Sat, 14 Dec 2019 21:42:51 -0800 (PST)
X-Received: by 2002:adf:ea4f:: with SMTP id j15mr23480552wrn.356.1576388571564; 
 Sat, 14 Dec 2019 21:42:51 -0800 (PST)
Received: from [192.168.1.35] (34.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.34])
 by smtp.gmail.com with ESMTPSA id g23sm16521121wmk.14.2019.12.14.21.42.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 14 Dec 2019 21:42:51 -0800 (PST)
Subject: Re: [PATCH v4 32/37] omap-intc: remove PROP_PTR
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 qemu-devel@nongnu.org
References: <20191120152442.26657-1-marcandre.lureau@redhat.com>
 <20191120152442.26657-33-marcandre.lureau@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <a676efcf-75ee-d791-d7fd-709ee661d928@redhat.com>
Date: Sun, 15 Dec 2019 06:42:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191120152442.26657-33-marcandre.lureau@redhat.com>
Content-Language: en-US
X-MC-Unique: kiqccb5BPG6mhE7BwzzB2w-1
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +CytYE9e/k4G

On 11/20/19 4:24 PM, Marc-Andr=C3=A9 Lureau wrote:
> Since clocks are not QOM objects, replace PROP_PTR of clocks with
> setters methods.
>=20
> (in theory there should probably be different methods for omap1 &
> omap2 intc, but this is left as a future improvement)
>=20
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> ---
>   hw/arm/omap1.c        |  4 ++--
>   hw/arm/omap2.c        |  4 ++--
>   hw/intc/omap_intc.c   | 17 ++++++++++-------
>   include/hw/arm/omap.h | 14 ++++++++++++++
>   4 files changed, 28 insertions(+), 11 deletions(-)
>=20
> diff --git a/hw/arm/omap1.c b/hw/arm/omap1.c
> index 6ce038a453..1afd1d3d7f 100644
> --- a/hw/arm/omap1.c
> +++ b/hw/arm/omap1.c
> @@ -3889,7 +3889,7 @@ struct omap_mpu_state_s *omap310_mpu_init(MemoryReg=
ion *dram,
>  =20
>       s->ih[0] =3D qdev_create(NULL, "omap-intc");
>       qdev_prop_set_uint32(s->ih[0], "size", 0x100);
> -    qdev_prop_set_ptr(s->ih[0], "clk", omap_findclk(s, "arminth_ck"));
> +    omap_intc_set_iclk(OMAP_INTC(s->ih[0]), omap_findclk(s, "arminth_ck"=
));
>       qdev_init_nofail(s->ih[0]);
>       busdev =3D SYS_BUS_DEVICE(s->ih[0]);
>       sysbus_connect_irq(busdev, 0,
> @@ -3899,7 +3899,7 @@ struct omap_mpu_state_s *omap310_mpu_init(MemoryReg=
ion *dram,
>       sysbus_mmio_map(busdev, 0, 0xfffecb00);
>       s->ih[1] =3D qdev_create(NULL, "omap-intc");
>       qdev_prop_set_uint32(s->ih[1], "size", 0x800);
> -    qdev_prop_set_ptr(s->ih[1], "clk", omap_findclk(s, "arminth_ck"));
> +    omap_intc_set_iclk(OMAP_INTC(s->ih[1]), omap_findclk(s, "arminth_ck"=
));
>       qdev_init_nofail(s->ih[1]);
>       busdev =3D SYS_BUS_DEVICE(s->ih[1]);
>       sysbus_connect_irq(busdev, 0,
> diff --git a/hw/arm/omap2.c b/hw/arm/omap2.c
> index 457f152bac..1d7cc435ef 100644
> --- a/hw/arm/omap2.c
> +++ b/hw/arm/omap2.c
> @@ -2308,8 +2308,8 @@ struct omap_mpu_state_s *omap2420_mpu_init(MemoryRe=
gion *sdram,
>       /* Actually mapped at any 2K boundary in the ARM11 private-peripher=
al if */
>       s->ih[0] =3D qdev_create(NULL, "omap2-intc");
>       qdev_prop_set_uint8(s->ih[0], "revision", 0x21);
> -    qdev_prop_set_ptr(s->ih[0], "fclk", omap_findclk(s, "mpu_intc_fclk")=
);
> -    qdev_prop_set_ptr(s->ih[0], "iclk", omap_findclk(s, "mpu_intc_iclk")=
);
> +    omap_intc_set_fclk(OMAP_INTC(s->ih[0]), omap_findclk(s, "mpu_intc_fc=
lk"));
> +    omap_intc_set_iclk(OMAP_INTC(s->ih[0]), omap_findclk(s, "mpu_intc_ic=
lk"));
>       qdev_init_nofail(s->ih[0]);
>       busdev =3D SYS_BUS_DEVICE(s->ih[0]);
>       sysbus_connect_irq(busdev, 0,
> diff --git a/hw/intc/omap_intc.c b/hw/intc/omap_intc.c
> index 854b709ca0..73bb1c2af4 100644
> --- a/hw/intc/omap_intc.c
> +++ b/hw/intc/omap_intc.c
> @@ -38,10 +38,6 @@ struct omap_intr_handler_bank_s {
>       unsigned char priority[32];
>   };
>  =20
> -#define TYPE_OMAP_INTC "common-omap-intc"
> -#define OMAP_INTC(obj) \
> -    OBJECT_CHECK(struct omap_intr_handler_s, (obj), TYPE_OMAP_INTC)
> -
>   struct omap_intr_handler_s {
>       SysBusDevice parent_obj;
>  =20
> @@ -391,9 +387,18 @@ static void omap_intc_realize(DeviceState *dev, Erro=
r **errp)
>       }
>   }
>  =20
> +void omap_intc_set_iclk(omap_intr_handler *intc, omap_clk clk)
> +{
> +    intc->iclk =3D clk;
> +}
> +
> +void omap_intc_set_fclk(omap_intr_handler *intc, omap_clk clk)
> +{
> +    intc->fclk =3D clk;
> +}
> +
>   static Property omap_intc_properties[] =3D {
>       DEFINE_PROP_UINT32("size", struct omap_intr_handler_s, size, 0x100)=
,
> -    DEFINE_PROP_PTR("clk", struct omap_intr_handler_s, iclk),
>       DEFINE_PROP_END_OF_LIST(),
>   };
>  =20
> @@ -647,8 +652,6 @@ static void omap2_intc_realize(DeviceState *dev, Erro=
r **errp)
>   static Property omap2_intc_properties[] =3D {
>       DEFINE_PROP_UINT8("revision", struct omap_intr_handler_s,
>       revision, 0x21),
> -    DEFINE_PROP_PTR("iclk", struct omap_intr_handler_s, iclk),
> -    DEFINE_PROP_PTR("fclk", struct omap_intr_handler_s, fclk),
>       DEFINE_PROP_END_OF_LIST(),
>   };
>  =20
> diff --git a/include/hw/arm/omap.h b/include/hw/arm/omap.h
> index f3aa670036..bcecf19f89 100644
> --- a/include/hw/arm/omap.h
> +++ b/include/hw/arm/omap.h
> @@ -67,6 +67,20 @@ void omap_clk_setrate(omap_clk clk, int divide, int mu=
ltiply);
>   int64_t omap_clk_getrate(omap_clk clk);
>   void omap_clk_reparent(omap_clk clk, omap_clk parent);
>  =20
> +/* omap_intc.c */
> +#define TYPE_OMAP_INTC "common-omap-intc"
> +#define OMAP_INTC(obj)                                              \
> +    OBJECT_CHECK(omap_intr_handler, (obj), TYPE_OMAP_INTC)
> +
> +typedef struct omap_intr_handler_s omap_intr_handler;
> +
> +/*
> + * TODO: Ideally we should have a clock framework that
> + * let us wire these clocks up with QOM properties or links.
> + */
> +void omap_intc_set_iclk(omap_intr_handler *intc, omap_clk clk);
> +void omap_intc_set_fclk(omap_intr_handler *intc, omap_clk clk);
> +
>   /* OMAP2 l4 Interconnect */
>   struct omap_l4_s;
>   struct omap_l4_region_s {
>=20

Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

