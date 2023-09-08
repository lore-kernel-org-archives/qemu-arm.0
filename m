Received: by 2002:a17:906:bfc6:b0:9a1:fa4e:495e with SMTP id us6csp388916ejb;
        Fri, 8 Sep 2023 05:36:26 -0700 (PDT)
X-Received: by 2002:a05:6000:2:b0:317:636b:fcb1 with SMTP id h2-20020a056000000200b00317636bfcb1mr1494644wrx.27.1694176586603;
        Fri, 08 Sep 2023 05:36:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1694176586; cv=none;
        d=google.com; s=arc-20160816;
        b=ah7LcLmPO9HhwpvkPPXS+cO5HsxVppa9fVu4slGOE0GKRHU+q58wGIlQ1xX1alyFiM
         olbGkbcnGsWP6cMFdOuPoFy+1iOkKCd7luXTeJb40r/Pb92is9Rnd2ONzwToxiJP44rG
         DFvULOGSLLbG/9OUhSN0afbknE6OJYYH5Fy51RwR/P7UsUcEofKlGU0xkTR9NvubarW4
         GxZRNKvQqWDNfh6vCaWxWuSdU96A/xDBFi/u7xHYoWJYOT/Lic0oALPukPlSdRTGhAwK
         THAFwIrqlCHgY90SQ5BLP1Z4x9qUqlBTnBanGmSXFwd5wqcYvnzQCYhTFcaKb01VD/Lz
         K9sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fYf6mBkdML4msyU5d74DdDm3ybRNBr58noFQPx8fVrw=;
        fh=b2+HakDcbNfXrWYzXSjQ/3Qljfm+XE+MI/HYYzDDdmk=;
        b=M1YMmGsSpSvwTe2zqBf4uLQCnzKecNTnz/hmRkvzEHie7iGh9A+P7MZ6BMzizdVDot
         H67jqrbeZb924FZOT/PM1KYZEOy1F8TXgsV/iPdBJCw0aTnYBp8M2ZqMXGIEz1qFLyJF
         7zyNGhXN+b9dTuFrNfYKtIUKnW826F3tvu0BRzTGNoZo8kCpcbgGh4SKSJS1+Ko1jDZG
         6YZ6843a0PVk+pfjKQhD3dl2DFcAJz7wAl7M0DDwdLlVVyCABjg8nSQ04dhy+E2iLc+/
         s3NvEI1DKJVEQ1Qthy6E1a2AKp1Ob1/5a6nH2Ztl+1PQ+n5+mYyJTt3TM70dgbFflBM4
         4Bxg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=W1IATnG9;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id o29-20020adfa11d000000b0031ad6cfe314sor731433wro.5.2023.09.08.05.36.26
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 08 Sep 2023 05:36:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=W1IATnG9;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694176586; x=1694781386; darn=linaro.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fYf6mBkdML4msyU5d74DdDm3ybRNBr58noFQPx8fVrw=;
        b=W1IATnG9fDW94axOXLPvxL0WD1/KULZB3rHBP64c/Xk+wDuBcWCiA44NRUASCDqKup
         aIk2Wk3QNUmlyliVMHit428ZH9CBCgISfnmh6Ddx7KQtM3HggAB3WpzSCX33vEjjyDvX
         AFv3tGqmdXMLGu7dEQ3Qy8VDNB+vjxIfLBHnqUz+u0xNJHLGQYkLCTTjiC9ud11fYu1/
         sTYIGuFw1sndS3h9EGLOSebD5NnahtdPOLNzP8ruRPCq+L14Cu9uKC2Z2zu5ACvMbvsf
         bvAh8NoaszsNWCJ0XQeAn66Xq662vCgjHpDCSXzgC/3P6vjjr6+zM40/BuEl2qivxGbA
         J6HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694176586; x=1694781386;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fYf6mBkdML4msyU5d74DdDm3ybRNBr58noFQPx8fVrw=;
        b=SDdl/57ppAJSYuQJBwHN/psSYZjC42QghYNopOqWKbgr3fwoRz9cTilpRBsnAUsmXq
         I5ol3JqSW4qaGANUu/DA1y4hhEpAu2XGn8Z8R0ZCD1Yh6wbHTNfXDVC6Wp83W7Oiopze
         TWaimmih0Si73xGMoXMhi+L+4k4mj6aIighdDwWxx9w+NguiQlwHdRF5+gQQyvDCtHUV
         Gnuemogso7Pyexzqm0t+8BI7JS2bA/OySKIXxvEZa9MOztabSqAvnnKYzp25kYdzdOqX
         SE7C7mvqfzjEKxxaWG0hSZw3NaBRZo/3aBPgookyhDP70P61X3UjxZ3b6qzvjleRZ8uq
         tVGg==
