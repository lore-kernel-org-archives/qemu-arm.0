Received: by 2002:a5d:6790:0:0:0:0:0 with SMTP id v16csp2658992wru;
        Fri, 28 Jun 2019 09:06:07 -0700 (PDT)
X-Received: by 2002:ac2:41d7:: with SMTP id d23mr5364999lfi.118.1561737967753;
        Fri, 28 Jun 2019 09:06:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1561737967; cv=none;
        d=google.com; s=arc-20160816;
        b=dr+jicf3JASLRwE3IwRxfJU/K3djd65+OgwdgQYLYD38rocN3Q9TZcOQ3P+9WdwSJf
         OJw/Q8O2xQXgKq7K94gGKMgk8VSxOhc17mpGyWNk7CVkPbw0ZY0NaiQk9M088bPbzGIW
         XmiCQhZhMFjg8BodGGHdi/lmKKpxSeE24T6HrefuGTuDplJHMx3ciKVDr++7gMsb+o5l
         mU4178+fxPKK65xYKOdcQ5XEIWZFW6BUdwPTZ81LBtucEdAGRBQTZo5x3gpJOOHqj6AR
         q/h+zOCRuCkDmbcTJaMKQS3+kQ40HLslBWUsch9zD8wk6UkDbLd1CxYIH+eikfY9GXza
         Z3Gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8jFMOYmI7QdV5FMGFGU2VKnMJYWvON7mqPy5EHHdbJE=;
        b=tSCuySyrCDX/WoBoAD3o+WqIO9w8zlYmLSXQB7tQfUrmEhK6xFxbOTD0com7E1Vqnf
         buyJN23XvtnBOCv8NSjejhL5KJg4wKHax2+TmK3JRVH9e5+lezhQxcWwfrM/FPjAbBH1
         /mXi/f1z2xYWPHMZAf/rc4/5OIqU60lqe7emfadujp5POnev1g8XppfDm9VqyJ5yOodt
         yiyup7GQZLttG+BvZ8kNUNtO5LLMm+hoZ9VAH0wbCCSX2D+5NUVq1oDS31lW6ioKl1Wp
         DSILuDWCQ6nt81D02zAB43dNvdAMO3XETta4Sw2GmJz99VTus+ArcU/H9RC9ThK6YWGI
         YYrA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=Cc1KhUaL;
       spf=pass (google.com: domain of alistair23@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=alistair23@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <alistair23@gmail.com>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id r26sor1792863lji.45.2019.06.28.09.06.07
        (Google Transport Security);
        Fri, 28 Jun 2019 09:06:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of alistair23@gmail.com designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=Cc1KhUaL;
       spf=pass (google.com: domain of alistair23@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=alistair23@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=8jFMOYmI7QdV5FMGFGU2VKnMJYWvON7mqPy5EHHdbJE=;
        b=Cc1KhUaLoNoVpgt7g2iuKt73ZsttB5Dia/qu1367RgQJueuzOY5irn3WKcs+uA1urh
         jECJkxPwgOARgF6VRe1xY0bgbjRTFp2Q4QzkDo+fbnW8sl2EptrR7hSIqRGibhhbAQuP
         /7u66ysgodKudbqa49oBm+Owf63/Nulq15o92hsOwBzrhhF3UbF7EUlhTQfMyFebmoO3
         7o3OGnI1aXdLY7bqkFuFQB/upGdgybnIICFO5dED68tAz7Qaap3un71b6z5RwGUi7/N8
         ZzuvUQANkEGD4mQ2I18d1JVMjGH1SQRyzyIR4LKIDDWNRw4yJx58zNahD5ROa2e/8Nof
         NqKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=8jFMOYmI7QdV5FMGFGU2VKnMJYWvON7mqPy5EHHdbJE=;
        b=ZjTKTe+j6VDjf1ywZkdGIRrl5nMkJs4QjI+hWRRejVi5+EA9VQv7JuYRX9Bp8kuvqC
         NveZONQfG7tx95sJCbMgHcJRy17QA724TjcptteXA0AciP8eYA9AiUQyXCr64EnobuQ5
         Rf25gKtoKTfHuqbLw6a8RgrT5FIqpYGld/lUR5km4G0Gk7L89kpsYE4WLc/+YN74nR6y
         BgWuvq9zzquRPRjxho0xjpxWeK7S8bqBbdYeDk3uQIxUeCTBq9myPqJrw3IFIHQqcBN7
         fh0iy/fvM8OSoOpqBFE4IQHGgR8KyR9IqwGrkowfJCajh8p0ozbdrHrF1uuGQl1dpn8u
         IPew==
X-Gm-Message-State: APjAAAX3h1SvMG/mavt3oF16OLZmD6x6X8/hmRpnjnrbYkfHjCCswP6y
	rjG3qfVDrfiHepN+oXbMGPrvyvBnVpvixf16jAY=
X-Google-Smtp-Source: APXvYqx1Iiilr8yceqrgt4XreuMDOrGt35G0cRJTrwJ7Rs3vDLx/PiSdgpm5cXOA+gaUw1gJNXb5KCDk2g9Mo+yqmHY=
X-Received: by 2002:a2e:480a:: with SMTP id v10mr6411709lja.94.1561737967423;
 Fri, 28 Jun 2019 09:06:07 -0700 (PDT)
MIME-Version: 1.0
References: <20190627202719.17739-1-philmd@redhat.com> <20190627202719.17739-9-philmd@redhat.com>
In-Reply-To: <20190627202719.17739-9-philmd@redhat.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 28 Jun 2019 09:03:07 -0700
Message-ID: <CAKmqyKPBSZhKw1D83omSi95vXf1YK=jRTFCycYayXwDU12SLjg@mail.gmail.com>
Subject: Re: [Qemu-devel] [PATCH v5 08/28] hw/block/pflash_cfi02: Use the ldst
 API in pflash_write()
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
X-TUID: VLKyMkgajapF

On Thu, Jun 27, 2019 at 1:43 PM Philippe Mathieu-Daud=C3=A9
<philmd@redhat.com> wrote:
>
> The load/store API eases code review.
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
>  hw/block/pflash_cfi02.c | 38 ++++++++------------------------------
>  1 file changed, 8 insertions(+), 30 deletions(-)
>
> diff --git a/hw/block/pflash_cfi02.c b/hw/block/pflash_cfi02.c
> index 9e8c28af8f..ae38ed0bae 100644
> --- a/hw/block/pflash_cfi02.c
> +++ b/hw/block/pflash_cfi02.c
> @@ -365,38 +365,16 @@ static void pflash_write(PFlashCFI02 *pfl, hwaddr o=
ffset,
>              goto check_unlock0;
>          case 0xA0:
>              trace_pflash_data_write(offset, width << 1, value, 0);
> -            p =3D pfl->storage;
>              if (!pfl->ro) {
> -                switch (width) {
> -                case 1:
> -                    p[offset] &=3D value;
> -                    pflash_update(pfl, offset, 1);
> -                    break;
> -                case 2:
> -                    if (be) {
> -                        p[offset] &=3D value >> 8;
> -                        p[offset + 1] &=3D value;
> -                    } else {
> -                        p[offset] &=3D value;
> -                        p[offset + 1] &=3D value >> 8;
> -                    }
> -                    pflash_update(pfl, offset, 2);
> -                    break;
> -                case 4:
> -                    if (be) {
> -                        p[offset] &=3D value >> 24;
> -                        p[offset + 1] &=3D value >> 16;
> -                        p[offset + 2] &=3D value >> 8;
> -                        p[offset + 3] &=3D value;
> -                    } else {
> -                        p[offset] &=3D value;
> -                        p[offset + 1] &=3D value >> 8;
> -                        p[offset + 2] &=3D value >> 16;
> -                        p[offset + 3] &=3D value >> 24;
> -                    }
> -                    pflash_update(pfl, offset, 4);
> -                    break;
> +                p =3D (uint8_t *)pfl->storage + offset;
> +                if (pfl->be) {
> +                    uint64_t current =3D ldn_be_p(p, width);
> +                    stn_be_p(p, width, current & value);
> +                } else {
> +                    uint64_t current =3D ldn_le_p(p, width);
> +                    stn_le_p(p, width, current & value);
>                  }
> +                pflash_update(pfl, offset, width);
>              }
>              /*
>               * While programming, status bit DQ7 should hold the opposit=
e
> --
> 2.20.1
>
>
