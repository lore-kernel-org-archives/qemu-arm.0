Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp4035313lfg;
        Wed, 26 Feb 2020 22:33:51 -0800 (PST)
X-Google-Smtp-Source: APXvYqxQwsni1ekoRyGIyaariOGvv4lUPzvT6bhuhsTEvdaGY8ASAFjfYxJaWZOzzCxIaATs4Xqy
X-Received: by 2002:ac8:65d7:: with SMTP id t23mr2268643qto.310.1582785230971;
        Wed, 26 Feb 2020 22:33:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582785230; cv=none;
        d=google.com; s=arc-20160816;
        b=h0gtddNcjeXDR7YodAI89HbWX7f2KIdF68I9h0tLGcuesYiprRH8yJ67Sj09RaImKQ
         ZTll64ovh0WD8R6NXH4WD76XMRPd3AfubGutHlnW9iflD4mAyBhksmV9qEqCrnRFZMEX
         Yu+llbyVGJdBjWDY2CSOj3DVKCCIbNO47q+nmyKbABHSKTwF1smj84Oc6u0+xYRhDYOO
         ON8aMm96FG14zr/3wDrc8dvlIzuRUNtHvmeRqKSRdAWORRFinZYOLjDVI9IqTF8YKZcj
         66gXBTpvqGfvwfefLhP4Zq15ptTNyT07kZV3twUfQ6qR5hnzTU9sI6UV5Wh3sSLRkbjD
         kgPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QDQ+tLqj+2ND5MOZarTy4osGo+cc45/4S4LUUrHn8UI=;
        b=BV49eALVIsz6tRa8M8pqFd0gF0w8NWfMMO0DDNPvOr7crN6RcgZZgqVJSoBL3UeVvr
         2xpY5pzoK2lYrwj6QulKvvPcbgcoqMKgXpdgyqKDwJtwQvwcUbD6G8/3CM++P1IV4K4V
         EHCsHX5cM1vCdIxPa+wWt1J9EBAHtbF7LdNuHszcJWF84d1Eor0FVQP4JKW7PQ+tQqDv
         GSmZA/QqhXDYJBVFrni/fuRqQcPwQSDv+979HmssS4WrZaDGuPz48mIYo8C5sObqze39
         sVJgek7Ei8nbohNx4EKSL0MCIpZuTVi+MjTv9NpBP1AF6MrNTc2jNCuRGOv+xRokeucg
         JVIA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=gMl2em50;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d11si918535qkj.207.2020.02.26.22.33.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 26 Feb 2020 22:33:50 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=gMl2em50;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:54396 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j7Ck2-0002S3-Da
	for alex.bennee@linaro.org; Thu, 27 Feb 2020 01:33:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37697)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alistair23@gmail.com>) id 1j7Cjt-0002Qo-F7
 for qemu-arm@nongnu.org; Thu, 27 Feb 2020 01:33:44 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alistair23@gmail.com>) id 1j7Cjs-0008Sw-ER
 for qemu-arm@nongnu.org; Thu, 27 Feb 2020 01:33:41 -0500
Received: from mail-lj1-x242.google.com ([2a00:1450:4864:20::242]:37318)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alistair23@gmail.com>)
 id 1j7Cjq-0008Pt-7K; Thu, 27 Feb 2020 01:33:38 -0500
Received: by mail-lj1-x242.google.com with SMTP id q23so2019273ljm.4;
 Wed, 26 Feb 2020 22:33:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QDQ+tLqj+2ND5MOZarTy4osGo+cc45/4S4LUUrHn8UI=;
 b=gMl2em50MXlHnb9ckwoNIkqcmUvkR79A8nVqKr5SQc5v8flpDKe887X72o6MyFy4yk
 71mYOmHi+w5epzb9o5k8EKiqCsSO242KC9P8vnbnrDimLRw6pNAVw3XAFxTjyvPU+LJD
 vo4wLMacMRWZO/xRWoVBcsfbQqZOrW+j4rf68WJ9y3FYiO1e4HfsurOvGrday5+RFaZw
 /Eq7bk/JVUylsXEljshv+ozmGoChXRrOfbHmgxjHVeODfIovb6Kg4kHGYTx1qsMvcRz9
 JSKEQu6I9+ljHnaUQyywou1NCldwIivy+zVw68snFJALiIcw62+/OsV1v1gduqZRs0ky
 Xn/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QDQ+tLqj+2ND5MOZarTy4osGo+cc45/4S4LUUrHn8UI=;
 b=dfQZV1Sr8wediOzF279HE44CzmYjetLrMLZIwMZDz08SVO2Vwu9fQtnzX87HPAPRGg
 CnZ3gV7XoeEAGVD93uC60N0wXK70X2mZqJ4LIdTvAZc3VYOGv7zbbJE5cHd9FYq+8NwZ
 PeicX0M9T2KYG7divi7ou4TX11A9S8EKmQ22OJk7prW69fCr6XAi9af4HBIg6OtSUABa
 qzwL851ZpsfKbrPFQFGpH2jou6Kmc3uVCapMMt0xYd/nbCRKmMBAnYGlQl1C8Tjmp5hu
 fjiUDtSU9sQ7bOn87Bm++DrC5A/m5VTdkBIcegJV/LqLPY9OSDwW2OjoqmnbH1UgB108
 Gt0g==
