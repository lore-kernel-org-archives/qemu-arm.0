Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp3021553lff;
        Sat, 14 Dec 2019 21:44:44 -0800 (PST)
X-Google-Smtp-Source: APXvYqyLdpkZRFtCixaxxxX4g6iNIEYdmAxSHuYHAuFmwSPSl2uXDumUusYQJ48hrL/H/aEryRZF
X-Received: by 2002:a05:6830:20cf:: with SMTP id z15mr24532400otq.277.1576388684657;
        Sat, 14 Dec 2019 21:44:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1576388684; cv=none;
        d=google.com; s=arc-20160816;
        b=XHDoytKMw1i2Zd4cBOiR2mn9kqujr1tVZRP8sxJ8vx+hADAnaIgyu1Jg9itFpNRFKD
         4M00of3u/HwXQUu6XAJsRavRCk4vjg4aJliIZEov/mgFTHf1kodL2U8C5yGF+ckv3vCG
         cgRGHynwx1Dc2rl3vw7mW/hJsFWBMxwajeAXiyEB6oJC0WFBwodSCOzFw7FDURM96Oko
         oXfVCiiRdz4hfy+Xx5C3mKefGV18oKBGnq5syzaY9BHR5nhQSDMyyKo1nEK4mLVpu421
         m1RH8sZPr+gRSV9RSDbgu04WEMqYAL1Z3aCYUr+fF0KEzJU2tDiSl7kqrPafrwJGhlzv
         0gOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=TXHDthb2VBRza70jI/L32cZ/r6ruv8qzxHsEBU/KZok=;
        b=EwcXxbMmxabBkF8K8hRY4Y59pyHHjSs72TNapdPgInyUQp+22EHgpGJ2B7O5jXQwLg
         Kp0qzI4lOUx+zT8wbJlUx+NQQ3QLIPdHhqnazvIjOVZatpHyUrhqW0SNiWsoYCs1+xOb
         F+CxHR0nfWKdTKk+Zodem29mifXEDg0n/8lcQMI89r7e4XsPl18LBo5WMLKYYX3R5IYi
         4yf6Qu7aWAhKNpXskHqz7RtlGGIlccd4pG+zBu9k+qXRB/VQC0Sd+0uwFJx90w62qnlx
         2QGdj9V0C5ZXG6b+EKTRqoQoXfOcsW3qqNBvHBhXKJ8RvPR8UXULytLRQVLxDwSdzRTY
         xxwQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=f6W6q6fS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w1si8390732otp.57.2019.12.14.21.44.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 14 Dec 2019 21:44:44 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=f6W6q6fS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:36336 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1igMhv-0003F5-JR
	for alex.bennee@linaro.org; Sun, 15 Dec 2019 00:44:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43452)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1igMhk-0003CG-A5
 for qemu-arm@nongnu.org; Sun, 15 Dec 2019 00:44:33 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1igMhi-00034A-Oe
 for qemu-arm@nongnu.org; Sun, 15 Dec 2019 00:44:32 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:45123
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1igMhi-00033m-Kq
 for qemu-arm@nongnu.org; Sun, 15 Dec 2019 00:44:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576388670;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TXHDthb2VBRza70jI/L32cZ/r6ruv8qzxHsEBU/KZok=;
 b=f6W6q6fSvtDLoZEOFpmYRT48dRfBb16UoOx6qnU6dInZT6BpQQ6foEiGfGVmdA/BX4mLzK
 L1Hp0lCnnOpU2gNk/qJRYvDLc1KRVqGcHJIsKSsfCXtCHGBsKGoaTdbPb5vGAUs43R5OmV
 bArGXY4veHDuBcSAVWR0UlyNf37Wlms=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-37-t9fYAKukPxGFSAyS78B-BA-1; Sun, 15 Dec 2019 00:44:28 -0500
