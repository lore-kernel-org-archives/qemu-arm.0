Received: by 2002:a17:906:ca8a:b0:a63:3083:985b with SMTP id js10csp533096ejb;
        Tue, 28 May 2024 07:34:22 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWL5PzGwbRTVKSO0O/YBQl/5IVupRhXZyBV1fTYRbcXWivV1NsamajdKRVDJccHlxtA6LNT/DuCHyBq856ZVftZkqR+UFvf
X-Google-Smtp-Source: AGHT+IH7iPVSBwgOM2OH+gIdU0fzmfLwZoRi0JwyITN8n511MypSsEeuUn+mrO/ORWU9ELYli5wP
X-Received: by 2002:a05:6102:945:b0:48b:8a5e:a9c4 with SMTP id ada2fe7eead31-48b8a5eabc7mr4774550137.24.1716906861800;
        Tue, 28 May 2024 07:34:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1716906861; cv=none;
        d=google.com; s=arc-20160816;
        b=m6kGZ94hkKDvA39BK121sOPFh7Ur1UBq8SWLYHjXLXzMxaxNtqS8bKyPkZQXReyUCT
         83We1ljDIkihcuIfi2CYQJUZIDV/8knilHbEdQDNWuDrFtZ7+aNjuKTODFUR7+ogrFCV
         7gZsTfQF8YluGFrVPoWYgDk7w+vh2+U56uIUmnesgYaoAi+OWSKRhIsTzUmxSlrq2MHk
         ORQ/Qpf6A1QBm+Jrx7G0m4HjCzJ9YfeURP1SR6RNmFUKSpHINLQWOK/vnXAK8vfLJbg4
         dppEZr7fdm7gZTZNO4AntvlAN5iBunQic47uKWhihTA4N30Rodz/Iey1yVpWyBZYqbgi
         t8Vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=c5LCgVEizw6DtouBqcgIIvIsuJPil9t/nZVk415WmuY=;
        fh=FloBpwa/eA7rFYuIoe4QMBQscnbatN42RTzR9xTB1HI=;
        b=Irt/JrJo944tcu4x8n5P1YS2d0I9bfIvk8ETBx3MWlocZxkFD9Jur9Gd2qW7O5yghT
         xjQi4X3spQB/m4ubgyXcBVWOjzFz8vWjXGy7SWX85VWwpZNV2feNlOzcWgUDK2Wu5i1X
         vOH4L0+Nv3j/rW2i93d2GTCd8OGl+XHOPZDh36inWmJVjwYM1TepJ9m1r6YVaDy8FDvS
         /mlvf56+9+eEK853x102dZFJwuZzUuciI4gW/wfD9aP1ZxxQyZFENgFTP+Kv1RQxblRL
         DJc12fdxuY9MqaMXVSWvX7EKyNzSGUAJqGlC8YsINIixPOv8uFY8XZSzWOoGdD7jifzt
         IrYA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dpzPMXJ1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-48b925e3c63si275492137.608.2024.05.28.07.34.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 28 May 2024 07:34:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dpzPMXJ1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sBxtq-0007NA-7d; Tue, 28 May 2024 10:34:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sBxtp-0007Mx-IH
 for qemu-arm@nongnu.org; Tue, 28 May 2024 10:34:01 -0400
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sBxtn-0002rD-93
 for qemu-arm@nongnu.org; Tue, 28 May 2024 10:34:01 -0400
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-5766cd9ca1bso1261131a12.0
 for <qemu-arm@nongnu.org>; Tue, 28 May 2024 07:33:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716906837; x=1717511637; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=c5LCgVEizw6DtouBqcgIIvIsuJPil9t/nZVk415WmuY=;
 b=dpzPMXJ1snLtUCv4RfpYREiffmXNo6/LmzclOei1uTOTvB1rMyHkXI2ALd1nbJ0R5e
 Nno72DXk+sNxCqWzN6gsFVBYqINstO3hGvIfUbGRIK4V/X6EFDgf6AEy38/B+wgiQjId
 SLdwSspbbQiPtbTCXninlH1KZfa+eeg7M1xxhwGUdN43KItW10jAecb8afA9WoVF68qG
 TTaZu8nx8hgSzYSXUQTbxWtcTdouktsnehvWF87biSJ4hEOiCWn94H4ZJs66uxIh1HuQ
 sac4H07uOoFCqjnd0KeXvIvL7YcBpjyeXcsnfTx5/XtQ8PbTSwrJpejeGrU+0yvUU0E+
 Ll0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716906837; x=1717511637;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=c5LCgVEizw6DtouBqcgIIvIsuJPil9t/nZVk415WmuY=;
 b=PHDy3RP2T12iawoDNi+6YPXmkdjwn68H23wjKjdw6s9/HvadId1DsDPVVBDk+9MEh6
 BFTon40050KK1gMP1gPuK3gyoEyfR/XMSZpR26sOKXfsagaq0FlsmRdnzDNliDkABIuW
 PBCHdVoFir/xIZ2TJubU4uX1lL4oUbtJE5MsA/ZvB0HXFqqR6Jbobbufx4fKaCnvGcPd
 Ql4vLz7xxjmenSNRvJ3EzziiDSUgYqZySVAwmKdU6ujpl+4yjp3n+JmbGV+hCRdA49AZ
 uvmEHbFta6Oo3hB0LGdKTTw5NNqQz6LhhH0gBSHeuwrZb5DE6FntudhRikp+BHlcsxQB
 l76w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWn1OHXu9jv6+3gV9JgT6WkGmjvHP4vJY9JrVxtN1SEf9ba5hYJR9W15Qjgid48OAmtfu2V21KoUkUUFuHwAhBMBBCD
