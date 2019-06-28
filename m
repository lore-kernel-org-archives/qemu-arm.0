Received: by 2002:a5d:6790:0:0:0:0:0 with SMTP id v16csp143924wru;
        Fri, 28 Jun 2019 16:09:35 -0700 (PDT)
X-Received: by 2002:ac2:4243:: with SMTP id m3mr1187850lfl.9.1561763375185;
        Fri, 28 Jun 2019 16:09:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1561763375; cv=none;
        d=google.com; s=arc-20160816;
        b=CtyoxaLpTtIW3L0i5PqYoZcucRvY3HL1TLc4+6vhZJhkvgjUGFMfkdawcNcc89qFGB
         hHnuRSVOrr6lqVVX56uxo0sbRotAA/IePmShBthNT7pS0NyL3JHipvKCgbmPIoxFytIj
         3q9L4Xv1D0oBzekXnJgJVr4/wfWldykPlQtRu0h87Pxd7eWkLJ29gq7xXmgfj5/4I5AV
         dE3q25sZljuYW23/1sEyD61cRc2AB0HrkBsmuJlLhPFspROkUfZLCiwL+nASvqevEo+R
         urBJ0tEYrjLOdrOYDfZ7/hPk2fE4Fx7PxmH2DrC3YMVzlxwOUY5euHnjtonzPLRmSdlM
         dgvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=h2/dTWL6ISNSim50zDi1d2/iFcfImTlrQallHs/IJkY=;
        b=FiuNWRUD6/h/ve2GC0mTsVsg/MVrESmgQozoK1felvtQovTQC41zg703d4lxFJbMiB
         6dzzoPXSTbHK5q5JMenFgUjKFIBdQceMwriowWuOe3jRyYpflW2IGnnUFFuObcLJ1dhJ
         nOV/PRFgLNGsbej8cOJ2AxNiqGiIG2c8VjbwmMP6yWgBE89anHJGY84vlu9b4eD9uRux
         R01NcJzdZBoBdTqbH25LRbg9kJS0rLqiiCjThWU2C5Wr/CjrPKaPjTo7Ks6nsJg1d98H
         W4rEkbkBf/yEoIDdcd3pOP9jRdYFU1u6bcoku8+mZqF3UkneurrNDqQ7vu0c8phxgp7t
         NYYQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=gI2swTpc;
       spf=pass (google.com: domain of alistair23@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=alistair23@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <alistair23@gmail.com>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id s12sor2345503lje.40.2019.06.28.16.09.35
        (Google Transport Security);
        Fri, 28 Jun 2019 16:09:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of alistair23@gmail.com designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=gI2swTpc;
       spf=pass (google.com: domain of alistair23@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=alistair23@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=h2/dTWL6ISNSim50zDi1d2/iFcfImTlrQallHs/IJkY=;
        b=gI2swTpc3hpHP2744lFkH+eduPtr/Td66q5JyD7zgyqEsmJM4IllGt1QrwwXXPVDFN
         Y0YRwOu7ngUC0Eelvge3UEUZH/Sj6fOZ9pgaqdNkxvPF9574QkAc3Blmb+kPHcZ01CjF
         vZ4CmO5cR4/fLYOtEeIYw2YJ782vJAZ5XQ04vbNKfIpTPi++kdmAjXXK9Kfi0X/vLOjz
         zdyQLd+0T/5iPmEdq5CKN2jPJyrV7Qh1sjALw2BGo7+K83hHWu4bXRNzCmFNNRoASxJV
         bE4rwhYiuQY8gTXUTaUskdFvFvijwVrU72BfJx9RR+V9QzjIUFF8Dy/+27NcMLm4TzZW
         Z47g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=h2/dTWL6ISNSim50zDi1d2/iFcfImTlrQallHs/IJkY=;
        b=o2jfHWw+aBeZVGuwfeu0E+1nVR4/VmWj2k17aLpTvlntaNEvOkCJbmbuSh8KtuXzA1
         uhORFTsZwvRzM1FLVYcQ9H4dyHMxAnJzzYZ2RrEnOUhIGMtw8tF24vHjznz9B+gy5+aE
         MmvBJ34Cm26S/faAGUr8FSQYiqUXNfRQ3eayZ5MP2M5IzH28unwVqjmzvVTVl6Ug5iUt
         CZNLReFJkXOgBtixSl4p/9UYpY7KyK8EkU+yXYrNhrHnQOJReV7zFheijVzFum27+HGr
         FNBSLYav4l5n9y/f51xqZrNx6oxIbToxEI0C00Tyd13HKpcOWp0T4QpYGxuNQIvHAXR3
         eG1A==
X-Gm-Message-State: APjAAAU7Jys5HGwZk1TF43YcwyVjkx8De7idgbbVyQP9btc60aPlm/3Y
	Ijq7wSMCMiGb5YqKtO0iiG9HdcMbzq7eaWPjpdc=
X-Google-Smtp-Source: APXvYqySFBQsuNcgZ2v6yselz+Clb2qvATG/GmFcoxwGcq/5ti8AoRNHGmOuKDaNcGq9ZrCBVDBK1y+v4KCQrWgu7Xs=
X-Received: by 2002:a2e:9158:: with SMTP id q24mr7722760ljg.119.1561763374865;
 Fri, 28 Jun 2019 16:09:34 -0700 (PDT)
MIME-Version: 1.0
References: <20190627202719.17739-1-philmd@redhat.com> <20190627202719.17739-21-philmd@redhat.com>
In-Reply-To: <20190627202719.17739-21-philmd@redhat.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 28 Jun 2019 16:06:34 -0700
Message-ID: <CAKmqyKPCH3Qn=-0BQRBPYk4Ay8DgHvghtXpR93Tb-_JmfuQM1w@mail.gmail.com>
Subject: Re: [Qemu-devel] [PATCH v5 20/28] hw/block/pflash_cfi02: Split if() condition
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Cc: Stephen Checkoway <stephen.checkoway@oberlin.edu>, 
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>, Kevin Wolf <kwolf@redhat.com>, 
	Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>, 
	Qemu-block <qemu-block@nongnu.org>, Peter Maydell <peter.maydell@linaro.org>, 
	John Snow <jsnow@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Alistair Francis <alistair@alistair23.me>, Magnus Damm <magnus.damm@gmail.com>, 
	Markus Armbruster <armbru@redhat.com>, Max Reitz <mreitz@redhat.com>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Michael Walle <michael@walle.cc>, qemu-arm <qemu-arm@nongnu.org>, 
	"open list:New World" <qemu-ppc@nongnu.org>, Antony Pavlov <antonynpavlov@gmail.com>, 
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>, Jan Kiszka <jan.kiszka@web.de>, 
	Aurelien Jarno <aurelien@aurel32.net>, David Gibson <david@gibson.dropbear.id.au>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: NrxkewgQx+aL

On Thu, Jun 27, 2019 at 1:44 PM Philippe Mathieu-Daud=C3=A9
<philmd@redhat.com> wrote:
>
> Split the if() condition check and arrange the indentation to
> ease the review of the next patches. No logical change.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/block/pflash_cfi02.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/hw/block/pflash_cfi02.c b/hw/block/pflash_cfi02.c
> index a0d3bd60dc..08b2bc83cb 100644
> --- a/hw/block/pflash_cfi02.c
> +++ b/hw/block/pflash_cfi02.c
> @@ -309,8 +309,10 @@ static void pflash_write(void *opaque, hwaddr offset=
, uint64_t value,
>
>      trace_pflash_io_write(offset, width, width << 1, value, pfl->wcycle)=
;
>      cmd =3D value;
> -    if (pfl->cmd !=3D 0xA0 && cmd =3D=3D 0xF0) {
> -        goto reset_flash;
> +    if (pfl->cmd !=3D 0xA0) {
> +        if (cmd =3D=3D 0xF0) {
> +            goto reset_flash;
> +        }
>      }
>      offset &=3D pfl->chip_len - 1;
>
> --
> 2.20.1
>
>
