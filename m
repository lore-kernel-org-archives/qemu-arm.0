Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp4276959lfa;
        Tue, 27 Oct 2020 16:38:42 -0700 (PDT)
X-Received: by 2002:a05:6402:3045:: with SMTP id bu5mr5011664edb.232.1603841922094;
        Tue, 27 Oct 2020 16:38:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603841922; cv=none;
        d=google.com; s=arc-20160816;
        b=bq/uI7lt/iCVFEbsaF9NW4kkPcwZSRAORmhWzwXiPkbGkDUybwPj5Uwg74u/PeHQLG
         +7+s6L50InRF4dXvvo3JMXwa72mrpX7gvw89dMHtnJFXhc6egNZ0i5vHp8yms9ArGZ4E
         ujENTew2ka5ARqK9fKHlCJ3r8YzVrrD7XkSVazl10EVivTXGawEbL8PmRiazPUGzwHxM
         pjZbC8OvtpDsf6fEdrzzElza97v3hnloR5AJBt8dV5NoE9O7c2nxg/izheOKLBoVPG6a
         bFgaTJk0+ZC8XcPwEaAXn1/oZQB44GMT41SiCKpHW13yf478Ws/EhEnB4RCG8JFdG+8r
         NRBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=5kaHV0Pg1L9fG8vBTEC9pxRQfu8xlom6xDAxH6720ng=;
        b=StURhfLrLIDzP9BzVmuDiysW+0otcpfSMMSr7ENoZTY/FI8PNilgZu+6s5hwKnbmUo
         RAMM6lZno8x3ZzwGOMAAXLxTQRlJ00GOqJA83nV4FbX8+72F/o3PFAtrqBF+c5sEYK+e
         w672eLIpx9DT8illZPDKAw7ZdHaIPNthb6z6swv8HPLJisg/qftSvknS5Dnzp9BZNDu9
         mqOk7DViLxuAu8K4o/DVgFbrNE2AdwuszvoK5mTx911WTIu5UVaO79wmHMPyHekKYD1x
         iRx7B4RoqTaZzj9VqFuMEShdx/eJB0VS5lvT4WiaHSjJHGu23srItyOkpzHVzlHoZVfw
         RwzA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WlZsysPH;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id b21sor2038613eje.48.2020.10.27.16.38.41
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 27 Oct 2020 16:38:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WlZsysPH;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5kaHV0Pg1L9fG8vBTEC9pxRQfu8xlom6xDAxH6720ng=;
        b=WlZsysPHj16bwCqkztRcvGGc6jMIJw3MO65fLLvBLbCYh/Hk+EhPwscEdJh/eLXqXc
         3lYrfDXvfqKT/qM09Pnoxr/xqXW+32sVeHKAPu838TcO9YrUknggoip7paI+kpxi4AUj
         V/GyObWUoygT/G3PFA5iko6gpfokQyXypzZzMiPoAQNi/qNP1CTikx3IEMaJ0elcoYEb
         tshii2Jg58Gfnnts+gaFKv/+q5wkLDTsJjcsTG+T5T3YYFpAzln8mpshqDizQq9SwTIG
         spHq4XZ/xdqfH35O4KCPQWWDzo6XYYsHAoFHnJmKJRJHmvZHUbE6DkXRn5Ii664P5h6N
         8Y7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5kaHV0Pg1L9fG8vBTEC9pxRQfu8xlom6xDAxH6720ng=;
        b=LG6FiyOJE9zijWV5PJ2DSuSjfSwU5HgFN+PMZNYf1lx+LEgkSVRba5PudKELXeHqXq
         FM3JKa4ljzVyLtGnxzgkdDP/ZVIS42dsljCU6z0bA01B6oBwtCl/YFyUMvEYhoW6VsJw
         S/vj7xU8p3aQjop/L49LdRL5eZOF2lEfWMEuEgzM0olpn9FO6Jbej0RC5kJE80ddlu1I
         dNo0dvABuBmciph9x9K0BEypnrWEvAXdwfLx5+LBrL0XQ0vGhtjUmogpo0EKnm9omdx6
         MQGsp6Ua8Bzwv2gQuWcNke1/3hVtSzjCn8OyExkFnwUR94JEa1F6KxsysboaqER/Jlx/
         UyHw==
X-Gm-Message-State: AOAM531bDI4snPImju9vW0gsgmnzEGuC7MAMjzufSVs9qEzjH5SrtOZI
	t6hEppGOYCqv0VE6on4hStAFfIFh7haTOioz7svMkSAZ
X-Google-Smtp-Source: ABdhPJyzZLlzajYITpFAF3sp5wYGumCP2Hqh0Tb1qdy+EaXYWdqgp359J3YfctqxyaJV0ewSlBJ0RSI8XDTigJg+Xxc=
X-Received: by 2002:a17:906:c7d9:: with SMTP id dc25mr4846557ejb.482.1603841921787;
 Tue, 27 Oct 2020 16:38:41 -0700 (PDT)
MIME-Version: 1.0
References: <20201026212853.92880-1-keithp@keithp.com> <20201026212853.92880-2-keithp@keithp.com>
 <CAFEAcA-0_WLMP1Y1sgcu7Ng+0w8Ovt9DVWzYU8ZA_FA2+bwcUw@mail.gmail.com> <87pn53e3ke.fsf@keithp.com>
In-Reply-To: <87pn53e3ke.fsf@keithp.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 27 Oct 2020 23:38:30 +0000
Message-ID: <CAFEAcA8Sha5QYbO25dtzBZHoXUeiGVv8aojPFTMrst8nbVDAdg@mail.gmail.com>
Subject: Re: [PATCH 1/4] semihosting: Move ARM semihosting code to shared directories
To: Keith Packard <keithp@keithp.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Laurent Vivier <laurent@vivier.eu>, qemu-arm <qemu-arm@nongnu.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Alistair Francis <Alistair.Francis@wdc.com>, 
	Sagar Karandikar <sagark@eecs.berkeley.edu>, 
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-TUID: NC4dGz+Dr0ee

On Tue, 27 Oct 2020 at 21:56, Keith Packard <keithp@keithp.com> wrote:
>
> Peter Maydell <peter.maydell@linaro.org> writes:
>
> >> +specific_ss.add(when: 'CONFIG_TCG', if_true: files ('common-semi.c'))
> >
> > I think this adds this file to the compilation for all TCG targets;
> > you only want it for targets which have Arm-semihosting-ABI compatible
> > semihosting. (Various other targets either don't have semihosting
> > or have their own ABI.)
>
> Right. These should have been target-specific source sets so that the
> file was only added to those targets:
>
>         arm_ss.add(when: 'CONFIG_TCG', if_true: files ('common-semi.c'))
>         riscv_ss.add(files('common-semi.c'))
>
> This appears to work in my testing (building arm, risc-v and x86_64
> configs).

I'm not a kconfig expert but it might be preferable to have
a new CONFIG_ for arm-semihosting-ABI which the relevant
targets enable. Somebody else may be able to advise.

thanks
-- PMM
