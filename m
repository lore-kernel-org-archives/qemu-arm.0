Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp4564305lfm;
        Tue, 30 Jun 2020 17:47:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxj/YK1C7ODhk2FtLGMsdfvSmwqsnYsRuKlcDbs1pTYkb6TQZDN6aUoEf9iBHFE9gH9YwdO
X-Received: by 2002:a25:3bd8:: with SMTP id i207mr37047323yba.167.1593564442176;
        Tue, 30 Jun 2020 17:47:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593564442; cv=none;
        d=google.com; s=arc-20160816;
        b=QIuO7AQabiZE6Zc9YpIeUS2CHFKrkm8z8249ugDL2cISCPTCWj6FEss/zfK/M0aj7Q
         xaF+MmervoLJiNXEtF9l/XtavTyYHR2rYLoh43z+dDMN4qDRH0fPIDTUz4NhielAkmXN
         WVUUxuWNu6YlJc5v22eL9jM/x1pfvy1BGlY6LJIQggmp8TRbQx3j1gb3V/1P1GKQz76P
         XA/qBnJyv9eB+BQl3hkN5afsdHjaXYu8Cw78rez6Zz9WVcLAKXQVbg279W0RaOJI8fRQ
         QmZjeU8PRBEPwv/GMpZM0F4IkL0zM9kdSOol6RXOJ7tEBcQHOeo89N6vxBPzvPkFVM0O
         lpJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=w79Sev6iTPoIOV0GqrC3mMTBsITLTWDWM1QrF03kCnU=;
        b=B064wtkp9c1gGbfKmQ7dJs6MZt8rezhLykaXapTOPyj5sBky+/0r8rCS/8u/Un5LDo
         /u+EGaIFZ1qoA5gYlQKt7CjPotBl0cVgwSNrznSL36eE0LSEWW7r/FrtCjeUBajMSJ06
         GqH5x79TfdgEhFZ2AgIWKvwD7CNvltyaty5sm1fv+SW3iSe4h+Oec97H1orq2A8hN3Hg
         BSg+76q4neMVeMQeP4OvWkAB79AeDlNaZ9VW3WWgVtAPVUhxa6OeDN0ZhhT+L8MH87zP
         kHCvKPXY6LXKV1FEhuxL58QZEBi+ZaIVtIOv0gEXOAtgVIxy+wiZPxQUG6JawAo5Kgi0
         S/RQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=V+vg65ag;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e7si4096054ybp.191.2020.06.30.17.47.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 30 Jun 2020 17:47:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=V+vg65ag;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:52134 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jqQuH-00088Y-6F
	for alex.bennee@linaro.org; Tue, 30 Jun 2020 20:47:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38618)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1jqQu5-00088A-W6; Tue, 30 Jun 2020 20:47:10 -0400
Received: from mail-io1-xd44.google.com ([2607:f8b0:4864:20::d44]:35118)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1jqQu3-0008Ki-VR; Tue, 30 Jun 2020 20:47:09 -0400
Received: by mail-io1-xd44.google.com with SMTP id v8so23046570iox.2;
 Tue, 30 Jun 2020 17:47:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=w79Sev6iTPoIOV0GqrC3mMTBsITLTWDWM1QrF03kCnU=;
 b=V+vg65agCcRBWOEnLhaWpod5rTq5zfGGQK2FKF/YKTAThl2UVFnmT819lGBcGvJQzv
 EuwlKrCZJsDqeR2L6MBrg+oSVN+A/+D0qtaIcYsUDrn+aGltpUA+nYj2QSRxVWMrkbXv
 8PuC6bVbo/Gunu0Gi50fWmWVl/LnBMnsVOjVBh+lnWy7CTNk4RaWQZu2m9cqX3J7cUl7
 RV63uF3erSIC8wk2O/53h63G9Gprau5E3kW6HGMv8wQ8/k9OxkU0Mqdx5d7PlDx2jyfH
 ikP6WFODeu52ewSmfl1nkn7UfN4jyY1gYTslVZHgBTLmRWykMMZ3Jwda2f3sY+1835/K
 DliQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=w79Sev6iTPoIOV0GqrC3mMTBsITLTWDWM1QrF03kCnU=;
 b=r3CGfJkPqdoYxYq3Efw4tS3iovdGt6WwyIxrvDO58ZtmFQjcB/t6ScxuxVD3iFm37i
 KEvXFMN38UVYLjyigEI89KCN5IbnnQSXlXrZKctwXmu254I5l/S1kGn8Z46tFA/etESF
 7frP3FYiuGWfxnRb7x1wEsO11aO3FonLaWC0VVHUqVuW2RAI80PDNbqUfAqT9JrB3kLR
 sl9cjLMrSE3B8jTIIhY7Fzm57ojTQmnCHGpJ+u9PpZ2I2RysDdP2nAb46FBgkXOG8Q4b
 2Oo+SsGLeh8QHqu3vF35Py9be23NHDiGMckdoKxekMFdiOaEYWVLR43cfXcDceIgAD9M
 3s5Q==
