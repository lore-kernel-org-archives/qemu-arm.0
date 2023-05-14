Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp6066453ejq;
        Sun, 14 May 2023 11:58:05 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7pIMsPMWNd4HSYalQH9PUr/Fcg9acfNS0EwfhP+3ME/o4tHzXi1mYkYfk900HMOuU/fS3b
X-Received: by 2002:a05:622a:1810:b0:3ef:5d74:8195 with SMTP id t16-20020a05622a181000b003ef5d748195mr50704757qtc.28.1684090685184;
        Sun, 14 May 2023 11:58:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684090685; cv=none;
        d=google.com; s=arc-20160816;
        b=t0TzLMp5i/kLy3YnL6O83RyiPKeP61HyxPkpr0S10YR29gEXx8OyyNQoqF+cRbKmjO
         WR7Dt9kOAgRmEub+9pTNLnVA5UGlDDSBv44Jh7DY6ALcLAxwTgVik6dwFpa6/hphedmA
         Gk+NJW0OC7+9mK8uGbQBpXv9kCSqS4/N2/rXXzpxxdHlXgw5V1Bo6p5olnri209iPoEW
         gYv43pOSYGyCQ6eAPRFdmHOnX5Gl4xusLP2wYoa15BfwBzOax9Hm2oYmtyBPc7YN62LI
         WyCIWUPPtxE4pCozL/4CvFaJa1DW1N8vQSrkS/7vUmdlnVeZeE2H3zSMyDO7NNONCcyc
         ndDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=PBotCoFUep/tSLp81rfgkdBfAyKNZLJqNP820ARp47k=;
        b=bt3xhRdoSgH3bWdt3zTeYzxXc3h36TNqvAd3LNqbJ0nL3f1Ij3NWyDIkM/Coqd+4gb
         TsI3NjiJLoAIaAOK22UDwg4JdcnUcM3dWMgBuON4OeyN18h3QpB8IfrIbdkAOqkC2eZr
         QitCVZbwJCHQCxzQmPQuLPuclqw6Qg6dYi6+1Xphh2PV/84ouusLVn91ZM4bclBL43Il
         fHOmA9XLXe6HOK3wRuotwONPBDazvo85bwlMYwXa4PFjJ0p1SMOylEHSnF9HONRi3WbW
         PK0pGC7zYmWFViecMLHL75kT4KAR0NS0U6VqMCWoSq4sQ64Z8bhcG6G+1CQLOf+HJFhv
         3cQg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20221208 header.b=pkbMFbWw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p18-20020a05622a00d200b003f364f9d0f4si8641049qtw.527.2023.05.14.11.58.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 14 May 2023 11:58:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20221208 header.b=pkbMFbWw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pyGuv-00039o-PY; Sun, 14 May 2023 14:58:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nieklinnenbank@gmail.com>)
 id 1pyGut-00039E-Sp; Sun, 14 May 2023 14:57:59 -0400
Received: from mail-yb1-xb31.google.com ([2607:f8b0:4864:20::b31])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <nieklinnenbank@gmail.com>)
 id 1pyGus-0002f7-15; Sun, 14 May 2023 14:57:59 -0400
Received: by mail-yb1-xb31.google.com with SMTP id
 3f1490d57ef6-ba6e8965227so4821273276.0; 
 Sun, 14 May 2023 11:57:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1684090676; x=1686682676;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=PBotCoFUep/tSLp81rfgkdBfAyKNZLJqNP820ARp47k=;
 b=pkbMFbWwyD+2/3jw+zuPFudg5bYxwvAC/fQyABJJJCbkFynuCQ0hkEOva4vUVbKVyI
 w35QGb0S70hmXF+hz/jC6PdcEPCo2uXg8mhHP9u7UIxj53w7n2yjWx/fHaJqM4ztrUV0
 dwwdrpXR7pNxIv+dsCqjfyz+i8gyYOClSGNZrlcdwXj1M99BV7EDl7DeUHIRoVwp4ocb
 LXJNH+3mimc5ffaGeR7hQ3RU4vNWL6NvYJgvKNKTQX3+FHjvz8tFuG6RYKmiou7NnRkx
 8GaHwnw4dC1WWv1m6/bEZ9obEQfJyOE68SHMm5jPyovE694JW0qanmHKfMlJoPoIU/ps
 fjFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684090676; x=1686682676;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=PBotCoFUep/tSLp81rfgkdBfAyKNZLJqNP820ARp47k=;
 b=de0tQT4ulzeX9fkgfTHifqriik8NlpVRvRrKTIpJIdlIt6XOxixrC0k9ZDDKVpv3m1
 OH8G9bolHtAoLdQ3DClptD5bCh58sTiHN5CQ77SGYhL4LS7Z2guGdstKTTeADVLf91V1
 oWmMrU8jEXgf3uBbSefPE/rSg3UQHsFvRAhB18c1RHvrSG21FVGC2IbNt/KMZXMqU5EX
 ypDhWBoCmY5GDhxiG7lE8MqtCM9B0OVXn0GOugGFOEdS1+tek9Cw1paLM5y2m6quEi5N
 FZ4e76ZiC+YQBgZThJxkLmW07M/oU3phTRgk6Q10zBpxZURkRq84rnub8lTIc6jlm3Ad
 Kxfw==
