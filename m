Received: by 10.25.0.6 with SMTP id 6csp146975lfa;
        Fri, 2 Jun 2017 03:51:56 -0700 (PDT)
X-Received: by 10.200.42.107 with SMTP id l40mr8207456qtl.32.1496400716566;
        Fri, 02 Jun 2017 03:51:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1496400716; cv=none;
        d=google.com; s=arc-20160816;
        b=t27DVFq83SxjpYKh5O9ASMQUPESQTY60QhUzbOWJQA2wlQhj/+cNR+vJdUUjoD2ZV7
         ThZtTECtAQTaDsnvkrVAceqTJAy77XJiEEjT18jZo0y+bUuk7/PGU6Oas5bIz7XpnX3k
         b/Jhvg/Afn6T5+1LcsKgb06XMItHqidpPTy+nSdFASvHWQDNBOI2YO5X4MsiPZI5ys4m
         pZh0YL1fyFZyKvNtOqiwE4nnRcFnJF9Var+PXiZDKNmeBK76yD47m8F4VMau/O6Zloqw
         DkCBZ2MMiW26AK/3B8nK8mkzc6BtkTXcWHk3lqfhQhox1AbGTLzxRfmNK+h6qyZCTqXY
         YhCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=jeF8lg3t/eVrcZsjRVKJFPoNh0gU8WDxnfUf7OlEtZU=;
        b=huYv1GP5xqg26kcwfi12z0GkK8ldss9zPvidkHhWXS/kSf3ZHYy8qGbNJtZIUKl1mJ
         2dfRKikQgmy/ce6vTcAiIVcWUjh42Z7aY6ZRIPOi3XLUqND4xVEtATRVPi7Ft+S3Fa2t
         5Z0kbtYBf3TlHKQkWt7rfXNzYrABlowoWFyNAgWuJnHrOXWCig72zc1uHNJqMc7VNUMy
         bmFEr3FUuXGt3iG3eqiTD3bRI+zuHrA2eJgpDZ0iCxe354qxslr4FZrlO7l6UpjVtHPD
         NNIclIrev6r/zmLUU1JwvVhFs2oCoiGFVYDPm8MZLKcoSkOTweldvzv82JkYfcevD0YR
         SJFA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w202si21930466qka.93.2017.06.02.03.51.55
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 02 Jun 2017 03:51:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48939 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dGkBN-00069G-Ux
	for alex.bennee@linaro.org; Fri, 02 Jun 2017 06:51:54 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59048)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dGkBI-00068l-E7
	for qemu-arm@nongnu.org; Fri, 02 Jun 2017 06:51:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dGkBH-0000TQ-AP
	for qemu-arm@nongnu.org; Fri, 02 Jun 2017 06:51:48 -0400
Received: from mail-wm0-x232.google.com ([2a00:1450:400c:c09::232]:37903)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1dGkBH-0000T6-3V
	for qemu-arm@nongnu.org; Fri, 02 Jun 2017 06:51:47 -0400
Received: by mail-wm0-x232.google.com with SMTP id n195so22247427wmg.1
	for <qemu-arm@nongnu.org>; Fri, 02 Jun 2017 03:51:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=jeF8lg3t/eVrcZsjRVKJFPoNh0gU8WDxnfUf7OlEtZU=;
	b=P2FjDi4B/oXYYcnpTQBvG5YCOGEYGSeeQUeStfoF3x9mNeqJfYB4y1ejz8lOmEeisY
	lc1kXLGVoC7xCq947Mw4/PqMRSro26cSdJFc2sdl9kcoWQFGeNQ1X/ID1wd5HzgKY5is
	vOrYO247Ovf5YwhzcuK5RJn82M97AD/Y399uU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=jeF8lg3t/eVrcZsjRVKJFPoNh0gU8WDxnfUf7OlEtZU=;
	b=r2dA4SesAkjWmV/SCowbmXPUUfGOi+ukGDpTqFIleLDwA2xWA+4Fecf86U5k82ktYf
	bb4kyE3lwzmjgShlmvTvHD4Cml3zbpIDAs9PAa9C06OZ/lCbtzNN7fOWNDoEXiYQvpd3
	YAsjXn/nssFlFxKiuhciNnj6xNFhCZeVSpzUsrkWJhqIrS1KE5iLZ2Q0vYKWNBTNW4/x
	i/HSFpCx9dEwnpcgMN4q8KbZaxkVphfHTaW7jtX4FoxxiifuqmdVPwEhkjYhCvndxeNT
	5695pdBlZuQD9LOBXih8cLeUUiL/KemL1hUHbIP8FgyrBTP8R6HoKTPpr7s9HZm4KFCs
	3m2w==
X-Gm-Message-State: AODbwcADEtZl6usjkivCNY/SwtZRFcVp1twZ/Bk48owdI2SPhV0rtrQ5
	msTim+JSoGQv8kUJu7e56wtZY9lYfsnF
X-Received: by 10.223.156.26 with SMTP id f26mr4450897wrc.187.1496400705652;
	Fri, 02 Jun 2017 03:51:45 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.178.66 with HTTP; Fri, 2 Jun 2017 03:51:25 -0700 (PDT)
In-Reply-To: <1494827476-1487-6-git-send-email-clg@kaod.org>
References: <1494827476-1487-1-git-send-email-clg@kaod.org>
	<1494827476-1487-6-git-send-email-clg@kaod.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 2 Jun 2017 11:51:25 +0100
