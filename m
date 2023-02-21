Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp3605697ejb;
        Tue, 21 Feb 2023 12:53:50 -0800 (PST)
X-Google-Smtp-Source: AK7set/Xmg/7hyyv6Jn9uv7WiU764Y6z9aap4b7Perhbv7SwippiF7AZa7/9OVF3gUqABdk3hpoE
X-Received: by 2002:a05:6214:400a:b0:56e:ab31:199d with SMTP id kd10-20020a056214400a00b0056eab31199dmr8234186qvb.40.1677012829787;
        Tue, 21 Feb 2023 12:53:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677012829; cv=none;
        d=google.com; s=arc-20160816;
        b=QcWjT9wFBk3A1g4ScG7h8j/Ikkfqh19haiFeSomj7oOAOC0LGl1fwlWGaks6ITXGWF
         Mt8EdcWRIkSp28yzhNtYlVU4MevW1mVr60b9QNg+7lt0FbIMH42Syew+QXyQWntjd22z
         bfJq6hHatCloHzY/tYanOTYrMf+eYPgmfbSOwbU1mVarSX6y8TvgzMBaAb+LD7XkzK1R
         BBUTR5e92wwgTmZpySfbL1chzOGvo0yv5Hudu0mxPez7OXXZH0tH1m+1zY86AowT2Uy9
         WEp2KAMrEH7++u99JG+sZG8F0ppsw5c1+8NjiCzQS+tmxrrPndLXOqG1cmDsQUJCfHM+
         3Hhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=khoamUVpi6I+lw+EA/MI4NxTGEnojeQ8688rgLFavEo=;
        b=v7xalzBwoh8xYI1UH/Diu+AwGGnEgqTJTArC2d+AGTWsveCWXGygJYOUb2+Q1oPIeE
         7uHDhc1TNnv5YLeS7eyrXVynMG7ipZ8hgLbK+pdIb+VDvaDulaZp+FkbVTpU68qvM27y
         HWT31SRC+28x/jkI1PAi8plQMl0n0riA4KnMLciHZixQsbn70d5mwIwBfuSpgwCtNJIG
         CrWJvPZXEHecjBiwHNUa+qT1I/gtBky2ultjz+hLsQ3Y4zXaXqG3RkQpTQA2MDMTu50H
         n7xVDUXQPExgRzFIa0KLZQGWyFFSdPa1qWdFDLhLqPbhkK/naSNakD6nPMyh6Y4tYxAn
         Lgyg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=P9Sp2FmF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y4-20020a0cf144000000b0056eb4f43c97si1454942qvl.277.2023.02.21.12.53.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 21 Feb 2023 12:53:49 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=P9Sp2FmF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pUZdx-00006g-Rd; Tue, 21 Feb 2023 15:53:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <strahinjapjankovic@gmail.com>)
 id 1pUZdv-00005W-S7; Tue, 21 Feb 2023 15:53:43 -0500
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <strahinjapjankovic@gmail.com>)
 id 1pUZdt-0002kQ-UG; Tue, 21 Feb 2023 15:53:43 -0500
Received: by mail-ed1-x52f.google.com with SMTP id ee7so7307043edb.2;
 Tue, 21 Feb 2023 12:53:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=khoamUVpi6I+lw+EA/MI4NxTGEnojeQ8688rgLFavEo=;
 b=P9Sp2FmFUtxwW9CFWCFqPRuF5EHX4UpErT8IFRtpz+XqDg8Z1J+4rtKaBhSFeVOJUu
 p6yzpR/fBkpSkd5xYu35r32JFsPLie4BkstqaCX9uV10gAcIyvyMMBOac7FkPnSvAOXn
 4nh3PRP6j9ffT5nt/Qz/U5/JzSoeZtUG8DYuxh72vXPWiXfKNHsPJ0MCFdPzKIsyLDsr
 KFgOGt1lT3Aplga6Vt1QoRw+thOhAYyxS60x8A619cHI4NR4MUY4JJQ4MP/f19mo5I94
 vHt+uNko3pSC2r6hVPsS3/Ob6CmBQiClNHsBROaRI3KxkTEA/wkhpzcztDUPmWyoPLyU
 MXXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=khoamUVpi6I+lw+EA/MI4NxTGEnojeQ8688rgLFavEo=;
 b=qTgg4gIeqh4Vbg9GaAK/wUE6WQBTQffgj5GdaqnGtWuK2ImDp9go0d3Anrda1rvyEc
 C225gJCuPcKVzZK/ujDUqDOfFuiEvtfPHJ4EAX2lgae8t58Ah1ne41SH4M8ji7s9ezPm
 TJ6uy54ZR/Qu4Y498RR4hWhgFLNef/Q0ubFameP789Ojg/AujPNeZinl19VUEN2u8Rxo
 EObMCqhUc2+KuP4QdoAfVMpEGTXROHkNnnRPTqEp297MxCExZozMkd93O15DZmgOuYz1
 HBOzRZgC2vkqy4RWpVJX+K9IH6rWuQuPRiLsnGsovBFWhUlP2ba6B794m1lCccrnyU/9
 q7GQ==
