Received: by 2002:a17:906:fc07:b0:9bd:85f7:2662 with SMTP id ov7csp1070639ejb;
        Sun, 22 Oct 2023 18:37:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEL+Isk8OCDbtjCENd1iYzmE/C6nE6HN4r6CW21F0Ms0LZstI0rqyv4/nc6tyENZC8vBxZP
X-Received: by 2002:ac8:5ad5:0:b0:41c:d846:4eb with SMTP id d21-20020ac85ad5000000b0041cd84604ebmr10919101qtd.49.1698025041209;
        Sun, 22 Oct 2023 18:37:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698025041; cv=none;
        d=google.com; s=arc-20160816;
        b=eMundkkDq6Eay6/AOyR3IP5U0yJG6vnZJ+i8N/N2G17c1m77RNuBZTYdM3F3aziShe
         Vux9HmqhGVb/34WB+9whrLdTdfrIVxmOHs246R9ffYwDvyvDULePlPfyRzZL2wxetJWI
         zko7VelzhrhAg+frmZTFOf16srcoeCcHfgCZpKFZEB9RdLPijZ2QyHquZHk61hildu4+
         8UjVFar4U8KW8SLAO1lMERoUgn1ohJa/7w+tsLC6hedC6fE2NPaKq3EJjGpsLLzZA07a
         Si/oWzBSPLy3fDI5ixjvQTa3IGsBMymwg9CxzmLwtyy9idVT2bi7ld9ouzyK2mZRzhMv
         /fGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=kKCog19UpRbCVEHNVCgHNEUYu8Mhg2C8RE/Hafk9Tqo=;
        fh=iY95LQ2EZGL5gum0JNZHT+G5f2E2xCqAEJaN82odp0I=;
        b=nuHVLuDAG21ZERRWgOncVUlxs17+Tf4xSICtisy0d2sbhKaEX/ykc9jA3ngkat97Y7
         M4O+Riom5js3fropsjOl/gkCa5v8yljJCHjWfKGeN9Kq4LfbypenJBetsLGPm7bJ172g
         VBM//KgBUUaxaXfFSdWpKqg4Zuo6d5cQu1fZMgHv0YrFXUpbKJBjZT+pG1jWfORHMEg9
         BlG5k+UjMeV7jnJ/+Uhk+l+E9HnvMVPziWpKUS0ZaR2ors0yS98D0CzpoplYd69R7Biw
         a9MkFKFFGxtpvWsfORExy/bnWenf+p9R3LzuOIPHV78Sbp5t8sXhD508R6xI6VXSOUL4
         m+ZA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=J5dHGEwP;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d11-20020ac85acb000000b0040eb9b330d5si4987368qtd.492.2023.10.22.18.37.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 22 Oct 2023 18:37:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=J5dHGEwP;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qujsO-0001g8-U7; Sun, 22 Oct 2023 21:37:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qujsN-0001fL-6f; Sun, 22 Oct 2023 21:37:03 -0400
