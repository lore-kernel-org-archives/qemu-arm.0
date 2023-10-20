Received: by 2002:a17:906:cf90:b0:9bd:85f7:2662 with SMTP id um16csp1277013ejb;
        Fri, 20 Oct 2023 07:40:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF6XLnM3HKM6F9/4FQ1OsW8gpc/6vyGgz7GF6TIZX+KZUwWvwyHaFQDEjJSrtr1XKzFV6Vp
X-Received: by 2002:a0d:c887:0:b0:5a8:5824:b952 with SMTP id k129-20020a0dc887000000b005a85824b952mr2031792ywd.44.1697812851132;
        Fri, 20 Oct 2023 07:40:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697812851; cv=none;
        d=google.com; s=arc-20160816;
        b=aWCaPXgtX7ahQJq7QSJu7NKJa/2xljSXnd0ksszoEJs3Godgew8vhr/UDurUv5pdIo
         WgVl3cVMzstCzeGmA2wxp9aLYE4RR6GREH3Vrd2TPsKNFRmK8iF18dFsPPP9VKwc8AZS
         1P8ktVWg5WVATD39kLGAldPVjAauuJQMDeC2+TWPxg2CaoI872Hc3rn1XsGLTpDRKPdX
         12NSd2B/iER9GiNJ4212Cl0AACIuLXkKD3Pd+c1eFUOBH309TFha5PNagMQIO0dgytal
         /AJ2U/DUeTLYnQSnee5frdI8H/cRuRm/M4SnQtGunqRzLIllZdl52bK7V2cQlKFNvcMg
         QhRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=vLdMsp4IR17GzRZo8LFd1OwbaTLZbt26ADSwqjO8BYs=;
        fh=DuCf6c3xj4ZSkJBtqwY54tiwlZ6fEqeQb0eTb/LRlU0=;
        b=zT61UrUIL0DWbC26ZWEqrUqQGE1/u8CH4lk9ADgiosAdaT9Ixl3wnAdhr9AeqjoBEa
         gZ3uybSJa8q0Fov8WF1RRJ5HQTYd+BfLkrQujk8s8IEkG10pD0J8MVQ77SbPzYuGZs0F
         GlWCjTBj4/XGFbqNgBseMUhlpOiafjjaTHxwL2H7WdlPav7n41PLc0M+yWRs0umRwjMH
         QcTC1tawad0sto62fiPblBcs92QZq3Yh02rNOLKYiQWgbvCdXzHf8/Q6VEtfd5/y8UOe
         8sd0UdUOLIvsxcZnLJBnjAaGHr23f6jICq/VovZS10o/VFXUUHrPVVNSVlG4DCYwmP2B
         kPpQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@rt-labs-com.20230601.gappssmtp.com header.s=20230601 header.b=JAAkxomN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=rt-labs.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d20-20020ac85d94000000b00417981f0d4csi1424665qtx.575.2023.10.20.07.40.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 20 Oct 2023 07:40:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@rt-labs-com.20230601.gappssmtp.com header.s=20230601 header.b=JAAkxomN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=rt-labs.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qtqfw-0000Ue-PA; Fri, 20 Oct 2023 10:40:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hans-erik.floryd@rt-labs.com>)
 id 1qtqfv-0000UN-Oz
 for qemu-arm@nongnu.org; Fri, 20 Oct 2023 10:40:31 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <hans-erik.floryd@rt-labs.com>)
 id 1qtqfs-0001t4-Ir
 for qemu-arm@nongnu.org; Fri, 20 Oct 2023 10:40:31 -0400
