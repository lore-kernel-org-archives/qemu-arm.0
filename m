Received: by 2002:a5d:6790:0:0:0:0:0 with SMTP id v16csp2651770wru;
        Fri, 28 Jun 2019 08:59:30 -0700 (PDT)
X-Received: by 2002:ac2:54a6:: with SMTP id w6mr5376499lfk.108.1561737570425;
        Fri, 28 Jun 2019 08:59:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1561737570; cv=none;
        d=google.com; s=arc-20160816;
        b=H8snfl4LqOq73JzcNOxSqM7Igq0+NErVsJ2pxMeyxWwFByLDfc+EhLGJgudGakGLS/
         MnFAmrmYLjxMbwRfNGw7MKlQbfhbn1iSAqwTeztEKSAuVmDYmLz35upP0wcsoy4FQpV/
         TJpJLlufH/FIOIpfCZxCXA3R9K59ncxfd/eTG3xk9g5lQKD/vrJbhEPHTl2VArNiz/70
         5aZ9jmjbDWH8TXcP71aeV6oO02fVTnTBuTDZPueW0Y3daoy1iYNH20iRNyA0NLh28+qk
         ubCEiQhcCgBnRWaauClbnhGv+TJYSlZBg5jsf0mZgsxx70IqjGTWakeEyY0NG03bBQ45
         aSfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7cUWX/ZieAKkgIsDyf9qkme3Oof2TM034f9jO2yRigU=;
        b=iwb/6Psqri9g2FDJLnt5u2ZEG9x/L2fYbD5GyEUgNgcZcXrKafeWmgmalOp4CkhhSA
         ClLs7fFhkhSkpu2T4ZfV9I8QZrZbpqWcH+8HxpcS+czjvgc+yaWgi4o93R21th6G67FX
         QFLRVCoEgnG6q4zVni8eYbuPfyLwaxEs1fgTVM/YQEJnMMDDZhmfQrNccC8rQVLNY5Zh
         COaLMdGCzSwMpc+wpzgH8j4Qsq/KKBw42y97bMjMYk72i5gwCv69P8SpmcnUEFArKQr2
         rmqeu6hCSYf3bJTjvqtErMWx02wLI3o50dxe7ZY9IHEz+Su4M8Ruqx29cXwbwBYWFUKl
         mpTg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=qLRHcj2K;
       spf=pass (google.com: domain of alistair23@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=alistair23@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <alistair23@gmail.com>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id o1sor1789369ljc.33.2019.06.28.08.59.30
        (Google Transport Security);
        Fri, 28 Jun 2019 08:59:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of alistair23@gmail.com designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=qLRHcj2K;
       spf=pass (google.com: domain of alistair23@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=alistair23@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=7cUWX/ZieAKkgIsDyf9qkme3Oof2TM034f9jO2yRigU=;
        b=qLRHcj2K10tqhKf9aBRDi4ZXEqS9XN26m73UxY6wB1RPKk6CEdlMOtfIuLmvMkpvfO
         BVGMCdrvxzSrhCJP+LSWqPF1q2/7fGKeVX8wdUKLuTvmF2y/WEYhbLW89pdSG8p9hA7n
         u3+f6zWP5x83UyE6AF/sNXq3HHRZKlU3hcqATj2+rXNXrG+iOam1MylFzIj88OvcN/44
         D+c5L+IhHYTodHrCFGJU3F+Cths63CAfnGhEVPT7ncP3IfN9087SHDxji2okcl8Boibk
         flsDC9bvLBo0KIfVF8rveXYol5DPMCgCmvB87VE+IRUpCljIMKofL3qGb0Cf6sf8Yv5m
         JqZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=7cUWX/ZieAKkgIsDyf9qkme3Oof2TM034f9jO2yRigU=;
        b=e1lgI5T/1NF08verpTxt/GbzncItqrRHAhiKc6ew/BI7N5gtlScug903B22Poh5Wfa
         nXgUZPh84QhqesP7V+hvEyMYbs/fUQVeHU6K/Y+SCNOp5qQ+GpaWBQlUMDEK4onBCmDg
         w/TVPc/j/O5wcuQt5Wa2tus7vth0b2nQ7REtzWk3AqrAZIyeE13Gew1tc+uNY+8CshIq
         oFJ4FaBtpBgImuKYNjgEA5ku2TuGHIslaDY9QnpKdR4TjVD8iO9zrzwDMHzbDzTrLcOT
         w3x0rDcxAY7au6AqRuUv9n/IR7ZL3KNAlDZM/FAlJueiZOWS6sY2sTU9wtVKwFFyk4rF
         xfng==
X-Gm-Message-State: APjAAAXGIUySwNIKxleMyVwHaHvpX1Z91TwZfU/oFpxHfKv2xenW6H4L
	MYJs0+MS8MkhO10OL7mfI6hKYNtJxomS3Qdtyig=
X-Google-Smtp-Source: APXvYqzQvjbcLxYrrCCskCm6IVc7U45KkUWqxa3fcWEbLHtIfDsCU2p/J50N9QefW1EpEjyLSL0bv+hSbx0UmITR+yo=
X-Received: by 2002:a2e:480a:: with SMTP id v10mr6393865lja.94.1561737570112;
 Fri, 28 Jun 2019 08:59:30 -0700 (PDT)
MIME-Version: 1.0
References: <20190627202719.17739-1-philmd@redhat.com> <20190627202719.17739-6-philmd@redhat.com>
In-Reply-To: <20190627202719.17739-6-philmd@redhat.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 28 Jun 2019 08:56:29 -0700
Message-ID: <CAKmqyKNWXhv6TVyv5AtHw9JPqLmMyk7w6JJFELs5C20Xt4fEQQ@mail.gmail.com>
Subject: Re: [Qemu-devel] [PATCH v5 05/28] hw/block/pflash_cfi02: Add an enum
 to define the write cycles
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
X-TUID: 85pSjfa8McYu

On Thu, Jun 27, 2019 at 1:44 PM Philippe Mathieu-Daud=C3=A9
<philmd@redhat.com> wrote:
>
> No change in functionality is intended with this commit.
>
> Signed-off-by: Stephen Checkoway <stephen.checkoway@oberlin.edu>
> Message-Id: <20190426162624.55977-3-stephen.checkoway@oberlin.edu>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> Tested-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> [PMD: Extracted from bigger patch]
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/block/pflash_cfi02.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
>
> diff --git a/hw/block/pflash_cfi02.c b/hw/block/pflash_cfi02.c
> index 43796e551a..303d225f23 100644
> --- a/hw/block/pflash_cfi02.c
> +++ b/hw/block/pflash_cfi02.c
> @@ -57,6 +57,11 @@ do {                                                  =
     \
>
>  #define PFLASH_LAZY_ROMD_THRESHOLD 42
>
> +/* Special write cycles for CFI queries. */
> +enum {
> +    WCYCLE_CFI              =3D 7,
> +};
> +
>  struct PFlashCFI02 {
>      /*< private >*/
>      SysBusDevice parent_obj;
> @@ -286,7 +291,7 @@ static void pflash_write(PFlashCFI02 *pfl, hwaddr off=
set,
>          if (boff =3D=3D 0x55 && cmd =3D=3D 0x98) {
>          enter_CFI_mode:
>              /* Enter CFI query mode */
> -            pfl->wcycle =3D 7;
> +            pfl->wcycle =3D WCYCLE_CFI;
>              pfl->cmd =3D 0x98;
>              return;
>          }
> @@ -458,7 +463,8 @@ static void pflash_write(PFlashCFI02 *pfl, hwaddr off=
set,
>              goto reset_flash;
>          }
>          break;
> -    case 7: /* Special value for CFI queries */
> +    /* Special values for CFI queries */
> +    case WCYCLE_CFI:
>          DPRINTF("%s: invalid write in CFI query mode\n", __func__);
>          goto reset_flash;
>      default:
> --
> 2.20.1
>
>
