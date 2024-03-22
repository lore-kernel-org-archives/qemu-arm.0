Received: by 2002:a17:906:bc5a:b0:a46:bbde:2c08 with SMTP id s26csp1370849ejv;
        Fri, 22 Mar 2024 11:35:45 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVsT4P9vH1rh4mBmmwQSvYeK2TFfRXsBrNNkU2915xQP5aPVwVeqWNLZkDbIj52qJJlL92+5dLiovqd7PKqKEnq7e+sWLdV
X-Google-Smtp-Source: AGHT+IHKUXAdpbJFQl6nIM5Mn7ysaY3hClc1fHu5E0LDQG1FPFfVkycjiQeJ33uAbQFgLv89lNiJ
X-Received: by 2002:a05:620a:10aa:b0:78a:3e94:def9 with SMTP id h10-20020a05620a10aa00b0078a3e94def9mr595616qkk.34.1711132545112;
        Fri, 22 Mar 2024 11:35:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1711132545; cv=none;
        d=google.com; s=arc-20160816;
        b=SItWJKBW4kBI3TDtYLkBGkXdjNwKYWWjfJmWbgYT7Q0qnKhr2YBAbBMrgm7F0paM4D
         S+p1zEF4Skti0WvmP3SXi2Htpj6+c1R89UFasxeXBsKagrEaIOHTFO4UPnqHaZc1aAUk
         Yzkz1j/eGh7Uv73piU7nEliRl/eLGtPrSxvn7ucDGYLOmt3BhZoiAD3En4u5qRV4+aor
         PvXNfYfwZeCYdTaOmED7v4hgbIBt1+Ok9A6gZFCAB/O1UkvlrMGr1KFEFUbZmiswNx89
         wZTUz8c542zAxiPW5U4UuTbZq5R30CC7+TaeZC2YTZCl1NKlm0jDo1IJKTfsZVnsU9YV
         Gcvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=0iWMg007xv2AkRWL1ba45DBUCaixxTBKkzv3VnClTOM=;
        fh=+AXGJ1TEO7QL1q1pfkc98PImjDs3SelthFCHCJFzGX0=;
        b=dPMqck8ex6juG+P2K2Oj3Y/S0M3zYkDzLWpgO1edghzSGXTRHlLruMGhyuWEXE2dAt
         iUvcOzN+ddjqmhruRuw53JvmJHmxNyu0e/A7NrOPnPCQ5htKzCdlRtUmwYf436mf8n57
         OUf5PB/q+MZTAHireF3+1IISqp4WDvSFoX/H84LIdZwcpS8udBNJML6rSENC57SxcmnI
         Qt3qVUZBTX4zFufS3QCYR8DBX9muZ6CEZLYl7KYZyg+8u8vkRrrYJnJe7tLaZjVRnHZX
         vC4KdEeZCvYS/lsMo9atKQ80jGFMbrPKhD/9j6CMoXeuFrQjljCXoBSZc1fsB6VKtZDh
         6pqA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FCKwohNx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id po2-20020a05620a384200b0078a17418d04si131365qkn.321.2024.03.22.11.35.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 22 Mar 2024 11:35:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FCKwohNx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rnjjW-0005fx-EW; Fri, 22 Mar 2024 14:35:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rnjjU-0005fN-DL
 for qemu-arm@nongnu.org; Fri, 22 Mar 2024 14:35:12 -0400
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rnjjS-0004tm-Bf
 for qemu-arm@nongnu.org; Fri, 22 Mar 2024 14:35:12 -0400
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-56a2bb1d84eso4393005a12.1
 for <qemu-arm@nongnu.org>; Fri, 22 Mar 2024 11:35:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1711132507; x=1711737307; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0iWMg007xv2AkRWL1ba45DBUCaixxTBKkzv3VnClTOM=;
 b=FCKwohNxR8MCu71Uio522OYbc/nDS80trBEte2qExtUI1jWAF2yQuh98vhgqrML9db
 TtPABG5Va9hBAuZyTM8nnWac2y8cE1kPU4vKIz98YmmQlGRzDU/f3Wc8s3yVmvean2p+
 yddNBkpKu/ZOpkjDJnE/4T1w/I0hwBwRv8KOyqDt2aeQmOIlkZE5y4xGj3RXgU6OrUSq
 pP4Gm/u2Q/6IqHgTm4hWZ1GBKMdnKrpZcW5K0dwn6vn7mIjehAy+mblWjisFtKAME4vk
 KSaLXlvivDiXExJ+c1UssnfU8ScQYL9BYcq4x2il+q8nqLSbA6sZnK5bBJLrokVrVsZb
 CpOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711132507; x=1711737307;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0iWMg007xv2AkRWL1ba45DBUCaixxTBKkzv3VnClTOM=;
 b=iqeBr4BGjOO2mQpflJBNs4mDvFdrZMHIvFaar427WpD6o9B2pNXP5i2KYaR+o5wrE+
 xvSolKQaeKEh31K+ZfH0hSBi67gmfWIWgBNtvs2vnj8Ta8ldIHQdBAr7iQ4an9MFWbYj
 abAoBtuv+Pexud3oKzRueK80GmUcTP+1z+OIvrw9K+IP9ko0OoxNQ3gtUJnr1ACSU93J
 C1+7q2mwnIdV4m9rctxkfcuKc2KEdO6ilL0wH6dfmT1Xzy5f5FPwe8AdDXKl2RpgKYGH
 Spr750McUJrWwBe975Jl/LmSlRaIipc06rRHNgnG3TxY9BEiRwUeOuMYfqxy4KYdsb2q
 ZxVA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUFvNE44+Sbwj+Qn3qCScMXx5rdaStyyE3FZ68XDg6S4b2q5KvwnzzEwWmrb3OhtWnBBqfopDXAJxyT0jaRXX3aaCD9
