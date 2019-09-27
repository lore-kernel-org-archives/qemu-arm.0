Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp4028371wrp;
        Fri, 27 Sep 2019 14:43:09 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxXGAemTZhyX6CNo+eTrFdYhZ+lxTz7Fz0qDkDV3brhbKRU48LTnRjAF5B/qfZxJUtCcqTu
X-Received: by 2002:a0c:8867:: with SMTP id 36mr10112110qvm.177.1569620588860;
        Fri, 27 Sep 2019 14:43:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1569620588; cv=none;
        d=google.com; s=arc-20160816;
        b=cK/UcG9rI5Rnxs5J2Hkutniq12QSgyhsu3fgGWJSU0ESKHIsZbkt7E/4qrSKkT8PR9
         YcUOUElrLl3V+tZKBLgF4LwgjfG5VitxgO/lwNGhZKoMCTtckd6ed1wJ0WhI9QJPzE9l
         fZpbgmrWRE8TbR/1kbAWWMHpcAT2lbWlwI5UBsIPiJNT8KQYklv1+9pqyjrvsPEo0IJ7
         S0zjT61WQfj/h2asD9T4WK7EANNWJKwA3JdPbX1r9dLOa9RRGQnykFLtie7iFD2YOoQX
         sI8TP9RSB/syEap+Qpnt+D/Kgwj5MHv1U322WSmQzUIJF/ewQHrIju00ubYMODh4m7f3
         5vnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=7ai9FymlssHTVJ4+wNEtq7TIzct8wXX8me30CyW3QFY=;
        b=zNcgzzsrCl5GqIlG9A6AFRR2dZm+cMu5l02Ze7yxiP6x2SNG785p7wY4AlP8O0K8EW
         hX4wbm3kQhYFajiN2zPxJBZlj0mmFA/DidGc5cZLnMiDL2TdYQgxu71QLK3gudtWZdsq
         RJ9MS6hT1JFwKD44JZMmCIUdoP53dqrCYumqZ+I2HBT2IFcUWTXIzm08e1wORAbZIGoI
         RdHVypeP0SXDsKOv0BvkPovXPJQ9wBPtzjNCtSUg1pjeTseE54G6k6IDeawo7jC9wwNI
         bZCE3qrhs+1ai5olWliwZiOf/jF3e16gGEe1oFwx0MXiR/9k/34mq1O3XozFBrOsUhFn
         5c1w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=HiRXd7Lh;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e67si3520833qkd.190.2019.09.27.14.43.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 27 Sep 2019 14:43:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=HiRXd7Lh;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:57784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iDy15-0001SI-VE
	for alex.bennee@linaro.org; Fri, 27 Sep 2019 17:43:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34481)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alistair23@gmail.com>) id 1iDxzS-0001Qx-5v
 for qemu-devel@nongnu.org; Fri, 27 Sep 2019 17:41:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alistair23@gmail.com>) id 1iDxzP-0003fJ-Qm
 for qemu-devel@nongnu.org; Fri, 27 Sep 2019 17:41:26 -0400
Received: from mail-lf1-x141.google.com ([2a00:1450:4864:20::141]:42837)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alistair23@gmail.com>)
 id 1iDxzO-0003dl-OX; Fri, 27 Sep 2019 17:41:22 -0400
