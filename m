Received: by 2002:a19:ee12:0:0:0:0:0 with SMTP id g18csp1737126lfb;
        Mon, 6 Jun 2022 16:58:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxojj3Xqc16WVs67BDD75jEajhO1M8N1BbaDofjzdDrq/BJ8aP1xFt7pLQIqOg9WDg+O4sk
X-Received: by 2002:ac8:578b:0:b0:304:e781:3734 with SMTP id v11-20020ac8578b000000b00304e7813734mr10002984qta.44.1654559907702;
        Mon, 06 Jun 2022 16:58:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654559907; cv=none;
        d=google.com; s=arc-20160816;
        b=xogoWwpy3q+TRLe0qpWR1jbQj50oaAIE1tz3ag4xqwa6fdQYH8XldfE+bzXvMZAkYH
         ydFvHRsl+r4AB4N4eOFsKBDcAXp+UeqgTdCbpP1cewgz7anvTBB8t8vL2rfD4wOd/T1o
         TlNvb/Pwtr0Vw0tu382p/zzeD513rKhU3VIjZo4D1dbMQK+Pwo6TiFKtp0JaKonkmzlh
         5FJ/YrRbUrrEdWHYL6iCz/nILUvGJS8JrRpbn3gGnS/4VIbwLJk+c13aYpWKyh56vzke
         L3fZQUOpnJCYMOe58AHsMo5qNng2gwlCkm3nCjRTz7KM/C6hAFKwpEEDFjUpaV3IEDKT
         OO6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=H8k9fFKFjQw9pubzVp6SvoQ2qYfox4LemA0BqkC0FUI=;
        b=dmaxvSCcrFVmRbflHTHWskzRaUdiv1HGkfnS3rlH0yOyRHW51sT8nXywp7PBxcR4hn
         n7J4iNMzn1gpR3Yv6y/k1IKJYmIF4GUwbSKaKMJtuKgnpSZ4FhLjmWHt7UmMJLWSjUu4
         0aaPZhROcfd6HVDoMDoPs84QmGqVyiE/fuqpY8Y8kqCghqBY/ski4rbu1xSnmBmC92Hy
         uKsB9T/zy7zxHJm0+0dJYisroAZq0KdD71RkYPnOMvqU7BeHcEw8a567nRE+z/5Sk6cF
         1iGZi23TDSB4iBwaSQWSIkbQbYCtFpVPXMWSrgaDf5PR2J5LqGM43qMW8yQL/rNbvDcD
         5HqQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@jms.id.au header.s=google header.b=ceUmkcyQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 2-20020a0562140cc200b0046444942e40si10647240qvx.184.2022.06.06.16.58.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 Jun 2022 16:58:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@jms.id.au header.s=google header.b=ceUmkcyQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:56330 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nyMc6-0002ix-60
	for alex.bennee@linaro.org; Mon, 06 Jun 2022 19:58:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36214)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1nyM3O-0007x9-Ti; Mon, 06 Jun 2022 19:22:35 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:51158)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1nyM3N-0004y3-7l; Mon, 06 Jun 2022 19:22:34 -0400
Received: by mail-wm1-x32a.google.com with SMTP id e5so1566393wma.0;
 Mon, 06 Jun 2022 16:22:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=H8k9fFKFjQw9pubzVp6SvoQ2qYfox4LemA0BqkC0FUI=;
 b=ceUmkcyQFFwRbHIcp5E1OSjPxvXDi4VvAwCXoSEuArd+U0uggCLmFM20keqSD+oDlT
 yftcV/JSdcXnHLvpk8wOVGQAjiXA1R4NApRob6B9Md/ElLXnhkL7jbxE9emrXKv1h6hl
 WMo/NRw0U+xk2k/VUzAH8hDnnkpdQGQBLPkEs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=H8k9fFKFjQw9pubzVp6SvoQ2qYfox4LemA0BqkC0FUI=;
 b=2DCMBeOJ9dzZGHm3uOYhI4QdtfifJ5Px06PvYdOfj+zWNpPmTD+BLLys9pPnvUGDQd
 5zLGPcg2CYszbKAda2vIe2gU+FpygcdpS7niDpDWVcp505ojrvBqI/+QpCCdQURLQsgC
 EzkOsy7BWklTykA6lMUBtxe54aLOKEf2w0oTjMhHQb4/Eabo0SOpQaJfekUBgX5nWFXk
 chnKONMBY1PHs4dw7xTf76+v1QoPbvqdpBKpe5IhBGN6Ll0F0t58N/Lfa/3/Smzl93TI
 E0BzQ/YCqkYYhiQaLd5T0qqWXOwV+uR8ceOvhH8sjgwPOBFNAqsC7DTaYoUuUCNLdBUn
 IfqA==
X-Gm-Message-State: AOAM5316VUkda7Rl9uy/Xok8wtRNUtHDW/9p53adAHi/75hDWOzrLuSq
 oAJkXJYYkif328XeIplzk7iBi3mDCd+4kjUdTEI=
X-Received: by 2002:a05:600c:5d3:b0:39c:506d:c987 with SMTP id
 p19-20020a05600c05d300b0039c506dc987mr7246479wmd.10.1654557751130; Mon, 06
 Jun 2022 16:22:31 -0700 (PDT)