Message-ID: <CAFEAcA915cbt97g9f1iyTJ8CjZ96c1hbwHK2E-_57311dHSEuw@mail.gmail.com>
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::232
Subject: Re: [Qemu-arm] [PATCH 5/6] hw/misc: add a TMP42{1, 2,
 3} device model
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: OKsIL4sjDby9

On 15 May 2017 at 06:51, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
> Largely inspired by the TMP105 temperature sensor, here is a model for
> the TMP42{1,2,3} temperature sensors.
>
> Specs can be found here :
>
>         http://www.ti.com/lit/gpn/tmp421
>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>

This turns out to segfault on OSX and BSD...

> +static void tmp421_class_init(ObjectClass *klass, void *data)
> +{
> +    DeviceClass *dc =3D DEVICE_CLASS(klass);
> +    I2CSlaveClass *k =3D I2C_SLAVE_CLASS(klass);
> +    TMP421Class *sc =3D TMP421_CLASS(klass);
> +
> +    k->init =3D tmp421_init;
> +    k->event =3D tmp421_event;
> +    k->recv =3D tmp421_rx;
> +    k->send =3D tmp421_tx;
> +    dc->vmsd =3D &vmstate_tmp421;
> +    sc->dev =3D (DeviceInfo *) data;

...because this write to sc->dev is off the end of a
malloced block. You can see this with valgrind on Linux:

$ valgrind ./build/x86/aarch64-softmmu/qemu-system-aarch64
=3D=3D14009=3D=3D Memcheck, a memory error detector
[...]
=3D=3D14009=3D=3D Invalid write of size 8
=3D=3D14009=3D=3D    at 0x67D3D9: tmp421_class_init (tmp421.c:374)
=3D=3D14009=3D=3D    by 0x80CD51: type_initialize (object.c:334)
=3D=3D14009=3D=3D    by 0x80CABC: type_initialize (object.c:286)
=3D=3D14009=3D=3D    by 0x80DF49: object_class_foreach_tramp (object.c:805)
=3D=3D14009=3D=3D    by 0x1B7AE33F: g_hash_table_foreach (in
/lib/x86_64-linux-gnu/libglib-2.0.so.0.4800.2)
=3D=3D14009=3D=3D    by 0x80E028: object_class_foreach (object.c:827)
=3D=3D14009=3D=3D    by 0x80E1F7: object_class_get_list (object.c:881)
=3D=3D14009=3D=3D    by 0x5500A8: find_default_machine (vl.c:1488)
=3D=3D14009=3D=3D    by 0x554039: select_machine (vl.c:2745)
=3D=3D14009=3D=3D    by 0x55730E: main (vl.c:4091)
=3D=3D14009=3D=3D  Address 0x2b4e7cd0 is 0 bytes after a block of size 224 =
alloc'd
=3D=3D14009=3D=3D    at 0x4C2FB55: calloc (in
/usr/lib/valgrind/vgpreload_memcheck-amd64-linux.so)
=3D=3D14009=3D=3D    by 0x1B7C4770: g_malloc0 (in
/lib/x86_64-linux-gnu/libglib-2.0.so.0.4800.2)
=3D=3D14009=3D=3D    by 0x80CA8A: type_initialize (object.c:282)
=3D=3D14009=3D=3D    by 0x80CABC: type_initialize (object.c:286)
=3D=3D14009=3D=3D    by 0x80DF49: object_class_foreach_tramp (object.c:805)
=3D=3D14009=3D=3D    by 0x1B7AE33F: g_hash_table_foreach (in
/lib/x86_64-linux-gnu/libglib-2.0.so.0.4800.2)
=3D=3D14009=3D=3D    by 0x80E028: object_class_foreach (object.c:827)
=3D=3D14009=3D=3D    by 0x80E1F7: object_class_get_list (object.c:881)
=3D=3D14009=3D=3D    by 0x5500A8: find_default_machine (vl.c:1488)
=3D=3D14009=3D=3D    by 0x554039: select_machine (vl.c:2745)
=3D=3D14009=3D=3D    by 0x55730E: main (vl.c:4091)
=3D=3D14009=3D=3D

> +}
> +
> +static const TypeInfo tmp421_info =3D {
> +    .name          =3D TYPE_TMP421,
> +    .parent        =3D TYPE_I2C_SLAVE,
> +    .instance_size =3D sizeof(TMP421State),
> +    .instance_init =3D tmp421_initfn,
> +    .class_init    =3D tmp421_class_init,

...which is because this TypeInfo doesn't set the
.class_size field, so only sizeof(I2CSlaveClass) is
allocated, not sizeof(TMP421Class).

(http://wiki.qemu.org/Documentation/QOMConventions
lists this as one of the things you need to do for a class
that has a class struct).

> +};
> +
> +static void tmp421_register_types(void)
> +{
> +    int i;
> +
> +    type_register_static(&tmp421_info);
> +    for (i =3D 0; i < ARRAY_SIZE(devices); ++i) {
> +        TypeInfo ti =3D {
> +            .name       =3D devices[i].name,
> +            .parent     =3D TYPE_TMP421,
> +            .class_init =3D tmp421_class_init,
> +            .class_data =3D (void *) &devices[i],

This TypeInfo is a bit odd too, looking more closely at it.
It defines a type that's a subclass of TYPE_TMP421, but which
has a class_init method that's the same function as TYPE_TMP421's
class_init method. That means we call it twice for the same
class, which doesn't seem right.

> +        };
> +        type_register(&ti);
> +    }
> +}
> +
> +type_init(tmp421_register_types)
> --
> 2.7.4

I'm going to drop this patch and the next one from my arm
queue, but leave 1-4 in.

thanks
-- PMM
