Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp404404ejb;
        Thu, 8 Jun 2023 08:09:55 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4MQc7M6cCtrNytLEAU43ba0w4f5o9cac8bsFWeIjGoX+MUuMtDBkYg1HUBELrNBzLYC6OJ
X-Received: by 2002:a05:622a:19a9:b0:3d9:4586:3ab2 with SMTP id u41-20020a05622a19a900b003d945863ab2mr8032523qtc.28.1686236995502;
        Thu, 08 Jun 2023 08:09:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1686236995; cv=none;
        d=google.com; s=arc-20160816;
        b=NbFV6ia3TNMO0OVuRIK1ee8R7sGxmSgNca1XPCCFwgomtzov3izHp9GgJYHuEqF5eT
         AIz4Jm3200ol1uwSfaKVQP+ZQKjTG2QMd3tfCEhFD49NIFdF6q9YnszZyjTFRfH53goE
         2iNglm1bqX6vTNyT1trabteLba3vUUbrYECBSn5oDsM97xSaHo76sjLghhC5Uckvdo8l
         gPY6ezQ/ThDKlu/LqzSdgx6xbsGDCQLjz+wCVgYP0PN8+1dJ2MZoEjP1TtnnViQ9plVN
         82r+whJm6yMoFDmZLDTDYePqAdhgc60l39LXgTaPCjS4HuOfDXlv6YNl1k9IYtAoGxj+
         vqAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=9Ree3ttQRecQGudWFMRQ4DPWFI1qcXD6d0QNOmLXDU4=;
        b=TG4MC7pdu3prnN6AK/JICLh1EXENvHCXfd4+Es6swB89hSWvJb+g24jTVLbTjGPECj
         CsxSZx/1iBRrwTGgQfFunJlQXflgHfcOjScnyZ6TexgPoU0Yx6uprpRYhWhZDU8eweat
         pQoLLRpeMwptnx0BJjTN/s96eHZoxIlL92CybrIUMM2Dm3TrKUqUB6KB+BGOCCRedqZe
         fqQyDjshqDIxzIJhC1bxliKrEWvYDa4hUIB+NhAMSb25595Fj6+kcBZJl0VA6niu3rkN
         iNQFkd0zdA4KX4xc6qUMtOkpxxkBrK6UZPm6JnnKJkytCryu8GKEznk/iJx7qqNrd/hZ
         ASQQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nVeKt3S+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n7-20020ac85b47000000b003f9b64f0243si726518qtw.156.2023.06.08.08.09.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 08 Jun 2023 08:09:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nVeKt3S+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q7HGO-0005Lk-Gy; Thu, 08 Jun 2023 11:09:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1q7HGL-0005Kq-UK
 for qemu-arm@nongnu.org; Thu, 08 Jun 2023 11:09:22 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1q7HGK-0006fk-7q
 for qemu-arm@nongnu.org; Thu, 08 Jun 2023 11:09:21 -0400
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-30af20f5f67so732187f8f.1
 for <qemu-arm@nongnu.org>; Thu, 08 Jun 2023 08:09:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686236957; x=1688828957;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9Ree3ttQRecQGudWFMRQ4DPWFI1qcXD6d0QNOmLXDU4=;
 b=nVeKt3S+nnpnCDHxovCcoNL1p3ERMUSyRY3Bh29JcjoLxg1O7fhOGOCPIRNxGKvT+c
 Eb0JSD9Fn6eLpmfT3Rn0UJIU5g9vc8gbODXDKVqL2Mz3nlnETpTMZfRO+B6xfrraSwHG
 kUCSnnJLKWWMYP1ti4SFLV6xWQ2l5w12D2areVr3uSba7Qnoao8dssjAanE4w7wqSjdr
 CFRJ+dKRUS6xZG4tK7abdqZaR4QazqIdOMMTHXZJVfEeB6YOzp8ozj5rNECc9pEI3EnK
 ZF1db7y1VL0srXmm3IfdjxPszwrlMsjeRPKi3bWvsxJXuTIfoEud2xWgaoZlG5/QaseT
 b2wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686236957; x=1688828957;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9Ree3ttQRecQGudWFMRQ4DPWFI1qcXD6d0QNOmLXDU4=;
 b=dXZKjpgN3cJV81AZIoE2XV6cbrm78A+aT/JMmEqYXlngijUpy8Du1fbNj7hsZM4lx5
 PjSkh9G8izxgGxa03biFqFHj29tH64cPExjBYDWVj+6b0Ole7xtlD+4svIx9+n8iTELX
 rYZHtccYR1aINB6VJszoOqYivCUTz0d+qGgkkBpdz74e3HVEA0oJEuO9NbkMaCfuCnH3
 qLVXZxIUuJX6K8wqcz35i3Y2n0w3P+RT1h5AJOHVF8Cr5HND6kkatFkwdi5C/1U8whzf
 z8pyZnDX71Op59ujABb2bTGPRbZUweAuN7YEAAt0Ix3NiobTEHWS6AN/d4SraPUGaii+
 jJEw==
