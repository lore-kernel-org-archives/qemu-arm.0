Received: by 2002:a17:906:f85:b0:a47:c39e:cbe with SMTP id q5csp1085912ejj;
        Mon, 25 Mar 2024 20:14:33 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU0MRNsPVB7druhJSfoxaByoLq1IEv900ckdF6Knv+jFsGc9hEsH5isUfCHfpu1luoVyEl7YK3ShZa7cGnj6/MDzDjt6pGG
X-Google-Smtp-Source: AGHT+IHIEFgPPbVJPMGrupQ4Sz1mkmxG/JMTXTm9Vb+Msdu5fwUy1cGMO4YfP/rzCdFzQfJGzGUm
X-Received: by 2002:ac8:5c14:0:b0:431:2a50:e15 with SMTP id i20-20020ac85c14000000b004312a500e15mr10271336qti.39.1711422873716;
        Mon, 25 Mar 2024 20:14:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1711422873; cv=none;
        d=google.com; s=arc-20160816;
        b=R5Qs4sDfn7qxC0r8gX33b49bLJ59VeTCNAphI8IXz8eVKgsF/zwOB0PmmyRejj7fxx
         G8MQ2qE4lpm+xh84jDYqHUb09GR9BvE9WXlwJRuoD5iSKSzqjx3KeNyRcVB5y7JIU3Z8
         0K0UViMI5yLcLhcINCVQfJaO36ruzhagMB+rvt5+iedDbw7w89+aB/K3u+ad6dfK4zH+
         QTaAEjcehM7WS+o1SL8NypCn8lP4FXbpN/hKJbVwct0OTJ7+3qG/RuN+EkdDpu7bHQPh
         1q/jvCMKyGCNb8vk5SwWhjI7KzykDkfOu/KxQu0jhFKuQT6q5C2skohdK9QaHJQoPbHZ
         6PGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=BWMGdSPpVsQI9d+Gzu87zLDQKs52karxRO7i8xbMs+M=;
        fh=fzr8iSo89H6iq33/VZvJK9UZf5KQLIb3X6NNHnq9UTg=;
        b=i8tDDU8sUWb631BlFUj+HpLHCMqKKGRVfSX1Ns4SuLebuZT9zqMtpvGWyTAi+pC5pM
         Vx32CI14vV6jNWqR29FwY+kQn4BvrEKT4+NNrzqvnk+FCNcEuW288hSHki/UTw1L34+d
         vP/elYbh3UaTsz26XxObABoGAOrLKdZn7f0iaHmuGPZa+yg36RUyO/u8S50KkDyELNj7
         sxedKp7tomFxFlwTWlF9oo6OmQBD9zEOnXK+A9KiWf+7QiimM7aJbr7m7FH5DLkOyOWo
         n8KkvxLbL+MXnHrxj0ZbV2pQnuTPCAAgUgn1p1u64r2KnLiX69XAmLOKMzWyxEyPRhrO
         d+Aw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=b3sWqy3X;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w30-20020a05622a191e00b00430b802060fsi6725839qtc.596.2024.03.25.20.14.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 25 Mar 2024 20:14:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=b3sWqy3X;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1roxGO-0005fS-Km; Mon, 25 Mar 2024 23:14:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1roxGM-0005eB-M2; Mon, 25 Mar 2024 23:14:10 -0400
