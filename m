Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4C50D44C51
	for <qemu-arm@archiver.kernel.org>; Thu, 15 Jan 2026 14:43:26 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vgOZ9-0001w3-Jj; Thu, 15 Jan 2026 09:43:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vgOZ8-0001rY-OA
 for qemu-arm@nongnu.org; Thu, 15 Jan 2026 09:43:14 -0500
Received: from mail-yw1-x1130.google.com ([2607:f8b0:4864:20::1130])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vgOZ7-0000s9-9k
 for qemu-arm@nongnu.org; Thu, 15 Jan 2026 09:43:14 -0500
Received: by mail-yw1-x1130.google.com with SMTP id
 00721157ae682-78d6a3c3b77so23492367b3.0
 for <qemu-arm@nongnu.org>; Thu, 15 Jan 2026 06:43:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1768488191; x=1769092991; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yGYX73FexNOZzJXnqTQjYpmSrqQbh8LUca7FoXltfRE=;
 b=ge0sG5Awg/OXBNAWbXj3geU5C8+wRNhVNZOokG3DTz5qE/jHr+Vbs07lSA4w36B4b2
 jG9YaeZq3idbvZFefqxzq8T5K/M3Skx47lEnZHdisyQOvT6NyFj65rrDoCjMk6Y/OCTt
 87qV/dQLlX1xz6VEq/oYZTwipXoLvAdrjKwSN0qjU4k97icz5IetKnqDWtc++pJt2aZk
 oRu5M03zFsafAGpgTRIYJUGhAnYgHcG1VkYUQUIKDbdpnKI/qcjZeI1vDWjYIG0qzJqD
 j77dfPA0iDkPP1xn82g9KvUcuU1ZFtw3fGUyU1SfOKL7ATQFPC3Z8dnKPDVjHhFdeANK
 +13A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768488191; x=1769092991;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=yGYX73FexNOZzJXnqTQjYpmSrqQbh8LUca7FoXltfRE=;
 b=dvdahNHZWlsYacGHqGGkv/u+Md91sRuKGtLASU3mj7bUs5fY9Lk0vUDIcEZ+7asFft
 ZlPO/kklAO0E9R3R2rTyboa59rH20VhZ9n7aXthYHbU6cBmscjok2+F05S6ttMAHQneN
 Owaco76gBtZ1q8kkFjF2vP22dYY3Ft9DIvodiwya7EeI7nasf5yfFuEKKgbR9Yl9XfeI
 c14LU5cDtmfdu7F3PpK3YlEzgvqRmmehVqMFLKrgmoYxNRHXNRi9XWgsLPFxQbouNoU4
 ZUxaCDAUDa2IG+972O/Z40YAfSBIlEtBk5LI/29WOoL7476bZbpVUEpuhiHz6TGKraEY
 ojFQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVeg4Y3GkheRaVa63w6humMdZ3S0uencqnlZ+mpmvgfrCB0Y/rTjGl8P2aAct/+CHr9JQ8tKnsbvg==@nongnu.org
X-Gm-Message-State: AOJu0YyxYe/IEkv3ohjjgbXJFb2vZew2f1fD3PzadU9zUmR/ANOjgGV1
 EF7+wAcovEptkEh0i5HbSfUzLJL7EeGmgpSLGisuO/3JWzOj1boodjhBio9YX54oE7qmjU1u1YU
 NjD07rcweZC0JCP1sKvb39tds4lNm6DO3HZlHdP+Ahw==
X-Gm-Gg: AY/fxX73tcQCgkshAUZN0c9DofshLZBWbxAgbij3bG5qcPex9dw7g9KOrf4aIhjSYIN
 puxCAyzYs5G3sdeiSgEztyZgkwYtQwfI/CzNKYywpCqQxTLJmEsxvQJKnhTiyTtssfJAxVWPzbf
 blEkWyguB9CCJoLgmGaoWALBIZCXSzoe2Fq0caHoka4taAjaox9NKSAHvohHUzKHFuQW3Eh7LHy
 JMW52mdNoWW7cAXFuxr/Jt19h1XyzSXTJEgZG+WHTt5znIN0bInYhWVYYeK9aCc0yIlTt8PFXk7
 rUnOnxB3nkKYIclS6ZVJjXo=
X-Received: by 2002:a05:690e:134b:b0:644:5317:4bd1 with SMTP id
 956f58d0204a3-6490a608ffbmr2271918d50.9.1768488191269; Thu, 15 Jan 2026
 06:43:11 -0800 (PST)
MIME-Version: 1.0
References: <20251204093502.50582-1-corvin.koehne@gmail.com>
 <20251204093502.50582-12-corvin.koehne@gmail.com>
In-Reply-To: <20251204093502.50582-12-corvin.koehne@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 15 Jan 2026 14:43:00 +0000
X-Gm-Features: AZwV_QhU-36j7qQeSvQxqeU3zKHVzKRM4P04LJxfIOFXxOo0WCI_KbEFCdCsdOk
Message-ID: <CAFEAcA9pELkMfgcB-0WSjy2gf4T=Pn38pPRfd3wz7K0MYQHYVQ@mail.gmail.com>
Subject: Re: [PATCH v5 11/15] hw/block/m25p80: Add HAS_SR_TB flag for
 is25lp016d
To: =?UTF-8?Q?Corvin_K=C3=B6hne?= <corvin.koehne@gmail.com>
Cc: qemu-devel@nongnu.org, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Alistair Francis <alistair@alistair23.me>,
 qemu-arm@nongnu.org, 
 Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org, 
 =?UTF-8?Q?Corvin_K=C3=B6hne?= <c.koehne@beckhoff.com>, 
 Hanna Reitz <hreitz@redhat.com>,
 =?UTF-8?Q?Yannick_Vo=C3=9Fen?= <y.vossen@beckhoff.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::1130;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1130.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Thu, 4 Dec 2025 at 09:35, Corvin K=C3=B6hne <corvin.koehne@gmail.com> wr=
ote:
>
> From: YannickV <Y.Vossen@beckhoff.com>
>
> The is25lp016d has 4 Block Write Protect Bits. BP3 specifies
> whether the upper or lower range should be protected. Therefore,
> we add the HAS_SR_TB flag to the is25lp016d flags.
>
> Signed-off-by: YannickV <Y.Vossen@beckhoff.com>
> ---
>  hw/block/m25p80.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/hw/block/m25p80.c b/hw/block/m25p80.c
> index a5336d92ff..1df223ee81 100644
> --- a/hw/block/m25p80.c
> +++ b/hw/block/m25p80.c
> @@ -217,7 +217,8 @@ static const FlashPartInfo known_devices[] =3D {
>      /* ISSI */
>      { INFO("is25lq040b",  0x9d4013,      0,  64 << 10,   8, ER_4K) },
>      { INFO("is25lp080d",  0x9d6014,      0,  64 << 10,  16, ER_4K) },
> -    { INFO("is25lp016d",  0x9d6015,      0,  64 << 10,  32, ER_4K) },
> +    { INFO("is25lp016d",  0x9d6015,      0,  64 << 10,  32,
> +           ER_4K | HAS_SR_TB) },
>      { INFO("is25lp032",   0x9d6016,      0,  64 << 10,  64, ER_4K) },
>      { INFO("is25lp064",   0x9d6017,      0,  64 << 10, 128, ER_4K) },
>      { INFO("is25lp128",   0x9d6018,      0,  64 << 10, 256, ER_4K) },
> --
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