X-Gm-Message-State: AC+VfDz0D7+gj2SJNSItWH8mVJaGe0GL9qo7k5rDO09hWJRO6dW1iuI7
 77eMfmS7QRHoNSXkFM9Jjfz7AK8T1Qt9k9cDnz8=
X-Received: by 2002:a25:ad4f:0:b0:ba1:8788:1706 with SMTP id
 l15-20020a25ad4f000000b00ba187881706mr27803768ybe.22.1684090675667; Sun, 14
 May 2023 11:57:55 -0700 (PDT)
MIME-Version: 1.0
References: <20230510103004.30015-1-qianfanguijin@163.com>
 <20230510103004.30015-5-qianfanguijin@163.com>
In-Reply-To: <20230510103004.30015-5-qianfanguijin@163.com>
From: Niek Linnenbank <nieklinnenbank@gmail.com>
Date: Sun, 14 May 2023 20:57:44 +0200
Message-ID: <CAPan3WrpOBdW8pWv_LdKu=AO8=z8rOBZos+UTYmedWVPQwhSDA@mail.gmail.com>
Subject: Re: [PATCH v4 04/11] hw: arm: allwinner-r40: Add i2c0 device
To: qianfanguijin@163.com
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, 
 Beniamino Galvani <b.galvani@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Content-Type: multipart/alternative; boundary="0000000000007e2bd705fbabeadf"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b31;
 envelope-from=nieklinnenbank@gmail.com; helo=mail-yb1-xb31.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: 1y0G34mmg/JE

--0000000000007e2bd705fbabeadf
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 10, 2023 at 12:30=E2=80=AFPM <qianfanguijin@163.com> wrote:

> From: qianfan Zhao <qianfanguijin@163.com>
>
> TWI(i2c) is designed to be used as an interface between CPU host and the
> serial 2-Wire bus. It can support all standard 2-Wire transfer, can be
> operated in standard mode(100kbit/s) or fast-mode, supporting data rate
> up to 400kbit/s.
>
> Signed-off-by: qianfan Zhao <qianfanguijin@163.com>
>
Reviewed-by: Niek Linnenbank <nieklinnenbank@gmail.com>

