Received: by 2002:a17:906:bc5a:b0:a46:bbde:2c08 with SMTP id s26csp1365563ejv;
        Fri, 22 Mar 2024 11:26:18 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWXZV0Q1QcVJfD2xg1vH8+owu5HMkV45ZvDV3S7cXElpFDa8I8IQ4p3oKRr9LqbvoE8RT0bOFNCo9cT1l45zHLFXwiIX6eL
X-Google-Smtp-Source: AGHT+IHLi57hETY/ZaaxF0Y59a/TOgJTo/uNwWLk4Mv+NZlU2KCgPdlI8esywJL2pBmnL5uZzDrL
X-Received: by 2002:a67:f28c:0:b0:474:cf85:3c61 with SMTP id m12-20020a67f28c000000b00474cf853c61mr403902vsk.11.1711131978367;
        Fri, 22 Mar 2024 11:26:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1711131978; cv=none;
        d=google.com; s=arc-20160816;
        b=SqQH9qYfteK89wpSLH9VNO1/JeodF5ERsXXNtlN5nnlgXtdwG+B25kiMgNmVonQ4Xe
         wLr9LABW3snI3cZnkfJvdhDJFcceAtdcmf/1cS45UycBHEfTH7j9ySzW7boKq3J60ixy
         n+3U5J4zrP5/MhHYwbe1zTlWhHFjhPj4YatXcm++AY3eBIAcpslzI0WmbvjRnMRlF9Ww
         J+e3VFyH/EEyEYLwyRzHEVFv9GuFQpnxKzOGu19r+68qGXj/gh9QBwTQlEU5LnY6vHgb
         3f3xMIh0N8XD2N9Hn7fOUMbqT1x70TwBzZHo9vt6R5o2qnSKYKJg+8jFdi+JPfFZPT+g
         iqMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=M4QuTnMNy2QhRGnYd/1O8inzqWgELKkSsv5Kf67p/eI=;
        fh=QWcrC/p48hw2/LYmRjTbi/LfsRSQuYjcvWMIFyojCUg=;
        b=U3dPKTsKfvdcoQdeVdjR2veT13y7StDXhEStFnisYtaCZMGp03TcSoxGKk9q7RcsuJ
         9PAIuaE8k9c8LrT3aGXuI3V8rjkjx9oeLfHSSY34i2x7Tw0AB853dHu0F6RpTFWzy9cW
         lqE5macLVAAXzY6APG7mCgBTURRFTutzslip09s4aXfc1BXSstnsnw9iNcSYESq/1fy4
         edIxqdJHm7f013/YFbZKuAAH/TWcMtRSDMlHOeKwo1YSZaRl8aMiU3oD38N0Nhrc/Q/Y
         rFpEKnwJO6SZ5jzxFunlwKBeYA4mTe86s4trVmtUYNV7SfWluDtqN9OpISBeBts7sRTz
         TreQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cwOHTq0g;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a2-20020a056214062200b00691837e5b9bsi2551629qvx.128.2024.03.22.11.26.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 22 Mar 2024 11:26:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cwOHTq0g;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rnjad-0000nA-V7; Fri, 22 Mar 2024 14:26:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rnjaZ-0000ix-Fl
 for qemu-arm@nongnu.org; Fri, 22 Mar 2024 14:25:59 -0400
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rnjaX-0002FR-Fx
 for qemu-arm@nongnu.org; Fri, 22 Mar 2024 14:25:59 -0400
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-56a2bb1d84eso4378534a12.1
 for <qemu-arm@nongnu.org>; Fri, 22 Mar 2024 11:25:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1711131956; x=1711736756; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=M4QuTnMNy2QhRGnYd/1O8inzqWgELKkSsv5Kf67p/eI=;
 b=cwOHTq0gG9YSxXfB9oAvFXh90k5c4VLNGXHuqj+kEv9aPD34BNEA29rtfdLXv4wnaX
 vL3rE5DxRnl2f3UXTCmEAAOYW+GQGvtx0SRZGMwjRyyyo5tdgPcr4n5MBqS5wV/iVWv2
 u9fXeG5w4rP9CW8JC8WGIjNAyLmTztdZQyGna0wAedcseJYlQyd+1Ya4jSlA5hegcpUl
 NiEGrsofKTuYEQY6xa8AqacXWkvssPifQ7CUL8v+AIVW3BrS4xZhf5qWomT8NeVrVP+U
 7Ole8C+l4fF36YkvHQGp8T8/JdaAMu9Dpa/r02MdwjDXBwNoGSKWIrpnT0pYZSFb/lIi
 SI9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711131956; x=1711736756;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=M4QuTnMNy2QhRGnYd/1O8inzqWgELKkSsv5Kf67p/eI=;
 b=l4QJv5NHXy3b9y5S90d99eRlsHDZDSmW2URg2E9f41h/QZsr8OVWV1iqkFmpfb6gmO
 NRu9KnYVl6ropnZL1P4Wgh8uS3DGe7YgfM3l/PlckiWMjFRO1ObFUtx2WMKzXsTBFSPb
 dYLYX0Jo9/5bWxs0NM8gRH67ceOGmiKvzpGofo/vg5i+Z+U5QLdgkOZvp87M9wqEl0Hy
 R/ZPRNn1Kqdcvjwtwxzrip3Rqqw6dzwquNJbjKJgjqjxNgugsUyqGJIPQL1T9Nhu704/
 b6lF37ViPjFb7S5wVm+VNUeNtz3xsjFvp6DNXVG8Nqfpdbqsfw27b3XnwRxgf+HihZzA
 jzsg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXeT9uvgavtMcT9flFwNmjeMeDwrN4Eksn5Wk67L+X9WD1ptU90vI7hHFkbjZ2Ov22O1BJ8h55gQn1MT203AhpAfHKJ
