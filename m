Received: by 2002:a19:fc0b:0:0:0:0:0 with SMTP id a11csp115015lfi;
        Mon, 18 Nov 2019 06:30:20 -0800 (PST)
X-Google-Smtp-Source: APXvYqy34TcFt63KV9rBe82JZFo1rsHH5i1xRi8+fTMNWc2Zt6Rn8zG284N9jMGnnicSnWKnk+H/
X-Received: by 2002:a17:906:a457:: with SMTP id cb23mr26800161ejb.191.1574087420348;
        Mon, 18 Nov 2019 06:30:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1574087420; cv=none;
        d=google.com; s=arc-20160816;
        b=AbiYsBAFOrG2QOCE9ugOyt7S54tKwACNZ2qYZBNbCYlpY2ZCH5UYoFlnXlNL5O05uC
         OxHHJwHoojsHqtIa/qGUFrdIBErhX1fHYx6N0NAGVmpw0Gu2VimHft5fJdv9tvdjmuZU
         RjyFE12pA6FAYIwmkvr5rFkQo9FgFKXAWK0Wq0aERzw2dHJtoQ8yu3KbO7nXrSbknF5C
         oKH6D5CZ+4UPXq+02TtHSRfDY//912b6abq5IEcBZ9XSpFp9EOuc2kNTMyMHabatLeZL
         xosNBscedmc+8QHzOgzOtU0dDrFRJ+z9224w8Y7q8X6/Dd3PGA+NexW+Dqa21DS/pj1e
         Hf/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=eF8+xnntoDNkaBQUw00kLVfENwf421O4C05Y47PY7GY=;
        b=Rjp4TyLHkKnfA/D0p+D0wk4n58yf4TbW7UZhgUU/WADBsxJdYt5SQOVpGAqjQ+7uks
         dqyPyCOk8bcVdZD+ZtY1vM9AvxwmX3rnXhjJe4+MCo2OHIL+Ot97Sjx9tXMgou90Uhx6
         eOkHX8lqOuYyVe8t7xOyrqaIAPCKiq9hfh8x7UfgU8GruYZd/rTzjlSN6/pbvpgJiRwx
         nWADkPyqa9/LRn0JZ4u88ys8kAY2vJgr8frhPe3KUpqu8Rastq8FEKTorxBrKL7mIfma
         ScaQbGnMrEXLo77lWyK5EPJZB/3e73rlKXLfy484U6wtSJS3MVOvq7nIbZ2kx6ZZBaVD
         TXRQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=mkfLUFP0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i16si12300795ejh.75.2019.11.18.06.30.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 18 Nov 2019 06:30:20 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=mkfLUFP0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iWi2k-0001v0-Tm
	for alex.bennee@linaro.org; Mon, 18 Nov 2019 09:30:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56237)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iWi2V-0001rO-Kd
 for qemu-arm@nongnu.org; Mon, 18 Nov 2019 09:30:04 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iWi2R-0007DL-Ll
 for qemu-arm@nongnu.org; Mon, 18 Nov 2019 09:30:03 -0500
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:39002)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iWi2R-0007Ci-G0
 for qemu-arm@nongnu.org; Mon, 18 Nov 2019 09:29:59 -0500
Received: by mail-ot1-x343.google.com with SMTP id w24so14176193otk.6
 for <qemu-arm@nongnu.org>; Mon, 18 Nov 2019 06:29:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=eF8+xnntoDNkaBQUw00kLVfENwf421O4C05Y47PY7GY=;
 b=mkfLUFP027T+uear23kWrQVYvFzfU8w5//wVWgUZnOZVjBMoYaeluADixOahZOGqW6
 dSNufuNRkB9/3F/XIM/KKClFykwwwNmYMfijl7huAFwRa5hEDCc0kxtCc2DN3nKZg6So
 1ofXr4v3vt2vufQHOhTjBQym3IkXjlxrWbU4N0ulVGyG9JzrfuswCj8K/2Uu/5cF/Poe
 hO6wKPU0Ku2LxnpGS4N5phkyX/3ppQCiB7a+V8Uv7bOkbbEjOLT8Fflr0Ip56qfhsqeF
 Bk8+0sCNtsFBfDZAdb7LdK5nfUZlfyLj9TD/r9JTveK1MgWZQWmNjzmmny0aAl7UsSbN
 G2Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=eF8+xnntoDNkaBQUw00kLVfENwf421O4C05Y47PY7GY=;
 b=J8OGFafwtNl81f8JvqJZ/mCKcX1qg+Jqa5X+9MLrNPyT1HjJ1nTlfq2iua8nJjB0Qu
 oOHWvPzlexJisJLX5WJo4Ni1Lp5qNm+oOEbVRz+oDawxtjaMGqGMnP9nvQHU8joVdfsF
 f9T0m3QBxpFhU/nbw9pz88zmfT9TbNI52DOLo7tivr+hWDOeEcVhsNqzVqhfRcw3Wlxz
 Bkl2b58tgidQPrmS1Y++ZV9L5BUMjL3uHC/WTk17BFd+5ETbqGoL/lC+iFnp5cNRI70t
 xtlGEYdYfKhhrhGmrB2bQVQ/roasmm7eq2ZhqXdoKi6v3HLtKvKztkwAbYBpVYa9OKgk
 OCMg==
