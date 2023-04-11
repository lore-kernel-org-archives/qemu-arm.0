Received: by 2002:a17:907:2c4d:b0:94e:1233:1117 with SMTP id hf13csp679872ejc;
        Tue, 11 Apr 2023 11:06:54 -0700 (PDT)
X-Google-Smtp-Source: AKy350bdsLkqSRN+9ieXgo1/+H9RXuF9kHbSmC0i8nnLB8Igep9hrTOn63TiSEyb2w1RrRW+rZWR
X-Received: by 2002:a05:622a:1c6:b0:3e6:71d6:5d5f with SMTP id t6-20020a05622a01c600b003e671d65d5fmr27229966qtw.1.1681236413941;
        Tue, 11 Apr 2023 11:06:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1681236413; cv=none;
        d=google.com; s=arc-20160816;
        b=TUd8rooL/JWjsmeFOEYI4oJHQzJuh77qYH/VDT8h6cS3pDmOrKZxmipB2PxUzuE5MA
         YntgjVRiefwtRX6uF7dWbBHEWJO3P9PFthbs2/jdxmszyQOGjdXC2VlnRTVrALODKt+r
         SwCvpB+g/RP+8NNc5/1+7OZejxLsCyYPgrwHUBQ2ZfgRmQHUPx3REFwfSXgNBYwisTSi
         mrl3bIMhPdVvOuezdfPI08gmXphxb3h2fANyxb2drbfDf/uQSTGNvwYbAnZz9rZXkegK
         igBqxeMBJBVwp+zfBAeQTlH5avT8Xjk92S0maHI1jo5jTWF0643Un7uyfR12ldT2aQEZ
         kG7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=LyMoeCUKZB0nZXSAN27MuIWV3GVYdJeWwyD+qEGr6Tg=;
        b=nsJo5AeUjB9K5uXuKPWEjSFcQAQRthtf8Y+bo5wOx9Ty5oJzj58glAzb8C+220GvKO
         m0tOY7UbY2JRfCstca23ItTT3zh9zd2d8BBMEpiNW4FPajKLuQv8c8HpvihU238ECkDX
         ghsjOxTVLIOznZereB9wZiNP8h1fnjy/wdA5axTTVc1X1rEbLABODTCjrMLTJtRoTEsw
         Rx+inlcbYUdEAZA5FIqeJ5K8tt0h9kalpkAbAzvrWUvi4d72nfV8NitC7Pa31w1dZEs+
         qKh0ihYiUoZBIyTVscw446D4o6Xvxl8OVw8zxk5e4JnBxm9NjuZCTQysXixzbIzYpAki
         bIEw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=L7oKiIR6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bi42-20020a05620a31aa00b007468f1dec63si9975638qkb.571.2023.04.11.11.06.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 11 Apr 2023 11:06:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=L7oKiIR6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pmIOC-0008FO-5p; Tue, 11 Apr 2023 14:06:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <strahinjapjankovic@gmail.com>)
 id 1pmIO9-0008Eb-Rc; Tue, 11 Apr 2023 14:06:42 -0400
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <strahinjapjankovic@gmail.com>)
 id 1pmIO7-00023H-Va; Tue, 11 Apr 2023 14:06:41 -0400
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-94a34a0b9e2so169603066b.1; 
 Tue, 11 Apr 2023 11:06:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1681236398; x=1683828398;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LyMoeCUKZB0nZXSAN27MuIWV3GVYdJeWwyD+qEGr6Tg=;
 b=L7oKiIR6Pis0RQU2swo0W6NkGMtCDDtYUrwiC5pTRT0sielUUzHy8OQpcgi8MsCxUz
 AB3wh63FoVGo0c+wr8dInptu57JRY5nAUOLSCPb9hdkEbQDaMlM2Qs8GUdz5tuqqrM/7
 i1OiSFJyhQb/0hhG/WGL+EpXxvDFWkZozj+ypQqGdUHXI86QdI+rnr/vAXqrsXK/1yAE
 MIPtdEsecBL6pGaWdw+QhxQjFXc6daTtT2R6YwVIWIvITC7rWlj/orQ9/oCxfkE2+FXh
 EvUeN6jUwQe0/aMCwQJTU6dEYMFLkxKKgw+g5NZoWk15XLJnxyYEOhEuOknCofity3f9
 vVSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681236398; x=1683828398;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LyMoeCUKZB0nZXSAN27MuIWV3GVYdJeWwyD+qEGr6Tg=;
 b=Boaium1SeJkb1ohzi0lKRz+T4NGKuOQcGCfzC5xcnfrTeiWkZOPFzQPODXNSr3aiU3
 i/sq+9WTEwZxtU4wF22ykv7lCSDQyzGZfavTLG/aT0DsjoJBaJ+/zvJSK4dt0QhNwAtR
 vim2vddxEz50XPcjdNrKum06vLoyQK0V25MXI5AM0/J64Sbp/DG3bUnYfVYDP2XTa93I
 pHJKxeBhMsQBBHvAU2T+GRjdfEceFfBXqvbVdF0YgyQIYvY+dhvUGjrPtWyVoTcmW6oG
 k2PFjClKJrebIk/Q2RbtHCjHTKdB7sfE8m68qbRHpgNwIC6LHJr+1lySqLmg+TvIfkeO
 igVA==