Received: by mail-pj1-x1035.google.com with SMTP id
 98e67ed59e1d1-27d1373f631so709956a91.1
 for <qemu-arm@nongnu.org>; Fri, 20 Oct 2023 07:40:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rt-labs-com.20230601.gappssmtp.com; s=20230601; t=1697812825; x=1698417625;
 darn=nongnu.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vLdMsp4IR17GzRZo8LFd1OwbaTLZbt26ADSwqjO8BYs=;
 b=JAAkxomNzikeTY4tASoXy5joiEpYEeivuQdDISpeULAd4hWZ+cHO6p4o3n1utcCc+a
 xkF5c4YAM2WVxOOdGFV1cajVsbeVbnZTG8lPT4MxxnZ3a6WjaUNMDDHM6ijN7cq8vYPx
 odwBFZQXolKbB8e11FFtZbQpRevPzU0EPzRtmD2wJTsOA+DKqRInVYQiPvXkfc5aPw+H
 fmJk0pP5MBSrdJbbdn6D0CH7+glJ6E4h76QkQYkOEZhZhHnW6ZCx9F+DDRz86o20Dcal
 E38q58xM7/cXAKuB93iODU2U1+oG9XplTAieXgOnLF/ijgYZFvtUD0IDsp4Llp7Hd0Oy
 vQpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697812825; x=1698417625;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vLdMsp4IR17GzRZo8LFd1OwbaTLZbt26ADSwqjO8BYs=;
 b=k0H4N6UKlw0aEafCGVshW7NHQGiCVYmdx1Opk4K8PAfcgONaivswBkz5ZwkBVm16zO
 nIdyeyH1ktWDtG3ZiTFH19UKbNnG6cYmxjCdZ1CNZ/pC2ie3WANbSIoh48v5Xb4ZPuIl
 Vix78lQx2upKwOAscK+x4+MvJjoITqtRLDJ5JAWfaDb2Nh+Uw1YhRg8xhgUYwGih/eIL
 rRBbpauS3EtmuOD2THEMzAfBHBX7992eX5c7BxyEvwDNGPq7jcmmsJI27/vZdx6D5EYT
 v+Fi81sr4Nci8xqwgnParXo75V00bk8sroIS0YrkNbwMwehuprFc0Z+gLVNZGLL+/f2P
 /L7w==
X-Gm-Message-State: AOJu0Yyn5xALYqbfqlpOw4fuS1jgTyhr7NmckZjmB2p+3dgFD2GN87PH
 wnuTARLF9J0mQgSQG6l9IJh4lWU9XX0Ki+YIjogmqQ==
X-Received: by 2002:a17:90b:3ec8:b0:27d:853:9109 with SMTP id
 rm8-20020a17090b3ec800b0027d08539109mr2068700pjb.20.1697812825274; Fri, 20
 Oct 2023 07:40:25 -0700 (PDT)
MIME-Version: 1.0
References: <20231020111428.3260965-1-hans-erik.floryd@rt-labs.com>
 <74d96828-dae9-64fe-5947-ba83ce54206d@linaro.org>
In-Reply-To: <74d96828-dae9-64fe-5947-ba83ce54206d@linaro.org>
From: Hans-Erik Floryd <hans-erik.floryd@rt-labs.com>
Date: Fri, 20 Oct 2023 16:40:14 +0200
Message-ID: <CADS1RdQLmbdobcAsO+DM79N2TgaErCwrctATXNf6a7VYT6hBqA@mail.gmail.com>
Subject: Re: [PATCH 1/1] stm32f2xx_usart: implement TX interrupts
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: Alistair Francis <alistair@alistair23.me>,
 Peter Maydell <peter.maydell@linaro.org>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>,
 "open list:STM32F205" <qemu-arm@nongnu.org>, 
 "open list:All patches CC here" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=hans-erik.floryd@rt-labs.com; helo=mail-pj1-x1035.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
X-TUID: Jn9i8p1xjFER

Hi Phil,