X-Gm-Message-State: AO0yUKWgfIv5nWlPCn5HZxZ4w+d38bsQKsym7GJWN4BLYM+efrtYTXnh
 4O/g9+DwDmrnfqKyq9DadlEk2qVZ4NO8APFu+fg=
X-Received: by 2002:a17:906:4f0a:b0:8b1:30eb:9dba with SMTP id
 t10-20020a1709064f0a00b008b130eb9dbamr6287817eju.6.1677012819296; Tue, 21 Feb
 2023 12:53:39 -0800 (PST)
MIME-Version: 1.0
References: <20230220081252.25348-1-qianfanguijin@163.com>
 <20230220081252.25348-2-qianfanguijin@163.com>
In-Reply-To: <20230220081252.25348-2-qianfanguijin@163.com>
From: Strahinja Jankovic <strahinjapjankovic@gmail.com>
Date: Tue, 21 Feb 2023 21:53:28 +0100
Message-ID: <CABtshVRssYmKyy0bR5AE4b2jemsfXJ3an_z5waPEsUDikfjRsg@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] hw: allwinner-i2c: Fix TWI_CNTR_INT_FLAG on SUN6i
 SoCs
To: qianfanguijin@163.com
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Peter Maydell <peter.maydell@linaro.org>,
 Beniamino Galvani <b.galvani@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=strahinjapjankovic@gmail.com; helo=mail-ed1-x52f.google.com
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
X-TUID: yjyRUMFKjlfD

