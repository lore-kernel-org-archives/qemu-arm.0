Received: by 2002:a5d:6790:0:0:0:0:0 with SMTP id v16csp3955303wru;
        Tue, 2 Jul 2019 09:03:01 -0700 (PDT)
X-Received: by 2002:ac2:50cd:: with SMTP id h13mr15615561lfm.36.1562083381194;
        Tue, 02 Jul 2019 09:03:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562083381; cv=none;
        d=google.com; s=arc-20160816;
        b=RbbqsyjRK+miaG6I7uuF3ShngM5/1OBv+OBTpbOYRcw3uIvZbri8ft5TtVmwnnS95e
         AfnPTfCEkvYS2j77NWuqjgk5jGIJJrCHWIpzcPNfgE4cN9fMDUxyHap4D94Sb8Vfy82/
         jdnvivDhwh5V5f4FZJ/TifZxCZ+2pV8QbZ0/dBVOSicuFZ4FmQxONEeVqcQPdsd4AdiH
         CVji0i8D2XFFEXmYAZBLyHYfWJsa7kwA+hor/Pl1iTzIj5RcalXWxS8j6ExvMWeBMJgf
         4eVhxGJ7Vcp3AQnuy2cWNtes3PGsPtHJTLBB6GbMNOtOv0Ms28cgXxJOk9qEz7j17qJW
         WS5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qsKibivX02EHntCrmbyiVJL0iGA9GE9EiTTaVocYZvE=;
        b=DF1eknkRvMN1AThVfp1b2EHDJD+B7D6ARoweo3DbXpw7HnE35aH3YHwEVzz/eX+rms
         udQaYPEX+jYOL/Mk1jf0NLLiGZrfC+BHLBfNpoHWLp1xAIFVM5o9EzzsXk7gIC+WYnKt
         BLFxqATa7hgpW12/DFKCXg7NJj19oa49AttAQ2i0Ks3LNFURrxPAHJylqR0bsmakBKBn
         cTAE/gCOrg1zV6eg7nX4NKAV8okidu1C/Kf95HwVs9i7YCWQwNk6KVVgN4XgrDvtdCAb
         QTSUBiZB5RRZJNWf9xMCOHIcnXgPzpXp3Rh8/CrrhuLWdHhIlXSdCtHoLqTS4rllRoWT
         Z7gw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=s1ZzXVIU;
       spf=pass (google.com: domain of alistair23@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=alistair23@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <alistair23@gmail.com>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id m78sor604472lfa.53.2019.07.02.09.03.00
        (Google Transport Security);
        Tue, 02 Jul 2019 09:03:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of alistair23@gmail.com designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=s1ZzXVIU;
       spf=pass (google.com: domain of alistair23@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=alistair23@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=qsKibivX02EHntCrmbyiVJL0iGA9GE9EiTTaVocYZvE=;
        b=s1ZzXVIUoH8uhjXkzXoXrQ2knjwCkoSbisSECUSEUZ8oDhRFjEWMSKpzJTWwArKXZc
         xxaLIVsqyDrwgkYlIslpSuIGEkfV+sK1nt1rS9SMW6BHZExpd/1WGmjhHSnXBibZBCLn
         4/2TNa9pY5+toJ4dOpWCDmoXuOPX/nqUy8qhkiPm5V8miA+SpZ6695lJg1+n8SbsxINW
         1iKwwYtJKAJr9Mbe3j62JK/JiyPSSky205bZuKbY9fV7jjhiPboy40HYepe6HtWms5SN
         wr2tV9edY0ZOjPMC4wYTxZLLuc6tldy2PSlo1hOvQg6/XKrgn8urc1q0n28U1J8wNJyt
         Mj8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=qsKibivX02EHntCrmbyiVJL0iGA9GE9EiTTaVocYZvE=;
        b=OMIaIXr7SOzSzWkAiIw37beJ2SwKk12M0u3mb7kbgbvnDyLY+NAp+XKKxxCd9Zftku
         +HzMusTzhz5Fi5df7tCgYa/FnNenE6MOONH0W0hhOuUbI+JQbkBt9yx/VTigGBaqCS56
         E28raFUxouvpF3dwDoZH3gddNdSjErb7l8xTsb6y3si9Gp8en8NMGAX5/GrZpYf8yDnN
         DhrJloZdBGFxjXHIcYtDL0C1/9t/8iHcgEpXaWOWNinJlpBz+fOQCyntMnWawjzTLAfH
         IVt1kgBhee+TuCVIT8SVKnlv/3WylDAMu/XQMItm3JX5HXFa1MXjolFHG7TiFNTe/qKj
         0uzQ==
X-Gm-Message-State: APjAAAVRH2VN0bCSFnXB9AzjsQ0JuY5yn9NrNT9nUSeqGbjerg+29md7
	KwwLboPIh8PoMpArMAd0iuKF4VOBZ3mt1l/L/Ts=
X-Google-Smtp-Source: APXvYqz+wjJ9ZjPNWkduPaR1YRomsukF4BUx2G6gWf87O99xDcQ64v2Lw0knoL1qfI83Yy4pM9ORl8yWN1eL4nzE9Uo=
X-Received: by 2002:a05:6512:29a:: with SMTP id j26mr14692707lfp.44.1562083380780;
 Tue, 02 Jul 2019 09:03:00 -0700 (PDT)
MIME-Version: 1.0
References: <20190702001301.4768-1-philmd@redhat.com> <20190702001301.4768-3-philmd@redhat.com>
In-Reply-To: <20190702001301.4768-3-philmd@redhat.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 2 Jul 2019 08:59:56 -0700
Message-ID: <CAKmqyKPM-MKuB_nq-5KMBg0BR-QvYbDB7EtY_Wep2uoiMsbXxg@mail.gmail.com>
Subject: Re: [PATCH v2 2/9] hw/block/pflash_cfi01: Use the correct READ_ARRAY value
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
X-TUID: oqVsEfDvICe8

On Mon, Jul 1, 2019 at 5:14 PM Philippe Mathieu-Daud=C3=A9 <philmd@redhat.c=
om> wrote:
>
> In the "Read Array Flowchart" the command has a value of 0xFF.
>
> In the document [*] the "Read Array Flowchart", the READ_ARRAY
> command has a value of 0xff.
>
> Use the correct value in the pflash model.
>
> There is no change of behavior in the guest, because:
> - when the guest were sending 0xFF, the reset_flash label
>   was setting the command value as 0x00
> - 0x00 was used internally for READ_ARRAY
>
> [*] "Common Flash Interface (CFI) and Command Sets"
>     (Intel Application Note 646)
>     Appendix B "Basic Command Set"
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/block/pflash_cfi01.c | 15 ++++++---------
>  1 file changed, 6 insertions(+), 9 deletions(-)
>
> diff --git a/hw/block/pflash_cfi01.c b/hw/block/pflash_cfi01.c
> index dcc9885bf0..743b5d5794 100644
> --- a/hw/block/pflash_cfi01.c
> +++ b/hw/block/pflash_cfi01.c
> @@ -280,10 +280,9 @@ static uint32_t pflash_read(PFlashCFI01 *pfl, hwaddr=
 offset,
>          /* This should never happen : reset state & treat it as a read *=
/
>          DPRINTF("%s: unknown command state: %x\n", __func__, pfl->cmd);
>          pfl->wcycle =3D 0;
> -        pfl->cmd =3D 0;
> +        pfl->cmd =3D 0xff;
>          /* fall through to read code */
> -    case 0x00:
> -        /* Flash area read */
> +    case 0xff: /* Read Array */
>          ret =3D pflash_data_read(pfl, offset, width, be);
>          break;
>      case 0x10: /* Single byte program */
> @@ -449,8 +448,6 @@ static void pflash_write(PFlashCFI01 *pfl, hwaddr off=
set,
>      case 0:
>          /* read mode */
>          switch (cmd) {
> -        case 0x00: /* ??? */
> -            goto reset_flash;
>          case 0x10: /* Single Byte Program */
>          case 0x40: /* Single Byte Program */
>              DPRINTF("%s: Single Byte Program\n", __func__);
> @@ -527,7 +524,7 @@ static void pflash_write(PFlashCFI01 *pfl, hwaddr off=
set,
>              if (cmd =3D=3D 0xd0) { /* confirm */
>                  pfl->wcycle =3D 0;
>                  pfl->status |=3D 0x80;
> -            } else if (cmd =3D=3D 0xff) { /* read array mode */
> +            } else if (cmd =3D=3D 0xff) { /* Read Array */
>                  goto reset_flash;
>              } else
>                  goto error_flash;
> @@ -554,7 +551,7 @@ static void pflash_write(PFlashCFI01 *pfl, hwaddr off=
set,
>              } else if (cmd =3D=3D 0x01) {
>                  pfl->wcycle =3D 0;
>                  pfl->status |=3D 0x80;
> -            } else if (cmd =3D=3D 0xff) {
> +            } else if (cmd =3D=3D 0xff) { /* read array mode */
>                  goto reset_flash;
>              } else {
>                  DPRINTF("%s: Unknown (un)locking command\n", __func__);
> @@ -646,7 +643,7 @@ static void pflash_write(PFlashCFI01 *pfl, hwaddr off=
set,
>      trace_pflash_reset();
>      memory_region_rom_device_set_romd(&pfl->mem, true);
>      pfl->wcycle =3D 0;
> -    pfl->cmd =3D 0;
> +    pfl->cmd =3D 0xff;
>  }
>
>
> @@ -762,7 +759,7 @@ static void pflash_cfi01_realize(DeviceState *dev, Er=
ror **errp)
>      }
>
>      pfl->wcycle =3D 0;
> -    pfl->cmd =3D 0;
> +    pfl->cmd =3D 0xff;
>      pfl->status =3D 0;
>      /* Hardcoded CFI table */
>      /* Standard "QRY" string */
> --
> 2.20.1
>