X-Gm-Message-State: AAQBX9caXcOy749+9RebFsE2k0J/yful+lL8X2MuZj0S+VD40QYt9MJg
 Bcf+j7EUNpRG2obOtLDE9nY0ch+v7jM+YOeLr/k=
X-Received: by 2002:a05:6402:32c:b0:501:d43e:d1e3 with SMTP id
 q12-20020a056402032c00b00501d43ed1e3mr14533635edw.8.1681236397964; Tue, 11
 Apr 2023 11:06:37 -0700 (PDT)
MIME-Version: 1.0
References: <20230328054654.18620-1-qianfanguijin@163.com>
 <20230328054654.18620-4-qianfanguijin@163.com>
In-Reply-To: <20230328054654.18620-4-qianfanguijin@163.com>
From: Strahinja Jankovic <strahinjapjankovic@gmail.com>
Date: Tue, 11 Apr 2023 20:06:26 +0200
Message-ID: <CABtshVRa2Ny7p8Vifv7MtWFCKOvJeVCXmbojvOd0fJjaUa7+VQ@mail.gmail.com>
Subject: Re: [PATCH v2 03/12] hw: allwinner-r40: Complete uart devices
To: qianfanguijin@163.com
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Peter Maydell <peter.maydell@linaro.org>,
 Beniamino Galvani <b.galvani@gmail.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Niek Linnenbank <nieklinnenbank@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=strahinjapjankovic@gmail.com; helo=mail-ej1-x62c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: vWKeSpak6M60

