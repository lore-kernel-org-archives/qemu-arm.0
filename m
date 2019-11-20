Received: by 2002:a19:6911:0:0:0:0:0 with SMTP id e17csp1959544lfc;
        Wed, 20 Nov 2019 04:58:02 -0800 (PST)
X-Google-Smtp-Source: APXvYqzLPFDCz89lcGygrVF7kbwOnn94gZMHe158zABbFevjOnvdefU6P6bUtobyL/kaaCEiwd6/
X-Received: by 2002:ac8:2dc9:: with SMTP id q9mr2445960qta.219.1574254681937;
        Wed, 20 Nov 2019 04:58:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1574254681; cv=none;
        d=google.com; s=arc-20160816;
        b=sOADKDhzyjHCD8mWx2gzVZIqV7lAIFJXr7m1P6+rRbuaAn7Wfro6+ZKejKrSlajc4q
         6vfvklFnN4jqyQ0ET9gGqY89ujPg1NXun0uWf6H960rTV45JFS7dlSvqtkKGDldnv4AU
         szweH8EhTQa6FsD6yhBN9uy878aWnWZN2Jz6nnlB8rDrwQ3igr5IcHFQjNTSomXY0KfM
         znTYebtVIxY67WLqR6cdpajvEVeFEhPrXHWuDDsFeSTETVXK4re/dhz+xY/GB9zFt2ta
         LtNsrd+x4p1EzDtSZuhK9Dqpsyzwj0eyT5tcgXrBCMl/EG6TW9kMajpa+SmtvzaslQ6g
         pvrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=H/Ctjf8+Vu2PC1M/BSDoeVyXahzZHXAbzR9A6DKDxlY=;
        b=jlwR7C0oJom8TXh0mJnluuVVI2Mq7CWIN2QkdpwdNyguIWm8QChf+9mdTPYp2pLX08
         cUuq8ds59sTzSdSDAqCi8FNrZr+ghlODXRH3MIB3a3s58mbN2zHuJszi6dHxUZA9bZ8U
         HVnqX5o9noxnm0kWubkGsMKQTCtBhEN+EQ+jNi1cSbBDgYiN1Cg8+yG5Ex1QlAYxo5Ta
         cf/3BWQI1LWex2UDpcxZoX79FZ6RF7ibBz6wADinJtoQHr+wENzxvzrwKSDsLhpn2ki0
         eJnFw466sFhOsqi9Hs15rXzHzcpsMvh9XHgEJGy5ie5RrbJQCol7FQ7DmlqQyp4RXLv8
         w/cg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=b+bS3YoG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n14si2816310qtp.309.2019.11.20.04.58.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 20 Nov 2019 04:58:01 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=b+bS3YoG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:57426 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iXPYX-0001DX-3v
	for alex.bennee@linaro.org; Wed, 20 Nov 2019 07:58:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33225)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1iXPXz-0001Cc-UP
 for qemu-arm@nongnu.org; Wed, 20 Nov 2019 07:57:29 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1iXPXy-0007lq-MQ
 for qemu-arm@nongnu.org; Wed, 20 Nov 2019 07:57:27 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:33485
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1iXPXx-0007lc-V1
 for qemu-arm@nongnu.org; Wed, 20 Nov 2019 07:57:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1574254645;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=H/Ctjf8+Vu2PC1M/BSDoeVyXahzZHXAbzR9A6DKDxlY=;
 b=b+bS3YoGAkNE216Sz+Xh41z7nmdcqEOiXdauOUlhStAmx1wIZiQcOuEFvmsI/11jDk/9XY
 UJUFOdOaC+qG8R2RZvYipP2Rgt6p7SYhugtvsFTbDLaSGOQgOl9vW399gdlM8N0gAeiPno
 ESU/Ah7gFX1S1/dxtAivtMBPaPYArsQ=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-299-LtNEkN2tOR-JVXWVr4tNqA-1; Wed, 20 Nov 2019 07:57:16 -0500
Received: by mail-wm1-f71.google.com with SMTP id y14so5087845wmi.4
 for <qemu-arm@nongnu.org>; Wed, 20 Nov 2019 04:57:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=oAQSreoPfD9tCgT5z71iCNKY83QDH30dryE1pdkJyd8=;
 b=UaqvfGUmNcaXq3kBb8LBsE+2T7HikxUbSKy40xf+tPiUr+lyBjWhDdroNGXLOwsQRl
 iC2XWuZVk5HH03tor/2s0L/K7N1tau7iKvZ4tCDLGWvIc4iHYNzhwgkfKkG578dWrRGz
 tJ9Wz/QvGkfDaDLB33GGU1lZzzLbfJWSn8I4a83anskMvSUfGShIJIbwQbPv/yqVY3U5
 iUgvFImRxhL1uxuGqoejmgwGajnjC0ZVUR1PnyDeofU3cxyWVRjrz8HO4m1AvqXKW1U8
 Nk2v+2bDjt2TPlUjnF5SbUSgRNEoSxOF+1xVL0ntX3EivlXXwuXlKc8P9+5jDhG0BzIh
 QO3Q==
