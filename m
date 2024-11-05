Received: by 2002:a17:505:610b:b0:1be9:327d:8ee3 with SMTP id tt11csp3148632njc;
        Tue, 5 Nov 2024 14:25:36 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWOrrC55LzZuLSyKUUNo63JkcCWqMce08f7GPWmEtAYVDTis8CmWzIxdX6hVtTVqY+5XftvS73FHZoeRg==@linaro.org
X-Google-Smtp-Source: AGHT+IG77c499G4mEUPcmBC7+0nX5dcmzixWWpBqP4bt1NweNPH85MvKG/od+goTyKFlXLS2qLgf
X-Received: by 2002:a05:620a:4506:b0:7af:cff1:c770 with SMTP id af79cd13be357-7b2fb9bf00amr2775803485a.55.1730845536478;
        Tue, 05 Nov 2024 14:25:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1730845536; cv=none;
        d=google.com; s=arc-20240605;
        b=ZoCOkttAnIkpBwq6LBxTHCbGt90HCP82L+0eGPyXCt3PDGCncGRA71WmtPibifOuE7
         9fuD596x5EAuMVKsFmspYgt8x+QWuACoAQdOXparFaVgBoySYDNpnhwxva2OjYZXp61G
         wj6dpmIc3+uH67yFXQLFPlnIU/+WBWIhPvr7vEg9MJKK9pSVMv8tlQRes9r6AAjC3R9o
         zfRv5FnIDsL04Ks6grohZMJszOx94oZC0XbwufuO85rCVwPdAnkjaGQvRKuag6OaXMda
         uI7Uqy/elm9w/Az3HisDVHI1zJh87P9mA0kbFNM44XnP6xmLPv71xj4kkkWCNIKKxXTF
         OGWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=wwOa7p3OlaATrioEOLE8Gozv/YHcDzoNnyvAkZRc32U=;
        fh=ts+oGhtFo9awmBZWXwIDaZ7QEsMYS7xAymrYomX05Bo=;
        b=fYQgK8eCuC9cLcnrEi/rU+6QlyhA3Wm7dWF6pFxv5IRzItdaJMksmVNWxOHgOgdrpA
         bJbbED/lv8ZPgt1xXUgUcZAVu3386YJ0xiT4ughYwjTx9W7LXBeBwliRsKiHlGNVstce
         4jnvv1bWit/cSTW39BlgVuGDpZ3C2i/sVJbdMhszV503EP9yADe6rzodkzWguDXBEr9N
         JQVJErOY9nAp3hvlsbAtmy48VSvTVmpC5WMH6A+4ACvcohQDAXUrhJe4fCMVKnNDyoJO
         V4otDJMT56s7cQPD3Tv5iO/apBUsXYk7dpGJnCm/wc5lxOSuPwt6kmdA+N8VfNdexZG1
         yRLw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=nikz4N8B;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7b2f3a9b804si1444980285a.384.2024.11.05.14.25.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 05 Nov 2024 14:25:36 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=nikz4N8B;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1t8RzA-0002zn-Jh; Tue, 05 Nov 2024 17:25:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1t8Rz8-0002xl-JF; Tue, 05 Nov 2024 17:25:14 -0500