Received: from mail-ua1-x92e.google.com ([2607:f8b0:4864:20::92e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qujsL-0002ob-P7; Sun, 22 Oct 2023 21:37:02 -0400
Received: by mail-ua1-x92e.google.com with SMTP id
 a1e0cc1a2514c-7b652e785dbso1040031241.0; 
 Sun, 22 Oct 2023 18:37:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698025020; x=1698629820; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kKCog19UpRbCVEHNVCgHNEUYu8Mhg2C8RE/Hafk9Tqo=;
 b=J5dHGEwPUo6aRiWGGjLvQiw/mxqUIMU24uktFfP9z9xvyFk/1uwe5UtslQ5BM87sxA
 g8f8qvGIhC70Xly+Pv1OT2Gp1o7Q/OgYWYMZIIb2PyCmWjYF2ZW3oGxm2SDOoIPvk18E
 i6fsCuXuZTQg48HBy4mQzkBqpxKs+UE6PbO7V4Yx2lcAVVYGhUR3NtD2xdYlO1voA3oH
 2EL7Sc57hYBZl4quqoxW/aYt3lFEj++Y+yQD3m9hpSjJzImK07RII53LimRgP2Bv4OTI
 LBmjw3NtlpEtcxyAhjd+nQxESRjXLalvUcgqru0rarFJLunu9LLoyiERA1toRyNk3/DI
 MGaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698025020; x=1698629820;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kKCog19UpRbCVEHNVCgHNEUYu8Mhg2C8RE/Hafk9Tqo=;
 b=ulSXrskIaHZATFGGYrDC5Md9KTMmq0n7HYUkSKYahj1KFeBdfA7y3VzbAzxpj+49yw
 PNc3B35IXjtX8LEferxxnx52QE3BEL6OKsjpL5++C0V+lIK5QmbdSPS3uWhws0CxXZyR
 TwXGrfZxduhzlz2H4zC8pu47tPG4wwxIAaDAifp8evjT+NE6+7J3lAsDFFjzv3nEKcig
 i14efqBsOkWaRo8WKSnLLTpT2iZLmy0P5E8S3srt/N6CENooTZTdWyeknUtm7erIQZdJ
 lsja+HzRl9rDyqEZD9gO7zQNf9NX/93G64w6O6RMFX3FzALbWtBtZ0Uk1q055yrVoUvf
 v9Tg==
X-Gm-Message-State: AOJu0YxnVbVsynrp+Dk2C8I4TcFL059Au5lSMCiur3s3qRnXdrlI/hEU
 R8dkqJl2QyY5bYYMfUf2IWPpVfODjyz0PRMKoY4=
X-Received: by 2002:a67:e192:0:b0:457:e881:32c6 with SMTP id
 e18-20020a67e192000000b00457e88132c6mr6575076vsl.11.1698025020238; Sun, 22
 Oct 2023 18:37:00 -0700 (PDT)
MIME-Version: 1.0
References: <20231020170009.86870-1-philmd@linaro.org>
 <20231020170009.86870-3-philmd@linaro.org>
In-Reply-To: <20231020170009.86870-3-philmd@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 23 Oct 2023 11:36:33 +1000
Message-ID: <CAKmqyKPJoyMmoNAX9JrHz6_SSphqRkEJPy3AUaV0eu+701Ow9g@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] hw/char/stm32f2xx_usart: Update IRQ when SR is read
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: Hans-Erik Floryd <hans-erik.floryd@rt-labs.com>, qemu-devel@nongnu.org, 
 qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Alistair Francis <alistair@alistair23.me>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::92e;
 envelope-from=alistair23@gmail.com; helo=mail-ua1-x92e.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
X-TUID: 33u7dCltoZKo

On Sat, Oct 21, 2023 at 4:12=E2=80=AFAM Philippe Mathieu-Daud=C3=A9
<philmd@linaro.org> wrote:
>
> From: Hans-Erik Floryd <hans-erik.floryd@rt-labs.com>
>
> Signed-off-by: Hans-Erik Floryd <hans-erik.floryd@rt-labs.com>
> [PMD: Split from bigger patch]
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> ---
> Is this required?

I don't think this is required

Alistair

> ---
>  hw/char/stm32f2xx_usart.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/hw/char/stm32f2xx_usart.c b/hw/char/stm32f2xx_usart.c
> index 519d3461a3..46e29089bc 100644
> --- a/hw/char/stm32f2xx_usart.c
> +++ b/hw/char/stm32f2xx_usart.c
> @@ -109,6 +109,7 @@ static uint64_t stm32f2xx_usart_read(void *opaque, hw=
addr addr,
>      case USART_SR:
>          retvalue =3D s->usart_sr;
>          qemu_chr_fe_accept_input(&s->chr);
> +        stm32f2xx_update_irq(s);
>          return retvalue;
>      case USART_DR:
>          DB_PRINT("Value: 0x%" PRIx32 ", %c\n", s->usart_dr, (char) s->us=
art_dr);
> --
> 2.41.0
>
>
