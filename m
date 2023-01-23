Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp3046492ejc;
        Mon, 23 Jan 2023 08:24:48 -0800 (PST)
X-Google-Smtp-Source: AMrXdXt0cH/8zoXQ5Lxw0eJczz3fmBYsrvKQwwoEd7QN7uP5Ezgy3I5F4Z8r566OvpCHV7cIouV/
X-Received: by 2002:a0c:ef86:0:b0:534:b0bc:5826 with SMTP id w6-20020a0cef86000000b00534b0bc5826mr34634832qvr.4.1674491088361;
        Mon, 23 Jan 2023 08:24:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674491088; cv=none;
        d=google.com; s=arc-20160816;
        b=vX87hJl4Vr9jHmJJivJIdZoXl1pC8s/BsUA+6ymlLKoSp98Z7RaGoipPB+IJvKHJzZ
         tFCuUFrDy2JI7KKtAAfysgDLRLNwJeBp9iW8tMp+Jhi95e0mtCcWm1+uP/7xFN/QflP+
         n8srRi9BaI2Hft2bft+8UxUl+jjTmlHAtN6omqsTIkU4ukR8PBlYxOlenfPTAexd6tpy
         C/6+LFD6K9On1L40120IOWJinxV9Gl/nkKwpGeS/dbjdrE7NVLs6QlORnt/5W8KzhHhP
         ch0eSq4tMIsSoDz8f/76K3QQr3wyZ2PfAjSK5giEOvpE/ZZn7eJpHZFQOYcdfZHAFt0i
         kqVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=C2mYCXV3m9DJxOFkfuPXrqMFatVaH4uwH1aaGR0qSKo=;
        b=BfHUn8Fz8jK+d9YewNfFsOy+Py2HpJDDiGrUeiAQ/tq0nBQXME5kNhJ2GxgWsUiNtv
         YOrYFjFXuZ5NhGFs1ZDxBMKUTYVbpB7awyWugqR4o/lHTh08Ca4C5Tr7Ig99AsHSDLDu
         R8GO2Yo7L/lLHo7f3pVR7FaRDoFCTimVWq7KKFI64Enmhl4/nf3cFgaM/OhvuOEXLrWQ
         UjMq7N+nSab6hqfjs1+E1scuBTkd3A46fHDPw80OAHeAWY7huE7+HFc+9WIC2p85y8Oz
         sTfYSHNJXtg+4ye1ugTAcOJ8dyD0vMh6JO5hNl/ZmxNEx+83yJ3ORdbVPG/7Fqpstt5a
         R92A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="nfDn/kxf";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id op10-20020a056214458a00b00536d096484dsi5860709qvb.241.2023.01.23.08.24.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 23 Jan 2023 08:24:48 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="nfDn/kxf";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pJzcC-0000dF-Oa; Mon, 23 Jan 2023 11:24:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pJzcA-0000Nk-MV
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 11:24:10 -0500
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pJzc8-0003g3-Nk
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 11:24:10 -0500
Received: by mail-pf1-x42b.google.com with SMTP id x4so9201084pfj.1
 for <qemu-devel@nongnu.org>; Mon, 23 Jan 2023 08:24:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=C2mYCXV3m9DJxOFkfuPXrqMFatVaH4uwH1aaGR0qSKo=;
 b=nfDn/kxfhTT0cgFCqQaz7XNQryaqUY9FAerqmnhQcr2bDNzrmnPKAy8QokQ/Y2XXZ7
 CwoV60bYsypnHLXUx8NMO2JrgtFFCsrHIz6RaH0ugqSX6BqLhtWTnxhtggKKLUZ3Ntp2
 6Kivk8/E4fiee5g8XeqbvpvhcAaYKq6H192Jygl1Wj0HOiEib6vbKDmXP3ae9M0RKjS6
 WQ+n1hLeuOzMkwZ7H7uLLbBXvbZ5/qydj+Wv9ch+ZbsxvmF1HBIgL85tgklABmR/JhVG
 aOL1mlrPeQIu2nMuF8l2B+8izNHq7OhrbHFVQoVq9BrOR+zcjYvcD/Fvxz0jy7kIh+oK
 SoCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=C2mYCXV3m9DJxOFkfuPXrqMFatVaH4uwH1aaGR0qSKo=;
 b=eUDnpNOuWTyzL9mbmmYDR3HHTaY8bM/Mpegqo9EHoOAMtFp2RSHBW+wzDg7KB+DYKT
 3XWWujvpN98YTdWSohhwcp4pgkZqve3fDJCC/T3Z/pIPDCaJOYPYCQAuZKboq8f6FjTl
 970I93BocohXbDLxNhkHkL3mCZ6CFXL0sRusihFwmLwx+VSpZgVH11SsIzc9ug/eo9dW
 EzM+Fn35/u7bQrqp/qP8Lt6nH8ahRE6b0S9SQMPrTuP0b4vuoGKP3tyqXUXedcXM1RK3
 /XK76yIDu6+SSKslg2j5rUYbz+gAIW1EVD/BcDq1fJB02m9+NBA72UPgLJk9kRJDKr3u
 ybdw==