MIME-Version: 1.0
References: <20220606150732.2282041-1-clg@kaod.org>
 <20220606150732.2282041-13-clg@kaod.org>
In-Reply-To: <20220606150732.2282041-13-clg@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 6 Jun 2022 23:22:19 +0000
Message-ID: <CACPK8XdE87Agi9z_hPno-1E-eRFfD-ooQMkFy3tM-0xu9OMKZA@mail.gmail.com>
Subject: Re: [PATCH 12/21] aspeed/i2c: Add ast1030 controller models
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>, 
 Peter Maydell <peter.maydell@linaro.org>, Joe Komlodi <komlodi@google.com>,
 Troy Lee <troy_lee@aspeedtech.com>, Jamin Lin <jamin_lin@aspeedtech.com>, 
 Steven Lee <steven_lee@aspeedtech.com>, Klaus Jensen <k.jensen@samsung.com>, 
 Peter Delevoryas <pdel@fb.com>, Corey Minyard <cminyard@mvista.com>, 
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Damien Hedde <damien.hedde@greensocs.com>, 
 Andrew Jeffery <andrew@aj.id.au>, Cleber Rosa <crosa@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=joel.stan@gmail.com; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: bA+GX18m5YxE

On Mon, 6 Jun 2022 at 15:09, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> Based on :
>   https://lists.nongnu.org/archive/html/qemu-devel/2022-03/msg06017.html

Perhaps use the link to lore (which also includes the message id):

https://lore.kernel.org/qemu-devel/20220324100439.478317-2-troy_lee@aspeedt=
ech.com/

Reviewed-by: Joel Stanley <joel@jms.id.au>

>
> Cc: Troy Lee <troy_lee@aspeedtech.com>
> Cc: Jamin Lin <jamin_lin@aspeedtech.com>
> Cc: Steven Lee <steven_lee@aspeedtech.com>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
> ---
>  include/hw/i2c/aspeed_i2c.h |  1 +
>  hw/i2c/aspeed_i2c.c         | 24 ++++++++++++++++++++++++
>  2 files changed, 25 insertions(+)
>
> diff --git a/include/hw/i2c/aspeed_i2c.h b/include/hw/i2c/aspeed_i2c.h
> index 506bcf1a9daf..79c6779c6c1e 100644
> --- a/include/hw/i2c/aspeed_i2c.h
> +++ b/include/hw/i2c/aspeed_i2c.h
> @@ -30,6 +30,7 @@
>  #define TYPE_ASPEED_2400_I2C TYPE_ASPEED_I2C "-ast2400"
>  #define TYPE_ASPEED_2500_I2C TYPE_ASPEED_I2C "-ast2500"
>  #define TYPE_ASPEED_2600_I2C TYPE_ASPEED_I2C "-ast2600"
> +#define TYPE_ASPEED_1030_I2C TYPE_ASPEED_I2C "-ast1030"
>  OBJECT_DECLARE_TYPE(AspeedI2CState, AspeedI2CClass, ASPEED_I2C)
>
>  #define ASPEED_I2C_NR_BUSSES 16
> diff --git a/hw/i2c/aspeed_i2c.c b/hw/i2c/aspeed_i2c.c
> index 8425e928890a..5fce516517a5 100644
> --- a/hw/i2c/aspeed_i2c.c
> +++ b/hw/i2c/aspeed_i2c.c
> @@ -1185,6 +1185,29 @@ static const TypeInfo aspeed_2600_i2c_info =3D {
>      .class_init =3D aspeed_2600_i2c_class_init,
>  };
>
> +static void aspeed_1030_i2c_class_init(ObjectClass *klass, void *data)
> +{
> +    DeviceClass *dc =3D DEVICE_CLASS(klass);
> +    AspeedI2CClass *aic =3D ASPEED_I2C_CLASS(klass);
> +
> +    dc->desc =3D "ASPEED 1030 I2C Controller";
> +
> +    aic->num_busses =3D 14;
> +    aic->reg_size =3D 0x80;
> +    aic->gap =3D -1; /* no gap */
> +    aic->bus_get_irq =3D aspeed_2600_i2c_bus_get_irq;
> +    aic->pool_size =3D 0x200;
> +    aic->pool_base =3D 0xC00;
> +    aic->bus_pool_base =3D aspeed_2600_i2c_bus_pool_base;
> +    aic->has_dma =3D true;
> +}
> +
> +static const TypeInfo aspeed_1030_i2c_info =3D {
> +    .name =3D TYPE_ASPEED_1030_I2C,
> +    .parent =3D TYPE_ASPEED_I2C,
> +    .class_init =3D aspeed_1030_i2c_class_init,
> +};
> +
>  static void aspeed_i2c_register_types(void)
>  {
>      type_register_static(&aspeed_i2c_bus_info);
> @@ -1192,6 +1215,7 @@ static void aspeed_i2c_register_types(void)
>      type_register_static(&aspeed_2400_i2c_info);
>      type_register_static(&aspeed_2500_i2c_info);
>      type_register_static(&aspeed_2600_i2c_info);
> +    type_register_static(&aspeed_1030_i2c_info);
>  }
>
>  type_init(aspeed_i2c_register_types)
> --
> 2.35.3
>
