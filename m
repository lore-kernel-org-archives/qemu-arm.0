Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp315462ejb;
        Thu, 1 Jun 2023 03:19:40 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6lba6ELx1nveZp7y7dbt8E1Q7t4LGf4b86d+x4aZmczNtjDGGvF2yQJlh+nIa94yuYHkJI
X-Received: by 2002:a05:6214:27ed:b0:621:331b:f55d with SMTP id jt13-20020a05621427ed00b00621331bf55dmr9375022qvb.19.1685614779583;
        Thu, 01 Jun 2023 03:19:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1685614779; cv=none;
        d=google.com; s=arc-20160816;
        b=gelzyL5Eahq7PmwkrkP58uo0aPT84KCsceAGYA2sH+UJI30FtSC+SsX3GN6wgdQZZE
         Jt1Z9GbRG2X5NHgtGab712qEodAESSGqc0USce+TPYJceeweMEPWL1L/sY2gMc4HvhAP
         s9xhDFaUVjiJHFl05u2928KSK/F/ObMniusuJ4I6lPeme6SyGNP+Uo7+xIZl0a0BzvE8
         RwxqRicKz9XSvNPSP+bGbvJG37Q5sw2nNTHkT04foEb/fFkDEezFIOoeyLHXybRAeafr
         fP8T8hhy2sGUXVTbrFoS+VvO5bjFzYgvYlQsUBeaBVGiK/Bde21dOZ3f/KFCuBI2QyqZ
         XMYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=zUPPTHrrmmF7AmHwkQAkl81gL1fMGaREzxmlmvZ1Y8Y=;
        b=THl8HFntr8Xa4mVRuU0px4CP1oCDPau5W4xCQ29SyTz9bZf0PVnsiJB5bcVPgJFY8y
         apdOBzLdAwsOdr98c0jzAxAkaHBdh+0L9RTEW4UNzgi8RBNtuTbmxQtSoZNMLzF5QQb5
         kyLsONkrM5uAdL9GXuLHWanQF7u8Zbt06gZp4dJMjLEST9krnlf5onLVpFBZQA75atc6
         uS5Qg8JBQH/kuzvMw5kvFhE6do6v4x5WlpAOU84HrEJePMGHerlssEOYUgJ9oxID4g21
         uQqw1aA/8/u9TExFVUF13gn9eXQppNYAk7P2axH1YVtoPH7UqlxZ0wukvyNPZF6+oK1S
         dnUg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=y4cLi2HA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 4-20020a0562140cc400b006262d6b06afsi4984852qvx.531.2023.06.01.03.19.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 01 Jun 2023 03:19:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=y4cLi2HA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q4fP2-0002TO-3D; Thu, 01 Jun 2023 06:19:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1q4fP0-0002Si-MA
 for qemu-arm@nongnu.org; Thu, 01 Jun 2023 06:19:30 -0400
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1q4fOy-0003KO-4D
 for qemu-arm@nongnu.org; Thu, 01 Jun 2023 06:19:30 -0400
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-5149e65c244so1020506a12.3
 for <qemu-arm@nongnu.org>; Thu, 01 Jun 2023 03:19:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685614766; x=1688206766;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zUPPTHrrmmF7AmHwkQAkl81gL1fMGaREzxmlmvZ1Y8Y=;
 b=y4cLi2HAWtxX0aIAFzW4SLV05StnHRsulNklN+R0xB0BUHtUfBo6ATBnnYC1wG4Gjh
 B8KXUgywKXLTXQWegKBcFIec54lDj1wFdczK6fZGrA7znYuMt55/1fwaKryFrMfm9Z8B
 F3wpqXxPxDd5uYI5+yl0WCo/9zT5Xy+HuUV9Qm9KAooJWhl2KGI2ZoRD3dhwloqjJbgH
 vv2/WKqbXPNZjPuwI5PGSbgiAQDSl3xtVaK4y7SNo7P+Y/auy1g93UV6nRom5YmwPTkb
 ck+5grW/cIzCH6e9K42J1CIjcGLmNywhG1hlKty9bj+pNXfn8O7HmJAoW0n50rDjHQ2a
 zhvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685614766; x=1688206766;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zUPPTHrrmmF7AmHwkQAkl81gL1fMGaREzxmlmvZ1Y8Y=;
 b=gFMb83fBnAimfiSjAtAPL5nwSdLGBct7mtrod3CDp5+dnhkF3hyKdeNlhSFdWtfvor
 NxBUdBPN/j8J3/4uFaGWxgnMSbBmrgrPK9cDDdxAFtFj4RzU0y/pcupAX608INxbNs2I
 uksxkeSffwGLY8mkMXOJ0zRCIv2m6V81no0Gp/Zqf0BPEmRluvwnEY+lrYGQp24NPFl9
 kaMpgKwfqJx3U3/7y7AQF3wimfvTJ55DPxF8FY08cTLc9Bzzb2DSzhxJNXmTPTxip+l6
 guCgv021ZbKJRFoxcyVCxnnZCGHpTngzwy57MGseZGu0XlOOm4CcZ2RvJdqNRPwN615T
 geVg==