X-Gm-Message-State: AOJu0YzDwLxIrwwl3HeDiOP0z4kfywgI+Q4qZok0LR21HHJKz5amapQU
 J+bYna6H/xDv3JLL5J8TStKmrqzhEpcy9TYPKPPHead6gHwVgGsXAgZDx3xPW8tKpu7S3kM8rpt
 XZqxcVRmi2KUoBL67fjGqs8qXsK7/jgnIxYI9Rw==
X-Received: by 2002:a50:c343:0:b0:568:d6a2:716 with SMTP id
 q3-20020a50c343000000b00568d6a20716mr2592917edb.7.1711131955719; Fri, 22 Mar
 2024 11:25:55 -0700 (PDT)
MIME-Version: 1.0
References: <20240317103918.44375-1-arnaud.minier@telecom-paris.fr>
 <20240317103918.44375-6-arnaud.minier@telecom-paris.fr>
In-Reply-To: <20240317103918.44375-6-arnaud.minier@telecom-paris.fr>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 22 Mar 2024 18:25:45 +0000
Message-ID: <CAFEAcA_J9HPQ=C9wF_jG5=Z2cxD9P3Ph3urvY=Wv2LsRhmcMWg@mail.gmail.com>
Subject: Re: [PATCH 5/7] hw/char/stm32l4x5_usart: Add options for serial
 parameters setting
To: Arnaud Minier <arnaud.minier@telecom-paris.fr>
Cc: qemu-devel@nongnu.org, Samuel Tardieu <samuel.tardieu@telecom-paris.fr>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Alistair Francis <alistair@alistair23.me>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?B?SW7DqHMgVmFyaG9s?= <ines.varhol@telecom-paris.fr>, 
 qemu-arm@nongnu.org, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: UMyZgMEG67N1

