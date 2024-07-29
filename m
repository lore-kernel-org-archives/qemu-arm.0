Received: by 2002:a17:504:5965:b0:1be9:327d:8ee3 with SMTP id xe5csp1861806njb;
        Mon, 29 Jul 2024 08:47:23 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU0TAK4cOcv667XT6mZ7x2dfrmqzeKyr2B4NaR2sVbYxl5NB3kxiCgIRHqQK+3gfknrlwZacRnnNCZLzC7DJPKPZkjsWxWq
X-Received: by 2002:a2e:2281:0:b0:2ec:617b:4757 with SMTP id 38308e7fff4ca-2f12ee074c2mr54026961fa.13.1722268042783;
        Mon, 29 Jul 2024 08:47:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1722268042; cv=none;
        d=google.com; s=arc-20160816;
        b=0BNDYXjJ+NEiOFnS+ot7jHsrbtuIQP3O+owfwGiwGJFXNai09oKhCvmbxx7qCsuIyv
         fHdjPmDVRhAB7IfcyKWDpUkZBG0BU5VImv5vHiwHtlgd3GEAqGho2hacf/+SuDV4yDsV
         IAfPX/limfdNfbv/z6ir8at8Afd+QTwLDivlsYmdr4nqekuFLoJKjeKym2kXNlwhFvDJ
         MPvH8ieztMGEp9/RqRbS2DwL2SukV+rS+6Y8muZ1PDxDP4CsohtvhvS3nqIunEc7XBaL
         8x4YI84WHaqVnkb3JriQ29GhrepUiqRfjyGlgkFdysjtmNl/ePB4b/BT47fT2st1NG/2
         gKxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9mSjDKWTBAXsg4nDAEN2Cn2dlEzXIiayBQvxoWLB0AM=;
        fh=NlbfhxNoPLNvPpQUAr3zs0Db/zd3MwSga/9WWnAanmU=;
        b=E3O9QbCA5CsMv7ZwzUWuCuaRxVUy0rLxuZA+OL5aM3YrbCEq0kMzuR9IzvhfKV3yyb
         lKaN+cOgdqtaAFVaDWocBJL8CKT517YSiDYgCFsho7QlIDiOgbOj0c0JUmF+u2QjcZOk
         VqOYIpixKsPWDFqoRoV7BKplCreL2JuDorzm+9uB/7GWTUs0gwul0cfS2TZj3RR74e0B
         iLZA5TT6yCEmgUjejZA+w1pJXcvOoXcfTJBerY9FC4WxFGE1S/OS8t0eyO6JsVO8W5nY
         AcGu99cXTuFZU3cXj7T++Dv9lNH6oayBtvZad9cQrijw1IBbeOe559GHVqYQd8nNQwCb
         LMMg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Hpmryg4h;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 4fb4d7f45d1cf-5ac69687285sor1756786a12.12.2024.07.29.08.47.22
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 29 Jul 2024 08:47:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Hpmryg4h;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722268042; x=1722872842; darn=linaro.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9mSjDKWTBAXsg4nDAEN2Cn2dlEzXIiayBQvxoWLB0AM=;
        b=Hpmryg4huAJecNH/kitOELT5SjMtzfwQPRLPNGOYoyT5N7uEvOWIMCA2mPeKMFdtgP
         fWxNefnOPticLtpsAnXOOIlvLN9WDV5UXdblwua284flgU9MOt0SQpd8t5GZXmgOhrSr
         HjqbS53tZ/g2jKYomlauA1QHQBjmVFQV88gyopjtGTtxXI4AlK5C134p8F3ibIMqg2vN
         EhK9IA/SRisogidY/EAbHXzQ4vQ1Z+WokVzE53h1hXdQCk9YBK+Kk5wRx4ZrjhqUovH7
         QWaNyKIfncADAUWo24F4NLDrlxG1Ien63+yvvBwtf0uHI8rv39VKA/hu/LUgwui1JTyj
         awnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722268042; x=1722872842;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9mSjDKWTBAXsg4nDAEN2Cn2dlEzXIiayBQvxoWLB0AM=;
        b=kAdNsLUS3tTUZfF8gLWEMFSZLBNm1NAimYzDOdznFrgKffQFgKVQH6vO69nEglSmIQ
         +DywFQHCv8NXrdiIxTfVy5Fm8HE9f+pkSrDx3gSV4d7jxL2rb5XZkRNR+DV65b750Y8X
         9KvXo0pBCYl9tIZUhlSJylAvM05jgBWIWNl01Skf6eORbZbRkgb4149swpElL1qFcz2q
         adRKru1Oe2k1zdm64E4E439QIFdF5TlqhfZQGrUIf62jPwrijcHc+jmD93gTGSmGOntv
         shYkQAL2HcVhuWEw/jBteA5RohUyik7IP5BtHpSLi7VG/AJk8JZlt3ALfelMZzNWUBRR
         Tj/g==
