Received: by 2002:a5d:6790:0:0:0:0:0 with SMTP id v16csp148342wru;
        Fri, 28 Jun 2019 16:15:28 -0700 (PDT)
X-Received: by 2002:ac2:5b05:: with SMTP id v5mr6173118lfn.38.1561763728038;
        Fri, 28 Jun 2019 16:15:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1561763728; cv=none;
        d=google.com; s=arc-20160816;
        b=TIZKO7/Yx6HGdo33CZpHr2w2P+uqYP0TlKJD7x7A2hqDx4Zzly0w/YIUOfrkmJqTCt
         XTAgxLWkPlgVadZzd8evKSuhgiE0fzWgyDjq2kPbbU72a1SLVfB/lNzuHILA9mBvZpv1
         A5lEaPAKPmAXFT8MD97sCY03KsJFkGT65J1kPPNgJnhaREAUMVAw/eitIsaOkKcU59fD
         NqcW0SdX/mSYYZcN+rVrI12RPO//cs6Cqfuw/pQOjAuLVW0wPSgp71ZmBGskSytmDG/9
         8T85W3wVQluSDW9AauPj8zx+fW5pCSEkDWJynpvacoCNlC08AMZx8okjDFi3oHK3NuM8
         K/Kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CvJ9SM/XPQnJs9PsEukEPdEpIalBIj+pe8+Z80hYcTo=;
        b=OBXH11Mrr6UMgdclYezkGo0LYzfP0o7JZv20lM9B411wBKCqmb5XLEK2JbeUFNbKBS
         biQg374W/41hO+yNsFU4b9pBy16JiAfQRGHojHPKkNgJZuvn1uRWy3NeUTy7yM/zRkDn
         VWgOh/wdH2a7lSCO6y/HkcHvDcsvRAKhlMByzE5nTcFe5JT/4DNgQeijBmZRTg9v1EpX
         DB4Cm0goLoV2PRLmFY6I4iXj8T4w8XS6rYQb9yxU29YibVsd4tQnpWiPbaWFJzsB2Rt0
         627zHoRqL1vnOc0m1jMswz6alRvbruhoykAy8wFQMMMR3v3OrOQnqjcKHHiuRjvEw6LD
         GHTw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=GopEczGO;
       spf=pass (google.com: domain of alistair23@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=alistair23@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <alistair23@gmail.com>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id r86sor2394057ljb.1.2019.06.28.16.15.27
        (Google Transport Security);
        Fri, 28 Jun 2019 16:15:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of alistair23@gmail.com designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=GopEczGO;
       spf=pass (google.com: domain of alistair23@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=alistair23@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=CvJ9SM/XPQnJs9PsEukEPdEpIalBIj+pe8+Z80hYcTo=;
        b=GopEczGOPHU8PNLXw63uiLaNi+MWMf9MIUFbHxC7EfVVTXltkno8QYSvsYSjd3vbPA
         0zecR9YpyVRnkNwxWn81c86J3TfugbrVZk5GTV99AvDJraz0NQUW+fU95W1UqStT4lHn
         s8sDuX/5bdKs0a04qj5aL4x+YJCF4YufmwBDnXEF8sIAJpZF8GLewXwNiEP6wS2hZMKj
         C3IYblTDr7QppnsU2Hwd7Mf255bjFSp8whuIHNSp3DEnsIT4xNWRrqRNw+voNOTGY4Gv
         0ODQPhTqtbeMPGQ3lzta8q91+Uvz7ksC1a5XnEoAuT0KBwwfOkCzTFhF5yVVEhqxrU98
         JGuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=CvJ9SM/XPQnJs9PsEukEPdEpIalBIj+pe8+Z80hYcTo=;
        b=c3x12eyC/J6BBxoWOHP9MgHIVJagiQZpGFy5jyfDUV6NunTy67UueIzV7WXWa1Kyc9
         Pl3CS+/sGczNn2w2z3egsp33DG+ZgF0Qtvh2+00rrTxdPzeNhYMfK6bjmHbX8z0n+O19
         uIOSGjAYOVNdEZEYPgAF3pjolobgdTWTs5On604osCH4YvM4QYRuChyzl65pSyESBq3J
         F3WSdk9xAXLfaUWqhs8Xao44kchf5ZY2IHRxuiiaZv7d19qbVQfwHI8452+Pf8lsBpE/
         6eJNZ/L6KBdutSlziwH+362DHmv3xfnxiTr0JiwxDzvHLgGMtLiJojWsSB0xw2W5miHk
         NLOg==
X-Gm-Message-State: APjAAAVZAsmGyOdtGpOKesFcATH44aZ/Mbj3brWVLu7ilNVOWx5/OgwQ
	2LX7JMR1I/g/+8im7fDxzq0yDu6bFv5pq0YreDs=
X-Google-Smtp-Source: APXvYqyQgpqNpnRwHb1B/5G1f/qO71wvgeECAZ1KpLmZ2sbR0sA0kTP/m02C59BaeJ90N9hS1MdXS6KWRubAqqR6rxA=
X-Received: by 2002:a2e:9188:: with SMTP id f8mr2061084ljg.33.1561763727703;
 Fri, 28 Jun 2019 16:15:27 -0700 (PDT)
MIME-Version: 1.0
References: <20190627202719.17739-1-philmd@redhat.com> <20190627202719.17739-26-philmd@redhat.com>
In-Reply-To: <20190627202719.17739-26-philmd@redhat.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 28 Jun 2019 16:12:27 -0700
Message-ID: <CAKmqyKMTa09ajWuxtDC9kh1Fi=EFw=CZWJk+8P+fATK89otUzg@mail.gmail.com>
Subject: Re: [Qemu-devel] [PATCH v5 25/28] hw/block/pflash_cfi02: Use chip
 erase time specified in the CFI table
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
X-TUID: WKABiRzlRM9L

On Thu, Jun 27, 2019 at 2:12 PM Philippe Mathieu-Daud=C3=A9
<philmd@redhat.com> wrote:
>
> From: Stephen Checkoway <stephen.checkoway@oberlin.edu>
>
> When erasing the chip, use the typical time specified in the CFI table
> rather than arbitrarily selecting 5 seconds.
>
> Since the currently unconfigurable value set in the table is 12, this
> means a chip erase takes 4096 ms so this isn't a big change in behavior.
>
> Signed-off-by: Stephen Checkoway <stephen.checkoway@oberlin.edu>
> Message-Id: <20190426162624.55977-11-stephen.checkoway@oberlin.edu>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
> TODO check not zero
> ---
>  hw/block/pflash_cfi02.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/hw/block/pflash_cfi02.c b/hw/block/pflash_cfi02.c
> index a3665da3b8..b2d37c33bb 100644
> --- a/hw/block/pflash_cfi02.c
> +++ b/hw/block/pflash_cfi02.c
> @@ -617,9 +617,9 @@ static void pflash_write(void *opaque, hwaddr offset,=
 uint64_t value,
>                  pflash_update(pfl, 0, pfl->chip_len);
>              }
>              set_dq7(pfl, 0x00);
> -            /* Let's wait 5 seconds before chip erase is done */
> +            /* Wait the time specified at CFI address 0x22. */
>              timer_mod(&pfl->timer, qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL)=
 +
> -                      (NANOSECONDS_PER_SECOND * 5));
> +                      (1ULL << pfl->cfi_table[0x22]) * SCALE_MS);
>              break;
>          case 0x30:
>              /* Sector erase */
> --
> 2.20.1
>
>