X-Gm-Message-State: AOJu0YxlXEAPNzYh76XGKzpu6ONJ1p1/6Oy6u6UM8lrBDVjMv/eY8ZLQ
	gAT61SC2VEjW5xdMyXX9FKwYjnW3RDWX5k+b/oUv5HS4
X-Google-Smtp-Source: AGHT+IFcNmx2eIKfHhmHXyyDzlJCfhDlTsOHTKpPPY+4296MDZAFMNQQe260Bu7BLeJpiONHAnjSf5WrouwTr6XOWV4=
X-Received: by 2002:adf:a3ca:0:b0:31f:84cd:90c5 with SMTP id
 m10-20020adfa3ca000000b0031f84cd90c5mr270056wrb.10.1694176586206; Fri, 08 Sep
 2023 05:36:26 -0700 (PDT)
MIME-Version: 1.0
References: <20230904161235.84651-1-philmd@linaro.org> <20230904161235.84651-19-philmd@linaro.org>
In-Reply-To: <20230904161235.84651-19-philmd@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 8 Sep 2023 13:36:15 +0100
Message-ID: <CAFEAcA-rV+VtS=2nVPDuh=bhdoy3LKdzfXOtX_2Shb58i3fS6g@mail.gmail.com>
Subject: Re: [PATCH v2 18/22] semihosting/arm-compat: Clean up local variable shadowing
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org, qemu-block@nongnu.org, 
	qemu-arm@nongnu.org, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: ojE9sTWjSKMM

On Mon, 4 Sept 2023 at 17:15, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.or=
g> wrote:
>
> Fix:
>
>   semihosting/arm-compat-semi.c: In function =E2=80=98do_common_semihosti=
ng=E2=80=99:
>   semihosting/arm-compat-semi.c:379:13: warning: declaration of =E2=80=98=
ret=E2=80=99 shadows a previous local [-Wshadow=3Dlocal]
>     379 |         int ret, err =3D 0;
>         |             ^~~
>   semihosting/arm-compat-semi.c:370:14: note: shadowed declaration is her=
e
>     370 |     uint32_t ret;
>         |              ^~~
>   semihosting/arm-compat-semi.c:682:27: warning: declaration of =E2=80=98=
ret=E2=80=99 shadows a previous local [-Wshadow=3Dlocal]
>     682 |                 abi_ulong ret;
>         |                           ^~~
>   semihosting/arm-compat-semi.c:370:9: note: shadowed declaration is here
>     370 |     int ret;
>         |         ^~~
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> ---
>  semihosting/arm-compat-semi.c | 9 +++------
>  1 file changed, 3 insertions(+), 6 deletions(-)

If I'm reading the code correctly, the top level 'ret' variable
is only used by the SYS_EXIT case currently. So rather than
changing the type of it I think it would be better to remove
it and have a variable at tighter scope for SYS_EXIT. I
think that's easier to read than this kind of "single variable
used for multiple purposes at different places within a
long function".

> diff --git a/semihosting/arm-compat-semi.c b/semihosting/arm-compat-semi.=
c
> index 564fe17f75..85852a15b8 100644
> --- a/semihosting/arm-compat-semi.c
> +++ b/semihosting/arm-compat-semi.c
> @@ -367,7 +367,7 @@ void do_common_semihosting(CPUState *cs)
>      target_ulong ul_ret;
>      char * s;
>      int nr;
> -    uint32_t ret;
> +    int ret;
>      int64_t elapsed;
>
>      nr =3D common_semi_arg(cs, 0) & 0xffffffffU;
> @@ -376,7 +376,7 @@ void do_common_semihosting(CPUState *cs)
>      switch (nr) {
>      case TARGET_SYS_OPEN:
>      {
> -        int ret, err =3D 0;
> +        int err =3D 0;
>          int hostfd;
>
>          GET_ARG(0);
> @@ -679,14 +679,11 @@ void do_common_semihosting(CPUState *cs)
>               * allocate it using sbrk.
>               */
>              if (!ts->heap_limit) {
> -                abi_ulong ret;
> -
>                  ts->heap_base =3D do_brk(0);
>                  limit =3D ts->heap_base + COMMON_SEMI_HEAP_SIZE;
>                  /* Try a big heap, and reduce the size if that fails.  *=
/
>                  for (;;) {
> -                    ret =3D do_brk(limit);
> -                    if (ret >=3D limit) {
> +                    if (do_brk(limit) >=3D limit) {
>                          break;
>                      }
>                      limit =3D (ts->heap_base >> 1) + (limit >> 1);
> -

thanks
-- PMM
