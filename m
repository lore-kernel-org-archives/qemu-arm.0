Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp3618457ejb;
        Tue, 21 Feb 2023 13:09:37 -0800 (PST)
X-Google-Smtp-Source: AK7set86QcokiKc5At7PDvqXfIklDlb5Z8z2ZJAgdoOAmD05Z9r3j070mA07/ivAHyaV6m5toKkA
X-Received: by 2002:ad4:5de5:0:b0:56e:a658:84e4 with SMTP id jn5-20020ad45de5000000b0056ea65884e4mr12682800qvb.36.1677013777474;
        Tue, 21 Feb 2023 13:09:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677013777; cv=none;
        d=google.com; s=arc-20160816;
        b=Yl+Pn3AJV5I4JZLw8Q/4VML4mTqieXR0vpfPVT53T4QbivZ9sjCg83/OOh3GYGT4Tu
         5PKQxbrx5tkqsOagBvoW8n+N/DLE399Sj50xFrS0FlPma9QJ6oKq+vLXYAejwYuO9i1r
         yOODrWGJcOxJmFIm03rHpuYGqP8R7WXRhZahnYXdPO8t0YnTIRpuYPO3NG+yf1DKdxiy
         Uj8Y+49ArnX52Tebu4zDOqE754VkdSsxo0diqZnkZ0Hl/egmnmHzR0MzQ8nRZ+jKm+fL
         gvzM/oalIXgUO4Ahsna133jbBw4QZ9OrCsJMUAJkZ5iHd0NF5DsWZcapwzS0HE5+fsjh
         t4fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=TaI6iSbp/uDcq0/GShhLkcynizDz+EzUOX+9Fgpgnqs=;
        b=kId3sRzWDUMNGMGPic/5DhT1+RpyKjaykLB2p3frm+ZW2fSttRgf+E6wn+FBm7PWYu
         HyDxoBfDPX+aSmvPFkpFAO835OvszQMES1dl88jasjPG+O30Nt+/tLpbH3EhI621bnLn
         XbYJ35Ucy4RMa6nAlEcrNczOc1KKaZIcJ2suT9wBcFXQvfOaZmOHfLPUCGumPFNfvkKQ
         qXVyaJhivY21wzrZgFSORLWEczv7vr2Yp5wQn6bPhncPvjD9qBazx+y7HvnoRuY1PwEJ
         ZLFJPu+/JpYhIcyxbIHiJayJ6DQSexWCWWBjf1oLgu3Wt00rAx9WoTfBUtMzQQq4c4GI
         cEOA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=dqB+x8FU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d192-20020a3768c9000000b0073ba2f5b9e7si3563795qkc.729.2023.02.21.13.09.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 21 Feb 2023 13:09:37 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=dqB+x8FU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pUZsr-0004Nv-Q6; Tue, 21 Feb 2023 16:09:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <strahinjapjankovic@gmail.com>)
 id 1pUZsq-0004Nc-Ag; Tue, 21 Feb 2023 16:09:08 -0500
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <strahinjapjankovic@gmail.com>)
 id 1pUZso-0005qy-Em; Tue, 21 Feb 2023 16:09:08 -0500
