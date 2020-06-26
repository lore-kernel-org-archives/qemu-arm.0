Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp700066lfm;
        Fri, 26 Jun 2020 11:33:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxwRzQlak33eYrLksKZHifYwaYMEm4RcoY0TNiPs7pUYa5fr1eAuJWMavX/zqiIsv0GkmVJ
X-Received: by 2002:a25:c141:: with SMTP id r62mr7104977ybf.52.1593196425920;
        Fri, 26 Jun 2020 11:33:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593196425; cv=none;
        d=google.com; s=arc-20160816;
        b=BgQFP8G6Iet2FPb3v7MjMlgHcSmrJXa5IGMXlFuFpdhfoayInfFLkgATxPip6KQJy6
         ICR51eG1Ps5FNhtVTUwgsZ+haneFm9+B2W/yulJxbicDOlq72+vkdGv0VMx/Cbuovd3I
         3mGs3ywMs4sgjlRqzNF63Q174F1kgk7pQErvMhn4m6nXAemOSutrYOoo/+S+lDkmndAy
         aLf0kmnNfmyRVkvlRPvw+UOp8Ih0ahDqj2ixNW6BXKi5CBvPDwv5g3PM0j5mc+V0nQ3B
         lCIxe9Upp6wqtzKJLm8hnnRIsFZA/Z5HfeSJbNxaMnFixlpYbk8pRQvz+eDqofP1Nt2K
         ev3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=LvgLLhBtWl2z+FXtxz/Ed4ovyKj4GMS7TWSgOgCVmF8=;
        b=Uw/iHtFw36tk9J1K2N/ybpAYSG3HjXuXM9bHC83XHrrurk7lTiGfmGy0v2NKjqfc7R
         19wY1HGKcXkJoSQBQkapLOV3Tq+qAiDDXb0omMvmQCWsP4S31zs4tUcXmTd2GUELTph+
         bAy4y+2ZYi/MvU9NzbfPVA9m6KWIQNsTQy7vDct2Xv+a9dLVMR3zv6E7MQpNWEukksKn
         AGSsWe8UnCX7izu0rssUR9OvBkytilBsGt8Kd6g/c1soIRZWrOwnJRMbGlUQyFsFXKGC
         YLaXAlYcMl0ACEhelQfaOnnMO6H7zdP+8o5ko50kQNiKdX8rgp2lZ2x8o9AO+PaH2afa
         /TtQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=EPqpTzj1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l14si40010191ybt.495.2020.06.26.11.33.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 26 Jun 2020 11:33:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=EPqpTzj1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56284 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jotAX-0003wD-AP
	for alex.bennee@linaro.org; Fri, 26 Jun 2020 14:33:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58510)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jot0P-0004Ec-1P
 for qemu-arm@nongnu.org; Fri, 26 Jun 2020 14:23:17 -0400
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:40547)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jot0M-0005Br-RL
 for qemu-arm@nongnu.org; Fri, 26 Jun 2020 14:23:16 -0400
Received: by mail-ot1-x343.google.com with SMTP id q21so1941876otc.7
 for <qemu-arm@nongnu.org>; Fri, 26 Jun 2020 11:23:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=LvgLLhBtWl2z+FXtxz/Ed4ovyKj4GMS7TWSgOgCVmF8=;
 b=EPqpTzj1cd2Znrz+bTU7dU0M7aac5eS2BXa/IBOhXQR2XQh0lrwsQpMbvygPWOPXqV
 IED5DHDcC0EvfEAHqsSO+pIuQMdzxt0rfzHCbv0735VwSWJ29q8A199giaXN4KrV7Lub
 XPKY2IsFPCen0C4kll4IGDTzo72ctLkS7hIndKbXJe1aN+BaavBIhFiwF9pbwt+EYPxF
 wwSVVwR0UphTRQtaPYyw1qwUlnc7LX9aOnmNoN47ofnjQy3E2TQXIY9MZswZZ1q4LADK
 aGxWHheXXvrAhuYaR9UgdlXYY8l6In/nRQTf8X6d8+m4KI5RY9KdoKNcKQPCrUEw2XKt
 ZoWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=LvgLLhBtWl2z+FXtxz/Ed4ovyKj4GMS7TWSgOgCVmF8=;
 b=NNIPvVw4EbBRvM3+FaPiik3nr5TFhzB+JDvy2+qpujCZImMh1ZhnAitALgI/VQZTbo
 4MbtdKnHPa8cwOLD310Kz7R8GkvaWtOuVs8HXp8zi2tPMDFo1uBAPMZDa3BqmGnCxl7w
 GktBNlgAQQ0f+J/nKu+tFXubeeBWkB22+zw9rV/UcDBudPBo49SpohBX7yL+t13IByC0
 uGG4x6vSUY0u5Lc5M9SY2vElqNK9vTs51R/yX6NoZcL+JoJ+uTd9fn+E0WqFM3doH/iB
 HPULbdAau3IFB0ZnIop75G1zaeA8zN7sKEuV4y9HZCzHQydDJaI9XIiefHNbeYo1Muqd
 J2Ug==
