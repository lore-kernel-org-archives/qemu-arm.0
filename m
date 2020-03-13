Received: by 2002:a19:f015:0:0:0:0:0 with SMTP id p21csp2611397lfc;
        Fri, 13 Mar 2020 13:02:52 -0700 (PDT)
X-Received: by 2002:a67:7346:: with SMTP id o67mr8801617vsc.1.1584129771989;
        Fri, 13 Mar 2020 13:02:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584129771; cv=none;
        d=google.com; s=arc-20160816;
        b=t9zZTh7CZEa7VyGZpoM6smE2mS8dmDD4yQ3yqULnlgW523w3e0hILrrTlQT7CotbbJ
         24GTPd1gaFrxKcYNpfueggdVQz7Pxe9npmj9qyXJmy9EUmEnsNDf3mBmUqKlsIkfY00u
         tbV+TXIChNzi/CvE0W2dFjPWwNckM4k/1F4ksfSF5AjOZVdxfbe4AZ39RXidG+ssrI2S
         w8GdC2xeUY1PlXBZU39zRE2bqN3qoB1qpwwAzW5933Amjjd1qLu6PpzRjEX9I5OsisEE
         N4L6IsIFhABtm0PBUP41E/mX81k1Q4I4yZvrQ48PNy1YtMX+OFho/2wWOlGoc4R3IYOi
         El4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=EJAgTsZDjRWSNhnci3sJyFanyp6C7GxUwv+MDth0iHE=;
        b=bSuAYcBOt4O4B+IPyGMT2jKmGl0FiX2GGIATH6XVy2RsL0iUOYy8gh6aa0KBtuwXVK
         sBqoOF4DrtMFLmSBbOhi2Y/215ougkU+G5LAHbwk0WsMvMubIJ9h0iUDRH/xA9fPMBH+
         j9JwZSU8bpAEqGufDxgrT8QMxHCf5R4VufNuKKXvmW85m3txF45qCXTw2hjwfKaIqgKZ
         KynpQeAScV8Fnu3jIQv98tOiO6M354HGrFm70UxcrDXa0brvYmSbAZYGQr/jC8P3Jrf+
         iDP3KwuOb9K0FAz4OfZAQJ1m2gHPz3qmN0FYyq0SkL3CVKB1tGZBgy1JAgQ0+RkELsE6
         XJhA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=sGAmcWUm;
       spf=pass (google.com: domain of alistair23@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=alistair23@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <alistair23@gmail.com>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id 11sor5667441uat.66.2020.03.13.13.02.51
        (Google Transport Security);
        Fri, 13 Mar 2020 13:02:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of alistair23@gmail.com designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=sGAmcWUm;
       spf=pass (google.com: domain of alistair23@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=alistair23@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=EJAgTsZDjRWSNhnci3sJyFanyp6C7GxUwv+MDth0iHE=;
        b=sGAmcWUm8BbOrcmKzw4vSb1xCqcAcZjipuPT/3sBHqSO4YmYBDzfOUOPdGr5y/igRa
         MSUoC1q+vgazjAimYJLWQvIxkha9REl8zlrl2DRMZEBMn8IjFRqAMEjyGHuhA3Yf0s3l
         xIuMWgKBUyQHRhR8qDlXgeIJg2N7o6S1Pr+CP6890BwfQnX1FwB09QPR/TtHfaqzAXkS
         QHzbqniqjTsAr2MEtF2QBtH9+98Tdyao86eNZHDgYB3nEB6WZIvkYdkncu6r9vjmyxKl
         tCQrFlO3vbbJcidavgCvJ/Hvhd5361EZkQ27QVwlb+9SCeespw8qZNWH1CdbXhiaB5m0
         SVOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=EJAgTsZDjRWSNhnci3sJyFanyp6C7GxUwv+MDth0iHE=;
        b=nMj23SxsA07+mi1Hh3K3mi15f89A9YDTP9b1uEMNJPF1ZE7PqqTtYCWkz8gGnnmVyW
         BR/uUwZDybcHsTXZ2sCJaipv8YPIJHhGKqGbk6ucyyg0pXz981T0tHBo61F8QyTkKHPt
         L5XSxF/ucHxmtOV3cOOe3vF3ynAUasAu92xztRiteJAE5qX+A3KqgB7TkENd876fTU+u
         gX5UlmL6Gej0JAsB0Q6vJLRQBLNz3/mqnEGKB9geTYtg9EfrA2Zo0UgGjKbwuCgMNUBC
         UtXdoIjvrZL3IUdoe2BKKGqq059OzBtY1NZDmzfI+XKIE1WPPYBVbrj0mnccCnWlxYtf
         fpRw==
X-Gm-Message-State: ANhLgQ1QF5bHMGesameFwDsJKGNFY5am3jz2i1vc2qrs/nvnaNuwtzQ8
	MevqScG/5GpU4G89XVoBN4Y3fMU9TgXevTXlo2M=
X-Google-Smtp-Source: ADFU+vvEUrg39LheZyXUmZE5o0J7DoxQN3jWp8dSUG5l0jzhuZOou4gTrZuLwnwcOHLyoQQfCG1L11oHhmri8LbjnEI=
X-Received: by 2002:ab0:143:: with SMTP id 61mr9443992uak.85.1584129771516;
 Fri, 13 Mar 2020 13:02:51 -0700 (PDT)
MIME-Version: 1.0
References: <20200313183652.10258-1-philmd@redhat.com> <20200313183652.10258-10-philmd@redhat.com>
In-Reply-To: <20200313183652.10258-10-philmd@redhat.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 13 Mar 2020 13:02:25 -0700
Message-ID: <CAKmqyKMh07W06BqTC43hE3CsrkgJJHuP6K1dexqJ1XpSy2OCnQ@mail.gmail.com>
Subject: Re: [PATCH 09/14] exec: Drop redundant #ifdeffery
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>, Peter Maydell <peter.maydell@linaro.org>, 
	"open list:RISC-V" <qemu-riscv@nongnu.org>, Eduardo Habkost <ehabkost@redhat.com>, 
	Sagar Karandikar <sagark@eecs.berkeley.edu>, David Hildenbrand <david@redhat.com>, 
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, Cornelia Huck <cohuck@redhat.com>, 
	Laurent Vivier <laurent@vivier.eu>, qemu-s390x <qemu-s390x@nongnu.org>, 
	qemu-arm <qemu-arm@nongnu.org>, "open list:New World" <qemu-ppc@nongnu.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, Alistair Francis <Alistair.Francis@wdc.com>, 
	David Gibson <david@gibson.dropbear.id.au>, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Richard Henderson <rth@twiddle.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: jtmH3+7gRXoD

On Fri, Mar 13, 2020 at 11:38 AM Philippe Mathieu-Daud=C3=A9
<philmd@redhat.com> wrote:
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  exec.c | 4 ----
>  1 file changed, 4 deletions(-)
>
> diff --git a/exec.c b/exec.c
> index 7bc9828c5b..f258502966 100644
> --- a/exec.c
> +++ b/exec.c
> @@ -185,10 +185,6 @@ struct DirtyBitmapSnapshot {
>      unsigned long dirty[];
>  };
>
> -#endif
> -
> -#if !defined(CONFIG_USER_ONLY)
> -
>  static void phys_map_node_reserve(PhysPageMap *map, unsigned nodes)
>  {
>      static unsigned alloc_hint =3D 16;
> --
> 2.21.1
>
>
