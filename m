Received: by 2002:a19:e8d:0:0:0:0:0 with SMTP id 135csp2602410lfo;
        Sun, 31 Jan 2021 03:57:16 -0800 (PST)
X-Received: by 2002:a9d:67d5:: with SMTP id c21mr8429237otn.247.1612094236230;
        Sun, 31 Jan 2021 03:57:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1612094236; cv=none;
        d=google.com; s=arc-20160816;
        b=EL6SFIV283SWEZJtuqHuwNmNKa9Cy5R/TraJNxSFPGD4cvF33nt64/q2Agl5+/t2W/
         btMAEOrm8oAjbXqwrXta8qrlpVvm9bFiAKwD0GiSb+9WqvruKp7tg1qENGwQV8Y4Szww
         r7cB47FRmYGVN9+dihBS8fBVXY4duCnafICdHAmTXPc4BExsMFuB3x5NZ/33NmXgNELP
         upqZtIMnznR2Cs0H1QLLodi9WKIiqJ1wAmINWpMGJyUvLFoVug3gQjSGt8/dJUbdUj2a
         NQMMZ462XIHDD/TGtmkgA/CS+jp8jQUcZIbZqg+4YyT+r0rqBH/p4s09p25oRC0Bm4ko
         2hJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version;
        bh=YVkInRJxpduhbRvqa9xcBthpuPzf7AjKpZhjK7Cpckg=;
        b=bO+7hUfiUKUgJtoMyJaUsxjJXC3xG66R01Xbl7D+cpufKKp3+aE4P35DUnTfS4pGhR
         Fu87PXHuj3mm81Z86TErqfj72NUlHClMA0YoXHZ9P0K3fUx9emNmNO1qnHh20HyaKS87
         v21twzt9jPBh7YLA6VrpjGHduuHrEjRtWBzqJ+2zH4yevNYE+TH5nOnmDXcjwzGRMzio
         yFdue1U4aiBXQjtRhaPsOPZGn2u5OnSyGbOKeikSy3RuL6nn6LbLu1ecP0dVsaffql+V
         Irg9app0miRLinQR4Thse0+KFjTTcZoX66ryUD5ob7+xbhoP83IEBzJK/e8G9FJ/N6gQ
         EfEg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id n1sor3564796oie.86.2021.01.31.03.57.16
        (Google Transport Security);
        Sun, 31 Jan 2021 03:57:16 -0800 (PST)
Received-SPF: pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=YVkInRJxpduhbRvqa9xcBthpuPzf7AjKpZhjK7Cpckg=;
        b=fM64sObaBJ+STdi7MLOYGT59LGVrOdlFPiFMi6vSOv0ytE3ux0FNbMq1VZ9KQv7czK
         +Y5csLuGdZj/6dqlPOOCueIozajaq0UmxrW13tyBh4BD9Js3R1fRGVbqmUz2cxPFZgdt
         biks3RO3UvVlt04xOWei4bINeazzFunpArP1RWVQMOa45bbYEwo5UEFhexWww/u/0UIx
         kYU5Zbfk3U3dTzTaXSouwgNseNQRuluWf+jRexQFWcPlWIaVham8WLjU/bEZ3vkua0Oy
         IKrQD9Jc+gkB5FzCXLwz6xWwB0YnfDIQDHue69PVU/ik6xbZi0RM6ywIxYEzl73vDg17
         YCwg==
X-Gm-Message-State: AOAM53175jGVxuXXjvRGxmuHVHqz/USWAzEwQm/SDqeaseQlCu0+mqBM
	uvTOwlcBUPslJVgtvH4Mq4bbUcLj4ExZotslExE=
X-Google-Smtp-Source: ABdhPJzTsVYWTiFYHJJoplW61B8aLyILK891rvibXykh/sCNgQ3gvSZtbxkhWSacPEQCBANMrvfh/48uBylcMZS22go=
X-Received: by 2002:aca:f1d4:: with SMTP id p203mr7974934oih.46.1612094235899;
 Sun, 31 Jan 2021 03:57:15 -0800 (PST)
MIME-Version: 1.0
References: <20210131115022.242570-1-f4bug@amsat.org> <20210131115022.242570-12-f4bug@amsat.org>
In-Reply-To: <20210131115022.242570-12-f4bug@amsat.org>
From: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Date: Sun, 31 Jan 2021 12:57:04 +0100
Message-ID: <CAAdtpL4kPsFE3PuxkdE-Pmc+AqYiXFOEhdBTpvyBckZ1BJMHtQ@mail.gmail.com>
Subject: Re: [PATCH v6 11/11] .travis.yml: Add a KVM-only Aarch64 job
To: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Cc: Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>, 
	Richard Henderson <rth@twiddle.net>, Fam Zheng <fam@euphon.net>, Claudio Fontana <cfontana@suse.de>, 
	Paolo Bonzini <pbonzini@redhat.com>, "open list:Block layer core" <qemu-block@nongnu.org>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	kvm <kvm@vger.kernel.org>, Laurent Vivier <lvivier@redhat.com>, qemu-arm <qemu-arm@nongnu.org>, 
	Richard Henderson <richard.henderson@linaro.org>, John Snow <jsnow@redhat.com>, 
	Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: LC9DRaUSTGDn

On Sun, Jan 31, 2021 at 12:51 PM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.o=
rg> wrote:
>
> From: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
>
> Add a job to build QEMU on Aarch64 with TCG disabled, so
> this configuration won't bitrot over time.
>
> We explicitly modify default-configs/aarch64-softmmu.mak to
> only select the 'virt' and 'SBSA-REF' machines.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
> Job ran for 7 min 30 sec
> https://travis-ci.org/github/philmd/qemu/jobs/731428859

BTW I added this patch for completeness but I couldn't test it again
as I don't have anymore Travis-CI credit. I however tested it on a similar
Ubuntu Aarch64 host.
