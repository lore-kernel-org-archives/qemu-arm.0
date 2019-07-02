Received: by 2002:a5d:6790:0:0:0:0:0 with SMTP id v16csp3972162wru;
        Tue, 2 Jul 2019 09:18:11 -0700 (PDT)
X-Received: by 2002:a2e:12c8:: with SMTP id 69mr17359231ljs.189.1562084291052;
        Tue, 02 Jul 2019 09:18:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562084291; cv=none;
        d=google.com; s=arc-20160816;
        b=Dp/1AbK70/AwWFI44TrrZutv2qIolnYUvOfOCKM0PgjSw3KCGqQYDfp+xsoMzwO85s
         6j4xEgH2w19k8LhqzB3B7Pr4S7dsrbaY8JE/LB53M7JAV9OoJnWtEQsCKIZxQwsu4I9b
         nvyIGffjvMHPKlYDV4LQWTTYooyKep8YHeM2GpISeTOTc9YmCsFY0NF4AGbolXxzhufF
         AcpHFbFwBneuI+5KSeXP+0GoO2AzB2zxjOYCEsqgJ1P41nB2Ej6/eWhFL+fNIHZONNbp
         Th9e1mD9HF2pw75yVTbdcgMnbYjySd72ArXvg71+4IeKBHHMX3hU921dx7QjRoydbbzI
         0bQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/MBg1zX8WAYF9zMp578Nj6qoQ2mH4XRdogrHDNzRxH8=;
        b=0bBrOynuHcJttrmQbAYD0sQWCqR6mYQoK6pynFoonz5VEGp2O2dnD96yl5Js6OllpX
         1/GGTycyxnI2nGCShbI8tdS0GHWl9N/AF2FCYEmt7+tvSJRiSsk1RlRQr4LjYU6ORrPd
         OrNBvNGKhTBrY7Z2COuv9mphKd0prh4wHT44TVAPPOQo/HCdFuR01CLHTPsAJK3hMBS7
         RDd64jDo83Sh8Mqh1OX8yxR7qgBjpcD1JWAgdHpjaAUKCVcY1YvZmU29yPUori/ZwfoF
         uUTv+a8q/B/b5jTCXWjE6HR5tVjqO5yFpzCXvvsF6V85nIfezBihyZ+clkfCaxzbRPDF
         FBtw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=p239fiOv;
       spf=pass (google.com: domain of alistair23@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=alistair23@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <alistair23@gmail.com>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id y25sor3490603lfy.34.2019.07.02.09.18.10
        (Google Transport Security);
        Tue, 02 Jul 2019 09:18:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of alistair23@gmail.com designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=p239fiOv;
       spf=pass (google.com: domain of alistair23@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=alistair23@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=/MBg1zX8WAYF9zMp578Nj6qoQ2mH4XRdogrHDNzRxH8=;
        b=p239fiOv339O2ABHfp65iiXtc0jFVwosmq+0/RVutIJ1FW8TrlEK0m0GvvyS8tZO95
         km9WxM0FqzHM9cRgIstj4yVndzbBC/IhSspsOyCxKcKL6mdjUslTkWmBAAYYCuj9ekdk
         pj/ADNqxMc1gSs0z0lEZRUnjHpxYuKCnRnaQFniZJqJ1+EoMbhzGiVzUFQVAtB4gi8vm
         C5wsZ9T/9rRRU9vNr6ErXdekoIiuawpw4Bh4wy8MqWpzUJYVL2esuqAz/9YXVkgY4eGa
         TVpqcUZGFzEDhj2RLU6oOs7Gq893pWCVzb+hAsxcOoHjg+jTa/j+BZuQ8XcIf/InCsTj
         mqmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=/MBg1zX8WAYF9zMp578Nj6qoQ2mH4XRdogrHDNzRxH8=;
        b=WVrUxftVDIVYSUIigynBoCVzkTKj7dQUCH63wji8sa9MT+wMmI3O6tN3H4BhUWtsKW
         QwP9STszCl2CbI4GtdZNXlUKJMwWowa3RsJQM5C+5m/oF8RS1gKdgAUZZP+MuwT5t1Gs
         tTkqFI4LoPk4Z73y2gwTxkNC2aebJYDRZfg9rA/7hWoGUzfUd0/b4My39yYTybU+G/Ah
         DXtZvmm/buQaPUkG5go3lXHUHoFI4KFlLjG4sVFn2Mcd3uXgpgN8QUZcpcrUP2spdeCT
         T+GD8iiEZYW2Zm058PfixqL7wXvTPX+Kfq0xefaqLVbqjos6EeCxXtE8B7idY16XFxMU
         xzRQ==
X-Gm-Message-State: APjAAAU92zsu55TKg4zAXCaCNjp3ygFQaOPJzrFwwS8fwWiivZ/tnpSM
	yZqWSQ0cgYHIooDpRRh9cSczaAa9OMZMivpDJRU=
X-Google-Smtp-Source: APXvYqzisf0aezxqwOJlaLCnHvkhxG3cLzmSo2ipcO3X+b71dzXG/JhYiVEF3ynFU7MVdgrw1I2MzZYeRis6TyG91x4=
X-Received: by 2002:ac2:5324:: with SMTP id f4mr15308676lfh.156.1562084290697;
 Tue, 02 Jul 2019 09:18:10 -0700 (PDT)
MIME-Version: 1.0
References: <20190702001301.4768-1-philmd@redhat.com> <20190702001301.4768-9-philmd@redhat.com>
In-Reply-To: <20190702001301.4768-9-philmd@redhat.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 2 Jul 2019 09:15:07 -0700
Message-ID: <CAKmqyKMZhZMy2cG_Ub8oL4hrpTHzk5fCCmsKV7Ypzkp9huqm+A@mail.gmail.com>
Subject: Re: [PATCH v2 8/9] hw/block/pflash_cfi01: Replace DPRINTF by qemu_log_mask(GUEST_ERROR)
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
X-TUID: NgWBNiCbF8bJ

On Mon, Jul 1, 2019 at 5:16 PM Philippe Mathieu-Daud=C3=A9 <philmd@redhat.c=
om> wrote:
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/block/pflash_cfi01.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/hw/block/pflash_cfi01.c b/hw/block/pflash_cfi01.c
> index f50d0a9d37..e891112b67 100644
> --- a/hw/block/pflash_cfi01.c
> +++ b/hw/block/pflash_cfi01.c
> @@ -286,7 +286,9 @@ static uint32_t pflash_read(PFlashCFI01 *pfl, hwaddr =
offset,
>      switch (pfl->cmd) {
>      default:
>          /* This should never happen : reset state & treat it as a read *=
/
> -        DPRINTF("%s: unknown command state: %x\n", __func__, pfl->cmd);
> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: Invalid state, "
> +                      "wcycle %d cmd 0x02%x\n",
> +                      __func__, pfl->wcycle, pfl->cmd);
>          pfl->wcycle =3D 0;
>          pfl->cmd =3D 0xff;
>          /* fall through to read code */
> @@ -631,7 +633,9 @@ static void pflash_write(PFlashCFI01 *pfl, hwaddr off=
set,
>          break;
>      default:
>          /* Should never happen */
> -        DPRINTF("%s: invalid write state\n",  __func__);
> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: Invalid state, "
> +                      "wcycle %d cmd (0x02%x -> value 0x02%x)\n",
> +                      __func__, pfl->wcycle, pfl->cmd, value);
>          goto mode_read_array;
>      }
>      return;
> --
> 2.20.1
>
