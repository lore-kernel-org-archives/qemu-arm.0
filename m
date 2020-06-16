Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp2482859lfm;
        Tue, 16 Jun 2020 03:22:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxtZWy8FBSKjBkl9ljBvLrBW1+EqzwvMMZUV1T5ElO/DzIz3/9fKOq6AOPRAqJzxLvEItlS
X-Received: by 2002:a25:4901:: with SMTP id w1mr3099237yba.31.1592302928258;
        Tue, 16 Jun 2020 03:22:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592302928; cv=none;
        d=google.com; s=arc-20160816;
        b=nurYngUWKOqY4waWD3ERDdMkuwWJTPBCDgo4z7mSY8zYuaWN6VpHmW/9XRjRL5GT3s
         LhzGHNi4FEb8kD+WP51VsLbx/TUEsT5XdtwGLPo2ntM26B7onICnyYAz3iUcXLl+K868
         UUaDxIKFbZiO+yZP0riu9NM/B4usd2By6Bh23bw0Y9ayA3O96D/mdDW+wIARAbypyEUN
         JAzK2xHOKdF1eI2hKmPHhSz9gtxUi6syyaLuuL1xq6Tpp3oWxefVYezuezjTQ/bapfO1
         oNK8UxWsvHyZjBe+h4QxV8PLwggEnykAy+EvL2M0toWmeisf0btHv6oYqd7cI/gXsF3a
         P2Jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=rZ5RV2Xt87KOcGezzlr4cpIJUUSEU7Ipl8/CDMy2YiA=;
        b=rDC4CFgwvRrCNFczlsEaXaTrROwMGgloKXnFCX96uzAvFdNkzWTJ/5cIbjUV/RaXbL
         +Yk3ACCdV1bzEv4HM8Wpd6xFMp03uEh/RF2LVhFkga0F6Lwk6a9fNNlIMkATZqIqBSGF
         jvytwqAj5k0bQ8BN9YF2Y9YajGdNdNkgOqH3FMYMwlERaFn/GbWuUuZsbpvPStHk5v0a
         Jp9rYFpNbyJxZBYsdcASQqGVAqJoHr7w8tA2j+Cm7w3e+lLX3UdkxuEKq8I4K/cVNgmF
         ndSGn5xsnAskaQSdONgHi3Kl6Qa3TufjFquvQvzzkCv1h3RCXmJ9zSCfPUjCwOCIAB+6
         /H/w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=TqW9lnpO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a1si14658801ybs.64.2020.06.16.03.22.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 16 Jun 2020 03:22:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=TqW9lnpO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jl8jH-00066j-MQ
	for alex.bennee@linaro.org; Tue, 16 Jun 2020 06:22:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jl8j9-00064z-DQ
 for qemu-arm@nongnu.org; Tue, 16 Jun 2020 06:21:59 -0400
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242]:35154)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jl8j7-0008Ra-TG
 for qemu-arm@nongnu.org; Tue, 16 Jun 2020 06:21:59 -0400
