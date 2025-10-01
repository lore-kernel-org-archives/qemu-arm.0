Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3585CCA470
	for <qemu-arm@archiver.kernel.org>; Wed,  1 Oct 2025 18:33:40 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v41dY-0002vR-Tn; Wed, 01 Oct 2025 14:33:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1v41dX-0002un-Ti
 for qemu-arm@nongnu.org; Wed, 01 Oct 2025 14:33:11 -0400
Received: from mail-qt1-x834.google.com ([2607:f8b0:4864:20::834])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1v41dN-0006cr-W0
 for qemu-arm@nongnu.org; Wed, 01 Oct 2025 14:33:11 -0400
Received: by mail-qt1-x834.google.com with SMTP id
 d75a77b69052e-4da37f6e64cso1623291cf.2
 for <qemu-arm@nongnu.org>; Wed, 01 Oct 2025 11:32:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1759343574; x=1759948374; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8BLdhhPzOm9WYYiR3AYxtCceHFtkQJLq069e7c9zdKg=;
 b=MGdiM190TvKefb+KJ8dDXX+T5IWQmsYk7/V+LtjpNu2JK+4ydgXRUsyQwgspPJao3f
 KFV/BFz5+UbUS82oIMUjSUwrSBr36myyBeva85v/WBoQO8UJFiqC7NtRE7hX6hbHYj4R
 u5pHlAJn5Mc/VxHcF0XdcT/86TYNfcfPgjK1aMoUqSHkNw62sECkx68DfVV9qGYvAHQt
 pP2XxB7DqRWDwjyK9V9qbeHWInxZH9KRa2yFfF13c/PkMuRbHKNleHSjaOrznNtrDpO7
 2ULqlLKjXqmxe4cShEh5/bAz6kI6OW84sFRo/LnlWS3n3ivKZkOiNgeB6BJsMIRVvBmc
 dRlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759343574; x=1759948374;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8BLdhhPzOm9WYYiR3AYxtCceHFtkQJLq069e7c9zdKg=;
 b=qFQ0eoZ2C5p9Y6SBmf2JWeeNmNk2UTVbJ/t/h58kMyka+4Zh+wDc7QYhfa4EM01oBp
 /ywbvpBt89F/rLiFLGsj3gJFdNzlnvJbz+UYvS+GQkRUxK5An8hzmo+ckOQJ6VfPKF78
 45T61QJwhKv5/AX5GzQehlH9PkgJelWPOGk7147SzulbXBq4Qktrgu4cWVLIMtNzCnHg
 blwmLnuO+PXGEX9wIKtslpzd5z+N3UFGjBoEdV7Jh3tXsMiZ+FYjiYf2uC3y0CSrJxn4
 Xr52G1oWLBXeiERtV9/OEvtgcjQFg0m8Aq8odd02RPcAZUwWYpFS3LcfQvhupnoe5uPD
 JVSQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWx7IDh/BiZ7Tw8jV/ozvDFvR3bVRE3I4FMFN/zmuk9gGD5obrIzG9bvUWdgks4/sACPKLHwcakfg==@nongnu.org
X-Gm-Message-State: AOJu0Ywz/M2iyFseWlhFVDzyOIU4v5Uy0prLNfPXTfXbmCxPVaxxeWU9
 MmowZgC4ECHAD3qi/aiVn86rPLdrrSYQxFtrfJUue28CyIAEQnGqkMy++nLMwELOjGBkypEF9PY
 KUO35vCdnALSdZn/w6a2eIt3u9boAlsA=
X-Gm-Gg: ASbGncsF8irzLcmyFwp6wNYQXMKDVIKWtjEoSge/KBVruNPth+BJOCz6zTrifD/UBPp
 BW/jXFxLeVFUWMEos5bTsys/1QCFhYf6vazVHjyLpyId7OVWAO1Nyx5W8DOPWBm7g18bwkZVl8c
 co7aSbMu0fB54b7YnR4qTsJ0H7oD7rabmIdYzMBsTUcYGiXaoa2Q4NSZ60l/9RVBl+c7FMuePMi
 qfIMaErorA0gbVQmaztv5RyPqnldq4jcwY9Mfd+cmEhYkUHMLPoko70FOsdUjbQ
