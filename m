Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp328599ejc;
        Thu, 19 Jan 2023 05:29:04 -0800 (PST)
X-Google-Smtp-Source: AMrXdXt7X4fP8cH7KVZfBwOYJhSJq2O3B5YkY+T02LQ1sX7cy7LToeC8QehwqtB14Vevw1+Kz1U4
X-Received: by 2002:a05:622a:4ccb:b0:3b5:b2d9:2b4b with SMTP id fa11-20020a05622a4ccb00b003b5b2d92b4bmr17988522qtb.17.1674134944027;
        Thu, 19 Jan 2023 05:29:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674134944; cv=none;
        d=google.com; s=arc-20160816;
        b=0118hOOQX8k1dC5OSOSF3qYX9DwPzUat39EGIhaNGFdozBnxC0fhQPbyMrcOxEWWqV
         GpRGAHFKkyew1pmbFm4spdKJc4534nzXAjRFdCU32zEVEiO8Z9yma64Pz7saqA4U+uCo
         y695vM9tbRsRufxHXF+0DWO4KQtI/fxRXd4aiFP1bLCezGrqYcHuwrGmwNjw15CSIJyP
         +LyLTsXqbnZX/Fyl0j2wS/0SKUud1uqpCnMS870Zcz9gzW2n0WRhfz1Uxac7X8LD05Fn
         24LdlM3VyRe8pFKsjYc0GMOcPv9c78bFKf51Kl8bU7r8sjzQiOZos0cSwUBYYqU0dv4K
         ymXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=mr7t+0gYUDkP7iaemK0rBY5JKGNnWbjZ0aNHX22Z/v0=;
        b=tKpsGcPN3RQRxGMZga5AEteCukE5bkys09m1BXMqxJctoGUKji+oPA16B9pk6vzj4K
         DuCsO5zPpPc6LAHw7t71jY86fp2CjyDifP6/HuGbMydCWdMIv4ffasPXwNlOGMCiJbIn
         TLCy3eQo6CGg2sfUJrqT2tSQCpsNIPT97rTfPPdj5Dd0V+VQSXY8v2aQPsGvF2/y0lwl
         OOQhxDdWgVPL6kNmdSTXVb7L9r25QyA6447FL1nXjA8LIvuRj6DWOliyMoL7wXdBsX39
         z4FL6bfPjp9FK5FY7ZrZYLB87cyHWbfsk8yzHc+WbZnzi+8RV/++AUgQLVPwVb95xMEn
         uvig==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=q16iTOae;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bl5-20020a05622a244500b003a68ea8af2csi7952338qtb.83.2023.01.19.05.29.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Jan 2023 05:29:04 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=q16iTOae;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIUxV-00061E-Tm; Thu, 19 Jan 2023 08:28:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pIUxT-00060p-ML
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 08:27:59 -0500
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pIUxS-0008G1-1Z
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 08:27:59 -0500
Received: by mail-pl1-x633.google.com with SMTP id jm10so2260818plb.13
 for <qemu-devel@nongnu.org>; Thu, 19 Jan 2023 05:27:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=mr7t+0gYUDkP7iaemK0rBY5JKGNnWbjZ0aNHX22Z/v0=;
 b=q16iTOaeW8srsQj+nJShRqrSdTshsYTZlzzdc24i5eAQzPBmMGf/rQBIP+5DS1QTY4
 XbLG7Yp6G7R2eRNbLh/dt6Ve8/XO21e/0+SxFTe7q8TYKCFIUhbyPKJPds1A9NYHBWS/
 ozQXXeTnt7oYjxp6enXj20u+/9N14sGEn/KS+I8dmlI9jAwSt4SA0AmiFcrtsYwyhIKw
 kTQqqcPauBUaeclKM/L5jxPcYWAi+fj0eWb7q+FFuUC+ta0g1Wd4Lpz2FfTwr64FDFmV
 hlx+l0C9QldInvLjpYLE5vyf8h56tWUU0N7k0SXbTQzSLFNtcGcR0yqfNiB+WvvAprCb
 oXmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mr7t+0gYUDkP7iaemK0rBY5JKGNnWbjZ0aNHX22Z/v0=;
 b=ZRF64c4n30MzLZqWJ3u0xfiMwWY4j8kv0+gKKMQPDER3Wt+/ugRpa2gt70omDMY6Bb
 cB7L9GIOxPpIIQnBJ/yeDouRzABHA53LrTjNtMCYgQewzlxkaz+egbHOEDJ8OInfWUO6
 4kP9Z9SQGfMwhWhexOQrP7IsrSiEKEcFC6DyaOhBxKTsp9wKZ1WUj7rl2XCNuzacR6rc
 l50oEgu+3koUoXu8qDHnQLto8webX/2fMy5VWnfF7IVkvPEKSlJ88WaetJ4vwydsqWs7
 PjAnMBufmt0ESd446kHcAcmR/fcO96jQNaRsIzNiSHyfzALZ4/j5RYyDxuQKsKI3XVEy
 WnFA==
