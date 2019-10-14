Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp4585166wrm;
        Mon, 14 Oct 2019 08:37:29 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxhqgKZ12w4dLH4Hkl1/zvVE9tVDNzE59A7hEAgzYofiVDP9IlSM6uCx0J6hXyv7MkRvhRa
X-Received: by 2002:a17:906:4a97:: with SMTP id x23mr28381627eju.218.1571067449593;
        Mon, 14 Oct 2019 08:37:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571067449; cv=none;
        d=google.com; s=arc-20160816;
        b=WiglaRoPXDL5S3S7GIpuDqHuGEKmmOq3zDm12ONN8H5zmR/aSy/BcsP5K7zO+OPMX6
         jWc4YPXXOUwJbMwB4t9Q5yfl7jevM7NMzmKyh38ej+voLjqdq7hVF2PUHxx99/8ADuTF
         z5UBbUr6MCSPpQj5W368tNfDztqrfucF08nfCvpPEMbR71LYJG+/m54XvdlqSVBBb82l
         8xKLe41wcgjm0kIumeXdALvsGkyxbBJGPmmHJ9UwcLzf1O/WxNfQUhW8KXFlclpUWal8
         LjUBnoPbwCYdvXZ19VYwlcxJofLVGJ0K5JkAQlKh1ifA5yVETe5oN7daJjZrFK+DVJs2
         LbsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=y32A3HJkq/d3cuV4YZtMh4nWb24oTgdNXB+M2DCNMHA=;
        b=YtBqoJiq8UAein4RkrMVoZoukUkUcNF8/3AuAEAUzFBILxRjP87lAuvffvB5vw5/lY
         Y8QFgYKKrRuzWX54jCT4fe/x1OZV/b7sODXB2FSl27lXkE93ZuIXEuUXAxxJ5do35/WP
         nxG2/S0z6+DmOt0rLreMJgvtaXR4A5DEMAjT7SYheUplKRQtT8ZDxbbqtIT3wo1yUP5Y
         AEjxkyU7SjlJwyfbtn9wJWM2LUEoWRTYQtiliL2IGQ6gi7DWokBSwjWjap07zOQ1/FcJ
         jvsPMJMOw6kLQMs3rhZNQ3L4WAC/AXiW0nOYa1Jzj0N1l1HA2Hv0+jP2rVyvM1k6rpAx
         5EZw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="LTJhyt+/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b14si6772912eju.187.2019.10.14.08.37.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 14 Oct 2019 08:37:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="LTJhyt+/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:51578 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iK2PY-0004JK-Ip
	for alex.bennee@linaro.org; Mon, 14 Oct 2019 11:37:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60630)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iK2PP-0004HD-CM
 for qemu-arm@nongnu.org; Mon, 14 Oct 2019 11:37:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iK2PO-0002WV-79
 for qemu-arm@nongnu.org; Mon, 14 Oct 2019 11:37:19 -0400
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242]:33831)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iK2PO-0002W0-30
 for qemu-arm@nongnu.org; Mon, 14 Oct 2019 11:37:18 -0400