X-Google-Smtp-Source: AGHT+IFsBmXy2J9WRNxp0JaObOPX9DT2ptDzZZ05M/aB4PdBNGH4bImA+qS2Y08oRRWuWuwW5nIIiatGjW2bKU0vXyc=
X-Received: by 2002:a05:622a:649:b0:4b5:f244:6661 with SMTP id
 d75a77b69052e-4e41c548224mr61160141cf.2.1759343573733; Wed, 01 Oct 2025
 11:32:53 -0700 (PDT)
MIME-Version: 1.0
References: <20251001170947.2769296-1-alex.bennee@linaro.org>
 <20251001170947.2769296-5-alex.bennee@linaro.org>
In-Reply-To: <20251001170947.2769296-5-alex.bennee@linaro.org>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Wed, 1 Oct 2025 22:32:42 +0400
X-Gm-Features: AS18NWD8GLVv_tG-ZUfE3AJQF97OKI7tzNMK5VIG4nsQOuhoO-dTb85CoKDAJt8
Message-ID: <CAJ+F1CKFxUDbx2ZG43Y8xMLkwxLs=3NWoX56khejGPRTB69o=Q@mail.gmail.com>
Subject: Re: [PATCH 4/7] tests/lcitool: drop 64 bit guests from i686 cross
 build
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-s390x@nongnu.org, 
 Peter Maydell <peter.maydell@linaro.org>,
 Gustavo Romero <gustavo.romero@linaro.org>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Thomas Huth <thuth@redhat.com>, BALATON Zoltan <balaton@eik.bme.hu>,
 qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::834;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-qt1-x834.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Wed, Oct 1, 2025 at 9:12=E2=80=AFPM Alex Benn=C3=A9e <alex.bennee@linaro=
.org> wrote:
>
> With only TCG available we can't support 64 bit guests on a 32 bit
> host.
>
> Fixes: 5c27baf9519 (docs/about/deprecated: Deprecate 32-bit x86 hosts for=
 system emulation)
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

> ---
>  tests/docker/dockerfiles/debian-i686-cross.docker | 2 +-
>  tests/lcitool/refresh                             | 2 --
>  2 files changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/tests/docker/dockerfiles/debian-i686-cross.docker b/tests/do=
cker/dockerfiles/debian-i686-cross.docker
> index 4e8b3a8293d..2998764065f 100644
> --- a/tests/docker/dockerfiles/debian-i686-cross.docker
> +++ b/tests/docker/dockerfiles/debian-i686-cross.docker
> @@ -178,7 +178,7 @@ ENV ABI "i686-linux-gnu"
>  ENV MESON_OPTS "--cross-file=3Di686-linux-gnu"
>  ENV RUST_TARGET "i686-unknown-linux-gnu"
>  ENV QEMU_CONFIGURE_OPTS --cross-prefix=3Di686-linux-gnu-
> -ENV DEF_TARGET_LIST x86_64-softmmu,x86_64-linux-user,i386-softmmu,i386-l=
inux-user
> +ENV DEF_TARGET_LIST i386-softmmu,i386-linux-user
>  # As a final step configure the user (if env is defined)
>  ARG USER
>  ARG UID
> diff --git a/tests/lcitool/refresh b/tests/lcitool/refresh
> index 645959318a3..185a47cebe6 100755
> --- a/tests/lcitool/refresh
> +++ b/tests/lcitool/refresh
> @@ -216,8 +216,6 @@ try:
>      generate_dockerfile("debian-i686-cross", "debian-13",
>                          cross=3D"i686",
>                          trailer=3Dcross_build("i686-linux-gnu-",
> -                                            "x86_64-softmmu,"
> -                                            "x86_64-linux-user,"
>                                              "i386-softmmu,i386-linux-use=
r"))
>
>      # mips no longer supported in debian-13
> --
> 2.47.3
>
>


--=20
Marc-Andr=C3=A9 Lureau

