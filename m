Received: by 2002:a5d:6790:0:0:0:0:0 with SMTP id v16csp3969881wru;
        Tue, 2 Jul 2019 09:16:06 -0700 (PDT)
X-Received: by 2002:ac2:5a01:: with SMTP id q1mr15344956lfn.46.1562084166021;
        Tue, 02 Jul 2019 09:16:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562084166; cv=none;
        d=google.com; s=arc-20160816;
        b=0sht8uyJKk+ciuK/SzalOfU5ksJKbjVBKL2+zSI0O7EvWfUBeAs9gn60+qkP+e5w8j
         1tVvmLMzYhpIelP+U/HMDGfARjJB4YWrIiGGtlKk16liKF5UtNiC4fFFZyK1d7jvBJqL
         P+gOfNIgbRLwUGQPc8jTG4ZJh0O6UJmuKT33dbzOlrN6ROZw0r14JC/ZtgjIQjWRQYKO
         gobsmat1ZvDJyz7hY2EFXFsbwEMA8ig6RYUm8NKXPRi6Q5FTOhswPj2JYZjiLPNjRegg
         Yr5efIvqJ1D0DndfJ4MvH4877MwdJlFJN8t3b+SSBmObHKjiWPpEijDRHkm/UkUo2dT8
         eoGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZU0Kd/Xv5iJ3yRbbDVHYD4jeks6wD0BoPdNMIKus+J4=;
        b=UOdm9TUbpk7zXNnOgnbkyzh7XdRTxpu9+CNuQVRXNNbZ1emxsKL+Mb7kOpbnoIGsn1
         lDxYahzTIfpWOQGKrbaoi+voTwcgIdv6KVtpSSsf3YE8sgxU/PznPm+vpf1Gh3AP4s4t
         aE0HEcTZLpBZUMkl5Ld/AuqMQonm6U9zDBF627zfgqp6QYFZyfLugRWboaNySesr08+0
         ZQw0Ro2iTYHSMcodDR0TKjEUiOzn5kEO5UtSIWURORe/ELpBfNWBBVykKN96FYYnufsd
         nNbYE2CcRStcPLTejxCaq/M2eHZyye1Ri+n421z6/PQ4BmMwKK6EjQb4ZOhimHXmk/Ow
         EtyQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=NJbGtTtC;
       spf=pass (google.com: domain of alistair23@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=alistair23@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <alistair23@gmail.com>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id r86sor7857236ljb.1.2019.07.02.09.16.05
        (Google Transport Security);
        Tue, 02 Jul 2019 09:16:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of alistair23@gmail.com designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=NJbGtTtC;
       spf=pass (google.com: domain of alistair23@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=alistair23@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=ZU0Kd/Xv5iJ3yRbbDVHYD4jeks6wD0BoPdNMIKus+J4=;
        b=NJbGtTtChlO7GHAppX76MKo/9sMK5K3I46wK+atNH+dHz42OisOs+d8aifhy9L/9Gf
         7HpYfEsIgAFcIW8hth4mo7BjQZ219fPk/eTNFcj5wmydcLSzNPhCNaP3tnBUgYBIQek7
         ULZ/jAeWqTTWzcL8HlY0W99NI95soTo/REY+4mNlPcHh6QozNqu+etO1HWwYD8vivnPy
         fL3RTAlq2rnjD+azB9+1lf+gVltAcZR+4KdC8gCudyqFA1nwY2LjleyrD/grAUaOLtss
         +g4RbA+ENB3eT0JwnoEqxApFllcltNxMGtnfZ4y1YKmzk+2VAU3AoyNVG6TKCXnf/N/y
         gtGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=ZU0Kd/Xv5iJ3yRbbDVHYD4jeks6wD0BoPdNMIKus+J4=;
        b=nh3WAs4T9Wrl126BbPTa4LtmUlCXXaDOPK5gxZtwmgCqDK38oVLzXNTB4tolp11bDT
         DtSygLdy7xrH3P25MvsL1N5nAFU8CZiEDpytKrUd4p5zH7hoPRYGFv/GDtzg50aPXvG4
         yBiMbK06GWD43WZSeNVCcT2tWLj3lJu7upcok9OTR3jogKQpjzvOdP6DfQw/K/c71piF
         3/yWhd8l9ELMXVckX2KzmQJ7kI5gMvInkmzb1ys3UW2fAjIZHi52Y6X7l+25ciIbdC6u
         HQvu2IHJTBZ2A4L0kDDIVxgVzMcSkrPP3syKZXKq/iBmiXN+xchHdiRIXTpwsB8L2LV/
         geKw==
X-Gm-Message-State: APjAAAXXSYszlQXE7oICtb1ccBYV8ueNRUFwY+UfIYIGh44g7EB7pREC
	r13l0vp8YgP4uAtOwtGDnrL3H4dPCPLKHqnbQts=
X-Google-Smtp-Source: APXvYqy0bLL480Vi/3s18ciD+c9iZAIrKERSXLQdtsAc5ThV3H7A/0ztRVqBwvZVerXDB/o1dco7qQGKaK5YU8sI4rA=
X-Received: by 2002:a2e:9188:: with SMTP id f8mr12415938ljg.33.1562084165709;
 Tue, 02 Jul 2019 09:16:05 -0700 (PDT)
MIME-Version: 1.0
References: <20190702001301.4768-1-philmd@redhat.com> <20190702001301.4768-8-philmd@redhat.com>
In-Reply-To: <20190702001301.4768-8-philmd@redhat.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 2 Jul 2019 09:13:02 -0700
Message-ID: <CAKmqyKM3=yF_1ngt9dHXyYPOMoKs5gsZtVLWT6ovf--bSMk_ig@mail.gmail.com>
Subject: Re: [PATCH v2 7/9] hw/block/pflash_cfi01: Improve command comments
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>, 
	Laszlo Ersek <lersek@redhat.com>, David Gibson <david@gibson.dropbear.id.au>, 
	"open list:New World" <qemu-ppc@nongnu.org>, Peter Maydell <peter.maydell@linaro.org>, 
	Max Filippov <jcmvbkbc@gmail.com>, John Snow <jsnow@redhat.com>, 
	Aleksandar Markovic <amarkovic@wavecomp.com>, Wei Yang <richardw.yang@linux.intel.com>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Aurelien Jarno <aurelien@aurel32.net>, BALATON Zoltan <balaton@eik.bme.hu>, 
	Markus Armbruster <armbru@redhat.com>, Andrzej Zaborowski <balrogg@gmail.com>, 
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>, Michael Walle <michael@walle.cc>, 
	Paolo Bonzini <pbonzini@redhat.com>, Max Reitz <mreitz@redhat.com>, Kevin Wolf <kwolf@redhat.com>, 
	Richard Henderson <rth@twiddle.net>, qemu-arm <qemu-arm@nongnu.org>, 
	"Michael S. Tsirkin" <mst@redhat.com>, Qemu-block <qemu-block@nongnu.org>, 
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Eduardo Habkost <ehabkost@redhat.com>, 
	Aleksandar Rikalo <arikalo@wavecomp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: MUq9AYmEg7XI

On Mon, Jul 1, 2019 at 5:15 PM Philippe Mathieu-Daud=C3=A9 <philmd@redhat.c=
om> wrote:
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/block/pflash_cfi01.c | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
>
> diff --git a/hw/block/pflash_cfi01.c b/hw/block/pflash_cfi01.c
> index c1b02219b2..f50d0a9d37 100644
> --- a/hw/block/pflash_cfi01.c
> +++ b/hw/block/pflash_cfi01.c
> @@ -208,11 +208,11 @@ static uint32_t pflash_devid_query(PFlashCFI01 *pfl=
, hwaddr offset)
>       * Offsets 2/3 are block lock status, is not emulated.
>       */
>      switch (boff & 0xFF) {
> -    case 0:
> +    case 0: /* Manufacturer ID */
>          resp =3D pfl->ident0;
>          trace_pflash_manufacturer_id(resp);
>          break;
> -    case 1:
> +    case 1: /* Device ID */
>          resp =3D pfl->ident1;
>          trace_pflash_device_id(resp);
>          break;
> @@ -456,11 +456,11 @@ static void pflash_write(PFlashCFI01 *pfl, hwaddr o=
ffset,
>      case 0:
>          /* read mode */
>          switch (cmd) {
> -        case 0x10: /* Single Byte Program */
> -        case 0x40: /* Single Byte Program */
> +        case 0x10: /* Single Byte Program (setup) */
> +        case 0x40: /* Single Byte Program (setup) [Intel] */
>              DPRINTF("%s: Single Byte Program\n", __func__);
>              break;
> -        case 0x20: /* Block erase */
> +        case 0x20: /* Block erase (setup) */
>              p =3D pfl->storage;
>              offset &=3D ~(pfl->sector_len - 1);
>
> @@ -516,8 +516,8 @@ static void pflash_write(PFlashCFI01 *pfl, hwaddr off=
set,
>          break;
>      case 1:
>          switch (pfl->cmd) {
> -        case 0x10: /* Single Byte Program */
> -        case 0x40: /* Single Byte Program */
> +        case 0x10: /* Single Byte Program (confirm) */
> +        case 0x40: /* Single Byte Program (confirm) [Intel] */
>              DPRINTF("%s: Single Byte Program\n", __func__);
>              if (!pfl->ro) {
>                  pflash_data_write(pfl, offset, value, width, be);
> @@ -528,7 +528,7 @@ static void pflash_write(PFlashCFI01 *pfl, hwaddr off=
set,
>              pfl->status |=3D 0x80; /* Ready! */
>              pfl->wcycle =3D 0;
>          break;
> -        case 0x20: /* Block erase */
> +        case 0x20: /* Block erase (confirm) */
>          case 0x28:
>              if (cmd =3D=3D 0xd0) { /* confirm */
>                  pfl->wcycle =3D 0;
> --
> 2.20.1
>