X-Forwarded-Encrypted: i=1; AJvYcCWrdG5BcsKXm0fZGRz+zA1F30ijLm5GCASNghxImnqST70bsBbcCt0AtmVyJrtkH7beL1NB9IiUYMNKjXs2DORM7iKYkrtF
X-Gm-Message-State: AOJu0YzkNVHu1uu4ggerAnVKJW8JeYReINM7kOHrUwCByVHDeuVWcV+Y
	71CEBi+VPy+moJOL/0xMP0ncySSMIL4jdWs7iF0Dae+u5qydS0D5dl8rTJHsrTE69+tOFJp9oGP
	wEQXjivJRgV6Hma9hXORUFZZMYAQrwOEw/evKAYdl
X-Google-Smtp-Source: AGHT+IHrQ3q44hntbezR2QNgC4BIjAWOsZs4/iZHgXzGbusu3StZZEsd/yQ/VbsgQQsXiApFds3Kb4wTjJkIdcCejhQ=
X-Received: by 2002:a50:8759:0:b0:5a1:5fd9:5fb7 with SMTP id
 4fb4d7f45d1cf-5b0221f0a72mr4781668a12.33.1722268042098; Mon, 29 Jul 2024
 08:47:22 -0700 (PDT)
MIME-Version: 1.0
References: <20240719181041.49545-1-philmd@linaro.org> <20240719181041.49545-10-philmd@linaro.org>
In-Reply-To: <20240719181041.49545-10-philmd@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 29 Jul 2024 16:47:11 +0100
Message-ID: <CAFEAcA9QA3Kn3h_bwMSoht7KZa8DOpMXFDUWon1kc+iHy59-EQ@mail.gmail.com>
Subject: Re: [PATCH v5 09/16] tests/qtest: Update tests using PL011 UART
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, qemu-arm@nongnu.org, 
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, Tong Ho <tong.ho@amd.com>, 
	Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: 7hhOAn+jyUM3

On Fri, 19 Jul 2024 at 19:11, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.or=
g> wrote:
>
> We weren't enabling the PL011 TX UART before using it
> on the raspi and virt machines. Update the ASM code
> prefixing:
>
>   *UART_CTRL =3D UART_ENABLE | TX_ENABLE;
>
> to:
>
>   while (true) {
>       *UART_DATA =3D 'T';
>   }
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> ---
>  tests/qtest/boot-serial-test.c | 15 ++++++++++-----
>  1 file changed, 10 insertions(+), 5 deletions(-)
>
> diff --git a/tests/qtest/boot-serial-test.c b/tests/qtest/boot-serial-tes=
t.c
> index 3b92fa5d50..5cb309ccf0 100644
> --- a/tests/qtest/boot-serial-test.c
> +++ b/tests/qtest/boot-serial-test.c
> @@ -70,18 +70,23 @@ static const uint8_t kernel_plml605[] =3D {
>  };
>
>  static const uint8_t bios_raspi2[] =3D {
> -    0x08, 0x30, 0x9f, 0xe5,                 /* ldr   r3,[pc,#8]    Get b=
ase */
> +    0x10, 0x30, 0x9f, 0xe5,                 /* ldr     r3,[pc,#8]    Get=
 base */

The instruction bytes have changed but the disassembly comment has not...

> +    0x10, 0x20, 0x9f, 0xe5,                 /* ldr     r2,[pc,#8]    Get=
 CR */
> +    0xb0, 0x23, 0xc3, 0xe1,                 /* strh    r2,[r3, #48]  Set=
 CR */
>      0x54, 0x20, 0xa0, 0xe3,                 /* mov     r2,#'T' */
> -    0x00, 0x20, 0xc3, 0xe5,                 /* strb    r2,[r3] */
> -    0xfb, 0xff, 0xff, 0xea,                 /* b       loop */
> +    0x00, 0x20, 0xc3, 0xe5,                 /* strb    r2,[r3]       loo=
p: */

This placement of the "loop:" label is odd -- usually the label
goes before the instruction that a branch to the label will
start executing at.

> +    0xfd, 0xff, 0xff, 0xea,                 /* b       loop */

Here also the bytes changed but not the disassembly. Since
'b' is a relative branch, why does the offset change?

>      0x00, 0x10, 0x20, 0x3f,                 /* 0x3f201000 =3D UART0 base=
 addr */
> +    0x01, 0x01, 0x00, 0x00,                 /* 0x101      =3D CR UARTEN|=
TXE */
>  };
>
>  static const uint8_t kernel_aarch64[] =3D {
> -    0x81, 0x0a, 0x80, 0x52,                 /* mov     w1, #0x54 */
>      0x02, 0x20, 0xa1, 0xd2,                 /* mov     x2, #0x9000000 */
> +    0x21, 0x20, 0x80, 0x52,                 /* mov     w1, #0x101 */
> +    0x41, 0x60, 0x00, 0x79,                 /* strh    w1, [x2, #48] */
> +    0x81, 0x0a, 0x80, 0x52,                 /* mov     w1, #0x54 */
>      0x41, 0x00, 0x00, 0x39,                 /* strb    w1, [x2] */
> -    0xfd, 0xff, 0xff, 0x17,                 /* b       -12 (loop) */
> +    0xff, 0xff, 0xff, 0x17,                 /* b       -4 (loop) */

Another unexplained offset change here.

>  };
>
>  static const uint8_t kernel_nrf51[] =3D {
> --
> 2.41.0

thanks
-- PMM