X-Gm-Message-State: AC+VfDxBjA6I1QqwobYQh/ZNCHIyNYvC4ng9h4xsxl3OOFCHCEuS/t6V
 Tt7mF9N0UfqZ5zaiuv8dAJShqCLmIxtvYahMt2rTIg==
X-Received: by 2002:adf:f442:0:b0:2f6:ca0d:ec1c with SMTP id
 f2-20020adff442000000b002f6ca0dec1cmr7060689wrp.10.1686236957303; Thu, 08 Jun
 2023 08:09:17 -0700 (PDT)
MIME-Version: 1.0
References: <20230531203559.29140-1-philmd@linaro.org>
 <20230531203559.29140-14-philmd@linaro.org>
In-Reply-To: <20230531203559.29140-14-philmd@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 8 Jun 2023 16:09:06 +0100
Message-ID: <CAFEAcA8GTuV0AtHnFHbvii9bgDqYjhAJjsjq0CX3WRHrkkaFvw@mail.gmail.com>
Subject: Re: [PATCH 13/15] hw/timer/arm_timer: Fix misuse of SysBus IRQ in
 IcpPitState
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org,
 Sergey Kambalin <serg.oker@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42f.google.com
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
X-TUID: cPuMOsKYeBIg

On Wed, 31 May 2023 at 21:37, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.or=
g> wrote:
>
> SysBus IRQ are *output* IRQs. As some sort of simplification
> to avoid to forward it, IcpPitState misuses it as ARM timer
> input IRQ. Fix that by using a simple IRQ forwarder handler.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> ---
>  hw/timer/arm_timer.c | 15 ++++++++++++++-
>  1 file changed, 14 insertions(+), 1 deletion(-)
>
> diff --git a/hw/timer/arm_timer.c b/hw/timer/arm_timer.c
> index 6f444e1789..874f9b63bc 100644
> --- a/hw/timer/arm_timer.c
> +++ b/hw/timer/arm_timer.c
> @@ -352,6 +352,7 @@ struct IntegratorPitState {
>      MemoryRegion iomem;
>      ArmTimerState *timer[3];
>      qemu_irq irq_in[3];
> +    qemu_irq irq[3];
>  };
>
>  static uint64_t icp_pit_read(void *opaque, hwaddr offset,
> @@ -391,6 +392,13 @@ static const MemoryRegionOps icp_pit_ops =3D {
>      .endianness =3D DEVICE_NATIVE_ENDIAN,
>  };
>
> +static void icp_pit_fwd_irq(void *opaque, int n, int level)
> +{
> +    IntegratorPitState *s =3D opaque;
> +
> +    qemu_set_irq(s->irq[n], level);
> +}
> +
>  static void icp_pit_init(Object *obj)
>  {
>      static const uint32_t tmr_freq[] =3D {
> @@ -402,9 +410,14 @@ static void icp_pit_init(Object *obj)
>      IntegratorPitState *s =3D INTEGRATOR_PIT(obj);
>      SysBusDevice *dev =3D SYS_BUS_DEVICE(obj);
>
> +    qdev_init_gpio_in_named(DEVICE(obj), icp_pit_fwd_irq,
> +                            "timer-in", ARRAY_SIZE(s->timer));
> +
>      for (unsigned i =3D 0; i < ARRAY_SIZE(s->timer); i++) {
>          s->timer[i] =3D arm_timer_new(tmr_freq[i], s->irq_in[i]);
> -        sysbus_init_irq(dev, &s->irq_in[i]);
> +        sysbus_init_irq(dev, &s->irq[i]);
> +        sysbus_connect_irq(dev, i,
> +                           qdev_get_gpio_in_named(DEVICE(obj), "timer-in=
", i));
>      }

This feels a bit clunky but I think it's what we have to do,
since the various _pass_ APIs for forwarding GPIOs and
IRQs from a container to an inner device only work with
an entire set of IRQs.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