> ---
>  hw/arm/allwinner-r40.c         | 11 ++++++++++-
>  include/hw/arm/allwinner-r40.h |  3 +++
>  2 files changed, 13 insertions(+), 1 deletion(-)
>
> diff --git a/hw/arm/allwinner-r40.c b/hw/arm/allwinner-r40.c
> index 537a90b23d..4bc582630c 100644
> --- a/hw/arm/allwinner-r40.c
> +++ b/hw/arm/allwinner-r40.c
> @@ -52,6 +52,7 @@ const hwaddr allwinner_r40_memmap[] =3D {
>      [AW_R40_DEV_UART5]      =3D 0x01c29400,
>      [AW_R40_DEV_UART6]      =3D 0x01c29800,
>      [AW_R40_DEV_UART7]      =3D 0x01c29c00,
> +    [AW_R40_DEV_TWI0]       =3D 0x01c2ac00,
>      [AW_R40_DEV_GIC_DIST]   =3D 0x01c81000,
>      [AW_R40_DEV_GIC_CPU]    =3D 0x01c82000,
>      [AW_R40_DEV_GIC_HYP]    =3D 0x01c84000,
> @@ -115,7 +116,6 @@ static struct AwR40Unimplemented r40_unimplemented[] =
=3D
> {
>      { "uart7",      0x01c29c00, 1 * KiB },
>      { "ps20",       0x01c2a000, 1 * KiB },
>      { "ps21",       0x01c2a400, 1 * KiB },
> -    { "twi0",       0x01c2ac00, 1 * KiB },
>      { "twi1",       0x01c2b000, 1 * KiB },
>      { "twi2",       0x01c2b400, 1 * KiB },
>      { "twi3",       0x01c2b800, 1 * KiB },
> @@ -167,6 +167,7 @@ enum {
>      AW_R40_GIC_SPI_UART1     =3D  2,
>      AW_R40_GIC_SPI_UART2     =3D  3,
>      AW_R40_GIC_SPI_UART3     =3D  4,
> +    AW_R40_GIC_SPI_TWI0      =3D  7,
>      AW_R40_GIC_SPI_UART4     =3D 17,
>      AW_R40_GIC_SPI_UART5     =3D 18,
>      AW_R40_GIC_SPI_UART6     =3D 19,
> @@ -270,6 +271,8 @@ static void allwinner_r40_init(Object *obj)
>          object_initialize_child(obj, mmc_names[i], &s->mmc[i],
>                                  TYPE_AW_SDHOST_SUN5I);
>      }
> +
> +    object_initialize_child(obj, "twi0", &s->i2c0, TYPE_AW_I2C_SUN6I);
>  }
>
>  static void allwinner_r40_realize(DeviceState *dev, Error **errp)
> @@ -416,6 +419,12 @@ static void allwinner_r40_realize(DeviceState *dev,
> Error **errp)
>                         115200, serial_hd(i), DEVICE_NATIVE_ENDIAN);
>      }
>
> +    /* I2C */
> +    sysbus_realize(SYS_BUS_DEVICE(&s->i2c0), &error_fatal);
> +    sysbus_mmio_map(SYS_BUS_DEVICE(&s->i2c0), 0,
> s->memmap[AW_R40_DEV_TWI0]);
> +    sysbus_connect_irq(SYS_BUS_DEVICE(&s->i2c0), 0,
> +                       qdev_get_gpio_in(DEVICE(&s->gic),
> AW_R40_GIC_SPI_TWI0));
> +
>      /* Unimplemented devices */
>      for (i =3D 0; i < ARRAY_SIZE(r40_unimplemented); i++) {
>          create_unimplemented_device(r40_unimplemented[i].device_name,
> diff --git a/include/hw/arm/allwinner-r40.h
> b/include/hw/arm/allwinner-r40.h
> index 959b5dc4e0..95366f4eee 100644
> --- a/include/hw/arm/allwinner-r40.h
> +++ b/include/hw/arm/allwinner-r40.h
> @@ -26,6 +26,7 @@
>  #include "hw/intc/arm_gic.h"
>  #include "hw/sd/allwinner-sdhost.h"
>  #include "hw/misc/allwinner-r40-ccu.h"
> +#include "hw/i2c/allwinner-i2c.h"
>  #include "target/arm/cpu.h"
>  #include "sysemu/block-backend.h"
>
> @@ -48,6 +49,7 @@ enum {
>      AW_R40_DEV_UART5,
>      AW_R40_DEV_UART6,
>      AW_R40_DEV_UART7,
> +    AW_R40_DEV_TWI0,
>      AW_R40_DEV_GIC_DIST,
>      AW_R40_DEV_GIC_CPU,
>      AW_R40_DEV_GIC_HYP,
> @@ -89,6 +91,7 @@ struct AwR40State {
>      AwA10PITState timer;
>      AwSdHostState mmc[AW_R40_NUM_MMCS];
>      AwR40ClockCtlState ccu;
> +    AWI2CState i2c0;
>      GICState gic;
>      MemoryRegion sram_a1;
>      MemoryRegion sram_a2;
> --
> 2.25.1
>
>

--=20
Niek Linnenbank

--0000000000007e2bd705fbabeadf
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, May 10, 2023 at 12:30=E2=80=
=AFPM &lt;<a href=3D"mailto:qianfanguijin@163.com">qianfanguijin@163.com</a=
>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Fro=
m: qianfan Zhao &lt;<a href=3D"mailto:qianfanguijin@163.com" target=3D"_bla=
nk">qianfanguijin@163.com</a>&gt;<br>
<br>
TWI(i2c) is designed to be used as an interface between CPU host and the<br=
>
serial 2-Wire bus. It can support all standard 2-Wire transfer, can be<br>
operated in standard mode(100kbit/s) or fast-mode, supporting data rate<br>
up to 400kbit/s.<br>
<br>
Signed-off-by: qianfan Zhao &lt;<a href=3D"mailto:qianfanguijin@163.com" ta=
rget=3D"_blank">qianfanguijin@163.com</a>&gt;<br></blockquote><div>Reviewed=
-by: Niek Linnenbank &lt;<a href=3D"mailto:nieklinnenbank@gmail.com">niekli=
nnenbank@gmail.com</a>&gt; <br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">
---<br>
=C2=A0hw/arm/allwinner-r40.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 11 ++++++++=
++-<br>
=C2=A0include/hw/arm/allwinner-r40.h |=C2=A0 3 +++<br>
=C2=A02 files changed, 13 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/hw/arm/allwinner-r40.c b/hw/arm/allwinner-r40.c<br>
index 537a90b23d..4bc582630c 100644<br>
--- a/hw/arm/allwinner-r40.c<br>
+++ b/hw/arm/allwinner-r40.c<br>
@@ -52,6 +52,7 @@ const hwaddr allwinner_r40_memmap[] =3D {<br>
=C2=A0 =C2=A0 =C2=A0[AW_R40_DEV_UART5]=C2=A0 =C2=A0 =C2=A0 =3D 0x01c29400,<=
br>
=C2=A0 =C2=A0 =C2=A0[AW_R40_DEV_UART6]=C2=A0 =C2=A0 =C2=A0 =3D 0x01c29800,<=
br>
=C2=A0 =C2=A0 =C2=A0[AW_R40_DEV_UART7]=C2=A0 =C2=A0 =C2=A0 =3D 0x01c29c00,<=
br>
+=C2=A0 =C2=A0 [AW_R40_DEV_TWI0]=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D 0x01c2ac00,<=
br>
=C2=A0 =C2=A0 =C2=A0[AW_R40_DEV_GIC_DIST]=C2=A0 =C2=A0=3D 0x01c81000,<br>
=C2=A0 =C2=A0 =C2=A0[AW_R40_DEV_GIC_CPU]=C2=A0 =C2=A0 =3D 0x01c82000,<br>
=C2=A0 =C2=A0 =C2=A0[AW_R40_DEV_GIC_HYP]=C2=A0 =C2=A0 =3D 0x01c84000,<br>
@@ -115,7 +116,6 @@ static struct AwR40Unimplemented r40_unimplemented[] =
=3D {<br>
=C2=A0 =C2=A0 =C2=A0{ &quot;uart7&quot;,=C2=A0 =C2=A0 =C2=A0 0x01c29c00, 1 =
* KiB },<br>
=C2=A0 =C2=A0 =C2=A0{ &quot;ps20&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A00x01c2a00=
0, 1 * KiB },<br>
=C2=A0 =C2=A0 =C2=A0{ &quot;ps21&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A00x01c2a40=
0, 1 * KiB },<br>
-=C2=A0 =C2=A0 { &quot;twi0&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A00x01c2ac00, 1 =
* KiB },<br>
=C2=A0 =C2=A0 =C2=A0{ &quot;twi1&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A00x01c2b00=
0, 1 * KiB },<br>
=C2=A0 =C2=A0 =C2=A0{ &quot;twi2&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A00x01c2b40=
0, 1 * KiB },<br>
=C2=A0 =C2=A0 =C2=A0{ &quot;twi3&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A00x01c2b80=
0, 1 * KiB },<br>
@@ -167,6 +167,7 @@ enum {<br>
=C2=A0 =C2=A0 =C2=A0AW_R40_GIC_SPI_UART1=C2=A0 =C2=A0 =C2=A0=3D=C2=A0 2,<br=
>
=C2=A0 =C2=A0 =C2=A0AW_R40_GIC_SPI_UART2=C2=A0 =C2=A0 =C2=A0=3D=C2=A0 3,<br=
>
=C2=A0 =C2=A0 =C2=A0AW_R40_GIC_SPI_UART3=C2=A0 =C2=A0 =C2=A0=3D=C2=A0 4,<br=
>
+=C2=A0 =C2=A0 AW_R40_GIC_SPI_TWI0=C2=A0 =C2=A0 =C2=A0 =3D=C2=A0 7,<br>
=C2=A0 =C2=A0 =C2=A0AW_R40_GIC_SPI_UART4=C2=A0 =C2=A0 =C2=A0=3D 17,<br>
=C2=A0 =C2=A0 =C2=A0AW_R40_GIC_SPI_UART5=C2=A0 =C2=A0 =C2=A0=3D 18,<br>
=C2=A0 =C2=A0 =C2=A0AW_R40_GIC_SPI_UART6=C2=A0 =C2=A0 =C2=A0=3D 19,<br>
@@ -270,6 +271,8 @@ static void allwinner_r40_init(Object *obj)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0object_initialize_child(obj, mmc_names[i]=
, &amp;s-&gt;mmc[i],<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0TYPE_AW_SDHOST_SUN5I);<br>
=C2=A0 =C2=A0 =C2=A0}<br>
+<br>
+=C2=A0 =C2=A0 object_initialize_child(obj, &quot;twi0&quot;, &amp;s-&gt;i2=
c0, TYPE_AW_I2C_SUN6I);<br>
=C2=A0}<br>
<br>
=C2=A0static void allwinner_r40_realize(DeviceState *dev, Error **errp)<br>
@@ -416,6 +419,12 @@ static void allwinner_r40_realize(DeviceState *dev, Er=
ror **errp)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 115200, serial_hd(i), DEVICE_NATIVE_ENDIAN);<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
+=C2=A0 =C2=A0 /* I2C */<br>
+=C2=A0 =C2=A0 sysbus_realize(SYS_BUS_DEVICE(&amp;s-&gt;i2c0), &amp;error_f=
atal);<br>
+=C2=A0 =C2=A0 sysbus_mmio_map(SYS_BUS_DEVICE(&amp;s-&gt;i2c0), 0, s-&gt;me=
mmap[AW_R40_DEV_TWI0]);<br>
+=C2=A0 =C2=A0 sysbus_connect_irq(SYS_BUS_DEVICE(&amp;s-&gt;i2c0), 0,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0qdev_get_gpio_in(DEVICE(&amp;s-&gt;gic), AW_R40_GIC_SPI_TWI0));<b=
r>
+<br>
=C2=A0 =C2=A0 =C2=A0/* Unimplemented devices */<br>
=C2=A0 =C2=A0 =C2=A0for (i =3D 0; i &lt; ARRAY_SIZE(r40_unimplemented); i++=
) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0create_unimplemented_device(r40_unimpleme=
nted[i].device_name,<br>
diff --git a/include/hw/arm/allwinner-r40.h b/include/hw/arm/allwinner-r40.=
h<br>
index 959b5dc4e0..95366f4eee 100644<br>
--- a/include/hw/arm/allwinner-r40.h<br>
+++ b/include/hw/arm/allwinner-r40.h<br>
@@ -26,6 +26,7 @@<br>
=C2=A0#include &quot;hw/intc/arm_gic.h&quot;<br>
=C2=A0#include &quot;hw/sd/allwinner-sdhost.h&quot;<br>
=C2=A0#include &quot;hw/misc/allwinner-r40-ccu.h&quot;<br>
+#include &quot;hw/i2c/allwinner-i2c.h&quot;<br>
=C2=A0#include &quot;target/arm/cpu.h&quot;<br>
=C2=A0#include &quot;sysemu/block-backend.h&quot;<br>
<br>
@@ -48,6 +49,7 @@ enum {<br>
=C2=A0 =C2=A0 =C2=A0AW_R40_DEV_UART5,<br>
=C2=A0 =C2=A0 =C2=A0AW_R40_DEV_UART6,<br>
=C2=A0 =C2=A0 =C2=A0AW_R40_DEV_UART7,<br>
+=C2=A0 =C2=A0 AW_R40_DEV_TWI0,<br>
=C2=A0 =C2=A0 =C2=A0AW_R40_DEV_GIC_DIST,<br>
=C2=A0 =C2=A0 =C2=A0AW_R40_DEV_GIC_CPU,<br>
=C2=A0 =C2=A0 =C2=A0AW_R40_DEV_GIC_HYP,<br>
@@ -89,6 +91,7 @@ struct AwR40State {<br>
=C2=A0 =C2=A0 =C2=A0AwA10PITState timer;<br>
=C2=A0 =C2=A0 =C2=A0AwSdHostState mmc[AW_R40_NUM_MMCS];<br>
=C2=A0 =C2=A0 =C2=A0AwR40ClockCtlState ccu;<br>
+=C2=A0 =C2=A0 AWI2CState i2c0;<br>
=C2=A0 =C2=A0 =C2=A0GICState gic;<br>
=C2=A0 =C2=A0 =C2=A0MemoryRegion sram_a1;<br>
=C2=A0 =C2=A0 =C2=A0MemoryRegion sram_a2;<br>
-- <br>
2.25.1<br>
<br>
</blockquote></div><br clear=3D"all"><br><span class=3D"gmail_signature_pre=
fix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><div dir=3D"l=
tr"><div>Niek Linnenbank<br><br></div></div></div></div>

--0000000000007e2bd705fbabeadf--
