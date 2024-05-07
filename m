Received: by 2002:a05:7022:ef03:b0:7c:9548:a19d with SMTP id qy3csp1906935dlb;
        Tue, 7 May 2024 02:55:34 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXEG8A8wRYGzD5eQf1WQ+PEu5nuASBPw5RKCW7GJF02SmVTN5026sf40TB+e0e7GYVB4GOUfv2Sm2hel/wlLm41ASWk7wWm
X-Google-Smtp-Source: AGHT+IH2LoF1DF8EKxGdfLNslHn5pHODsecbFGxgltxktXCjEIHHrxLSUHA16P6SL3Zit6Mwiam7
X-Received: by 2002:ac8:5888:0:b0:43a:7b64:2fcc with SMTP id d75a77b69052e-43d8f2f5c76mr35965051cf.7.1715075734666;
        Tue, 07 May 2024 02:55:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1715075734; cv=none;
        d=google.com; s=arc-20160816;
        b=0uMXbdaY6qU5LBAKToYz3/ZTTwom7Iign2bKSlgeMZ2MIN8uNmg9ZKlCiBV6jXAoDG
         hIDQ+GxqT4nLIGfYrbe29SLMqZida6szGgpUX5piIZqq/XSiaR4eDrmDa3oWLw4w77Ru
         1Xd/1EJ0kBb4Fwu2yoMRHuy5iGCGo3CTdEfUoOoOwobgds6O07xt7pTKBAwmX6fetTda
         IEbbVhCMBx9fwBmXfdynISkbN4LjnJfnavbxBPJC/OdhtG8F5Ns1jOrVyx1Xa/6Ahr2m
         FtFa1XRZcXJ6ByTbzpaspaEH22MWNqQlLSpBzsJosj66PcgIW70rep7QJov5kNTYbyte
         EGSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=oZhmjIXKYgZr53hDN6H3dymNuLmy1NqHDwPG6SPwx0I=;
        fh=E1rX8SFu6hWCV1mS5o2rej7sBoQxcYLg4ecxbMHxsLo=;
        b=tRckxeYAwBp2r9MfX9lWwC0hDmaTLqvep3JYiIgK8Z+UOI0yJCRa2tYxNR7Pv4BbuL
         PLs9vIhyeSc/zLR9HOHhQYdMqoqItwXPMVnkde+wEIwlG2nUwmjuyZ3iCFmewMDsI2fW
         EWXFU9obrCGNoObNcaNjKgOcYfb33mQpsXeBNHaUmSWwecb4WR1IQ+roCEUPXqiBTP9a
         KngpXwg0uHe6Fuc+Ufq7L6qEtoo8gAcnA8nzCehBCxlcVhHDndGsztYEQnLhbOVCVph0
         Ljz2OPUAlAspKvhE2b3iaT8vLoYGLoSWUdVtEy0hy2wn5nI1i+77HyCvZUgBdMqcYkqA
         En7Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NvRZXbdV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f3-20020ac85d03000000b0043ad4e11dc7si11291014qtx.26.2024.05.07.02.55.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 07 May 2024 02:55:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NvRZXbdV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1s4HXm-000539-4U; Tue, 07 May 2024 05:55:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1s4HXR-0004wv-OQ
 for qemu-arm@nongnu.org; Tue, 07 May 2024 05:55:11 -0400
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1s4HXJ-0004py-4Z
 for qemu-arm@nongnu.org; Tue, 07 May 2024 05:55:09 -0400
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-a59c5c9c6aeso525505566b.2
 for <qemu-arm@nongnu.org>; Tue, 07 May 2024 02:55:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1715075699; x=1715680499; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oZhmjIXKYgZr53hDN6H3dymNuLmy1NqHDwPG6SPwx0I=;
 b=NvRZXbdVXwC+Kjh+aG2x4JtUzluYHpSBQ3G5sCO6su4j2zxb1tRc7bZUMz6cMTNruu
 AehWY8tpn2TjYhEHO4v663+aN+RjZZwGnlCbnhSTAGflFtEbO1SAXOR1h4upaMeMlxBF
 wG7tAC1g+0RRJOoka+gjm9FRax4IV6MR4D62PIsQYPlTB8+Qir3EujlgA9aqKMyYkhYG
 YslBGz0vpyjn/tEL4L0pW2/JlKG0qlQSPFxGfXBgqRWhIBxovhSt9O5ePk2+5NhvFqnW
 8FGlUZ+JZjF8KLe0lCTIl9m9Xf193I9j4cVsVOeMMMHEskTb6woFtiaqsskEs0nP7plL
 CUKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715075699; x=1715680499;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oZhmjIXKYgZr53hDN6H3dymNuLmy1NqHDwPG6SPwx0I=;
 b=WxxnBM7Vk0qRF9+kc10gsyp5yL8peLIdeOneUDEMJ2F8oxzn2hOSlB1arTQY6qbR5U
 ++RS+dSAoSWSDZILCNvdx93uQ/TBl8ni0biNhLnA5d9NsqkJx23bEoPZQywCB3HOPkNj
 JNq20bfIkKou32b8clPCwnauVpRkbeBCNaFlqO2AgCXhcaU3PCUz6ib+r2LuWK8a02RL
 l42CVzuOu5INSAMSvu/p+r6gXA5ffbJw2GseCxng9RrZbF0WJFCOYcN90gWsgM9VFlgS
 FiPmXE/75CJVWBqDs4tevbkdUS4huac9tIRbpAiV9XobbL4n/XHleaX2t5DTYGZN4kXc
 KYaw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVXB+cvFA+R7iGJ9mFrRTduMxDCNwnCdzXUL8pGRhl3vpKfqsPQEDscPPGBsAye0iSaTyefLQhO2BAXchP8b9FC1tHI
