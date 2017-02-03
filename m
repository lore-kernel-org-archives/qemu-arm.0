Received: by 10.25.77.65 with SMTP id a62csp559449lfb;
        Fri, 3 Feb 2017 03:15:35 -0800 (PST)
X-Received: by 10.28.46.74 with SMTP id u71mr875953wmu.136.1486120535761;
        Fri, 03 Feb 2017 03:15:35 -0800 (PST)
Return-Path: <peter.maydell@linaro.org>
Received: from mail-wm0-x22e.google.com (mail-wm0-x22e.google.com. [2a00:1450:400c:c09::22e])
        by mx.google.com with ESMTPS id l66si1865517wma.43.2017.02.03.03.15.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 03 Feb 2017 03:15:35 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 2a00:1450:400c:c09::22e as permitted sender) client-ip=2a00:1450:400c:c09::22e;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 2a00:1450:400c:c09::22e as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: by mail-wm0-x22e.google.com with SMTP id r141so22536554wmg.1
        for <alex.bennee@linaro.org>; Fri, 03 Feb 2017 03:15:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=iCArxDJfN8kwhn49L0bm77/SjHuprn18GyyLAM3y5Hc=;
        b=f5j+XzHRJjLaJnEgoEsYJ9SHVdOJv20U9/Vn2KtGivgC6R9TlREtbA6Qn3KPOsmoII
         Dl1V2rOYPNqZ8NUq1TgR3QO6JCBOqmsYsFbX6e9CMEBRKQqXn2exuy8FNbKJEMFe1tSw
         x19KDt09HhY/6Gtn3FbqFbkJ8tUM8tAaRPuoU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=iCArxDJfN8kwhn49L0bm77/SjHuprn18GyyLAM3y5Hc=;
        b=cMcEZnfKdRlOfVQmyOEoYItyxWz9WuIpdskVO7for0yEs/fDLusHA1EgHEuPpbv9QS
         MPzu+JEkI83iXGJ7i0GL7OsIxrrbckl5I3GzwQvO0bfOjwi3y7opIsntNdDxsD4bZPgD
         L5WwDfLlrOqN84OrHb7oxuT3degQuQjjlumcUpNjlheaGwoYHVesIL9Pv1/SV67pRIXj
         6YVfZ/XxezshT8xT2vb3fF1VYZLkTUPSfEkPXVNgjUj9h/McxYnJ4NgsGWjV1oDapqx1
         nHhtaAd/KOaRHJu973SC18CSKk4ZlhQPAEn4J1P/hGmwIMYD7gER8A0D+UY68JQNvXYh
         L4Sw==
X-Gm-Message-State: AMke39nSu7ico0Y2/miIDJEIYraZgxQdQpwuP+QhjSbN6tyyXStuBgF/+snlV9uVtNZ4AYrKzsxEugFZAyo6pnhFd/M=
X-Received: by 10.28.189.135 with SMTP id n129mr884076wmf.92.1486120535284;
 Fri, 03 Feb 2017 03:15:35 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.145.69 with HTTP; Fri, 3 Feb 2017 03:15:14 -0800 (PST)
In-Reply-To: <20170201150553.9381-21-alex.bennee@linaro.org>
References: <20170201150553.9381-1-alex.bennee@linaro.org> <20170201150553.9381-21-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 3 Feb 2017 11:15:14 +0000
Message-ID: <CAFEAcA82=VUZF5DHBe+bEu0GBeM-Yg50TRkSHmDsgdAJ_YdgBw@mail.gmail.com>
Subject: Re: [PATCH v9 20/25] target-arm/powerctl: defer cpu reset work to CPU context
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: MTTCG Devel <mttcg@listserver.greensocs.com>, QEMU Developers <qemu-devel@nongnu.org>, 
	=?UTF-8?B?S09OUkFEIEZyw6lkw6lyaWM=?= <fred.konrad@greensocs.com>, 
	Alvise Rigo <a.rigo@virtualopensystems.com>, "Emilio G. Cota" <cota@braap.org>, 
	Pranith Kumar <bobby.prani@gmail.com>, Nikunj A Dadhania <nikunj@linux.vnet.ibm.com>, 
	Mark Burton <mark.burton@greensocs.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Jan Kiszka <jan.kiszka@siemens.com>, Fedorov Sergey <serge.fdrv@gmail.com>, 
	Richard Henderson <rth@twiddle.net>, Bamvor Zhang Jian <bamvor.zhangjian@linaro.org>, 
	"open list:ARM" <qemu-arm@nongnu.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TUID: omiroe2i/+Vx

On 1 February 2017 at 15:05, Alex Benn=C3=A9e <alex.bennee@linaro.org> wrot=
e:
> When switching a new vCPU on we want to complete a bunch of the setup
> work before we start scheduling the vCPU thread. To do this cleanly we
> defer vCPU setup to async work which will run the vCPUs execution
> context as the thread is woken up. The scheduling of the work will kick
> the vCPU awake.
>
> This avoids potential races in MTTCG system emulation.
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Reviewed-by: Richard Henderson <rth@twiddle.net>

Can we now have races between arm_set_cpu_on() and
arm_set_cpu_off() ? It's not clear to me what prevents that.

With this change our PSCI CPU_ON is no longer effectively
atomic, which means we need to think about the races
between PSCI CPU_ON and CPU_OFF, and the fact that the
core might be in what the PSCI spec section 6.6
calls an ON_PENDING state (ie CPU_ON has been called
for it but it hasn't actually booted yet).

thanks
-- PMM