X-Gm-Message-State: AOJu0Yy3ZxHZSPsthBVn+T2QF4zJ7KQ5E2XCgc2FJhrMb2toLcXnkcSN
 1DHVSs+SMcYC8u2OSA7F21eZzhMD7WGkC2PKUM8w0qvMa5KDcRRMtTahrf8/mtWvyhP2bznGPr6
 1UHY4Ownm9ntJPC1b8bvhCuxoelQTKDMCWd38cw==
X-Received: by 2002:a50:8755:0:b0:568:d31e:4f94 with SMTP id
 21-20020a508755000000b00568d31e4f94mr2419188edv.9.1711132507598; Fri, 22 Mar
 2024 11:35:07 -0700 (PDT)
MIME-Version: 1.0
References: <20240317103918.44375-1-arnaud.minier@telecom-paris.fr>
 <20240317103918.44375-5-arnaud.minier@telecom-paris.fr>
In-Reply-To: <20240317103918.44375-5-arnaud.minier@telecom-paris.fr>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 22 Mar 2024 18:34:56 +0000
Message-ID: <CAFEAcA-NgsDSry9dof3TNJRk5YJs2uXkN+LpnhD0OGcCCj3xXA@mail.gmail.com>
Subject: Re: [PATCH 4/7] hw/char/stm32l4x5_usart: Enable serial read and write
To: Arnaud Minier <arnaud.minier@telecom-paris.fr>
Cc: qemu-devel@nongnu.org, Samuel Tardieu <samuel.tardieu@telecom-paris.fr>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Alistair Francis <alistair@alistair23.me>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?B?SW7DqHMgVmFyaG9s?= <ines.varhol@telecom-paris.fr>, 
 qemu-arm@nongnu.org, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52b.google.com
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
X-TUID: c72x8q9RooHK

