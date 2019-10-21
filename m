Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp4743412wrm;
        Mon, 21 Oct 2019 08:43:34 -0700 (PDT)
X-Received: by 2002:aca:ed08:: with SMTP id l8mr18597086oih.151.1571672614382;
        Mon, 21 Oct 2019 08:43:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571672614; cv=none;
        d=google.com; s=arc-20160816;
        b=pfgV/6cQyDbZzWozlCzbmeVBSg1Wapx8rvTSEKpaSgNDPOxLa6dC3emn5mHZ40PVPD
         la1tbN3DAJU+lZO46EKlwq3eiLK4FaVDfwNVX0/e09oQlEmPN9cmmWHovI6ZV57lxlFh
         j5NijG2sIbyITqD+/CpmzjRjfD1IdCBMYtDHNrZ1pZfemTGRpvzhF1FGjWyajJjzx3jV
         O8rQIx0ouQwfm5euI2jnMeoyahwM1Qb9FF7lCbRZ0CwEqftPIG+tq3z55pfeJO2L0uBD
         R1O+JtFwcL1oMSMUhwuePJGdShLxX7igWZW3k0iPB5RlE/fwjQsOTLbJch0ygcQK5l+t
         TekQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=n5V0hkpRRSO03mPjVUoJC+HUPW/i9CGi8Wcaic5CS9s=;
        b=XIJIwYHo9f169XzSyQfGRsNEcziJl+mLtzIetDv4/LQupWoUpWk/1doC1N5CBEg0tI
         OAYxxs9+59iQMzUDMzXE38sMISRYD/nGqEIGsKZ/hHGbaUl20zmECFUsKccCnNNtbpHX
         NPSDk6f9fJaC8nZxsrN5w+jI9yPGTmww0tcwdbjKPFaHMM3HWQFn0PyJUIO29fYowdBv
         c3kTNJenXkpjjSj9wuvPGCF6ecEGjOWup/OCOHmfS0P6TXSNYZa9gQdZxQxsOYPPAr3v
         SXGyWwVONT0zlGJqjB9c0FMwbaxc5atDvfVTKdi4hVesRRrxq4glyVC9XnZNmx9I3Wok
         zLGg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=y3ycSaeU;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id 35sor7294150otb.123.2019.10.21.08.43.34
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 21 Oct 2019 08:43:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=y3ycSaeU;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=n5V0hkpRRSO03mPjVUoJC+HUPW/i9CGi8Wcaic5CS9s=;
        b=y3ycSaeU9hLQUDSOqfPcSVuTcC3tZLxwAnXan7/Z4WwvjuRwnBKWf0dR9IuuOncyTT
         v4mR3m/y36p2fCa/Pob/NErtXLcnbF/VpA2RK/S87ixJb5q6KiPw9hbzuQjLzYcNLPOs
         2jZ3RpG/ebDG4P3qlJ0YZtcrMszmOfGR7Yt37+/Ooi/yP0rJMPGyfnM+Yywt/SvOpqWD
         VzIDx8z6qWNpCTOxp8TyU0hcoRJcuq1GaDWMKJDonR2q8CpfkjSS+RymG9e14E2X6NyZ
         HQLlpqg3hGk1aWnfWbn27z9pGt/pOMLOtwrLVshRENPQreTJCodZ7vxWbUl9h7AW70dd
         UZrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=n5V0hkpRRSO03mPjVUoJC+HUPW/i9CGi8Wcaic5CS9s=;
        b=lLaUSwoJkz7olYhwcFQkeeVqLkrWJaaOoCD62jAPVxhmaCdlEiIeIH9fW1EPOK8cvr
         6JFbIa3pYpeHCpmk8UZlEvjxAmweq1q3jYQCHzNvfKLzWyYLLJ63np5EfdFvniQkMYSJ
         saWxOmDNjCrIFkjrtjXvB3B06B0XgJd0is3pMihH5bz+yzzwJP4eysc/6XnVOhPgSX4q
         VHiW4TtUXGr+2Mcy5L3ns7Q2tMYKfl0xtj4nKvem7u551z8Zc2AAMo2flvwJxzHrab+A
         CkM4dXGjSuAWFGZNXI2Fa0ELeWR/hzMfduG0ZViW1zdaWRPdDVY3tDOOoro1QtD/oikz
         vP5A==
X-Gm-Message-State: APjAAAVv/wg4ZINVxdrOh26rBtRnDMtYPktcDfMC9vdGaT0SJIYG9f6+
	feezp4gC73WZzMhu8kf4SZ57TDHh8BdbXSn2Mbe3JMto
X-Google-Smtp-Source: APXvYqzzqZ9dvD68QhKD9277TmjoeWVcAulWTrPqcukzfuGA/sSnnECf7fbi3BnO00NOhPuZUS7h1hEgoD80GIN+t2c=
X-Received: by 2002:a05:6830:4c1:: with SMTP id s1mr19819053otd.232.1571672613897;
 Mon, 21 Oct 2019 08:43:33 -0700 (PDT)
MIME-Version: 1.0
References: <20191016085408.24360-1-drjones@redhat.com> <CAFEAcA8pV5batrPk+J6RLU2rv9SNAmL8JS9Kd9tWP3pD-m29eA@mail.gmail.com>
 <3f54f759-9d6d-bf04-85aa-59c1cac31044@redhat.com> <20191021142336.e4xekqlmqv5txu5w@kamzik.brq.redhat.com>
In-Reply-To: <20191021142336.e4xekqlmqv5txu5w@kamzik.brq.redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 21 Oct 2019 16:43:22 +0100
Message-ID: <CAFEAcA-bezS5tSVB+N223+N+xoYYYHuSJmDTaRCJgO+4Y=VjdQ@mail.gmail.com>
Subject: Re: [PATCH v6 0/9] target/arm/kvm: enable SVE in guests
To: Andrew Jones <drjones@redhat.com>
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>, 
	Richard Henderson <richard.henderson@linaro.org>, QEMU Developers <qemu-devel@nongnu.org>, 
	Markus Armbruster <armbru@redhat.com>, Eric Auger <eric.auger@redhat.com>, 
	qemu-arm <qemu-arm@nongnu.org>, Igor Mammedov <imammedo@redhat.com>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Dave P Martin <Dave.Martin@arm.com>
Content-Type: text/plain; charset="UTF-8"
X-TUID: qq8qIrGhLeP1

On Mon, 21 Oct 2019 at 15:23, Andrew Jones <drjones@redhat.com> wrote:
> Peter, would you mind running your test on the kvm32 machine with this
> change before I send a v7?

Still fails:

pm215@pm-ct:~/qemu/build/arm$
QTEST_QEMU_BINARY=arm-softmmu/qemu-system-arm tests/arm-cpu-features
/arm/arm/query-cpu-model-expansion: OK
/arm/arm/kvm/query-cpu-model-expansion: **
ERROR:/home/pm215/qemu/tests/arm-cpu-features.c:498:test_query_cpu_model_expansion_kvm:
assertion failed: (resp_has_props(_resp))
Aborted

This is asserting on the line:
498             assert_has_not_feature(qts, "host", "sve");

thanks
-- PMM
