Received: by 2002:a19:fc0b:0:0:0:0:0 with SMTP id a11csp167721lfi;
        Mon, 18 Nov 2019 07:10:44 -0800 (PST)
X-Google-Smtp-Source: APXvYqznotJt7LlI2jEEPEuyHdYeQFPKECkhWRl0opZkg7L98M+keme39exNJYKfw7OV4EwsDH0r
X-Received: by 2002:a17:906:16d2:: with SMTP id t18mr6580732ejd.237.1574089844843;
        Mon, 18 Nov 2019 07:10:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1574089844; cv=none;
        d=google.com; s=arc-20160816;
        b=wGMBut2bjo1pAjVStbAjlMFbAmfNLCk5ZqDExo4SMT2yXDjCIgNBNn7CYCbRbqN5nY
         e6bfDtiudSDPD3zoTvQJhp6Pb+DMCJrBVnmjB+BX/V/hcLXQGyZhRAeiLOtIiHA6me4L
         qguiNGibsMkAL4yZInA44uTYUPpUlNZrqvzRcQcQ/BJZay5w5CtkGyp/Yenq9LUouu8e
         GlBRrOM6i0ehtR1IkBWpCaj6GOdyEu3ZAhAZvVo5bqAioq4ejchWsWXvLwkpUuuUDFSP
         AkL2MJkO/EdIDroizFGpq1dR1kX4C9NemL6OGD5sLfikox1MOKttqqmJda1egPQw/ANS
         fLRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=UxJMcj3gSkUwtG9i1TYK0QPdWQn+bSKc9twhv/f8RNw=;
        b=aIeQiC+0k2x8WYOW0c8lILQFMLHqjBibCYQzkqwjhneUrgn2pI9QSoN13lbuGoa3+A
         xkT5+nAUWbcYoIEGz+Tm/EdH1v21hQYFj0nmD7cwcQ/uhQ0lbPDcf0Agxkc//FayByVs
         hmfGVBSp6Z69pbHT4YZNtT+E4t4PJOb2LECjWdL6IQg4J+mzwtEXt+4RvAZSM+s2UcFD
         oUnRXE7NrTJPStKW7s6NnAbGRRj2u/dba8Py1zyB6InG0ey1ZfzyvfYYYOrGc5ur731E
         Y3Zi/Od1RzUoGGYqbReMHhDeUU6rtLSworgjc3/MX9cyWhtTtH0D+PBryOszHZ5ybHUS
         lDIw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=o42MLXXz;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i3si11395518ejv.41.2019.11.18.07.10.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 18 Nov 2019 07:10:44 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=o42MLXXz;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35368 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iWifr-0002Jp-PT
	for alex.bennee@linaro.org; Mon, 18 Nov 2019 10:10:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34684)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iWif6-0001hj-B5
 for qemu-devel@nongnu.org; Mon, 18 Nov 2019 10:09:57 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iWif5-0003TJ-4z
 for qemu-devel@nongnu.org; Mon, 18 Nov 2019 10:09:56 -0500
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:45973)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iWif4-0003Sr-TC
 for qemu-devel@nongnu.org; Mon, 18 Nov 2019 10:09:55 -0500
Received: by mail-ot1-x343.google.com with SMTP id r24so14761061otk.12
 for <qemu-devel@nongnu.org>; Mon, 18 Nov 2019 07:09:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=UxJMcj3gSkUwtG9i1TYK0QPdWQn+bSKc9twhv/f8RNw=;
 b=o42MLXXzEQDsYIvxMwe8788UKW6e7SC9ixSycJ/jYnDkWS4Uq4TRN9YwaZRxnSYSdh
 7sP5dq6LyBl5AIOK+QASBEzPIJaHVYHhBupsllsY28O0Kg0UKzTIDKPTT+hrgmjOhdGD
 1lDthXpBwYCL37CnFmOM6W4rhQmS0gbIme7LhZuTv5lqTN6zbOTRicm1yFdSa3GgGdwi
 a+UofJLb13N/3Y2b/wQWZyR/TSaEy/mehoNSaPdbAk4Nb9aHCl2MP7vMCJBloPwY7QET
 ZKXrWarIivB+OohJwI88xFFBFCuh73/qjHWYfrEzpB6lXWkrXTV0YsxAqzT1xTKLu3Io
 D6Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=UxJMcj3gSkUwtG9i1TYK0QPdWQn+bSKc9twhv/f8RNw=;
 b=YcfJ7DMT+zVHTsbgyHJ6kqUx6PyQVk2R9gNXdZElHwV9xwO5QFIeERRF4IXP/VZdpW
 147lgCG7rdihe6RB47KgIHeMB4us84aAiuO1MKz6hCrg/Y0VQVnYdJuxUdSwt6jgWOSY
 kWTGB850TS2LZwpCckQZtd0V/epBMcQywJUc1koke3xe7+4gmB/1yy5iwkFXipExZhu8
 K8hHa5hSXMwzq+aLyi/syoqjddGDzv/Ho0BN6kSemxXD/cQIhtAVga6spxFUCpa3xgbG
 qP7ZB8chGrzOBJvN7NuvM9ikcw+rKDZ01KgyG705HzNKGomXrBSJAM/xyvMO81axiZg+
 zNFA==
X-Gm-Message-State: APjAAAVW8wV0uGG/4HaPvSUbzly1ItOBS2WoKBucfKOFgxIO89/M/DpA
 p33zK2p7MNIPPB2P++nc4Kxf3FmGc6CltR86JImVNg==
