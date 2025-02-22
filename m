Received: by 2002:a17:504:5c6a:b0:1be9:327d:8ee3 with SMTP id dm10csp814528njc;
        Sat, 22 Feb 2025 01:41:53 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWRi0WtI5bqacnW/hDR7r6k8BwxVBCFNz23ws650jNOGBr9t6h889YputLBlTH+N8pbPeQCjxACe73eDw==@linaro.org
X-Received: by 2002:a05:600c:4ed1:b0:439:31e0:d9a5 with SMTP id 5b1f17b1804b1-439ae212938mr46505325e9.22.1740217313379;
        Sat, 22 Feb 2025 01:41:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1740217313; cv=none;
        d=google.com; s=arc-20240605;
        b=PvnlhVDb4hAE54Ww3+3tg6zpWzVQ0qenl6dcfe2s+9C2UgOKNpfGoTWqte0Fyp43qp
         x3+OwvZN7NLXD5XMA76I8eo0JAHlKclye1VJvaf7RV/uJ/jDFoxvOed1e8gHheSFn6PN
         mSSlzvwvLxPbjlAEYnkER0BroypDXzXjAxvtyxSxs48jJIgkMZ1UAoWslMG+eKHELc0m
         vg6OQtZ06B516kMBDHOk1EiegmT2ft58GEc5dglWCFon/yX/UzGs4aMj71RFxvikjchp
         TyGj0nfkMvFyjv0TMUJ/HfPF5Kz3tHR1L1zj2DAUEl7pWbpckAb44Kg/ineBUZnvPfFt
         0ylQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date;
        bh=p/6zF18sr+H4aV8iIBaQuqtGPgtDt/rve8RnYGx0smc=;
        fh=Bj9QjitRSqzp1iX1TdZod/XfdhvBxyXYm6+k/EhqJIw=;
        b=Yb2maJXazWvHVLP0pd2lijCUZQgblB14ja1u6nfyXqITu/DAXQJEm6DtD5jcarYTHg
         UYHt0sPD5blJNlUTU/l70nFhA27w01tHKXnQ9mmRFwgx9VScBIvR8kVk64+xKupUmFlT
         KsS2m/O+WNFE9GPtYOEI5i1Gkdgv2xYtWReDZD9YQiMiIozwsUo9ciVbWU6avqJvPivZ
         GCImO5aIJEhnwIgBBTf3lA9QvDGindo9g8caJAhJZ9/lMWJCcctQgsEx0/Krfzq6s171
         BBW8hZznYZ2gRSMdu9l5pjTyKm9hRGn6PNr7MxsWbvRHxOjEfPqgjHIe3DhKrFSIKTvO
         mT2w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of th.huth@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=th.huth@gmail.com
Return-Path: <th.huth@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-439a67904f7sor17014625e9.0.2025.02.22.01.41.53
        (Google Transport Security);
        Sat, 22 Feb 2025 01:41:53 -0800 (PST)
