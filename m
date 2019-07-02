Received: by 2002:a5d:6790:0:0:0:0:0 with SMTP id v16csp3959837wru;
        Tue, 2 Jul 2019 09:06:54 -0700 (PDT)
X-Received: by 2002:a2e:3604:: with SMTP id d4mr17925500lja.85.1562083614582;
        Tue, 02 Jul 2019 09:06:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562083614; cv=none;
        d=google.com; s=arc-20160816;
        b=B8Sm2VnzyusT/Bq2yxL0iRZ3bZ3Z88Tgirlp86XZR4kdXY78Y4MQfoE805m3Vl4XVz
         k42C1kHgKoVVhJpTwDXwcPKk7nKnN5P7ikkTXQK7itIyRhSSOPJkK+gHHydk8XupOIiy
         vMxlOjJMuuhZ3RxWvGjmaUEIIsS+0xjx08nyAfXTFHxA729fZmbggyGGnzZuW/wBHaoV
         lNFkrTlmlSDYLeawL6Aoacp8nUMgmfTa4tE9/BjHtMim70QisYSluOpOpjWgwDj/pco5
         C/8IGB5GZwao3k+6A6H+r5Eoz5Xas7xVtF4g72Q9S8A71lgA5RrraA6k8W6J/Wwf/eya
         q0Pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=191PEazMI6AZYxomtIRj4zRN76qVi7zp+FaJdnT1SJc=;
        b=kImvOmj+bWLBE2gUt5edpCzpurzfzSIPL9hwMgIRSeZQKjPst6rwXVvC8Ikwd+ZPyF
         /uajSmqabLUiSflUl5ZyRUuNeRO/TcCwCUpptbN8Ib7Y8a2riJMjH3V8BT2fp+/ISYIE
         ez92sFSUi/kfapApAdRcg7M9nXRH9RGfmqDdl+N2Y8Y4+vldkpo5fSlgvi+g1mJCvVKm
         CPcWF6aAzZa1+KbAwwMGziGgaHKA4ANe/fa8NmUQH1Rkxt0C9T1flmf7XoD/y2jV5Xqv
         Kzssdl92I0tYpOdt7fnNDrNO+Mw4uL3378X3zH2J9tfQBvbgRGkTN547+JeUut4kj0yf
         qusQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=Am2HpwDf;
       spf=pass (google.com: domain of alistair23@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=alistair23@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <alistair23@gmail.com>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id d26sor3478860lfn.9.2019.07.02.09.06.54
        (Google Transport Security);
        Tue, 02 Jul 2019 09:06:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of alistair23@gmail.com designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=Am2HpwDf;
       spf=pass (google.com: domain of alistair23@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=alistair23@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=191PEazMI6AZYxomtIRj4zRN76qVi7zp+FaJdnT1SJc=;
        b=Am2HpwDfCU2j4FqQhU35pMIcvHZiJA14RgnYPnaOWp+dBH3ua1vxFlPGaIyM7tlmCN
         5865o8vL1KQPVgv+vmCjNUQcia3MiLYt//LS3UZFnhiYFYkZOiXM2bJs5eWvK9bxtiqT
         F8tS3U4fhjx4g+4bZYlQjoaj6XwTTQH8fShnSBpEHQXJt/lted8iHqrtAwmaJf+r18+o
         VhIBESIA9C7HqUvP5S+pV1knvKV691P4uOqe+7o1CRIBrITVqefhReAu996rqCUjcB2t
         UZ0MK+AO9D8yaCII5zqoU5LlJ4qyfcjHBrp0ZHEy24b3Rd0r5jxmcHsbGXW4u59sQuOQ
         fVkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=191PEazMI6AZYxomtIRj4zRN76qVi7zp+FaJdnT1SJc=;
        b=mFaulV0aN3Uo3zFtJIHPZmnG/Hqe4UcQsEe67ZnlC47Pv8l7ygQK0FXv7HYDO6Ot4O
         2Q+jrJ37h4TK9Y8oZbCu9dOhQpiOqZdLewzs7S/alTvTafGIpccYvXAUipCEL0GHucnz
         1Eo8zUnrzIG61RFUHgGDMytth4lQCqSScYNQJ0E54p7JgIS+Fw+ruRj5VPLUige+2rZM
         yXAGdV9BN54oPiMkRCd0AzQM3knqac5uqvlFzeuOUMjbLyROmViWkdPwgVfM7w0Q3pdz
         fheGcaDE+mv3i87j6uAnomE9IvrGfaxesFZ18wAlcHTlOV77I8x9QtennY8cjLxgshHW
         vrDw==
X-Gm-Message-State: APjAAAW/88pBKyf5HIE5mv7uBg1KWDSIcfnqHV/WHvITWQemmbyh+hTt
	kPiu8CwbCRsSfWPTDIX7GT8uJOx2JgPE6Pdu2IA=
X-Google-Smtp-Source: APXvYqyHbgXSZavlE/NdxL+IluKO6aiBhhzlUNZvLBXoABzxVIyUSgTn8WzBKuDJ3cVeZpWtkXfRFpzGcCvHXjuQqY8=
X-Received: by 2002:a19:4c05:: with SMTP id z5mr14851396lfa.5.1562083614266;
 Tue, 02 Jul 2019 09:06:54 -0700 (PDT)
MIME-Version: 1.0
References: <20190702001301.4768-1-philmd@redhat.com> <20190702001301.4768-7-philmd@redhat.com>
In-Reply-To: <20190702001301.4768-7-philmd@redhat.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 2 Jul 2019 09:03:51 -0700
Message-ID: <CAKmqyKMgXKULX8JJSTmLyCbzRYJkeHZ=HqHBHA_cro-a21v=Zg@mail.gmail.com>
Subject: Re: [PATCH v2 6/9] hw/block/pflash_cfi01: Simplify CFI_QUERY processing
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
X-TUID: W6VjW46nruUS

On Mon, Jul 1, 2019 at 5:15 PM Philippe Mathieu-Daud=C3=A9 <philmd@redhat.c=
om> wrote:
>
> The current code does:
>
> if (write_cycle =3D=3D 0)
>   if (command =3D=3D CFI_QUERY)
>     break
>   write_cycle +=3D 1
>   last_command =3D command
>
> if (write_cycle =3D=3D 1)
>   if (last_command =3D=3D CFI_QUERY)
>     if (command =3D=3D READ_ARRAY
>       write_cycle =3D 0
>       last_command =3D READ_ARRAY
>
> Simplify by not increasing the write_cycle on CFI_QUERY,
> the next command are processed as normal wcycle=3D0.
>
> This matches the hardware datasheet (we do not enter the WRITE
> state machine, thus no write cycle involved).
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/block/pflash_cfi01.c | 10 ++--------
>  1 file changed, 2 insertions(+), 8 deletions(-)
>
> diff --git a/hw/block/pflash_cfi01.c b/hw/block/pflash_cfi01.c
> index 8d632ea941..c1b02219b2 100644
> --- a/hw/block/pflash_cfi01.c
> +++ b/hw/block/pflash_cfi01.c
> @@ -492,7 +492,8 @@ static void pflash_write(PFlashCFI01 *pfl, hwaddr off=
set,
>              return;
>          case 0x98: /* CFI query */
>              DPRINTF("%s: CFI query\n", __func__);
> -            break;
> +            pfl->cmd =3D cmd;
> +            return;
>          case 0xe8: /* Write to buffer */
>              DPRINTF("%s: Write to buffer\n", __func__);
>              /* FIXME should save @offset, @width for case 1+ */
> @@ -566,13 +567,6 @@ static void pflash_write(PFlashCFI01 *pfl, hwaddr of=
fset,
>                  goto mode_read_array;
>              }
>              break;
> -        case 0x98:
> -            if (cmd =3D=3D 0xff) {
> -                goto mode_read_array;
> -            } else {
> -                DPRINTF("%s: leaving query mode\n", __func__);
> -            }
> -            break;
>          default:
>              goto error_flash;
>          }
> --
> 2.20.1
>