On Fri, 20 Oct 2023 at 14:42, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.or=
g> wrote:
>
> Hi Hans-Erik,
>
> On 20/10/23 13:14, Hans-Erik Floryd wrote:
> > Generate interrupt if either of the TXE, TC or RXNE bits are active
> > and the corresponding interrupt enable bit is set.
> >
> > Signed-off-by: Hans-Erik Floryd <hans-erik.floryd@rt-labs.com>
> > ---
> >   hw/char/stm32f2xx_usart.c         | 29 +++++++++++++++++------------
> >   include/hw/char/stm32f2xx_usart.h | 10 ++++++----
> >   2 files changed, 23 insertions(+), 16 deletions(-)
> >
> > diff --git a/hw/char/stm32f2xx_usart.c b/hw/char/stm32f2xx_usart.c
> > index fde67f4f03..2947c3a260 100644
> > --- a/hw/char/stm32f2xx_usart.c
> > +++ b/hw/char/stm32f2xx_usart.c
> > @@ -53,6 +53,16 @@ static int stm32f2xx_usart_can_receive(void *opaque)
> >       return 0;
> >   }
> >
> > +static void stm32f2xx_update(STM32F2XXUsartState *s)
> > +{
> > +    uint32_t mask =3D s->usart_sr & s->usart_cr1;
> > +    if (mask & (USART_SR_TXE | USART_SR_TC | USART_SR_RXNE)) {
> > +        qemu_set_irq(s->irq, 1);
> > +    } else {
> > +        qemu_set_irq(s->irq, 0);
> > +    }
> > +}
> > +
> >   static void stm32f2xx_usart_receive(void *opaque, const uint8_t *buf,=
 int size)