X-Gm-Message-State: AOAM532qdwjyLWb0R9MfsSSXL8YVIijTUvw0Gj/+3+zgYkparTMQ+19H
 Tsxbwg7y4ZJMKuoIb6mBD1JEA2Ef0vkgwZiLNYQ=
X-Received: by 2002:a02:5b83:: with SMTP id g125mr25886800jab.91.1593564426509; 
 Tue, 30 Jun 2020 17:47:06 -0700 (PDT)
MIME-Version: 1.0
References: <20200628142429.17111-1-peter.maydell@linaro.org>
 <20200628142429.17111-11-peter.maydell@linaro.org>
In-Reply-To: <20200628142429.17111-11-peter.maydell@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 30 Jun 2020 17:37:22 -0700
Message-ID: <CAKmqyKO5DiM=cNU8Y5kYuCVG4MhDwHS_2c=wuSTCnNExGCQfxA@mail.gmail.com>
Subject: Re: [PATCH 10/17] hw/misc/max111x: Use GPIO lines rather than
 max111x_set_input()
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d44;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd44.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
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
Cc: qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <alistair@alistair23.me>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: JOmM6tRZn9Jo

On Sun, Jun 28, 2020 at 7:28 AM Peter Maydell <peter.maydell@linaro.org> wrote:
>
> The max111x ADC device model allows other code to set the level on
> the 8 ADC inputs using the max111x_set_input() function.  Replace
> this with generic qdev GPIO inputs, which also allow inputs to be set
> to arbitrary values.
>
> Using GPIO lines will make it easier for board code to wire things
> up, so that if device A wants to set the ADC input it doesn't need to
> have a direct pointer to the max111x but can just set that value on
> its output GPIO, which is then wired up by the board to the
> appropriate max111x input.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  include/hw/ssi/ssi.h |  3 ---
>  hw/arm/spitz.c       |  9 +++++----
>  hw/misc/max111x.c    | 16 +++++++++-------
>  3 files changed, 14 insertions(+), 14 deletions(-)
>
> diff --git a/include/hw/ssi/ssi.h b/include/hw/ssi/ssi.h
> index 4be5325e654..5fd411f2e4e 100644
> --- a/include/hw/ssi/ssi.h
> +++ b/include/hw/ssi/ssi.h
> @@ -111,7 +111,4 @@ SSIBus *ssi_create_bus(DeviceState *parent, const char *name);
>
>  uint32_t ssi_transfer(SSIBus *bus, uint32_t val);
>
> -/* max111x.c */
> -void max111x_set_input(DeviceState *dev, int line, uint8_t value);
> -
>  #endif
> diff --git a/hw/arm/spitz.c b/hw/arm/spitz.c
> index 93a25edcb5b..fa592aad6d6 100644
> --- a/hw/arm/spitz.c
> +++ b/hw/arm/spitz.c
> @@ -696,13 +696,14 @@ static void corgi_ssp_gpio_cs(void *opaque, int line, int level)
>
>  static void spitz_adc_temp_on(void *opaque, int line, int level)
>  {
> +    int batt_temp;
> +
>      if (!max1111)
>          return;
>
> -    if (level)
> -        max111x_set_input(max1111, MAX1111_BATT_TEMP, SPITZ_BATTERY_TEMP);
> -    else
> -        max111x_set_input(max1111, MAX1111_BATT_TEMP, 0);
> +    batt_temp = level ? SPITZ_BATTERY_TEMP : 0;
> +
> +    qemu_set_irq(qdev_get_gpio_in(max1111, MAX1111_BATT_TEMP), batt_temp);
>  }
>
>  static void corgi_ssp_realize(SSISlave *d, Error **errp)
> diff --git a/hw/misc/max111x.c b/hw/misc/max111x.c
> index abddfa3c660..3a5cb838445 100644
> --- a/hw/misc/max111x.c
> +++ b/hw/misc/max111x.c
> @@ -131,12 +131,21 @@ static const VMStateDescription vmstate_max111x = {
>      }
>  };
>
> +static void max111x_input_set(void *opaque, int line, int value)
> +{
> +    MAX111xState *s = MAX_111X(opaque);
> +
> +    assert(line >= 0 && line < s->inputs);
> +    s->input[line] = value;
> +}
> +
>  static int max111x_init(SSISlave *d, int inputs)
>  {
>      DeviceState *dev = DEVICE(d);
>      MAX111xState *s = MAX_111X(dev);
>
>      qdev_init_gpio_out(dev, &s->interrupt, 1);
> +    qdev_init_gpio_in(dev, max111x_input_set, inputs);
>
>      s->inputs = inputs;
>
> @@ -153,13 +162,6 @@ static void max1111_realize(SSISlave *dev, Error **errp)
>      max111x_init(dev, 4);
>  }
>
> -void max111x_set_input(DeviceState *dev, int line, uint8_t value)
> -{
> -    MAX111xState *s = MAX_111X(dev);
> -    assert(line >= 0 && line < s->inputs);
> -    s->input[line] = value;
> -}
> -
>  static void max111x_reset(DeviceState *dev)
>  {
>      MAX111xState *s = MAX_111X(dev);
> --
> 2.20.1
>
>