Received: by mail-oi1-x242.google.com with SMTP id 83so14119164oii.1
 for <qemu-arm@nongnu.org>; Mon, 14 Oct 2019 08:37:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=y32A3HJkq/d3cuV4YZtMh4nWb24oTgdNXB+M2DCNMHA=;
 b=LTJhyt+/lQvd7U7ZHETZkyBgut7BBmZ3qzIQDz337HWsmR7AZuwUx2zsaRy0O/EZuH
 x/Ib5QIcFp7UK4iHVmsxnB8S0NatTl3Caa1imNVRq2egRaurjlXvjXYZsUvi7+NYBuVT
 gN8psICUfFSeuLEh1kPZ2AORhzMwLXPl82TTXAG2Y2iWD8LnVx9eLQhgUEkur7R8L8Nf
 qNupytVd4P3RUX+Xqwj/Wv04ZLd5zrPGWyWqnyflR0ArB3tFiSmvvqLrrGCYCEbRLPy3
 OkKZQhiF/BC2cAHzekHuZ5DTNUCruLhGAvtdAttHeFbxJEter/cuWIB6eW/PXrrpaw9A
 b/DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=y32A3HJkq/d3cuV4YZtMh4nWb24oTgdNXB+M2DCNMHA=;
 b=RUiB2ok7r3+3zbuadrnZP+mYuLtWWQHj1Smhe+dxj7A13p9LZxErI2Lrww246QiPGR
 ZD4oMri9gcdLfV/w+B6w65NKqBGC/i8Un7WwYmln1GSXvfTjCwqvnXDFVd2QR6c7vSEA
 V2WKjxQXeQDujSEUVDTmFPMD5BE0x9DURA+7CJfStUS+Tty9lsOLU//F7KqzXxFRlANa
 t0a9UqcNEJ3VWEWVxEWQ7ffKmPH94uqtH4vpEPjsAyR4qk0C72mBN8O0MBalzTTPdJn0
 K7yDDQmjEq96PGpcHfH0Mi+dhTRASqXBFuCOUymT9Kfka/EbU9Ty/2jZZqrZL/s2gkH/
 NqNQ==
X-Gm-Message-State: APjAAAVzLcsjnj7/k5eyJjZlez/zRv1TqeBJKG9gBmoi6uYRIjiq8hpO
 /Uj4pf+5xAYTFo2zL3E1/JEN1WPexmRd7XBgDC8zXw==
X-Received: by 2002:aca:2b08:: with SMTP id i8mr23689243oik.146.1571067437188; 
 Mon, 14 Oct 2019 08:37:17 -0700 (PDT)
MIME-Version: 1.0
References: <20190926173428.10713-1-f4bug@amsat.org>
 <20190926173428.10713-9-f4bug@amsat.org>
In-Reply-To: <20190926173428.10713-9-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 14 Oct 2019 16:37:05 +0100
Message-ID: <CAFEAcA-2SCsRepsERqGWD-4AYy=uxb7Y2eW2F_z45tyo0Yx-fw@mail.gmail.com>
Subject: Re: [PATCH 08/19] hw/misc/bcm2835_thermal: Add a dummy BCM2835
 thermal sensor
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::242
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
Cc: =?UTF-8?Q?Zolt=C3=A1n_Baldaszti?= <bztemail@gmail.com>,
 Laurent Bonnans <laurent.bonnans@here.com>,
 Esteban Bosse <estebanbosse@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 BALATON Zoltan <balaton@eik.bme.hu>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 qemu-arm <qemu-arm@nongnu.org>,
 Clement Deschamps <clement.deschamps@antfield.fr>,
 Cleber Rosa <crosa@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Cheng Xiang <ext-cheng.xiang@here.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Pekka Enberg <penberg@iki.fi>, Guenter Roeck <linux@roeck-us.net>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Iwcd8qEkhhZu

On Thu, 26 Sep 2019 at 18:34, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
>
> We will soon implement the SYS_timer. This timer is used by Linux
> in the thermal subsystem, so once available, the subsystem will be
> enabled and poll the temperature sensors. We need to provide the
> minimum required to keep Linux booting.
>
> Add a dummy thermal sensor returning ~25=C2=B0C based on:
> https://github.com/raspberrypi/linux/blob/rpi-5.3.y/drivers/thermal/broad=
com/bcm2835_thermal.c
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
> checkpatch warning:
> WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?
> This is OK because the regex are:
>
>   F: hw/*/bcm283*
>   F: include/hw/*/bcm283*

> +static void bcm2835_thermal_class_init(ObjectClass *klass, void *data)
> +{
> +    DeviceClass *dc =3D DEVICE_CLASS(klass);
> +
> +    dc->realize =3D bcm2835_thermal_realize;
> +}

This is missing the vmsd and reset function.

thanks
-- PMM