Received: by mail-wr1-f70.google.com with SMTP id h30so1824870wrh.5
 for <qemu-arm@nongnu.org>; Sat, 14 Dec 2019 21:44:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=LCbxER/qbDrWnzhBNY67VUK81ytUvAaa8+3YGAyx2t0=;
 b=Phu/5qicJQcFyAJkW2XQ4GMBiFLqjNVpM627bzx4HwRKlWqP/3GRy9VIagJ7xrho5E
 DKuf5pvczb/CDWnadDk7eF4QKZwzXo8FYB/0Kmr+lqfIheWBr3H/bUxbKqF5SuqCdrNi
 6S4dcoHOZTaRd+WZnQnKZNjJJGh5TTjw0cmrH+EA523eSDMeuvnlO6JWj/C+w2R/N7w7
 Ezw90IywKeeo45EGItwKqCGmpsqGkTpTmxvbDOGYORERePLLoBexm8Jp3LanaF1yOZJu
 B109pKa1q2rEq7D6vEGz02dsOFCeCvJfBqenKJ4tcwUSg4CndNWliGDcFfrt49tvgfff
 9DAA==
X-Gm-Message-State: APjAAAWTl6ovNvWqbqFD+lJUnUEiQuJGmsczJiK0cDbUdu0fw1JE46YQ
 YUXYqt0dZIgUz7KebND0ZOjaeknE/2HWVRzYfk4bFts3Kbp74X5RYKxiQfnk4+jQ+LMGaDxOyDh
 /sfqMuVXrTRQn
X-Received: by 2002:adf:f1d0:: with SMTP id z16mr21935057wro.209.1576388667214; 
 Sat, 14 Dec 2019 21:44:27 -0800 (PST)
X-Received: by 2002:adf:f1d0:: with SMTP id z16mr21935041wro.209.1576388666933; 
 Sat, 14 Dec 2019 21:44:26 -0800 (PST)
Received: from [192.168.1.35] (34.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.34])
 by smtp.gmail.com with ESMTPSA id w13sm16640128wru.38.2019.12.14.21.44.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 14 Dec 2019 21:44:26 -0800 (PST)
Subject: Re: [PATCH v4 34/37] omap-gpio: remove PROP_PTR
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 qemu-devel@nongnu.org
References: <20191120152442.26657-1-marcandre.lureau@redhat.com>
 <20191120152442.26657-35-marcandre.lureau@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <904a5fd6-4b16-9f51-b6eb-0f45e451ccf7@redhat.com>
Date: Sun, 15 Dec 2019 06:44:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191120152442.26657-35-marcandre.lureau@redhat.com>
Content-Language: en-US
X-MC-Unique: t9fYAKukPxGFSAyS78B-BA-1
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
X-TUID: S/tVplQTDQZq