X-Gm-Message-State: AOJu0YyuvXFzZzQBz96DKNUJ4zB48MPGAaWzmN2KGnmKYCYw0usk0IEt
 +UdusJw33iIdeQHIxX8hr9d+1UzbmVQ1U/FEdgZSbcbs+9XiYx9cm+CkooYn2PNwJKBWQ/+/ZxM
 nSHBD88HOQymEDlBmi5z9LFg3dF3wO1qm/oyHiQ==
X-Received: by 2002:a50:d6c9:0:b0:578:4b06:fdf7 with SMTP id
 4fb4d7f45d1cf-5785198a027mr8495091a12.25.1716906837143; Tue, 28 May 2024
 07:33:57 -0700 (PDT)
MIME-Version: 1.0
References: <20240522204020.203905-1-ines.varhol@telecom-paris.fr>
 <20240522204020.203905-3-ines.varhol@telecom-paris.fr>
In-Reply-To: <20240522204020.203905-3-ines.varhol@telecom-paris.fr>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 28 May 2024 15:33:45 +0100
Message-ID: <CAFEAcA88uoTwqa1OaQj_u+M2BgB9MHagizE3zdvLUCjczQ1_bg@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] hw/misc: In STM32L4x5 EXTI, handle direct and
 configurable interrupts
To: =?UTF-8?B?SW7DqHMgVmFyaG9s?= <ines.varhol@telecom-paris.fr>
Cc: qemu-devel@nongnu.org, Arnaud Minier <arnaud.minier@telecom-paris.fr>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x535.google.com
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
X-TUID: pyH5GNZfY5w+

On Wed, 22 May 2024 at 21:40, In=C3=A8s Varhol <ines.varhol@telecom-paris.f=
r> wrote:
>
> The previous implementation for EXTI interrupts only handled
> "configurable" interrupts, like those originating from STM32L4x5 SYSCFG
> (the only device currently connected to the EXTI up until now).
>
> In order to connect STM32L4x5 USART to the EXTI, this commit adds
> handling for direct interrupts (interrupts without configurable edge).
>
> The implementation of configurable interrupts (interrupts supporting
> edge selection) was incorrectly expecting alternating input levels :
> this commits adds a new status field `irq_levels` to actually detect
> edges.

This patch is now doing two different things:
 * correcting the handling of detecting of rising/falling edges
 * adding the direct-interrupt support

These should be two separate patches, I think.