Received: from mail-vk1-xa2d.google.com ([2607:f8b0:4864:20::a2d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1roxGL-0000a1-6A; Mon, 25 Mar 2024 23:14:10 -0400
Received: by mail-vk1-xa2d.google.com with SMTP id
 71dfb90a1353d-4d8881c4668so621977e0c.2; 
 Mon, 25 Mar 2024 20:14:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1711422847; x=1712027647; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BWMGdSPpVsQI9d+Gzu87zLDQKs52karxRO7i8xbMs+M=;
 b=b3sWqy3XO4qSDR/u2g+hXTxoDXEhQ2x3KKVtJPMrivRpjXcw6CLxOkuUeJxpI1Jj2V
 CecGwruWp3IeKDK+HRER3iCSg+0j9Anaj4LIWXcCA+6v5GVCFD0kOS3NoRGhhKnPyE5w
 5lCEgXPgJrDUjNnGpds1IHtqHXB3BdiAgSA0FqrKBznl85a6xZ62cUbx3CO4LzRNUtSY
 sy5Q/RqGpvpQeqOFt7qn+Z6t3C/33TR41rcQ4O+8DJarACsUtNETzLkS94YpSURTEhER
 /JyU3bBCcnFU9wRVGZI4crmpaCoWl85fxUugaBbL4F43ezBOfBU7vxZ3Ap8FASUiVxvL
 3Ipw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711422847; x=1712027647;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BWMGdSPpVsQI9d+Gzu87zLDQKs52karxRO7i8xbMs+M=;
 b=sz2+ipAQ3wCg/p2lxx1RsIrF8WqfaNl0Shplzpp4T5y7CGBj+efgpMn3L5URr6XRr0
 p7upEFEdwIlXBDL81DxK43g3mxm4KNTvdR7erCGpNM8SiqUwRU5gOwY1TwfmgAZHM+/V
 XVUdHKUVPo+bcUt86m/ojdD2mQYERxVL8JOqUfB1eaMKbiFdv5Xo91t7x7Ke82N094g/
 2wxQxflqOexYU1eR8pcwd8ilcKJySu/0iwakrStQ9opITJHsck7fyvbgbsO0OYUckmK6
 bme6T9cEMT3wkm5eQRojqBVR50fT3Kw4a0Tp+4MfIqfrVWIHmEsaguquoaETjNL9xLKd
 X6+A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXC3rXBUyXcAG0Cs6ExtQ1TgVhV9+aDLvF03ylrS7zkSxSvND0qGvazouecqC6GzwWPT7H0mGlKkf7fMQ+x93K2RAc1
X-Gm-Message-State: AOJu0YzhkXB7FK3L/3OawvSI7YiOYy1RgYWVAWBNGRY+4ejxH+VzGTR8
 MjJnx8qyB3Qd59lHpE3hlKhHAabXIC4SnqB7ji57dysCz+IDbZHbXmi/njfcwavgvjpskKMGT9q
 RC7IK9LnW1sziB7ILcpzRqlzIcPU=
X-Received: by 2002:a67:eb59:0:b0:476:fac8:c9fa with SMTP id
 x25-20020a67eb59000000b00476fac8c9famr3581552vso.4.1711422847220; Mon, 25 Mar
 2024 20:14:07 -0700 (PDT)
MIME-Version: 1.0
References: <20240325133259.57235-1-philmd@linaro.org>
 <20240325133259.57235-2-philmd@linaro.org>
In-Reply-To: <20240325133259.57235-2-philmd@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 26 Mar 2024 13:13:41 +1000
Message-ID: <CAKmqyKOMY=OhVUie9wQQ5pFfemjihrHW3u3dA7KxkJYoHVVyiA@mail.gmail.com>
Subject: Re: [PATCH-for-9.0 v2 1/8] hw/clock: Have clock_set_mul_div() return
 early when nothing to change
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org,
 =?UTF-8?B?SW7DqHMgVmFyaG9s?= <ines.varhol@telecom-paris.fr>, 
 Arnaud Minier <arnaud.minier@telecom-paris.fr>,
 Damien Hedde <damien.hedde@dahe.fr>, 
 qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>, 
 Alistair Francis <alistair@alistair23.me>, Luc Michel <luc@lmichel.fr>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::a2d;
 envelope-from=alistair23@gmail.com; helo=mail-vk1-xa2d.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
X-TUID: C+d96ZkwAVyL

On Mon, Mar 25, 2024 at 11:34=E2=80=AFPM Philippe Mathieu-Daud=C3=A9
<philmd@linaro.org> wrote:
>
> Return early when clock_set_mul_div() is called with
> same mul/div values the clock has.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/core/clock.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/hw/core/clock.c b/hw/core/clock.c
> index d82e44cd1a..c73f0c2f98 100644
> --- a/hw/core/clock.c
> +++ b/hw/core/clock.c
> @@ -147,6 +147,10 @@ void clock_set_mul_div(Clock *clk, uint32_t multipli=
er, uint32_t divider)
>  {
>      assert(divider !=3D 0);
>
> +    if (clk->multiplier =3D=3D multiplier && clk->divider =3D=3D divider=
) {
> +        return;
> +    }
> +
>      trace_clock_set_mul_div(CLOCK_PATH(clk), clk->multiplier, multiplier=
,
>                              clk->divider, divider);
>      clk->multiplier =3D multiplier;
> --
> 2.41.0
>
>