On 11/20/19 4:24 PM, Marc-Andr=C3=A9 Lureau wrote:
> Since clocks are not QOM objects, replace PROP_PTR of clocks with
> setters methods.
>=20
> Move/adapt the existing TODO comment about a clock framework.
>=20
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> ---
>   hw/arm/omap1.c        |  2 +-
>   hw/arm/omap2.c        | 13 +++++++------
>   hw/gpio/omap_gpio.c   | 42 +++++++++++++++---------------------------
>   include/hw/arm/omap.h | 33 +++++++++++++++++++++++++++++----
>   4 files changed, 52 insertions(+), 38 deletions(-)
>=20
> diff --git a/hw/arm/omap1.c b/hw/arm/omap1.c
> index 807e5f70d1..761cc17ea9 100644
> --- a/hw/arm/omap1.c
> +++ b/hw/arm/omap1.c
> @@ -4012,7 +4012,7 @@ struct omap_mpu_state_s *omap310_mpu_init(MemoryReg=
ion *dram,
>  =20
>       s->gpio =3D qdev_create(NULL, "omap-gpio");
>       qdev_prop_set_int32(s->gpio, "mpu_model", s->mpu_model);
> -    qdev_prop_set_ptr(s->gpio, "clk", omap_findclk(s, "arm_gpio_ck"));
> +    omap_gpio_set_clk(OMAP1_GPIO(s->gpio), omap_findclk(s, "arm_gpio_ck"=
));
>       qdev_init_nofail(s->gpio);
>       sysbus_connect_irq(SYS_BUS_DEVICE(s->gpio), 0,
>                          qdev_get_gpio_in(s->ih[0], OMAP_INT_GPIO_BANK1))=
;
> diff --git a/hw/arm/omap2.c b/hw/arm/omap2.c
> index 171e2d0472..e1c11de5ce 100644
> --- a/hw/arm/omap2.c
> +++ b/hw/arm/omap2.c
> @@ -2449,13 +2449,14 @@ struct omap_mpu_state_s *omap2420_mpu_init(Memory=
Region *sdram,
>  =20
>       s->gpio =3D qdev_create(NULL, "omap2-gpio");
>       qdev_prop_set_int32(s->gpio, "mpu_model", s->mpu_model);
> -    qdev_prop_set_ptr(s->gpio, "iclk", omap_findclk(s, "gpio_iclk"));
> -    qdev_prop_set_ptr(s->gpio, "fclk0", omap_findclk(s, "gpio1_dbclk"));
> -    qdev_prop_set_ptr(s->gpio, "fclk1", omap_findclk(s, "gpio2_dbclk"));
> -    qdev_prop_set_ptr(s->gpio, "fclk2", omap_findclk(s, "gpio3_dbclk"));
> -    qdev_prop_set_ptr(s->gpio, "fclk3", omap_findclk(s, "gpio4_dbclk"));
> +    omap2_gpio_set_iclk(OMAP2_GPIO(s->gpio), omap_findclk(s, "gpio_iclk"=
));
> +    omap2_gpio_set_fclk(OMAP2_GPIO(s->gpio), 0, omap_findclk(s, "gpio1_d=
bclk"));
> +    omap2_gpio_set_fclk(OMAP2_GPIO(s->gpio), 1, omap_findclk(s, "gpio2_d=
bclk"));
> +    omap2_gpio_set_fclk(OMAP2_GPIO(s->gpio), 2, omap_findclk(s, "gpio3_d=
bclk"));
> +    omap2_gpio_set_fclk(OMAP2_GPIO(s->gpio), 3, omap_findclk(s, "gpio4_d=
bclk"));
>       if (s->mpu_model =3D=3D omap2430) {
> -        qdev_prop_set_ptr(s->gpio, "fclk4", omap_findclk(s, "gpio5_dbclk=
"));
> +        omap2_gpio_set_fclk(OMAP2_GPIO(s->gpio), 4,
> +                            omap_findclk(s, "gpio5_dbclk"));
>       }
>       qdev_init_nofail(s->gpio);
>       busdev =3D SYS_BUS_DEVICE(s->gpio);
> diff --git a/hw/gpio/omap_gpio.c b/hw/gpio/omap_gpio.c
> index 41e1aa798c..85c16897ae 100644
> --- a/hw/gpio/omap_gpio.c
> +++ b/hw/gpio/omap_gpio.c
> @@ -40,10 +40,6 @@ struct omap_gpio_s {
>       uint16_t pins;
>   };
>  =20
> -#define TYPE_OMAP1_GPIO "omap-gpio"
> -#define OMAP1_GPIO(obj) \
> -    OBJECT_CHECK(struct omap_gpif_s, (obj), TYPE_OMAP1_GPIO)
> -
>   struct omap_gpif_s {
>       SysBusDevice parent_obj;
>  =20
> @@ -212,10 +208,6 @@ struct omap2_gpio_s {
>       uint8_t delay;
>   };
>  =20
> -#define TYPE_OMAP2_GPIO "omap2-gpio"
> -#define OMAP2_GPIO(obj) \
> -    OBJECT_CHECK(struct omap2_gpif_s, (obj), TYPE_OMAP2_GPIO)
> -
>   struct omap2_gpif_s {
>       SysBusDevice parent_obj;
>  =20
> @@ -747,21 +739,13 @@ static void omap2_gpio_realize(DeviceState *dev, Er=
ror **errp)
>       }
>   }
>  =20
> -/* Using qdev pointer properties for the clocks is not ideal.
> - * qdev should support a generic means of defining a 'port' with
> - * an arbitrary interface for connecting two devices. Then we
> - * could reframe the omap clock API in terms of clock ports,
> - * and get some type safety. For now the best qdev provides is
> - * passing an arbitrary pointer.
> - * (It's not possible to pass in the string which is the clock
> - * name, because this device does not have the necessary information
> - * (ie the struct omap_mpu_state_s*) to do the clockname to pointer
> - * translation.)
> - */
> +void omap_gpio_set_clk(omap_gpif *gpio, omap_clk clk)
> +{
> +    gpio->clk =3D clk;
> +}
>  =20
>   static Property omap_gpio_properties[] =3D {
>       DEFINE_PROP_INT32("mpu_model", struct omap_gpif_s, mpu_model, 0),
> -    DEFINE_PROP_PTR("clk", struct omap_gpif_s, clk),
>       DEFINE_PROP_END_OF_LIST(),
>   };
>  =20
> @@ -784,15 +768,19 @@ static const TypeInfo omap_gpio_info =3D {
>       .class_init    =3D omap_gpio_class_init,
>   };
>  =20
> +void omap2_gpio_set_iclk(omap2_gpif *gpio, omap_clk clk)
> +{
> +    gpio->iclk =3D clk;
> +}
> +
> +void omap2_gpio_set_fclk(omap2_gpif *gpio, uint8_t i, omap_clk clk)
> +{
> +    assert(i <=3D 5);
> +    gpio->fclk[i] =3D clk;
> +}
> +
>   static Property omap2_gpio_properties[] =3D {
>       DEFINE_PROP_INT32("mpu_model", struct omap2_gpif_s, mpu_model, 0),
> -    DEFINE_PROP_PTR("iclk", struct omap2_gpif_s, iclk),
> -    DEFINE_PROP_PTR("fclk0", struct omap2_gpif_s, fclk[0]),
> -    DEFINE_PROP_PTR("fclk1", struct omap2_gpif_s, fclk[1]),
> -    DEFINE_PROP_PTR("fclk2", struct omap2_gpif_s, fclk[2]),
> -    DEFINE_PROP_PTR("fclk3", struct omap2_gpif_s, fclk[3]),
> -    DEFINE_PROP_PTR("fclk4", struct omap2_gpif_s, fclk[4]),
> -    DEFINE_PROP_PTR("fclk5", struct omap2_gpif_s, fclk[5]),
>       DEFINE_PROP_END_OF_LIST(),
>   };
>  =20
> diff --git a/include/hw/arm/omap.h b/include/hw/arm/omap.h
> index 39a295ba20..6be386d0e2 100644
> --- a/include/hw/arm/omap.h
> +++ b/include/hw/arm/omap.h
> @@ -77,6 +77,16 @@ typedef struct omap_intr_handler_s omap_intr_handler;
>   /*
>    * TODO: Ideally we should have a clock framework that
>    * let us wire these clocks up with QOM properties or links.
> + *
> + * qdev should support a generic means of defining a 'port' with
> + * an arbitrary interface for connecting two devices. Then we
> + * could reframe the omap clock API in terms of clock ports,
> + * and get some type safety. For now the best qdev provides is
> + * passing an arbitrary pointer.
> + * (It's not possible to pass in the string which is the clock
> + * name, because this device does not have the necessary information
> + * (ie the struct omap_mpu_state_s*) to do the clockname to pointer
> + * translation.)
>    */
>   void omap_intc_set_iclk(omap_intr_handler *intc, omap_clk clk);
>   void omap_intc_set_fclk(omap_intr_handler *intc, omap_clk clk);
> @@ -87,13 +97,28 @@ void omap_intc_set_fclk(omap_intr_handler *intc, omap=
_clk clk);
>  =20
>   typedef struct OMAPI2CState OMAPI2CState;
>  =20
> -/*
> - * TODO: Ideally we should have a clock framework that
> - * let us wire these clocks up with QOM properties or links.
> - */
> +/* TODO: clock framework (see above) */
>   void omap_i2c_set_iclk(OMAPI2CState *i2c, omap_clk clk);
>   void omap_i2c_set_fclk(OMAPI2CState *i2c, omap_clk clk);
>  =20
> +/* omap_gpio.c */
> +#define TYPE_OMAP1_GPIO "omap-gpio"
> +#define OMAP1_GPIO(obj)                                         \
> +    OBJECT_CHECK(struct omap_gpif_s, (obj), TYPE_OMAP1_GPIO)
> +
> +#define TYPE_OMAP2_GPIO "omap2-gpio"
> +#define OMAP2_GPIO(obj)                                         \
> +    OBJECT_CHECK(struct omap2_gpif_s, (obj), TYPE_OMAP2_GPIO)
> +
> +typedef struct omap_gpif_s omap_gpif;
> +typedef struct omap2_gpif_s omap2_gpif;
> +
> +/* TODO: clock framework (see above) */
> +void omap_gpio_set_clk(omap_gpif *gpio, omap_clk clk);
> +
> +void omap2_gpio_set_iclk(omap2_gpif *gpio, omap_clk clk);
> +void omap2_gpio_set_fclk(omap2_gpif *gpio, uint8_t i, omap_clk clk);
> +
>   /* OMAP2 l4 Interconnect */
>   struct omap_l4_s;
>   struct omap_l4_region_s {
>=20

Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