X-Gm-Message-State: AOJu0Yxh+z4UVDZRQKQiWy8HonDyr5XxdvUrgUyW8mntMpnVtKw/PGR9
 Px35X82tvwFciGLSysRCKvZDJf9YWLXifoT9u8coByqIly8Xz2pKIigPKSRZ9i53Xb9Iv4nOj7e
 dkOzjDOs7w347l+QcDlqaeDc9jdfP1NGqG789pQ==
X-Received: by 2002:a50:9faa:0:b0:572:326b:c055 with SMTP id
 c39-20020a509faa000000b00572326bc055mr9358675edf.13.1715075699100; Tue, 07
 May 2024 02:54:59 -0700 (PDT)
MIME-Version: 1.0
References: <20240505140556.373711-1-ines.varhol@telecom-paris.fr>
 <20240505140556.373711-4-ines.varhol@telecom-paris.fr>
 <06e98554-3430-49d5-94f3-c5d683327f55@linaro.org>
In-Reply-To: <06e98554-3430-49d5-94f3-c5d683327f55@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 7 May 2024 10:54:47 +0100
Message-ID: <CAFEAcA83cgqq3yh3=d=gHd-LK3qh2g-pE2v734apKmcNTJTvww@mail.gmail.com>
Subject: Re: [PATCH 3/4] hw/char: Add QOM property for STM32L4x5 USART clock
 frequency
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: =?UTF-8?B?SW7DqHMgVmFyaG9s?= <ines.varhol@telecom-paris.fr>, 
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, Thomas Huth <thuth@redhat.com>, 
 Arnaud Minier <arnaud.minier@telecom-paris.fr>,
 Laurent Vivier <lvivier@redhat.com>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Alistair Francis <alistair@alistair23.me>,
 Samuel Tardieu <samuel.tardieu@telecom-paris.fr>, 
 Paolo Bonzini <pbonzini@redhat.com>, Markus Armbruster <armbru@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: AbglN9hShCpi

On Mon, 6 May 2024 at 10:34, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org=
> wrote:
>
> Hi,
>
> On 5/5/24 16:05, In=C3=A8s Varhol wrote:
> > Signed-off-by: In=C3=A8s Varhol <ines.varhol@telecom-paris.fr>
> > ---
> >   hw/char/stm32l4x5_usart.c | 12 ++++++++++++
> >   1 file changed, 12 insertions(+)
> >
> > diff --git a/hw/char/stm32l4x5_usart.c b/hw/char/stm32l4x5_usart.c
> > index fc5dcac0c4..ee7727481c 100644
> > --- a/hw/char/stm32l4x5_usart.c
> > +++ b/hw/char/stm32l4x5_usart.c
> > @@ -26,6 +26,7 @@
> >   #include "hw/clock.h"
> >   #include "hw/irq.h"
> >   #include "hw/qdev-clock.h"
> > +#include "qapi/visitor.h"
> >   #include "hw/qdev-properties.h"
> >   #include "hw/qdev-properties-system.h"
> >   #include "hw/registerfields.h"
> > @@ -523,6 +524,14 @@ static Property stm32l4x5_usart_base_properties[] =
=3D {
> >       DEFINE_PROP_END_OF_LIST(),
> >   };
> >
> > +static void clock_freq_get(Object *obj, Visitor *v,
> > +    const char *name, void *opaque, Error **errp)
> > +{
> > +    Stm32l4x5UsartBaseState *s =3D STM32L4X5_USART_BASE(obj);
> > +    uint32_t clock_freq_hz =3D clock_get_hz(s->clk);
> > +    visit_type_uint32(v, name, &clock_freq_hz, errp);
> > +}
> > +
> >   static void stm32l4x5_usart_base_init(Object *obj)
> >   {
> >       Stm32l4x5UsartBaseState *s =3D STM32L4X5_USART_BASE(obj);
> > @@ -534,6 +543,9 @@ static void stm32l4x5_usart_base_init(Object *obj)
> >       sysbus_init_mmio(SYS_BUS_DEVICE(obj), &s->mmio);
> >
> >       s->clk =3D qdev_init_clock_in(DEVICE(s), "clk", NULL, s, 0);
> > +
> > +    object_property_add(obj, "clock-freq-hz", "uint32",
> > +                        clock_freq_get, NULL, NULL, NULL);
>
> Patch LGTM, but I wonder if registering QOM getter without setter
> is recommended. Perhaps we should encourage parity? In normal HW
> emulation we shouldn't update this clock externally, but thinking
> about testing, this could be interesting to introduce jitter.

object_property_add() with the set function NULL is fine,
and is documented to mean "property cannot be set". Attempts
to set it will be failed (in object_property_set()) with a
reasonable error.

But it's not clear to me why we want the property in the first
place -- we don't generally have devices which take a Clock
input have properties exposing its frequency. If we did want
that it would probably be better if we could do it generically
rather than by adding more boilerplate code to each device.
Mostly "frequency" properties on devices are for the case
where  they *don't* have a Clock input and instead have
ad-hoc legacy handling where the board/SoC that creates the
device sets an integer property to define the input frequency
because it doesn't model the clock tree with Clock objects.

thanks
-- PMM
