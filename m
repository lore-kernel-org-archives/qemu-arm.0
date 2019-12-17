Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp6205680lff;
        Tue, 17 Dec 2019 08:02:42 -0800 (PST)
X-Received: by 2002:a50:f391:: with SMTP id g17mr6047508edm.52.1576598562192;
        Tue, 17 Dec 2019 08:02:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1576598562; cv=none;
        d=google.com; s=arc-20160816;
        b=bE84PHkPiv7iPunf1OdAOkbRug2jjsMXAE/IKsAtGjxDLRGvUBUpCxC0gk5+CSwodA
         C1qFLZq/mXeOstdmo8uAmx7S1nkSRJ8608Hvi3B3OcaWmtV4uJfF/IlnlOuntkUiT2QX
         bVzWphS3pUO3as2z+gzqizd25HsCOmPf3tmXvRfds1p771PibzYRaRtbC6m2LG7Kx42c
         l6K2hU03ckGCaf2Jpp3RZgV1Tu+OHzp+tIi4CHjT8OkwbnW3ECeEONlPY5v4nqhS/cPf
         xzNSXA8zZYS2k+bg1DUmZqu4VRHKsZ16S+t2kp9ZH64W1VqGlyBpFRs08dwUtSjqagRJ
         Jc6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mhgCXR0RlBMimws/8kYwml/G5AJF/CxRXmyzmxV/rEo=;
        b=Aj2c2vFoEhUI4UPFx0m1qWbR8w6SqPW5oqZaiazu3jlX2+w3/tHifBmMl4za6NCC++
         s9il9NbeRRqq08wD1d1KcvnyCbuIOIWG354VAGsgEiyuONDxRqGh6DSEWavI5JZTLZB3
         Roey51R48fHPw4VvY6Xol5iAYdGbFs69th68hsXGa5gclnjPYNeAHhph6tC49uskFels
         ZxbYNQ1FMOuOvSUIC8CXveTPjHOkvZrEKTVZkXnCGljMyAJhcWVEFlcdnfKEFAhcT/1g
         R3ritdL2uihd6RKNSkTipJObfKrpa8aGq+7HrMLIpVm99Cp5NnnSueVM7ZSBkxSOgPdb
         CG3g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=miOFCoWA;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id dn15sor10664874edb.19.2019.12.17.08.02.42
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 17 Dec 2019 08:02:42 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=miOFCoWA;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=mhgCXR0RlBMimws/8kYwml/G5AJF/CxRXmyzmxV/rEo=;
        b=miOFCoWACa1t7Ub1bcvz0Ej4/d+taBjjZPa5gSWdGYACB64UtIIBcZ8HsmEhazR7dz
         1YflF0CxhZzTavgbIsjX2XnYddaum3mO+R08PN5Fpd+a53wSlw01FdriBUzuhPDmuptJ
         GKGb4M1cVG/qmrJF7Fq8V9A3nHrZOeJCKcRA3oVKG/1RNs5TEmrLmcXRqqPc+9/lH/hc
         16MF55XHvtVq3PgP38LtuqHLPzw3grO7fk+PybO00zYm4k3SYC2XSD+s2Tw6SrmOLhUO
         AH9e7UH0kQ2YR/pbX2rjOxJKhMLFDw7Kc+263U643KUGPWzME94yTTAUUxT9EM+hDDhI
         t6gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=mhgCXR0RlBMimws/8kYwml/G5AJF/CxRXmyzmxV/rEo=;
        b=amKKBm8icfkap8pfttfspog0ym+aAdh9L4aahLVXkx9wA70N7VqUtFWHvTAA+meeHw
         IOyakD9d+cUJ5XkBRBnT7lFzC7lSDMzG6RuuyGYl28ahGbQ8yEqxxjS18HwvouHTptME
         Fc4PRdV5LMKHE/5KFhN+LqS8yXKdlzNMb6tuyEYoQENB8CD0NVNnauVr+dPZ7PJdw+5d
         WGa6UDJ1fMMMIIskCf+y/h/GYZsigiJNWjqr6RKLiqIF84vZA9RNhSO+ysNWdbHu0JkA
         ya/RgSt8qiJ3QgK40zgXSzfnZWkurmBtTYknu0+nJnWRaz0Ls610p9wNJe/pBmxN6yON
         ylBw==
X-Gm-Message-State: APjAAAV6JrssfNqwL7o+Wzx3ghHekexiCPe1FfCgzB6hFo+4cWsSQQDO
	GnW7XuO+HJeNZDgp+XLOO4moGnYWZjufxGxwoNDumbymCIM=
X-Google-Smtp-Source: APXvYqxBSSOhLFpaeMebz38V3lBaKHQf3pf4H3iwBzUFZPINt86gunvL/UTw+4C6IJE+i946iOVQPJQ/OROSIXwUbug=
X-Received: by 2002:a05:6402:149a:: with SMTP id e26mr6197507edv.198.1576598561770;
 Tue, 17 Dec 2019 08:02:41 -0800 (PST)
MIME-Version: 1.0
References: <20191209134552.27733-1-philmd@redhat.com>
In-Reply-To: <20191209134552.27733-1-philmd@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Date: Tue, 17 Dec 2019 06:02:30 -1000
Message-ID: <CAFXwXrmi=AqO9djosRt7vEGm5XDmnBt7KhHn9AQAWbVPLp+QkA@mail.gmail.com>
Subject: Re: [PATCH] target/arm: Display helpful message when hflags mismatch
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>, Peter Maydell <peter.maydell@linaro.org>, 
	qemu-arm <qemu-arm@nongnu.org>, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: rrqUFhh8zbao

On Mon, 9 Dec 2019 at 03:46, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com=
> wrote:
>
> Instead of crashing in a confuse way, give some hint to the user
> about why we aborted. He might report the issue without having
> to use a debugger.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>  target/arm/helper.c | 18 +++++++++++++++---
>  1 file changed, 15 insertions(+), 3 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