X-Gm-Message-State: APjAAAW1RR68VB+FjR+DdFn2cnimgaC6XpwV77klGGBYBSnmi9D7g8Bk
 T26Uj88jdJztZyoNWNAkWaUnIkzDVuKjFdBd3Rf9bg==
X-Received: by 2002:a9d:12d2:: with SMTP id g76mr23376563otg.232.1574087397596; 
 Mon, 18 Nov 2019 06:29:57 -0800 (PST)
MIME-Version: 1.0
References: <20191023173154.30051-1-marcandre.lureau@redhat.com>
 <20191023173154.30051-11-marcandre.lureau@redhat.com>
In-Reply-To: <20191023173154.30051-11-marcandre.lureau@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 18 Nov 2019 14:29:46 +0000
Message-ID: <CAFEAcA-vhJZSKH8hDsBYVi9WKMNOFL19Q+XrwRvp94uXMbyNbA@mail.gmail.com>
Subject: Re: [PATCH v3 10/33] serial: add "instance-id" property
To: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::343
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Corey Minyard <cminyard@mvista.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 QEMU Developers <qemu-devel@nongnu.org>, BALATON Zoltan <balaton@eik.bme.hu>,
 KONRAD Frederic <frederic.konrad@adacore.com>,
 Paul Burton <pburton@wavecomp.com>, Magnus Damm <magnus.damm@gmail.com>,
 =?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Fabien Chouteau <chouteau@adacore.com>, qemu-arm <qemu-arm@nongnu.org>,
 Richard Henderson <rth@twiddle.net>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-ppc <qemu-ppc@nongnu.org>, Aleksandar Markovic <amarkovic@wavecomp.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: qAJmAYUDaVW7

On Wed, 23 Oct 2019 at 18:33, Marc-Andr=C3=A9 Lureau
<marcandre.lureau@redhat.com> wrote:
>
> This property will be used to move common vmstate registration to
> device realize in following patch.
>
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> ---
>  hw/char/serial.c         | 3 +++
>  include/hw/char/serial.h | 1 +
>  2 files changed, 4 insertions(+)
>
> diff --git a/hw/char/serial.c b/hw/char/serial.c
> index 069d8715d0..0b61a71e4e 100644
> --- a/hw/char/serial.c
> +++ b/hw/char/serial.c
> @@ -990,6 +990,7 @@ SerialState *serial_init(int base, qemu_irq irq, int =
baudbase,
>      s->irq =3D irq;
>      qdev_prop_set_uint32(dev, "baudbase", baudbase);
>      qdev_prop_set_chr(dev, "chardev", chr);
> +    qdev_prop_set_int32(dev, "instance-id", base);
>      serial_realize_core(s, &error_fatal);
>      qdev_set_legacy_instance_id(dev, base, 2);
>      qdev_init_nofail(dev);
> @@ -1003,6 +1004,7 @@ SerialState *serial_init(int base, qemu_irq irq, in=
t baudbase,
>  static Property serial_properties[] =3D {
>      DEFINE_PROP_CHR("chardev", SerialState, chr),
>      DEFINE_PROP_UINT32("baudbase", SerialState, baudbase, 115200),
> +    DEFINE_PROP_INT32("instance-id", SerialState, instance_id, 0),

This could use an explanatory comment, because I have no
idea what it does or when a user of the device would want
or need to set it... (I am guessing that part of the answer
may be "needed only by legacy users of this device that don't
want to break migration compatibility" ?)

>      DEFINE_PROP_END_OF_LIST(),
>  };

thanks
-- PMM