> Signed-off-by: In=C3=A8s Varhol <ines.varhol@telecom-paris.fr>
> ---
>  include/hw/misc/stm32l4x5_exti.h |  2 ++
>  hw/misc/stm32l4x5_exti.c         | 25 ++++++++++++++++++++-----
>  2 files changed, 22 insertions(+), 5 deletions(-)
>
> diff --git a/include/hw/misc/stm32l4x5_exti.h b/include/hw/misc/stm32l4x5=
_exti.h
> index 82f75a2417..62f79362f2 100644
> --- a/include/hw/misc/stm32l4x5_exti.h
> +++ b/include/hw/misc/stm32l4x5_exti.h
> @@ -45,6 +45,8 @@ struct Stm32l4x5ExtiState {
>      uint32_t swier[EXTI_NUM_REGISTER];
>      uint32_t pr[EXTI_NUM_REGISTER];
>
> +    /* used for edge detection */
> +    uint32_t irq_levels[EXTI_NUM_REGISTER];
>      qemu_irq irq[EXTI_NUM_LINES];
>  };
>
> diff --git a/hw/misc/stm32l4x5_exti.c b/hw/misc/stm32l4x5_exti.c
> index eebefc6cd3..bdc3dc10d6 100644
> --- a/hw/misc/stm32l4x5_exti.c
> +++ b/hw/misc/stm32l4x5_exti.c
> @@ -87,6 +87,7 @@ static void stm32l4x5_exti_reset_hold(Object *obj, Rese=
tType type)
>          s->ftsr[bank] =3D 0x00000000;
>          s->swier[bank] =3D 0x00000000;
>          s->pr[bank] =3D 0x00000000;
> +        s->irq_levels[bank] =3D 0x00000000;
>      }
>  }
>
> @@ -106,17 +107,30 @@ static void stm32l4x5_exti_set_irq(void *opaque, in=
t irq, int level)
>          return;
>      }
>
> +    /* In case of a direct line interrupt */
> +    if (extract32(exti_romask[bank], irq, 1)) {
> +        qemu_set_irq(s->irq[oirq], level);
> +        return;
> +    }
> +
> +    /* In case of a configurable interrupt */
>      if (((1 << irq) & s->rtsr[bank]) && level) {
>          /* Rising Edge */
> -        s->pr[bank] |=3D 1 << irq;
> -        qemu_irq_pulse(s->irq[oirq]);
> +        if (!extract32(s->irq_levels[bank], irq, 1)) {
> +            s->pr[bank] |=3D 1 << irq;
> +            qemu_irq_pulse(s->irq[oirq]);
> +        }
> +        s->irq_levels[bank] |=3D 1 << irq;
>      } else if (((1 << irq) & s->ftsr[bank]) && !level) {
>          /* Falling Edge */
> -        s->pr[bank] |=3D 1 << irq;
> -        qemu_irq_pulse(s->irq[oirq]);
> +        if (extract32(s->irq_levels[bank], irq, 1)) {
> +            s->pr[bank] |=3D 1 << irq;
> +            qemu_irq_pulse(s->irq[oirq]);
> +        }
> +        s->irq_levels[bank] &=3D ~(1 << irq);
>      }

The irq_levels[] array should be updated based on 'level'
separately from determining whether it's a rising or falling
edge. With this code, if for instance the line is
configured for rising-edge detection then we never clear
the irq_levels[] bit when the level falls again, because
the only place we're clearing irq_levels bits is inside the
falling-edge-detected codepath.

We also don't get the case of "guest set the bit in both the
RTSR and FTSR right, which the datasheet specifically calls out
as permitted.

I think something like this will do the right thing:

    if (level =3D=3D extract32(s->irq_levels[bank], irq, 1)) {
        /* No change in IRQ line state: do nothing */
        return;
    }
    s->irq_levels[bank] =3D deposit32(s->irq_levels[bank], irq, level);

    if ((level && extract32(s->rtsr[bank], irq, 1) ||
        (!level && extract32(s->ftsr[bank], irq, 1)) {
        /*
         * Trigger on this rising or falling edge. Note that the guest
         * can configure the same interrupt line to trigger on both
         * rising and falling edges if it wishes, or to not trigger
         * at all.
         */
        s->pr[bank] |=3D 1 << irq;
        qemu_irq_pulse(s->irq[oirq]);
    }

(I would then consider the "In the following situations" comment
to be a bit redundant and deleteable, but that's a matter of taste.)

>      /*
> -     * In the following situations :
> +     * In the following situations (for configurable interrupts) :
>       * - falling edge but rising trigger selected
>       * - rising edge but falling trigger selected
>       * - no trigger selected
> @@ -262,6 +276,7 @@ static const VMStateDescription vmstate_stm32l4x5_ext=
i =3D {
>          VMSTATE_UINT32_ARRAY(ftsr, Stm32l4x5ExtiState, EXTI_NUM_REGISTER=
),
>          VMSTATE_UINT32_ARRAY(swier, Stm32l4x5ExtiState, EXTI_NUM_REGISTE=
R),
>          VMSTATE_UINT32_ARRAY(pr, Stm32l4x5ExtiState, EXTI_NUM_REGISTER),
> +        VMSTATE_UINT32_ARRAY(irq_levels, Stm32l4x5ExtiState, EXTI_NUM_RE=
GISTER),
>          VMSTATE_END_OF_LIST()
>      }

If you add a new field to vmstate you must always bump the version numbers.

thanks
-- PMM