X-Gm-Message-State: AC+VfDzwPkNvuTx5bfBX3fwrGdAa334Ln9JSMPTxem6FVeLvHmfKES2D
 oLE58mnk/v7cEaQe5l6oJe9pJmhhbphYoBY5jyC6dw==
X-Received: by 2002:a05:6402:3ce:b0:514:eb2c:4822 with SMTP id
 t14-20020a05640203ce00b00514eb2c4822mr3057478edw.4.1685614765959; Thu, 01 Jun
 2023 03:19:25 -0700 (PDT)
MIME-Version: 1.0
References: <20230601094625.39569-1-philmd@linaro.org>
 <20230601094625.39569-8-philmd@linaro.org>
In-Reply-To: <20230601094625.39569-8-philmd@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 1 Jun 2023 11:19:14 +0100
Message-ID: <CAFEAcA8wgaEJd03G8gNtFOUFT0jpm=KLfaZSjeYcOgvTYdvhJQ@mail.gmail.com>
Subject: Re: [PATCH v2 7/7] hw: Simplify using sysbus_init_irqs() [manual]
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, 
 Thomas Huth <thuth@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 qemu-ppc@nongnu.org, 
 Eduardo Habkost <eduardo@habkost.net>, qemu-arm@nongnu.org, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: CVIBmIRhI93n

On Thu, 1 Jun 2023 at 10:48, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org=
> wrote:
>
> Audit the sysbus_init_irq() calls and manually convert
> to sysbus_init_irqs() when a loop is involved.
>
> In omap2_intc_init(), the parent_intr[] array contains
> 2 elements: use ARRAY_SIZE() to iterate over.
>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>

> diff --git a/hw/timer/renesas_tmr.c b/hw/timer/renesas_tmr.c
> index c15f654738..dd2929d6e7 100644
> --- a/hw/timer/renesas_tmr.c
> +++ b/hw/timer/renesas_tmr.c
> @@ -428,17 +428,14 @@ static void rtmr_init(Object *obj)
>  {
>      SysBusDevice *d =3D SYS_BUS_DEVICE(obj);
>      RTMRState *tmr =3D RTMR(obj);
> -    int i;
>
>      memory_region_init_io(&tmr->memory, OBJECT(tmr), &tmr_ops,
>                            tmr, "renesas-tmr", 0x10);
>      sysbus_init_mmio(d, &tmr->memory);
>
> -    for (i =3D 0; i < ARRAY_SIZE(tmr->ovi); i++) {
> -        sysbus_init_irq(d, &tmr->cmia[i]);
> -        sysbus_init_irq(d, &tmr->cmib[i]);
> -        sysbus_init_irq(d, &tmr->ovi[i]);
> -    }
> +    sysbus_init_irqs(d, tmr->cmia, ARRAY_SIZE(tmr->cmia));
> +    sysbus_init_irqs(d, tmr->cmib, ARRAY_SIZE(tmr->cmib));
> +    sysbus_init_irqs(d, tmr->ovi, ARRAY_SIZE(tmr->ovi));

Doesn't this change the order of the IRQs? Previously
we had channel 0 CMIA, channel 0 CMIA, channel 0 OVI,
channel 1 CMIA, channel 1 CMIB, channel 1 OVI. Now
we have channel 0 CMIA, channel 1 CMIA, channel 0 CMIB,
channel 1 CMIB, channel 0 OVI, channel 1 OVI. So they'll
get miswired in the board code now...

thanks
-- PMM