X-Gm-Message-State: AFqh2koTim/fExVdtXX35uS0XXZduM5KOuC1bBAsJYXhZwWZOLV0yQum
 +eGZphvPJ185de91F7G3zwBNOVfytW4Gzzn+5+vo1A==
X-Received: by 2002:a62:61c4:0:b0:58b:e9af:948b with SMTP id
 v187-20020a6261c4000000b0058be9af948bmr2676993pfb.26.1674491047344; Mon, 23
 Jan 2023 08:24:07 -0800 (PST)
MIME-Version: 1.0
References: <20230120155447.31702-1-eiakovlev@linux.microsoft.com>
 <20230120155447.31702-6-eiakovlev@linux.microsoft.com>
 <fc01ef6d-73d7-af1a-3e59-bd4f1e3e83ba@linaro.org>
 <1937dbbf-579d-e236-4669-afdc633995a1@linux.microsoft.com>
 <04d950dc-bd01-d9ca-cbec-25b52ccd70e8@linaro.org>
In-Reply-To: <04d950dc-bd01-d9ca-cbec-25b52ccd70e8@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 23 Jan 2023 16:23:55 +0000
Message-ID: <CAFEAcA_93iF+oiYAs_tymHGSkFAZx3-1Rh=z22ggBggz+3KnKA@mail.gmail.com>
Subject: Re: [PATCH v3 5/5] hw/char/pl011: check if UART is enabled before RX
 or TX operation
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: Evgeny Iakovlev <eiakovlev@linux.microsoft.com>, qemu-arm@nongnu.org, 
 qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-TUID: zSpvf7OfTi5o

On Mon, 23 Jan 2023 at 15:21, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.or=
g> wrote:
> pl011_can_receive() returns the number of bytes that pl011_receive() can
> accept, pl011_can_transmit() returns a boolean.
>
> I was thinking of:
>
> -- >8 --
> diff --git a/hw/char/pl011.c b/hw/char/pl011.c
> index dd20b76609..ea5769a31c 100644
> --- a/hw/char/pl011.c
> +++ b/hw/char/pl011.c
> @@ -221,6 +221,11 @@ static inline bool pl011_can_transmit(PL011State *s)
>       return s->cr & PL011_CR_UARTEN && s->cr & PL011_CR_TXE;
>   }
>
> +static inline bool pl011_can_receive(PL011State *s)
> +{
> +    return s->cr & PL011_CR_UARTEN && s->cr & PL011_CR_RXE;
> +}
> +
>   static void pl011_write(void *opaque, hwaddr offset,
>                           uint64_t value, unsigned size)
>   {
> @@ -299,12 +304,12 @@ static void pl011_write(void *opaque, hwaddr offset=
,
>       }
>   }
>
> -static int pl011_can_receive(void *opaque)
> +static int pl011_receivable_bytes(void *opaque)
>   {
>       PL011State *s =3D (PL011State *)opaque;
>       int r;
>
> -    if (!(s->cr & PL011_CR_UARTEN) || !(s->cr & PL011_CR_RXE)) {
> +    if (!pl011_can_receive(s)) {
>           r =3D 0;
>       } else {
>           r =3D s->read_count < pl011_get_fifo_depth(s);
> @@ -459,7 +464,7 @@ static void pl011_realize(DeviceState *dev, Error
> **errp)
>   {
>       PL011State *s =3D PL011(dev);
>
> -    qemu_chr_fe_set_handlers(&s->chr, pl011_can_receive, pl011_receive,
> +    qemu_chr_fe_set_handlers(&s->chr, pl011_receivable_bytes,
> pl011_receive,
>                                pl011_event, NULL, s, NULL, true);
>   }
>
> ---
>
> with maybe a better name for pl011_receivable_bytes().

Our standard-ish name for the function you pass to
qemu_chr_fe_set_handlers() is either foo_can_receive
or foo_can_read, though. That is followed through in
the name of the function argument (fd_can_read),
its type (IOCanReadHandler), and the field it gets stored
in (CharBackend::chr_can_read). It's not a great convention
but at least it is a convention...

thanks
-- PMM