Received: from mail-ua1-x92d.google.com ([2607:f8b0:4864:20::92d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1t8Rz6-0000HC-Rx; Tue, 05 Nov 2024 17:25:14 -0500
Received: by mail-ua1-x92d.google.com with SMTP id
 a1e0cc1a2514c-84fc818f518so2001049241.2; 
 Tue, 05 Nov 2024 14:25:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730845511; x=1731450311; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wwOa7p3OlaATrioEOLE8Gozv/YHcDzoNnyvAkZRc32U=;
 b=nikz4N8BwUDqJBrzAeXk8Nlf08Z7beJq0pQ1qH+iv48W5fwq0u3F224s0NHptG1VV7
 XiUVMLJ9oyZzKVmyi+/qfXOHS1RkQkbIVa+FpL+vr5evcaJHTwh2nvgpiv4+RWDg0mrM
 cfPpmGFZ/xEgLxH6bnF1TKrmZuZBA2SQsvZy3DJjJi179gwZmGnmHe4+KfwjKLry1kWB
 Nxe/y6hBOKi31kkgHdiux9Hg97hVolw8N+29GmvFUz0iULwuRns+/rpRPDaqAkFO+FRG
 c6VLZ/gk71bzLME4lnrKruu6Pw6EXBjiDiHa5n6cSE3tyrXvBIvL89IQFUwmVPicJb/s
 PLwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730845511; x=1731450311;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wwOa7p3OlaATrioEOLE8Gozv/YHcDzoNnyvAkZRc32U=;
 b=bI3BSluf3Tn1SNeD9C9xrqiogfS1O+k3f20fRIDqMNp/3FiwLE4KKJ7fD6Oxv553md
 4QMAUMVWfYYpipEfxH5DnugPOlvgp0h1rcJq5W4a3qL2jFqk1FEcLL9l/4YKAzLiUhZE
 eJC7/IvEOGQsxy/K+ubp5rCnsFRe+sVK9LVJXLFO0HOL4A+byqn3mEFkUu1hwNLJyhs1
 X4j03RxNhWrns1zlAPWqI/kzHvDn1AKx4nFBFROgNs4SkXCF9YklCBpH1mXHSeKtJ4vS
 w09dtCHXeVoECCdADvRZuOgutzqNfEAgiaKxqvt/lAwIak2ULLc/fx/b3uADo1ieOqQc
 wUAg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUwuy4zfasM0iPfUZlcG+r+00LTLwDtOkDURtLdNa9ja4sZdUROfbrV9ULJg8EshviiZiWwW4Jy5Q==@nongnu.org
X-Gm-Message-State: AOJu0YwaGlxwBDHP/X2x9APx8Sh9TraLZkRBOQiNXK65arL8UDGmYifE
 KJL9+tzeAQMxIcxtDDAJ9FGhpCKwu4fU8cmA2ptvpl/bx6VmqkzMbyEWz+5mxEDKvBMlPGNLhlR
 +6BejrSkzOzaow+pkXHMlWqdJgQs=
X-Received: by 2002:a05:6102:3f0d:b0:4a4:6098:1fec with SMTP id
 ada2fe7eead31-4a962d6cbc9mr16539935137.2.1730845511380; Tue, 05 Nov 2024
 14:25:11 -0800 (PST)
MIME-Version: 1.0
References: <20241105130431.22564-1-philmd@linaro.org>
 <20241105130431.22564-10-philmd@linaro.org>
In-Reply-To: <20241105130431.22564-10-philmd@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 6 Nov 2024 08:24:45 +1000
Message-ID: <CAKmqyKN6TzFbPSeQyBN4QrVLxAvTr--nsu7nbA+VFGq=cv7Y3Q@mail.gmail.com>
Subject: Re: [PATCH 09/19] hw/intc/xilinx_intc: Only expect big-endian accesses
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Anton Johansson <anjo@rev.ng>, 
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, 
 Alistair Francis <alistair@alistair23.me>, Thomas Huth <thuth@redhat.com>,
 qemu-arm@nongnu.org, devel@lists.libvirt.org,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Jason Wang <jasowang@redhat.com>, 
 Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::92d;
 envelope-from=alistair23@gmail.com; helo=mail-ua1-x92d.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 8CLKj85RzpXV

On Tue, Nov 5, 2024 at 11:08=E2=80=AFPM Philippe Mathieu-Daud=C3=A9
<philmd@linaro.org> wrote:
>
> Per the datasheet (reference added in file header, p.9)
> 'Programming Model' -> 'Register Data Types and Organization':
>
>     "The XPS INTC registers are read as big-endian data"
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>

Acked-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/intc/xilinx_intc.c | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)
>
> diff --git a/hw/intc/xilinx_intc.c b/hw/intc/xilinx_intc.c
> index 1762b34564e..71f743a1f14 100644
> --- a/hw/intc/xilinx_intc.c
> +++ b/hw/intc/xilinx_intc.c
> @@ -3,6 +3,9 @@
>   *
>   * Copyright (c) 2009 Edgar E. Iglesias.
>   *
> + * https://docs.amd.com/v/u/en-US/xps_intc
> + * DS572: LogiCORE IP XPS Interrupt Controller (v2.01a)
> + *
>   * Permission is hereby granted, free of charge, to any person obtaining=
 a copy
>   * of this software and associated documentation files (the "Software"),=
 to deal
>   * in the Software without restriction, including without limitation the=
 rights
> @@ -143,12 +146,20 @@ static void pic_write(void *opaque, hwaddr addr,
>  static const MemoryRegionOps pic_ops =3D {
>      .read =3D pic_read,
>      .write =3D pic_write,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    /* The XPS INTC registers are read as big-endian data. */
> +    .endianness =3D DEVICE_BIG_ENDIAN,
>      .impl =3D {
>          .min_access_size =3D 4,
>          .max_access_size =3D 4,
>      },
>      .valid =3D {
> +        /*
> +         * All XPS INTC registers are accessed through the PLB interface=
.
> +         * The base address for these registers is provided by the
> +         * configuration parameter, C_BASEADDR. Each register is 32 bits
> +         * although some bits may be unused and is accessed on a 4-byte
> +         * boundary offset from the base address.
> +         */
>          .min_access_size =3D 4,
>          .max_access_size =3D 4,
>      },
> --
> 2.45.2
>
>