X-Gm-Message-State: APjAAAVkMoh9o/ImHOa2cFAmSn5tRjzCA4rYKE+xAW9/TLQp/daLb8uV
 5ini6ctENqZCyplU8GbSiBWQThpKU04szgYKBAES1byRMRpnGLnLzs7pZTqbscsB0D7mUTjFH6D
 YCZ2mt5jJ7qzs
X-Received: by 2002:a1c:9646:: with SMTP id y67mr3009925wmd.79.1574254635509; 
 Wed, 20 Nov 2019 04:57:15 -0800 (PST)
X-Received: by 2002:a1c:9646:: with SMTP id y67mr3009887wmd.79.1574254635302; 
 Wed, 20 Nov 2019 04:57:15 -0800 (PST)
Received: from [10.201.33.134] ([195.166.127.210])
 by smtp.gmail.com with ESMTPSA id o1sm31394257wrs.50.2019.11.20.04.57.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Nov 2019 04:57:14 -0800 (PST)
Subject: Re: [PATCH v3 15/33] serial-mm: add endianness property
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 qemu-devel@nongnu.org
References: <20191023173154.30051-1-marcandre.lureau@redhat.com>
 <20191023173154.30051-16-marcandre.lureau@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <7581fd7f-9284-9f62-493d-16831209cc0b@redhat.com>
Date: Wed, 20 Nov 2019 13:57:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191023173154.30051-16-marcandre.lureau@redhat.com>
Content-Language: en-US
X-MC-Unique: LtNEkN2tOR-JVXWVr4tNqA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
Cc: Corey Minyard <cminyard@mvista.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Magnus Damm <magnus.damm@gmail.com>,
 Jason Wang <jasowang@redhat.com>, qemu-ppc@nongnu.org,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Fabien Chouteau <chouteau@adacore.com>,
 Aleksandar Rikalo <arikalo@wavecomp.com>,
 KONRAD Frederic <frederic.konrad@adacore.com>, qemu-arm@nongnu.org,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Paul Burton <pburton@wavecomp.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: U5eENHirDrdf

On 10/23/19 7:31 PM, Marc-Andr=C3=A9 Lureau wrote:
> Add a qdev property for endianness, so memory region setup can be done
> in realize.
>=20
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> ---
>   hw/char/serial.c         | 2 ++
>   include/hw/char/serial.h | 1 +
>   2 files changed, 3 insertions(+)
>=20
> diff --git a/hw/char/serial.c b/hw/char/serial.c
> index c28cfc94fd..2f7667c30c 100644
> --- a/hw/char/serial.c
> +++ b/hw/char/serial.c
> @@ -1081,6 +1081,7 @@ SerialMM *serial_mm_init(MemoryRegion *address_spac=
e,
>       qdev_prop_set_uint32(DEVICE(s), "baudbase", baudbase);
>       qdev_prop_set_chr(DEVICE(s), "chardev", chr);
>       qdev_prop_set_int32(DEVICE(s), "instance-id", base);
> +    qdev_prop_set_uint8(DEVICE(s), "endianness", end);
>  =20
>       qdev_init_nofail(DEVICE(s));
>       qdev_init_nofail(DEVICE(self));
> @@ -1102,6 +1103,7 @@ static void serial_mm_instance_init(Object *o)
>  =20
>   static Property serial_mm_properties[] =3D {
>       DEFINE_PROP_UINT8("regshift", SerialMM, regshift, 0),
> +    DEFINE_PROP_UINT8("endianness", SerialMM, endianness, DEVICE_NATIVE_=
ENDIAN),

The endianess is related to how the chipset is wired, but is not an=20
intrinsic part of it.
Previously, serial_mm_init() was taking care of doing the correct wiring.
Now it seems the endianess is a property from the hardware.

Anyway:
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

>       DEFINE_PROP_END_OF_LIST(),
>   };
>  =20
> diff --git a/include/hw/char/serial.h b/include/hw/char/serial.h
> index 759c85976d..2d0802a909 100644
> --- a/include/hw/char/serial.h
> +++ b/include/hw/char/serial.h
> @@ -86,6 +86,7 @@ typedef struct SerialMM {
>       SerialState serial;
>  =20
>       uint8_t regshift;
> +    uint8_t endianness;
>   } SerialMM;
>  =20
>   extern const VMStateDescription vmstate_serial;
>=20