> >   {
> >       STM32F2XXUsartState *s =3D opaque;
> > @@ -66,9 +76,7 @@ static void stm32f2xx_usart_receive(void *opaque, con=
st uint8_t *buf, int size)
> >       s->usart_dr =3D *buf;
> >       s->usart_sr |=3D USART_SR_RXNE;
> >
> > -    if (s->usart_cr1 & USART_CR1_RXNEIE) {
> > -        qemu_set_irq(s->irq, 1);
> > -    }
> > +    stm32f2xx_update(s);
> >
> >       DB_PRINT("Receiving: %c\n", s->usart_dr);
> >   }
> > @@ -85,7 +93,7 @@ static void stm32f2xx_usart_reset(DeviceState *dev)
> >       s->usart_cr3 =3D 0x00000000;
> >       s->usart_gtpr =3D 0x00000000;
> >
> > -    qemu_set_irq(s->irq, 0);
> > +    stm32f2xx_update(s);
> >   }
> >
> >   static uint64_t stm32f2xx_usart_read(void *opaque, hwaddr addr,
> > @@ -100,13 +108,14 @@ static uint64_t stm32f2xx_usart_read(void *opaque=
, hwaddr addr,
> >       case USART_SR:
> >           retvalue =3D s->usart_sr;
> >           qemu_chr_fe_accept_input(&s->chr);
> > +        stm32f2xx_update(s);
> >           return retvalue;
> >       case USART_DR:
> >           DB_PRINT("Value: 0x%" PRIx32 ", %c\n", s->usart_dr, (char) s-=
>usart_dr);
> >           retvalue =3D s->usart_dr & 0x3FF;
> >           s->usart_sr &=3D ~USART_SR_RXNE;
> >           qemu_chr_fe_accept_input(&s->chr);
> > -        qemu_set_irq(s->irq, 0);
> > +        stm32f2xx_update(s);
> >           return retvalue;
> >       case USART_BRR:
> >           return s->usart_brr;
> > @@ -145,9 +154,7 @@ static void stm32f2xx_usart_write(void *opaque, hwa=
ddr addr,
> >           } else {
> >               s->usart_sr &=3D value;
> >           }
> > -        if (!(s->usart_sr & USART_SR_RXNE)) {
> > -            qemu_set_irq(s->irq, 0);
> > -        }
> > +        stm32f2xx_update(s);
> >           return;
> >       case USART_DR:
> >           if (value < 0xF000) {
> > @@ -161,6 +168,7 @@ static void stm32f2xx_usart_write(void *opaque, hwa=
ddr addr,
> >                  clear TC by writing 0 to the SR register, so set it ag=
ain
> >                  on each write. */
> >               s->usart_sr |=3D USART_SR_TC;
> > +            stm32f2xx_update(s);
> >           }
> >           return;
> >       case USART_BRR:
> > @@ -168,10 +176,7 @@ static void stm32f2xx_usart_write(void *opaque, hw=
addr addr,
> >           return;
> >       case USART_CR1:
> >           s->usart_cr1 =3D value;
> > -            if (s->usart_cr1 & USART_CR1_RXNEIE &&
> > -                s->usart_sr & USART_SR_RXNE) {
> > -                qemu_set_irq(s->irq, 1);
> > -            }
> > +        stm32f2xx_update(s);
> >           return;
> >       case USART_CR2:
> >           s->usart_cr2 =3D value;
> > diff --git a/include/hw/char/stm32f2xx_usart.h b/include/hw/char/stm32f=
2xx_usart.h
> > index 65bcc85470..fdfa7424a7 100644
> > --- a/include/hw/char/stm32f2xx_usart.h
> > +++ b/include/hw/char/stm32f2xx_usart.h
> > @@ -48,10 +48,12 @@
> >   #define USART_SR_TC   (1 << 6)
> >   #define USART_SR_RXNE (1 << 5)
> >
> > -#define USART_CR1_UE  (1 << 13)
> > -#define USART_CR1_RXNEIE  (1 << 5)
> > -#define USART_CR1_TE  (1 << 3)
> > -#define USART_CR1_RE  (1 << 2)
> > +#define USART_CR1_UE     (1 << 13)
> > +#define USART_CR1_TXEIE  (1 << 7)
> > +#define USART_CR1_TCEIE  (1 << 6)
> > +#define USART_CR1_RXNEIE (1 << 5)
> > +#define USART_CR1_TE     (1 << 3)
> > +#define USART_CR1_RE     (1 << 2)
> >
> >   #define TYPE_STM32F2XX_USART "stm32f2xx-usart"
> >   OBJECT_DECLARE_SIMPLE_TYPE(STM32F2XXUsartState, STM32F2XX_USART)
>
> To keep your changes trivial to review, I split your patch in 4:

Ok - do you also want me to split the patch in the next version?

>
> 1/ Extract stm32f2xx_update_irq()
>
> -- >8 --
> diff --git a/hw/char/stm32f2xx_usart.c b/hw/char/stm32f2xx_usart.c
> index fde67f4f03..519d3461a3 100644
> --- a/hw/char/stm32f2xx_usart.c
> +++ b/hw/char/stm32f2xx_usart.c
> @@ -53,6 +53,17 @@ static int stm32f2xx_usart_can_receive(void *opaque)
>       return 0;
>   }
>
> +static void stm32f2xx_update_irq(STM32F2XXUsartState *s)
> +{
> +    uint32_t mask =3D s->usart_sr & s->usart_cr1;
> +
> +    if (mask & (USART_SR_TXE | USART_SR_TC | USART_SR_RXNE)) {
> +        qemu_set_irq(s->irq, 1);
> +    } else {
> +        qemu_set_irq(s->irq, 0);
> +    }
> +}
> +
>   static void stm32f2xx_usart_receive(void *opaque, const uint8_t *buf,
> int size)
>   {
>       STM32F2XXUsartState *s =3D opaque;
> @@ -66,9 +77,7 @@ static void stm32f2xx_usart_receive(void *opaque,
> const uint8_t *buf, int size)
>       s->usart_dr =3D *buf;
>       s->usart_sr |=3D USART_SR_RXNE;
>
> -    if (s->usart_cr1 & USART_CR1_RXNEIE) {
> -        qemu_set_irq(s->irq, 1);
> -    }
> +    stm32f2xx_update_irq(s);
>
>       DB_PRINT("Receiving: %c\n", s->usart_dr);
>   }
> @@ -85,7 +94,7 @@ static void stm32f2xx_usart_reset(DeviceState *dev)
>       s->usart_cr3 =3D 0x00000000;
>       s->usart_gtpr =3D 0x00000000;
>
> -    qemu_set_irq(s->irq, 0);
> +    stm32f2xx_update_irq(s);
>   }
>
>   static uint64_t stm32f2xx_usart_read(void *opaque, hwaddr addr,
> @@ -106,7 +115,7 @@ static uint64_t stm32f2xx_usart_read(void *opaque,
> hwaddr addr,
>           retvalue =3D s->usart_dr & 0x3FF;
>           s->usart_sr &=3D ~USART_SR_RXNE;
>           qemu_chr_fe_accept_input(&s->chr);
> -        qemu_set_irq(s->irq, 0);
> +        stm32f2xx_update_irq(s);
>           return retvalue;
>       case USART_BRR:
>           return s->usart_brr;
> @@ -145,9 +154,7 @@ static void stm32f2xx_usart_write(void *opaque,
> hwaddr addr,
>           } else {
>               s->usart_sr &=3D value;
>           }
> -        if (!(s->usart_sr & USART_SR_RXNE)) {
> -            qemu_set_irq(s->irq, 0);
> -        }
> +        stm32f2xx_update_irq(s);
>           return;
>       case USART_DR:
>           if (value < 0xF000) {
> @@ -168,10 +175,7 @@ static void stm32f2xx_usart_write(void *opaque,
> hwaddr addr,
>           return;
>       case USART_CR1:
>           s->usart_cr1 =3D value;
> -            if (s->usart_cr1 & USART_CR1_RXNEIE &&
> -                s->usart_sr & USART_SR_RXNE) {
> -                qemu_set_irq(s->irq, 1);
> -            }
> +        stm32f2xx_update_irq(s);
>           return;
>       case USART_CR2:
>           s->usart_cr2 =3D value;
> ---
>
> 2/ Update IRQ when SR is read
>
> -- >8 --
> diff --git a/hw/char/stm32f2xx_usart.c b/hw/char/stm32f2xx_usart.c
> index 519d3461a3..46e29089bc 100644
> --- a/hw/char/stm32f2xx_usart.c
> +++ b/hw/char/stm32f2xx_usart.c
> @@ -109,6 +109,7 @@ static uint64_t stm32f2xx_usart_read(void *opaque,
> hwaddr addr,
>       case USART_SR:
>           retvalue =3D s->usart_sr;
>           qemu_chr_fe_accept_input(&s->chr);
> +        stm32f2xx_update_irq(s);
>           return retvalue;
>       case USART_DR:
>           DB_PRINT("Value: 0x%" PRIx32 ", %c\n", s->usart_dr, (char)
> s->usart_dr);
> ---
>
> Why is this required?

It's not required yet although it may be if support for more bits are
added (IDLE for instance). Although rereading the manual I'm not sure
that's how it would be implemented so I'll remove it.

>
> 3/ Update IRQ when DR is written
>
> -- >8 --
> diff --git a/hw/char/stm32f2xx_usart.c b/hw/char/stm32f2xx_usart.c
> index 46e29089bc..74f007591a 100644
> --- a/hw/char/stm32f2xx_usart.c
> +++ b/hw/char/stm32f2xx_usart.c
> @@ -169,6 +169,7 @@ static void stm32f2xx_usart_write(void *opaque,
> hwaddr addr,
>                  clear TC by writing 0 to the SR register, so set it agai=
n
>                  on each write. */
>               s->usart_sr |=3D USART_SR_TC;
> +            stm32f2xx_update_irq(s);
>           }
>           return;
>       case USART_BRR:
> ---
>
> This change makes sense
>
> 4/ Add more CR1 bit definitions
>
> -- >8 --
> diff --git a/include/hw/char/stm32f2xx_usart.h
> b/include/hw/char/stm32f2xx_usart.h
> index 65bcc85470..fdfa7424a7 100644
> --- a/include/hw/char/stm32f2xx_usart.h
> +++ b/include/hw/char/stm32f2xx_usart.h
> @@ -49,6 +49,8 @@
>   #define USART_SR_RXNE (1 << 5)
>
>   #define USART_CR1_UE     (1 << 13)
> +#define USART_CR1_TXEIE  (1 << 7)
> +#define USART_CR1_TCEIE  (1 << 6)
>   #define USART_CR1_RXNEIE (1 << 5)
>   #define USART_CR1_TE     (1 << 3)
>   #define USART_CR1_RE     (1 << 2)
> ---
>
> These are not used, why add them?

For completeness since RXNEIE was already defined. Also for
documentation, to show that SR_TX/CR_TXEIE etc share bit numbers,
which the implementation relies on.

I can remove it though. Should I also remove RXNEIE which is no longer need=
ed?

>
> Regards,
>
> Phil.
>
>

Thanks for reviewing,
 Hans-Erik