X-Gm-Message-State: ANhLgQ0UYxOYDhG9D0GleF7Fdu44ltpU6RSGcHLh+T3oeQm93JahOTpv
 jboQ8UL5izAA15LLpcGCGzFZi3FRCxgByaWbsh0=
X-Received: by 2002:a2e:b4ac:: with SMTP id q12mr1654229ljm.285.1582785216492; 
 Wed, 26 Feb 2020 22:33:36 -0800 (PST)
MIME-Version: 1.0
References: <20200227025055.14341-1-pannengyuan@huawei.com>
 <20200227025055.14341-7-pannengyuan@huawei.com>
In-Reply-To: <20200227025055.14341-7-pannengyuan@huawei.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 26 Feb 2020 22:33:10 -0800
Message-ID: <CAKmqyKM-nZ6odr6G1dHy6ZMoc+v3e6WoESjPkzmcTYN8totTeg@mail.gmail.com>
Subject: Re: [PATCH v3 6/6] hw/timer/cadence_ttc: move timer_new from init()
 into realize() to avoid memleaks
To: Pan Nengyuan <pannengyuan@huawei.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::242
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
Cc: Peter Maydell <peter.maydell@linaro.org>, zhang.zhanghailiang@huawei.com,
 Alistair Francis <alistair@alistair23.me>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>, Euler Robot <euler.robot@huawei.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 2oUACBJRogzo

On Wed, Feb 26, 2020 at 6:37 PM Pan Nengyuan <pannengyuan@huawei.com> wrote:
>
> There are some memleaks when we call 'device_list_properties'. This patch move timer_new from init into realize to fix it.
>
> Reported-by: Euler Robot <euler.robot@huawei.com>
> Signed-off-by: Pan Nengyuan <pannengyuan@huawei.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
> Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
> Cc: Alistair Francis <alistair@alistair23.me>
> ---
>  hw/timer/cadence_ttc.c | 16 +++++++++++-----
>  1 file changed, 11 insertions(+), 5 deletions(-)
>
> diff --git a/hw/timer/cadence_ttc.c b/hw/timer/cadence_ttc.c
> index 5e3128c1e3..b0ba6b2bba 100644
> --- a/hw/timer/cadence_ttc.c
> +++ b/hw/timer/cadence_ttc.c
> @@ -412,16 +412,21 @@ static void cadence_timer_init(uint32_t freq, CadenceTimerState *s)
>  static void cadence_ttc_init(Object *obj)
>  {
>      CadenceTTCState *s = CADENCE_TTC(obj);
> +
> +    memory_region_init_io(&s->iomem, obj, &cadence_ttc_ops, s,
> +                          "timer", 0x1000);
> +    sysbus_init_mmio(SYS_BUS_DEVICE(obj), &s->iomem);
> +}
> +
> +static void cadence_ttc_realize(DeviceState *dev, Error **errp)
> +{
> +    CadenceTTCState *s = CADENCE_TTC(dev);
>      int i;
>
>      for (i = 0; i < 3; ++i) {
>          cadence_timer_init(133000000, &s->timer[i]);
> -        sysbus_init_irq(SYS_BUS_DEVICE(obj), &s->timer[i].irq);
> +        sysbus_init_irq(SYS_BUS_DEVICE(dev), &s->timer[i].irq);
>      }
> -
> -    memory_region_init_io(&s->iomem, obj, &cadence_ttc_ops, s,
> -                          "timer", 0x1000);
> -    sysbus_init_mmio(SYS_BUS_DEVICE(obj), &s->iomem);
>  }
>
>  static int cadence_timer_pre_save(void *opaque)
> @@ -479,6 +484,7 @@ static void cadence_ttc_class_init(ObjectClass *klass, void *data)
>      DeviceClass *dc = DEVICE_CLASS(klass);
>
>      dc->vmsd = &vmstate_cadence_ttc;
> +    dc->realize = cadence_ttc_realize;
>  }
>
>  static const TypeInfo cadence_ttc_info = {
> --
> 2.18.2
>
>
