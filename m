Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp4853131wrt;
        Tue, 2 Oct 2018 02:57:05 -0700 (PDT)
X-Received: by 2002:a9d:bad:: with SMTP id 42-v6mr8221709oth.146.1538474225645;
        Tue, 02 Oct 2018 02:57:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1538474225; cv=none;
        d=google.com; s=arc-20160816;
        b=t36mNmZaDVzL3Bc2lQvRkbem46iWWQxnk7LE+jLwK1/s5j6imDZG2M83QGPzjiUGa6
         eh2cIR39wZU1/LXyWzvw/UPThI95JE4NDvGI9fYMGV9PFK4ad977debSs2DapkmJH/y9
         xIhIP4MeVosvkGMGoIkocVdyGgRoeZ3MUp6VUkW4i7zSHH0s6QX+CtlMZ/RhhKccLjt3
         er0hA0yyRs5Ief6Hq1RG+WmI94fQ7kgjhANiY7WpwC0BvdaM0yvdnrT1Ko6ddciNQYL1
         lVKTA2TGKa16h29SNLtAphx9pFn5UDILnatDVoFhZkjg6soK4uQa9KPJlAhW6GCNHaQZ
         5YRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature;
        bh=tWBMgahngfp6BU8moLOfE9nBEfccW+ryoRZDKyNoBqA=;
        b=X702wLg4c25rzIyTZDYvXeyq448/rYzz2qcaAWM9g3MvbHe2+RqgUfOr4zp3d4gQ8m
         L2HyRsB+wwVYDHQ3TnzpHmRAsOuOQ83tP96kvUltFJdgPXqr1e503wMOBmuFqpIeDiqk
         vzltWxPQf4xKGG9CEs+rCU+y9Lp8HPIpSzdeg1Vxwg2RVG7xyHiAKXTHidEgOEkdJ8++
         iEMXa9t9/3isp1fnp9xu4t0G+GR128L5YV+U4JMiVmQj/8EqUdtu6rvAfmHmOSLCABDo
         DQXD1B3nYSohQtxAEdCPKekewdWCnTRnhWUb0XtyQvUfHf1bqYpUevVSuFboahmaW9O9
         vJQQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YFtbD8rJ;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id m8-v6sor9613877otf.24.2018.10.02.02.57.05
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 02 Oct 2018 02:57:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YFtbD8rJ;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=tWBMgahngfp6BU8moLOfE9nBEfccW+ryoRZDKyNoBqA=;
        b=YFtbD8rJSWeff+txdaqB0S2sjHDKW4bY8jifBLWZK3mRO+4eQ5ROEshDZWKWaZxXuK
         Tz6otRYB+7zYQapWe2fGQdz2E43D1PQYGYK3+P/GCV/DIJG/qyW++tdT5A8ItxC5/0lH
         ooEBLdKMa0gk8yOESqbgod9NQteMn8c0BC2Gs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=tWBMgahngfp6BU8moLOfE9nBEfccW+ryoRZDKyNoBqA=;
        b=FJVlY+Gu8qgEsiE27eivWx2FSBvDRm5PyNiXfx3e9JOp4QRRRwoZfWrwwB16uXdXdz
         g8yXrutW3dm/iycyeBCPC75Z/7yTSIQNT+ND1WUx8r8pHsHXuOIinR5P7Rp2B5nr3SoE
         CeWUifwSNyHQ8lGgta5ZmywtfXe34TsrjuHh7KPxN0Hg0cXlMjN+pCGQ8Z5DL1gqqXfw
         UZ41atj2kxt2z8R+8CoTgaXiEjiBzmq8B+iQxrBhrxOcv/ZS66cU1u9Znraj3cC0zSA2
         ffcgZkNb8L926BZ3Nl1Y/KXdOlV4cZyNX0jqnArd9Pxa7oTIiNiA8QfsXpa4o09S1+rS
         TYPQ==
X-Gm-Message-State: ABuFfoh8S8l0Xj3JwS5PSEIIGirjwj/wxgoVHfsoA0E0PNaQWQtqxeVs
	h22Lyw8rVttzsJ+sOQvm1L6Y3VVomfhutM3CPWRiMRlLz0wfvQ==
X-Google-Smtp-Source: ACcGV62eVyomqoRu5d2KoWCkIbd7AEJBO7NBuhx9d6RerTLcgiCNXr0znGOY+gu7BRX3etbODH22X+DNYWp+Z72S+K0=
X-Received: by 2002:a9d:3c47:: with SMTP id j7-v6mr9373224ote.317.1538474225230;
 Tue, 02 Oct 2018 02:57:05 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:20e3:0:0:0:0:0 with HTTP; Tue, 2 Oct 2018 02:56:44 -0700 (PDT)
In-Reply-To: <20180926112048.17778-4-alex.bennee@linaro.org>
References: <20180926112048.17778-1-alex.bennee@linaro.org> <20180926112048.17778-4-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 2 Oct 2018 10:56:44 +0100
Message-ID: <CAFEAcA9DaiY-fu_P4FkswyxHgPO50W7XvkKWXpV5wLbLyCL2bw@mail.gmail.com>
Subject: Re: [PATCH v1 3/4] target/arm64: kvm debug set target_el when passing
 exception to guest
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>, 
	Omair Javaid <omair.javaid@linaro.org>, Ard Biesheuvel <ard.biesheuvel@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: +dgMho+LKQHo

On 26 September 2018 at 12:20, Alex Benn=C3=A9e <alex.bennee@linaro.org> wr=
ote:
> When we are debugging the guest all exception come our way but might

"exceptions"

> be for the guests own debug exceptions. We use the ->do_interrupt()

"guest's"

> infrastructure to do this however we are missing a full setup of the

"to inject the exception into the guest. However, "

> exception structure causing an assert later down the line.

"structure, "

>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> ---
>  target/arm/kvm64.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
> index 346e1f1a73..9ceff1884c 100644
> --- a/target/arm/kvm64.c
> +++ b/target/arm/kvm64.c
> @@ -984,6 +984,7 @@ bool kvm_arm_handle_debug(CPUState *cs, struct kvm_de=
bug_exit_arch *debug_exit)
>      cs->exception_index =3D EXCP_BKPT;
>      env->exception.syndrome =3D debug_exit->hsr;
>      env->exception.vaddress =3D debug_exit->far;
> +    env->exception.target_el =3D 1;
>      qemu_mutex_lock_iothread();
>      cc->do_interrupt(cs);
>      qemu_mutex_unlock_iothread();
> --
> 2.17.1
>


Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