X-Gm-Message-State: AFqh2krUvnY6ViA1XBI0wClxN3rxfR0PZKqRlzuZYyguf7x7W/GeXedN
 zHqfRU7r1FLMsI7OUnQDF8H0V2HJuLW7VjWxbNSK/Q==
X-Received: by 2002:a17:90a:ea92:b0:229:189b:6fee with SMTP id
 h18-20020a17090aea9200b00229189b6feemr1128154pjz.221.1674134876360; Thu, 19
 Jan 2023 05:27:56 -0800 (PST)
MIME-Version: 1.0
References: <20230117220523.20911-1-eiakovlev@linux.microsoft.com>
 <20230117220523.20911-3-eiakovlev@linux.microsoft.com>
In-Reply-To: <20230117220523.20911-3-eiakovlev@linux.microsoft.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 19 Jan 2023 13:27:45 +0000
Message-ID: <CAFEAcA-0sUwRy_cME7TtrcV_oh9CEkRr1P2W6BC+=uscAyt+8Q@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] hw/char/pl011: implement a reset method
To: Evgeny Iakovlev <eiakovlev@linux.microsoft.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x633.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: VPC1ZZyKM0fS

On Tue, 17 Jan 2023 at 22:05, Evgeny Iakovlev
<eiakovlev@linux.microsoft.com> wrote:
>
> PL011 currently lacks a reset method. Implement it.
>
> Signed-off-by: Evgeny Iakovlev <eiakovlev@linux.microsoft.com>
> ---
>  hw/char/pl011.c | 31 ++++++++++++++++++++++++++-----
>  1 file changed, 26 insertions(+), 5 deletions(-)
>
> diff --git a/hw/char/pl011.c b/hw/char/pl011.c
> index 329cc6926d..404d52a3b8 100644
> --- a/hw/char/pl011.c
> +++ b/hw/char/pl011.c
> @@ -397,11 +397,6 @@ static void pl011_init(Object *obj)
>      s->clk = qdev_init_clock_in(DEVICE(obj), "clk", pl011_clock_update, s,
>                                  ClockUpdate);
>
> -    s->read_trigger = 1;
> -    s->ifl = 0x12;
> -    s->cr = 0x300;
> -    s->flags = 0x90;
> -
>      s->id = pl011_id_arm;
>  }
>
> @@ -413,11 +408,37 @@ static void pl011_realize(DeviceState *dev, Error **errp)
>                               pl011_event, NULL, s, NULL, true);
>  }
>
> +static void pl011_reset(DeviceState *dev)
> +{
> +    PL011State *s = PL011(dev);
> +    int i;
> +
> +    s->lcr = 0;
> +    s->rsr = 0;
> +    s->dmacr = 0;
> +    s->int_enabled = 0;
> +    s->int_level = 0;
> +    s->ilpr = 0;
> +    s->ibrd = 0;
> +    s->fbrd = 0;
> +    s->read_pos = 0;
> +    s->read_count = 0;
> +    s->read_trigger = 1;
> +    s->ifl = 0x12;
> +    s->cr = 0x300;
> +    s->flags = 0x90;
> +
> +    for (i = 0; i < ARRAY_SIZE(s->irq); i++) {
> +        qemu_irq_lower(s->irq[i]);
> +    }

Reset should never touch outbound qemu_irq lines.
(The other end of the line will also reset and will end
up in the correct "as if the input is 0" state.)

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
