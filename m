Received: by 10.25.0.147 with SMTP id 141csp722596lfa;
        Fri, 24 Feb 2017 06:57:32 -0800 (PST)
X-Received: by 10.28.199.206 with SMTP id x197mr2867857wmf.5.1487948252196;
        Fri, 24 Feb 2017 06:57:32 -0800 (PST)
Return-Path: <peter.maydell@linaro.org>
Received: from mail-wr0-x235.google.com (mail-wr0-x235.google.com. [2a00:1450:400c:c0c::235])
        by mx.google.com with ESMTPS id x185si2765416wmd.5.2017.02.24.06.57.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 24 Feb 2017 06:57:32 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 2a00:1450:400c:c0c::235 as permitted sender) client-ip=2a00:1450:400c:c0c::235;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 2a00:1450:400c:c0c::235 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: by mail-wr0-x235.google.com with SMTP id o22so9169202wro.1
        for <alex.bennee@linaro.org>; Fri, 24 Feb 2017 06:57:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=7lGk4KvBczpwSF83K2jEkxF9SNY9IgQdtUtn+XK2eD4=;
        b=GrUj1hJI7imKETd2ANrBPejku8eFKdU4zCRA92GxAL1iFdHkk/kgV2frzpuRnaZIz6
         xSJN4zEWryNFw23JeWcuZRqtgAp6wS0CvrJeMwOGjf2zKbu4qGBuXXuDu5gQ6IhaUcPv
         mVpX43X7SzrQoaMdqmr94EtNrAH4YBWM0S/Sw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=7lGk4KvBczpwSF83K2jEkxF9SNY9IgQdtUtn+XK2eD4=;
        b=JyAbnQqFZ/JwuIu8D10HQsOFHXmTU3Y2cP9I5Ap1v9sUXTU2A+epXD+8AhKnh6CmGn
         QZHdb9S8RvtwOnOQGyEh1mzDX/xWcpjCHnfby8YKmFPmqpcGtyouzMHcRV4LHDdjqVG/
         MBPzwvo+8I+B57BD7T9Nq3EvTbZJ2NbqQm1xvDfT5pcfPjld9r9nEXDEMC+rBzaysEYa
         PimE4p128SVNfW8ITNEi0es4OjzWPRvQ1n3vaV9effyv9cqVIe64TUSNJsBrPH16aS0O
         m+PIR+hJIp6+KgbdwrYfXKzBUkZsyBvf3cyQCRXnYlP3+JloMSzfM/ZDXqiRCogDmuKZ
         9kIA==
X-Gm-Message-State: AMke39l/sl5PX2qNjlhcm+gI2tiph0148pFQEn9elvp5Irnt21zZQFueiJnkmGbl6aWtlWCh61Yx0AoDDNW/6+tpGhE=
X-Received: by 10.223.152.241 with SMTP id w104mr3251555wrb.151.1487948251686;
 Fri, 24 Feb 2017 06:57:31 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.145.69 with HTTP; Fri, 24 Feb 2017 06:57:10 -0800 (PST)
In-Reply-To: <87shn3lkj3.fsf@linaro.org>
References: <1487262963-11519-1-git-send-email-peter.maydell@linaro.org>
 <CAFEAcA-MMw0_ombzTD+kQYpeNKywtcKY2UczcpR-hFDwGZhZJw@mail.gmail.com>
 <87wpcflmmb.fsf@linaro.org> <CAFEAcA-OhSMFKgRYsCWUrb6OBxxrWokkkpJyioveEur-p4-g2A@mail.gmail.com>
 <87shn3lkj3.fsf@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 24 Feb 2017 14:57:10 +0000
Message-ID: <CAFEAcA-e5s6Tru_Kfba9hQHL827r2N5jyBvbpwbro7fHX2m1KA@mail.gmail.com>
Subject: Re: [Qemu-arm] [PATCH v2 00/13] Rewrite NVIC to not depend on the GIC
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>, 
	"patches@linaro.org" <patches@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TUID: 6WrGj/eyadtP

On 24 February 2017 at 14:40, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
> The tests currently fail to build:
>
> /usr/bin/arm-none-eabi-objcopy -S -O binary test6-kern.elf test6-kern.bin
> test7.c: In function 'usage':
> test7.c:58:9: error: format '%x' expects argument of type 'unsigned int',=
 but argument 2 has type 'uint32_t' [-Werror=3Dformat=3D]
>          testDiag("Ignoring bogus LR %x, doing return to handler", old_lr=
);
>          ^
> test7.c:76:9: error: format '%x' expects argument of type 'unsigned int',=
 but argument 2 has type 'uint32_t' [-Werror=3Dformat=3D]
>          testDiag("Ignoring bogus LR %x, doing return to thread", old_lr)=
;
>          ^
> test7.c: In function 'svc':
> test7.c:105:9: error: format '%x' expects argument of type 'unsigned int'=
, but argument 2 has type 'uint32_t' [-Werror=3Dformat=3D]
>          testDiag("New xPSR %x", sframe[7]);
>          ^
> test7.c:109:9: error: format '%x' expects argument of type 'unsigned int'=
, but argument 2 has type 'uint32_t' [-Werror=3Dformat=3D]
>          testDiag("old xPSR %x", sframe[7]);
>          ^
> test7.c:116:9: error: format '%x' expects argument of type 'unsigned int'=
, but argument 2 has type 'uint32_t' [-Werror=3Dformat=3D]
>          testDiag("In SVC handler (direct call from main with LR %x)", ol=
d_lr);
>          ^
> /usr/bin/arm-none-eabi-objcopy -S -O binary test8-kern.elf test8-kern.bin
> /usr/bin/arm-none-eabi-objcopy -S -O binary test9-kern.elf test9-kern.bin
> /usr/bin/arm-none-eabi-objcopy -S -O binary test10-kern.elf test10-kern.b=
in
> /usr/bin/arm-none-eabi-objcopy -S -O binary test11-kern.elf test11-kern.b=
in
> /usr/bin/arm-none-eabi-objcopy -S -O binary test13-kern.elf test13-kern.b=
in
> /usr/bin/arm-none-eabi-objcopy -S -O binary test14-kern.elf test14-kern.b=
in
> cc1: all warnings being treated as errors
> Makefile:49: recipe for target 'test7.o' failed
> make: *** [test7.o] Error 1
> make: Target 'all' not remade because of errors.
>
> I suspect its the same thing as I came across with kvm-unit-tests that
> compilers targeting the same abi can still disagree about sizes:
>
>   https://git.kernel.org/cgit/virt/kvm/kvm-unit-tests.git/commit/?id=3D52=
9046c397059b8c5ef4dc5fb3c258d86fafb126

Could be. I use arm-linux-gnueabihf-gcc to build. If you use
PRIx32 does it build OK?

thanks
-- PMM