Received: by mail-oi1-x242.google.com with SMTP id k4so18768995oik.2
 for <qemu-arm@nongnu.org>; Tue, 16 Jun 2020 03:21:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=rZ5RV2Xt87KOcGezzlr4cpIJUUSEU7Ipl8/CDMy2YiA=;
 b=TqW9lnpO574Cv9nM+1LIVqDa5nDL1bFgW4jIY9urwBVWJwiUQiuJdcI5HqnDGdza2h
 Gm0Z50adhRrbXUWWEurvKeo8v1EPADA7tM30N92RNHZU8TJVZiK5h4/Z28zllrNlY4au
 LnmzROH93gnFXc9sap+BkXhBun3u8FSIC61e3DSbAAXH1KagBNhI8VweOeMuXYBwJuMf
 jPnX5NeBbIWZ+M7aH38S6iI67bmH0Ygp52cCKfn2uHZ06wQPLX0Qe3l3RhwaO1FxHmbl
 WQOIuj+Yas057iDGCMPpexLsMqF4YyA+N/xZyrVq7XlvuIi95knB1DM53jPd/yCpWwS3
 zqUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=rZ5RV2Xt87KOcGezzlr4cpIJUUSEU7Ipl8/CDMy2YiA=;
 b=f5s64zyiF0vKygjGDZmrilTrIm3sH4Jy/w2JHQY+wGChYxFqK+TQUbfJQpzMKo+lVK
 WDBzJ9tmD1dbkY7j8nWWwQM3dlPweKvukBPrEOkaRRohsKMmISth62L+y01g+aTVO+1d
 SNyv+i73qdqXlH1WhbBXyRaPrXnkgoo1GxiUjXlymO5ifq7ONqYRg0JdGTB82IBfXZej
 gRR8jDk9JszLMbEoc/3njs3ZrFzOvLcDeanagQZ/gv0RTz0LtuFeWF4cr4MwpDPF373v
 MU7sR1UeBj5pYZvv0s0Jt6EhZiNrts2EdsQNaoiw2MCcLBHB48pOn3oCVk1t6sm1L9mU
 7Jhg==
X-Gm-Message-State: AOAM531Fyvt4JvhrCcP4u0pMnK2pPAltwig8JnVcvLLwbaIj30f123UV
 JVWxO2tTNzIuakF1IjUcBPn3WKbwzIkYhkBRZqJuwg==
X-Received: by 2002:aca:5152:: with SMTP id f79mr2648504oib.146.1592302916649; 
 Tue, 16 Jun 2020 03:21:56 -0700 (PDT)
MIME-Version: 1.0
References: <20200616063157.16389-1-f4bug@amsat.org>
 <20200616063157.16389-6-f4bug@amsat.org>
In-Reply-To: <20200616063157.16389-6-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 16 Jun 2020 11:21:45 +0100
Message-ID: <CAFEAcA9oruR9iXVwPxDMxdGe+Nv8zS9DZ=g3ta96_sSz3-rumg@mail.gmail.com>
Subject: Re: [PATCH 5/7] hw/arm/mps2: Add I2C busses on FPGA APB
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::242;
 envelope-from=peter.maydell@linaro.org; helo=mail-oi1-x242.google.com
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
Cc: Esteban Bosse <estebanbosse@gmail.com>,
 Joaquin de Andres <me@xcancerberox.com.ar>, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: MLurPadzS9qN

On Tue, 16 Jun 2020 at 07:32, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
>
> There are 4 different I2C peripherals on the FPGA APB.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  hw/arm/mps2.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/hw/arm/mps2.c b/hw/arm/mps2.c
> index 4a49bfa9b9..6224d7a63c 100644
> --- a/hw/arm/mps2.c
> +++ b/hw/arm/mps2.c
> @@ -321,6 +321,7 @@ static void mps2_common_init(MachineState *machine)
>          create_unimplemented_device("cmsdk-ahb-gpio", gpiobase[i], 0x100=
0);
>      }
>
> +    /* FPGA APB */
>      sysbus_init_child_obj(OBJECT(mms), "scc", &mms->scc,
>                            sizeof(mms->scc), TYPE_MPS2_SCC);
>      sccdev =3D DEVICE(&mms->scc);
> @@ -330,6 +331,12 @@ static void mps2_common_init(MachineState *machine)
>      object_property_set_bool(OBJECT(&mms->scc), true, "realized",
>                               &error_fatal);
>      sysbus_mmio_map(SYS_BUS_DEVICE(sccdev), 0, 0x4002f000);
> +    for (i =3D 0; i < 4; i++) {
> +        static const hwaddr i2cbase[] =3D {0x40022000, 0x40023000,
> +                                         0x40029000, 0x4002a000};
> +
> +        sysbus_create_simple("versatile_i2c", i2cbase[i], NULL);
> +    }

Is this device really the same as the I2C controller h/w
on the versatile board ?

thanks
-- PMM