On Mon, Feb 20, 2023 at 9:13 AM <qianfanguijin@163.com> wrote:
>
> From: qianfan Zhao <qianfanguijin@163.com>
>
> TWI_CNTR_INT_FLAG is W1C(write 1 to clear and write 0 has non-effect)
> register on SUN6i based SoCs, we should lower interrupt when the guest
> set this bit.
>
> The linux kernel will hang in irq handler(mv64xxx_i2c_intr) if no
> device connected on the i2c bus, next is the trace log:
>
> allwinner_i2c_write write   CNTR(0x0c): 0xc4 A_ACK BUS_EN INT_EN
> allwinner_i2c_write write   CNTR(0x0c): 0xcc A_ACK INT_FLAG BUS_EN INT_EN
> allwinner_i2c_read  read    CNTR(0x0c): 0xcc A_ACK INT_FLAG BUS_EN INT_EN
> allwinner_i2c_read  read    STAT(0x10): 0x20 STAT_M_ADDR_WR_NACK
> allwinner_i2c_write write   CNTR(0x0c): 0x54 A_ACK M_STP BUS_EN
> allwinner_i2c_write write   CNTR(0x0c): 0x4c A_ACK INT_FLAG BUS_EN
> allwinner_i2c_read  read    CNTR(0x0c): 0x4c A_ACK INT_FLAG BUS_EN
> allwinner_i2c_read  read    STAT(0x10): 0xf8 STAT_IDLE
> allwinner_i2c_write write   CNTR(0x0c): 0x54 A_ACK M_STP BUS_EN
> allwinner_i2c_write write   CNTR(0x0c): 0x4c A_ACK INT_FLAG BUS_EN
> allwinner_i2c_read  read    CNTR(0x0c): 0x4c A_ACK INT_FLAG BUS_EN
> allwinner_i2c_read  read    STAT(0x10): 0xf8 STAT_IDLE
> ...
>
> Fix it.
>
> Signed-off-by: qianfan Zhao <qianfanguijin@163.com>
> ---
>  hw/i2c/allwinner-i2c.c         | 26 ++++++++++++++++++++++++--
>  include/hw/i2c/allwinner-i2c.h |  6 ++++++
>  2 files changed, 30 insertions(+), 2 deletions(-)
>
> diff --git a/hw/i2c/allwinner-i2c.c b/hw/i2c/allwinner-i2c.c
> index fa650e7e02..819638d740 100644
> --- a/hw/i2c/allwinner-i2c.c
> +++ b/hw/i2c/allwinner-i2c.c
> @@ -463,10 +463,16 @@ static void allwinner_i2c_write(void *opaque, hwaddr offset,
>                  s->stat = STAT_FROM_STA(STAT_IDLE);
>                  s->cntr &= ~TWI_CNTR_M_STP;
>              }
> -            if ((s->cntr & TWI_CNTR_INT_FLAG) == 0) {
> -                /* Interrupt flag cleared */
> +
> +            if (!s->irq_clear_inverted && !(s->cntr & TWI_CNTR_INT_FLAG)) {
> +                /* Write 0 to clear this flag */
> +                qemu_irq_lower(s->irq);
> +            } else if (s->irq_clear_inverted && (s->cntr & TWI_CNTR_INT_FLAG)) {
> +                /* Write 1 to clear this flag */
> +                s->cntr &= ~TWI_CNTR_INT_FLAG;
>                  qemu_irq_lower(s->irq);
>              }
> +
>              if ((s->cntr & TWI_CNTR_A_ACK) == 0) {
>                  if (STAT_TO_STA(s->stat) == STAT_M_DATA_RX_ACK) {
>                      s->stat = STAT_FROM_STA(STAT_M_DATA_RX_NACK);
> @@ -557,9 +563,25 @@ static const TypeInfo allwinner_i2c_type_info = {
>      .class_init = allwinner_i2c_class_init,
>  };
>
> +static void allwinner_i2c_sun6i_init(Object *obj)
> +{
> +    AWI2CState *s = AW_I2C(obj);
> +
> +    s->irq_clear_inverted = true;
> +}
> +
> +static const TypeInfo allwinner_i2c_sun6i_type_info = {
> +    .name = TYPE_AW_I2C_SUN6I,
> +    .parent = TYPE_SYS_BUS_DEVICE,
> +    .instance_size = sizeof(AWI2CState),
> +    .instance_init = allwinner_i2c_sun6i_init,
> +    .class_init = allwinner_i2c_class_init,
> +};
> +
>  static void allwinner_i2c_register_types(void)
>  {
>      type_register_static(&allwinner_i2c_type_info);
> +    type_register_static(&allwinner_i2c_sun6i_type_info);
>  }
>
>  type_init(allwinner_i2c_register_types)
> diff --git a/include/hw/i2c/allwinner-i2c.h b/include/hw/i2c/allwinner-i2c.h
> index 4f378b86ba..0e325d265e 100644
> --- a/include/hw/i2c/allwinner-i2c.h
> +++ b/include/hw/i2c/allwinner-i2c.h
> @@ -28,6 +28,10 @@
>  #include "qom/object.h"
>
>  #define TYPE_AW_I2C "allwinner.i2c"
> +
> +/** Allwinner I2C sun6i family and newer (A31, H2+, H3, etc) */
> +#define TYPE_AW_I2C_SUN6I    TYPE_AW_I2C "-sun6i"
> +
>  OBJECT_DECLARE_SIMPLE_TYPE(AWI2CState, AW_I2C)
>
>  #define AW_I2C_MEM_SIZE         0x24
> @@ -50,6 +54,8 @@ struct AWI2CState {
>      uint8_t srst;
>      uint8_t efr;
>      uint8_t lcr;
> +
> +    bool irq_clear_inverted;
>  };
>
>  #endif /* ALLWINNER_I2C_H */
> --
> 2.25.1
>

Tried this patch with avocado for cubieboard and orangepi-pc, all
tests are passing.

So for me:

Reviewed-by: Strahinja Jankovic <strahinja.p.jankovic@gmail.com>
Tested-by: Strahinja Jankovic <strahinja.p.jankovic@gmail.com>
