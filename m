Received: by 2002:a5d:6790:0:0:0:0:0 with SMTP id v16csp147628wru;
        Fri, 28 Jun 2019 16:14:25 -0700 (PDT)
X-Received: by 2002:a2e:81c4:: with SMTP id s4mr7486103ljg.182.1561763665799;
        Fri, 28 Jun 2019 16:14:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1561763665; cv=none;
        d=google.com; s=arc-20160816;
        b=f+98AL1aFnfw7QJacdnOGJ5tHE4KmeGDns/omJBv3GTZchlql4TUQiroRaymYXhmMO
         u2dzZ1Ii3SovXpGI1XyHEoVpEVYlwdnmHX4nBrU7z4RufxzPmvxrPXQbh7xkBZODjaI9
         x0R8PtD6Ory0mLMQvb8/RVHAewM8lX1IFsS8N8xn0LFRNSYAsZ3vHJU0f6PeVLM8c5ER
         eeydzKip2H1EjnoxMvy5teuKqp5DuuSDgqD2+fDfdDzyKtsBX0w33/ak6d1IcN1tPBQc
         ViUJu8rmKDU/kFw7ace0ASzhG/g4I/WYCJWFeJUrroEkA/10g1XQc/0jWFjiIAKx1OAd
         egqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OFYiZGdEWpMn5mcWhx0/gj3Tt6NSfmRqYvudeRA7Dbg=;
        b=QXrwnKvNbu9KKeUNgOnVrX/iamD937i1vl27FFm25dleQU1avSZ3EyaiuBK1Z84I8/
         r0KepSH98j+1DZjJgjEJ37eaHoxI9dQECujFr9uGUb8qXG5KzQPsg66uRRtS1KahHRm1
         n7Unpi+jRLsrpmY4jkb3kXSSqWC1k8G9ZbE8k9gSssxWMg4w2d+a444ngFj2tCwvov7W
         64jljI1aV3jlw5Bc7fjTsV32grg9iJJP4KYb4/pRUhmP/ee9Hh8lA7WnzizkO4CP4bym
         S1yG04EGAJP0+2bOf5ibsmM9FfM+pVTUzH/aDdkJYD+19FsY+ei84Wd/61HowPQGGzx3
         dq7A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=g8u0D9Pf;
       spf=pass (google.com: domain of alistair23@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=alistair23@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <alistair23@gmail.com>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id j1sor981508lfh.44.2019.06.28.16.14.25
        (Google Transport Security);
        Fri, 28 Jun 2019 16:14:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of alistair23@gmail.com designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=g8u0D9Pf;
       spf=pass (google.com: domain of alistair23@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=alistair23@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=OFYiZGdEWpMn5mcWhx0/gj3Tt6NSfmRqYvudeRA7Dbg=;
        b=g8u0D9Pf/votEBl6PIgGQmLwHbCIWyAB1w1HNbf+nOESbsN8k24maugqj08p6sTa9o
         StN2bHomc0T+ZKPD8XHuPrprzOUjfdsONtuTSZe5YbnBcrh2Qjmqu8xLkKxeC9yia5Sv
         lvHNKgMMXRZZDYf5rKKQ0kaRXgBtVJezXDt843izojLdYQ1IffEizey9xNKpEi4Jwh3H
         bc9uvg1C5vy9eXLplT0J8IaLojpQOwpWe3AIkgcpgdjnriI9bN8UGVHhFdxpxPr1chQT
         hOKSbR/ZNF+gWUyDMqKFTSyzKgnm8NCdiJqi3TX8RNIu6vHytwkQpbYh9f1+J05LPGI3
         z/eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=OFYiZGdEWpMn5mcWhx0/gj3Tt6NSfmRqYvudeRA7Dbg=;
        b=jrDkn0C4/WcVR32WCCZ+RiIJcHMFr9lAFKYLPSaNVLoYTEqNIUrYfPdRw8e5H8hFyD
         3wT+2VgON1c9MMB7dqqDTMgZl0KoCBL9CzwTZFUZJmnQkmApmVJcWoWcoRiSIhXA5p3U
         y7eUxCSxJN0ISVL0TWp7JFnMnC4HrnluxydPYX+U2XULnzlDpaXwUBiuyaWMOiWldQtI
         aolNhUL8cBiTDq3u/Q/Rj83EN7wsPVgkKuR0G9zVLsgNjggo64/pVEA6qEuueZFo6dmm
         ekoeXSEBl2/2jb+rIOJBsymLVEho9d0Zb+u9VVKi1EnsrDWbFG16icEfjpqYF+a0u5mx
         UEDg==
X-Gm-Message-State: APjAAAXLzDCdjq4B7MyKtQbTbNSfd1jf7s6xttDXVaOngqQ4QreLW7JV
	WT0HoCCpmcNjbLKOr9hcrncYvVANdjLWBrHZcms=
X-Google-Smtp-Source: APXvYqxqWbN0MY0ABDwMsnfRzLTGM1E8JYsVSDPAZfcrKFagoywTt0t0UQnLdYCnqov+aqiTxMtW+ifG9mKb6hkVJMo=
X-Received: by 2002:ac2:4990:: with SMTP id f16mr6018209lfl.93.1561763665453;
 Fri, 28 Jun 2019 16:14:25 -0700 (PDT)
MIME-Version: 1.0
References: <20190627202719.17739-1-philmd@redhat.com> <20190627202719.17739-23-philmd@redhat.com>
In-Reply-To: <20190627202719.17739-23-philmd@redhat.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 28 Jun 2019 16:11:24 -0700
Message-ID: <CAKmqyKP0fp+M-L62EJcy4=rZaWAHsv_RHm-8gJWyqJZni=4hag@mail.gmail.com>
Subject: Re: [Qemu-devel] [PATCH v5 22/28] hw/block/pflash_cfi02: Fix reset
 command not ignored during erase
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
X-TUID: MXv825DM5Ahp

On Thu, Jun 27, 2019 at 2:06 PM Philippe Mathieu-Daud=C3=A9
<philmd@redhat.com> wrote:
>
> From: Stephen Checkoway <stephen.checkoway@oberlin.edu>
>
> When the flash device is performing a chip erase, all commands are
> ignored. When it is performing a sector erase, only the erase suspend
> command is valid, which is currently not supported.
>
> In particular, the reset command should not cause the device to reset to
> read array mode while programming is on going.
>
> Signed-off-by: Stephen Checkoway <stephen.checkoway@oberlin.edu>
> Message-Id: <20190426162624.55977-8-stephen.checkoway@oberlin.edu>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/block/pflash_cfi02.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/hw/block/pflash_cfi02.c b/hw/block/pflash_cfi02.c
> index 13f76fa71d..39daa95833 100644
> --- a/hw/block/pflash_cfi02.c
> +++ b/hw/block/pflash_cfi02.c
> @@ -311,7 +311,8 @@ static void pflash_write(void *opaque, hwaddr offset,=
 uint64_t value,
>      trace_pflash_io_write(offset, width, width << 1, value, pfl->wcycle)=
;
>      cmd =3D value;
>      if (pfl->cmd !=3D 0xA0) {
> -        if (cmd =3D=3D 0xF0) {
> +        /* Reset does nothing during chip erase and sector erase. */
> +        if (cmd =3D=3D 0xF0 && pfl->cmd !=3D 0x10 && pfl->cmd !=3D 0x30)=
 {
>              if (pfl->wcycle =3D=3D WCYCLE_AUTOSELECT_CFI) {
>                  /* Return to autoselect mode. */
>                  pfl->wcycle =3D 3;
> --
> 2.20.1
>
>