On Tue, Mar 28, 2023 at 7:47=E2=80=AFAM <qianfanguijin@163.com> wrote:
>
> From: qianfan Zhao <qianfanguijin@163.com>
>
> R40 has eight UARTs, support both 16450 and 16550 compatible modes.
>
> Signed-off-by: qianfan Zhao <qianfanguijin@163.com>
> ---
>  hw/arm/allwinner-r40.c         | 31 ++++++++++++++++++++++++++++---
>  include/hw/arm/allwinner-r40.h |  8 ++++++++
>  2 files changed, 36 insertions(+), 3 deletions(-)
>
> diff --git a/hw/arm/allwinner-r40.c b/hw/arm/allwinner-r40.c
> index 128c0ca470..537a90b23d 100644
> --- a/hw/arm/allwinner-r40.c
> +++ b/hw/arm/allwinner-r40.c
> @@ -45,6 +45,13 @@ const hwaddr allwinner_r40_memmap[] =3D {
>      [AW_R40_DEV_CCU]        =3D 0x01c20000,
>      [AW_R40_DEV_PIT]        =3D 0x01c20c00,
>      [AW_R40_DEV_UART0]      =3D 0x01c28000,
> +    [AW_R40_DEV_UART1]      =3D 0x01c28400,
> +    [AW_R40_DEV_UART2]      =3D 0x01c28800,
> +    [AW_R40_DEV_UART3]      =3D 0x01c28c00,
> +    [AW_R40_DEV_UART4]      =3D 0x01c29000,
> +    [AW_R40_DEV_UART5]      =3D 0x01c29400,
> +    [AW_R40_DEV_UART6]      =3D 0x01c29800,
> +    [AW_R40_DEV_UART7]      =3D 0x01c29c00,
>      [AW_R40_DEV_GIC_DIST]   =3D 0x01c81000,
>      [AW_R40_DEV_GIC_CPU]    =3D 0x01c82000,
>      [AW_R40_DEV_GIC_HYP]    =3D 0x01c84000,
> @@ -160,6 +167,10 @@ enum {
>      AW_R40_GIC_SPI_UART1     =3D  2,
>      AW_R40_GIC_SPI_UART2     =3D  3,
>      AW_R40_GIC_SPI_UART3     =3D  4,
> +    AW_R40_GIC_SPI_UART4     =3D 17,
> +    AW_R40_GIC_SPI_UART5     =3D 18,
> +    AW_R40_GIC_SPI_UART6     =3D 19,
> +    AW_R40_GIC_SPI_UART7     =3D 20,
>      AW_R40_GIC_SPI_TIMER0    =3D 22,
>      AW_R40_GIC_SPI_TIMER1    =3D 23,
>      AW_R40_GIC_SPI_MMC0      =3D 32,
> @@ -387,9 +398,23 @@ static void allwinner_r40_realize(DeviceState *dev, =
Error **errp)
>      }
>
>      /* UART0. For future clocktree API: All UARTS are connected to APB2_=
CLK. */
> -    serial_mm_init(get_system_memory(), s->memmap[AW_R40_DEV_UART0], 2,
> -                   qdev_get_gpio_in(DEVICE(&s->gic), AW_R40_GIC_SPI_UART=
0),
> -                   115200, serial_hd(0), DEVICE_NATIVE_ENDIAN);
> +    for (int i =3D 0; i < AW_R40_NUM_UARTS; i++) {
> +        static const int uart_irqs[AW_R40_NUM_UARTS] =3D {
> +            AW_R40_GIC_SPI_UART0,
> +            AW_R40_GIC_SPI_UART1,
> +            AW_R40_GIC_SPI_UART2,
> +            AW_R40_GIC_SPI_UART3,
> +            AW_R40_GIC_SPI_UART4,
> +            AW_R40_GIC_SPI_UART5,
> +            AW_R40_GIC_SPI_UART6,
> +            AW_R40_GIC_SPI_UART7,
> +        };
> +        const hwaddr addr =3D s->memmap[AW_R40_DEV_UART0 + i];
> +
> +        serial_mm_init(get_system_memory(), addr, 2,
> +                       qdev_get_gpio_in(DEVICE(&s->gic), uart_irqs[i]),
> +                       115200, serial_hd(i), DEVICE_NATIVE_ENDIAN);
> +    }
>
>      /* Unimplemented devices */
>      for (i =3D 0; i < ARRAY_SIZE(r40_unimplemented); i++) {
> diff --git a/include/hw/arm/allwinner-r40.h b/include/hw/arm/allwinner-r4=
0.h
> index 3be9dc962b..959b5dc4e0 100644
> --- a/include/hw/arm/allwinner-r40.h
> +++ b/include/hw/arm/allwinner-r40.h
> @@ -41,6 +41,13 @@ enum {
>      AW_R40_DEV_CCU,
>      AW_R40_DEV_PIT,
>      AW_R40_DEV_UART0,
> +    AW_R40_DEV_UART1,
> +    AW_R40_DEV_UART2,
> +    AW_R40_DEV_UART3,
> +    AW_R40_DEV_UART4,
> +    AW_R40_DEV_UART5,
> +    AW_R40_DEV_UART6,
> +    AW_R40_DEV_UART7,
>      AW_R40_DEV_GIC_DIST,
>      AW_R40_DEV_GIC_CPU,
>      AW_R40_DEV_GIC_HYP,
> @@ -70,6 +77,7 @@ OBJECT_DECLARE_SIMPLE_TYPE(AwR40State, AW_R40)
>   * which are currently emulated by the R40 SoC code.
>   */
>  #define AW_R40_NUM_MMCS         4
> +#define AW_R40_NUM_UARTS        8
>
>  struct AwR40State {
>      /*< private >*/
> --
> 2.25.1
>

Reviewed-by: Strahinja Jankovic <strahinja.p.jankovic@gmail.com>

Best regards,
Strahinja