Received-SPF: pass (google.com: domain of th.huth@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of th.huth@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=th.huth@gmail.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740217313; x=1740822113;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p/6zF18sr+H4aV8iIBaQuqtGPgtDt/rve8RnYGx0smc=;
        b=IiZg0GO/H8FK4TWxoYqOxV6m79cGbw7XLNdysdtSLS3ikR8E69Lietyhb61LxkdlzX
         JZIgK0qyVYWCSXba+QJw7SL4sgRVMGzOSymZTtaTVLF4diVPJ/6vyojOJyqaFMHTiEb7
         ZRzaCGOVpV/2y2YNPN2ldgthbVi92KHpsIOuOrxZPQU8M4LCwutBPFHVnD1Tx//ZhbvS
         DVGdRANGpWxZDeN//bjttj86TsXwOw6E9zUKlEvT6JdmEc98Q2rrieUHNue7C/niJB4O
         L0DqqWQSFVJYkFY+XRHJklnfCS0ZUb8U2/qdqHgRcP/Ihfdrq8/nIQiPX+6B5eITtLDG
         /j3A==
X-Forwarded-Encrypted: i=1; AJvYcCU4zA+3gZVLuvdN7Cwx7cn3/dq67RHnTvG/vuK+ZujxnNIr/JvgIC8GZlMm9VMKZyM0HzmOVmbdNQ0mQGBoFA==@linaro.org, AJvYcCV8kIZN1BMrg1rGxsSs0Ol7QDSdnPMOSJoxsNFTBqdU5UdHYm3aIksb56v0jtMUiTByTo1zQauhh9oWhg==@linaro.org
X-Gm-Message-State: AOJu0YwyEdGjfEFPTEiUrOpefsH39zp4EOlefXXgA0I+FPUMfgPF81j7
	N6IvtH6LoPD57wyd9N2+JT4vJVcDKHUKdl5JJ42L4YBpMDtaGfKNwafkWffS
X-Gm-Gg: ASbGncuhn4EybA1to7y01PUu3zvXAgVkwI+C/sK0nwjlQfShraQWSTyK/4wjbozBfUx
	ruoaiXDWNdu6EdVQBQRyJAwKeqbf4XymseUvjqigdQvalZc4v1ThEN/yB9LH8mihSB6pK/tdxzw
	/KeLx9dTZznk4OP1ZcM8yBgDLp9a/GZUXjfhnHsWG36JxOYYRRKcecAyunvINreOCE/ZxrcirCR
	GuLfZ1cf+jVuxf7Yd6kBZDhmkMIwE5nEHPxqu8+KOu3i/gp2l2ZflTjYxdqMevvHiKmz6+78Lgf
	kaK9RubttjCf4Bs0CLigTPjgitjAUDLGuGJc+dAPpK2JQjtb
X-Google-Smtp-Source: AGHT+IGEUOKQJQZEbO5RqGE2g5ULtX+AHPzfTNSznb9Z3gM5FL8SnzorvM1NV4f2l0zdVCW50yfgRA==
X-Received: by 2002:a05:600c:1910:b0:439:9225:2f50 with SMTP id 5b1f17b1804b1-439ae1f1586mr66345315e9.16.1740217312610;
        Sat, 22 Feb 2025 01:41:52 -0800 (PST)
Return-Path: <th.huth@gmail.com>
Received: from tpx1 (ip-109-42-51-157.web.vodafone.de. [109.42.51.157])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f258b434fsm26142897f8f.16.2025.02.22.01.41.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Feb 2025 01:41:52 -0800 (PST)
Date: Sat, 22 Feb 2025 10:41:50 +0100
From: Thomas Huth <huth@tuxfamily.org>
To: Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, =?UTF-8?B?TWFyYy1BbmRyw6k=?= Lureau
 <marcandre.lureau@redhat.com>, Alex =?UTF-8?B?QmVubsOpZQ==?=
 <alex.bennee@linaro.org>, Magnus Damm <magnus.damm@gmail.com>, Shin'ichiro
 Kawasaki <shinichiro.kawasaki@wdc.com>, Rayhan Faizel
 <rayhan.faizel@gmail.com>, qemu-arm@nongnu.org, Evgeny Iakovlev
 <eiakovlev@linux.microsoft.com>, Paolo Bonzini <pbonzini@redhat.com>, Peter
 Maydell <peter.maydell@linaro.org>, Luc Michel <luc.michel@amd.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>
Subject: Re: [PATCH v2 8/9] hw/char/mcf_uart: Really use RX FIFO depth
Message-ID: <20250222104150.03b08f1d@tpx1>
In-Reply-To: <20250220092903.3726-9-philmd@linaro.org>
References: <20250220092903.3726-1-philmd@linaro.org>
	<20250220092903.3726-9-philmd@linaro.org>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TUID: Q4GXPqeMipBe

Am Thu, 20 Feb 2025 10:29:01 +0100
schrieb Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>:

> While we model a 4-elements RX FIFO since the MCF UART model
> was introduced in commit 20dcee94833 ("MCF5208 emulation"),
> we only read 1 char at a time!
>=20
> Have the IOCanReadHandler handler return how many elements are
> available, and use that in the IOReadHandler handler.
>=20
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> Reviewed-by: Luc Michel <luc.michel@amd.com>
> ---
>  hw/char/mcf_uart.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>=20
> diff --git a/hw/char/mcf_uart.c b/hw/char/mcf_uart.c
> index 95f269ee9b7..529c26be93a 100644
> --- a/hw/char/mcf_uart.c
> +++ b/hw/char/mcf_uart.c
> @@ -281,14 +281,16 @@ static int mcf_uart_can_receive(void *opaque)
>  {
>      mcf_uart_state *s =3D (mcf_uart_state *)opaque;
> =20
> -    return s->rx_enabled && (s->sr & MCF_UART_FFULL) =3D=3D 0;
> +    return s->rx_enabled ? FIFO_DEPTH - s->fifo_len : 0;
>  }
> =20
>  static void mcf_uart_receive(void *opaque, const uint8_t *buf, int size)
>  {
>      mcf_uart_state *s =3D (mcf_uart_state *)opaque;
> =20
> -    mcf_uart_push_byte(s, buf[0]);
> +    for (int i =3D 0; i < size; i++) {
> +        mcf_uart_push_byte(s, buf[i]);
> +    }
>  }

Tested-by: Thomas Huth <huth@tuxfamily.org>
Reviewed-by: Thomas Huth <huth@tuxfamily.org>