Received: by mail-ed1-x536.google.com with SMTP id ec43so22005920edb.8;
 Tue, 21 Feb 2023 13:09:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=TaI6iSbp/uDcq0/GShhLkcynizDz+EzUOX+9Fgpgnqs=;
 b=dqB+x8FU9eohUt1G7XHaGwipGir1Tu3XD0VV3JMwsNwhMsmytciU7YMX0RsveLvB09
 aR1msbij9vMFzfU+6G5n/mmqIB+4FGH8XOrbKRD+giudDmF5sq9pmhsE7gLTURkS5gqz
 xSUEOOLjhTLb4xPFZWJvXao7h8hM7+8RcoOwKiSyhiu0pSd64qhNfSXIRzXw7G/3Hpua
 5BBfsVf/ChSCVIsrIytQkcDvMu1lBKpO8nEwkt3LzSLa/+bMZbileoyIl0AigSH0aDRx
 Y9qEEgr+Pu+GXROsyJuWJynPhM2DI4jCl8w67SzbsqEe6AXvTBEhbzMSpbIjBuQ9TWVz
 8Sdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=TaI6iSbp/uDcq0/GShhLkcynizDz+EzUOX+9Fgpgnqs=;
 b=sX21iyNwwaLk1KeRwQZ7d6ARTYpmHVzOx/5A4WTDkV9f5SPifkPmav1vu0PVnuWoYQ
 EaJ1ltLUnqUP0vON22ykquNDMu2hpNmhQhwIkyH1R3er9A18SpaBYbTDVwcZPxS0mO3y
 SdoUarrJP+zjloa4FKYFhLMK1wVKbPV8rNwxvrWzoWMSIqiSt81btYxpE/YsgHmzuTW2
 d8HgliJGnks721mJUJ1XTAchfmpKvllBMRLJQ6ATmrNh3VPUPXJmvbWQwWCFD4K329I/
 0TOKeVjnhs2vUYk1yMFV+f0X3Q6hbhnFydNTS0KuwS4Qq2IJBJ19AXdxrrfYZvtK/Ipc
 vJfg==
X-Gm-Message-State: AO0yUKX65DS/Bn3ah9W7W++4Vu7UMqZ92my9a5KdgwoS/r4U789q62+F
 0FCntlsWeqYEbY73Q/0nQHkz4w4aQMl9E+0b2Bw=
X-Received: by 2002:a50:9fa2:0:b0:4aa:a4f2:ca1a with SMTP id
 c31-20020a509fa2000000b004aaa4f2ca1amr2806463edf.0.1677013743042; Tue, 21 Feb
 2023 13:09:03 -0800 (PST)
MIME-Version: 1.0
References: <20230220081252.25348-1-qianfanguijin@163.com>
 <20230220081252.25348-3-qianfanguijin@163.com>
In-Reply-To: <20230220081252.25348-3-qianfanguijin@163.com>
From: Strahinja Jankovic <strahinjapjankovic@gmail.com>
Date: Tue, 21 Feb 2023 22:08:51 +0100
Message-ID: <CABtshVT4Y=YUDE=4i=OiAFuiJ4YUyOy3u35wAz4QJM2g2WexFw@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] hw: arm: allwinner-h3: Fix and complete H3 i2c
 devices
To: qianfanguijin@163.com
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Peter Maydell <peter.maydell@linaro.org>,
 Beniamino Galvani <b.galvani@gmail.com>, 
 Niek Linnenbank <nieklinnenbank@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=strahinjapjankovic@gmail.com; helo=mail-ed1-x536.google.com
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
X-TUID: +dr/pXz6VZ3r

(adding Niek to the thread as well)