X-Received: by 2002:a9d:7ac2:: with SMTP id m2mr22906775otn.135.1574089794099; 
 Mon, 18 Nov 2019 07:09:54 -0800 (PST)
MIME-Version: 1.0
References: <20191023173154.30051-1-marcandre.lureau@redhat.com>
 <20191023173154.30051-17-marcandre.lureau@redhat.com>
In-Reply-To: <20191023173154.30051-17-marcandre.lureau@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 18 Nov 2019 15:09:43 +0000
Message-ID: <CAFEAcA-dShnHHGEYrsmc+27aUrH7WUMn3=Pvn92B8XH=qtYFBQ@mail.gmail.com>
Subject: Re: [PATCH v3 16/33] serial-mm: use sysbus facilities
To: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::343
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Corey Minyard <cminyard@mvista.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 QEMU Developers <qemu-devel@nongnu.org>,
 KONRAD Frederic <frederic.konrad@adacore.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Paul Burton <pburton@wavecomp.com>, Magnus Damm <magnus.damm@gmail.com>,
 =?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Fabien Chouteau <chouteau@adacore.com>, qemu-arm <qemu-arm@nongnu.org>,
 Richard Henderson <rth@twiddle.net>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-ppc <qemu-ppc@nongnu.org>, Aleksandar Markovic <amarkovic@wavecomp.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Vq0Eg5CDJSOJ

On Wed, 23 Oct 2019 at 18:34, Marc-Andr=C3=A9 Lureau
<marcandre.lureau@redhat.com> wrote:
>
> Make SerialMM a regular sysbus device, by registering the irq, and the
> mmio region. Reexport the internal serial properties.
>
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> ---
>  hw/char/serial.c | 35 ++++++++++++++++++++++++-----------
>  1 file changed, 24 insertions(+), 11 deletions(-)
>
> diff --git a/hw/char/serial.c b/hw/char/serial.c
> index 2f7667c30c..a40bc3ab81 100644
> --- a/hw/char/serial.c
> +++ b/hw/char/serial.c
> @@ -1074,21 +1074,18 @@ SerialMM *serial_mm_init(MemoryRegion *address_sp=
ace,
>                              Chardev *chr, enum device_endian end)
>  {
>      SerialMM *self =3D SERIAL_MM(qdev_create(NULL, TYPE_SERIAL_MM));
> -    SerialState *s =3D &self->serial;
> +    MemoryRegion *mr;
>
>      qdev_prop_set_uint8(DEVICE(self), "regshift", regshift);
> -    s->irq =3D irq;
> -    qdev_prop_set_uint32(DEVICE(s), "baudbase", baudbase);
> -    qdev_prop_set_chr(DEVICE(s), "chardev", chr);
> -    qdev_prop_set_int32(DEVICE(s), "instance-id", base);
> -    qdev_prop_set_uint8(DEVICE(s), "endianness", end);
> -
> -    qdev_init_nofail(DEVICE(s));
> +    qdev_prop_set_uint32(DEVICE(self), "baudbase", baudbase);
> +    qdev_prop_set_chr(DEVICE(self), "chardev", chr);
> +    qdev_prop_set_int32(DEVICE(self), "instance-id", base);
> +    qdev_prop_set_uint8(DEVICE(self), "endianness", end);

(this last line should be in patch 15)

>      qdev_init_nofail(DEVICE(self));
>
> -    memory_region_init_io(&s->io, NULL, &serial_mm_ops[end], self,
> -                          "serial", 8 << regshift);
> -    memory_region_add_subregion(address_space, base, &s->io);
> +    sysbus_connect_irq(SYS_BUS_DEVICE(self), 0, irq);
> +    mr =3D sysbus_mmio_get_region(SYS_BUS_DEVICE(self), 0);
> +    memory_region_add_subregion(address_space, base, mr);
>
>      return self;
>  }
> @@ -1099,6 +1096,8 @@ static void serial_mm_instance_init(Object *o)
>
>      object_initialize_child(o, "serial", &self->serial, sizeof(self->ser=
ial),
>                              TYPE_SERIAL, &error_abort, NULL);
> +
> +    qdev_alias_all_properties(DEVICE(&self->serial), o);
>  }
>
>  static Property serial_mm_properties[] =3D {
> @@ -1107,11 +1106,25 @@ static Property serial_mm_properties[] =3D {
>      DEFINE_PROP_END_OF_LIST(),
>  };
>
> +static void serial_mm_realize(DeviceState *dev, Error **errp)
> +{
> +    SerialMM *self =3D SERIAL_MM(dev);
> +    SerialState *s =3D &self->serial;

Again, 'self' isn't idiomatic in QOM methods.

> +
> +    qdev_init_nofail(DEVICE(s));
> +
> +    memory_region_init_io(&s->io, NULL, &serial_mm_ops[self->endianness]=
, self,
> +                          "serial", 8 << self->regshift);
> +    sysbus_init_mmio(SYS_BUS_DEVICE(self), &s->io);
> +    sysbus_init_irq(SYS_BUS_DEVICE(self), &self->serial.irq);
> +}
> +
>  static void serial_mm_class_init(ObjectClass *klass, void* data)
>  {
>      DeviceClass *dc =3D DEVICE_CLASS(klass);
>
>      dc->props =3D serial_mm_properties;
> +    dc->realize =3D serial_mm_realize;
>  }
>
>  static const TypeInfo serial_mm_info =3D {
> --
> 2.23.0.606.g08da6496b6

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