Received: by mail-lf1-x141.google.com with SMTP id c195so2949952lfg.9;
 Fri, 27 Sep 2019 14:41:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=7ai9FymlssHTVJ4+wNEtq7TIzct8wXX8me30CyW3QFY=;
 b=HiRXd7Lhf/8C74qUaHhNE3cN7F/mxSI5XjATRDWQqDuSkMLHEnfu5NSf0bG/20hxFa
 np/DGvZlapEFJuY6Tqq7wjHrRRmqbRdYWu5FXj9ecx5r9lDWtPywyyJZLHGD/OEML5kk
 XWoP7On7xRNOT9Q8FPTX8yd8ZeuBXm4x1jAUUsjdPEA9iNFaJxyQq9q8GLENkKqZVN13
 Baaam1R4x8MduaAWQuh9YzVtcxy5WapuoihmqgjTMt9CX6qfHAhZkabP8wrBEx2KVjXq
 inKgpDHsFh9eUuZmPYvup9H0RLHwyhiEXRMT0tWFRRedmHXuNOIprfUqVT8iEQmXCjoc
 We2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=7ai9FymlssHTVJ4+wNEtq7TIzct8wXX8me30CyW3QFY=;
 b=IgbV8QmoeJ6m/40aDBakLLC/6Rixqcf8dAjrEY6FKI3iJB1MF/gnrw1T5/rD1fZWZs
 sHM89yjObq57s4RmOzdMDoPaPoyRQxUFN06dIFcZdf01dfk4r+dmOxJsvbDzVigbJBBG
 csdv00Z9wf67CP66VKk03aoIieSvXHEFQyJfA+aD7eiMQjtKJ1eJc0bBUhqPHenUudMY
 /jyAqi1tmZbyd7l7kwD0cFcPcNocMwBiQDrr5xYJ8DZLOoknOBzc06Ih4rXdWN1BUGG7
 sdQLmPW6k/+8UuqmBCWKbAUM+Sqzd3PXVfcFJCf2OGytfTRvXIxkjwyZ0SRzpOI1FNPV
 lCfw==
X-Gm-Message-State: APjAAAWwxsmtov1jPpSWVTjGwCwftlZQmBG4JqSkbD0W281SMabOSt+1
 dFAqlcOlTj6BZaQFR/hkbKXwmQSadzj9vFwItwE=
X-Received: by 2002:ac2:5e9e:: with SMTP id b30mr4207561lfq.5.1569620480935;
 Fri, 27 Sep 2019 14:41:20 -0700 (PDT)
MIME-Version: 1.0
References: <20190926173428.10713-1-f4bug@amsat.org>
 <20190926173428.10713-2-f4bug@amsat.org>
In-Reply-To: <20190926173428.10713-2-f4bug@amsat.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 27 Sep 2019 14:36:33 -0700
Message-ID: <CAKmqyKO4aNVjh+w0MT29etz6tTrH_k1EoQKyi5xG0n9bTW_8kg@mail.gmail.com>
Subject: Re: [PATCH 01/19] hw/arm/raspi: Use the IEC binary prefix definitions
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::141
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Zolt=C3=A1n_Baldaszti?= <bztemail@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Alistair Francis <alistair@alistair23.me>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Esteban Bosse <estebanbosse@gmail.com>, Cleber Rosa <crosa@redhat.com>,
 qemu-arm <qemu-arm@nongnu.org>,
 Clement Deschamps <clement.deschamps@antfield.fr>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 Laurent Bonnans <laurent.bonnans@here.com>,
 Cheng Xiang <ext-cheng.xiang@here.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Pekka Enberg <penberg@iki.fi>, Guenter Roeck <linux@roeck-us.net>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: wJM0RBJns5tx

On Thu, Sep 26, 2019 at 10:36 AM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.o=
rg> wrote:
>
> IEC binary prefixes ease code review: the unit is explicit.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/arm/raspi.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/hw/arm/raspi.c b/hw/arm/raspi.c
> index 74c062d05e..615d755879 100644
> --- a/hw/arm/raspi.c
> +++ b/hw/arm/raspi.c
> @@ -230,7 +230,7 @@ static void raspi2_machine_init(MachineClass *mc)
>      mc->max_cpus =3D BCM283X_NCPUS;
>      mc->min_cpus =3D BCM283X_NCPUS;
>      mc->default_cpus =3D BCM283X_NCPUS;
> -    mc->default_ram_size =3D 1024 * 1024 * 1024;
> +    mc->default_ram_size =3D 1 * GiB;
>      mc->ignore_memory_transaction_failures =3D true;
>  };
>  DEFINE_MACHINE("raspi2", raspi2_machine_init)
> @@ -252,7 +252,7 @@ static void raspi3_machine_init(MachineClass *mc)
>      mc->max_cpus =3D BCM283X_NCPUS;
>      mc->min_cpus =3D BCM283X_NCPUS;
>      mc->default_cpus =3D BCM283X_NCPUS;
> -    mc->default_ram_size =3D 1024 * 1024 * 1024;
> +    mc->default_ram_size =3D 1 * GiB;
>  }
>  DEFINE_MACHINE("raspi3", raspi3_machine_init)
>  #endif
> --
> 2.20.1
>
>