X-Gm-Message-State: AOAM532FQpKGWsyOFxYwmx0P/xG+0nEuQSS2B9heQ4/kks55FbRg+1ob
 64RVYvaBIHpj3Stle5KPJG4D5mYCKtzA7qPfaBcAoQ==
X-Received: by 2002:a4a:2f15:: with SMTP id p21mr3558948oop.20.1593195793213; 
 Fri, 26 Jun 2020 11:23:13 -0700 (PDT)
MIME-Version: 1.0
References: <20200623072723.6324-1-f4bug@amsat.org>
 <20200623072723.6324-2-f4bug@amsat.org>
In-Reply-To: <20200623072723.6324-2-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 26 Jun 2020 19:23:02 +0100
Message-ID: <CAFEAcA9-Vjh-hkB9i9fvp9yEHuKW7cGeEDQ-kKmiiao2WogQDQ@mail.gmail.com>
Subject: Re: [PATCH v6 1/9] hw/i2c/core: Add i2c_try_create_slave() and
 i2c_realize_and_unref()
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::343;
 envelope-from=peter.maydell@linaro.org; helo=mail-ot1-x343.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Corey Minyard <cminyard@mvista.com>, Andrew Jeffery <andrew@aj.id.au>,
 QEMU Developers <qemu-devel@nongnu.org>, Markus Armbruster <armbru@redhat.com>,
 qemu-arm <qemu-arm@nongnu.org>, Joel Stanley <joel@jms.id.au>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: VbCczJVUOcCD

On Tue, 23 Jun 2020 at 08:27, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
>
> Extract i2c_try_create_slave() and i2c_realize_and_unref()
> from i2c_create_slave().
> We can now set properties on a I2CSlave before it is realized.
>
> This is in line with the recent qdev/QOM changes merged
> in commit 6675a653d2e.
>
> Reviewed-by: Corey Minyard <cminyard@mvista.com>
> Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Couple of things I belatedly noticed on this patch, which I don't
think are important enough for me to drop it from my pullreq,
but which I think it would be nice to address in a followup:

> diff --git a/include/hw/i2c/i2c.h b/include/hw/i2c/i2c.h
> index 4117211565..d6e3d85faf 100644
> --- a/include/hw/i2c/i2c.h
> +++ b/include/hw/i2c/i2c.h
> @@ -80,6 +80,8 @@ int i2c_send(I2CBus *bus, uint8_t data);
>  uint8_t i2c_recv(I2CBus *bus);
>
>  DeviceState *i2c_create_slave(I2CBus *bus, const char *name, uint8_t add=
r);
> +DeviceState *i2c_try_create_slave(const char *name, uint8_t addr);
> +bool i2c_realize_and_unref(DeviceState *dev, I2CBus *bus, Error **errp);

Can we have doc-comments for new global-scope functions, please ?

> --- a/hw/i2c/core.c
> +++ b/hw/i2c/core.c
> @@ -267,13 +267,27 @@ const VMStateDescription vmstate_i2c_slave =3D {
>      }
>  };
>
> -DeviceState *i2c_create_slave(I2CBus *bus, const char *name, uint8_t add=
r)
> +DeviceState *i2c_try_create_slave(const char *name, uint8_t addr)
>  {
>      DeviceState *dev;
>
>      dev =3D qdev_new(name);
>      qdev_prop_set_uint8(dev, "address", addr);
> -    qdev_realize_and_unref(dev, &bus->qbus, &error_fatal);
> +    return dev;
> +}
> +
> +bool i2c_realize_and_unref(DeviceState *dev, I2CBus *bus, Error **errp)
> +{
> +    return qdev_realize_and_unref(dev, &bus->qbus, errp);
> +}
> +
> +DeviceState *i2c_create_slave(I2CBus *bus, const char *name, uint8_t add=
r)
> +{
> +    DeviceState *dev;
> +
> +    dev =3D i2c_try_create_slave(name, addr);
> +    i2c_realize_and_unref(dev, bus, &error_fatal);
> +

We now have a _try_ function which isn't "same behaviour as
the non-try function, but give me back an error status rather
than just killing QEMU". That seems confusing -- is there a
better name we can use ?

thanks
-- PMM