On Mon, Feb 20, 2023 at 9:13 AM <qianfanguijin@163.com> wrote:
>
> From: qianfan Zhao <qianfanguijin@163.com>
>
> Allwinner h3 has 4 twi(i2c) devices named twi0, twi1, twi2 and r_twi.
> The registers are compatible with TYPE_AW_I2C_SUN6I, write 1 to clear
> control register's INT_FLAG bit.
>
> Signed-off-by: qianfan Zhao <qianfanguijin@163.com>
> ---
>  hw/arm/allwinner-h3.c         | 29 +++++++++++++++++++++++++----
>  include/hw/arm/allwinner-h3.h |  6 ++++++
>  2 files changed, 31 insertions(+), 4 deletions(-)
>
> diff --git a/hw/arm/allwinner-h3.c b/hw/arm/allwinner-h3.c
> index bfce3c8d92..69d0ad6f50 100644
> --- a/hw/arm/allwinner-h3.c
> +++ b/hw/arm/allwinner-h3.c
> @@ -54,6 +54,8 @@ const hwaddr allwinner_h3_memmap[] = {
>      [AW_H3_DEV_UART2]      = 0x01c28800,
>      [AW_H3_DEV_UART3]      = 0x01c28c00,
>      [AW_H3_DEV_TWI0]       = 0x01c2ac00,
> +    [AW_H3_DEV_TWI1]       = 0x01c2b000,
> +    [AW_H3_DEV_TWI2]       = 0x01c2b400,
>      [AW_H3_DEV_EMAC]       = 0x01c30000,
>      [AW_H3_DEV_DRAMCOM]    = 0x01c62000,
>      [AW_H3_DEV_DRAMCTL]    = 0x01c63000,
> @@ -64,6 +66,7 @@ const hwaddr allwinner_h3_memmap[] = {
>      [AW_H3_DEV_GIC_VCPU]   = 0x01c86000,
>      [AW_H3_DEV_RTC]        = 0x01f00000,
>      [AW_H3_DEV_CPUCFG]     = 0x01f01c00,
> +    [AW_H3_DEV_R_TWI]      = 0x01f02400,
>      [AW_H3_DEV_SDRAM]      = 0x40000000
>  };
>
> @@ -107,8 +110,6 @@ struct AwH3Unimplemented {
>      { "uart1",     0x01c28400, 1 * KiB },
>      { "uart2",     0x01c28800, 1 * KiB },
>      { "uart3",     0x01c28c00, 1 * KiB },
> -    { "twi1",      0x01c2b000, 1 * KiB },
> -    { "twi2",      0x01c2b400, 1 * KiB },
>      { "scr",       0x01c2c400, 1 * KiB },
>      { "gpu",       0x01c40000, 64 * KiB },
>      { "hstmr",     0x01c60000, 4 * KiB },
> @@ -123,7 +124,6 @@ struct AwH3Unimplemented {
>      { "r_prcm",    0x01f01400, 1 * KiB },
>      { "r_twd",     0x01f01800, 1 * KiB },
>      { "r_cir-rx",  0x01f02000, 1 * KiB },
> -    { "r_twi",     0x01f02400, 1 * KiB },
>      { "r_uart",    0x01f02800, 1 * KiB },
>      { "r_pio",     0x01f02c00, 1 * KiB },
>      { "r_pwm",     0x01f03800, 1 * KiB },
> @@ -151,8 +151,11 @@ enum {
>      AW_H3_GIC_SPI_UART2     =  2,
>      AW_H3_GIC_SPI_UART3     =  3,
>      AW_H3_GIC_SPI_TWI0      =  6,
> +    AW_H3_GIC_SPI_TWI1      =  7,
> +    AW_H3_GIC_SPI_TWI2      =  8,
>      AW_H3_GIC_SPI_TIMER0    = 18,
>      AW_H3_GIC_SPI_TIMER1    = 19,
> +    AW_H3_GIC_SPI_R_TWI     = 44,
>      AW_H3_GIC_SPI_MMC0      = 60,
>      AW_H3_GIC_SPI_EHCI0     = 72,
>      AW_H3_GIC_SPI_OHCI0     = 73,
> @@ -227,7 +230,10 @@ static void allwinner_h3_init(Object *obj)
>
>      object_initialize_child(obj, "rtc", &s->rtc, TYPE_AW_RTC_SUN6I);
>
> -    object_initialize_child(obj, "twi0", &s->i2c0, TYPE_AW_I2C);
> +    object_initialize_child(obj, "twi0",  &s->i2c0,  TYPE_AW_I2C_SUN6I);
> +    object_initialize_child(obj, "twi1",  &s->i2c1,  TYPE_AW_I2C_SUN6I);
> +    object_initialize_child(obj, "twi2",  &s->i2c2,  TYPE_AW_I2C_SUN6I);
> +    object_initialize_child(obj, "r_twi", &s->r_twi, TYPE_AW_I2C_SUN6I);
>  }
>
>  static void allwinner_h3_realize(DeviceState *dev, Error **errp)
> @@ -432,6 +438,21 @@ static void allwinner_h3_realize(DeviceState *dev, Error **errp)
>      sysbus_connect_irq(SYS_BUS_DEVICE(&s->i2c0), 0,
>                         qdev_get_gpio_in(DEVICE(&s->gic), AW_H3_GIC_SPI_TWI0));
>
> +    sysbus_realize(SYS_BUS_DEVICE(&s->i2c1), &error_fatal);
> +    sysbus_mmio_map(SYS_BUS_DEVICE(&s->i2c1), 0, s->memmap[AW_H3_DEV_TWI1]);
> +    sysbus_connect_irq(SYS_BUS_DEVICE(&s->i2c1), 0,
> +                       qdev_get_gpio_in(DEVICE(&s->gic), AW_H3_GIC_SPI_TWI1));
> +
> +    sysbus_realize(SYS_BUS_DEVICE(&s->i2c2), &error_fatal);
> +    sysbus_mmio_map(SYS_BUS_DEVICE(&s->i2c2), 0, s->memmap[AW_H3_DEV_TWI2]);
> +    sysbus_connect_irq(SYS_BUS_DEVICE(&s->i2c2), 0,
> +                       qdev_get_gpio_in(DEVICE(&s->gic), AW_H3_GIC_SPI_TWI2));
> +
> +    sysbus_realize(SYS_BUS_DEVICE(&s->r_twi), &error_fatal);
> +    sysbus_mmio_map(SYS_BUS_DEVICE(&s->r_twi), 0, s->memmap[AW_H3_DEV_R_TWI]);
> +    sysbus_connect_irq(SYS_BUS_DEVICE(&s->r_twi), 0,
> +                       qdev_get_gpio_in(DEVICE(&s->gic), AW_H3_GIC_SPI_R_TWI));
> +
>      /* Unimplemented devices */
>      for (i = 0; i < ARRAY_SIZE(unimplemented); i++) {
>          create_unimplemented_device(unimplemented[i].device_name,
> diff --git a/include/hw/arm/allwinner-h3.h b/include/hw/arm/allwinner-h3.h
> index 1d7ce20589..59e0f822d2 100644
> --- a/include/hw/arm/allwinner-h3.h
> +++ b/include/hw/arm/allwinner-h3.h
> @@ -84,6 +84,8 @@ enum {
>      AW_H3_DEV_UART3,
>      AW_H3_DEV_EMAC,
>      AW_H3_DEV_TWI0,
> +    AW_H3_DEV_TWI1,
> +    AW_H3_DEV_TWI2,
>      AW_H3_DEV_DRAMCOM,
>      AW_H3_DEV_DRAMCTL,
>      AW_H3_DEV_DRAMPHY,
> @@ -93,6 +95,7 @@ enum {
>      AW_H3_DEV_GIC_VCPU,
>      AW_H3_DEV_RTC,
>      AW_H3_DEV_CPUCFG,
> +    AW_H3_DEV_R_TWI,
>      AW_H3_DEV_SDRAM
>  };
>
> @@ -133,6 +136,9 @@ struct AwH3State {
>      AwSidState sid;
>      AwSdHostState mmc0;
>      AWI2CState i2c0;
> +    AWI2CState i2c1;
> +    AWI2CState i2c2;
> +    AWI2CState r_twi;
>      AwSun8iEmacState emac;
>      AwRtcState rtc;
>      GICState gic;
> --
> 2.25.1
>

As far as I can see, the TWI for H3 is indeed treated as
"allwinner,sun6i-a31-i2c" in Linux, so it should have W1C
functionality and use TYPE_AW_I2C_SUN6I.

Reviewed-by: Strahinja Jankovic <strahinja.p.jankovic@gmail.com>

Best regards,
Strahinja