On Sun, 17 Mar 2024 at 10:41, Arnaud Minier
<arnaud.minier@telecom-paris.fr> wrote:
>
> Implement the ability to read and write characters to the
> usart using the serial port.
>
> Signed-off-by: Arnaud Minier <arnaud.minier@telecom-paris.fr>
> Signed-off-by: In=C3=A8s Varhol <ines.varhol@telecom-paris.fr>
> ---
>  hw/char/stm32l4x5_usart.c | 105 +++++++++++++++++++++++++++++++++++++-
>  hw/char/trace-events      |   1 +
>  2 files changed, 105 insertions(+), 1 deletion(-)
>
> diff --git a/hw/char/stm32l4x5_usart.c b/hw/char/stm32l4x5_usart.c
> index f58bd56875..958d05a56d 100644
> --- a/hw/char/stm32l4x5_usart.c
> +++ b/hw/char/stm32l4x5_usart.c
> @@ -154,6 +154,71 @@ REG32(RDR, 0x24)
>  REG32(TDR, 0x28)
>      FIELD(TDR, TDR, 0, 8)
>
> +static int stm32l4x5_usart_base_can_receive(void *opaque)
> +{
> +    Stm32l4x5UsartBaseState *s =3D opaque;
> +
> +    if (!(s->isr & R_ISR_RXNE_MASK)) {
> +        return 1;
> +    }
> +
> +    return 0;
> +}
> +
> +static void stm32l4x5_update_irq(Stm32l4x5UsartBaseState *s)
> +{
> +    if (((s->isr & R_ISR_WUF_MASK) && (s->cr3 & R_CR3_WUFIE_MASK))      =
  ||
> +        ((s->isr & R_ISR_CMF_MASK) && (s->cr1 & R_CR1_CMIE_MASK))       =
  ||
> +        ((s->isr & R_ISR_ABRF_MASK) && (s->cr1 & R_CR1_RXNEIE_MASK))    =
  ||
> +        ((s->isr & R_ISR_EOBF_MASK) && (s->cr1 & R_CR1_EOBIE_MASK))     =
  ||
> +        ((s->isr & R_ISR_RTOF_MASK) && (s->cr1 & R_CR1_RTOIE_MASK))     =
  ||
> +        ((s->isr & R_ISR_CTSIF_MASK) && (s->cr3 & R_CR3_CTSIE_MASK))    =
  ||
> +        ((s->isr & R_ISR_LBDF_MASK) && (s->cr2 & R_CR2_LBDIE_MASK))     =
  ||
> +        ((s->isr & R_ISR_TXE_MASK) && (s->cr1 & R_CR1_TXEIE_MASK))      =
  ||
> +        ((s->isr & R_ISR_TC_MASK) && (s->cr1 & R_CR1_TCIE_MASK))        =
  ||
> +        ((s->isr & R_ISR_RXNE_MASK) && (s->cr1 & R_CR1_RXNEIE_MASK))    =
  ||
> +        ((s->isr & R_ISR_IDLE_MASK) && (s->cr1 & R_CR1_IDLEIE_MASK))    =
  ||
> +        ((s->isr & R_ISR_ORE_MASK) &&
> +            ((s->cr1 & R_CR1_RXNEIE_MASK) || (s->cr3 & R_CR3_EIE_MASK)))=
  ||
> +        /* TODO: Handle NF ? */
> +        ((s->isr & R_ISR_FE_MASK) && (s->cr3 & R_CR3_EIE_MASK))         =
  ||
> +        ((s->isr & R_ISR_PE_MASK) && (s->cr1 & R_CR1_PEIE_MASK))) {

It always makes me a bit sad when hardware designers don't neatly
line up the bits in the ISR register and the mask register so we
can check them all at once :-)

> +        qemu_irq_raise(s->irq);
> +        trace_stm32l4x5_usart_irq_raised(s->isr);
> +    } else {
> +        qemu_irq_lower(s->irq);
> +        trace_stm32l4x5_usart_irq_lowered();
> +    }
> +}
> +
> +static void stm32l4x5_usart_base_receive(void *opaque, const uint8_t *bu=
f, int size)
> +{
> +    Stm32l4x5UsartBaseState *s =3D opaque;
> +
> +    if (!((s->cr1 & R_CR1_UE_MASK) && (s->cr1 & R_CR1_RE_MASK))) {
> +        /* USART not enabled - drop the chars */
> +        trace_stm32l4x5_usart_error("Dropping the chars\n");

This shouldn't have the newline on the end. Also, it looks like
this is the only use of this trace event so (a) you could make it
more specific rather than passing in an arbitrary string, and
(b) it should be defined in this patch, not in patch 2.

> +        return;
> +    }
> +
> +    /* Check if overrun detection is enabled and if there is an overrun =
*/
> +    if (!(s->cr3 & R_CR3_OVRDIS_MASK) && (s->isr & R_ISR_RXNE_MASK)) {
> +        /*
> +         * A character has been received while
> +         * the previous has not been read =3D Overrun.
> +         */
> +        s->isr |=3D R_ISR_ORE_MASK;
> +        trace_stm32l4x5_usart_overrun_detected(s->rdr, *buf);
> +    } else {
> +        /* No overrun */
> +        s->rdr =3D *buf;
> +        s->isr |=3D R_ISR_RXNE_MASK;
> +        trace_stm32l4x5_usart_rx(s->rdr);
> +    }
> +
> +    stm32l4x5_update_irq(s);
> +}
> +
>  static void stm32l4x5_usart_base_reset_hold(Object *obj)
>  {
>      Stm32l4x5UsartBaseState *s =3D STM32L4X5_USART_BASE(obj);
> @@ -168,6 +233,21 @@ static void stm32l4x5_usart_base_reset_hold(Object *=
obj)
>      s->isr =3D 0x020000C0 | R_ISR_TXE_MASK;
>      s->rdr =3D 0x00000000;
>      s->tdr =3D 0x00000000;
> +
> +    stm32l4x5_update_irq(s);
> +}
> +
> +static void usart_update_rqr(Stm32l4x5UsartBaseState *s, uint32_t value)
> +{
> +    /* TXFRQ */
> +    /* Reset RXNE flag */
> +    if (value & R_RQR_RXFRQ_MASK) {
> +        s->isr &=3D ~R_ISR_RXNE_MASK;
> +    }
> +    /* MMRQ */
> +    /* SBKRQ */
> +    /* ABRRQ */
> +    stm32l4x5_update_irq(s);
>  }
>
>  static uint64_t stm32l4x5_usart_base_read(void *opaque, hwaddr addr,
> @@ -209,7 +289,8 @@ static uint64_t stm32l4x5_usart_base_read(void *opaqu=
e, hwaddr addr,
>      case A_RDR:
>          retvalue =3D FIELD_EX32(s->rdr, RDR, RDR);
>          /* Reset RXNE flag */
> -        s->isr &=3D ~USART_ISR_RXNE;
> +        s->isr &=3D ~R_ISR_RXNE_MASK;

This looks like another "should have used that name to start with" change?

> +        stm32l4x5_update_irq(s);
>          break;
>      case A_TDR:
>          retvalue =3D FIELD_EX32(s->tdr, TDR, TDR);
> @@ -237,6 +318,7 @@ static void stm32l4x5_usart_base_write(void *opaque, =
hwaddr addr,
>      switch (addr) {
>      case A_CR1:
>          s->cr1 =3D value;
> +        stm32l4x5_update_irq(s);
>          return;
>      case A_CR2:
>          s->cr2 =3D value;
> @@ -254,6 +336,7 @@ static void stm32l4x5_usart_base_write(void *opaque, =
hwaddr addr,
>          s->rtor =3D value;
>          return;
>      case A_RQR:
> +        usart_update_rqr(s, value);
>          return;
>      case A_ISR:
>          qemu_log_mask(LOG_GUEST_ERROR,
> @@ -262,6 +345,7 @@ static void stm32l4x5_usart_base_write(void *opaque, =
hwaddr addr,
>      case A_ICR:
>          /* Clear the status flags */
>          s->isr &=3D ~value;
> +        stm32l4x5_update_irq(s);
>          return;
>      case A_RDR:
>          qemu_log_mask(LOG_GUEST_ERROR,
> @@ -269,6 +353,21 @@ static void stm32l4x5_usart_base_write(void *opaque,=
 hwaddr addr,
>          return;
>      case A_TDR:
>          s->tdr =3D value;
> +        ch =3D value & R_TDR_TDR_MASK;
> +        /*
> +         * XXX this blocks entire thread. Rewrite to use
> +         * qemu_chr_fe_write and background I/O callbacks
> +         */

Don't suppose you feel like doing that? It's not too horribly
difficult. Example UART devices that implement this:
 * cadence_uart.c is a good example for a UART with a FIFO
 * cmsdk-apb-uart.c for a UART with no FIFO

> +        qemu_chr_fe_write_all(&s->chr, &ch, 1);
> +        /*
> +         * XXX I/O are currently synchronous, making it impossible for
> +         * software to observe transient states where TXE or TC aren't
> +         * set. Unlike TXE however, which is read-only, software may
> +         * clear TC by writing 0 to the ISR register, so set it again
> +         * on each write.
> +         */
> +        s->isr |=3D R_ISR_TC_MASK;
> +        stm32l4x5_update_irq(s);
>          return;
>      default:
>          qemu_log_mask(LOG_GUEST_ERROR,

thanks
-- PMM