On Sun, 17 Mar 2024 at 10:41, Arnaud Minier
<arnaud.minier@telecom-paris.fr> wrote:
>
> Add a function to change the settings of the
> serial connection.
>
> Signed-off-by: Arnaud Minier <arnaud.minier@telecom-paris.fr>
> Signed-off-by: In=C3=A8s Varhol <ines.varhol@telecom-paris.fr>
> ---
>  hw/char/stm32l4x5_usart.c | 97 +++++++++++++++++++++++++++++++++++++++
>  1 file changed, 97 insertions(+)
>
> diff --git a/hw/char/stm32l4x5_usart.c b/hw/char/stm32l4x5_usart.c
> index 958d05a56d..95e792d09d 100644
> --- a/hw/char/stm32l4x5_usart.c
> +++ b/hw/char/stm32l4x5_usart.c
> @@ -165,6 +165,91 @@ static int stm32l4x5_usart_base_can_receive(void *op=
aque)
>      return 0;
>  }
>
> +static void stm32l4x5_update_params(Stm32l4x5UsartBaseState *s)
> +{
> +    int speed, parity, data_bits, stop_bits;
> +    uint32_t value, usart_div;
> +    QEMUSerialSetParams ssp;
> +
> +    /* Select the parity type */
> +    if (s->cr1 & R_CR1_PCE_MASK) {
> +        if (s->cr1 & R_CR1_PS_MASK) {
> +            parity =3D 'O';
> +        } else {
> +            parity =3D 'E';
> +        }
> +    } else {
> +        parity =3D 'N';
> +    }
> +
> +    /* Select the number of stop bits */
> +    value =3D FIELD_EX32(s->cr2, CR2, STOP);
> +    if (value =3D=3D 0b00) {
> +        stop_bits =3D 1;
> +    } else if (value =3D=3D 0b10) {
> +        stop_bits =3D 2;
> +    } else {

I think this would read a little more clearly as

     switch (FIELD_EX32(s->cr2, CR2, STOP)) {
     case 0:
          stop_bits =3D 1;
          break;
     case 2:
          stop_bits =3D 2;
          break;
     default:
          [error case code]
     }

rather than using an if-else ladder. Similarly below.

> +        /* TODO: raise an error here */
> +        stop_bits =3D 1;
> +        error_report(
> +            "UNIMPLEMENTED: fractionnal stop bits; CR2[13:12] =3D %x",
> +            value);

We generally use qemu_log_mask(LOG_UNIMP, ...) for
"this was a valid thing for the guest to do but our implementation
doesn't handle it", and qemu_log_mask(LOG_GUEST_ERROR, ...) for
"this was an invalid thing for the guest to do" (eg programming register
fields to reserved/undefined values), rather than using error_report().

> +        return;
> +    }
> +
> +    /* Select the length of the word */
> +    value =3D (FIELD_EX32(s->cr1, CR1, M1) << 1) | FIELD_EX32(s->cr1, CR=
1, M0);
> +    if (value =3D=3D 0b00) {
> +        data_bits =3D 8;
> +    } else if (value =3D=3D 0b01) {
> +        data_bits =3D 9;
> +    } else if (value =3D=3D 0b01) {
> +        data_bits =3D 7;

These two arms both check against the same value, so one of them
must be wrong...

> +    } else {
> +        /* TODO: Raise an error here */
> +        data_bits =3D 8;
> +        error_report("UNDEFINED: invalid word length, CR1.M =3D 0b11");
> +        return;
> +    }
> +
> +    /* Select the baud rate */
> +    value =3D FIELD_EX32(s->brr, BRR, BRR);
> +    if (value < 16) {
> +        /* TODO: Raise an error here */
> +        error_report("UNDEFINED: BRR lesser than 16: %u", value);
> +        return;
> +    }
> +
> +    if (FIELD_EX32(s->cr1, CR1, OVER8) =3D=3D 0) {
> +        /*
> +         * Oversampling by 16
> +         * BRR =3D USARTDIV
> +         */
> +        usart_div =3D value;
> +    } else {
> +        /*
> +         * Oversampling by 8
> +         * - BRR[2:0] =3D USARTDIV[3:0] shifted 1 bit to the right.
> +         * - BRR[3] must be kept cleared.
> +         * - BRR[15:4] =3D USARTDIV[15:4]
> +         * - The frequency is multiplied by 2
> +         */
> +        usart_div =3D ((value & 0xFFF0) | ((value & 0x0007) << 1)) / 2;
> +    }
> +
> +    speed =3D clock_get_hz(s->clk) / usart_div;
> +
> +    ssp.speed     =3D speed;
> +    ssp.parity    =3D parity;
> +    ssp.data_bits =3D data_bits;
> +    ssp.stop_bits =3D stop_bits;
> +
> +    qemu_chr_fe_ioctl(&s->chr, CHR_IOCTL_SERIAL_SET_PARAMS, &ssp);
> +
> +    trace_stm32l4x5_usart_update_params(
> +        speed, parity, data_bits, stop_bits, 0);

This is slightly weird indentation.

> +}
> +
>  static void stm32l4x5_update_irq(Stm32l4x5UsartBaseState *s)
>  {
>      if (((s->isr & R_ISR_WUF_MASK) && (s->cr3 & R_CR3_WUFIE_MASK))      =
  ||
> @@ -318,16 +403,19 @@ static void stm32l4x5_usart_base_write(void *opaque=
, hwaddr addr,
>      switch (addr) {
>      case A_CR1:
>          s->cr1 =3D value;
> +        stm32l4x5_update_params(s);
>          stm32l4x5_update_irq(s);
>          return;
>      case A_CR2:
>          s->cr2 =3D value;
> +        stm32l4x5_update_params(s);
>          return;
>      case A_CR3:
>          s->cr3 =3D value;
>          return;
>      case A_BRR:
>          s->brr =3D value;
> +        stm32l4x5_update_params(s);
>          return;
>      case A_GTPR:
>          s->gtpr =3D value;
> @@ -409,10 +497,19 @@ static void stm32l4x5_usart_base_init(Object *obj)
>      s->clk =3D qdev_init_clock_in(DEVICE(s), "clk", NULL, s, 0);
>  }
>
> +static int stm32l4x5_usart_base_post_load(void *opaque, int version_id)
> +{
> +    Stm32l4x5UsartBaseState *s =3D (Stm32l4x5UsartBaseState *)opaque;
> +
> +    stm32l4x5_update_params(s);
> +    return 0;
> +}
> +
>  static const VMStateDescription vmstate_stm32l4x5_usart_base =3D {
>      .name =3D TYPE_STM32L4X5_USART_BASE,
>      .version_id =3D 1,
>      .minimum_version_id =3D 1,
> +    .post_load =3D stm32l4x5_usart_base_post_load,
>      .fields =3D (VMStateField[]) {
>          VMSTATE_UINT32(cr1, Stm32l4x5UsartBaseState),
>          VMSTATE_UINT32(cr2, Stm32l4x5UsartBaseState),
> --

thanks
-- PMM
